<?php
declare(strict_types=1);

// BluefinTecsMerchantPortal SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/AuditFeature.php';
require_once __DIR__ . '/feature/ClienttrackFeature.php';
require_once __DIR__ . '/feature/IdempotencyFeature.php';
require_once __DIR__ . '/feature/LogFeature.php';
require_once __DIR__ . '/feature/MetricsFeature.php';
require_once __DIR__ . '/feature/PagingFeature.php';
require_once __DIR__ . '/feature/RatelimitFeature.php';
require_once __DIR__ . '/feature/RetryFeature.php';
require_once __DIR__ . '/feature/TelemetryFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';
require_once __DIR__ . '/feature/TimeoutFeature.php';


class BluefinTecsMerchantPortalFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new BluefinTecsMerchantPortalBaseFeature();
            case "audit":
                return new BluefinTecsMerchantPortalAuditFeature();
            case "clienttrack":
                return new BluefinTecsMerchantPortalClienttrackFeature();
            case "idempotency":
                return new BluefinTecsMerchantPortalIdempotencyFeature();
            case "log":
                return new BluefinTecsMerchantPortalLogFeature();
            case "metrics":
                return new BluefinTecsMerchantPortalMetricsFeature();
            case "paging":
                return new BluefinTecsMerchantPortalPagingFeature();
            case "ratelimit":
                return new BluefinTecsMerchantPortalRatelimitFeature();
            case "retry":
                return new BluefinTecsMerchantPortalRetryFeature();
            case "telemetry":
                return new BluefinTecsMerchantPortalTelemetryFeature();
            case "test":
                return new BluefinTecsMerchantPortalTestFeature();
            case "timeout":
                return new BluefinTecsMerchantPortalTimeoutFeature();
            default:
                return new BluefinTecsMerchantPortalBaseFeature();
        }
    }

    /**
     * Does a generated feature class back this name? False for a name only
     * an options extend instance can supply (the station adopt path) - the
     * constructor uses this to skip make_feature for such names instead of
     * adding a stray BaseFeature.
     */
    public static function has_feature(string $name): bool
    {
        switch ($name) {
            case "base":
            case "audit":
            case "clienttrack":
            case "idempotency":
            case "log":
            case "metrics":
            case "paging":
            case "ratelimit":
            case "retry":
            case "telemetry":
            case "test":
            case "timeout":
                return true;
            default:
                return false;
        }
    }
}
