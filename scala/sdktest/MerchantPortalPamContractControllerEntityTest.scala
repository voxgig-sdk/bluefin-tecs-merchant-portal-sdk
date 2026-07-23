// Generated basic-flow test for the merchant_portal_pam_contract_controller entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped MerchantPortalPamContractControllerTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object MerchantPortalPamContractControllerEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("merchant_portal_pam_contract_controller.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.merchantPortalPamContractController(null)
      rep.check("merchant_portal_pam_contract_controller.instance", ent != null, "expected non-null merchant_portal_pam_contract_controller entity")
    }

    rep.scope("merchant_portal_pam_contract_controller.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/merchant_portal_pam_contract_controller/MerchantPortalPamContractControllerTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("merchant_portal_pam_contract_controller01", "MERCHANT_PORTAL_PAM_CONTRACT_CONTROLLER01")
      idmap.put("merchant_portal_pam_contract_controller02", "MERCHANT_PORTAL_PAM_CONTRACT_CONTROLLER02")
      idmap.put("merchant_portal_pam_contract_controller03", "MERCHANT_PORTAL_PAM_CONTRACT_CONTROLLER03")
      val now = System.currentTimeMillis()

      // CREATE
      val merchantPortalPamContractControllerRef01Ent = client.merchantPortalPamContractController(null)
      var merchantPortalPamContractControllerRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.merchant_portal_pam_contract_controller"), "merchant_portal_pam_contract_controller_ref01"))
      val merchantPortalPamContractControllerRef01DataResult = merchantPortalPamContractControllerRef01Ent.create(merchantPortalPamContractControllerRef01Data, null)
      merchantPortalPamContractControllerRef01Data = Helpers.toMapAny(merchantPortalPamContractControllerRef01DataResult)
      rep.check("merchant_portal_pam_contract_controller.create.map", merchantPortalPamContractControllerRef01Data != null, "expected create result to be a map")
    }
  }
}
