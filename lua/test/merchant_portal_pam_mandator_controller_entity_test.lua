-- MerchantPortalPamMandatorController entity test

local json = require("dkjson")
local vs = require("utility.struct.struct")
local sdk = require("bluefin-tecs-merchant-portal_sdk")
local helpers = require("core.helpers")
local runner = require("test.runner")

local _test_dir = debug.getinfo(1, "S").source:match("^@(.+/)")  or "./"

describe("MerchantPortalPamMandatorControllerEntity", function()
  it("should create instance", function()
    local testsdk = sdk.test(nil, nil)
    local ent = testsdk:MerchantPortalPamMandatorController(nil)
    assert.is_not_nil(ent)
  end)

  it("should run basic flow", function()
    local setup = merchant_portal_pam_mandator_controller_basic_setup(nil)
    -- Per-op sdk-test-control.json skip.
    local _live = setup.live or false
    for _, _op in ipairs({"create"}) do
      local _should_skip, _reason = runner.is_control_skipped("entityOp", "merchant_portal_pam_mandator_controller." .. _op, _live and "live" or "unit")
      if _should_skip then
        pending(_reason or "skipped via sdk-test-control.json")
        return
      end
    end
    -- The basic flow consumes synthetic IDs from the fixture. In live mode
    -- without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup.synthetic_only then
      pending("live entity test uses synthetic IDs from fixture — set BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_MANDATOR_CONTROLLER_ENTID JSON to run live")
      return
    end
    local client = setup.client

    -- CREATE
    local merchant_portal_pam_mandator_controller_ref01_ent = client:MerchantPortalPamMandatorController(nil)
    local merchant_portal_pam_mandator_controller_ref01_data = helpers.to_map(vs.getprop(
      vs.getpath(setup.data, "new.merchant_portal_pam_mandator_controller"), "merchant_portal_pam_mandator_controller_ref01"))

    local merchant_portal_pam_mandator_controller_ref01_data_result, err = merchant_portal_pam_mandator_controller_ref01_ent:create(merchant_portal_pam_mandator_controller_ref01_data, nil)
    assert.is_nil(err)
    merchant_portal_pam_mandator_controller_ref01_data = helpers.to_map(merchant_portal_pam_mandator_controller_ref01_data_result)
    assert.is_not_nil(merchant_portal_pam_mandator_controller_ref01_data)

  end)
end)

function merchant_portal_pam_mandator_controller_basic_setup(extra)
  runner.load_env_local()

  local entity_data_file = _test_dir .. "../../.sdk/test/entity/merchant_portal_pam_mandator_controller/MerchantPortalPamMandatorControllerTestData.json"
  local f = io.open(entity_data_file, "r")
  if f == nil then
    error("failed to read merchant_portal_pam_mandator_controller test data: " .. entity_data_file)
  end
  local entity_data_source = f:read("*a")
  f:close()

  local entity_data = json.decode(entity_data_source)

  local options = {}
  options["entity"] = entity_data["existing"]

  local client = sdk.test(options, extra)

  -- Generate idmap via transform.
  local idmap = vs.transform(
    { "merchant_portal_pam_mandator_controller01", "merchant_portal_pam_mandator_controller02", "merchant_portal_pam_mandator_controller03" },
    {
      ["`$PACK`"] = { "", {
        ["`$KEY`"] = "`$COPY`",
        ["`$VAL`"] = { "`$FORMAT`", "upper", "`$COPY`" },
      }},
    }
  )

  -- Detect ENTID env override before envOverride consumes it. When live
  -- mode is on without a real override, the basic test runs against synthetic
  -- IDs from the fixture and 4xx's. Surface this so the test can skip.
  local entid_env_raw = os.getenv("BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_MANDATOR_CONTROLLER_ENTID")
  local idmap_overridden = entid_env_raw ~= nil and entid_env_raw:match("^%s*{") ~= nil

  local env = runner.env_override({
    ["BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_MANDATOR_CONTROLLER_ENTID"] = idmap,
    ["BLUEFINTECSMERCHANTPORTAL_TEST_LIVE"] = "FALSE",
    ["BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN"] = "FALSE",
  })

  local idmap_resolved = helpers.to_map(
    env["BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_MANDATOR_CONTROLLER_ENTID"])
  if idmap_resolved == nil then
    idmap_resolved = helpers.to_map(idmap)
  end

  if env["BLUEFINTECSMERCHANTPORTAL_TEST_LIVE"] == "TRUE" then
    local merged_opts = vs.merge({
      {
      },
      extra or {},
    })
    client = sdk.new(helpers.to_map(merged_opts))
  end

  local live = env["BLUEFINTECSMERCHANTPORTAL_TEST_LIVE"] == "TRUE"
  return {
    client = client,
    data = entity_data,
    idmap = idmap_resolved,
    env = env,
    explain = env["BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN"] == "TRUE",
    live = live,
    synthetic_only = live and not idmap_overridden,
    now = os.time() * 1000,
  }
end
