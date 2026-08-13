// Generated basic-flow test for the output_status entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct OutputStatusSetup {
  std::shared_ptr<BluefinTecsMerchantPortalSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static OutputStatusSetup output_status_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/output_status/OutputStatusTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinTecsMerchantPortalSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("output_status01"), Value("output_status02"), Value("output_status03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_STATUS_ENTID", idmap},
    {"BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE", Value("FALSE")},
    {"BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_STATUS_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE") == Value("TRUE");

  OutputStatusSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void output_status_entity_instance() {
  auto testsdk = BluefinTecsMerchantPortalSDK::testSDK();
  auto ent = testsdk->output_status();
  ASSERT_EQ(ent->getName(), std::string("output_status"), "entity name");
}


static void output_status_entity_basic() {
  auto setup = output_status_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"load"}) {
    auto sk = is_control_skipped("entityOp", std::string("output_status.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;

  // Bootstrap entity data from existing test data (no create step in flow).
  // Declare _data at FUNCTION scope (later load/update steps reference it);
  // only _data_raw was declared, so the block-local assignment left _data
  // undeclared ("was not declared in this scope").
  Value output_status_ref01_data_raw = Helpers::toMapAny(Struct::getpath(setup.data, {"existing", "output_status"}));
  Value output_status_ref01_data = vmap();
  {
    std::vector<Value> its = Struct::items(output_status_ref01_data_raw);
    output_status_ref01_data = its.empty() ? vmap() : Helpers::toMapAny(pair_val(its[0]));
    if (!output_status_ref01_data.is_map()) output_status_ref01_data = vmap();
  }
  // LOAD
  auto output_status_ref01_ent = client->output_status();
  Value output_status_ref01_match_dt0 = vmap();
  Value output_status_ref01_data_dt0_loaded = output_status_ref01_ent->load(output_status_ref01_match_dt0, Value::undef())->data();
  ASSERT_TRUE(!output_status_ref01_data_dt0_loaded.is_undef(), "expected load result to be non-nil");

}

int main() {
  T_RUN(output_status_entity_instance);
  T_RUN(output_status_entity_basic);
  return sdktest::summary("output_status_entity_test");
}
