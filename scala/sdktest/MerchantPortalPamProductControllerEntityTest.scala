// Generated basic-flow test for the merchant_portal_pam_product_controller entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped MerchantPortalPamProductControllerTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object MerchantPortalPamProductControllerEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("merchant_portal_pam_product_controller.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.merchantPortalPamProductController(null)
      rep.check("merchant_portal_pam_product_controller.instance", ent != null, "expected non-null merchant_portal_pam_product_controller entity")
    }

    rep.scope("merchant_portal_pam_product_controller.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/merchant_portal_pam_product_controller/MerchantPortalPamProductControllerTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("merchant_portal_pam_product_controller01", "MERCHANT_PORTAL_PAM_PRODUCT_CONTROLLER01")
      idmap.put("merchant_portal_pam_product_controller02", "MERCHANT_PORTAL_PAM_PRODUCT_CONTROLLER02")
      idmap.put("merchant_portal_pam_product_controller03", "MERCHANT_PORTAL_PAM_PRODUCT_CONTROLLER03")
      val now = System.currentTimeMillis()

      // CREATE
      val merchantPortalPamProductControllerRef01Ent = client.merchantPortalPamProductController(null)
      var merchantPortalPamProductControllerRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.merchant_portal_pam_product_controller"), "merchant_portal_pam_product_controller_ref01"))
      val merchantPortalPamProductControllerRef01DataResult = merchantPortalPamProductControllerRef01Ent.create(merchantPortalPamProductControllerRef01Data, null)
      merchantPortalPamProductControllerRef01Data = Helpers.toMapAny(merchantPortalPamProductControllerRef01DataResult)
      rep.check("merchant_portal_pam_product_controller.create.map", merchantPortalPamProductControllerRef01Data != null, "expected create result to be a map")
    }
  }
}
