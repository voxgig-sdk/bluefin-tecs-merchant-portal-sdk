// Generated basic-flow test for the output_detail entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped OutputDetailTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object OutputDetailEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("output_detail.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.outputDetail(null)
      rep.check("output_detail.instance", ent != null, "expected non-null output_detail entity")
    }

    rep.scope("output_detail.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/output_detail/OutputDetailTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("output_detail01", "OUTPUT_DETAIL01")
      idmap.put("output_detail02", "OUTPUT_DETAIL02")
      idmap.put("output_detail03", "OUTPUT_DETAIL03")
      val now = System.currentTimeMillis()

      // LOAD
      val outputDetailRef01Ent = client.outputDetail(null)
      val outputDetailRef01MatchDt0 = new LinkedHashMap[String, Object]()
      val outputDetailRef01DataDt0Loaded = outputDetailRef01Ent.load(outputDetailRef01MatchDt0, null)
      rep.check("output_detail.load.nonnull", outputDetailRef01DataDt0Loaded != null, "expected load result to be non-null")
    }
  }
}
