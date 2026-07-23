<?php
declare(strict_types=1);

// BluefinTecsMerchantPortal SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class BluefinTecsMerchantPortalMakeContext
{
    public static function call(array $ctxmap, ?BluefinTecsMerchantPortalContext $basectx): BluefinTecsMerchantPortalContext
    {
        return new BluefinTecsMerchantPortalContext($ctxmap, $basectx);
    }
}
