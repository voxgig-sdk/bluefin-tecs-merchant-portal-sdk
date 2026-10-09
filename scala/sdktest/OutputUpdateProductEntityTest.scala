// Generated basic-flow test for the output_update_product entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped OutputUpdateProductTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Config, Context, Helpers, SdkEntity, SdkError, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.feature.BaseFeature
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object OutputUpdateProductEntityTest {

  import SdkTestSupport.{B, I, jl, om}

  private def hasFeature(name: String): Boolean = {
    val fm = Helpers.toMapAny(Config.sharedConfig().get("feature"))
    fm != null && fm.get(name) != null
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("output_update_product.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.outputUpdateProduct(null)
      rep.check("output_update_product.instance", ent != null, "expected non-null output_update_product entity")
    }

    rep.scope("output_update_product.validate") {
      if (hasFeature("validate")) {
        val client = BluefinTecsMerchantPortalSDK.testSDK(null, om("feature" -> om("validate" -> om("active" -> B(true)))))
        val err = try {
          client.outputUpdateProduct(null).create(om("allowMultipleOrders" -> "x", "productUUID" -> "x", "responseCode" -> I(1), "responseMessage" -> "x"), null)
          null
        } catch { case e: SdkError => e }
        rep.check("output_update_product.validate", err != null && "validate_failed" == err.code,
          "expected validate_failed, got " + err)
      }
    }

    rep.scope("output_update_product.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/output_update_product/OutputUpdateProductTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("output_update_product01", "OUTPUT_UPDATE_PRODUCT01")
      idmap.put("output_update_product02", "OUTPUT_UPDATE_PRODUCT02")
      idmap.put("output_update_product03", "OUTPUT_UPDATE_PRODUCT03")
      val now = System.currentTimeMillis()

      // CREATE
      val outputUpdateProductRef01Ent = client.outputUpdateProduct(null)
      var outputUpdateProductRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.output_update_product"), "output_update_product_ref01"))
      val outputUpdateProductRef01DataResult = outputUpdateProductRef01Ent.create(outputUpdateProductRef01Data, null)
      outputUpdateProductRef01Data = Helpers.toMapAny(outputUpdateProductRef01DataResult match { case e: SdkEntity => e.data(); case o => o })
      rep.check("output_update_product.create.map", outputUpdateProductRef01Data != null, "expected create result to be a map")
    }
  }
}
