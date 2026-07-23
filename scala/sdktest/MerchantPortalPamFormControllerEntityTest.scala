// Generated basic-flow test for the merchant_portal_pam_form_controller entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped MerchantPortalPamFormControllerTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object MerchantPortalPamFormControllerEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("merchant_portal_pam_form_controller.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.merchantPortalPamFormController(null)
      rep.check("merchant_portal_pam_form_controller.instance", ent != null, "expected non-null merchant_portal_pam_form_controller entity")
    }

    rep.scope("merchant_portal_pam_form_controller.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/merchant_portal_pam_form_controller/MerchantPortalPamFormControllerTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("merchant_portal_pam_form_controller01", "MERCHANT_PORTAL_PAM_FORM_CONTROLLER01")
      idmap.put("merchant_portal_pam_form_controller02", "MERCHANT_PORTAL_PAM_FORM_CONTROLLER02")
      idmap.put("merchant_portal_pam_form_controller03", "MERCHANT_PORTAL_PAM_FORM_CONTROLLER03")
      val now = System.currentTimeMillis()

      // CREATE
      val merchantPortalPamFormControllerRef01Ent = client.merchantPortalPamFormController(null)
      var merchantPortalPamFormControllerRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.merchant_portal_pam_form_controller"), "merchant_portal_pam_form_controller_ref01"))
      val merchantPortalPamFormControllerRef01DataResult = merchantPortalPamFormControllerRef01Ent.create(merchantPortalPamFormControllerRef01Data, null)
      merchantPortalPamFormControllerRef01Data = Helpers.toMapAny(merchantPortalPamFormControllerRef01DataResult)
      rep.check("merchant_portal_pam_form_controller.create.map", merchantPortalPamFormControllerRef01Data != null, "expected create result to be a map")
    }
  }
}
