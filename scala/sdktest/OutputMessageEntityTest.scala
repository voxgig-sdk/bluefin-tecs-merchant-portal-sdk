// Generated basic-flow test for the output_message entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped OutputMessageTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, BluefinTecsMerchantPortalSDK}
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

      // LOAD
      val outputMessageRef01Ent = client.outputMessage(null)
      val outputMessageRef01MatchDt0 = new LinkedHashMap[String, Object]()
      val outputMessageRef01DataDt0Loaded = outputMessageRef01Ent.load(outputMessageRef01MatchDt0, null)
      rep.check("output_message.load.nonnull", outputMessageRef01DataDt0Loaded != null, "expected load result to be non-null")
    }
  }
}
