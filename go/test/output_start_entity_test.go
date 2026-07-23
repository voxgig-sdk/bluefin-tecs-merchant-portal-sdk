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

func TestOutputStartEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.OutputStart(nil)
		if ent == nil {
			t.Fatal("expected non-nil OutputStartEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := output_startBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"create"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "output_start." + _op, _mode); _shouldSkip {
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
			t.Skip("live entity test uses synthetic IDs from fixture — set BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_START_ENTID JSON to run live")
			return
		}
		client := setup.client

		// CREATE
		outputStartRef01Ent := client.OutputStart(nil)
		outputStartRef01Data := core.ToMapAny(vs.GetProp(
			vs.GetPath([]any{"new", "output_start"}, setup.data), "output_start_ref01"))

		outputStartRef01DataResult, err := outputStartRef01Ent.Create(outputStartRef01Data, nil)
		if err != nil {
			t.Fatalf("create failed: %v", err)
		}
		outputStartRef01Data = core.ToMapAny(outputStartRef01DataResult)
		if outputStartRef01Data == nil {
			t.Fatal("expected create result to be a map")
		}
		if outputStartRef01Data["id"] == nil {
			t.Fatal("expected created entity to have an id")
		}

	})
}

func output_startBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "output_start", "OutputStartTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read output_start test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse output_start test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"output_start01", "output_start02", "output_start03"},
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
	entidEnvRaw := os.Getenv("BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_START_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_START_ENTID": idmap,
		"BLUEFINTECSMERCHANTPORTAL_TEST_LIVE":      "FALSE",
		"BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN":   "FALSE",
	})

	idmapResolved := core.ToMapAny(env["BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_START_ENTID"])
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
