# OutputList entity test

require "minitest/autorun"
require "json"
require_relative "../BluefinTecsMerchantPortal_sdk"
require_relative "runner"

class OutputListEntityTest < Minitest::Test
  # main.kit.test.live.strict is true (the default is true): a live
  # request that fails, or a live test missing an input it needs,
  # fails the test.
  # An account with no record for a test to read skips it either way.
  LIVE_STRICT = true

  def test_create_instance
    testsdk = BluefinTecsMerchantPortalSDK.test(nil, nil)
    ent = testsdk.OutputList(nil)
    assert !ent.nil?
  end

  def test_validate
    cfg = BluefinTecsMerchantPortalConfig.shared_config
    unless cfg["feature"].is_a?(Hash) && cfg["feature"].key?("validate")
      skip("feature not present in this SDK: validate")
    end
    client = BluefinTecsMerchantPortalSDK.test(nil, { "feature" => { "validate" => { "active" => true } } })
    err = assert_raises(StandardError) do
      client.OutputList(nil).create({ "pagination" => "x", "responseCode" => "x", "responseMessage" => "x" }, nil)
    end
    assert_equal "validate_failed", err.code
  end

  def test_basic_flow
    setup = output_list_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["create"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "output_list." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    client = setup[:client]

    # CREATE
    output_list_ref01_ent = client.OutputList(nil)
    output_list_ref01_data = Helpers.to_map(Vs.getprop(
      Vs.getpath(setup[:data], "new.output_list"), "output_list_ref01"))

    output_list_ref01_data_result = output_list_ref01_ent.create(output_list_ref01_data, nil)
    output_list_ref01_data = Helpers.to_map(output_list_ref01_data_result.respond_to?(:data_get) ? output_list_ref01_data_result.data_get : output_list_ref01_data_result)
    assert !output_list_ref01_data.nil?

  end
end

def output_list_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "output_list", "OutputListTestData.json")
  entity_data_source = File.read(entity_data_file, encoding: "UTF-8")
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = BluefinTecsMerchantPortalSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["output_list01", "output_list02", "output_list03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Whether *_ENTID supplied the idmap, read before env_override consumes
  # it: without it, the ids a live flow binds are the fixture's synthetic ones.
  entid_env_raw = ENV["BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_LIST_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_LIST_ENTID" => idmap,
    "BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE" => "FALSE",
    "BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN" => "FALSE",
  })

  idmap_resolved = Helpers.to_map(
    env["BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_LIST_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      # FIRST, so the generated fields below win: sdk-test-control.json's
      # test.client.options adds to the live client, it does not redirect it.
      Runner.live_client_options,
      {
      },
      extra || {},
    ])
    client = BluefinTecsMerchantPortalSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
