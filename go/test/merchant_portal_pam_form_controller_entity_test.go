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

func TestMerchantPortalPamFormControllerEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.MerchantPortalPamFormController(nil)
		if ent == nil {
			t.Fatal("expected non-nil MerchantPortalPamFormControllerEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := merchant_portal_pam_form_controllerBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"create"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "merchant_portal_pam_form_controller." + _op, _mode); _shouldSkip {
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
			t.Skip("live entity test uses synthetic IDs from fixture — set BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_FORM_CONTROLLER_ENTID JSON to run live")
			return
		}
		client := setup.client

		// CREATE
		merchantPortalPamFormControllerRef01Ent := client.MerchantPortalPamFormController(nil)
		merchantPortalPamFormControllerRef01Data := core.ToMapAny(vs.GetProp(
			vs.GetPath([]any{"new", "merchant_portal_pam_form_controller"}, setup.data), "merchant_portal_pam_form_controller_ref01"))

		merchantPortalPamFormControllerRef01DataResult, err := merchantPortalPamFormControllerRef01Ent.Create(merchantPortalPamFormControllerRef01Data, nil)
		if err != nil {
			t.Fatalf("create failed: %v", err)
		}
		merchantPortalPamFormControllerRef01Data = core.ToMapAny(merchantPortalPamFormControllerRef01DataResult)
		if merchantPortalPamFormControllerRef01Data == nil {
			t.Fatal("expected create result to be a map")
		}

	})
}

func merchant_portal_pam_form_controllerBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "merchant_portal_pam_form_controller", "MerchantPortalPamFormControllerTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read merchant_portal_pam_form_controller test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse merchant_portal_pam_form_controller test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"merchant_portal_pam_form_controller01", "merchant_portal_pam_form_controller02", "merchant_portal_pam_form_controller03"},
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
	entidEnvRaw := os.Getenv("BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_FORM_CONTROLLER_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_FORM_CONTROLLER_ENTID": idmap,
		"BLUEFINTECSMERCHANTPORTAL_TEST_LIVE":      "FALSE",
		"BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN":   "FALSE",
	})

	idmapResolved := core.ToMapAny(env["BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_FORM_CONTROLLER_ENTID"])
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
