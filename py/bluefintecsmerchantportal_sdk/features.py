# BluefinTecsMerchantPortal SDK feature factory

from bluefintecsmerchantportal_sdk.feature.base_feature import BluefinTecsMerchantPortalBaseFeature
from bluefintecsmerchantportal_sdk.feature.audit_feature import BluefinTecsMerchantPortalAuditFeature
from bluefintecsmerchantportal_sdk.feature.clienttrack_feature import BluefinTecsMerchantPortalClienttrackFeature
from bluefintecsmerchantportal_sdk.feature.idempotency_feature import BluefinTecsMerchantPortalIdempotencyFeature
from bluefintecsmerchantportal_sdk.feature.log_feature import BluefinTecsMerchantPortalLogFeature
from bluefintecsmerchantportal_sdk.feature.metrics_feature import BluefinTecsMerchantPortalMetricsFeature
from bluefintecsmerchantportal_sdk.feature.paging_feature import BluefinTecsMerchantPortalPagingFeature
from bluefintecsmerchantportal_sdk.feature.ratelimit_feature import BluefinTecsMerchantPortalRatelimitFeature
from bluefintecsmerchantportal_sdk.feature.retry_feature import BluefinTecsMerchantPortalRetryFeature
from bluefintecsmerchantportal_sdk.feature.telemetry_feature import BluefinTecsMerchantPortalTelemetryFeature
from bluefintecsmerchantportal_sdk.feature.test_feature import BluefinTecsMerchantPortalTestFeature
from bluefintecsmerchantportal_sdk.feature.timeout_feature import BluefinTecsMerchantPortalTimeoutFeature


_FEATURES = {
    "base": lambda: BluefinTecsMerchantPortalBaseFeature(),
    "audit": lambda: BluefinTecsMerchantPortalAuditFeature(),
    "clienttrack": lambda: BluefinTecsMerchantPortalClienttrackFeature(),
    "idempotency": lambda: BluefinTecsMerchantPortalIdempotencyFeature(),
    "log": lambda: BluefinTecsMerchantPortalLogFeature(),
    "metrics": lambda: BluefinTecsMerchantPortalMetricsFeature(),
    "paging": lambda: BluefinTecsMerchantPortalPagingFeature(),
    "ratelimit": lambda: BluefinTecsMerchantPortalRatelimitFeature(),
    "retry": lambda: BluefinTecsMerchantPortalRetryFeature(),
    "telemetry": lambda: BluefinTecsMerchantPortalTelemetryFeature(),
    "test": lambda: BluefinTecsMerchantPortalTestFeature(),
    "timeout": lambda: BluefinTecsMerchantPortalTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
