# BluefinTecsMerchantPortal SDK feature factory

use strict;
use warnings;

use File::Basename ();
use Cwd ();

my $__dir;
BEGIN { $__dir = File::Basename::dirname(Cwd::abs_path(__FILE__)) }
require(Cwd::abs_path("$__dir/feature/base_feature.pm"));
require(Cwd::abs_path("$__dir/feature/audit_feature.pm"));
require(Cwd::abs_path("$__dir/feature/clienttrack_feature.pm"));
require(Cwd::abs_path("$__dir/feature/idempotency_feature.pm"));
require(Cwd::abs_path("$__dir/feature/log_feature.pm"));
require(Cwd::abs_path("$__dir/feature/metrics_feature.pm"));
require(Cwd::abs_path("$__dir/feature/paging_feature.pm"));
require(Cwd::abs_path("$__dir/feature/ratelimit_feature.pm"));
require(Cwd::abs_path("$__dir/feature/retry_feature.pm"));
require(Cwd::abs_path("$__dir/feature/telemetry_feature.pm"));
require(Cwd::abs_path("$__dir/feature/test_feature.pm"));
require(Cwd::abs_path("$__dir/feature/timeout_feature.pm"));

package BluefinTecsMerchantPortalFeatures;

sub make_feature {
  my ($name) = @_;
  $name = '' unless defined $name;
  return BluefinTecsMerchantPortalBaseFeature->new if 'base' eq $name;
  return BluefinTecsMerchantPortalAuditFeature->new if 'audit' eq $name;
  return BluefinTecsMerchantPortalClienttrackFeature->new if 'clienttrack' eq $name;
  return BluefinTecsMerchantPortalIdempotencyFeature->new if 'idempotency' eq $name;
  return BluefinTecsMerchantPortalLogFeature->new if 'log' eq $name;
  return BluefinTecsMerchantPortalMetricsFeature->new if 'metrics' eq $name;
  return BluefinTecsMerchantPortalPagingFeature->new if 'paging' eq $name;
  return BluefinTecsMerchantPortalRatelimitFeature->new if 'ratelimit' eq $name;
  return BluefinTecsMerchantPortalRetryFeature->new if 'retry' eq $name;
  return BluefinTecsMerchantPortalTelemetryFeature->new if 'telemetry' eq $name;
  return BluefinTecsMerchantPortalTestFeature->new if 'test' eq $name;
  return BluefinTecsMerchantPortalTimeoutFeature->new if 'timeout' eq $name;
  return BluefinTecsMerchantPortalBaseFeature->new;
}

1;
