<?php
declare(strict_types=1);

// MerchantPortalPamFormController entity test

require_once __DIR__ . '/../bluefintecsmerchantportal_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class MerchantPortalPamFormControllerEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = BluefinTecsMerchantPortalSDK::test(null, null);
        $ent = $testsdk->MerchantPortalPamFormController(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = merchant_portal_pam_form_controller_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["create"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "merchant_portal_pam_form_controller." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_FORM_CONTROLLER_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // CREATE
        $merchant_portal_pam_form_controller_ref01_ent = $client->MerchantPortalPamFormController(null);
        $merchant_portal_pam_form_controller_ref01_data = Helpers::to_map(Vs::getprop(
            Vs::getpath($setup["data"], "new.merchant_portal_pam_form_controller"), "merchant_portal_pam_form_controller_ref01"));

        $merchant_portal_pam_form_controller_ref01_data_result = $merchant_portal_pam_form_controller_ref01_ent->create($merchant_portal_pam_form_controller_ref01_data, null);
        $merchant_portal_pam_form_controller_ref01_data = Helpers::to_map($merchant_portal_pam_form_controller_ref01_data_result);
        $this->assertNotNull($merchant_portal_pam_form_controller_ref01_data);

    }
}

function merchant_portal_pam_form_controller_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/merchant_portal_pam_form_controller/MerchantPortalPamFormControllerTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = BluefinTecsMerchantPortalSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["merchant_portal_pam_form_controller01", "merchant_portal_pam_form_controller02", "merchant_portal_pam_form_controller03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_FORM_CONTROLLER_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_FORM_CONTROLLER_ENTID" => $idmap,
        "BLUEFINTECSMERCHANTPORTAL_TEST_LIVE" => "FALSE",
        "BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN" => "FALSE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_FORM_CONTROLLER_ENTID"]);
    if ($idmap_resolved === null) {
        $idmap_resolved = Helpers::to_map($idmap);
    }

    if ($env["BLUEFINTECSMERCHANTPORTAL_TEST_LIVE"] === "TRUE") {
        $merged_opts = Vs::merge([
            [
            ],
            $extra ?? [],
        ]);
        $client = new BluefinTecsMerchantPortalSDK(Helpers::to_map($merged_opts));
    }

    $live = $env["BLUEFINTECSMERCHANTPORTAL_TEST_LIVE"] === "TRUE";
    return [
        "client" => $client,
        "data" => $entity_data,
        "idmap" => $idmap_resolved,
        "env" => $env,
        "explain" => $env["BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN"] === "TRUE",
        "live" => $live,
        "synthetic_only" => $live && !$idmap_overridden,
        "now" => (int)(microtime(true) * 1000),
    ];
}
