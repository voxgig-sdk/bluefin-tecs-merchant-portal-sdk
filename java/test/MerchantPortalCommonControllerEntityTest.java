package voxgig.bluefintecsmerchantportalsdk.sdktest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.junit.jupiter.api.Assumptions;
import org.junit.jupiter.api.Test;

import voxgig.bluefintecsmerchantportalsdk.core.Helpers;
import voxgig.bluefintecsmerchantportalsdk.core.SdkEntity;
import voxgig.bluefintecsmerchantportalsdk.core.BluefinTecsMerchantPortalSDK;
import voxgig.bluefintecsmerchantportalsdk.utility.Json;
import voxgig.bluefintecsmerchantportalsdk.utility.struct.Struct;

@SuppressWarnings({"unchecked", "unused"})
public class MerchantPortalCommonControllerEntityTest {

  @Test
  public void instance() {
    BluefinTecsMerchantPortalSDK testsdk = BluefinTecsMerchantPortalSDK.testSDK();
    SdkEntity ent = testsdk.merchantPortalCommonController(null);
    assertNotNull(ent, "expected non-null merchant_portal_common_controller entity");
  }

  @Test
  public void basic() {
    RunnerSupport.EntityTestSetup setup = merchantPortalCommonControllerBasicSetup(null);
    // Per-op sdk-test-control.json skip — basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    String mode = setup.live ? "live" : "unit";
    for (String op : new String[] { "load" }) {
      String reason = RunnerSupport.skipReason("entityOp", "merchant_portal_common_controller." + op, mode);
      Assumptions.assumeTrue(reason == null,
          reason == null || "".equals(reason)
              ? "skipped via sdk-test-control.json" : reason);
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    Assumptions.assumeFalse(setup.syntheticOnly,
        "live entity test uses synthetic IDs from fixture — set BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID JSON to run live");
    BluefinTecsMerchantPortalSDK client = setup.client;

    // Bootstrap entity data from existing test data (no create step in flow).
    List<List<Object>> merchantPortalCommonControllerRef01DataRaw = Struct.items(Helpers.toMapAny(
        Struct.getpath(setup.data, "existing.merchant_portal_common_controller")));
    Map<String, Object> merchantPortalCommonControllerRef01Data = merchantPortalCommonControllerRef01DataRaw.isEmpty()
        ? null : Helpers.toMapAny(merchantPortalCommonControllerRef01DataRaw.get(0).get(1));

    // LOAD
    SdkEntity merchantPortalCommonControllerRef01Ent = client.merchantPortalCommonController(null);
    Map<String, Object> merchantPortalCommonControllerRef01MatchDt0 = new LinkedHashMap<>();
    Object merchantPortalCommonControllerRef01DataDt0Loaded = merchantPortalCommonControllerRef01Ent.load(merchantPortalCommonControllerRef01MatchDt0, null);
    assertNotNull(merchantPortalCommonControllerRef01DataDt0Loaded, "expected load result to be non-null");

  }

  static RunnerSupport.EntityTestSetup merchantPortalCommonControllerBasicSetup(Map<String, Object> extra) {
    RunnerSupport.loadEnvLocal();

    Map<String, Object> entityData;
    try {
      String entityDataSource = Files.readString(Path.of(
          "..", ".sdk", "test", "entity", "merchant_portal_common_controller", "MerchantPortalCommonControllerTestData.json"));
      entityData = Helpers.toMapAny(Json.parse(entityDataSource));
    }
    catch (Exception e) {
      throw new AssertionError("failed to read merchant_portal_common_controller test data: " + e.getMessage(), e);
    }

    Map<String, Object> options = new LinkedHashMap<>();
    options.put("entity", entityData.get("existing"));

    BluefinTecsMerchantPortalSDK client = BluefinTecsMerchantPortalSDK.testSDK(options, extra);

    // Generate idmap via transform, matching TS pattern.
    List<Object> idnames = new ArrayList<>();
    idnames.add("merchant_portal_common_controller01");
    idnames.add("merchant_portal_common_controller02");
    idnames.add("merchant_portal_common_controller03");
    Object idmap = Struct.transform(idnames, Json.parse(
        "{\"`$PACK`\": [\"\", {"
        + "\"`$KEY`\": \"`$COPY`\","
        + "\"`$VAL`\": [\"`$FORMAT`\", \"upper\", \"`$COPY`\"]"
        + "}]}"));

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against
    // synthetic IDs from the fixture and 4xx's. Surface this so the test
    // can skip.
    String entidEnvRaw = RunnerSupport.getenv("BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID");
    boolean idmapOverridden = entidEnvRaw != null
        && entidEnvRaw.trim().startsWith("{");

    Map<String, Object> envm = new LinkedHashMap<>();
    envm.put("BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID", idmap);
    envm.put("BLUEFINTECSMERCHANTPORTAL_TEST_LIVE", "FALSE");
    envm.put("BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN", "FALSE");
    Map<String, Object> env = RunnerSupport.envOverride(envm);

    Map<String, Object> idmapResolved = Helpers.toMapAny(env.get("BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID"));
    if (idmapResolved == null) {
      idmapResolved = Helpers.toMapAny(idmap);
    }

    boolean live = "TRUE".equals(env.get("BLUEFINTECSMERCHANTPORTAL_TEST_LIVE"));
    if (live) {
      Map<String, Object> liveOpts = new LinkedHashMap<>();
      Object mergedOpts = Struct.merge(Struct.jt(liveOpts, extra));
      client = new BluefinTecsMerchantPortalSDK(Helpers.toMapAny(mergedOpts));
    }

    RunnerSupport.EntityTestSetup setup = new RunnerSupport.EntityTestSetup();
    setup.client = client;
    setup.data = entityData;
    setup.idmap = idmapResolved;
    setup.env = env;
    setup.explain = "TRUE".equals(env.get("BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN"));
    setup.live = live;
    setup.syntheticOnly = live && !idmapOverridden;
    setup.now = System.currentTimeMillis();
    return setup;
  }
}
