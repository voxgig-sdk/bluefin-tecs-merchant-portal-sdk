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
class OutputDetailEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
    val ent = testsdk.outputDetail(null)
    assertNotNull(ent, "expected non-null output_detail entity")
  }

  @Test
  fun basic() {
    val setup = outputDetailBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("load")) {
      val reason = RunnerSupport.skipReason("entityOp", "output_detail.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_DETAIL_ENTID JSON to run live",
    )
    val client = setup.client

    // Bootstrap entity data from existing test data (no create step in flow).
    val outputDetailRef01DataRaw = Struct.items(Helpers.toMapAny(
        Struct.getpath(setup.data, "existing.output_detail")))
    val outputDetailRef01Data: MutableMap<String, Any?> = if (outputDetailRef01DataRaw.isEmpty())
        linkedMapOf() else (Helpers.toMapAny(outputDetailRef01DataRaw[0][1]) ?: linkedMapOf())

    // LOAD
    val outputDetailRef01Ent = client.outputDetail(null)
    val outputDetailRef01MatchDt0 = linkedMapOf<String, Any?>()
    val outputDetailRef01DataDt0Loaded = outputDetailRef01Ent.load(outputDetailRef01MatchDt0, null)
    assertNotNull(outputDetailRef01DataDt0Loaded, "expected load result to be non-null")

  }

  companion object {
    fun outputDetailBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "output_detail", "OutputDetailTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read output_detail test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinTecsMerchantPortalSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("output_detail01")
      idnames.add("output_detail02")
      idnames.add("output_detail03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_DETAIL_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_DETAIL_ENTID"] = idmap
      envm["BLUEFINTECSMERCHANTPORTAL_TEST_LIVE"] = "FALSE"
      envm["BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN"] = "FALSE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_DETAIL_ENTID"])
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
