# BluefinTecsMerchantPortal SDK

require_relative 'utility/struct/voxgig_struct'
require_relative 'core/utility_type'
require_relative 'core/spec'
require_relative 'core/helpers'

# Load utility registration
require_relative 'utility/register'

# Load config and features
require_relative 'config'
require_relative 'feature/base_feature'
require_relative 'features'

# Load typed models (Struct value objects).
require_relative 'BluefinTecsMerchantPortal_types'


class BluefinTecsMerchantPortalSDK
  attr_accessor :mode, :features, :options

  def initialize(options = {})
    @mode = "live"
    @features = []
    @options = nil

    utility = BluefinTecsMerchantPortalUtility.new
    @_utility = utility

    config = BluefinTecsMerchantPortalConfig.make_config

    @_rootctx = utility.make_context.call({
      "client" => self,
      "utility" => utility,
      "config" => config,
      "options" => options || {},
      "shared" => {},
    }, nil)

    @options = utility.make_options.call(@_rootctx)

    if VoxgigStruct.getpath(@options, "feature.test.active") == true
      @mode = "test"
    end

    @_rootctx.options = @options

    # Add features in the resolved order (make_options puts an explicit array
    # order first, else defaults to test-first). Ordering matters: the `test`
    # feature installs the base mock transport and the transport features
    # (retry/cache/netsim/proxy/ratelimit) wrap whatever is current, so `test`
    # must be added before them to sit at the base of the chain.
    feature_opts = BluefinTecsMerchantPortalHelpers.to_map(VoxgigStruct.getprop(@options, "feature"))
    if feature_opts
      featureorder = VoxgigStruct.getpath(@options, "__derived__.featureorder")
      if featureorder.is_a?(Array)
        featureorder.each do |fname|
          fopts = BluefinTecsMerchantPortalHelpers.to_map(feature_opts[fname])
          if fopts && fopts["active"] == true
            utility.feature_add.call(@_rootctx, BluefinTecsMerchantPortalFeatures.make_feature(fname))
          end
        end
      end
    end

    # Add extension features.
    extend_val = VoxgigStruct.getprop(@options, "extend")
    if extend_val.is_a?(Array)
      extend_val.each do |f|
        if f.respond_to?(:get_name)
          utility.feature_add.call(@_rootctx, f)
        end
      end
    end

    # Initialize features.
    @features.each do |f|
      utility.feature_init.call(@_rootctx, f)
    end

    utility.feature_hook.call(@_rootctx, "PostConstruct")
  end

  def options_map
    out = VoxgigStruct.clone(@options)
    out.is_a?(Hash) ? out : {}
  end

  def get_utility
    BluefinTecsMerchantPortalUtility.copy(@_utility)
  end

  def get_root_ctx
    @_rootctx
  end

  def prepare(fetchargs = {})
    utility = @_utility
    fetchargs ||= {}

    ctrl = BluefinTecsMerchantPortalHelpers.to_map(VoxgigStruct.getprop(fetchargs, "ctrl")) || {}

    ctx = utility.make_context.call({
      "opname" => "prepare",
      "ctrl" => ctrl,
    }, @_rootctx)

    opts = @options
    path = VoxgigStruct.getprop(fetchargs, "path") || ""
    path = "" unless path.is_a?(String)
    method_val = VoxgigStruct.getprop(fetchargs, "method") || "GET"
    method_val = "GET" unless method_val.is_a?(String)
    params = BluefinTecsMerchantPortalHelpers.to_map(VoxgigStruct.getprop(fetchargs, "params")) || {}
    query = BluefinTecsMerchantPortalHelpers.to_map(VoxgigStruct.getprop(fetchargs, "query")) || {}
    headers = utility.prepare_headers.call(ctx)

    base = VoxgigStruct.getprop(opts, "base") || ""
    base = "" unless base.is_a?(String)
    prefix = VoxgigStruct.getprop(opts, "prefix") || ""
    prefix = "" unless prefix.is_a?(String)
    suffix = VoxgigStruct.getprop(opts, "suffix") || ""
    suffix = "" unless suffix.is_a?(String)

    ctx.spec = BluefinTecsMerchantPortalSpec.new({
      "base" => base, "prefix" => prefix, "suffix" => suffix,
      "path" => path, "method" => method_val,
      "params" => params, "query" => query, "headers" => headers,
      "body" => VoxgigStruct.getprop(fetchargs, "body"),
      "step" => "start",
    })

    # Merge user-provided headers.
    uh = VoxgigStruct.getprop(fetchargs, "headers")
    if uh.is_a?(Hash)
      uh.each { |k, v| ctx.spec.headers[k] = v }
    end

    _, err = utility.prepare_auth.call(ctx)
    raise err if err

    # make_fetch_def returns a (fetchdef, err) tuple; destructure it and
    # return just the fetchdef Hash (raising on error) so callers — including
    # direct(), which indexes fetchdef["url"] — receive a Hash, mirroring the
    # ts/py prepare().
    fetchdef, fd_err = utility.make_fetch_def.call(ctx)
    raise fd_err if fd_err

    fetchdef
  end

  def direct(fetchargs = {})
    utility = @_utility

    # direct() is the raw-HTTP escape hatch: it always returns a result hash
    # ({ "ok" => ..., ... }) and never raises. prepare() raises on error, so
    # trap that and surface it in the hash.
    begin
      fetchdef = prepare(fetchargs)
    rescue BluefinTecsMerchantPortalError => err
      return { "ok" => false, "err" => err }
    end

    fetchargs ||= {}
    ctrl = BluefinTecsMerchantPortalHelpers.to_map(VoxgigStruct.getprop(fetchargs, "ctrl")) || {}

    ctx = utility.make_context.call({
      "opname" => "direct",
      "ctrl" => ctrl,
    }, @_rootctx)

    url = fetchdef["url"] || ""
    fetched, fetch_err = utility.fetcher.call(ctx, url, fetchdef)

    return { "ok" => false, "err" => fetch_err } if fetch_err

    if fetched.nil?
      return {
        "ok" => false,
        "err" => ctx.make_error("direct_no_response", "response: undefined"),
      }
    end

    if fetched.is_a?(Hash)
      status = BluefinTecsMerchantPortalHelpers.to_int(VoxgigStruct.getprop(fetched, "status"))
      headers = VoxgigStruct.getprop(fetched, "headers") || {}

      # No-body responses (204, 304) and explicit zero content-length must
      # skip JSON parsing — calling json() on an empty body errors.
      content_length = headers.is_a?(Hash) ? headers["content-length"] : nil
      no_body = status == 204 || status == 304 || content_length.to_s == "0"

      json_data = nil
      unless no_body
        jf = VoxgigStruct.getprop(fetched, "json")
        if jf.is_a?(Proc)
          begin
            json_data = jf.call
          rescue StandardError
            # Non-JSON body — leave data nil, keep status/headers.
            json_data = nil
          end
        end
      end

      return {
        "ok" => status >= 200 && status < 300,
        "status" => status,
        "headers" => headers,
        "data" => json_data,
      }
    end

    return {
      "ok" => false,
      "err" => ctx.make_error("direct_invalid", "invalid response type"),
    }
  end


  # Canonical facade: client.MerchantPortalApiController.list / client.MerchantPortalApiController.load({ "id" => ... })
  def MerchantPortalApiController(data = nil)
    require_relative 'entity/merchant_portal_api_controller_entity'
    MerchantPortalApiControllerEntity.new(self, data)
  end


  # Canonical facade: client.MerchantPortalCommonController.list / client.MerchantPortalCommonController.load({ "id" => ... })
  def MerchantPortalCommonController(data = nil)
    require_relative 'entity/merchant_portal_common_controller_entity'
    MerchantPortalCommonControllerEntity.new(self, data)
  end


  # Canonical facade: client.MerchantPortalPamContractController.list / client.MerchantPortalPamContractController.load({ "id" => ... })
  def MerchantPortalPamContractController(data = nil)
    require_relative 'entity/merchant_portal_pam_contract_controller_entity'
    MerchantPortalPamContractControllerEntity.new(self, data)
  end


  # Canonical facade: client.MerchantPortalPamDocumentController.list / client.MerchantPortalPamDocumentController.load({ "id" => ... })
  def MerchantPortalPamDocumentController(data = nil)
    require_relative 'entity/merchant_portal_pam_document_controller_entity'
    MerchantPortalPamDocumentControllerEntity.new(self, data)
  end


  # Canonical facade: client.MerchantPortalPamFormController.list / client.MerchantPortalPamFormController.load({ "id" => ... })
  def MerchantPortalPamFormController(data = nil)
    require_relative 'entity/merchant_portal_pam_form_controller_entity'
    MerchantPortalPamFormControllerEntity.new(self, data)
  end


  # Canonical facade: client.MerchantPortalPamMandatorController.list / client.MerchantPortalPamMandatorController.load({ "id" => ... })
  def MerchantPortalPamMandatorController(data = nil)
    require_relative 'entity/merchant_portal_pam_mandator_controller_entity'
    MerchantPortalPamMandatorControllerEntity.new(self, data)
  end


  # Canonical facade: client.MerchantPortalPamMerchantController.list / client.MerchantPortalPamMerchantController.load({ "id" => ... })
  def MerchantPortalPamMerchantController(data = nil)
    require_relative 'entity/merchant_portal_pam_merchant_controller_entity'
    MerchantPortalPamMerchantControllerEntity.new(self, data)
  end


  # Canonical facade: client.MerchantPortalPamPackageController.list / client.MerchantPortalPamPackageController.load({ "id" => ... })
  def MerchantPortalPamPackageController(data = nil)
    require_relative 'entity/merchant_portal_pam_package_controller_entity'
    MerchantPortalPamPackageControllerEntity.new(self, data)
  end


  # Canonical facade: client.MerchantPortalPamProductController.list / client.MerchantPortalPamProductController.load({ "id" => ... })
  def MerchantPortalPamProductController(data = nil)
    require_relative 'entity/merchant_portal_pam_product_controller_entity'
    MerchantPortalPamProductControllerEntity.new(self, data)
  end


  # Canonical facade: client.OutputAddProduct.list / client.OutputAddProduct.load({ "id" => ... })
  def OutputAddProduct(data = nil)
    require_relative 'entity/output_add_product_entity'
    OutputAddProductEntity.new(self, data)
  end


  # Canonical facade: client.OutputCreateProduct.list / client.OutputCreateProduct.load({ "id" => ... })
  def OutputCreateProduct(data = nil)
    require_relative 'entity/output_create_product_entity'
    OutputCreateProductEntity.new(self, data)
  end


  # Canonical facade: client.OutputDetail.list / client.OutputDetail.load({ "id" => ... })
  def OutputDetail(data = nil)
    require_relative 'entity/output_detail_entity'
    OutputDetailEntity.new(self, data)
  end


  # Canonical facade: client.OutputList.list / client.OutputList.load({ "id" => ... })
  def OutputList(data = nil)
    require_relative 'entity/output_list_entity'
    OutputListEntity.new(self, data)
  end


  # Canonical facade: client.OutputMessage.list / client.OutputMessage.load({ "id" => ... })
  def OutputMessage(data = nil)
    require_relative 'entity/output_message_entity'
    OutputMessageEntity.new(self, data)
  end


  # Canonical facade: client.OutputMoveTid.list / client.OutputMoveTid.load({ "id" => ... })
  def OutputMoveTid(data = nil)
    require_relative 'entity/output_move_tid_entity'
    OutputMoveTidEntity.new(self, data)
  end


  # Canonical facade: client.OutputRemoveProduct.list / client.OutputRemoveProduct.load({ "id" => ... })
  def OutputRemoveProduct(data = nil)
    require_relative 'entity/output_remove_product_entity'
    OutputRemoveProductEntity.new(self, data)
  end


  # Canonical facade: client.OutputStart.list / client.OutputStart.load({ "id" => ... })
  def OutputStart(data = nil)
    require_relative 'entity/output_start_entity'
    OutputStartEntity.new(self, data)
  end


  # Canonical facade: client.OutputStatus.list / client.OutputStatus.load({ "id" => ... })
  def OutputStatus(data = nil)
    require_relative 'entity/output_status_entity'
    OutputStatusEntity.new(self, data)
  end


  # Canonical facade: client.OutputUpdateProduct.list / client.OutputUpdateProduct.load({ "id" => ... })
  def OutputUpdateProduct(data = nil)
    require_relative 'entity/output_update_product_entity'
    OutputUpdateProductEntity.new(self, data)
  end



  def self.test(testopts = nil, sdkopts = nil)
    sdkopts = sdkopts || {}
    sdkopts = VoxgigStruct.clone(sdkopts)
    sdkopts = {} unless sdkopts.is_a?(Hash)

    testopts = testopts || {}
    testopts = VoxgigStruct.clone(testopts)
    testopts = {} unless testopts.is_a?(Hash)
    testopts["active"] = true

    VoxgigStruct.setpath(sdkopts, "feature.test", testopts)

    sdk = BluefinTecsMerchantPortalSDK.new(sdkopts)
    sdk.mode = "test"
    sdk
  end
end
