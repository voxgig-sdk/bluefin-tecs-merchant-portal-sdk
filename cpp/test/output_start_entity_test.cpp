// Generated basic-flow test for the output_start entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct OutputStartSetup {
  std::shared_ptr<BluefinTecsMerchantPortalSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static OutputStartSetup output_start_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/output_start/OutputStartTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinTecsMerchantPortalSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("output_start01"), Value("output_start02"), Value("output_start03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_START_ENTID", idmap},
    {"BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE", Value("FALSE")},
    {"BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_START_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE") == Value("TRUE");

  OutputStartSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void output_start_entity_instance() {
  auto testsdk = BluefinTecsMerchantPortalSDK::testSDK();
  auto ent = testsdk->output_start();
  ASSERT_EQ(ent->getName(), std::string("output_start"), "entity name");
}


static void output_start_entity_basic() {
  auto setup = output_start_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create"}) {
    auto sk = is_control_skipped("entityOp", std::string("output_start.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto output_start_ref01_ent = client->output_start();
  Value output_start_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "output_start"}), "output_start_ref01"));
  if (!output_start_ref01_data.is_map()) output_start_ref01_data = vmap();
  {
    Value output_start_ref01_data_result = output_start_ref01_ent->create(Struct::clone(output_start_ref01_data), Value::undef())->data();
    output_start_ref01_data = Helpers::toMapAny(output_start_ref01_data_result);
    if (!output_start_ref01_data.is_map()) output_start_ref01_data = vmap();
    ASSERT_TRUE(output_start_ref01_data.is_map(), "expected create result to be a map");
    ASSERT_TRUE(!getp(output_start_ref01_data, "id").is_undef(), "expected created entity to have an id");
  }

}

int main() {
  T_RUN(output_start_entity_instance);
  T_RUN(output_start_entity_basic);
  return sdktest::summary("output_start_entity_test");
}
