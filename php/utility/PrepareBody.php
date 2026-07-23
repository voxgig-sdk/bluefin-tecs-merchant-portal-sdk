<?php
declare(strict_types=1);

// BluefinTecsMerchantPortal SDK utility: prepare_body

class BluefinTecsMerchantPortalPrepareBody
{
    public static function call(BluefinTecsMerchantPortalContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
