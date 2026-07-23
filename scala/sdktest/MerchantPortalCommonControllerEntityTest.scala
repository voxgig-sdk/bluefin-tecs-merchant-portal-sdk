// Generated basic-flow test for the merchant_portal_common_controller entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped MerchantPortalCommonControllerTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, BluefinTecsMerchantPortalSDK}
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

object MerchantPortalCommonControllerEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("merchant_portal_common_controller.instance") {
      val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
      val ent = testsdk.merchantPortalCommonController(null)
      rep.check("merchant_portal_common_controller.instance", ent != null, "expected non-null merchant_portal_common_controller entity")
    }

    rep.scope("merchant_portal_common_controller.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/merchant_portal_common_controller/MerchantPortalCommonControllerTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinTecsMerchantPortalSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("merchant_portal_common_controller01", "MERCHANT_PORTAL_COMMON_CONTROLLER01")
      idmap.put("merchant_portal_common_controller02", "MERCHANT_PORTAL_COMMON_CONTROLLER02")
      idmap.put("merchant_portal_common_controller03", "MERCHANT_PORTAL_COMMON_CONTROLLER03")
      val now = System.currentTimeMillis()

      // LOAD
      val merchantPortalCommonControllerRef01Ent = client.merchantPortalCommonController(null)
      val merchantPortalCommonControllerRef01MatchDt0 = new LinkedHashMap[String, Object]()
      val merchantPortalCommonControllerRef01DataDt0Loaded = merchantPortalCommonControllerRef01Ent.load(merchantPortalCommonControllerRef01MatchDt0, null)
      rep.check("merchant_portal_common_controller.load.nonnull", merchantPortalCommonControllerRef01DataDt0Loaded != null, "expected load result to be non-null")
    }
  }
}
