# BluefinTecsMerchantPortal Ruby SDK



The Ruby SDK for the BluefinTecsMerchantPortal API — an entity-oriented client using idiomatic Ruby conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.MerchantPortalApiController` — with named operations (`load`/`create`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to RubyGems. Install it from the
GitHub release tag (`rb/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ruby
require_relative "BluefinTecsMerchantPortal_sdk"

client = BluefinTecsMerchantPortalSDK.new
```

### 4. Create, update, and remove

```ruby
# create returns the bare created MerchantPortalApiController record.
created = client.MerchantPortalApiController.create({ "business_reg_number" => "example_business_reg_number", "city" => "example_city", "country" => "example_country", "currency" => "example_currency", "merchant_category_code" => 1, "merchant_name" => "example_merchant_name", "packageid" => "example_packageid", "packageorderuuid" => "example_packageorderuuid", "reason_deactivation" => "example_reason_deactivation", "reason_reactivation" => "example_reason_reactivation", "street" => "example_street", "terminal_country_code" => "example_terminal_country_code", "terminal_language_code" => "example_terminal_language_code", "terminal_location" => "example_terminal_location", "terminal_serial_number" => "example_terminal_serial_number", "terminalid" => 1, "vu_nummer" => "example_vu_nummer", "zipcode" => "example_zipcode" })

```


## Error handling

Entity operations raise on failure, so rescue them:

```ruby
begin
  merchantportalcommoncontroller = client.MerchantPortalCommonController.load()
rescue => err
  warn "load failed: #{err}"
end
```

`direct` does **not** raise — it returns the result hash. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example_id" },
})

warn "request failed: #{result["err"] || "HTTP #{result["status"]}"}" unless result["ok"]
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})

if result["ok"]
  puts result["status"]  # 200
  puts result["data"]    # response body
else
  # On an HTTP error status there is no err (only a transport failure sets
  # it), so fall back to the status code.
  warn(result["err"] || "HTTP #{result["status"]}")
end
```

### Prepare a request without sending it

```ruby
begin
  fetchdef = client.prepare({
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => { "id" => "example" },
  })
  puts fetchdef["url"]
  puts fetchdef["method"]
  puts fetchdef["headers"]
rescue => err
  warn "prepare failed: #{err}"
end
```

### Use test mode

Create a mock client for unit testing — no server required:

```ruby
client = BluefinTecsMerchantPortalSDK.test

# Entity ops return the bare mock record (raises on error).
merchantportalcommoncontroller = client.MerchantPortalCommonController.load()
puts merchantportalcommoncontroller
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```ruby
mock_fetch = ->(url, init) {
  return {
    "status" => 200,
    "statusText" => "OK",
    "headers" => {},
    "json" => ->() { { "id" => "mock01" } },
  }, nil
}

client = BluefinTecsMerchantPortalSDK.new({
  "base" => "http://localhost:8080",
  "system" => {
    "fetch" => mock_fetch,
  },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run:

```bash
cd rb && ruby -Itest -e "Dir['test/*_test.rb'].each { |f| require_relative f }"
```


## Reference

### BluefinTecsMerchantPortalSDK

```ruby
require_relative "BluefinTecsMerchantPortal_sdk"
client = BluefinTecsMerchantPortalSDK.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Hash` | Feature activation flags. |
| `extend` | `Hash` | Additional Feature instances to load. |
| `system` | `Hash` | System overrides (e.g. custom `fetch` lambda). |

### test

```ruby
client = BluefinTecsMerchantPortalSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinTecsMerchantPortalSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Hash` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Hash` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> Hash` | Build and send an HTTP request. Returns a result hash (`result["ok"]`); does not raise. |
| `MerchantPortalApiController` | `(data) -> MerchantPortalApiControllerEntity` | Create a MerchantPortalApiController entity instance. |
| `MerchantPortalCommonController` | `(data) -> MerchantPortalCommonControllerEntity` | Create a MerchantPortalCommonController entity instance. |
| `MerchantPortalPamContractController` | `(data) -> MerchantPortalPamContractControllerEntity` | Create a MerchantPortalPamContractController entity instance. |
| `MerchantPortalPamDocumentController` | `(data) -> MerchantPortalPamDocumentControllerEntity` | Create a MerchantPortalPamDocumentController entity instance. |
| `MerchantPortalPamFormController` | `(data) -> MerchantPortalPamFormControllerEntity` | Create a MerchantPortalPamFormController entity instance. |
| `MerchantPortalPamMandatorController` | `(data) -> MerchantPortalPamMandatorControllerEntity` | Create a MerchantPortalPamMandatorController entity instance. |
| `MerchantPortalPamMerchantController` | `(data) -> MerchantPortalPamMerchantControllerEntity` | Create a MerchantPortalPamMerchantController entity instance. |
| `MerchantPortalPamPackageController` | `(data) -> MerchantPortalPamPackageControllerEntity` | Create a MerchantPortalPamPackageController entity instance. |
| `MerchantPortalPamProductController` | `(data) -> MerchantPortalPamProductControllerEntity` | Create a MerchantPortalPamProductController entity instance. |
| `OutputAddProduct` | `(data) -> OutputAddProductEntity` | Create an OutputAddProduct entity instance. |
| `OutputCreateProduct` | `(data) -> OutputCreateProductEntity` | Create an OutputCreateProduct entity instance. |
| `OutputDetail` | `(data) -> OutputDetailEntity` | Create an OutputDetail entity instance. |
| `OutputList` | `(data) -> OutputListEntity` | Create an OutputList entity instance. |
| `OutputMessage` | `(data) -> OutputMessageEntity` | Create an OutputMessage entity instance. |
| `OutputMoveTid` | `(data) -> OutputMoveTidEntity` | Create an OutputMoveTid entity instance. |
| `OutputRemoveProduct` | `(data) -> OutputRemoveProductEntity` | Create an OutputRemoveProduct entity instance. |
| `OutputStart` | `(data) -> OutputStartEntity` | Create an OutputStart entity instance. |
| `OutputStatus` | `(data) -> OutputStatusEntity` | Create an OutputStatus entity instance. |
| `OutputUpdateProduct` | `(data) -> OutputUpdateProductEntity` | Create an OutputUpdateProduct entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `create` | `(reqdata, ctrl) -> any` | Create a new entity. Raises on error. |
| `data_get` | `() -> Hash` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> Hash` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the result data directly. On failure they
raise a `BluefinTecsMerchantPortalError` (a `StandardError` subclass), so wrap
calls in `begin`/`rescue` where you need to handle errors.

The `direct` escape hatch is the exception: it never raises and instead
returns a result `Hash` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Integer` | HTTP status code. |
| `headers` | `Hash` | Response headers. |
| `data` | `any` | Parsed JSON response body. |
| `err` | `Error` | Present when `ok` is `false`. |

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

Create an instance: `merchant_portal_api_controller = client.MerchantPortalApiController`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `Integer` |  |
| `additional_data` | `Hash` |  |
| `business_reg_number` | `String` |  |
| `city` | `String` |  |
| `corporateuuid` | `String` |  |
| `country` | `String` |  |
| `currency` | `String` |  |
| `merchant_category_code` | `Integer` |  |
| `merchant_email` | `String` |  |
| `merchant_name` | `String` |  |
| `merchant_phone_number` | `String` |  |
| `packageid` | `String` |  |
| `packageorderuuid` | `String` |  |
| `password` | `String` |  |
| `productid` | `String` |  |
| `productid_acquirer` | `String` |  |
| `reason_deactivation` | `String` |  |
| `reason_reactivation` | `String` |  |
| `sorting_code` | `Integer` |  |
| `state` | `String` |  |
| `street` | `String` |  |
| `terminal_country_code` | `String` |  |
| `terminal_language_code` | `String` |  |
| `terminal_location` | `String` |  |
| `terminal_serial_number` | `String` |  |
| `terminalid` | `Integer` |  |
| `terminalid_acquirer` | `String` |  |
| `user_email` | `String` |  |
| `user_phone_number` | `String` |  |
| `username` | `String` |  |
| `vu_nummer` | `String` |  |
| `web_shop_url` | `String` |  |
| `zipcode` | `String` |  |

#### Example: Create

```ruby
merchant_portal_api_controller = client.MerchantPortalApiController.create({
  "business_reg_number" => "example_business_reg_number", # String
  "city" => "example_city", # String
  "country" => "example_country", # String
  "currency" => "example_currency", # String
  "merchant_category_code" => 1, # Integer
  "merchant_name" => "example_merchant_name", # String
  "packageid" => "example_packageid", # String
  "packageorderuuid" => "example_packageorderuuid", # String
  "reason_deactivation" => "example_reason_deactivation", # String
  "reason_reactivation" => "example_reason_reactivation", # String
  "street" => "example_street", # String
  "terminal_country_code" => "example_terminal_country_code", # String
  "terminal_language_code" => "example_terminal_language_code", # String
  "terminal_location" => "example_terminal_location", # String
  "terminal_serial_number" => "example_terminal_serial_number", # String
  "terminalid" => 1, # Integer
  "vu_nummer" => "example_vu_nummer", # String
  "zipcode" => "example_zipcode", # String
})
```


### MerchantPortalCommonController

Create an instance: `merchant_portal_common_controller = client.MerchantPortalCommonController`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare MerchantPortalCommonController record (raises on error).
merchant_portal_common_controller = client.MerchantPortalCommonController.load()
```


### MerchantPortalPamContractController

Create an instance: `merchant_portal_pam_contract_controller = client.MerchantPortalPamContractController`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `String` |  |
| `product_order_uuid` | `String` |  |

#### Example: Create

```ruby
merchant_portal_pam_contract_controller = client.MerchantPortalPamContractController.create({
  "language" => "example_language", # String
  "product_order_uuid" => "example_product_order_uuid", # String
})
```


### MerchantPortalPamDocumentController

Create an instance: `merchant_portal_pam_document_controller = client.MerchantPortalPamDocumentController`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_field_desc_uuid` | `String` |  |
| `package_order_uuid` | `String` |  |
| `product_order_uuid` | `String` |  |

#### Example: Create

```ruby
merchant_portal_pam_document_controller = client.MerchantPortalPamDocumentController.create({
  "app_form_field_desc_uuid" => "example_app_form_field_desc_uuid", # String
})
```


### MerchantPortalPamFormController

Create an instance: `merchant_portal_pam_form_controller = client.MerchantPortalPamFormController`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_fields_desc_uuid` | `String` |  |
| `filter` | `Hash` |  |
| `language` | `String` |  |
| `package_order` | `Hash` |  |
| `package_order_uuid` | `String` |  |
| `package_uuid` | `String` |  |
| `product_order` | `Array` |  |
| `product_order_uuid` | `String` |  |
| `reason_of_reopening` | `String` |  |

#### Example: Create

```ruby
merchant_portal_pam_form_controller = client.MerchantPortalPamFormController.create({
  "app_form_fields_desc_uuid" => "example_app_form_fields_desc_uuid", # String
  "language" => "example_language", # String
  "package_order_uuid" => "example_package_order_uuid", # String
  "reason_of_reopening" => "example_reason_of_reopening", # String
})
```


### MerchantPortalPamMandatorController

Create an instance: `merchant_portal_pam_mandator_controller = client.MerchantPortalPamMandatorController`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client_secret` | `String` |  |
| `mandator_name` | `String` |  |
| `notification_email` | `String` |  |
| `package_uuid` | `String` |  |

#### Example: Create

```ruby
merchant_portal_pam_mandator_controller = client.MerchantPortalPamMandatorController.create({
  "mandator_name" => "example_mandator_name", # String
  "package_uuid" => "example_package_uuid", # String
})
```


### MerchantPortalPamMerchantController

Create an instance: `merchant_portal_pam_merchant_controller = client.MerchantPortalPamMerchantController`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `Hash` |  |
| `business_registration_number` | `String` |  |
| `city` | `String` |  |
| `company_name` | `String` |  |
| `corporate_uuid` | `String` |  |
| `country` | `String` |  |
| `currency` | `String` |  |
| `email` | `String` |  |
| `language` | `String` |  |
| `login` | `String` |  |
| `mandator` | `String` |  |
| `merchant_category_code` | `String` |  |
| `merchant_contract_number` | `String` |  |
| `merchant_name` | `String` |  |
| `package_uuid` | `String` |  |
| `packageorderuuid` | `String` |  |
| `phone_number` | `String` |  |
| `postal_code` | `String` |  |
| `productid_acquirer` | `String` |  |
| `region` | `String` |  |
| `registration_number` | `String` |  |
| `signature` | `String` |  |
| `street` | `String` |  |
| `terminal_id` | `Array` |  |
| `terminalid_acquirer` | `String` |  |
| `vu_nummer` | `String` |  |

#### Example: Create

```ruby
merchant_portal_pam_merchant_controller = client.MerchantPortalPamMerchantController.create({
  "business_registration_number" => "example_business_registration_number", # String
  "company_name" => "example_company_name", # String
  "corporate_uuid" => "example_corporate_uuid", # String
  "currency" => "example_currency", # String
  "email" => "example_email", # String
  "language" => "example_language", # String
  "login" => "example_login", # String
  "mandator" => "example_mandator", # String
  "merchant_contract_number" => "example_merchant_contract_number", # String
  "packageorderuuid" => "example_packageorderuuid", # String
  "phone_number" => "example_phone_number", # String
  "productid_acquirer" => "example_productid_acquirer", # String
  "vu_nummer" => "example_vu_nummer", # String
})
```


### MerchantPortalPamPackageController

Create an instance: `merchant_portal_pam_package_controller = client.MerchantPortalPamPackageController`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `String` |  |
| `corporate_uuid` | `String` |  |
| `country` | `String` |  |
| `description_key` | `String` |  |
| `filter` | `Hash` |  |
| `language` | `String` |  |
| `name_key` | `String` |  |
| `package_status` | `String` |  |
| `package_uuid` | `String` |  |
| `pagination` | `Hash` |  |
| `sorting` | `Hash` |  |

#### Example: Create

```ruby
merchant_portal_pam_package_controller = client.MerchantPortalPamPackageController.create({
  "language" => "example_language", # String
  "package_uuid" => "example_package_uuid", # String
})
```


### MerchantPortalPamProductController

Create an instance: `merchant_portal_pam_product_controller = client.MerchantPortalPamProductController`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `String` |  |
| `filter` | `Hash` |  |
| `language` | `String` |  |
| `merchant_id` | `String` |  |
| `package_order_uuid` | `String` |  |
| `pagination` | `Hash` |  |
| `product_order_uuid` | `String` |  |
| `product_uuid` | `String` |  |
| `reason_decline` | `String` |  |
| `sorting` | `Hash` |  |

#### Example: Create

```ruby
merchant_portal_pam_product_controller = client.MerchantPortalPamProductController.create({
  "package_order_uuid" => "example_package_order_uuid", # String
  "product_order_uuid" => "example_product_order_uuid", # String
  "product_uuid" => "example_product_uuid", # String
  "reason_decline" => "example_reason_decline", # String
})
```


### OutputAddProduct

Create an instance: `output_add_product = client.OutputAddProduct`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `String` |  |
| `product_uui_d` | `Array` |  |
| `response_code` | `Integer` |  |
| `response_message` | `String` |  |

#### Example: Create

```ruby
output_add_product = client.OutputAddProduct.create({
  "package_uuid" => "example_package_uuid", # String
  "product_uui_d" => [], # Array
  "response_code" => 1, # Integer
  "response_message" => "example_response_message", # String
})
```


### OutputCreateProduct

Create an instance: `output_create_product = client.OutputCreateProduct`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirer_id` | `String` |  |
| `allow_multiple_order` | `Boolean` |  |
| `app_form_template_name` | `String` |  |
| `contract_needed` | `Boolean` |  |
| `credentials_needed` | `Boolean` |  |
| `description_key` | `String` |  |
| `name_key` | `String` |  |
| `prescreening_allowed` | `Boolean` |  |
| `product_name` | `String` |  |
| `response_code` | `Integer` |  |
| `response_message` | `String` |  |
| `terminal_template_name` | `String` |  |
| `vendor_name` | `String` |  |
| `xml_template_file` | `String` |  |

#### Example: Create

```ruby
output_create_product = client.OutputCreateProduct.create({
  "allow_multiple_order" => true, # Boolean
  "app_form_template_name" => "example_app_form_template_name", # String
  "contract_needed" => true, # Boolean
  "description_key" => "example_description_key", # String
  "name_key" => "example_name_key", # String
  "prescreening_allowed" => true, # Boolean
  "product_name" => "example_product_name", # String
  "response_code" => 1, # Integer
  "response_message" => "example_response_message", # String
  "terminal_template_name" => "example_terminal_template_name", # String
  "vendor_name" => "example_vendor_name", # String
  "xml_template_file" => "example_xml_template_file", # String
})
```


### OutputDetail

Create an instance: `output_detail = client.OutputDetail`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `detail` | `Hash` |  |
| `response_code` | `Integer` |  |
| `response_message` | `String` |  |

#### Example: Load

```ruby
# load returns the bare OutputDetail record (raises on error).
output_detail = client.OutputDetail.load({ "id" => "output_detail_id" })
```


### OutputList

Create an instance: `output_list = client.OutputList`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `item` | `Array` |  |
| `pagination` | `Hash` |  |
| `response_code` | `Integer` |  |
| `response_message` | `String` |  |
| `sorting` | `Hash` |  |

#### Example: Create

```ruby
output_list = client.OutputList.create({
  "pagination" => {}, # Hash
  "response_code" => 1, # Integer
  "response_message" => "example_response_message", # String
})
```


### OutputMessage

Create an instance: `output_message = client.OutputMessage`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `response_code` | `Integer` |  |
| `response_message` | `String` |  |

#### Example: Load

```ruby
# load returns the bare OutputMessage record (raises on error).
output_message = client.OutputMessage.load({ "id" => "output_message_id" })
```


### OutputMoveTid

Create an instance: `output_move_tid = client.OutputMoveTid`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `product_order_uui_d` | `Array` |  |
| `response_code` | `Integer` |  |
| `response_message` | `String` |  |
| `target_package_order_uuid` | `String` |  |
| `target_product_order_uuid` | `String` |  |

#### Example: Create

```ruby
output_move_tid = client.OutputMoveTid.create({
  "product_order_uui_d" => [], # Array
  "response_code" => 1, # Integer
  "response_message" => "example_response_message", # String
  "target_package_order_uuid" => "example_target_package_order_uuid", # String
  "target_product_order_uuid" => "example_target_product_order_uuid", # String
})
```


### OutputRemoveProduct

Create an instance: `output_remove_product = client.OutputRemoveProduct`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `String` |  |
| `product_uui_d` | `Array` |  |
| `response_code` | `Integer` |  |
| `response_message` | `String` |  |

#### Example: Create

```ruby
output_remove_product = client.OutputRemoveProduct.create({
  "package_uuid" => "example_package_uuid", # String
  "product_uui_d" => [], # Array
  "response_code" => 1, # Integer
  "response_message" => "example_response_message", # String
})
```


### OutputStart

Create an instance: `output_start = client.OutputStart`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `String` |  |
| `response_code` | `Integer` |  |
| `response_message` | `String` |  |

#### Example: Create

```ruby
output_start = client.OutputStart.create({
  "response_code" => 1, # Integer
  "response_message" => "example_response_message", # String
})
```


### OutputStatus

Create an instance: `output_status = client.OutputStatus`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `Integer` |  |
| `response_code` | `Integer` |  |
| `response_message` | `String` |  |
| `status` | `String` |  |

#### Example: Load

```ruby
# load returns the bare OutputStatus record (raises on error).
output_status = client.OutputStatus.load({ "id" => "output_status_id" })
```


### OutputUpdateProduct

Create an instance: `output_update_product = client.OutputUpdateProduct`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allow_multiple_order` | `Boolean` |  |
| `app_form_name` | `String` |  |
| `contract_needed` | `Boolean` |  |
| `credentials_needed` | `Boolean` |  |
| `description_key` | `String` |  |
| `name_key` | `String` |  |
| `prescreening_allowed` | `Boolean` |  |
| `product_name` | `String` |  |
| `product_status` | `String` |  |
| `product_uuid` | `String` |  |
| `response_code` | `Integer` |  |
| `response_message` | `String` |  |
| `vendor_name` | `String` |  |

#### Example: Create

```ruby
output_update_product = client.OutputUpdateProduct.create({
  "product_uuid" => "example_product_uuid", # String
  "response_code" => 1, # Integer
  "response_message" => "example_response_message", # String
})
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

Features are the extension mechanism. A feature is a Ruby class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as hashes

The Ruby SDK uses plain Ruby hashes throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers.to_map()` to safely validate that a value is a hash.

### Module structure

```
rb/
├── BluefinTecsMerchantPortal_sdk.rb       -- Main SDK module
├── config.rb                  -- Configuration
├── features.rb                -- Feature factory
├── core/                      -- Core types and context
├── entity/                    -- Entity implementations
├── feature/                   -- Built-in features (Base, Test, Log)
├── utility/                   -- Utility functions and struct library
└── test/                      -- Test suites
```

The main module (`BluefinTecsMerchantPortal_sdk`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```ruby
merchantportalcommoncontroller = client.MerchantPortalCommonController
merchantportalcommoncontroller.load()

# merchantportalcommoncontroller.data_get now returns the merchantportalcommoncontroller data from the last load
# merchantportalcommoncontroller.match_get returns the last match criteria
```

Call `make` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
