# MerchantPortalCommonController entity test

require "minitest/autorun"
require "json"
require_relative "../BluefinTecsMerchantPortal_sdk"
require_relative "runner"

class MerchantPortalCommonControllerEntityTest < Minitest::Test
  def test_create_instance
    testsdk = BluefinTecsMerchantPortalSDK.test(nil, nil)
    ent = testsdk.MerchantPortalCommonController(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = merchant_portal_common_controller_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["load"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "merchant_portal_common_controller." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # Bootstrap entity data from existing test data.
    merchant_portal_common_controller_ref01_data_raw = Vs.items(Helpers.to_map(
      Vs.getpath(setup[:data], "existing.merchant_portal_common_controller")))
    merchant_portal_common_controller_ref01_data = nil
    if merchant_portal_common_controller_ref01_data_raw.length > 0
      merchant_portal_common_controller_ref01_data = Helpers.to_map(merchant_portal_common_controller_ref01_data_raw[0][1])
    end

    # LOAD
    merchant_portal_common_controller_ref01_ent = client.MerchantPortalCommonController(nil)
    merchant_portal_common_controller_ref01_match_dt0 = {}
    merchant_portal_common_controller_ref01_data_dt0_loaded = merchant_portal_common_controller_ref01_ent.load(merchant_portal_common_controller_ref01_match_dt0, nil)
    assert !merchant_portal_common_controller_ref01_data_dt0_loaded.nil?

  end
end

def merchant_portal_common_controller_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "merchant_portal_common_controller", "MerchantPortalCommonControllerTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = BluefinTecsMerchantPortalSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["merchant_portal_common_controller01", "merchant_portal_common_controller02", "merchant_portal_common_controller03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID" => idmap,
    "BLUEFINTECSMERCHANTPORTAL_TEST_LIVE" => "FALSE",
    "BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN" => "FALSE",
  })

  idmap_resolved = Helpers.to_map(
    env["BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["BLUEFINTECSMERCHANTPORTAL_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
      },
      extra || {},
    ])
    client = BluefinTecsMerchantPortalSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["BLUEFINTECSMERCHANTPORTAL_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
