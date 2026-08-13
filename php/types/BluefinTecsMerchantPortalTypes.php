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
    public string $productOrderUUID;
}

/** Request payload for MerchantPortalPamContractController#create. */
class MerchantPortalPamContractControllerCreateData
{
    public string $language;
    public string $productOrderUUID;
}

/** MerchantPortalPamDocumentController entity data model. */
class MerchantPortalPamDocumentController
{
    public string $appFormFieldDescUUID;
    public ?string $packageOrderUUID = null;
    public ?string $productOrderUUID = null;
}

/** Request payload for MerchantPortalPamDocumentController#create. */
class MerchantPortalPamDocumentControllerCreateData
{
    public string $appFormFieldDescUUID;
    public ?string $packageOrderUUID = null;
    public ?string $productOrderUUID = null;
}

/** MerchantPortalPamFormController entity data model. */
class MerchantPortalPamFormController
{
    public string $appFormFieldsDescUUID;
    public ?array $filter = null;
    public string $language;
    public ?array $packageOrder = null;
    public string $packageOrderUUID;
    public ?string $packageUUID = null;
    public ?string $productOrderUUID = null;
    public ?array $productOrders = null;
    public string $reasonOfReopening;
}

/** Request payload for MerchantPortalPamFormController#create. */
class MerchantPortalPamFormControllerCreateData
{
    public string $appFormFieldsDescUUID;
    public ?array $filter = null;
    public string $language;
    public ?array $packageOrder = null;
    public string $packageOrderUUID;
    public ?string $packageUUID = null;
    public ?string $productOrderUUID = null;
    public ?array $productOrders = null;
    public string $reasonOfReopening;
}

/** MerchantPortalPamMandatorController entity data model. */
class MerchantPortalPamMandatorController
{
    public ?string $clientSecret = null;
    public string $mandatorName;
    public ?string $notificationEmail = null;
    public string $packageUUID;
}

/** Request payload for MerchantPortalPamMandatorController#create. */
class MerchantPortalPamMandatorControllerCreateData
{
    public ?string $clientSecret = null;
    public string $mandatorName;
    public ?string $notificationEmail = null;
    public string $packageUUID;
}

/** MerchantPortalPamMerchantController entity data model. */
class MerchantPortalPamMerchantController
{
    public ?array $additional_data = null;
    public string $businessRegistrationNumber;
    public ?string $city = null;
    public string $companyName;
    public string $corporateUUID;
    public ?string $country = null;
    public string $currency;
    public string $email;
    public string $language;
    public string $login;
    public string $mandator;
    public string $merchantContractNumber;
    public ?string $merchantName = null;
    public ?string $merchant_category_code = null;
    public ?string $packageUUID = null;
    public string $packageorderuuid;
    public string $phoneNumber;
    public ?string $postalCode = null;
    public string $productid_acquirer;
    public ?string $region = null;
    public ?string $registrationNumber = null;
    public ?string $signature = null;
    public ?string $street = null;
    public ?array $terminalIds = null;
    public ?string $terminalid_acquirer = null;
    public string $vu_nummer;
}

/** Request payload for MerchantPortalPamMerchantController#create. */
class MerchantPortalPamMerchantControllerCreateData
{
    public ?array $additional_data = null;
    public string $businessRegistrationNumber;
    public ?string $city = null;
    public string $companyName;
    public string $corporateUUID;
    public ?string $country = null;
    public string $currency;
    public string $email;
    public string $language;
    public string $login;
    public string $mandator;
    public string $merchantContractNumber;
    public ?string $merchantName = null;
    public ?string $merchant_category_code = null;
    public ?string $packageUUID = null;
    public string $packageorderuuid;
    public string $phoneNumber;
    public ?string $postalCode = null;
    public string $productid_acquirer;
    public ?string $region = null;
    public ?string $registrationNumber = null;
    public ?string $signature = null;
    public ?string $street = null;
    public ?array $terminalIds = null;
    public ?string $terminalid_acquirer = null;
    public string $vu_nummer;
}

/** MerchantPortalPamPackageController entity data model. */
class MerchantPortalPamPackageController
{
    public ?string $consumerUUID = null;
    public ?string $corporateUUID = null;
    public ?string $country = null;
    public ?string $descriptionKey = null;
    public ?array $filter = null;
    public string $language;
    public ?string $nameKey = null;
    public ?string $packageStatus = null;
    public string $packageUUID;
    public ?array $pagination = null;
    public ?array $sorting = null;
}

/** Request payload for MerchantPortalPamPackageController#create. */
class MerchantPortalPamPackageControllerCreateData
{
    public ?string $consumerUUID = null;
    public ?string $corporateUUID = null;
    public ?string $country = null;
    public ?string $descriptionKey = null;
    public ?array $filter = null;
    public string $language;
    public ?string $nameKey = null;
    public ?string $packageStatus = null;
    public string $packageUUID;
    public ?array $pagination = null;
    public ?array $sorting = null;
}

/** MerchantPortalPamProductController entity data model. */
class MerchantPortalPamProductController
{
    public ?string $consumerUUID = null;
    public ?array $filter = null;
    public ?string $language = null;
    public ?string $merchantID = null;
    public string $packageOrderUUID;
    public ?array $pagination = null;
    public string $productOrderUUID;
    public string $productUUID;
    public string $reason_decline;
    public ?array $sorting = null;
}

/** Request payload for MerchantPortalPamProductController#create. */
class MerchantPortalPamProductControllerCreateData
{
    public ?string $consumerUUID = null;
    public ?array $filter = null;
    public ?string $language = null;
    public ?string $merchantID = null;
    public string $packageOrderUUID;
    public ?array $pagination = null;
    public string $productOrderUUID;
    public string $productUUID;
    public string $reason_decline;
    public ?array $sorting = null;
}

/** OutputAddProduct entity data model. */
class OutputAddProduct
{
    public string $packageUUID;
    public array $productUUIDs;
    public int $responseCode;
    public string $responseMessage;
}

/** Request payload for OutputAddProduct#create. */
class OutputAddProductCreateData
{
    public string $packageUUID;
    public array $productUUIDs;
    public int $responseCode;
    public string $responseMessage;
}

/** OutputCreateProduct entity data model. */
class OutputCreateProduct
{
    public ?string $acquirerId = null;
    public bool $allowMultipleOrders;
    public string $appFormTemplateName;
    public bool $contractNeeded;
    public ?bool $credentialsNeeded = null;
    public string $descriptionKey;
    public string $nameKey;
    public bool $prescreeningAllowed;
    public string $productName;
    public int $responseCode;
    public string $responseMessage;
    public string $terminalTemplateName;
    public string $vendorName;
    public string $xmlTemplateFile;
}

/** Request payload for OutputCreateProduct#create. */
class OutputCreateProductCreateData
{
    public ?string $acquirerId = null;
    public bool $allowMultipleOrders;
    public string $appFormTemplateName;
    public bool $contractNeeded;
    public ?bool $credentialsNeeded = null;
    public string $descriptionKey;
    public string $nameKey;
    public bool $prescreeningAllowed;
    public string $productName;
    public int $responseCode;
    public string $responseMessage;
    public string $terminalTemplateName;
    public string $vendorName;
    public string $xmlTemplateFile;
}

/** OutputDetail entity data model. */
class OutputDetail
{
    public ?array $batch = null;
    public ?array $lines = null;
    public ?array $progress = null;
}

/** Request payload for OutputDetail#load. */
class OutputDetailLoadMatch
{
    public string $id;
}

/** OutputList entity data model. */
class OutputList
{
    public ?array $items = null;
    public array $pagination;
    public int $responseCode;
    public string $responseMessage;
    public ?array $sorting = null;
}

/** Request payload for OutputList#create. */
class OutputListCreateData
{
    public ?array $items = null;
    public array $pagination;
    public int $responseCode;
    public string $responseMessage;
    public ?array $sorting = null;
}

/** OutputMessage entity data model. */
class OutputMessage
{
    public int $responseCode;
    public string $responseMessage;
}

/** Request payload for OutputMessage#load. */
class OutputMessageLoadMatch
{
    public string $id;
}

/** OutputMoveTid entity data model. */
class OutputMoveTid
{
    public array $productOrderUUIDs;
    public int $responseCode;
    public string $responseMessage;
    public string $targetPackageOrderUUID;
    public string $targetProductOrderUUID;
}

/** Request payload for OutputMoveTid#create. */
class OutputMoveTidCreateData
{
    public array $productOrderUUIDs;
    public int $responseCode;
    public string $responseMessage;
    public string $targetPackageOrderUUID;
    public string $targetProductOrderUUID;
}

/** OutputRemoveProduct entity data model. */
class OutputRemoveProduct
{
    public string $packageUUID;
    public array $productUUIDs;
    public int $responseCode;
    public string $responseMessage;
}

/** Request payload for OutputRemoveProduct#create. */
class OutputRemoveProductCreateData
{
    public string $packageUUID;
    public array $productUUIDs;
    public int $responseCode;
    public string $responseMessage;
}

/** OutputStart entity data model. */
class OutputStart
{
    public ?string $id = null;
    public int $responseCode;
    public string $responseMessage;
}

/** Request payload for OutputStart#create. */
class OutputStartCreateData
{
    public ?string $id = null;
    public int $responseCode;
    public string $responseMessage;
}

/** OutputStatus entity data model. */
class OutputStatus
{
    public ?int $percentage = null;
    public int $responseCode;
    public string $responseMessage;
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
    public ?bool $allowMultipleOrders = null;
    public ?string $appFormName = null;
    public ?bool $contractNeeded = null;
    public ?bool $credentialsNeeded = null;
    public ?string $descriptionKey = null;
    public ?string $nameKey = null;
    public ?bool $prescreeningAllowed = null;
    public ?string $productName = null;
    public ?string $productStatus = null;
    public string $productUUID;
    public int $responseCode;
    public string $responseMessage;
    public ?string $vendorName = null;
}

/** Request payload for OutputUpdateProduct#create. */
class OutputUpdateProductCreateData
{
    public ?bool $allowMultipleOrders = null;
    public ?string $appFormName = null;
    public ?bool $contractNeeded = null;
    public ?bool $credentialsNeeded = null;
    public ?string $descriptionKey = null;
    public ?string $nameKey = null;
    public ?bool $prescreeningAllowed = null;
    public ?string $productName = null;
    public ?string $productStatus = null;
    public string $productUUID;
    public int $responseCode;
    public string $responseMessage;
    public ?string $vendorName = null;
}

