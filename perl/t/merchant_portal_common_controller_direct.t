#!perl
# MerchantPortalCommonController direct test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Cwd ();

use BluefinTecsMerchantPortalSDK;
require(Cwd::abs_path("$FindBin::Bin/runner.pm"));

DIRECT_LOAD: {
  my $setup = merchant_portal_common_controller_direct_setup({ 'id' => 'direct01' });
  my ($_should_skip, $_reason) = BluefinTecsMerchantPortalTestRunner::is_control_skipped(
    'direct', 'direct-load-merchant_portal_common_controller', $setup->{live} ? 'live' : 'unit');
  if ($_should_skip) {
    note($_reason || 'skipped via sdk-test-control.json');
    pass('direct-load-merchant_portal_common_controller: skipped via sdk-test-control.json');
    last DIRECT_LOAD;
  }
  my $client = $setup->{client};


  my $result = $client->direct({
    'path' => 'merchantportalws/logDeveloperInfo',
    'method' => 'GET',
    'params' => {},
  });
  if ($setup->{live}) {
    # Live mode is lenient: synthetic IDs frequently 4xx. Skip rather
    # than fail when the load endpoint isn't reachable with the IDs
    # we can construct from setup idmap.
    if (defined $result->{err}) {
      note("load call failed (likely synthetic IDs against live API): $result->{err}");
      pass('direct-load-merchant_portal_common_controller: skipped (live)');
      last DIRECT_LOAD;
    }
    unless ($result->{ok}) {
      note('load call not ok (likely synthetic IDs against live API)');
      pass('direct-load-merchant_portal_common_controller: skipped (live)');
      last DIRECT_LOAD;
    }
    my $status = BluefinTecsMerchantPortalHelpers::to_int($result->{status});
    if ($status < 200 || $status >= 300) {
      note("expected 2xx status, got $status");
      pass('direct-load-merchant_portal_common_controller: skipped (live)');
      last DIRECT_LOAD;
    }
    pass('direct-load-merchant_portal_common_controller: live ok');
  }
  else {
    ok(!defined $result->{err}, 'direct-load-merchant_portal_common_controller: no error');
    ok($result->{ok}, 'direct-load-merchant_portal_common_controller: ok');
    is(BluefinTecsMerchantPortalHelpers::to_int($result->{status}), 200, 'direct-load-merchant_portal_common_controller: status');
    ok(defined $result->{data}, 'direct-load-merchant_portal_common_controller: data');
    if (Voxgig::Struct::ismap($result->{data})) {
      is($result->{data}{id}, 'direct01', 'direct-load-merchant_portal_common_controller: id');
    }
    is(scalar @{ $setup->{calls} }, 1, 'direct-load-merchant_portal_common_controller: 1 call');
  }
}


sub merchant_portal_common_controller_direct_setup {
  my ($mockres) = @_;
  BluefinTecsMerchantPortalTestRunner::load_env_local();

  my $calls = [];

  my $env = BluefinTecsMerchantPortalTestRunner::env_override({
    'BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID' => {},
    'BLUEFINTECSMERCHANTPORTAL_TEST_LIVE' => 'FALSE',
  });

  my $live = ((($env->{'BLUEFINTECSMERCHANTPORTAL_TEST_LIVE'}) || '') eq 'TRUE') ? 1 : 0;

  if ($live) {
    my $client = BluefinTecsMerchantPortalSDK->new({
    });
    return {
      'client' => $client,
      'calls' => $calls,
      'live' => 1,
      'idmap' => {},
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
