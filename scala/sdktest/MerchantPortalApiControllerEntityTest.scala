// Generated basic-flow test for the merchant_portal_api_controller entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped MerchantPortalApiControllerTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object MerchantPortalApiControllerEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("merchant_portal_api_controller.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.merchantPortalApiController(null)
      rep.check("merchant_portal_api_controller.instance", ent != null, "expected non-null merchant_portal_api_controller entity")
    }

    rep.scope("merchant_portal_api_controller.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/merchant_portal_api_controller/MerchantPortalApiControllerTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("merchant_portal_api_controller01", "MERCHANT_PORTAL_API_CONTROLLER01")
      idmap.put("merchant_portal_api_controller02", "MERCHANT_PORTAL_API_CONTROLLER02")
      idmap.put("merchant_portal_api_controller03", "MERCHANT_PORTAL_API_CONTROLLER03")
      val now = System.currentTimeMillis()

      // CREATE
      val merchantPortalApiControllerRef01Ent = client.merchantPortalApiController(null)
      var merchantPortalApiControllerRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.merchant_portal_api_controller"), "merchant_portal_api_controller_ref01"))
      val merchantPortalApiControllerRef01DataResult = merchantPortalApiControllerRef01Ent.create(merchantPortalApiControllerRef01Data, null)
      merchantPortalApiControllerRef01Data = Helpers.toMapAny(merchantPortalApiControllerRef01DataResult)
      rep.check("merchant_portal_api_controller.create.map", merchantPortalApiControllerRef01Data != null, "expected create result to be a map")
    }
  }
}
