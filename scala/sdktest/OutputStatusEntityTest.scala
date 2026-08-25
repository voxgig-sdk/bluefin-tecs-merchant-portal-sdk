// Generated basic-flow test for the output_status entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped OutputStatusTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, SdkEntity, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object OutputStatusEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("output_status.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.outputStatus(null)
      rep.check("output_status.instance", ent != null, "expected non-null output_status entity")
    }

    rep.scope("output_status.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/output_status/OutputStatusTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("output_status01", "OUTPUT_STATUS01")
      idmap.put("output_status02", "OUTPUT_STATUS02")
      idmap.put("output_status03", "OUTPUT_STATUS03")
      val now = System.currentTimeMillis()
      val outputStatusRef01DataRaw = Struct.items(Helpers.toMapAny(
          Struct.getpath(entityData, "existing.output_status")))
      val outputStatusRef01Data = Helpers.toMapAny(outputStatusRef01DataRaw.get(0).get(1))

      // LOAD
      val outputStatusRef01Ent = client.outputStatus(null)
      val outputStatusRef01MatchDt0 = new LinkedHashMap[String, Object]()
      outputStatusRef01MatchDt0.put("id", outputStatusRef01Data.get("id"))
      val outputStatusRef01DataDt0Loaded = outputStatusRef01Ent.load(outputStatusRef01MatchDt0, null)
      val outputStatusRef01DataDt0LoadResult = Helpers.toMapAny(outputStatusRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("output_status.load.map", outputStatusRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("output_status.load.id", outputStatusRef01Data.get("id"), outputStatusRef01DataDt0LoadResult.get("id"))
    }
  }
}
