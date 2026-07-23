// Generated basic-flow test for the output_remove_product entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct OutputRemoveProductSetup {
  std::shared_ptr<BluefinTecsMerchantPortalSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static OutputRemoveProductSetup output_remove_product_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/output_remove_product/OutputRemoveProductTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinTecsMerchantPortalSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("output_remove_product01"), Value("output_remove_product02"), Value("output_remove_product03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_REMOVE_PRODUCT_ENTID", idmap},
    {"BLUEFINTECSMERCHANTPORTAL_TEST_LIVE", Value("FALSE")},
    {"BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_REMOVE_PRODUCT_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINTECSMERCHANTPORTAL_TEST_LIVE") == Value("TRUE");

  OutputRemoveProductSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void output_remove_product_entity_instance() {
  auto testsdk = BluefinTecsMerchantPortalSDK::testSDK();
  auto ent = testsdk->output_remove_product();
  ASSERT_EQ(ent->getName(), std::string("output_remove_product"), "entity name");
}

static void output_remove_product_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"output_remove_product", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinTecsMerchantPortalSDK::testSDK(seed, sdkopts);
  auto se = strsdk->output_remove_product();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinTecsMerchantPortalSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->output_remove_product();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void output_remove_product_entity_basic() {
  auto setup = output_remove_product_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create"}) {
    auto sk = is_control_skipped("entityOp", std::string("output_remove_product.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto output_remove_product_ref01_ent = client->output_remove_product();
  Value output_remove_product_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "output_remove_product"}), "output_remove_product_ref01"));
  if (!output_remove_product_ref01_data.is_map()) output_remove_product_ref01_data = vmap();
  {
    Value output_remove_product_ref01_data_result = output_remove_product_ref01_ent->create(Struct::clone(output_remove_product_ref01_data), Value::undef());
    output_remove_product_ref01_data = Helpers::toMapAny(output_remove_product_ref01_data_result);
    if (!output_remove_product_ref01_data.is_map()) output_remove_product_ref01_data = vmap();
    ASSERT_TRUE(output_remove_product_ref01_data.is_map(), "expected create result to be a map");
  }

}

int main() {
  T_RUN(output_remove_product_entity_instance);
  T_RUN(output_remove_product_entity_stream);
  T_RUN(output_remove_product_entity_basic);
  return sdktest::summary("output_remove_product_entity_test");
}
