<?php
declare(strict_types=1);

// BluefinTecsMerchantPortal SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

BluefinTecsMerchantPortalUtility::setRegistrar(function (BluefinTecsMerchantPortalUtility $u): void {
    $u->clean = [BluefinTecsMerchantPortalClean::class, 'call'];
    $u->done = [BluefinTecsMerchantPortalDone::class, 'call'];
    $u->make_error = [BluefinTecsMerchantPortalMakeError::class, 'call'];
    $u->feature_add = [BluefinTecsMerchantPortalFeatureAdd::class, 'call'];
    $u->feature_hook = [BluefinTecsMerchantPortalFeatureHook::class, 'call'];
    $u->feature_init = [BluefinTecsMerchantPortalFeatureInit::class, 'call'];
    $u->fetcher = [BluefinTecsMerchantPortalFetcher::class, 'call'];
    $u->make_fetch_def = [BluefinTecsMerchantPortalMakeFetchDef::class, 'call'];
    $u->make_context = [BluefinTecsMerchantPortalMakeContext::class, 'call'];
    $u->make_options = [BluefinTecsMerchantPortalMakeOptions::class, 'call'];
    $u->make_request = [BluefinTecsMerchantPortalMakeRequest::class, 'call'];
    $u->make_response = [BluefinTecsMerchantPortalMakeResponse::class, 'call'];
    $u->make_result = [BluefinTecsMerchantPortalMakeResult::class, 'call'];
    $u->make_point = [BluefinTecsMerchantPortalMakePoint::class, 'call'];
    $u->make_spec = [BluefinTecsMerchantPortalMakeSpec::class, 'call'];
    $u->make_url = [BluefinTecsMerchantPortalMakeUrl::class, 'call'];
    $u->param = [BluefinTecsMerchantPortalParam::class, 'call'];
    $u->prepare_auth = [BluefinTecsMerchantPortalPrepareAuth::class, 'call'];
    $u->prepare_body = [BluefinTecsMerchantPortalPrepareBody::class, 'call'];
    $u->prepare_headers = [BluefinTecsMerchantPortalPrepareHeaders::class, 'call'];
    $u->prepare_method = [BluefinTecsMerchantPortalPrepareMethod::class, 'call'];
    $u->prepare_params = [BluefinTecsMerchantPortalPrepareParams::class, 'call'];
    $u->prepare_path = [BluefinTecsMerchantPortalPreparePath::class, 'call'];
    $u->prepare_query = [BluefinTecsMerchantPortalPrepareQuery::class, 'call'];
    $u->result_basic = [BluefinTecsMerchantPortalResultBasic::class, 'call'];
    $u->result_body = [BluefinTecsMerchantPortalResultBody::class, 'call'];
    $u->result_headers = [BluefinTecsMerchantPortalResultHeaders::class, 'call'];
    $u->transform_request = [BluefinTecsMerchantPortalTransformRequest::class, 'call'];
    $u->transform_response = [BluefinTecsMerchantPortalTransformResponse::class, 'call'];
});
