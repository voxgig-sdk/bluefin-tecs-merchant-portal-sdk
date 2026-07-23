# BluefinTecsMerchantPortal PHP SDK



The PHP SDK for the BluefinTecsMerchantPortal API — an entity-oriented client using PHP conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `$client->MerchantPortalApiController()` — with named operations (`load`/`create`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Packagist. Install it from the
GitHub release tag (`php/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```php
<?php
require_once 'bluefintecsmerchantportal_sdk.php';

$client = new BluefinTecsMerchantPortalSDK();
```

### 4. Create, update, and remove

```php
// create() returns the bare created MerchantPortalApiController record.
$created = $client->MerchantPortalApiController()->create(["business_reg_number" => "example_business_reg_number", "city" => "example_city", "country" => "example_country", "currency" => "example_currency", "merchant_category_code" => 1, "merchant_name" => "example_merchant_name", "packageid" => "example_packageid", "packageorderuuid" => "example_packageorderuuid", "reason_deactivation" => "example_reason_deactivation", "reason_reactivation" => "example_reason_reactivation", "street" => "example_street", "terminal_country_code" => "example_terminal_country_code", "terminal_language_code" => "example_terminal_language_code", "terminal_location" => "example_terminal_location", "terminal_serial_number" => "example_terminal_serial_number", "terminalid" => 1, "vu_nummer" => "example_vu_nummer", "zipcode" => "example_zipcode"]);

```


## Error handling

Entity operations throw a `\Throwable` on failure, so wrap them in
`try` / `catch`:

```php
try {
    $outputdetail = $client->OutputDetail()->load(["id" => "example_id"]);
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```

`direct()` does **not** throw — it returns the result array. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```php
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example_id"],
]);

if (! $result["ok"]) {
    $err = $result["err"] ?? null;
    echo "request failed: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```php
// direct() is the raw-HTTP escape hatch: it returns a result array
// (it does not throw). Branch on $result["ok"].
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);

if ($result["ok"]) {
    echo $result["status"];  // 200
    print_r($result["data"]);  // response body
} else {
    // On an HTTP error status there is no err (only a transport failure sets
    // it), so fall back to the status code.
    $err = $result["err"] ?? null;
    echo "Error: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```

### Prepare a request without sending it

```php
// prepare() throws on error and returns the fetch definition.
$fetchdef = $client->prepare([
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => ["id" => "example"],
]);

echo $fetchdef["url"];
echo $fetchdef["method"];
print_r($fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required. Seed fixture
data via the `entity` option so offline calls resolve without a live server:

```php
$client = BluefinTecsMerchantPortalSDK::test([
    "entity" => ["outputdetail" => ["test01" => ["id" => "test01"]]],
]);

// Entity ops return the bare mock record (throws on error).
$outputdetail = $client->OutputDetail()->load(["id" => "test01"]);
print_r($outputdetail);
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```php
$mock_fetch = function ($url, $init) {
    return [
        [
            "status" => 200,
            "statusText" => "OK",
            "headers" => [],
            "json" => function () { return ["id" => "mock01"]; },
        ],
        null,
    ];
};

$client = new BluefinTecsMerchantPortalSDK([
    "base" => "http://localhost:8080",
    "system" => [
        "fetch" => $mock_fetch,
    ],
]);
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run:

```bash
cd php && ./vendor/bin/phpunit test/
```


## Reference

### BluefinTecsMerchantPortalSDK

```php
require_once 'bluefintecsmerchantportal_sdk.php';
$client = new BluefinTecsMerchantPortalSDK($options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `array` | Feature activation flags. |
| `extend` | `array` | Additional Feature instances to load. |
| `system` | `array` | System overrides (e.g. custom `fetch` callable). |

### test

```php
$client = BluefinTecsMerchantPortalSDK::test($testopts, $sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinTecsMerchantPortalSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `(): array` | Deep copy of current SDK options. |
| `get_utility` | `(): Utility` | Copy of the SDK utility object. |
| `prepare` | `(array $fetchargs): array` | Build an HTTP request definition without sending. |
| `direct` | `(array $fetchargs): array` | Build and send an HTTP request. |
| `MerchantPortalApiController` | `($data): MerchantPortalApiControllerEntity` | Create a MerchantPortalApiController entity instance. |
| `MerchantPortalCommonController` | `($data): MerchantPortalCommonControllerEntity` | Create a MerchantPortalCommonController entity instance. |
| `MerchantPortalPamContractController` | `($data): MerchantPortalPamContractControllerEntity` | Create a MerchantPortalPamContractController entity instance. |
| `MerchantPortalPamDocumentController` | `($data): MerchantPortalPamDocumentControllerEntity` | Create a MerchantPortalPamDocumentController entity instance. |
| `MerchantPortalPamFormController` | `($data): MerchantPortalPamFormControllerEntity` | Create a MerchantPortalPamFormController entity instance. |
| `MerchantPortalPamMandatorController` | `($data): MerchantPortalPamMandatorControllerEntity` | Create a MerchantPortalPamMandatorController entity instance. |
| `MerchantPortalPamMerchantController` | `($data): MerchantPortalPamMerchantControllerEntity` | Create a MerchantPortalPamMerchantController entity instance. |
| `MerchantPortalPamPackageController` | `($data): MerchantPortalPamPackageControllerEntity` | Create a MerchantPortalPamPackageController entity instance. |
| `MerchantPortalPamProductController` | `($data): MerchantPortalPamProductControllerEntity` | Create a MerchantPortalPamProductController entity instance. |
| `OutputAddProduct` | `($data): OutputAddProductEntity` | Create an OutputAddProduct entity instance. |
| `OutputCreateProduct` | `($data): OutputCreateProductEntity` | Create an OutputCreateProduct entity instance. |
| `OutputDetail` | `($data): OutputDetailEntity` | Create an OutputDetail entity instance. |
| `OutputList` | `($data): OutputListEntity` | Create an OutputList entity instance. |
| `OutputMessage` | `($data): OutputMessageEntity` | Create an OutputMessage entity instance. |
| `OutputMoveTid` | `($data): OutputMoveTidEntity` | Create an OutputMoveTid entity instance. |
| `OutputRemoveProduct` | `($data): OutputRemoveProductEntity` | Create an OutputRemoveProduct entity instance. |
| `OutputStart` | `($data): OutputStartEntity` | Create an OutputStart entity instance. |
| `OutputStatus` | `($data): OutputStatusEntity` | Create an OutputStatus entity instance. |
| `OutputUpdateProduct` | `($data): OutputUpdateProductEntity` | Create an OutputUpdateProduct entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `($reqmatch, $ctrl): array` | Load a single entity by match criteria. |
| `create` | `($reqdata, $ctrl): array` | Create a new entity. |
| `data_get` | `(): array` | Get entity data. |
| `data_set` | `($data): void` | Set entity data. |
| `match_get` | `(): array` | Get entity match criteria. |
| `match_set` | `($match): void` | Set entity match criteria. |
| `make` | `(): Entity` | Create a new instance with the same options. |
| `get_name` | `(): string` | Return the entity name. |

### Result shape

Entity operations return the bare result data (an `array` for single-entity
ops, a `list` for `list`) and throw on error. Wrap calls in
`try`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `array`
you branch on via `$result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `array` | Response headers. |
| `data` | `mixed` | Parsed JSON response body. |

On error, `ok` is `false` and `$err` contains the error value.

### Entities

#### MerchantPortalApiController

| Field | Description |
| --- | --- |
| `account_number` |  |
| `additional_data` |  |
| `business_reg_number` |  |
| `city` |  |
| `corporateuuid` |  |
| `country` |  |
| `currency` |  |
| `merchant_category_code` |  |
| `merchant_email` |  |
| `merchant_name` |  |
| `merchant_phone_number` |  |
| `packageid` |  |
| `packageorderuuid` |  |
| `password` |  |
| `productid` |  |
| `productid_acquirer` |  |
| `reason_deactivation` |  |
| `reason_reactivation` |  |
| `sorting_code` |  |
| `state` |  |
| `street` |  |
| `terminal_country_code` |  |
| `terminal_language_code` |  |
| `terminal_location` |  |
| `terminal_serial_number` |  |
| `terminalid` |  |
| `terminalid_acquirer` |  |
| `user_email` |  |
| `user_phone_number` |  |
| `username` |  |
| `vu_nummer` |  |
| `web_shop_url` |  |
| `zipcode` |  |

Operations: Create.

API path: `/merchantportalws/deactivateTerminal`

#### MerchantPortalCommonController

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/merchantportalws/logDeveloperInfo`

#### MerchantPortalPamContractController

| Field | Description |
| --- | --- |
| `language` |  |
| `product_order_uuid` |  |

Operations: Create.

API path: `/merchantportalws/generateContract`

#### MerchantPortalPamDocumentController

| Field | Description |
| --- | --- |
| `app_form_field_desc_uuid` |  |
| `package_order_uuid` |  |
| `product_order_uuid` |  |

Operations: Create.

API path: `/merchantportalws/documentsList`

#### MerchantPortalPamFormController

| Field | Description |
| --- | --- |
| `app_form_fields_desc_uuid` |  |
| `filter` |  |
| `language` |  |
| `package_order` |  |
| `package_order_uuid` |  |
| `package_uuid` |  |
| `product_order` |  |
| `product_order_uuid` |  |
| `reason_of_reopening` |  |

Operations: Create.

API path: `/merchantportalws/applicationForm`

#### MerchantPortalPamMandatorController

| Field | Description |
| --- | --- |
| `client_secret` |  |
| `mandator_name` |  |
| `notification_email` |  |
| `package_uuid` |  |

Operations: Create.

API path: `/merchantportalws/createMandatorConfig`

#### MerchantPortalPamMerchantController

| Field | Description |
| --- | --- |
| `additional_data` |  |
| `business_registration_number` |  |
| `city` |  |
| `company_name` |  |
| `corporate_uuid` |  |
| `country` |  |
| `currency` |  |
| `email` |  |
| `language` |  |
| `login` |  |
| `mandator` |  |
| `merchant_category_code` |  |
| `merchant_contract_number` |  |
| `merchant_name` |  |
| `package_uuid` |  |
| `packageorderuuid` |  |
| `phone_number` |  |
| `postal_code` |  |
| `productid_acquirer` |  |
| `region` |  |
| `registration_number` |  |
| `signature` |  |
| `street` |  |
| `terminal_id` |  |
| `terminalid_acquirer` |  |
| `vu_nummer` |  |

Operations: Create.

API path: `/merchantportalws/contractNumber`

#### MerchantPortalPamPackageController

| Field | Description |
| --- | --- |
| `consumer_uuid` |  |
| `corporate_uuid` |  |
| `country` |  |
| `description_key` |  |
| `filter` |  |
| `language` |  |
| `name_key` |  |
| `package_status` |  |
| `package_uuid` |  |
| `pagination` |  |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/availablePackages`

#### MerchantPortalPamProductController

| Field | Description |
| --- | --- |
| `consumer_uuid` |  |
| `filter` |  |
| `language` |  |
| `merchant_id` |  |
| `package_order_uuid` |  |
| `pagination` |  |
| `product_order_uuid` |  |
| `product_uuid` |  |
| `reason_decline` |  |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/approveProduct`

#### OutputAddProduct

| Field | Description |
| --- | --- |
| `package_uuid` |  |
| `product_uui_d` |  |
| `response_code` |  |
| `response_message` |  |

Operations: Create.

API path: `/merchantportalws/addProductsToPackage`

#### OutputCreateProduct

| Field | Description |
| --- | --- |
| `acquirer_id` |  |
| `allow_multiple_order` |  |
| `app_form_template_name` |  |
| `contract_needed` |  |
| `credentials_needed` |  |
| `description_key` |  |
| `name_key` |  |
| `prescreening_allowed` |  |
| `product_name` |  |
| `response_code` |  |
| `response_message` |  |
| `terminal_template_name` |  |
| `vendor_name` |  |
| `xml_template_file` |  |

Operations: Create.

API path: `/merchantportalws/createNewProduct`

#### OutputDetail

| Field | Description |
| --- | --- |
| `detail` |  |
| `response_code` |  |
| `response_message` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/details/{id}`

#### OutputList

| Field | Description |
| --- | --- |
| `item` |  |
| `pagination` |  |
| `response_code` |  |
| `response_message` |  |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/list`

#### OutputMessage

| Field | Description |
| --- | --- |
| `response_code` |  |
| `response_message` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/restart/{id}`

#### OutputMoveTid

| Field | Description |
| --- | --- |
| `product_order_uui_d` |  |
| `response_code` |  |
| `response_message` |  |
| `target_package_order_uuid` |  |
| `target_product_order_uuid` |  |

Operations: Create.

API path: `/merchantportalws/moveTid`

#### OutputRemoveProduct

| Field | Description |
| --- | --- |
| `package_uuid` |  |
| `product_uui_d` |  |
| `response_code` |  |
| `response_message` |  |

Operations: Create.

API path: `/merchantportalws/removeProductsFromPackage`

#### OutputStart

| Field | Description |
| --- | --- |
| `id` |  |
| `response_code` |  |
| `response_message` |  |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/start`

#### OutputStatus

| Field | Description |
| --- | --- |
| `percentage` |  |
| `response_code` |  |
| `response_message` |  |
| `status` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/status/{id}`

#### OutputUpdateProduct

| Field | Description |
| --- | --- |
| `allow_multiple_order` |  |
| `app_form_name` |  |
| `contract_needed` |  |
| `credentials_needed` |  |
| `description_key` |  |
| `name_key` |  |
| `prescreening_allowed` |  |
| `product_name` |  |
| `product_status` |  |
| `product_uuid` |  |
| `response_code` |  |
| `response_message` |  |
| `vendor_name` |  |

Operations: Create.

API path: `/merchantportalws/updateProduct`



## Entities


### MerchantPortalApiController

Create an instance: `$merchant_portal_api_controller = $client->MerchantPortalApiController();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `int` |  |
| `additional_data` | `array` |  |
| `business_reg_number` | `string` |  |
| `city` | `string` |  |
| `corporateuuid` | `string` |  |
| `country` | `string` |  |
| `currency` | `string` |  |
| `merchant_category_code` | `int` |  |
| `merchant_email` | `string` |  |
| `merchant_name` | `string` |  |
| `merchant_phone_number` | `string` |  |
| `packageid` | `string` |  |
| `packageorderuuid` | `string` |  |
| `password` | `string` |  |
| `productid` | `string` |  |
| `productid_acquirer` | `string` |  |
| `reason_deactivation` | `string` |  |
| `reason_reactivation` | `string` |  |
| `sorting_code` | `int` |  |
| `state` | `string` |  |
| `street` | `string` |  |
| `terminal_country_code` | `string` |  |
| `terminal_language_code` | `string` |  |
| `terminal_location` | `string` |  |
| `terminal_serial_number` | `string` |  |
| `terminalid` | `int` |  |
| `terminalid_acquirer` | `string` |  |
| `user_email` | `string` |  |
| `user_phone_number` | `string` |  |
| `username` | `string` |  |
| `vu_nummer` | `string` |  |
| `web_shop_url` | `string` |  |
| `zipcode` | `string` |  |

#### Example: Create

```php
$merchant_portal_api_controller = $client->MerchantPortalApiController()->create([
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


### MerchantPortalCommonController

Create an instance: `$merchant_portal_common_controller = $client->MerchantPortalCommonController();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare MerchantPortalCommonController record (throws on error).
$merchant_portal_common_controller = $client->MerchantPortalCommonController()->load();
```


### MerchantPortalPamContractController

Create an instance: `$merchant_portal_pam_contract_controller = $client->MerchantPortalPamContractController();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `string` |  |
| `product_order_uuid` | `string` |  |

#### Example: Create

```php
$merchant_portal_pam_contract_controller = $client->MerchantPortalPamContractController()->create([
    "language" => null, // string
    "product_order_uuid" => null, // string
]);
```


### MerchantPortalPamDocumentController

Create an instance: `$merchant_portal_pam_document_controller = $client->MerchantPortalPamDocumentController();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_field_desc_uuid` | `string` |  |
| `package_order_uuid` | `string` |  |
| `product_order_uuid` | `string` |  |

#### Example: Create

```php
$merchant_portal_pam_document_controller = $client->MerchantPortalPamDocumentController()->create([
    "app_form_field_desc_uuid" => null, // string
]);
```


### MerchantPortalPamFormController

Create an instance: `$merchant_portal_pam_form_controller = $client->MerchantPortalPamFormController();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_fields_desc_uuid` | `string` |  |
| `filter` | `array` |  |
| `language` | `string` |  |
| `package_order` | `array` |  |
| `package_order_uuid` | `string` |  |
| `package_uuid` | `string` |  |
| `product_order` | `array` |  |
| `product_order_uuid` | `string` |  |
| `reason_of_reopening` | `string` |  |

#### Example: Create

```php
$merchant_portal_pam_form_controller = $client->MerchantPortalPamFormController()->create([
    "app_form_fields_desc_uuid" => null, // string
    "language" => null, // string
    "package_order_uuid" => null, // string
    "reason_of_reopening" => null, // string
]);
```


### MerchantPortalPamMandatorController

Create an instance: `$merchant_portal_pam_mandator_controller = $client->MerchantPortalPamMandatorController();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client_secret` | `string` |  |
| `mandator_name` | `string` |  |
| `notification_email` | `string` |  |
| `package_uuid` | `string` |  |

#### Example: Create

```php
$merchant_portal_pam_mandator_controller = $client->MerchantPortalPamMandatorController()->create([
    "mandator_name" => null, // string
    "package_uuid" => null, // string
]);
```


### MerchantPortalPamMerchantController

Create an instance: `$merchant_portal_pam_merchant_controller = $client->MerchantPortalPamMerchantController();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `array` |  |
| `business_registration_number` | `string` |  |
| `city` | `string` |  |
| `company_name` | `string` |  |
| `corporate_uuid` | `string` |  |
| `country` | `string` |  |
| `currency` | `string` |  |
| `email` | `string` |  |
| `language` | `string` |  |
| `login` | `string` |  |
| `mandator` | `string` |  |
| `merchant_category_code` | `string` |  |
| `merchant_contract_number` | `string` |  |
| `merchant_name` | `string` |  |
| `package_uuid` | `string` |  |
| `packageorderuuid` | `string` |  |
| `phone_number` | `string` |  |
| `postal_code` | `string` |  |
| `productid_acquirer` | `string` |  |
| `region` | `string` |  |
| `registration_number` | `string` |  |
| `signature` | `string` |  |
| `street` | `string` |  |
| `terminal_id` | `array` |  |
| `terminalid_acquirer` | `string` |  |
| `vu_nummer` | `string` |  |

#### Example: Create

```php
$merchant_portal_pam_merchant_controller = $client->MerchantPortalPamMerchantController()->create([
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


### MerchantPortalPamPackageController

Create an instance: `$merchant_portal_pam_package_controller = $client->MerchantPortalPamPackageController();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `string` |  |
| `corporate_uuid` | `string` |  |
| `country` | `string` |  |
| `description_key` | `string` |  |
| `filter` | `array` |  |
| `language` | `string` |  |
| `name_key` | `string` |  |
| `package_status` | `string` |  |
| `package_uuid` | `string` |  |
| `pagination` | `array` |  |
| `sorting` | `array` |  |

#### Example: Create

```php
$merchant_portal_pam_package_controller = $client->MerchantPortalPamPackageController()->create([
    "language" => null, // string
    "package_uuid" => null, // string
]);
```


### MerchantPortalPamProductController

Create an instance: `$merchant_portal_pam_product_controller = $client->MerchantPortalPamProductController();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `string` |  |
| `filter` | `array` |  |
| `language` | `string` |  |
| `merchant_id` | `string` |  |
| `package_order_uuid` | `string` |  |
| `pagination` | `array` |  |
| `product_order_uuid` | `string` |  |
| `product_uuid` | `string` |  |
| `reason_decline` | `string` |  |
| `sorting` | `array` |  |

#### Example: Create

```php
$merchant_portal_pam_product_controller = $client->MerchantPortalPamProductController()->create([
    "package_order_uuid" => null, // string
    "product_order_uuid" => null, // string
    "product_uuid" => null, // string
    "reason_decline" => null, // string
]);
```


### OutputAddProduct

Create an instance: `$output_add_product = $client->OutputAddProduct();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `string` |  |
| `product_uui_d` | `array` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |

#### Example: Create

```php
$output_add_product = $client->OutputAddProduct()->create([
    "package_uuid" => null, // string
    "product_uui_d" => null, // array
    "response_code" => null, // int
    "response_message" => null, // string
]);
```


### OutputCreateProduct

Create an instance: `$output_create_product = $client->OutputCreateProduct();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirer_id` | `string` |  |
| `allow_multiple_order` | `bool` |  |
| `app_form_template_name` | `string` |  |
| `contract_needed` | `bool` |  |
| `credentials_needed` | `bool` |  |
| `description_key` | `string` |  |
| `name_key` | `string` |  |
| `prescreening_allowed` | `bool` |  |
| `product_name` | `string` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |
| `terminal_template_name` | `string` |  |
| `vendor_name` | `string` |  |
| `xml_template_file` | `string` |  |

#### Example: Create

```php
$output_create_product = $client->OutputCreateProduct()->create([
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


### OutputDetail

Create an instance: `$output_detail = $client->OutputDetail();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `detail` | `array` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |

#### Example: Load

```php
// load() returns the bare OutputDetail record (throws on error).
$output_detail = $client->OutputDetail()->load(["id" => "output_detail_id"]);
```


### OutputList

Create an instance: `$output_list = $client->OutputList();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `item` | `array` |  |
| `pagination` | `array` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |
| `sorting` | `array` |  |

#### Example: Create

```php
$output_list = $client->OutputList()->create([
    "pagination" => null, // array
    "response_code" => null, // int
    "response_message" => null, // string
]);
```


### OutputMessage

Create an instance: `$output_message = $client->OutputMessage();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `response_code` | `int` |  |
| `response_message` | `string` |  |

#### Example: Load

```php
// load() returns the bare OutputMessage record (throws on error).
$output_message = $client->OutputMessage()->load(["id" => "output_message_id"]);
```


### OutputMoveTid

Create an instance: `$output_move_tid = $client->OutputMoveTid();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `product_order_uui_d` | `array` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |
| `target_package_order_uuid` | `string` |  |
| `target_product_order_uuid` | `string` |  |

#### Example: Create

```php
$output_move_tid = $client->OutputMoveTid()->create([
    "product_order_uui_d" => null, // array
    "response_code" => null, // int
    "response_message" => null, // string
    "target_package_order_uuid" => null, // string
    "target_product_order_uuid" => null, // string
]);
```


### OutputRemoveProduct

Create an instance: `$output_remove_product = $client->OutputRemoveProduct();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `string` |  |
| `product_uui_d` | `array` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |

#### Example: Create

```php
$output_remove_product = $client->OutputRemoveProduct()->create([
    "package_uuid" => null, // string
    "product_uui_d" => null, // array
    "response_code" => null, // int
    "response_message" => null, // string
]);
```


### OutputStart

Create an instance: `$output_start = $client->OutputStart();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `string` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |

#### Example: Create

```php
$output_start = $client->OutputStart()->create([
    "response_code" => null, // int
    "response_message" => null, // string
]);
```


### OutputStatus

Create an instance: `$output_status = $client->OutputStatus();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `int` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |
| `status` | `string` |  |

#### Example: Load

```php
// load() returns the bare OutputStatus record (throws on error).
$output_status = $client->OutputStatus()->load(["id" => "output_status_id"]);
```


### OutputUpdateProduct

Create an instance: `$output_update_product = $client->OutputUpdateProduct();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allow_multiple_order` | `bool` |  |
| `app_form_name` | `string` |  |
| `contract_needed` | `bool` |  |
| `credentials_needed` | `bool` |  |
| `description_key` | `string` |  |
| `name_key` | `string` |  |
| `prescreening_allowed` | `bool` |  |
| `product_name` | `string` |  |
| `product_status` | `string` |  |
| `product_uuid` | `string` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |
| `vendor_name` | `string` |  |

#### Example: Create

```php
$output_update_product = $client->OutputUpdateProduct()->create([
    "product_uuid" => null, // string
    "response_code" => null, // int
    "response_message" => null, // string
]);
```


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is a PHP class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as arrays

The PHP SDK uses plain PHP associative arrays throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers::to_map()` to safely validate that a value is an array.

### Directory structure

```
php/
├── bluefintecsmerchantportal_sdk.php          -- Main SDK class
├── config.php                     -- Configuration
├── features.php                   -- Feature factory
├── core/                          -- Core types and context
├── entity/                        -- Entity implementations
├── feature/                       -- Built-in features (Base, Test, Log)
├── utility/                       -- Utility functions and struct library
└── test/                          -- Test suites
```

The main class (`bluefintecsmerchantportal_sdk.php`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```php
$outputdetail = $client->OutputDetail();
$outputdetail->load(["id" => "example_id"]);

// $outputdetail->data_get() now returns the outputdetail data from the last load
// $outputdetail->match_get() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
