// Generated basic-flow test for the output_detail entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped OutputDetailTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, SdkEntity, BluefinTecsMerchantPortalSDK}
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
      val outputDetailRef01DataRaw = Struct.items(Helpers.toMapAny(
          Struct.getpath(entityData, "existing.output_detail")))
      val outputDetailRef01Data = Helpers.toMapAny(outputDetailRef01DataRaw.get(0).get(1))

      // LOAD
      val outputDetailRef01Ent = client.outputDetail(null)
      val outputDetailRef01MatchDt0 = new LinkedHashMap[String, Object]()
      outputDetailRef01MatchDt0.put("id", outputDetailRef01Data.get("id"))
      val outputDetailRef01DataDt0Loaded = outputDetailRef01Ent.load(outputDetailRef01MatchDt0, null)
      val outputDetailRef01DataDt0LoadResult = Helpers.toMapAny(outputDetailRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("output_detail.load.map", outputDetailRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("output_detail.load.id", outputDetailRef01Data.get("id"), outputDetailRef01DataDt0LoadResult.get("id"))
    }
  }
}
