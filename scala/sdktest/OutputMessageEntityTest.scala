// Generated basic-flow test for the output_message entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped OutputMessageTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, SdkEntity, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object OutputMessageEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("output_message.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.outputMessage(null)
      rep.check("output_message.instance", ent != null, "expected non-null output_message entity")
    }

    rep.scope("output_message.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/output_message/OutputMessageTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("output_message01", "OUTPUT_MESSAGE01")
      idmap.put("output_message02", "OUTPUT_MESSAGE02")
      idmap.put("output_message03", "OUTPUT_MESSAGE03")
      val now = System.currentTimeMillis()
      val outputMessageRef01DataRaw = Struct.items(Helpers.toMapAny(
          Struct.getpath(entityData, "existing.output_message")))
      val outputMessageRef01Data = Helpers.toMapAny(outputMessageRef01DataRaw.get(0).get(1))

      // LOAD
      val outputMessageRef01Ent = client.outputMessage(null)
      val outputMessageRef01MatchDt0 = new LinkedHashMap[String, Object]()
      outputMessageRef01MatchDt0.put("id", outputMessageRef01Data.get("id"))
      val outputMessageRef01DataDt0Loaded = outputMessageRef01Ent.load(outputMessageRef01MatchDt0, null)
      val outputMessageRef01DataDt0LoadResult = Helpers.toMapAny(outputMessageRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("output_message.load.map", outputMessageRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("output_message.load.id", outputMessageRef01Data.get("id"), outputMessageRef01DataDt0LoadResult.get("id"))
    }
  }
}
