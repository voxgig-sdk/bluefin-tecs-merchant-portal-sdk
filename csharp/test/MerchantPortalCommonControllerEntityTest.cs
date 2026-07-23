// merchant_portal_common_controller entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinTecsMerchantPortalSdk.Test;

public class MerchantPortalCommonControllerEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinTecsMerchantPortalSDK.TestSDK(null, null);
        var ent = testsdk.MerchantPortalCommonController();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = MerchantPortalCommonControllerBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "load" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "merchant_portal_common_controller." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // Bootstrap entity data from existing test data (no create step in flow).
        var merchantPortalCommonControllerRef01DataRaw = StructUtils.Items(
            Helpers.ToMapAny(StructUtils.GetPath(setup.Data, "existing.merchant_portal_common_controller")));
        var merchantPortalCommonControllerRef01Data = merchantPortalCommonControllerRef01DataRaw.Count > 0
            ? Helpers.ToMapAny(merchantPortalCommonControllerRef01DataRaw[0][1])
            : null;

        // LOAD
        var merchantPortalCommonControllerRef01Ent = client.MerchantPortalCommonController();
        var merchantPortalCommonControllerRef01MatchDt0 = new Dictionary<string, object?>();
        var merchantPortalCommonControllerRef01DataDt0Loaded = merchantPortalCommonControllerRef01Ent.Load(merchantPortalCommonControllerRef01MatchDt0, null);
        Assert.True(merchantPortalCommonControllerRef01DataDt0Loaded != null, "expected load result to be non-null");

    }

    private static EntityTestSetup MerchantPortalCommonControllerBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "merchant_portal_common_controller",
            "MerchantPortalCommonControllerTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse merchant_portal_common_controller test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinTecsMerchantPortalSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "merchant_portal_common_controller01", "merchant_portal_common_controller02", "merchant_portal_common_controller03" },
            new Dictionary<string, object?>
            {
                ["`$PACK`"] = new List<object?>
                {
                    "",
                    new Dictionary<string, object?>
                    {
                        ["`$KEY`"] = "`$COPY`",
                        ["`$VAL`"] = new List<object?> { "`$FORMAT`", "upper", "`$COPY`" },
                    },
                },
            });

        // Detect ENTID env override before EnvOverride consumes it. When
        // live mode is on without a real override, the basic test runs
        // against synthetic IDs from the fixture and 4xx's.
        var entidEnvRaw = Environment.GetEnvironmentVariable(
            "BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID"] = idmap,
            ["BLUEFINTECSMERCHANTPORTAL_TEST_LIVE"] = "FALSE",
            ["BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN"] = "FALSE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID"])
            ?? Helpers.ToMapAny(idmap)
            ?? new Dictionary<string, object?>();

        if (Equals(env["BLUEFINTECSMERCHANTPORTAL_TEST_LIVE"], "TRUE"))
        {
            var mergedOpts = StructUtils.Merge(new List<object?>
            {
                new Dictionary<string, object?>
                {
                },
                extra,
            });
            client = new BluefinTecsMerchantPortalSDK(Helpers.ToMapAny(mergedOpts));
        }

        var live = Equals(env["BLUEFINTECSMERCHANTPORTAL_TEST_LIVE"], "TRUE");
        return new EntityTestSetup
        {
            Client = client,
            Data = entityData,
            Idmap = idmapResolved,
            Env = env,
            Explain = Equals(env["BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN"], "TRUE"),
            Live = live,
            SyntheticOnly = live && !idmapOverridden,
            Now = DateTimeOffset.UtcNow.ToUnixTimeMilliseconds(),
        };
    }
}
