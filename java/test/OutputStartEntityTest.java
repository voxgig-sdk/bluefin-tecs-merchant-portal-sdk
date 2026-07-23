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
public class OutputStartEntityTest {

  @Test
  public void instance() {
    BluefinTecsMerchantPortalSDK testsdk = BluefinTecsMerchantPortalSDK.testSDK();
    SdkEntity ent = testsdk.outputStart(null);
    assertNotNull(ent, "expected non-null output_start entity");
  }

  @Test
  public void basic() {
    RunnerSupport.EntityTestSetup setup = outputStartBasicSetup(null);
    // Per-op sdk-test-control.json skip — basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    String mode = setup.live ? "live" : "unit";
    for (String op : new String[] { "create" }) {
      String reason = RunnerSupport.skipReason("entityOp", "output_start." + op, mode);
      Assumptions.assumeTrue(reason == null,
          reason == null || "".equals(reason)
              ? "skipped via sdk-test-control.json" : reason);
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    Assumptions.assumeFalse(setup.syntheticOnly,
        "live entity test uses synthetic IDs from fixture — set BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_START_ENTID JSON to run live");
    BluefinTecsMerchantPortalSDK client = setup.client;

    // CREATE
    SdkEntity outputStartRef01Ent = client.outputStart(null);
    Map<String, Object> outputStartRef01Data = Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.output_start"), "output_start_ref01"));

    Object outputStartRef01DataResult = outputStartRef01Ent.create(outputStartRef01Data, null);
    outputStartRef01Data = Helpers.toMapAny(outputStartRef01DataResult);
    assertNotNull(outputStartRef01Data, "expected create result to be a map");
    assertNotNull(outputStartRef01Data.get("id"), "expected created entity to have an id");

  }

  static RunnerSupport.EntityTestSetup outputStartBasicSetup(Map<String, Object> extra) {
    RunnerSupport.loadEnvLocal();

    Map<String, Object> entityData;
    try {
      String entityDataSource = Files.readString(Path.of(
          "..", ".sdk", "test", "entity", "output_start", "OutputStartTestData.json"));
      entityData = Helpers.toMapAny(Json.parse(entityDataSource));
    }
    catch (Exception e) {
      throw new AssertionError("failed to read output_start test data: " + e.getMessage(), e);
    }

    Map<String, Object> options = new LinkedHashMap<>();
    options.put("entity", entityData.get("existing"));

    BluefinTecsMerchantPortalSDK client = BluefinTecsMerchantPortalSDK.testSDK(options, extra);

    // Generate idmap via transform, matching TS pattern.
    List<Object> idnames = new ArrayList<>();
    idnames.add("output_start01");
    idnames.add("output_start02");
    idnames.add("output_start03");
    Object idmap = Struct.transform(idnames, Json.parse(
        "{\"`$PACK`\": [\"\", {"
        + "\"`$KEY`\": \"`$COPY`\","
        + "\"`$VAL`\": [\"`$FORMAT`\", \"upper\", \"`$COPY`\"]"
        + "}]}"));

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against
    // synthetic IDs from the fixture and 4xx's. Surface this so the test
    // can skip.
    String entidEnvRaw = RunnerSupport.getenv("BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_START_ENTID");
    boolean idmapOverridden = entidEnvRaw != null
        && entidEnvRaw.trim().startsWith("{");

    Map<String, Object> envm = new LinkedHashMap<>();
    envm.put("BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_START_ENTID", idmap);
    envm.put("BLUEFINTECSMERCHANTPORTAL_TEST_LIVE", "FALSE");
    envm.put("BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN", "FALSE");
    Map<String, Object> env = RunnerSupport.envOverride(envm);

    Map<String, Object> idmapResolved = Helpers.toMapAny(env.get("BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_START_ENTID"));
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
