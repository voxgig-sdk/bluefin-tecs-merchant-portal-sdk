# BluefinTecsMerchantPortal SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/audit_feature'
require_relative 'feature/clienttrack_feature'
require_relative 'feature/debug_feature'
require_relative 'feature/idempotency_feature'
require_relative 'feature/log_feature'
require_relative 'feature/metrics_feature'
require_relative 'feature/paging_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/telemetry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module BluefinTecsMerchantPortalFeatures
  def self.make_feature(name)
    case name
    when "base"
      BluefinTecsMerchantPortalBaseFeature.new
    when "audit"
      BluefinTecsMerchantPortalAuditFeature.new
    when "clienttrack"
      BluefinTecsMerchantPortalClienttrackFeature.new
    when "debug"
      BluefinTecsMerchantPortalDebugFeature.new
    when "idempotency"
      BluefinTecsMerchantPortalIdempotencyFeature.new
    when "log"
      BluefinTecsMerchantPortalLogFeature.new
    when "metrics"
      BluefinTecsMerchantPortalMetricsFeature.new
    when "paging"
      BluefinTecsMerchantPortalPagingFeature.new
    when "ratelimit"
      BluefinTecsMerchantPortalRatelimitFeature.new
    when "retry"
      BluefinTecsMerchantPortalRetryFeature.new
    when "telemetry"
      BluefinTecsMerchantPortalTelemetryFeature.new
    when "test"
      BluefinTecsMerchantPortalTestFeature.new
    when "timeout"
      BluefinTecsMerchantPortalTimeoutFeature.new
    else
      BluefinTecsMerchantPortalBaseFeature.new
    end
  end
end
