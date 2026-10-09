#!perl
# OutputMessage entity test

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
  my $ent = $testsdk->OutputMessage(undef);
  ok(defined $ent, 'output_message: create instance');
}

SKIP: {
  skip('feature not present in this SDK: validate', 1)
    unless BluefinTecsMerchantPortalConfig::shared_config()->{feature}{validate};
  my $client = BluefinTecsMerchantPortalSDK->test(undef, { feature => { validate => { active => 1 } } });
  my $err = eval { $client->OutputMessage(undef)->load({ 'id' => 1 }, undef); undef } // $@;
  is(ref $err ? $err->{code} : undef, 'validate_failed',
    'output_message: an invalid request fails with validate_failed');
}

BASIC_FLOW: {
  my $setup = output_message_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op (('load')) {
    my ($_should_skip, $_reason) = BluefinTecsMerchantPortalTestRunner::is_control_skipped(
      'entityOp', "output_message." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('output_message: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  if ($setup->{live}) {
    BluefinTecsMerchantPortalTestRunner::live_miss(LIVE_STRICT, 'output_message: basic flow', 'Live entity test blocked: the flow loads a output_message record it has no list to find');
    last BASIC_FLOW;
  }
  my $client = $setup->{client};
  my %V;

  # Bootstrap entity data from existing test data.
  $V{output_message_ref01_data_raw} = Voxgig::Struct::items(BluefinTecsMerchantPortalHelpers::to_map(
    BluefinTecsMerchantPortalHelpers::gpath($setup->{data}, 'existing.output_message')));
  $V{output_message_ref01_data} = undef;
  if (@{ $V{output_message_ref01_data_raw} || [] }) {
    $V{output_message_ref01_data} = BluefinTecsMerchantPortalHelpers::to_map($V{output_message_ref01_data_raw}[0][1]);
  }

  # LOAD
  $V{output_message_ref01_ent} = $client->OutputMessage(undef);
  $V{output_message_ref01_match_dt0} = {
    'id' => $V{output_message_ref01_data}{id},
  };
  $V{output_message_ref01_data_dt0_loaded} = $V{output_message_ref01_ent}->load($V{output_message_ref01_match_dt0}, undef);
  $V{output_message_ref01_data_dt0_load_result} = BluefinTecsMerchantPortalHelpers::to_map(ref($V{output_message_ref01_data_dt0_loaded}) && $V{output_message_ref01_data_dt0_loaded}->can('data_get') ? $V{output_message_ref01_data_dt0_loaded}->data_get : $V{output_message_ref01_data_dt0_loaded});
  ok(defined $V{output_message_ref01_data_dt0_load_result}, 'output_message load: data');
  is($V{output_message_ref01_data_dt0_load_result}{id}, $V{output_message_ref01_data}{id}, 'output_message load: id');

}

sub output_message_basic_setup {
  my ($extra) = @_;
  BluefinTecsMerchantPortalTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/output_message/OutputMessageTestData.json");
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
    ['output_message01', 'output_message02', 'output_message03'],
    {
      '`$PACK`' => ['', {
        '`$KEY`' => '`$COPY`',
        '`$VAL`' => ['`$FORMAT`', 'upper', '`$COPY`'],
      }],
    }
  );

  # Whether *_ENTID supplied the idmap, read before env_override consumes
  # it: without it, the ids a live flow binds are the fixture's synthetic ones.
  my $entid_env_raw = $ENV{'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_MESSAGE_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinTecsMerchantPortalTestRunner::env_override({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_MESSAGE_ENTID' => $idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE' => 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN' => 'FALSE',
  });

  my $idmap_resolved = BluefinTecsMerchantPortalHelpers::to_map($env->{'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_MESSAGE_ENTID'});
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
