#!perl
# OutputStart entity test

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

{
  my $testsdk = BluefinTecsMerchantPortalSDK->test(undef, undef);
  my $ent = $testsdk->OutputStart(undef);
  ok(defined $ent, 'output_start: create instance');
}

SKIP: {
  skip('feature not present in this SDK: validate', 1)
    unless BluefinTecsMerchantPortalConfig::shared_config()->{feature}{validate};
  my $client = BluefinTecsMerchantPortalSDK->test(undef, { feature => { validate => { active => 1 } } });
  my $err = eval { $client->OutputStart(undef)->create({ 'id' => 1, 'responseCode' => 1, 'responseMessage' => 'x' }, undef); undef } // $@;
  is(ref $err ? $err->{code} : undef, 'validate_failed',
    'output_start: an invalid request fails with validate_failed');
}

BASIC_FLOW: {
  my $setup = output_start_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op (('create')) {
    my ($_should_skip, $_reason) = BluefinTecsMerchantPortalTestRunner::is_control_skipped(
      'entityOp', "output_start." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('output_start: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  my $client = $setup->{client};
  my %V;

  # CREATE
  $V{output_start_ref01_ent} = $client->OutputStart(undef);
  $V{output_start_ref01_data} = BluefinTecsMerchantPortalHelpers::to_map(BluefinTecsMerchantPortalHelpers::gp(
    BluefinTecsMerchantPortalHelpers::gpath($setup->{data}, 'new.output_start'), 'output_start_ref01'));

  $V{output_start_ref01_data_result} = $V{output_start_ref01_ent}->create($V{output_start_ref01_data}, undef);
  $V{output_start_ref01_data} = BluefinTecsMerchantPortalHelpers::to_map(ref($V{output_start_ref01_data_result}) && $V{output_start_ref01_data_result}->can('data_get') ? $V{output_start_ref01_data_result}->data_get : $V{output_start_ref01_data_result});
  ok(defined $V{output_start_ref01_data}, 'output_start create: data');
  ok(defined $V{output_start_ref01_data}{id}, 'output_start create: id');

}

sub output_start_basic_setup {
  my ($extra) = @_;
  BluefinTecsMerchantPortalTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/output_start/OutputStartTestData.json");
  my $entity_data = do {
    open my $fh, '<:raw', $entity_data_file or die "Cannot open $entity_data_file: $!";
    local $/;
    Voxgig::Struct::parse_json(<$fh>);
  };

  my $options = {};
  $options->{entity} = $entity_data->{existing};

  my $client = BluefinTecsMerchantPortalSDK->test($options, $extra);

  # Generate idmap via transform.
  my $idmap = Voxgig::Struct::transform(
    ['output_start01', 'output_start02', 'output_start03'],
    {
      '`$PACK`' => ['', {
        '`$KEY`' => '`$COPY`',
        '`$VAL`' => ['`$FORMAT`', 'upper', '`$COPY`'],
      }],
    }
  );

  # Whether *_ENTID supplied the idmap, read before env_override consumes
  # it: without it, the ids a live flow binds are the fixture's synthetic ones.
  my $entid_env_raw = $ENV{'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_START_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinTecsMerchantPortalTestRunner::env_override({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_START_ENTID' => $idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE' => 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN' => 'FALSE',
  });

  my $idmap_resolved = BluefinTecsMerchantPortalHelpers::to_map($env->{'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_START_ENTID'});
  if (!defined $idmap_resolved) {
    $idmap_resolved = BluefinTecsMerchantPortalHelpers::to_map($idmap);
  }

  if ((($env->{'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'}) || '') eq 'TRUE') {
    my $merged_opts = Voxgig::Struct::merge([
      # FIRST, so the generated fields below win: sdk-test-control.json's
      # test.client.options adds to the live client, it does not redirect it.
      BluefinTecsMerchantPortalTestRunner::live_client_options(),
      {
      },
      (Voxgig::Struct::ismap($extra) ? $extra : {}),
    ]);
    $client = BluefinTecsMerchantPortalSDK->new(BluefinTecsMerchantPortalHelpers::to_map($merged_opts));
  }

  my $live = ((($env->{'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'}) || '') eq 'TRUE') ? 1 : 0;
  return {
    'client' => $client,
    'data' => $entity_data,
    'idmap' => $idmap_resolved,
    'env' => $env,
    'explain' => ((($env->{'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN'}) || '') eq 'TRUE') ? 1 : 0,
    'live' => $live,
    'synthetic_only' => ($live && !$idmap_overridden) ? 1 : 0,
    'now' => BluefinTecsMerchantPortalHelpers::now_ms(),
  };
}

done_testing();
