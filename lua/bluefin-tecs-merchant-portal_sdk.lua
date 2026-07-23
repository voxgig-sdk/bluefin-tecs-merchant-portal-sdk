-- BluefinTecsMerchantPortal SDK

local vs = require("utility.struct.struct")
local Utility = require("core.utility_type")
local Spec = require("core.spec")
local helpers = require("core.helpers")

-- Load utility registration (populates Utility._registrar)
require("utility.register")

-- Typed-model annotations (LuaLS ---@class); empty at runtime.
require("bluefin-tecs-merchant-portal_types")

-- Load features
local BaseFeature = require("feature.base_feature")
local features_factory = require("features")


local BluefinTecsMerchantPortalSDK = {}
BluefinTecsMerchantPortalSDK.__index = BluefinTecsMerchantPortalSDK


local function _make_feature(name)
  local factory = features_factory[name]
  if factory ~= nil then
    return factory()
  end
  return features_factory.base()
end

BluefinTecsMerchantPortalSDK._make_feature = _make_feature


function BluefinTecsMerchantPortalSDK.new(options)
  local self = setmetatable({}, BluefinTecsMerchantPortalSDK)
  self.mode = "live"
  self.features = {}
  self.options = nil

  local utility = Utility.new()
  self._utility = utility

  local config = require("config")()

  self._rootctx = utility.make_context({
    client = self,
    utility = utility,
    config = config,
    options = options or {},
    shared = {},
  }, nil)

  self.options = utility.make_options(self._rootctx)

  if vs.getpath(self.options, "feature.test.active") == true then
    self.mode = "test"
  end

  self._rootctx.options = self.options

  -- Add features in the resolved order (make_options puts an explicit list
  -- order first, else defaults to test-first). Ordering matters: the `test`
  -- feature installs the base mock transport and the transport features
  -- (retry/cache/netsim/proxy/ratelimit) wrap whatever is current, so `test`
  -- must be added before them to sit at the base of the chain.
  local feature_opts = helpers.to_map(vs.getprop(self.options, "feature"))
  if feature_opts ~= nil then
    local featureorder = vs.getpath(self.options, "__derived__.featureorder")
    if type(featureorder) == "table" then
      for _, fname in ipairs(featureorder) do
        local fopts = helpers.to_map(feature_opts[fname])
        if fopts ~= nil and fopts["active"] == true then
          utility.feature_add(self._rootctx, _make_feature(fname))
        end
      end
    end
  end

  -- Add extension features.
  local extend = vs.getprop(self.options, "extend")
  if type(extend) == "table" then
    for _, f in ipairs(extend) do
      if type(f) == "table" and type(f.get_name) == "function" then
        utility.feature_add(self._rootctx, f)
      end
    end
  end

  -- Initialize features.
  for _, f in ipairs(self.features) do
    utility.feature_init(self._rootctx, f)
  end

  utility.feature_hook(self._rootctx, "PostConstruct")

    -- feature: test


  return self
end


function BluefinTecsMerchantPortalSDK:options_map()
  local out = vs.clone(self.options)
  if type(out) == "table" then
    return out
  end
  return {}
end


function BluefinTecsMerchantPortalSDK:get_utility()
  return Utility.copy(self._utility)
end


function BluefinTecsMerchantPortalSDK:get_root_ctx()
  return self._rootctx
end


function BluefinTecsMerchantPortalSDK:prepare(fetchargs)
  local utility = self._utility

  fetchargs = fetchargs or {}

  local ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl")) or {}

  local ctx = utility.make_context({
    opname = "prepare",
    ctrl = ctrl,
  }, self._rootctx)

  local options = self.options

  local path = vs.getprop(fetchargs, "path") or ""
  if type(path) ~= "string" then path = "" end

  local method = vs.getprop(fetchargs, "method") or "GET"
  if type(method) ~= "string" then method = "GET" end

  local params = helpers.to_map(vs.getprop(fetchargs, "params")) or {}
  local query = helpers.to_map(vs.getprop(fetchargs, "query")) or {}

  local headers = utility.prepare_headers(ctx)

  local base = vs.getprop(options, "base") or ""
  if type(base) ~= "string" then base = "" end
  local prefix = vs.getprop(options, "prefix") or ""
  if type(prefix) ~= "string" then prefix = "" end
  local suffix = vs.getprop(options, "suffix") or ""
  if type(suffix) ~= "string" then suffix = "" end

  ctx.spec = Spec.new({
    base = base,
    prefix = prefix,
    suffix = suffix,
    path = path,
    method = method,
    params = params,
    query = query,
    headers = headers,
    body = vs.getprop(fetchargs, "body"),
    step = "start",
  })

  -- Merge user-provided headers.
  local uh = vs.getprop(fetchargs, "headers")
  if type(uh) == "table" then
    for k, v in pairs(uh) do
      ctx.spec.headers[k] = v
    end
  end

  local _, err = utility.prepare_auth(ctx)
  if err ~= nil then
    return nil, err
  end

  return utility.make_fetch_def(ctx)
end


function BluefinTecsMerchantPortalSDK:direct(fetchargs)
  local utility = self._utility

  local fetchdef, err = self:prepare(fetchargs)
  if err ~= nil then
    return { ok = false, err = err }, nil
  end

  fetchargs = fetchargs or {}
  local ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl")) or {}

  local ctx = utility.make_context({
    opname = "direct",
    ctrl = ctrl,
  }, self._rootctx)

  local url = fetchdef["url"] or ""
  local fetched, fetch_err = utility.fetcher(ctx, url, fetchdef)

  if fetch_err ~= nil then
    return { ok = false, err = fetch_err }, nil
  end

  if fetched == nil then
    return {
      ok = false,
      err = ctx:make_error("direct_no_response", "response: undefined"),
    }, nil
  end

  if type(fetched) == "table" then
    local status = helpers.to_int(vs.getprop(fetched, "status"))
    local headers = vs.getprop(fetched, "headers") or {}

    -- No-body responses (204, 304) and explicit zero content-length
    -- must skip JSON parsing — calling json() on an empty body errors.
    local content_length = nil
    if type(headers) == "table" then
      content_length = headers["content-length"]
    end
    local no_body = status == 204 or status == 304 or tostring(content_length) == "0"

    local json_data = nil
    if not no_body then
      local jf = vs.getprop(fetched, "json")
      if type(jf) == "function" then
        local ok, result = pcall(jf)
        if ok then
          json_data = result
        end
        -- Non-JSON body: json_data stays nil, status/headers preserved.
      end
    end

    return {
      ok = status >= 200 and status < 300,
      status = status,
      headers = headers,
      data = json_data,
    }, nil
  end

  return {
    ok = false,
    err = ctx:make_error("direct_invalid", "invalid response type"),
  }, nil
end



-- Idiomatic facade: client:MerchantPortalApiController():list() / client:MerchantPortalApiController():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:MerchantPortalApiController(data)
  local EntityMod = require("entity.merchant_portal_api_controller_entity")
  if data == nil then
    if self._merchant_portal_api_controller == nil then
      self._merchant_portal_api_controller = EntityMod.new(self, nil)
    end
    return self._merchant_portal_api_controller
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:MerchantPortalCommonController():list() / client:MerchantPortalCommonController():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:MerchantPortalCommonController(data)
  local EntityMod = require("entity.merchant_portal_common_controller_entity")
  if data == nil then
    if self._merchant_portal_common_controller == nil then
      self._merchant_portal_common_controller = EntityMod.new(self, nil)
    end
    return self._merchant_portal_common_controller
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:MerchantPortalPamContractController():list() / client:MerchantPortalPamContractController():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:MerchantPortalPamContractController(data)
  local EntityMod = require("entity.merchant_portal_pam_contract_controller_entity")
  if data == nil then
    if self._merchant_portal_pam_contract_controller == nil then
      self._merchant_portal_pam_contract_controller = EntityMod.new(self, nil)
    end
    return self._merchant_portal_pam_contract_controller
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:MerchantPortalPamDocumentController():list() / client:MerchantPortalPamDocumentController():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:MerchantPortalPamDocumentController(data)
  local EntityMod = require("entity.merchant_portal_pam_document_controller_entity")
  if data == nil then
    if self._merchant_portal_pam_document_controller == nil then
      self._merchant_portal_pam_document_controller = EntityMod.new(self, nil)
    end
    return self._merchant_portal_pam_document_controller
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:MerchantPortalPamFormController():list() / client:MerchantPortalPamFormController():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:MerchantPortalPamFormController(data)
  local EntityMod = require("entity.merchant_portal_pam_form_controller_entity")
  if data == nil then
    if self._merchant_portal_pam_form_controller == nil then
      self._merchant_portal_pam_form_controller = EntityMod.new(self, nil)
    end
    return self._merchant_portal_pam_form_controller
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:MerchantPortalPamMandatorController():list() / client:MerchantPortalPamMandatorController():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:MerchantPortalPamMandatorController(data)
  local EntityMod = require("entity.merchant_portal_pam_mandator_controller_entity")
  if data == nil then
    if self._merchant_portal_pam_mandator_controller == nil then
      self._merchant_portal_pam_mandator_controller = EntityMod.new(self, nil)
    end
    return self._merchant_portal_pam_mandator_controller
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:MerchantPortalPamMerchantController():list() / client:MerchantPortalPamMerchantController():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:MerchantPortalPamMerchantController(data)
  local EntityMod = require("entity.merchant_portal_pam_merchant_controller_entity")
  if data == nil then
    if self._merchant_portal_pam_merchant_controller == nil then
      self._merchant_portal_pam_merchant_controller = EntityMod.new(self, nil)
    end
    return self._merchant_portal_pam_merchant_controller
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:MerchantPortalPamPackageController():list() / client:MerchantPortalPamPackageController():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:MerchantPortalPamPackageController(data)
  local EntityMod = require("entity.merchant_portal_pam_package_controller_entity")
  if data == nil then
    if self._merchant_portal_pam_package_controller == nil then
      self._merchant_portal_pam_package_controller = EntityMod.new(self, nil)
    end
    return self._merchant_portal_pam_package_controller
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:MerchantPortalPamProductController():list() / client:MerchantPortalPamProductController():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:MerchantPortalPamProductController(data)
  local EntityMod = require("entity.merchant_portal_pam_product_controller_entity")
  if data == nil then
    if self._merchant_portal_pam_product_controller == nil then
      self._merchant_portal_pam_product_controller = EntityMod.new(self, nil)
    end
    return self._merchant_portal_pam_product_controller
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:OutputAddProduct():list() / client:OutputAddProduct():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:OutputAddProduct(data)
  local EntityMod = require("entity.output_add_product_entity")
  if data == nil then
    if self._output_add_product == nil then
      self._output_add_product = EntityMod.new(self, nil)
    end
    return self._output_add_product
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:OutputCreateProduct():list() / client:OutputCreateProduct():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:OutputCreateProduct(data)
  local EntityMod = require("entity.output_create_product_entity")
  if data == nil then
    if self._output_create_product == nil then
      self._output_create_product = EntityMod.new(self, nil)
    end
    return self._output_create_product
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:OutputDetail():list() / client:OutputDetail():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:OutputDetail(data)
  local EntityMod = require("entity.output_detail_entity")
  if data == nil then
    if self._output_detail == nil then
      self._output_detail = EntityMod.new(self, nil)
    end
    return self._output_detail
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:OutputList():list() / client:OutputList():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:OutputList(data)
  local EntityMod = require("entity.output_list_entity")
  if data == nil then
    if self._output_list == nil then
      self._output_list = EntityMod.new(self, nil)
    end
    return self._output_list
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:OutputMessage():list() / client:OutputMessage():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:OutputMessage(data)
  local EntityMod = require("entity.output_message_entity")
  if data == nil then
    if self._output_message == nil then
      self._output_message = EntityMod.new(self, nil)
    end
    return self._output_message
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:OutputMoveTid():list() / client:OutputMoveTid():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:OutputMoveTid(data)
  local EntityMod = require("entity.output_move_tid_entity")
  if data == nil then
    if self._output_move_tid == nil then
      self._output_move_tid = EntityMod.new(self, nil)
    end
    return self._output_move_tid
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:OutputRemoveProduct():list() / client:OutputRemoveProduct():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:OutputRemoveProduct(data)
  local EntityMod = require("entity.output_remove_product_entity")
  if data == nil then
    if self._output_remove_product == nil then
      self._output_remove_product = EntityMod.new(self, nil)
    end
    return self._output_remove_product
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:OutputStart():list() / client:OutputStart():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:OutputStart(data)
  local EntityMod = require("entity.output_start_entity")
  if data == nil then
    if self._output_start == nil then
      self._output_start = EntityMod.new(self, nil)
    end
    return self._output_start
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:OutputStatus():list() / client:OutputStatus():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:OutputStatus(data)
  local EntityMod = require("entity.output_status_entity")
  if data == nil then
    if self._output_status == nil then
      self._output_status = EntityMod.new(self, nil)
    end
    return self._output_status
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:OutputUpdateProduct():list() / client:OutputUpdateProduct():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinTecsMerchantPortalSDK:OutputUpdateProduct(data)
  local EntityMod = require("entity.output_update_product_entity")
  if data == nil then
    if self._output_update_product == nil then
      self._output_update_product = EntityMod.new(self, nil)
    end
    return self._output_update_product
  end
  return EntityMod.new(self, data)
end




function BluefinTecsMerchantPortalSDK.test(testopts, sdkopts)
  sdkopts = sdkopts or {}
  sdkopts = vs.clone(sdkopts)
  if type(sdkopts) ~= "table" then
    sdkopts = {}
  end

  testopts = testopts or {}
  testopts = vs.clone(testopts)
  if type(testopts) ~= "table" then
    testopts = {}
  end
  testopts["active"] = true

  vs.setpath(sdkopts, "feature.test", testopts)

  local sdk = BluefinTecsMerchantPortalSDK.new(sdkopts)
  sdk.mode = "test"

  return sdk
end


return BluefinTecsMerchantPortalSDK
