<?php
declare(strict_types=1);

// BluefinTecsMerchantPortal SDK exists test

require_once __DIR__ . '/../bluefintecsmerchantportal_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = BluefinTecsMerchantPortalSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
