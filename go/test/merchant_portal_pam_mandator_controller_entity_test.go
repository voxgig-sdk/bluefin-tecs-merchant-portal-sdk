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

func TestMerchantPortalPamMandatorControllerEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.MerchantPortalPamMandatorController(nil)
		if ent == nil {
			t.Fatal("expected non-nil MerchantPortalPamMandatorControllerEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := merchant_portal_pam_mandator_controllerBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"create"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "merchant_portal_pam_mandator_controller." + _op, _mode); _shouldSkip {
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
			t.Skip("live entity test uses synthetic IDs from fixture — set BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_MANDATOR_CONTROLLER_ENTID JSON to run live")
			return
		}
		client := setup.client

		// CREATE
		merchantPortalPamMandatorControllerRef01Ent := client.MerchantPortalPamMandatorController(nil)
		merchantPortalPamMandatorControllerRef01Data := core.ToMapAny(vs.GetProp(
			vs.GetPath([]any{"new", "merchant_portal_pam_mandator_controller"}, setup.data), "merchant_portal_pam_mandator_controller_ref01"))

		merchantPortalPamMandatorControllerRef01DataResult, err := merchantPortalPamMandatorControllerRef01Ent.Create(merchantPortalPamMandatorControllerRef01Data, nil)
		if err != nil {
			t.Fatalf("create failed: %v", err)
		}
		merchantPortalPamMandatorControllerRef01Data = core.ToMapAny(merchantPortalPamMandatorControllerRef01DataResult)
		if merchantPortalPamMandatorControllerRef01Data == nil {
			t.Fatal("expected create result to be a map")
		}

	})
}

func merchant_portal_pam_mandator_controllerBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "merchant_portal_pam_mandator_controller", "MerchantPortalPamMandatorControllerTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read merchant_portal_pam_mandator_controller test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse merchant_portal_pam_mandator_controller test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"merchant_portal_pam_mandator_controller01", "merchant_portal_pam_mandator_controller02", "merchant_portal_pam_mandator_controller03"},
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
	entidEnvRaw := os.Getenv("BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_MANDATOR_CONTROLLER_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_MANDATOR_CONTROLLER_ENTID": idmap,
		"BLUEFINTECSMERCHANTPORTAL_TEST_LIVE":      "FALSE",
		"BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN":   "FALSE",
	})

	idmapResolved := core.ToMapAny(env["BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_MANDATOR_CONTROLLER_ENTID"])
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
