# BluefinTecsMerchantPortal SDK

use strict;
use warnings;

use File::Basename ();
use Cwd ();
use Scalar::Util ();

package BluefinTecsMerchantPortalSDK;

our $VERSION = '0.0.1';

our $DIR;
BEGIN { $DIR = File::Basename::dirname(Cwd::abs_path(__FILE__)) }

require(Cwd::abs_path("$DIR/Voxgig/Struct.pm"));
require(Cwd::abs_path("$DIR/../core/helpers.pm"));
require(Cwd::abs_path("$DIR/../core/utility_type.pm"));
require(Cwd::abs_path("$DIR/../core/spec.pm"));
require(Cwd::abs_path("$DIR/../core/error.pm"));

# Load utility registration
require(Cwd::abs_path("$DIR/../utility/register.pm"));

# Load config and features
require(Cwd::abs_path("$DIR/../config.pm"));
require(Cwd::abs_path("$DIR/../feature/base_feature.pm"));
require(Cwd::abs_path("$DIR/../features.pm"));

sub new {
  my ($class, $options) = @_;
  $options = {} unless defined $options;

  my $self = bless {
    mode => 'live',
    features => [],
    options => undef,
  }, $class;

  my $utility = BluefinTecsMerchantPortalUtility->new;
  $self->{_utility} = $utility;

  my $config = BluefinTecsMerchantPortalConfig::make_config();

  $self->{_rootctx} = $utility->{make_context}->({
    'client' => $self,
    'utility' => $utility,
    'config' => $config,
    'options' => $options,
    'shared' => {},
  }, undef);

  $self->{options} = $utility->{make_options}->($self->{_rootctx});

  if (BluefinTecsMerchantPortalHelpers::is_true(
    BluefinTecsMerchantPortalHelpers::gpath($self->{options}, 'feature.test.active'))) {
    $self->{mode} = 'test';
  }

  $self->{_rootctx}{options} = $self->{options};

  # Add features in the resolved order (make_options records an explicit
  # array order, else defaults to test-first). Ordering matters: the `test`
  # feature installs the base mock transport and the transport features
  # (retry/cache/netsim/proxy/ratelimit) wrap whatever is current, so `test`
  # must be added before them to sit at the base of the wrapper chain.
  my $feature_opts = BluefinTecsMerchantPortalHelpers::to_map(
    BluefinTecsMerchantPortalHelpers::gp($self->{options}, 'feature')) || {};
  my $featureorder = BluefinTecsMerchantPortalHelpers::gpath(
    $self->{options}, '__derived__.featureorder');
  $featureorder = [] unless Voxgig::Struct::islist($featureorder);
  for my $fname (@$featureorder) {
    my $fopts = BluefinTecsMerchantPortalHelpers::to_map($feature_opts->{$fname});
    if ($fopts && BluefinTecsMerchantPortalHelpers::is_true($fopts->{active})) {
      $utility->{feature_add}->($self->{_rootctx},
        BluefinTecsMerchantPortalFeatures::make_feature($fname));
    }
  }

  # Add extension features.
  my $extend = BluefinTecsMerchantPortalHelpers::gp($self->{options}, 'extend');
  if (Voxgig::Struct::islist($extend)) {
    for my $f (@$extend) {
      if (Scalar::Util::blessed($f) && $f->can('get_name')) {
        $utility->{feature_add}->($self->{_rootctx}, $f);
      }
    }
  }

  # Initialize features.
  for my $f (@{ $self->{features} }) {
    $utility->{feature_init}->($self->{_rootctx}, $f);
  }

  $utility->{feature_hook}->($self->{_rootctx}, 'PostConstruct');

  return $self;
}

sub options_map {
  my ($self) = @_;
  my $out = Voxgig::Struct::clone($self->{options});
  return Voxgig::Struct::ismap($out) ? $out : {};
}

sub get_utility {
  my ($self) = @_;
  return BluefinTecsMerchantPortalUtility->copy($self->{_utility});
}

sub get_root_ctx {
  my ($self) = @_;
  return $self->{_rootctx};
}

sub prepare {
  my ($self, $fetchargs) = @_;
  my $utility = $self->{_utility};
  $fetchargs = {} unless defined $fetchargs;

  my $ctrl = BluefinTecsMerchantPortalHelpers::to_map(
    BluefinTecsMerchantPortalHelpers::gp($fetchargs, 'ctrl')) || {};

  my $ctx = $utility->{make_context}->({
    'opname' => 'prepare',
    'ctrl' => $ctrl,
  }, $self->{_rootctx});

  my $opts = $self->{options};
  my $path = BluefinTecsMerchantPortalHelpers::gp($fetchargs, 'path');
  $path = '' unless defined $path && !ref $path;
  my $method_val = BluefinTecsMerchantPortalHelpers::gp($fetchargs, 'method');
  $method_val = 'GET' unless defined $method_val && !ref $method_val;
  my $params = BluefinTecsMerchantPortalHelpers::to_map(
    BluefinTecsMerchantPortalHelpers::gp($fetchargs, 'params')) || {};
  my $query = BluefinTecsMerchantPortalHelpers::to_map(
    BluefinTecsMerchantPortalHelpers::gp($fetchargs, 'query')) || {};
  my $headers = $utility->{prepare_headers}->($ctx);

  my $base = BluefinTecsMerchantPortalHelpers::gp($opts, 'base');
  $base = '' unless defined $base && !ref $base;
  my $prefix = BluefinTecsMerchantPortalHelpers::gp($opts, 'prefix');
  $prefix = '' unless defined $prefix && !ref $prefix;
  my $suffix = BluefinTecsMerchantPortalHelpers::gp($opts, 'suffix');
  $suffix = '' unless defined $suffix && !ref $suffix;

  $ctx->{spec} = BluefinTecsMerchantPortalSpec->new({
    'base' => $base, 'prefix' => $prefix, 'suffix' => $suffix,
    'path' => $path, 'method' => $method_val,
    'params' => $params, 'query' => $query, 'headers' => $headers,
    'body' => BluefinTecsMerchantPortalHelpers::gp($fetchargs, 'body'),
    'step' => 'start',
  });

  # Merge user-provided headers.
  my $uh = BluefinTecsMerchantPortalHelpers::gp($fetchargs, 'headers');
  if (Voxgig::Struct::ismap($uh)) {
    $ctx->{spec}{headers}{$_} = $uh->{$_} for keys %$uh;
  }

  my (undef, $err) = $utility->{prepare_auth}->($ctx);
  die $err if $err;

  # make_fetch_def returns a (fetchdef, err) tuple; destructure it and
  # return just the fetchdef hashref (dying on error) so callers -
  # including direct(), which indexes fetchdef->{url} - receive a hashref,
  # mirroring the ts/py/rb prepare().
  my ($fetchdef, $fd_err) = $utility->{make_fetch_def}->($ctx);
  die $fd_err if $fd_err;

  return $fetchdef;
}

sub direct {
  my ($self, $fetchargs) = @_;
  my $utility = $self->{_utility};

  # direct() is the raw-HTTP escape hatch: it always returns a result hash
  # ({ ok => ..., ... }) and never dies. prepare() dies on error, so trap
  # that and surface it in the hash.
  my $fetchdef = eval { $self->prepare($fetchargs) };
  if (my $prep_err = $@) {
    return { 'ok' => 0, 'err' => $prep_err };
  }

  $fetchargs = {} unless defined $fetchargs;
  my $ctrl = BluefinTecsMerchantPortalHelpers::to_map(
    BluefinTecsMerchantPortalHelpers::gp($fetchargs, 'ctrl')) || {};

  my $ctx = $utility->{make_context}->({
    'opname' => 'direct',
    'ctrl' => $ctrl,
  }, $self->{_rootctx});

  my $url = defined $fetchdef->{url} ? $fetchdef->{url} : '';
  my ($fetched, $fetch_err) = $utility->{fetcher}->($ctx, $url, $fetchdef);

  return { 'ok' => 0, 'err' => $fetch_err } if $fetch_err;

  if (!defined $fetched) {
    return {
      'ok' => 0,
      'err' => $ctx->make_error('direct_no_response', 'response: undefined'),
    };
  }

  if (Voxgig::Struct::ismap($fetched)) {
    my $status = BluefinTecsMerchantPortalHelpers::to_int(
      BluefinTecsMerchantPortalHelpers::gp($fetched, 'status'));
    my $headers = BluefinTecsMerchantPortalHelpers::gp($fetched, 'headers') || {};

    # No-body responses (204, 304) and explicit zero content-length must
    # skip JSON parsing - calling json() on an empty body errors.
    my $content_length = Voxgig::Struct::ismap($headers)
      ? $headers->{'content-length'} : undef;
    my $no_body = (204 == $status || 304 == $status
      || (defined $content_length && '0' eq "$content_length")) ? 1 : 0;

    my $json_data;
    unless ($no_body) {
      my $jf = BluefinTecsMerchantPortalHelpers::gp($fetched, 'json');
      if (ref $jf eq 'CODE') {
        # Non-JSON body - leave data undef, keep status/headers.
        $json_data = eval { $jf->() };
      }
    }

    return {
      'ok' => ($status >= 200 && $status < 300) ? 1 : 0,
      'status' => $status,
      'headers' => $headers,
      'data' => $json_data,
    };
  }

  return {
    'ok' => 0,
    'err' => $ctx->make_error('direct_invalid', 'invalid response type'),
  };
}


# Canonical facade: $client->MerchantPortalApiController->list / ->load({ 'id' => ... })
sub MerchantPortalApiController {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/merchant_portal_api_controller_entity.pm"));
  return MerchantPortalApiControllerEntity->new($self, $data);
}


# Canonical facade: $client->MerchantPortalCommonController->list / ->load({ 'id' => ... })
sub MerchantPortalCommonController {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/merchant_portal_common_controller_entity.pm"));
  return MerchantPortalCommonControllerEntity->new($self, $data);
}


# Canonical facade: $client->MerchantPortalPamContractController->list / ->load({ 'id' => ... })
sub MerchantPortalPamContractController {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/merchant_portal_pam_contract_controller_entity.pm"));
  return MerchantPortalPamContractControllerEntity->new($self, $data);
}


# Canonical facade: $client->MerchantPortalPamDocumentController->list / ->load({ 'id' => ... })
sub MerchantPortalPamDocumentController {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/merchant_portal_pam_document_controller_entity.pm"));
  return MerchantPortalPamDocumentControllerEntity->new($self, $data);
}


# Canonical facade: $client->MerchantPortalPamFormController->list / ->load({ 'id' => ... })
sub MerchantPortalPamFormController {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/merchant_portal_pam_form_controller_entity.pm"));
  return MerchantPortalPamFormControllerEntity->new($self, $data);
}


# Canonical facade: $client->MerchantPortalPamMandatorController->list / ->load({ 'id' => ... })
sub MerchantPortalPamMandatorController {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/merchant_portal_pam_mandator_controller_entity.pm"));
  return MerchantPortalPamMandatorControllerEntity->new($self, $data);
}


# Canonical facade: $client->MerchantPortalPamMerchantController->list / ->load({ 'id' => ... })
sub MerchantPortalPamMerchantController {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/merchant_portal_pam_merchant_controller_entity.pm"));
  return MerchantPortalPamMerchantControllerEntity->new($self, $data);
}


# Canonical facade: $client->MerchantPortalPamPackageController->list / ->load({ 'id' => ... })
sub MerchantPortalPamPackageController {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/merchant_portal_pam_package_controller_entity.pm"));
  return MerchantPortalPamPackageControllerEntity->new($self, $data);
}


# Canonical facade: $client->MerchantPortalPamProductController->list / ->load({ 'id' => ... })
sub MerchantPortalPamProductController {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/merchant_portal_pam_product_controller_entity.pm"));
  return MerchantPortalPamProductControllerEntity->new($self, $data);
}


# Canonical facade: $client->OutputAddProduct->list / ->load({ 'id' => ... })
sub OutputAddProduct {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/output_add_product_entity.pm"));
  return OutputAddProductEntity->new($self, $data);
}


# Canonical facade: $client->OutputCreateProduct->list / ->load({ 'id' => ... })
sub OutputCreateProduct {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/output_create_product_entity.pm"));
  return OutputCreateProductEntity->new($self, $data);
}


# Canonical facade: $client->OutputDetail->list / ->load({ 'id' => ... })
sub OutputDetail {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/output_detail_entity.pm"));
  return OutputDetailEntity->new($self, $data);
}


# Canonical facade: $client->OutputList->list / ->load({ 'id' => ... })
sub OutputList {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/output_list_entity.pm"));
  return OutputListEntity->new($self, $data);
}


# Canonical facade: $client->OutputMessage->list / ->load({ 'id' => ... })
sub OutputMessage {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/output_message_entity.pm"));
  return OutputMessageEntity->new($self, $data);
}


# Canonical facade: $client->OutputMoveTid->list / ->load({ 'id' => ... })
sub OutputMoveTid {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/output_move_tid_entity.pm"));
  return OutputMoveTidEntity->new($self, $data);
}


# Canonical facade: $client->OutputRemoveProduct->list / ->load({ 'id' => ... })
sub OutputRemoveProduct {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/output_remove_product_entity.pm"));
  return OutputRemoveProductEntity->new($self, $data);
}


# Canonical facade: $client->OutputStart->list / ->load({ 'id' => ... })
sub OutputStart {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/output_start_entity.pm"));
  return OutputStartEntity->new($self, $data);
}


# Canonical facade: $client->OutputStatus->list / ->load({ 'id' => ... })
sub OutputStatus {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/output_status_entity.pm"));
  return OutputStatusEntity->new($self, $data);
}


# Canonical facade: $client->OutputUpdateProduct->list / ->load({ 'id' => ... })
sub OutputUpdateProduct {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/output_update_product_entity.pm"));
  return OutputUpdateProductEntity->new($self, $data);
}



sub test {
  my ($class, $testopts, $sdkopts) = @_;
  $sdkopts = {} unless defined $sdkopts;
  $sdkopts = Voxgig::Struct::clone($sdkopts);
  $sdkopts = {} unless Voxgig::Struct::ismap($sdkopts);

  $testopts = {} unless defined $testopts;
  $testopts = Voxgig::Struct::clone($testopts);
  $testopts = {} unless Voxgig::Struct::ismap($testopts);
  $testopts->{active} = Voxgig::Struct::JTRUE();

  Voxgig::Struct::setpath($sdkopts, 'feature.test', $testopts);

  my $sdk = $class->new($sdkopts);
  $sdk->{mode} = 'test';
  return $sdk;
}

1;
