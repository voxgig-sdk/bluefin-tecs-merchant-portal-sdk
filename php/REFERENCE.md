# BluefinTecsMerchantPortal PHP SDK Reference

Complete API reference for the BluefinTecsMerchantPortal PHP SDK.


## BluefinTecsMerchantPortalSDK

### Constructor

```php
require_once __DIR__ . '/bluefintecsmerchantportal_sdk.php';

$client = new BluefinTecsMerchantPortalSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinTecsMerchantPortalSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = BluefinTecsMerchantPortalSDK::test();
```


### Instance Methods

#### `MerchantPortalApiController($data = null)`

Create a new `MerchantPortalApiControllerEntity` instance. Pass `null` for no initial data.

#### `MerchantPortalCommonController($data = null)`

Create a new `MerchantPortalCommonControllerEntity` instance. Pass `null` for no initial data.

#### `MerchantPortalPamContractController($data = null)`

Create a new `MerchantPortalPamContractControllerEntity` instance. Pass `null` for no initial data.

#### `MerchantPortalPamDocumentController($data = null)`

Create a new `MerchantPortalPamDocumentControllerEntity` instance. Pass `null` for no initial data.

#### `MerchantPortalPamFormController($data = null)`

Create a new `MerchantPortalPamFormControllerEntity` instance. Pass `null` for no initial data.

#### `MerchantPortalPamMandatorController($data = null)`

Create a new `MerchantPortalPamMandatorControllerEntity` instance. Pass `null` for no initial data.

#### `MerchantPortalPamMerchantController($data = null)`

Create a new `MerchantPortalPamMerchantControllerEntity` instance. Pass `null` for no initial data.

#### `MerchantPortalPamPackageController($data = null)`

Create a new `MerchantPortalPamPackageControllerEntity` instance. Pass `null` for no initial data.

#### `MerchantPortalPamProductController($data = null)`

Create a new `MerchantPortalPamProductControllerEntity` instance. Pass `null` for no initial data.

#### `OutputAddProduct($data = null)`

Create a new `OutputAddProductEntity` instance. Pass `null` for no initial data.

#### `OutputCreateProduct($data = null)`

Create a new `OutputCreateProductEntity` instance. Pass `null` for no initial data.

#### `OutputDetail($data = null)`

Create a new `OutputDetailEntity` instance. Pass `null` for no initial data.

#### `OutputList($data = null)`

Create a new `OutputListEntity` instance. Pass `null` for no initial data.

#### `OutputMessage($data = null)`

Create a new `OutputMessageEntity` instance. Pass `null` for no initial data.

#### `OutputMoveTid($data = null)`

Create a new `OutputMoveTidEntity` instance. Pass `null` for no initial data.

#### `OutputRemoveProduct($data = null)`

Create a new `OutputRemoveProductEntity` instance. Pass `null` for no initial data.

#### `OutputStart($data = null)`

Create a new `OutputStartEntity` instance. Pass `null` for no initial data.

#### `OutputStatus($data = null)`

Create a new `OutputStatusEntity` instance. Pass `null` for no initial data.

#### `OutputUpdateProduct($data = null)`

Create a new `OutputUpdateProductEntity` instance. Pass `null` for no initial data.

#### `options_map(): array`

Return a deep copy of the current SDK options.

#### `get_utility(): BluefinTecsMerchantPortalUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. This is the raw-HTTP escape
hatch: it does **not** throw. It returns a result array
`["ok" => bool, "status" => int, "headers" => array, "data" => mixed]`, or
`["ok" => false, "err" => \Exception]` on failure. Branch on `$result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array` — the result dict (see above); never throws.

#### `prepare(array $fetchargs = []): mixed`

Prepare a fetch definition without sending the request. Returns the
`$fetchdef` array. Throws on error.


---

## MerchantPortalApiControllerEntity

```php
$merchant_portal_api_controller = $client->MerchantPortalApiController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `int` | No | Account number provided by the acquirer. |
| `additional_data` | `array` | No | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `string` | Yes | Merchant business registration number as stated in the company registry. |
| `city` | `string` | Yes | Merchant's address: city. |
| `corporateuuid` | `string` | No | Unique identifier for the corporate entity (UUID format). |
| `country` | `string` | Yes | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `string` | Yes | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `int` | Yes | Merchant category code as defined by the payment network. |
| `merchant_email` | `string` | No | Merchant's email address for receiving notifications. |
| `merchant_name` | `string` | Yes | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | `string` | No | Merchant's phone number for notifications. |
| `packageid` | `string` | Yes | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | `string` | Yes | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | `string` | No | Merchant password for MPOS. |
| `productid` | `string` | No | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | `string` | No | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | `string` | Yes | Reason for terminal deactivation. |
| `reason_reactivation` | `string` | Yes | Reason for terminal reactivation. |
| `sorting_code` | `int` | No | Sorting code provided by the acquirer. |
| `state` | `string` | No | Merchant's address: state. |
| `street` | `string` | Yes | Merchant's address: street and house number. |
| `terminal_country_code` | `string` | Yes | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `string` | Yes | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `string` | Yes | Physical or logical location of the terminal. |
| `terminal_serial_number` | `string` | Yes | Terminal serial number. |
| `terminalid` | `int` | Yes | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `string` | No | Terminal ID as set by the acquirer (optional). |
| `user_email` | `string` | No | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `string` | No | Phone number of the user acting on behalf of the merchant. |
| `username` | `string` | No | Merchant username for MPOS. |
| `vu_nummer` | `string` | Yes | Merchant contract number with the acquirer. |
| `web_shop_url` | `string` | No | URL of the merchant's web shop. |
| `zipcode` | `string` | Yes | Merchant's address: postal code. |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->MerchantPortalApiController()->create([
  "business_reg_number" => null, // string
  "city" => null, // string
  "country" => null, // string
  "currency" => null, // string
  "merchant_category_code" => null, // int
  "merchant_name" => null, // string
  "packageid" => null, // string
  "packageorderuuid" => null, // string
  "reason_deactivation" => null, // string
  "reason_reactivation" => null, // string
  "street" => null, // string
  "terminal_country_code" => null, // string
  "terminal_language_code" => null, // string
  "terminal_location" => null, // string
  "terminal_serial_number" => null, // string
  "terminalid" => null, // int
  "vu_nummer" => null, // string
  "zipcode" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): MerchantPortalApiControllerEntity`

Create a new `MerchantPortalApiControllerEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## MerchantPortalCommonControllerEntity

```php
$merchant_portal_common_controller = $client->MerchantPortalCommonController();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->MerchantPortalCommonController()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): MerchantPortalCommonControllerEntity`

Create a new `MerchantPortalCommonControllerEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## MerchantPortalPamContractControllerEntity

```php
$merchant_portal_pam_contract_controller = $client->MerchantPortalPamContractController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `string` | Yes |  |
| `productOrderUUID` | `string` | Yes |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->MerchantPortalPamContractController()->create([
  "language" => null, // string
  "productOrderUUID" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): MerchantPortalPamContractControllerEntity`

Create a new `MerchantPortalPamContractControllerEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## MerchantPortalPamDocumentControllerEntity

```php
$merchant_portal_pam_document_controller = $client->MerchantPortalPamDocumentController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appFormFieldDescUUID` | `string` | Yes |  |
| `packageOrderUUID` | `string` | No | UUID of the package order. |
| `productOrderUUID` | `string` | No | UUID of the product order. |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->MerchantPortalPamDocumentController()->create([
  "appFormFieldDescUUID" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): MerchantPortalPamDocumentControllerEntity`

Create a new `MerchantPortalPamDocumentControllerEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## MerchantPortalPamFormControllerEntity

```php
$merchant_portal_pam_form_controller = $client->MerchantPortalPamFormController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appFormFieldsDescUUID` | `string` | Yes |  |
| `filter` | `array` | No |  |
| `language` | `string` | Yes |  |
| `packageOrder` | `array` | No |  |
| `packageOrderUUID` | `string` | Yes | UUID of the package order. |
| `packageUUID` | `string` | No |  |
| `productOrderUUID` | `string` | No | UUID of the product order. |
| `productOrders` | `array` | No |  |
| `reasonOfReopening` | `string` | Yes |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `appFormFieldsDescUUID` | - |
| `filter` | - |
| `language` | Yes |
| `packageOrder` | - |
| `packageOrderUUID` | Yes |
| `packageUUID` | - |
| `productOrderUUID` | Yes |
| `productOrders` | - |
| `reasonOfReopening` | - |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->MerchantPortalPamFormController()->create([
  "appFormFieldsDescUUID" => null, // string
  "language" => null, // string
  "packageOrderUUID" => null, // string
  "reasonOfReopening" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): MerchantPortalPamFormControllerEntity`

Create a new `MerchantPortalPamFormControllerEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## MerchantPortalPamMandatorControllerEntity

```php
$merchant_portal_pam_mandator_controller = $client->MerchantPortalPamMandatorController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `clientSecret` | `string` | No |  |
| `mandatorName` | `string` | Yes |  |
| `notificationEmail` | `string` | No |  |
| `packageUUID` | `string` | Yes |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->MerchantPortalPamMandatorController()->create([
  "mandatorName" => null, // string
  "packageUUID" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): MerchantPortalPamMandatorControllerEntity`

Create a new `MerchantPortalPamMandatorControllerEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## MerchantPortalPamMerchantControllerEntity

```php
$merchant_portal_pam_merchant_controller = $client->MerchantPortalPamMerchantController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `array` | No | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` | `string` | Yes |  |
| `city` | `string` | No | City where the merchant is located. |
| `companyName` | `string` | Yes |  |
| `corporateUUID` | `string` | Yes | Unique identifier for the corporate entity. |
| `country` | `string` | No | Country where the merchant is located. |
| `currency` | `string` | Yes | Transaction currency in ISO 4217 format. |
| `email` | `string` | Yes |  |
| `language` | `string` | Yes |  |
| `login` | `string` | Yes |  |
| `mandator` | `string` | Yes | Mandator name assigned by TECS. |
| `merchantContractNumber` | `string` | Yes | Unique identifier for the merchant within a specific system. |
| `merchantName` | `string` | No | Name of the merchant. |
| `merchant_category_code` | `string` | No | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | `string` | No | UUID of the package. |
| `packageorderuuid` | `string` | Yes | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` | `string` | Yes |  |
| `postalCode` | `string` | No | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | `string` | Yes | Identifier of the product for which acquiring is to be enabled. |
| `region` | `string` | No | State or province where the merchant is located. |
| `registrationNumber` | `string` | No | Business registration number. |
| `signature` | `string` | No | Signature value = saltAsHex-hashAsHex. |
| `street` | `string` | No | Street address of the merchant. |
| `terminalIds` | `array` | No | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `string` | No | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `string` | Yes | Merchant contract number with the acquirer. |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `additional_data` | - |
| `businessRegistrationNumber` | - |
| `city` | - |
| `companyName` | - |
| `corporateUUID` | - |
| `country` | - |
| `currency` | - |
| `email` | - |
| `language` | - |
| `login` | - |
| `mandator` | - |
| `merchantContractNumber` | Yes |
| `merchantName` | - |
| `merchant_category_code` | - |
| `packageUUID` | - |
| `packageorderuuid` | - |
| `phoneNumber` | - |
| `postalCode` | - |
| `productid_acquirer` | - |
| `region` | - |
| `registrationNumber` | - |
| `signature` | - |
| `street` | - |
| `terminalIds` | - |
| `terminalid_acquirer` | - |
| `vu_nummer` | - |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->MerchantPortalPamMerchantController()->create([
  "businessRegistrationNumber" => null, // string
  "companyName" => null, // string
  "corporateUUID" => null, // string
  "currency" => null, // string
  "email" => null, // string
  "language" => null, // string
  "login" => null, // string
  "mandator" => null, // string
  "merchantContractNumber" => null, // string
  "packageorderuuid" => null, // string
  "phoneNumber" => null, // string
  "productid_acquirer" => null, // string
  "vu_nummer" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): MerchantPortalPamMerchantControllerEntity`

Create a new `MerchantPortalPamMerchantControllerEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## MerchantPortalPamPackageControllerEntity

```php
$merchant_portal_pam_package_controller = $client->MerchantPortalPamPackageController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumerUUID` | `string` | No |  |
| `corporateUUID` | `string` | No |  |
| `country` | `string` | No | Country associated with the package. |
| `descriptionKey` | `string` | No | Key for the description of the package. |
| `filter` | `array` | No |  |
| `language` | `string` | Yes |  |
| `nameKey` | `string` | No | Key for the name of the package. |
| `packageStatus` | `string` | No | Status of the package. |
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `pagination` | `array` | No |  |
| `sorting` | `array` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `consumerUUID` | - |
| `corporateUUID` | - |
| `country` | - |
| `descriptionKey` | - |
| `filter` | - |
| `language` | Yes |
| `nameKey` | - |
| `packageStatus` | - |
| `packageUUID` | - |
| `pagination` | - |
| `sorting` | - |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->MerchantPortalPamPackageController()->create([
  "language" => null, // string
  "packageUUID" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): MerchantPortalPamPackageControllerEntity`

Create a new `MerchantPortalPamPackageControllerEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## MerchantPortalPamProductControllerEntity

```php
$merchant_portal_pam_product_controller = $client->MerchantPortalPamProductController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumerUUID` | `string` | No |  |
| `filter` | `array` | No |  |
| `language` | `string` | No |  |
| `merchantID` | `string` | No |  |
| `packageOrderUUID` | `string` | Yes |  |
| `pagination` | `array` | No |  |
| `productOrderUUID` | `string` | Yes |  |
| `productUUID` | `string` | Yes |  |
| `reason_decline` | `string` | Yes | Reason for product decline. |
| `sorting` | `array` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->MerchantPortalPamProductController()->create([
  "packageOrderUUID" => null, // string
  "productOrderUUID" => null, // string
  "productUUID" => null, // string
  "reason_decline" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): MerchantPortalPamProductControllerEntity`

Create a new `MerchantPortalPamProductControllerEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## OutputAddProductEntity

```php
$output_add_product = $client->OutputAddProduct();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `productUUIDs` | `array` | Yes | The list of unique identifiers of the products. |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->OutputAddProduct()->create([
  "packageUUID" => null, // string
  "productUUIDs" => null, // array
  "responseCode" => null, // int
  "responseMessage" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): OutputAddProductEntity`

Create a new `OutputAddProductEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## OutputCreateProductEntity

```php
$output_create_product = $client->OutputCreateProduct();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acquirerId` | `string` | No | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `bool` | Yes | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `string` | Yes | Name of the application form template. |
| `contractNeeded` | `bool` | Yes | Indication whether contract is needed or not. |
| `credentialsNeeded` | `bool` | No | Indication whether credentials are needed or not. |
| `descriptionKey` | `string` | Yes | Key indicator for product description. |
| `nameKey` | `string` | Yes | Key indicator for product name. |
| `prescreeningAllowed` | `bool` | Yes | Indication whether prescreening is allowed or not. |
| `productName` | `string` | Yes | Name of the product. |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `terminalTemplateName` | `string` | Yes | Name of the terminal template. |
| `vendorName` | `string` | Yes | Name of the vendor. |
| `xmlTemplateFile` | `string` | Yes | A string value containing the XML template file encoded in Base64. |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->OutputCreateProduct()->create([
  "allowMultipleOrders" => null, // bool
  "appFormTemplateName" => null, // string
  "contractNeeded" => null, // bool
  "descriptionKey" => null, // string
  "nameKey" => null, // string
  "prescreeningAllowed" => null, // bool
  "productName" => null, // string
  "responseCode" => null, // int
  "responseMessage" => null, // string
  "terminalTemplateName" => null, // string
  "vendorName" => null, // string
  "xmlTemplateFile" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): OutputCreateProductEntity`

Create a new `OutputCreateProductEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## OutputDetailEntity

```php
$output_detail = $client->OutputDetail();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `batch` | `array` | No |  |
| `lines` | `array` | No |  |
| `progress` | `array` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->OutputDetail()->load(["id" => "output_detail_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): OutputDetailEntity`

Create a new `OutputDetailEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## OutputListEntity

```php
$output_list = $client->OutputList();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `items` | `array` | No |  |
| `pagination` | `array` | Yes |  |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `sorting` | `array` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `items` | - |
| `pagination` | Yes |
| `responseCode` | - |
| `responseMessage` | - |
| `sorting` | - |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->OutputList()->create([
  "pagination" => null, // array
  "responseCode" => null, // int
  "responseMessage" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): OutputListEntity`

Create a new `OutputListEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## OutputMessageEntity

```php
$output_message = $client->OutputMessage();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->OutputMessage()->load(["id" => "output_message_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): OutputMessageEntity`

Create a new `OutputMessageEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## OutputMoveTidEntity

```php
$output_move_tid = $client->OutputMoveTid();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `productOrderUUIDs` | `array` | Yes |  |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `targetPackageOrderUUID` | `string` | Yes |  |
| `targetProductOrderUUID` | `string` | Yes |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->OutputMoveTid()->create([
  "productOrderUUIDs" => null, // array
  "responseCode" => null, // int
  "responseMessage" => null, // string
  "targetPackageOrderUUID" => null, // string
  "targetProductOrderUUID" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): OutputMoveTidEntity`

Create a new `OutputMoveTidEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## OutputRemoveProductEntity

```php
$output_remove_product = $client->OutputRemoveProduct();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `productUUIDs` | `array` | Yes | List of product unique identifiers. |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->OutputRemoveProduct()->create([
  "packageUUID" => null, // string
  "productUUIDs" => null, // array
  "responseCode" => null, // int
  "responseMessage" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): OutputRemoveProductEntity`

Create a new `OutputRemoveProductEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## OutputStartEntity

```php
$output_start = $client->OutputStart();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No |  |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->OutputStart()->create([
  "responseCode" => null, // int
  "responseMessage" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): OutputStartEntity`

Create a new `OutputStartEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## OutputStatusEntity

```php
$output_status = $client->OutputStatus();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `int` | No |  |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `status` | `string` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->OutputStatus()->load(["id" => "output_status_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): OutputStatusEntity`

Create a new `OutputStatusEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## OutputUpdateProductEntity

```php
$output_update_product = $client->OutputUpdateProduct();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `allowMultipleOrders` | `bool` | No | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `string` | No | The name of the application form |
| `contractNeeded` | `bool` | No | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `bool` | No | An attribute to indicate if credentials are needed |
| `descriptionKey` | `string` | No | The description of the product |
| `nameKey` | `string` | No | The key of the product name |
| `prescreeningAllowed` | `bool` | No | An attribute to indicate if prescreening is allowed |
| `productName` | `string` | No | The name of the product |
| `productStatus` | `string` | No | The status of the product |
| `productUUID` | `string` | Yes | The UUID of the product to update |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `vendorName` | `string` | No | The name of the vendor |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->OutputUpdateProduct()->create([
  "productUUID" => null, // string
  "responseCode" => null, // int
  "responseMessage" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): OutputUpdateProductEntity`

Create a new `OutputUpdateProductEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new BluefinTecsMerchantPortalSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```

