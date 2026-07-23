// Generated basic-flow test for the output_list entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped OutputListTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object OutputListEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("output_list.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.outputList(null)
      rep.check("output_list.instance", ent != null, "expected non-null output_list entity")
    }

    rep.scope("output_list.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/output_list/OutputListTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("output_list01", "OUTPUT_LIST01")
      idmap.put("output_list02", "OUTPUT_LIST02")
      idmap.put("output_list03", "OUTPUT_LIST03")
      val now = System.currentTimeMillis()

      // CREATE
      val outputListRef01Ent = client.outputList(null)
      var outputListRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.output_list"), "output_list_ref01"))
      val outputListRef01DataResult = outputListRef01Ent.create(outputListRef01Data, null)
      outputListRef01Data = Helpers.toMapAny(outputListRef01DataResult)
      rep.check("output_list.create.map", outputListRef01Data != null, "expected create result to be a map")
    }
  }
}
