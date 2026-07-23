<?php
declare(strict_types=1);

// BluefinTecsMerchantPortal SDK utility: result_headers

class BluefinTecsMerchantPortalResultHeaders
{
    public static function call(BluefinTecsMerchantPortalContext $ctx): ?BluefinTecsMerchantPortalResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
