#!perl
# OutputStatus direct test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Cwd ();

use BluefinTecsMerchantPortalSDK;
require(Cwd::abs_path("$FindBin::Bin/runner.pm"));

# main.kit.test.live.strict is true (the default is true): a live
# request that fails, or a live test missing an input it needs,
# fails the test.
# An account with no record for a test to read skips it either way.
use constant LIVE_STRICT => 1;

sub live_ok {
  my ($result) = @_;
  my $status = BluefinTecsMerchantPortalHelpers::to_int($result->{status});
  return !defined $result->{err} && $result->{ok} && $status >= 200 && $status < 300;
}

DIRECT_LOAD: {
  my $setup = output_status_direct_setup({ 'id' => 'direct01' });
  my ($_should_skip, $_reason) = BluefinTecsMerchantPortalTestRunner::is_control_skipped(
    'direct', 'direct-load-output_status', $setup->{live} ? 'live' : 'unit');
  if ($_should_skip) {
    note($_reason || 'skipped via sdk-test-control.json');
    pass('direct-load-output_status: skipped via sdk-test-control.json');
    last DIRECT_LOAD;
  }
  if ($setup->{live}) {
    my @missing = grep { !defined $setup->{idmap}{$_} } ('output_status01');
    if (@missing) {
      BluefinTecsMerchantPortalTestRunner::live_miss(LIVE_STRICT, 'direct-load-output_status', 'Live test blocked: needs ' . join(', ', @missing) . ' via BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_STATUS_ENTID');
      last DIRECT_LOAD;
    }
  }
  my $client = $setup->{client};

  my $params = {};
  my $query = {};
  if ($setup->{live}) {
    $params->{'id'} = $setup->{idmap}{'output_status01'};
  }
  else {
    $params->{'id'} = 'direct01';
  }

  my $result = $client->direct({
    'path' => 'merchantportalws/batch/registerAdditionalTerminal/status/{id}',
    'method' => 'GET',
    'params' => $params,
    'query' => $query,
  });
  if ($setup->{live}) {
    if (!live_ok($result)) {
      BluefinTecsMerchantPortalTestRunner::live_miss(LIVE_STRICT, 'direct-load-output_status', 'Live load failed: ' . BluefinTecsMerchantPortalTestRunner::live_describe($result));
      last DIRECT_LOAD;
    }
    if (!defined $result->{data}) {
      BluefinTecsMerchantPortalTestRunner::live_miss(LIVE_STRICT, 'direct-load-output_status', 'Live load returned no data: ' . BluefinTecsMerchantPortalTestRunner::live_describe($result));
      last DIRECT_LOAD;
    }
    pass('direct-load-output_status: live ok');
  }
  else {
    ok(!defined $result->{err}, 'direct-load-output_status: no error');
    ok($result->{ok}, 'direct-load-output_status: ok');
    is(BluefinTecsMerchantPortalHelpers::to_int($result->{status}), 200, 'direct-load-output_status: status');
    ok(defined $result->{data}, 'direct-load-output_status: data');
    if (Voxgig::Struct::ismap($result->{data})) {
      is($result->{data}{id}, 'direct01', 'direct-load-output_status: id');
    }
    is(scalar @{ $setup->{calls} }, 1, 'direct-load-output_status: 1 call');
  }
}


sub output_status_direct_setup {
  my ($mockres) = @_;
  BluefinTecsMerchantPortalTestRunner::load_env_local();

  my $calls = [];

  my $env = BluefinTecsMerchantPortalTestRunner::env_override({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_STATUS_ENTID' => {},
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE' => 'FALSE',
  });

  my $live = ((($env->{'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'}) || '') eq 'TRUE') ? 1 : 0;

  if ($live) {
    # live_client_options() FIRST so the generated fields below win:
    # sdk-test-control.json's test.client.options adds to the live client,
    # it does not redirect it (a later key wins in a Perl hash literal).
    my $client = BluefinTecsMerchantPortalSDK->new({
      %{ BluefinTecsMerchantPortalTestRunner::live_client_options() },
    });
    my $idmap = $env->{'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_STATUS_ENTID'};
    return {
      'client' => $client,
      'calls' => $calls,
      'live' => 1,
      'idmap' => ref $idmap eq 'HASH' ? $idmap : {},
    };
  }

  my $mock_fetch = sub {
    my ($url, $init) = @_;
    push @$calls, { 'url' => $url, 'init' => $init };
    return ({
      'status' => 200,
      'statusText' => 'OK',
      'headers' => {},
      'json' => sub {
        return defined $mockres ? $mockres : { 'id' => 'direct01' };
      },
      'body' => 'mock',
    }, undef);
  };

  my $client = BluefinTecsMerchantPortalSDK->new({
    'base' => 'http://localhost:8080',
    'system' => {
      'fetch' => $mock_fetch,
    },
  });

  return {
    'client' => $client,
    'calls' => $calls,
    'live' => 0,
    'idmap' => {},
  };
}

done_testing();
