// output_detail entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinTecsMerchantPortalSdk.Test;

public class OutputDetailEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinTecsMerchantPortalSDK.TestSDK(null, null);
        var ent = testsdk.OutputDetail();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = OutputDetailBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "load" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "output_detail." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_DETAIL_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // Bootstrap entity data from existing test data (no create step in flow).
        var outputDetailRef01DataRaw = StructUtils.Items(
            Helpers.ToMapAny(StructUtils.GetPath(setup.Data, "existing.output_detail")));
        var outputDetailRef01Data = outputDetailRef01DataRaw.Count > 0
            ? Helpers.ToMapAny(outputDetailRef01DataRaw[0][1])
            : null;

        // LOAD
        var outputDetailRef01Ent = client.OutputDetail();
        var outputDetailRef01MatchDt0 = new Dictionary<string, object?>
        {
            ["id"] = outputDetailRef01Data!["id"],
        };
        var outputDetailRef01DataDt0Loaded = outputDetailRef01Ent.Load(outputDetailRef01MatchDt0, null);
        var outputDetailRef01DataDt0LoadResult = Helpers.ToMapAny(outputDetailRef01DataDt0Loaded is IEntity le ? le.Data() : outputDetailRef01DataDt0Loaded);
        Assert.True(outputDetailRef01DataDt0LoadResult != null, "expected load result to be a map");
        Assert.True(StructRunner.DeepEqual(outputDetailRef01DataDt0LoadResult!["id"], outputDetailRef01Data["id"]),
            "expected load result id to match");

    }

    private static EntityTestSetup OutputDetailBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "output_detail",
            "OutputDetailTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse output_detail test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinTecsMerchantPortalSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "output_detail01", "output_detail02", "output_detail03" },
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
            "BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_DETAIL_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_DETAIL_ENTID"] = idmap,
            ["BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE"] = "FALSE",
            ["BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN"] = "FALSE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_DETAIL_ENTID"])
            ?? Helpers.ToMapAny(idmap)
            ?? new Dictionary<string, object?>();

        if (Equals(env["BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE"], "TRUE"))
        {
            // 'extra ?? new ...', not a bare 'extra': Merge returns null when
            // the last entry is null, and BasicSetup is normally called with no
            // argument at all - so a bare 'extra' silently discarded the apikey
            // and server values above and handed the SDK null.
            var extraOpts = extra ?? new Dictionary<string, object?>();
            var mergedOpts = StructUtils.Merge(new List<object?>
            {
                // FIRST, so the generated fields below win: sdk-test-control.json's
                // test.client.options adds to the live client, it does not redirect it.
                TestRunner.LiveClientOptions(),
                new Dictionary<string, object?>
                {
                },
                extraOpts,
            });
            client = new BluefinTecsMerchantPortalSDK(Helpers.ToMapAny(mergedOpts));
        }

        var live = Equals(env["BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE"], "TRUE");
        return new EntityTestSetup
        {
            Client = client,
            Data = entityData,
            Idmap = idmapResolved,
            Env = env,
            Explain = Equals(env["BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN"], "TRUE"),
            Live = live,
            SyntheticOnly = live && !idmapOverridden,
            Now = DateTimeOffset.UtcNow.ToUnixTimeMilliseconds(),
        };
    }
}
