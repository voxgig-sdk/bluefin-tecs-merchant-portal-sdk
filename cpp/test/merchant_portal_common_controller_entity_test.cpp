// Generated basic-flow test for the merchant_portal_common_controller entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct MerchantPortalCommonControllerSetup {
  std::shared_ptr<BluefinTecsMerchantPortalSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static MerchantPortalCommonControllerSetup merchant_portal_common_controller_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/merchant_portal_common_controller/MerchantPortalCommonControllerTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinTecsMerchantPortalSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("merchant_portal_common_controller01"), Value("merchant_portal_common_controller02"), Value("merchant_portal_common_controller03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID", idmap},
    {"BLUEFINTECSMERCHANTPORTAL_TEST_LIVE", Value("FALSE")},
    {"BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINTECSMERCHANTPORTAL_TEST_LIVE") == Value("TRUE");

  MerchantPortalCommonControllerSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void merchant_portal_common_controller_entity_instance() {
  auto testsdk = BluefinTecsMerchantPortalSDK::testSDK();
  auto ent = testsdk->merchant_portal_common_controller();
  ASSERT_EQ(ent->getName(), std::string("merchant_portal_common_controller"), "entity name");
}

static void merchant_portal_common_controller_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"merchant_portal_common_controller", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinTecsMerchantPortalSDK::testSDK(seed, sdkopts);
  auto se = strsdk->merchant_portal_common_controller();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinTecsMerchantPortalSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->merchant_portal_common_controller();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void merchant_portal_common_controller_entity_basic() {
  auto setup = merchant_portal_common_controller_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"load"}) {
    auto sk = is_control_skipped("entityOp", std::string("merchant_portal_common_controller.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;

  // Bootstrap entity data from existing test data (no create step in flow).
  // Declare _data at FUNCTION scope (later load/update steps reference it);
  // only _data_raw was declared, so the block-local assignment left _data
  // undeclared ("was not declared in this scope").
  Value merchant_portal_common_controller_ref01_data_raw = Helpers::toMapAny(Struct::getpath(setup.data, {"existing", "merchant_portal_common_controller"}));
  Value merchant_portal_common_controller_ref01_data = vmap();
  {
    std::vector<Value> its = Struct::items(merchant_portal_common_controller_ref01_data_raw);
    merchant_portal_common_controller_ref01_data = its.empty() ? vmap() : Helpers::toMapAny(pair_val(its[0]));
    if (!merchant_portal_common_controller_ref01_data.is_map()) merchant_portal_common_controller_ref01_data = vmap();
  }
  // LOAD
  auto merchant_portal_common_controller_ref01_ent = client->merchant_portal_common_controller();
  Value merchant_portal_common_controller_ref01_match_dt0 = vmap();
  Value merchant_portal_common_controller_ref01_data_dt0_loaded = merchant_portal_common_controller_ref01_ent->load(merchant_portal_common_controller_ref01_match_dt0, Value::undef());
  ASSERT_TRUE(!merchant_portal_common_controller_ref01_data_dt0_loaded.is_undef(), "expected load result to be non-nil");

}

int main() {
  T_RUN(merchant_portal_common_controller_entity_instance);
  T_RUN(merchant_portal_common_controller_entity_stream);
  T_RUN(merchant_portal_common_controller_entity_basic);
  return sdktest::summary("merchant_portal_common_controller_entity_test");
}
