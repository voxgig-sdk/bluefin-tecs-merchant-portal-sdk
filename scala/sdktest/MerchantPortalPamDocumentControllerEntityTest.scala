// Generated basic-flow test for the merchant_portal_pam_document_controller entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped MerchantPortalPamDocumentControllerTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object MerchantPortalPamDocumentControllerEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("merchant_portal_pam_document_controller.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.merchantPortalPamDocumentController(null)
      rep.check("merchant_portal_pam_document_controller.instance", ent != null, "expected non-null merchant_portal_pam_document_controller entity")
    }

    rep.scope("merchant_portal_pam_document_controller.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/merchant_portal_pam_document_controller/MerchantPortalPamDocumentControllerTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("merchant_portal_pam_document_controller01", "MERCHANT_PORTAL_PAM_DOCUMENT_CONTROLLER01")
      idmap.put("merchant_portal_pam_document_controller02", "MERCHANT_PORTAL_PAM_DOCUMENT_CONTROLLER02")
      idmap.put("merchant_portal_pam_document_controller03", "MERCHANT_PORTAL_PAM_DOCUMENT_CONTROLLER03")
      val now = System.currentTimeMillis()

      // CREATE
      val merchantPortalPamDocumentControllerRef01Ent = client.merchantPortalPamDocumentController(null)
      var merchantPortalPamDocumentControllerRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.merchant_portal_pam_document_controller"), "merchant_portal_pam_document_controller_ref01"))
      val merchantPortalPamDocumentControllerRef01DataResult = merchantPortalPamDocumentControllerRef01Ent.create(merchantPortalPamDocumentControllerRef01Data, null)
      merchantPortalPamDocumentControllerRef01Data = Helpers.toMapAny(merchantPortalPamDocumentControllerRef01DataResult)
      rep.check("merchant_portal_pam_document_controller.create.map", merchantPortalPamDocumentControllerRef01Data != null, "expected create result to be a map")
    }
  }
}
