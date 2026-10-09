// Generated basic-flow test for the output_move_tid entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped OutputMoveTidTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Config, Context, Helpers, SdkEntity, SdkError, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.feature.BaseFeature
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object OutputMoveTidEntityTest {

  import SdkTestSupport.{B, I, jl, om}

  private def hasFeature(name: String): Boolean = {
    val fm = Helpers.toMapAny(Config.sharedConfig().get("feature"))
    fm != null && fm.get(name) != null
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("output_move_tid.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.outputMoveTid(null)
      rep.check("output_move_tid.instance", ent != null, "expected non-null output_move_tid entity")
    }

    rep.scope("output_move_tid.validate") {
      if (hasFeature("validate")) {
        val client = BluefinTecsMerchantPortalSDK.testSDK(null, om("feature" -> om("validate" -> om("active" -> B(true)))))
        val err = try {
          client.outputMoveTid(null).create(om("productOrderUUIDs" -> "x", "responseCode" -> "x", "responseMessage" -> "x", "targetPackageOrderUUID" -> "x", "targetProductOrderUUID" -> "x"), null)
          null
        } catch { case e: SdkError => e }
        rep.check("output_move_tid.validate", err != null && "validate_failed" == err.code,
          "expected validate_failed, got " + err)
      }
    }

    rep.scope("output_move_tid.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/output_move_tid/OutputMoveTidTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("output_move_tid01", "OUTPUT_MOVE_TID01")
      idmap.put("output_move_tid02", "OUTPUT_MOVE_TID02")
      idmap.put("output_move_tid03", "OUTPUT_MOVE_TID03")
      val now = System.currentTimeMillis()

      // CREATE
      val outputMoveTidRef01Ent = client.outputMoveTid(null)
      var outputMoveTidRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.output_move_tid"), "output_move_tid_ref01"))
      val outputMoveTidRef01DataResult = outputMoveTidRef01Ent.create(outputMoveTidRef01Data, null)
      outputMoveTidRef01Data = Helpers.toMapAny(outputMoveTidRef01DataResult match { case e: SdkEntity => e.data(); case o => o })
      rep.check("output_move_tid.create.map", outputMoveTidRef01Data != null, "expected create result to be a map")
    }
  }
}
