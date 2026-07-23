<?php
declare(strict_types=1);

// BluefinTecsMerchantPortal SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class BluefinTecsMerchantPortalFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new BluefinTecsMerchantPortalBaseFeature();
            case "test":
                return new BluefinTecsMerchantPortalTestFeature();
            default:
                return new BluefinTecsMerchantPortalBaseFeature();
        }
    }
}
