// Generated basic-flow test for the output_remove_product entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped OutputRemoveProductTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Config, Context, Helpers, SdkEntity, SdkError, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.feature.BaseFeature
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object OutputRemoveProductEntityTest {

  import SdkTestSupport.{B, I, jl, om}

  private def hasFeature(name: String): Boolean = {
    val fm = Helpers.toMapAny(Config.sharedConfig().get("feature"))
    fm != null && fm.get(name) != null
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("output_remove_product.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.outputRemoveProduct(null)
      rep.check("output_remove_product.instance", ent != null, "expected non-null output_remove_product entity")
    }

    rep.scope("output_remove_product.validate") {
      if (hasFeature("validate")) {
        val client = BluefinTecsMerchantPortalSDK.testSDK(null, om("feature" -> om("validate" -> om("active" -> B(true)))))
        val err = try {
          client.outputRemoveProduct(null).create(om("packageUUID" -> I(1), "productUUIDs" -> "x", "responseCode" -> I(1), "responseMessage" -> "x"), null)
          null
        } catch { case e: SdkError => e }
        rep.check("output_remove_product.validate", err != null && "validate_failed" == err.code,
          "expected validate_failed, got " + err)
      }
    }

    rep.scope("output_remove_product.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/output_remove_product/OutputRemoveProductTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("output_remove_product01", "OUTPUT_REMOVE_PRODUCT01")
      idmap.put("output_remove_product02", "OUTPUT_REMOVE_PRODUCT02")
      idmap.put("output_remove_product03", "OUTPUT_REMOVE_PRODUCT03")
      val now = System.currentTimeMillis()

      // CREATE
      val outputRemoveProductRef01Ent = client.outputRemoveProduct(null)
      var outputRemoveProductRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.output_remove_product"), "output_remove_product_ref01"))
      val outputRemoveProductRef01DataResult = outputRemoveProductRef01Ent.create(outputRemoveProductRef01Data, null)
      outputRemoveProductRef01Data = Helpers.toMapAny(outputRemoveProductRef01DataResult match { case e: SdkEntity => e.data(); case o => o })
      rep.check("output_remove_product.create.map", outputRemoveProductRef01Data != null, "expected create result to be a map")
    }
  }
}
