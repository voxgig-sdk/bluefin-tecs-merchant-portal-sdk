<?php
declare(strict_types=1);

// BluefinTecsMerchantPortal SDK

require_once __DIR__ . '/utility/struct/Struct.php';
require_once __DIR__ . '/core/UtilityType.php';
require_once __DIR__ . '/core/Spec.php';
require_once __DIR__ . '/core/Helpers.php';

// Load utility registration
require_once __DIR__ . '/utility/Register.php';

// Load config and features
require_once __DIR__ . '/config.php';
require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/features.php';

use Voxgig\Struct\Struct;

// Features record diagnostic state on the client as dynamic properties
// (_retry, _cache, _metrics, ...); allow them explicitly (PHP 8.2+
// deprecates implicit dynamic properties).
#[\AllowDynamicProperties]
class BluefinTecsMerchantPortalSDK
{
    public string $mode;
    public array $features;
    public ?array $options;

    private $_utility;
    private $_rootctx;

    public function __construct(array $options = [])
    {
        $this->mode = "live";
        $this->features = [];
        $this->options = null;

        $utility = new BluefinTecsMerchantPortalUtility();
        $this->_utility = $utility;

        $config = BluefinTecsMerchantPortalConfig::make_config();

        $this->_rootctx = ($utility->make_context)([
            "client" => $this,
            "utility" => $utility,
            "config" => $config,
            "options" => $options ?? [],
            "shared" => [],
        ], null);

        $this->options = ($utility->make_options)($this->_rootctx);

        if (Struct::getpath($this->options, "feature.test.active") === true) {
            $this->mode = "test";
        }

        $this->_rootctx->options = $this->options;

        // Add features in the resolved order (make_options puts an explicit
        // list order first, else defaults to test-first). Ordering matters: the
        // `test` feature installs the base mock transport and the transport
        // features (retry/cache/netsim/proxy/ratelimit) wrap whatever is
        // current, so `test` must be added before them to sit at the base.
        $feature_opts = BluefinTecsMerchantPortalHelpers::to_map(Struct::getprop($this->options, "feature"));
        if ($feature_opts) {
            $featureorder = Struct::getpath($this->options, "__derived__.featureorder");
            if (is_array($featureorder)) {
                foreach ($featureorder as $fname) {
                    $fopts = BluefinTecsMerchantPortalHelpers::to_map($feature_opts[$fname] ?? null);
                    if ($fopts && isset($fopts["active"]) && $fopts["active"] === true) {
                        ($utility->feature_add)($this->_rootctx, BluefinTecsMerchantPortalFeatures::make_feature($fname));
                    }
                }
            }
        }

        // Add extension features.
        $extend_val = Struct::getprop($this->options, "extend");
        if (is_array($extend_val)) {
            foreach ($extend_val as $f) {
                if (is_object($f) && method_exists($f, 'get_name')) {
                    ($utility->feature_add)($this->_rootctx, $f);
                }
            }
        }

        // Initialize features.
        foreach ($this->features as $f) {
            ($utility->feature_init)($this->_rootctx, $f);
        }

        ($utility->feature_hook)($this->_rootctx, "PostConstruct");
    }

    public function options_map(): array
    {
        $out = Struct::clone($this->options);
        return is_array($out) ? $out : [];
    }

    public function get_utility()
    {
        return BluefinTecsMerchantPortalUtility::copy($this->_utility);
    }

    public function get_root_ctx()
    {
        return $this->_rootctx;
    }

    public function prepare(array $fetchargs = []): mixed
    {
        $utility = $this->_utility;
        $fetchargs = $fetchargs ?? [];

        $ctrl = BluefinTecsMerchantPortalHelpers::to_map(Struct::getprop($fetchargs, "ctrl")) ?? [];

        $ctx = ($utility->make_context)([
            "opname" => "prepare",
            "ctrl" => $ctrl,
        ], $this->_rootctx);

        $opts = $this->options;
        $path = Struct::getprop($fetchargs, "path") ?? "";
        $path = is_string($path) ? $path : "";
        $method_val = Struct::getprop($fetchargs, "method") ?? "GET";
        $method_val = is_string($method_val) ? $method_val : "GET";
        $params = BluefinTecsMerchantPortalHelpers::to_map(Struct::getprop($fetchargs, "params")) ?? [];
        $query = BluefinTecsMerchantPortalHelpers::to_map(Struct::getprop($fetchargs, "query")) ?? [];
        $headers = ($utility->prepare_headers)($ctx);

        $base = Struct::getprop($opts, "base") ?? "";
        $base = is_string($base) ? $base : "";
        $prefix = Struct::getprop($opts, "prefix") ?? "";
        $prefix = is_string($prefix) ? $prefix : "";
        $suffix = Struct::getprop($opts, "suffix") ?? "";
        $suffix = is_string($suffix) ? $suffix : "";

        $ctx->spec = new BluefinTecsMerchantPortalSpec([
            "base" => $base, "prefix" => $prefix, "suffix" => $suffix,
            "path" => $path, "method" => $method_val,
            "params" => $params, "query" => $query, "headers" => $headers,
            "body" => Struct::getprop($fetchargs, "body"),
            "step" => "start",
        ]);

        // Merge user-provided headers.
        $uh = Struct::getprop($fetchargs, "headers");
        if (is_array($uh)) {
            foreach ($uh as $k => $v) {
                $ctx->spec->headers[$k] = $v;
            }
        }

        [$_, $err] = ($utility->prepare_auth)($ctx);
        if ($err) {
            return ($utility->make_error)($ctx, $err);
        }

        [$fetchdef, $fd_err] = ($utility->make_fetch_def)($ctx);
        if ($fd_err) {
            return ($utility->make_error)($ctx, $fd_err);
        }
        return $fetchdef;
    }

    public function direct(array $fetchargs = []): mixed
    {
        $utility = $this->_utility;

        // direct() is the raw-HTTP escape hatch: it never throws, it returns
        // an {ok, err, ...} dict. prepare() now raises on error, so catch it
        // and surface the failure through the dict instead.
        try {
            $fetchdef = $this->prepare($fetchargs);
        } catch (\Throwable $err) {
            return ["ok" => false, "err" => $err];
        }

        $fetchargs = $fetchargs ?? [];
        $ctrl = BluefinTecsMerchantPortalHelpers::to_map(Struct::getprop($fetchargs, "ctrl")) ?? [];

        $ctx = ($utility->make_context)([
            "opname" => "direct",
            "ctrl" => $ctrl,
        ], $this->_rootctx);

        $url = $fetchdef["url"] ?? "";
        [$fetched, $fetch_err] = ($utility->fetcher)($ctx, $url, $fetchdef);

        if ($fetch_err) {
            return ["ok" => false, "err" => $fetch_err];
        }

        if ($fetched === null) {
            return [
                "ok" => false,
                "err" => $ctx->make_error("direct_no_response", "response: undefined"),
            ];
        }

        if (is_array($fetched)) {
            $status = BluefinTecsMerchantPortalHelpers::to_int(Struct::getprop($fetched, "status"));
            $headers = Struct::getprop($fetched, "headers") ?? [];

            // No-body responses (204, 304) and explicit zero content-length
            // must skip JSON parsing — calling json() on an empty body errors.
            $content_length = is_array($headers) ? ($headers["content-length"] ?? null) : null;
            $no_body = $status === 204 || $status === 304 || (string)$content_length === "0";

            $json_data = null;
            if (!$no_body) {
                $jf = Struct::getprop($fetched, "json");
                if (is_callable($jf)) {
                    try {
                        $json_data = $jf();
                    } catch (\Throwable $e) {
                        // Non-JSON body — leave data null but keep status/ok.
                        $json_data = null;
                    }
                }
            }

            return [
                "ok" => $status >= 200 && $status < 300,
                "status" => $status,
                "headers" => Struct::getprop($fetched, "headers"),
                "data" => $json_data,
            ];
        }

        return [
            "ok" => false,
            "err" => $ctx->make_error("direct_invalid", "invalid response type"),
        ];
    }


    private $_merchant_portal_api_controller = null;

    // Canonical facade: $client->MerchantPortalApiController()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->merchant_portal_api_controller()
    // resolves here too.
    public function MerchantPortalApiController($data = null)
    {
        require_once __DIR__ . '/entity/merchant_portal_api_controller_entity.php';
        if ($data === null) {
            if ($this->_merchant_portal_api_controller === null) {
                $this->_merchant_portal_api_controller = new MerchantPortalApiControllerEntity($this, null);
            }
            return $this->_merchant_portal_api_controller;
        }
        return new MerchantPortalApiControllerEntity($this, $data);
    }


    private $_merchant_portal_common_controller = null;

    // Canonical facade: $client->MerchantPortalCommonController()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->merchant_portal_common_controller()
    // resolves here too.
    public function MerchantPortalCommonController($data = null)
    {
        require_once __DIR__ . '/entity/merchant_portal_common_controller_entity.php';
        if ($data === null) {
            if ($this->_merchant_portal_common_controller === null) {
                $this->_merchant_portal_common_controller = new MerchantPortalCommonControllerEntity($this, null);
            }
            return $this->_merchant_portal_common_controller;
        }
        return new MerchantPortalCommonControllerEntity($this, $data);
    }


    private $_merchant_portal_pam_contract_controller = null;

    // Canonical facade: $client->MerchantPortalPamContractController()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->merchant_portal_pam_contract_controller()
    // resolves here too.
    public function MerchantPortalPamContractController($data = null)
    {
        require_once __DIR__ . '/entity/merchant_portal_pam_contract_controller_entity.php';
        if ($data === null) {
            if ($this->_merchant_portal_pam_contract_controller === null) {
                $this->_merchant_portal_pam_contract_controller = new MerchantPortalPamContractControllerEntity($this, null);
            }
            return $this->_merchant_portal_pam_contract_controller;
        }
        return new MerchantPortalPamContractControllerEntity($this, $data);
    }


    private $_merchant_portal_pam_document_controller = null;

    // Canonical facade: $client->MerchantPortalPamDocumentController()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->merchant_portal_pam_document_controller()
    // resolves here too.
    public function MerchantPortalPamDocumentController($data = null)
    {
        require_once __DIR__ . '/entity/merchant_portal_pam_document_controller_entity.php';
        if ($data === null) {
            if ($this->_merchant_portal_pam_document_controller === null) {
                $this->_merchant_portal_pam_document_controller = new MerchantPortalPamDocumentControllerEntity($this, null);
            }
            return $this->_merchant_portal_pam_document_controller;
        }
        return new MerchantPortalPamDocumentControllerEntity($this, $data);
    }


    private $_merchant_portal_pam_form_controller = null;

    // Canonical facade: $client->MerchantPortalPamFormController()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->merchant_portal_pam_form_controller()
    // resolves here too.
    public function MerchantPortalPamFormController($data = null)
    {
        require_once __DIR__ . '/entity/merchant_portal_pam_form_controller_entity.php';
        if ($data === null) {
            if ($this->_merchant_portal_pam_form_controller === null) {
                $this->_merchant_portal_pam_form_controller = new MerchantPortalPamFormControllerEntity($this, null);
            }
            return $this->_merchant_portal_pam_form_controller;
        }
        return new MerchantPortalPamFormControllerEntity($this, $data);
    }


    private $_merchant_portal_pam_mandator_controller = null;

    // Canonical facade: $client->MerchantPortalPamMandatorController()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->merchant_portal_pam_mandator_controller()
    // resolves here too.
    public function MerchantPortalPamMandatorController($data = null)
    {
        require_once __DIR__ . '/entity/merchant_portal_pam_mandator_controller_entity.php';
        if ($data === null) {
            if ($this->_merchant_portal_pam_mandator_controller === null) {
                $this->_merchant_portal_pam_mandator_controller = new MerchantPortalPamMandatorControllerEntity($this, null);
            }
            return $this->_merchant_portal_pam_mandator_controller;
        }
        return new MerchantPortalPamMandatorControllerEntity($this, $data);
    }


    private $_merchant_portal_pam_merchant_controller = null;

    // Canonical facade: $client->MerchantPortalPamMerchantController()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->merchant_portal_pam_merchant_controller()
    // resolves here too.
    public function MerchantPortalPamMerchantController($data = null)
    {
        require_once __DIR__ . '/entity/merchant_portal_pam_merchant_controller_entity.php';
        if ($data === null) {
            if ($this->_merchant_portal_pam_merchant_controller === null) {
                $this->_merchant_portal_pam_merchant_controller = new MerchantPortalPamMerchantControllerEntity($this, null);
            }
            return $this->_merchant_portal_pam_merchant_controller;
        }
        return new MerchantPortalPamMerchantControllerEntity($this, $data);
    }


    private $_merchant_portal_pam_package_controller = null;

    // Canonical facade: $client->MerchantPortalPamPackageController()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->merchant_portal_pam_package_controller()
    // resolves here too.
    public function MerchantPortalPamPackageController($data = null)
    {
        require_once __DIR__ . '/entity/merchant_portal_pam_package_controller_entity.php';
        if ($data === null) {
            if ($this->_merchant_portal_pam_package_controller === null) {
                $this->_merchant_portal_pam_package_controller = new MerchantPortalPamPackageControllerEntity($this, null);
            }
            return $this->_merchant_portal_pam_package_controller;
        }
        return new MerchantPortalPamPackageControllerEntity($this, $data);
    }


    private $_merchant_portal_pam_product_controller = null;

    // Canonical facade: $client->MerchantPortalPamProductController()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->merchant_portal_pam_product_controller()
    // resolves here too.
    public function MerchantPortalPamProductController($data = null)
    {
        require_once __DIR__ . '/entity/merchant_portal_pam_product_controller_entity.php';
        if ($data === null) {
            if ($this->_merchant_portal_pam_product_controller === null) {
                $this->_merchant_portal_pam_product_controller = new MerchantPortalPamProductControllerEntity($this, null);
            }
            return $this->_merchant_portal_pam_product_controller;
        }
        return new MerchantPortalPamProductControllerEntity($this, $data);
    }


    private $_output_add_product = null;

    // Canonical facade: $client->OutputAddProduct()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->output_add_product()
    // resolves here too.
    public function OutputAddProduct($data = null)
    {
        require_once __DIR__ . '/entity/output_add_product_entity.php';
        if ($data === null) {
            if ($this->_output_add_product === null) {
                $this->_output_add_product = new OutputAddProductEntity($this, null);
            }
            return $this->_output_add_product;
        }
        return new OutputAddProductEntity($this, $data);
    }


    private $_output_create_product = null;

    // Canonical facade: $client->OutputCreateProduct()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->output_create_product()
    // resolves here too.
    public function OutputCreateProduct($data = null)
    {
        require_once __DIR__ . '/entity/output_create_product_entity.php';
        if ($data === null) {
            if ($this->_output_create_product === null) {
                $this->_output_create_product = new OutputCreateProductEntity($this, null);
            }
            return $this->_output_create_product;
        }
        return new OutputCreateProductEntity($this, $data);
    }


    private $_output_detail = null;

    // Canonical facade: $client->OutputDetail()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->output_detail()
    // resolves here too.
    public function OutputDetail($data = null)
    {
        require_once __DIR__ . '/entity/output_detail_entity.php';
        if ($data === null) {
            if ($this->_output_detail === null) {
                $this->_output_detail = new OutputDetailEntity($this, null);
            }
            return $this->_output_detail;
        }
        return new OutputDetailEntity($this, $data);
    }


    private $_output_list = null;

    // Canonical facade: $client->OutputList()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->output_list()
    // resolves here too.
    public function OutputList($data = null)
    {
        require_once __DIR__ . '/entity/output_list_entity.php';
        if ($data === null) {
            if ($this->_output_list === null) {
                $this->_output_list = new OutputListEntity($this, null);
            }
            return $this->_output_list;
        }
        return new OutputListEntity($this, $data);
    }


    private $_output_message = null;

    // Canonical facade: $client->OutputMessage()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->output_message()
    // resolves here too.
    public function OutputMessage($data = null)
    {
        require_once __DIR__ . '/entity/output_message_entity.php';
        if ($data === null) {
            if ($this->_output_message === null) {
                $this->_output_message = new OutputMessageEntity($this, null);
            }
            return $this->_output_message;
        }
        return new OutputMessageEntity($this, $data);
    }


    private $_output_move_tid = null;

    // Canonical facade: $client->OutputMoveTid()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->output_move_tid()
    // resolves here too.
    public function OutputMoveTid($data = null)
    {
        require_once __DIR__ . '/entity/output_move_tid_entity.php';
        if ($data === null) {
            if ($this->_output_move_tid === null) {
                $this->_output_move_tid = new OutputMoveTidEntity($this, null);
            }
            return $this->_output_move_tid;
        }
        return new OutputMoveTidEntity($this, $data);
    }


    private $_output_remove_product = null;

    // Canonical facade: $client->OutputRemoveProduct()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->output_remove_product()
    // resolves here too.
    public function OutputRemoveProduct($data = null)
    {
        require_once __DIR__ . '/entity/output_remove_product_entity.php';
        if ($data === null) {
            if ($this->_output_remove_product === null) {
                $this->_output_remove_product = new OutputRemoveProductEntity($this, null);
            }
            return $this->_output_remove_product;
        }
        return new OutputRemoveProductEntity($this, $data);
    }


    private $_output_start = null;

    // Canonical facade: $client->OutputStart()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->output_start()
    // resolves here too.
    public function OutputStart($data = null)
    {
        require_once __DIR__ . '/entity/output_start_entity.php';
        if ($data === null) {
            if ($this->_output_start === null) {
                $this->_output_start = new OutputStartEntity($this, null);
            }
            return $this->_output_start;
        }
        return new OutputStartEntity($this, $data);
    }


    private $_output_status = null;

    // Canonical facade: $client->OutputStatus()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->output_status()
    // resolves here too.
    public function OutputStatus($data = null)
    {
        require_once __DIR__ . '/entity/output_status_entity.php';
        if ($data === null) {
            if ($this->_output_status === null) {
                $this->_output_status = new OutputStatusEntity($this, null);
            }
            return $this->_output_status;
        }
        return new OutputStatusEntity($this, $data);
    }


    private $_output_update_product = null;

    // Canonical facade: $client->OutputUpdateProduct()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->output_update_product()
    // resolves here too.
    public function OutputUpdateProduct($data = null)
    {
        require_once __DIR__ . '/entity/output_update_product_entity.php';
        if ($data === null) {
            if ($this->_output_update_product === null) {
                $this->_output_update_product = new OutputUpdateProductEntity($this, null);
            }
            return $this->_output_update_product;
        }
        return new OutputUpdateProductEntity($this, $data);
    }



    public static function test(?array $testopts = null, ?array $sdkopts = null): self
    {
        $sdkopts = $sdkopts ?? [];
        $sdkopts = Struct::clone($sdkopts);
        $sdkopts = is_array($sdkopts) ? $sdkopts : [];

        $testopts = $testopts ?? [];
        $testopts = Struct::clone($testopts);
        $testopts = is_array($testopts) ? $testopts : [];
        $testopts["active"] = true;

        if (!isset($sdkopts["feature"])) {
            $sdkopts["feature"] = [];
        }
        $sdkopts["feature"]["test"] = $testopts;

        $sdk = new BluefinTecsMerchantPortalSDK($sdkopts);
        $sdk->mode = "test";
        return $sdk;
    }
}
