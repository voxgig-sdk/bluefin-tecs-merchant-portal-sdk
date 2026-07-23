// Generated basic-flow test for the output_start entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped OutputStartTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object OutputStartEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("output_start.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.outputStart(null)
      rep.check("output_start.instance", ent != null, "expected non-null output_start entity")
    }

    rep.scope("output_start.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/output_start/OutputStartTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("output_start01", "OUTPUT_START01")
      idmap.put("output_start02", "OUTPUT_START02")
      idmap.put("output_start03", "OUTPUT_START03")
      val now = System.currentTimeMillis()

      // CREATE
      val outputStartRef01Ent = client.outputStart(null)
      var outputStartRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.output_start"), "output_start_ref01"))
      val outputStartRef01DataResult = outputStartRef01Ent.create(outputStartRef01Data, null)
      outputStartRef01Data = Helpers.toMapAny(outputStartRef01DataResult)
      rep.check("output_start.create.map", outputStartRef01Data != null, "expected create result to be a map")
      rep.check("output_start.create.id", outputStartRef01Data != null && outputStartRef01Data.get("id") != null, "expected created entity to have an id")
    }
  }
}
