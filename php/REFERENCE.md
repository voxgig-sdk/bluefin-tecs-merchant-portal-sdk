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
| `account_number` | `int` | No |  |
| `additional_data` | `array` | No |  |
| `business_reg_number` | `string` | Yes |  |
| `city` | `string` | Yes |  |
| `corporateuuid` | `string` | No |  |
| `country` | `string` | Yes |  |
| `currency` | `string` | Yes |  |
| `merchant_category_code` | `int` | Yes |  |
| `merchant_email` | `string` | No |  |
| `merchant_name` | `string` | Yes |  |
| `merchant_phone_number` | `string` | No |  |
| `packageid` | `string` | Yes |  |
| `packageorderuuid` | `string` | Yes |  |
| `password` | `string` | No |  |
| `productid` | `string` | No |  |
| `productid_acquirer` | `string` | No |  |
| `reason_deactivation` | `string` | Yes |  |
| `reason_reactivation` | `string` | Yes |  |
| `sorting_code` | `int` | No |  |
| `state` | `string` | No |  |
| `street` | `string` | Yes |  |
| `terminal_country_code` | `string` | Yes |  |
| `terminal_language_code` | `string` | Yes |  |
| `terminal_location` | `string` | Yes |  |
| `terminal_serial_number` | `string` | Yes |  |
| `terminalid` | `int` | Yes |  |
| `terminalid_acquirer` | `string` | No |  |
| `user_email` | `string` | No |  |
| `user_phone_number` | `string` | No |  |
| `username` | `string` | No |  |
| `vu_nummer` | `string` | Yes |  |
| `web_shop_url` | `string` | No |  |
| `zipcode` | `string` | Yes |  |

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
| `product_order_uuid` | `string` | Yes |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->MerchantPortalPamContractController()->create([
  "language" => null, // string
  "product_order_uuid" => null, // string
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
| `app_form_field_desc_uuid` | `string` | Yes |  |
| `package_order_uuid` | `string` | No |  |
| `product_order_uuid` | `string` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->MerchantPortalPamDocumentController()->create([
  "app_form_field_desc_uuid" => null, // string
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
| `app_form_fields_desc_uuid` | `string` | Yes |  |
| `filter` | `array` | No |  |
| `language` | `string` | Yes |  |
| `package_order` | `array` | No |  |
| `package_order_uuid` | `string` | Yes |  |
| `package_uuid` | `string` | No |  |
| `product_order` | `array` | No |  |
| `product_order_uuid` | `string` | No |  |
| `reason_of_reopening` | `string` | Yes |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `app_form_fields_desc_uuid` | - |
| `filter` | - |
| `language` | Yes |
| `package_order` | - |
| `package_order_uuid` | Yes |
| `package_uuid` | - |
| `product_order` | - |
| `product_order_uuid` | Yes |
| `reason_of_reopening` | - |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->MerchantPortalPamFormController()->create([
  "app_form_fields_desc_uuid" => null, // string
  "language" => null, // string
  "package_order_uuid" => null, // string
  "reason_of_reopening" => null, // string
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
| `client_secret` | `string` | No |  |
| `mandator_name` | `string` | Yes |  |
| `notification_email` | `string` | No |  |
| `package_uuid` | `string` | Yes |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->MerchantPortalPamMandatorController()->create([
  "mandator_name" => null, // string
  "package_uuid" => null, // string
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
| `additional_data` | `array` | No |  |
| `business_registration_number` | `string` | Yes |  |
| `city` | `string` | No |  |
| `company_name` | `string` | Yes |  |
| `corporate_uuid` | `string` | Yes |  |
| `country` | `string` | No |  |
| `currency` | `string` | Yes |  |
| `email` | `string` | Yes |  |
| `language` | `string` | Yes |  |
| `login` | `string` | Yes |  |
| `mandator` | `string` | Yes |  |
| `merchant_category_code` | `string` | No |  |
| `merchant_contract_number` | `string` | Yes |  |
| `merchant_name` | `string` | No |  |
| `package_uuid` | `string` | No |  |
| `packageorderuuid` | `string` | Yes |  |
| `phone_number` | `string` | Yes |  |
| `postal_code` | `string` | No |  |
| `productid_acquirer` | `string` | Yes |  |
| `region` | `string` | No |  |
| `registration_number` | `string` | No |  |
| `signature` | `string` | No |  |
| `street` | `string` | No |  |
| `terminal_id` | `array` | No |  |
| `terminalid_acquirer` | `string` | No |  |
| `vu_nummer` | `string` | Yes |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `additional_data` | - |
| `business_registration_number` | - |
| `city` | - |
| `company_name` | - |
| `corporate_uuid` | - |
| `country` | - |
| `currency` | - |
| `email` | - |
| `language` | - |
| `login` | - |
| `mandator` | - |
| `merchant_category_code` | - |
| `merchant_contract_number` | Yes |
| `merchant_name` | - |
| `package_uuid` | - |
| `packageorderuuid` | - |
| `phone_number` | - |
| `postal_code` | - |
| `productid_acquirer` | - |
| `region` | - |
| `registration_number` | - |
| `signature` | - |
| `street` | - |
| `terminal_id` | - |
| `terminalid_acquirer` | - |
| `vu_nummer` | - |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->MerchantPortalPamMerchantController()->create([
  "business_registration_number" => null, // string
  "company_name" => null, // string
  "corporate_uuid" => null, // string
  "currency" => null, // string
  "email" => null, // string
  "language" => null, // string
  "login" => null, // string
  "mandator" => null, // string
  "merchant_contract_number" => null, // string
  "packageorderuuid" => null, // string
  "phone_number" => null, // string
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
| `consumer_uuid` | `string` | No |  |
| `corporate_uuid` | `string` | No |  |
| `country` | `string` | No |  |
| `description_key` | `string` | No |  |
| `filter` | `array` | No |  |
| `language` | `string` | Yes |  |
| `name_key` | `string` | No |  |
| `package_status` | `string` | No |  |
| `package_uuid` | `string` | Yes |  |
| `pagination` | `array` | No |  |
| `sorting` | `array` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `consumer_uuid` | - |
| `corporate_uuid` | - |
| `country` | - |
| `description_key` | - |
| `filter` | - |
| `language` | Yes |
| `name_key` | - |
| `package_status` | - |
| `package_uuid` | - |
| `pagination` | - |
| `sorting` | - |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->MerchantPortalPamPackageController()->create([
  "language" => null, // string
  "package_uuid" => null, // string
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
| `consumer_uuid` | `string` | No |  |
| `filter` | `array` | No |  |
| `language` | `string` | No |  |
| `merchant_id` | `string` | No |  |
| `package_order_uuid` | `string` | Yes |  |
| `pagination` | `array` | No |  |
| `product_order_uuid` | `string` | Yes |  |
| `product_uuid` | `string` | Yes |  |
| `reason_decline` | `string` | Yes |  |
| `sorting` | `array` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->MerchantPortalPamProductController()->create([
  "package_order_uuid" => null, // string
  "product_order_uuid" => null, // string
  "product_uuid" => null, // string
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
| `package_uuid` | `string` | Yes |  |
| `product_uui_d` | `array` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->OutputAddProduct()->create([
  "package_uuid" => null, // string
  "product_uui_d" => null, // array
  "response_code" => null, // int
  "response_message" => null, // string
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
| `acquirer_id` | `string` | No |  |
| `allow_multiple_order` | `bool` | Yes |  |
| `app_form_template_name` | `string` | Yes |  |
| `contract_needed` | `bool` | Yes |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `string` | Yes |  |
| `name_key` | `string` | Yes |  |
| `prescreening_allowed` | `bool` | Yes |  |
| `product_name` | `string` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |
| `terminal_template_name` | `string` | Yes |  |
| `vendor_name` | `string` | Yes |  |
| `xml_template_file` | `string` | Yes |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->OutputCreateProduct()->create([
  "allow_multiple_order" => null, // bool
  "app_form_template_name" => null, // string
  "contract_needed" => null, // bool
  "description_key" => null, // string
  "name_key" => null, // string
  "prescreening_allowed" => null, // bool
  "product_name" => null, // string
  "response_code" => null, // int
  "response_message" => null, // string
  "terminal_template_name" => null, // string
  "vendor_name" => null, // string
  "xml_template_file" => null, // string
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
| `detail` | `array` | No |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |

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
| `item` | `array` | No |  |
| `pagination` | `array` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |
| `sorting` | `array` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->OutputList()->create([
  "pagination" => null, // array
  "response_code" => null, // int
  "response_message" => null, // string
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
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |

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
| `product_order_uui_d` | `array` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |
| `target_package_order_uuid` | `string` | Yes |  |
| `target_product_order_uuid` | `string` | Yes |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->OutputMoveTid()->create([
  "product_order_uui_d" => null, // array
  "response_code" => null, // int
  "response_message" => null, // string
  "target_package_order_uuid" => null, // string
  "target_product_order_uuid" => null, // string
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
| `package_uuid` | `string` | Yes |  |
| `product_uui_d` | `array` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->OutputRemoveProduct()->create([
  "package_uuid" => null, // string
  "product_uui_d" => null, // array
  "response_code" => null, // int
  "response_message" => null, // string
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
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->OutputStart()->create([
  "response_code" => null, // int
  "response_message" => null, // string
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
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |
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
| `allow_multiple_order` | `bool` | No |  |
| `app_form_name` | `string` | No |  |
| `contract_needed` | `bool` | No |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `string` | No |  |
| `name_key` | `string` | No |  |
| `prescreening_allowed` | `bool` | No |  |
| `product_name` | `string` | No |  |
| `product_status` | `string` | No |  |
| `product_uuid` | `string` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |
| `vendor_name` | `string` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->OutputUpdateProduct()->create([
  "product_uuid" => null, // string
  "response_code" => null, // int
  "response_message" => null, // string
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

