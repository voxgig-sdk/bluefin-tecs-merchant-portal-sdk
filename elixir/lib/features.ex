# BluefinTecsMerchantPortal SDK feature factory

defmodule BluefinTecsMerchantPortal.Features do
  def make_feature(name) do
    case name do
      "audit" -> BluefinTecsMerchantPortal.Feature.Audit.new()
      "clienttrack" -> BluefinTecsMerchantPortal.Feature.Clienttrack.new()
      "idempotency" -> BluefinTecsMerchantPortal.Feature.Idempotency.new()
      "log" -> BluefinTecsMerchantPortal.Feature.Log.new()
      "metrics" -> BluefinTecsMerchantPortal.Feature.Metrics.new()
      "paging" -> BluefinTecsMerchantPortal.Feature.Paging.new()
      "ratelimit" -> BluefinTecsMerchantPortal.Feature.Ratelimit.new()
      "retry" -> BluefinTecsMerchantPortal.Feature.Retry.new()
      "telemetry" -> BluefinTecsMerchantPortal.Feature.Telemetry.new()
      "test" -> BluefinTecsMerchantPortal.Feature.Test.new()
      "timeout" -> BluefinTecsMerchantPortal.Feature.Timeout.new()
      _ -> BluefinTecsMerchantPortal.Feature.new()
    end
  end
end
