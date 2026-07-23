<?php
declare(strict_types=1);

// BluefinTecsMerchantPortal SDK utility: result_body

class BluefinTecsMerchantPortalResultBody
{
    public static function call(BluefinTecsMerchantPortalContext $ctx): ?BluefinTecsMerchantPortalResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
