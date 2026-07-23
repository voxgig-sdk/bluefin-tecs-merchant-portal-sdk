// Generated basic-flow test for the merchant_portal_pam_package_controller entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped MerchantPortalPamPackageControllerTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object MerchantPortalPamPackageControllerEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("merchant_portal_pam_package_controller.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.merchantPortalPamPackageController(null)
      rep.check("merchant_portal_pam_package_controller.instance", ent != null, "expected non-null merchant_portal_pam_package_controller entity")
    }

    rep.scope("merchant_portal_pam_package_controller.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/merchant_portal_pam_package_controller/MerchantPortalPamPackageControllerTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("merchant_portal_pam_package_controller01", "MERCHANT_PORTAL_PAM_PACKAGE_CONTROLLER01")
      idmap.put("merchant_portal_pam_package_controller02", "MERCHANT_PORTAL_PAM_PACKAGE_CONTROLLER02")
      idmap.put("merchant_portal_pam_package_controller03", "MERCHANT_PORTAL_PAM_PACKAGE_CONTROLLER03")
      val now = System.currentTimeMillis()

      // CREATE
      val merchantPortalPamPackageControllerRef01Ent = client.merchantPortalPamPackageController(null)
      var merchantPortalPamPackageControllerRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.merchant_portal_pam_package_controller"), "merchant_portal_pam_package_controller_ref01"))
      val merchantPortalPamPackageControllerRef01DataResult = merchantPortalPamPackageControllerRef01Ent.create(merchantPortalPamPackageControllerRef01Data, null)
      merchantPortalPamPackageControllerRef01Data = Helpers.toMapAny(merchantPortalPamPackageControllerRef01DataResult)
      rep.check("merchant_portal_pam_package_controller.create.map", merchantPortalPamPackageControllerRef01Data != null, "expected create result to be a map")
    }
  }
}
