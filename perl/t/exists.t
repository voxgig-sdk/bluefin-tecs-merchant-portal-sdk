#!perl
# BluefinTecsMerchantPortal SDK exists test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";

use BluefinTecsMerchantPortalSDK;

my $testsdk = BluefinTecsMerchantPortalSDK->test(undef, undef);
ok(defined $testsdk, 'create test sdk');

done_testing();
