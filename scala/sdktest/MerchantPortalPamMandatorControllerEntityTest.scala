// Generated basic-flow test for the merchant_portal_pam_mandator_controller entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped MerchantPortalPamMandatorControllerTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object MerchantPortalPamMandatorControllerEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("merchant_portal_pam_mandator_controller.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.merchantPortalPamMandatorController(null)
      rep.check("merchant_portal_pam_mandator_controller.instance", ent != null, "expected non-null merchant_portal_pam_mandator_controller entity")
    }

    rep.scope("merchant_portal_pam_mandator_controller.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/merchant_portal_pam_mandator_controller/MerchantPortalPamMandatorControllerTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("merchant_portal_pam_mandator_controller01", "MERCHANT_PORTAL_PAM_MANDATOR_CONTROLLER01")
      idmap.put("merchant_portal_pam_mandator_controller02", "MERCHANT_PORTAL_PAM_MANDATOR_CONTROLLER02")
      idmap.put("merchant_portal_pam_mandator_controller03", "MERCHANT_PORTAL_PAM_MANDATOR_CONTROLLER03")
      val now = System.currentTimeMillis()

      // CREATE
      val merchantPortalPamMandatorControllerRef01Ent = client.merchantPortalPamMandatorController(null)
      var merchantPortalPamMandatorControllerRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.merchant_portal_pam_mandator_controller"), "merchant_portal_pam_mandator_controller_ref01"))
      val merchantPortalPamMandatorControllerRef01DataResult = merchantPortalPamMandatorControllerRef01Ent.create(merchantPortalPamMandatorControllerRef01Data, null)
      merchantPortalPamMandatorControllerRef01Data = Helpers.toMapAny(merchantPortalPamMandatorControllerRef01DataResult)
      rep.check("merchant_portal_pam_mandator_controller.create.map", merchantPortalPamMandatorControllerRef01Data != null, "expected create result to be a map")
    }
  }
}
