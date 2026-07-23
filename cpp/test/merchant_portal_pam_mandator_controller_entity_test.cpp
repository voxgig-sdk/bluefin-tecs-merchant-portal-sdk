// Generated basic-flow test for the merchant_portal_pam_mandator_controller entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct MerchantPortalPamMandatorControllerSetup {
  std::shared_ptr<BluefinTecsMerchantPortalSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static MerchantPortalPamMandatorControllerSetup merchant_portal_pam_mandator_controller_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/merchant_portal_pam_mandator_controller/MerchantPortalPamMandatorControllerTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinTecsMerchantPortalSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("merchant_portal_pam_mandator_controller01"), Value("merchant_portal_pam_mandator_controller02"), Value("merchant_portal_pam_mandator_controller03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_MANDATOR_CONTROLLER_ENTID", idmap},
    {"BLUEFINTECSMERCHANTPORTAL_TEST_LIVE", Value("FALSE")},
    {"BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_MANDATOR_CONTROLLER_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINTECSMERCHANTPORTAL_TEST_LIVE") == Value("TRUE");

  MerchantPortalPamMandatorControllerSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void merchant_portal_pam_mandator_controller_entity_instance() {
  auto testsdk = BluefinTecsMerchantPortalSDK::testSDK();
  auto ent = testsdk->merchant_portal_pam_mandator_controller();
  ASSERT_EQ(ent->getName(), std::string("merchant_portal_pam_mandator_controller"), "entity name");
}

static void merchant_portal_pam_mandator_controller_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"merchant_portal_pam_mandator_controller", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinTecsMerchantPortalSDK::testSDK(seed, sdkopts);
  auto se = strsdk->merchant_portal_pam_mandator_controller();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinTecsMerchantPortalSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->merchant_portal_pam_mandator_controller();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void merchant_portal_pam_mandator_controller_entity_basic() {
  auto setup = merchant_portal_pam_mandator_controller_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create"}) {
    auto sk = is_control_skipped("entityOp", std::string("merchant_portal_pam_mandator_controller.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto merchant_portal_pam_mandator_controller_ref01_ent = client->merchant_portal_pam_mandator_controller();
  Value merchant_portal_pam_mandator_controller_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "merchant_portal_pam_mandator_controller"}), "merchant_portal_pam_mandator_controller_ref01"));
  if (!merchant_portal_pam_mandator_controller_ref01_data.is_map()) merchant_portal_pam_mandator_controller_ref01_data = vmap();
  {
    Value merchant_portal_pam_mandator_controller_ref01_data_result = merchant_portal_pam_mandator_controller_ref01_ent->create(Struct::clone(merchant_portal_pam_mandator_controller_ref01_data), Value::undef());
    merchant_portal_pam_mandator_controller_ref01_data = Helpers::toMapAny(merchant_portal_pam_mandator_controller_ref01_data_result);
    if (!merchant_portal_pam_mandator_controller_ref01_data.is_map()) merchant_portal_pam_mandator_controller_ref01_data = vmap();
    ASSERT_TRUE(merchant_portal_pam_mandator_controller_ref01_data.is_map(), "expected create result to be a map");
  }

}

int main() {
  T_RUN(merchant_portal_pam_mandator_controller_entity_instance);
  T_RUN(merchant_portal_pam_mandator_controller_entity_stream);
  T_RUN(merchant_portal_pam_mandator_controller_entity_basic);
  return sdktest::summary("merchant_portal_pam_mandator_controller_entity_test");
}
