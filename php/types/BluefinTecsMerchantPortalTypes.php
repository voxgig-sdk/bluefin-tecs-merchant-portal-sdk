<?php
declare(strict_types=1);

// Typed models for the BluefinTecsMerchantPortal SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** MerchantPortalApiController entity data model. */
class MerchantPortalApiController
{
    public ?int $account_number = null;
    public ?array $additional_data = null;
    public string $business_reg_number;
    public string $city;
    public ?string $corporateuuid = null;
    public string $country;
    public string $currency;
    public int $merchant_category_code;
    public ?string $merchant_email = null;
    public string $merchant_name;
    public ?string $merchant_phone_number = null;
    public string $packageid;
    public string $packageorderuuid;
    public ?string $password = null;
    public ?string $productid = null;
    public ?string $productid_acquirer = null;
    public string $reason_deactivation;
    public string $reason_reactivation;
    public ?int $sorting_code = null;
    public ?string $state = null;
    public string $street;
    public string $terminal_country_code;
    public string $terminal_language_code;
    public string $terminal_location;
    public string $terminal_serial_number;
    public int $terminalid;
    public ?string $terminalid_acquirer = null;
    public ?string $user_email = null;
    public ?string $user_phone_number = null;
    public ?string $username = null;
    public string $vu_nummer;
    public ?string $web_shop_url = null;
    public string $zipcode;
}

/** Request payload for MerchantPortalApiController#create. */
class MerchantPortalApiControllerCreateData
{
    public ?int $account_number = null;
    public ?array $additional_data = null;
    public string $business_reg_number;
    public string $city;
    public ?string $corporateuuid = null;
    public string $country;
    public string $currency;
    public int $merchant_category_code;
    public ?string $merchant_email = null;
    public string $merchant_name;
    public ?string $merchant_phone_number = null;
    public string $packageid;
    public string $packageorderuuid;
    public ?string $password = null;
    public ?string $productid = null;
    public ?string $productid_acquirer = null;
    public string $reason_deactivation;
    public string $reason_reactivation;
    public ?int $sorting_code = null;
    public ?string $state = null;
    public string $street;
    public string $terminal_country_code;
    public string $terminal_language_code;
    public string $terminal_location;
    public string $terminal_serial_number;
    public int $terminalid;
    public ?string $terminalid_acquirer = null;
    public ?string $user_email = null;
    public ?string $user_phone_number = null;
    public ?string $username = null;
    public string $vu_nummer;
    public ?string $web_shop_url = null;
    public string $zipcode;
}

/** MerchantPortalCommonController entity data model. */
class MerchantPortalCommonController
{
}

/** Request payload for MerchantPortalCommonController#load. */
class MerchantPortalCommonControllerLoadMatch
{
}

/** MerchantPortalPamContractController entity data model. */
class MerchantPortalPamContractController
{
    public string $language;
    public string $product_order_uuid;
}

/** Request payload for MerchantPortalPamContractController#create. */
class MerchantPortalPamContractControllerCreateData
{
    public string $language;
    public string $product_order_uuid;
}

/** MerchantPortalPamDocumentController entity data model. */
class MerchantPortalPamDocumentController
{
    public string $app_form_field_desc_uuid;
    public ?string $package_order_uuid = null;
    public ?string $product_order_uuid = null;
}

/** Request payload for MerchantPortalPamDocumentController#create. */
class MerchantPortalPamDocumentControllerCreateData
{
    public string $app_form_field_desc_uuid;
    public ?string $package_order_uuid = null;
    public ?string $product_order_uuid = null;
}

/** MerchantPortalPamFormController entity data model. */
class MerchantPortalPamFormController
{
    public string $app_form_fields_desc_uuid;
    public ?array $filter = null;
    public string $language;
    public ?array $package_order = null;
    public string $package_order_uuid;
    public ?string $package_uuid = null;
    public ?array $product_order = null;
    public ?string $product_order_uuid = null;
    public string $reason_of_reopening;
}

/** Request payload for MerchantPortalPamFormController#create. */
class MerchantPortalPamFormControllerCreateData
{
    public string $app_form_fields_desc_uuid;
    public ?array $filter = null;
    public string $language;
    public ?array $package_order = null;
    public string $package_order_uuid;
    public ?string $package_uuid = null;
    public ?array $product_order = null;
    public ?string $product_order_uuid = null;
    public string $reason_of_reopening;
}

/** MerchantPortalPamMandatorController entity data model. */
class MerchantPortalPamMandatorController
{
    public ?string $client_secret = null;
    public string $mandator_name;
    public ?string $notification_email = null;
    public string $package_uuid;
}

/** Request payload for MerchantPortalPamMandatorController#create. */
class MerchantPortalPamMandatorControllerCreateData
{
    public ?string $client_secret = null;
    public string $mandator_name;
    public ?string $notification_email = null;
    public string $package_uuid;
}

/** MerchantPortalPamMerchantController entity data model. */
class MerchantPortalPamMerchantController
{
    public ?array $additional_data = null;
    public string $business_registration_number;
    public ?string $city = null;
    public string $company_name;
    public string $corporate_uuid;
    public ?string $country = null;
    public string $currency;
    public string $email;
    public string $language;
    public string $login;
    public string $mandator;
    public ?string $merchant_category_code = null;
    public string $merchant_contract_number;
    public ?string $merchant_name = null;
    public ?string $package_uuid = null;
    public string $packageorderuuid;
    public string $phone_number;
    public ?string $postal_code = null;
    public string $productid_acquirer;
    public ?string $region = null;
    public ?string $registration_number = null;
    public ?string $signature = null;
    public ?string $street = null;
    public ?array $terminal_id = null;
    public ?string $terminalid_acquirer = null;
    public string $vu_nummer;
}

/** Request payload for MerchantPortalPamMerchantController#create. */
class MerchantPortalPamMerchantControllerCreateData
{
    public ?array $additional_data = null;
    public string $business_registration_number;
    public ?string $city = null;
    public string $company_name;
    public string $corporate_uuid;
    public ?string $country = null;
    public string $currency;
    public string $email;
    public string $language;
    public string $login;
    public string $mandator;
    public ?string $merchant_category_code = null;
    public string $merchant_contract_number;
    public ?string $merchant_name = null;
    public ?string $package_uuid = null;
    public string $packageorderuuid;
    public string $phone_number;
    public ?string $postal_code = null;
    public string $productid_acquirer;
    public ?string $region = null;
    public ?string $registration_number = null;
    public ?string $signature = null;
    public ?string $street = null;
    public ?array $terminal_id = null;
    public ?string $terminalid_acquirer = null;
    public string $vu_nummer;
}

/** MerchantPortalPamPackageController entity data model. */
class MerchantPortalPamPackageController
{
    public ?string $consumer_uuid = null;
    public ?string $corporate_uuid = null;
    public ?string $country = null;
    public ?string $description_key = null;
    public ?array $filter = null;
    public string $language;
    public ?string $name_key = null;
    public ?string $package_status = null;
    public string $package_uuid;
    public ?array $pagination = null;
    public ?array $sorting = null;
}

/** Request payload for MerchantPortalPamPackageController#create. */
class MerchantPortalPamPackageControllerCreateData
{
    public ?string $consumer_uuid = null;
    public ?string $corporate_uuid = null;
    public ?string $country = null;
    public ?string $description_key = null;
    public ?array $filter = null;
    public string $language;
    public ?string $name_key = null;
    public ?string $package_status = null;
    public string $package_uuid;
    public ?array $pagination = null;
    public ?array $sorting = null;
}

/** MerchantPortalPamProductController entity data model. */
class MerchantPortalPamProductController
{
    public ?string $consumer_uuid = null;
    public ?array $filter = null;
    public ?string $language = null;
    public ?string $merchant_id = null;
    public string $package_order_uuid;
    public ?array $pagination = null;
    public string $product_order_uuid;
    public string $product_uuid;
    public string $reason_decline;
    public ?array $sorting = null;
}

/** Request payload for MerchantPortalPamProductController#create. */
class MerchantPortalPamProductControllerCreateData
{
    public ?string $consumer_uuid = null;
    public ?array $filter = null;
    public ?string $language = null;
    public ?string $merchant_id = null;
    public string $package_order_uuid;
    public ?array $pagination = null;
    public string $product_order_uuid;
    public string $product_uuid;
    public string $reason_decline;
    public ?array $sorting = null;
}

/** OutputAddProduct entity data model. */
class OutputAddProduct
{
    public string $package_uuid;
    public array $product_uui_d;
    public int $response_code;
    public string $response_message;
}

/** Request payload for OutputAddProduct#create. */
class OutputAddProductCreateData
{
    public string $package_uuid;
    public array $product_uui_d;
    public int $response_code;
    public string $response_message;
}

/** OutputCreateProduct entity data model. */
class OutputCreateProduct
{
    public ?string $acquirer_id = null;
    public bool $allow_multiple_order;
    public string $app_form_template_name;
    public bool $contract_needed;
    public ?bool $credentials_needed = null;
    public string $description_key;
    public string $name_key;
    public bool $prescreening_allowed;
    public string $product_name;
    public int $response_code;
    public string $response_message;
    public string $terminal_template_name;
    public string $vendor_name;
    public string $xml_template_file;
}

/** Request payload for OutputCreateProduct#create. */
class OutputCreateProductCreateData
{
    public ?string $acquirer_id = null;
    public bool $allow_multiple_order;
    public string $app_form_template_name;
    public bool $contract_needed;
    public ?bool $credentials_needed = null;
    public string $description_key;
    public string $name_key;
    public bool $prescreening_allowed;
    public string $product_name;
    public int $response_code;
    public string $response_message;
    public string $terminal_template_name;
    public string $vendor_name;
    public string $xml_template_file;
}

/** OutputDetail entity data model. */
class OutputDetail
{
    public ?array $detail = null;
    public int $response_code;
    public string $response_message;
}

/** Request payload for OutputDetail#load. */
class OutputDetailLoadMatch
{
    public string $id;
}

/** OutputList entity data model. */
class OutputList
{
    public ?array $item = null;
    public array $pagination;
    public int $response_code;
    public string $response_message;
    public ?array $sorting = null;
}

/** Request payload for OutputList#create. */
class OutputListCreateData
{
    public ?array $item = null;
    public array $pagination;
    public int $response_code;
    public string $response_message;
    public ?array $sorting = null;
}

/** OutputMessage entity data model. */
class OutputMessage
{
    public int $response_code;
    public string $response_message;
}

/** Request payload for OutputMessage#load. */
class OutputMessageLoadMatch
{
    public string $id;
}

/** OutputMoveTid entity data model. */
class OutputMoveTid
{
    public array $product_order_uui_d;
    public int $response_code;
    public string $response_message;
    public string $target_package_order_uuid;
    public string $target_product_order_uuid;
}

/** Request payload for OutputMoveTid#create. */
class OutputMoveTidCreateData
{
    public array $product_order_uui_d;
    public int $response_code;
    public string $response_message;
    public string $target_package_order_uuid;
    public string $target_product_order_uuid;
}

/** OutputRemoveProduct entity data model. */
class OutputRemoveProduct
{
    public string $package_uuid;
    public array $product_uui_d;
    public int $response_code;
    public string $response_message;
}

/** Request payload for OutputRemoveProduct#create. */
class OutputRemoveProductCreateData
{
    public string $package_uuid;
    public array $product_uui_d;
    public int $response_code;
    public string $response_message;
}

/** OutputStart entity data model. */
class OutputStart
{
    public ?string $id = null;
    public int $response_code;
    public string $response_message;
}

/** Request payload for OutputStart#create. */
class OutputStartCreateData
{
    public ?string $id = null;
    public int $response_code;
    public string $response_message;
}

/** OutputStatus entity data model. */
class OutputStatus
{
    public ?int $percentage = null;
    public int $response_code;
    public string $response_message;
    public ?string $status = null;
}

/** Request payload for OutputStatus#load. */
class OutputStatusLoadMatch
{
    public string $id;
}

/** OutputUpdateProduct entity data model. */
class OutputUpdateProduct
{
    public ?bool $allow_multiple_order = null;
    public ?string $app_form_name = null;
    public ?bool $contract_needed = null;
    public ?bool $credentials_needed = null;
    public ?string $description_key = null;
    public ?string $name_key = null;
    public ?bool $prescreening_allowed = null;
    public ?string $product_name = null;
    public ?string $product_status = null;
    public string $product_uuid;
    public int $response_code;
    public string $response_message;
    public ?string $vendor_name = null;
}

/** Request payload for OutputUpdateProduct#create. */
class OutputUpdateProductCreateData
{
    public ?bool $allow_multiple_order = null;
    public ?string $app_form_name = null;
    public ?bool $contract_needed = null;
    public ?bool $credentials_needed = null;
    public ?string $description_key = null;
    public ?string $name_key = null;
    public ?bool $prescreening_allowed = null;
    public ?string $product_name = null;
    public ?string $product_status = null;
    public string $product_uuid;
    public int $response_code;
    public string $response_message;
    public ?string $vendor_name = null;
}

