// Generated basic-flow test for the output_create_product entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped OutputCreateProductTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object OutputCreateProductEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("output_create_product.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.outputCreateProduct(null)
      rep.check("output_create_product.instance", ent != null, "expected non-null output_create_product entity")
    }

    rep.scope("output_create_product.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/output_create_product/OutputCreateProductTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("output_create_product01", "OUTPUT_CREATE_PRODUCT01")
      idmap.put("output_create_product02", "OUTPUT_CREATE_PRODUCT02")
      idmap.put("output_create_product03", "OUTPUT_CREATE_PRODUCT03")
      val now = System.currentTimeMillis()

      // CREATE
      val outputCreateProductRef01Ent = client.outputCreateProduct(null)
      var outputCreateProductRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.output_create_product"), "output_create_product_ref01"))
      val outputCreateProductRef01DataResult = outputCreateProductRef01Ent.create(outputCreateProductRef01Data, null)
      outputCreateProductRef01Data = Helpers.toMapAny(outputCreateProductRef01DataResult)
      rep.check("output_create_product.create.map", outputCreateProductRef01Data != null, "expected create result to be a map")
    }
  }
}
