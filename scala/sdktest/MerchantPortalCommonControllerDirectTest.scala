// Generated direct-call tests for the merchant_portal_common_controller entity (mirrors the java
// TestDirect generator). A dependency-free scala-cli test object driven by
// SdkEntityTestMain: an offline mock transport records each call and the
// asserts confirm path-param substitution and the response shape.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}
import java.util.function.{BiFunction, Supplier}

import voxgig.bluefintecsmerchantportalsdk.core.{Helpers, BluefinTecsMerchantPortalSDK}

object MerchantPortalCommonControllerDirectTest {

  private class DirectSetup(val client: BluefinTecsMerchantPortalSDK, val calls: JList[JMap[String, Object]])

  private def directSetup(mockres: Object): DirectSetup = {
    val calls = new ArrayList[JMap[String, Object]]()
    val mockdata: Object = if (mockres != null) mockres else SdkTestSupport.om("id" -> "direct01")
    val mockFetch: BiFunction[String, JMap[String, Object], Object] =
      (url, init) => {
        calls.add(SdkTestSupport.om("url" -> url, "init" -> init))
        val js: Supplier[Object] = () => mockdata
        SdkTestSupport.om(
          "status" -> SdkTestSupport.I(200),
          "statusText" -> "OK",
          "headers" -> new LinkedHashMap[String, Object](),
          "json" -> js)
      }
    val client = new BluefinTecsMerchantPortalSDK(SdkTestSupport.om(
      "base" -> "http://localhost:8080",
      "system" -> SdkTestSupport.om("fetch" -> mockFetch)))
    new DirectSetup(client, calls)
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("direct-load-merchant_portal_common_controller") {
      val setup = directSetup(SdkTestSupport.om("id" -> "direct01"))
      val client = setup.client

      val params = new LinkedHashMap[String, Object]()
      val result = client.direct(SdkTestSupport.om(
          "path" -> "merchantportalws/logDeveloperInfo",
          "method" -> "GET",
          "params" -> params))

      rep.eq("direct-load-merchant_portal_common_controller.ok", java.lang.Boolean.TRUE, result.get("ok"))
      rep.eqI("direct-load-merchant_portal_common_controller.status", 200, Helpers.toInt(result.get("status")))
      rep.check("direct-load-merchant_portal_common_controller.data", result.get("data") != null, "expected data to be non-null")
      val dataMap = Helpers.toMapAny(result.get("data"))
      if (dataMap != null) rep.eq("direct-load-merchant_portal_common_controller.dataId", "direct01", dataMap.get("id"))
      rep.eqI("direct-load-merchant_portal_common_controller.calls", 1, setup.calls.size())
    }
  }
}
