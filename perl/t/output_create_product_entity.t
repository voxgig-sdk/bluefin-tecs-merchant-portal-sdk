#!perl
# OutputCreateProduct entity test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Cwd ();

use BluefinTecsMerchantPortalSDK;
require(Cwd::abs_path("$FindBin::Bin/runner.pm"));

{
  my $testsdk = BluefinTecsMerchantPortalSDK->test(undef, undef);
  my $ent = $testsdk->OutputCreateProduct(undef);
  ok(defined $ent, 'output_create_product: create instance');
}

BASIC_FLOW: {
  my $setup = output_create_product_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op ('create') {
    my ($_should_skip, $_reason) = BluefinTecsMerchantPortalTestRunner::is_control_skipped(
      'entityOp', "output_create_product." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('output_create_product: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  # The basic flow consumes synthetic IDs from the fixture. In live mode
  # without an *_ENTID env override, those IDs hit the live API and 4xx.
  if ($setup->{synthetic_only}) {
    note('live entity test uses synthetic IDs from fixture - set BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_CREATE_PRODUCT_ENTID JSON to run live');
    pass('output_create_product: basic flow skipped (synthetic IDs only)');
    last BASIC_FLOW;
  }
  my $client = $setup->{client};
  my %V;

  # CREATE
  $V{output_create_product_ref01_ent} = $client->OutputCreateProduct(undef);
  $V{output_create_product_ref01_data} = BluefinTecsMerchantPortalHelpers::to_map(BluefinTecsMerchantPortalHelpers::gp(
    BluefinTecsMerchantPortalHelpers::gpath($setup->{data}, 'new.output_create_product'), 'output_create_product_ref01'));

  $V{output_create_product_ref01_data_result} = $V{output_create_product_ref01_ent}->create($V{output_create_product_ref01_data}, undef);
  $V{output_create_product_ref01_data} = BluefinTecsMerchantPortalHelpers::to_map($V{output_create_product_ref01_data_result});
  ok(defined $V{output_create_product_ref01_data}, 'output_create_product create: data');

}

sub output_create_product_basic_setup {
  my ($extra) = @_;
  BluefinTecsMerchantPortalTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/output_create_product/OutputCreateProductTestData.json");
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
    ['output_create_product01', 'output_create_product02', 'output_create_product03'],
    {
      '`$PACK`' => ['', {
        '`$KEY`' => '`$COPY`',
        '`$VAL`' => ['`$FORMAT`', 'upper', '`$COPY`'],
      }],
    }
  );

  # Detect ENTID env override before env_override consumes it. When live
  # mode is on without a real override, the basic test runs against
  # synthetic IDs from the fixture and 4xx's. Surface this so the test can
  # skip.
  my $entid_env_raw = $ENV{'BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_CREATE_PRODUCT_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinTecsMerchantPortalTestRunner::env_override({
    'BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_CREATE_PRODUCT_ENTID' => $idmap,
    'BLUEFINTECSMERCHANTPORTAL_TEST_LIVE' => 'FALSE',
    'BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN' => 'FALSE',
  });

  my $idmap_resolved = BluefinTecsMerchantPortalHelpers::to_map($env->{'BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_CREATE_PRODUCT_ENTID'});
  if (!defined $idmap_resolved) {
    $idmap_resolved = BluefinTecsMerchantPortalHelpers::to_map($idmap);
  }

  if ((($env->{'BLUEFINTECSMERCHANTPORTAL_TEST_LIVE'}) || '') eq 'TRUE') {
    my $merged_opts = Voxgig::Struct::merge([
      {
      },
      (Voxgig::Struct::ismap($extra) ? $extra : {}),
    ]);
    $client = BluefinTecsMerchantPortalSDK->new(BluefinTecsMerchantPortalHelpers::to_map($merged_opts));
  }

  my $live = ((($env->{'BLUEFINTECSMERCHANTPORTAL_TEST_LIVE'}) || '') eq 'TRUE') ? 1 : 0;
  return {
    'client' => $client,
    'data' => $entity_data,
    'idmap' => $idmap_resolved,
    'env' => $env,
    'explain' => ((($env->{'BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN'}) || '') eq 'TRUE') ? 1 : 0,
    'live' => $live,
    'synthetic_only' => ($live && !$idmap_overridden) ? 1 : 0,
    'now' => BluefinTecsMerchantPortalHelpers::now_ms(),
  };
}

done_testing();
