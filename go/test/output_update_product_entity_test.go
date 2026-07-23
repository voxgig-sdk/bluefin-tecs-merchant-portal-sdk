package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/go"
	"github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/go/core"

	vs "github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/go/utility/struct"
)

func TestOutputUpdateProductEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.OutputUpdateProduct(nil)
		if ent == nil {
			t.Fatal("expected non-nil OutputUpdateProductEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := output_update_productBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"create"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "output_update_product." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_UPDATE_PRODUCT_ENTID JSON to run live")
			return
		}
		client := setup.client

		// CREATE
		outputUpdateProductRef01Ent := client.OutputUpdateProduct(nil)
		outputUpdateProductRef01Data := core.ToMapAny(vs.GetProp(
			vs.GetPath([]any{"new", "output_update_product"}, setup.data), "output_update_product_ref01"))

		outputUpdateProductRef01DataResult, err := outputUpdateProductRef01Ent.Create(outputUpdateProductRef01Data, nil)
		if err != nil {
			t.Fatalf("create failed: %v", err)
		}
		outputUpdateProductRef01Data = core.ToMapAny(outputUpdateProductRef01DataResult)
		if outputUpdateProductRef01Data == nil {
			t.Fatal("expected create result to be a map")
		}

	})
}

func output_update_productBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "output_update_product", "OutputUpdateProductTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read output_update_product test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse output_update_product test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"output_update_product01", "output_update_product02", "output_update_product03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_UPDATE_PRODUCT_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_UPDATE_PRODUCT_ENTID": idmap,
		"BLUEFINTECSMERCHANTPORTAL_TEST_LIVE":      "FALSE",
		"BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN":   "FALSE",
	})

	idmapResolved := core.ToMapAny(env["BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_UPDATE_PRODUCT_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["BLUEFINTECSMERCHANTPORTAL_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
			},
			extra,
		})
		client = sdk.NewBluefinTecsMerchantPortalSDK(core.ToMapAny(mergedOpts))
	}

	live := env["BLUEFINTECSMERCHANTPORTAL_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
