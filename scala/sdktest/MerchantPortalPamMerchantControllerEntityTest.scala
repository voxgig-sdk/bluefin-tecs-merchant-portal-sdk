// Generated basic-flow test for the merchant_portal_pam_merchant_controller entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped MerchantPortalPamMerchantControllerTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object MerchantPortalPamMerchantControllerEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("merchant_portal_pam_merchant_controller.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.merchantPortalPamMerchantController(null)
      rep.check("merchant_portal_pam_merchant_controller.instance", ent != null, "expected non-null merchant_portal_pam_merchant_controller entity")
    }

    rep.scope("merchant_portal_pam_merchant_controller.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/merchant_portal_pam_merchant_controller/MerchantPortalPamMerchantControllerTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("merchant_portal_pam_merchant_controller01", "MERCHANT_PORTAL_PAM_MERCHANT_CONTROLLER01")
      idmap.put("merchant_portal_pam_merchant_controller02", "MERCHANT_PORTAL_PAM_MERCHANT_CONTROLLER02")
      idmap.put("merchant_portal_pam_merchant_controller03", "MERCHANT_PORTAL_PAM_MERCHANT_CONTROLLER03")
      val now = System.currentTimeMillis()

      // CREATE
      val merchantPortalPamMerchantControllerRef01Ent = client.merchantPortalPamMerchantController(null)
      var merchantPortalPamMerchantControllerRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.merchant_portal_pam_merchant_controller"), "merchant_portal_pam_merchant_controller_ref01"))
      val merchantPortalPamMerchantControllerRef01DataResult = merchantPortalPamMerchantControllerRef01Ent.create(merchantPortalPamMerchantControllerRef01Data, null)
      merchantPortalPamMerchantControllerRef01Data = Helpers.toMapAny(merchantPortalPamMerchantControllerRef01DataResult)
      rep.check("merchant_portal_pam_merchant_controller.create.map", merchantPortalPamMerchantControllerRef01Data != null, "expected create result to be a map")
    }
  }
}
