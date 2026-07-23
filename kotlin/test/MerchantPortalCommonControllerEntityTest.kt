package voxgig.bluefintecsmerchantportalsdk.sdktest

import java.nio.file.Files
import java.nio.file.Paths

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions
import org.junit.jupiter.api.Test

import voxgig.bluefintecsmerchantportalsdk.core.Helpers
import voxgig.bluefintecsmerchantportalsdk.core.SdkEntity
import voxgig.bluefintecsmerchantportalsdk.core.BluefinTecsMerchantPortalSDK
import voxgig.bluefintecsmerchantportalsdk.utility.Json
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct

@Suppress("UNCHECKED_CAST", "UNUSED_VARIABLE", "UNUSED_VALUE")
class MerchantPortalCommonControllerEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
    val ent = testsdk.merchantPortalCommonController(null)
    assertNotNull(ent, "expected non-null merchant_portal_common_controller entity")
  }

  @Test
  fun basic() {
    val setup = merchantPortalCommonControllerBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("load")) {
      val reason = RunnerSupport.skipReason("entityOp", "merchant_portal_common_controller.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID JSON to run live",
    )
    val client = setup.client

    // Bootstrap entity data from existing test data (no create step in flow).
    val merchantPortalCommonControllerRef01DataRaw = Struct.items(Helpers.toMapAny(
        Struct.getpath(setup.data, "existing.merchant_portal_common_controller")))
    val merchantPortalCommonControllerRef01Data: MutableMap<String, Any?> = if (merchantPortalCommonControllerRef01DataRaw.isEmpty())
        linkedMapOf() else (Helpers.toMapAny(merchantPortalCommonControllerRef01DataRaw[0][1]) ?: linkedMapOf())

    // LOAD
    val merchantPortalCommonControllerRef01Ent = client.merchantPortalCommonController(null)
    val merchantPortalCommonControllerRef01MatchDt0 = linkedMapOf<String, Any?>()
    val merchantPortalCommonControllerRef01DataDt0Loaded = merchantPortalCommonControllerRef01Ent.load(merchantPortalCommonControllerRef01MatchDt0, null)
    assertNotNull(merchantPortalCommonControllerRef01DataDt0Loaded, "expected load result to be non-null")

  }

  companion object {
    fun merchantPortalCommonControllerBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "merchant_portal_common_controller", "MerchantPortalCommonControllerTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read merchant_portal_common_controller test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinTecsMerchantPortalSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("merchant_portal_common_controller01")
      idnames.add("merchant_portal_common_controller02")
      idnames.add("merchant_portal_common_controller03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID"] = idmap
      envm["BLUEFINTECSMERCHANTPORTAL_TEST_LIVE"] = "FALSE"
      envm["BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN"] = "FALSE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID"])
      if (idmapResolved == null) {
        idmapResolved = Helpers.toMapAny(idmap) ?: linkedMapOf()
      }

      val live = "TRUE" == env["BLUEFINTECSMERCHANTPORTAL_TEST_LIVE"]
      if (live) {
        val liveOpts = linkedMapOf<String, Any?>()
        val mergedOpts = Struct.merge(Struct.jt(liveOpts, extra))
        client = BluefinTecsMerchantPortalSDK(Helpers.toMapAny(mergedOpts))
      }

      val setup = RunnerSupport.EntityTestSetup()
      setup.client = client
      setup.data = entityData
      setup.idmap = idmapResolved
      setup.env = env
      setup.explain = "TRUE" == env["BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN"]
      setup.live = live
      setup.syntheticOnly = live && !idmapOverridden
      setup.now = System.currentTimeMillis()
      return setup
    }
  }
}
