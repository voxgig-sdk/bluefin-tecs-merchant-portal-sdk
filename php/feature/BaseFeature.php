<?php
declare(strict_types=1);

// BluefinTecsMerchantPortal SDK base feature

class BluefinTecsMerchantPortalBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(BluefinTecsMerchantPortalContext $ctx, array $options): void {}
    public function PostConstruct(BluefinTecsMerchantPortalContext $ctx): void {}
    public function PostConstructEntity(BluefinTecsMerchantPortalContext $ctx): void {}
    public function SetData(BluefinTecsMerchantPortalContext $ctx): void {}
    public function GetData(BluefinTecsMerchantPortalContext $ctx): void {}
    public function GetMatch(BluefinTecsMerchantPortalContext $ctx): void {}
    public function SetMatch(BluefinTecsMerchantPortalContext $ctx): void {}
    public function PrePoint(BluefinTecsMerchantPortalContext $ctx): void {}
    public function PreSpec(BluefinTecsMerchantPortalContext $ctx): void {}
    public function PreRequest(BluefinTecsMerchantPortalContext $ctx): void {}
    public function PreResponse(BluefinTecsMerchantPortalContext $ctx): void {}
    public function PreResult(BluefinTecsMerchantPortalContext $ctx): void {}
    public function PreDone(BluefinTecsMerchantPortalContext $ctx): void {}
    public function PreUnexpected(BluefinTecsMerchantPortalContext $ctx): void {}
}
