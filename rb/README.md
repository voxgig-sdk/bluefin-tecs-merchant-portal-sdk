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
# create returns the ENTITY — call data_get for the created MerchantPortalApiController record.
created = client.MerchantPortalApiController.create({ "business_reg_number" => "example_business_reg_number", "city" => "example_city", "country" => "example_country", "currency" => "example_currency", "merchant_category_code" => 1, "merchant_name" => "example_merchant_name", "packageid" => "example_packageid", "packageorderuuid" => "example_packageorderuuid", "reason_deactivation" => "example_reason_deactivation", "reason_reactivation" => "example_reason_reactivation", "street" => "example_street", "terminal_country_code" => "example_terminal_country_code", "terminal_language_code" => "example_terminal_language_code", "terminal_location" => "example_terminal_location", "terminal_serial_number" => "example_terminal_serial_number", "terminalid" => 1, "vu_nummer" => "example_vu_nummer", "zipcode" => "example_zipcode" })

```


## Error handling

Entity operations raise on failure, so rescue them:

```ruby
begin
  outputdetail = client.OutputDetail.load({ "id" => "example_id" })
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

Create a mock client for unit testing — no server required. Seed fixture
data via the `entity` option so offline calls resolve without a live server:

```ruby
client = BluefinTecsMerchantPortalSDK.test({
  "entity" => { "outputdetail" => { "test01" => { "id" => "test01" } } },
})

# Entity ops return the ENTITY (raises on error);
# call data_get for the mock record.
outputdetail = client.OutputDetail.load({ "id" => "test01" })
puts outputdetail
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
| `productOrderUUID` |  |

Operations: Create.

API path: `/merchantportalws/generateContract`

#### MerchantPortalPamDocumentController

| Field | Description |
| --- | --- |
| `appFormFieldDescUUID` |  |
| `packageOrderUUID` |  |
| `productOrderUUID` |  |

Operations: Create.

API path: `/merchantportalws/documentsList`

#### MerchantPortalPamFormController

| Field | Description |
| --- | --- |
| `appFormFieldsDescUUID` |  |
| `filter` |  |
| `language` |  |
| `packageOrder` |  |
| `packageOrderUUID` |  |
| `packageUUID` |  |
| `productOrderUUID` |  |
| `productOrders` |  |
| `reasonOfReopening` |  |

Operations: Create.

API path: `/merchantportalws/applicationForm`

#### MerchantPortalPamMandatorController

| Field | Description |
| --- | --- |
| `clientSecret` |  |
| `mandatorName` |  |
| `notificationEmail` |  |
| `packageUUID` |  |

Operations: Create.

API path: `/merchantportalws/createMandatorConfig`

#### MerchantPortalPamMerchantController

| Field | Description |
| --- | --- |
| `additional_data` |  |
| `businessRegistrationNumber` |  |
| `city` |  |
| `companyName` |  |
| `corporateUUID` |  |
| `country` |  |
| `currency` |  |
| `email` |  |
| `language` |  |
| `login` |  |
| `mandator` |  |
| `merchantContractNumber` |  |
| `merchantName` |  |
| `merchant_category_code` |  |
| `packageUUID` |  |
| `packageorderuuid` |  |
| `phoneNumber` |  |
| `postalCode` |  |
| `productid_acquirer` |  |
| `region` |  |
| `registrationNumber` |  |
| `signature` |  |
| `street` |  |
| `terminalIds` |  |
| `terminalid_acquirer` |  |
| `vu_nummer` |  |

Operations: Create.

API path: `/merchantportalws/contractNumber`

#### MerchantPortalPamPackageController

| Field | Description |
| --- | --- |
| `consumerUUID` |  |
| `corporateUUID` |  |
| `country` |  |
| `descriptionKey` |  |
| `filter` |  |
| `language` |  |
| `nameKey` |  |
| `packageStatus` |  |
| `packageUUID` |  |
| `pagination` |  |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/availablePackages`

#### MerchantPortalPamProductController

| Field | Description |
| --- | --- |
| `consumerUUID` |  |
| `filter` |  |
| `language` |  |
| `merchantID` |  |
| `packageOrderUUID` |  |
| `pagination` |  |
| `productOrderUUID` |  |
| `productUUID` |  |
| `reason_decline` |  |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/approveProduct`

#### OutputAddProduct

| Field | Description |
| --- | --- |
| `packageUUID` |  |
| `productUUIDs` |  |
| `responseCode` |  |
| `responseMessage` |  |

Operations: Create.

API path: `/merchantportalws/addProductsToPackage`

#### OutputCreateProduct

| Field | Description |
| --- | --- |
| `acquirerId` |  |
| `allowMultipleOrders` |  |
| `appFormTemplateName` |  |
| `contractNeeded` |  |
| `credentialsNeeded` |  |
| `descriptionKey` |  |
| `nameKey` |  |
| `prescreeningAllowed` |  |
| `productName` |  |
| `responseCode` |  |
| `responseMessage` |  |
| `terminalTemplateName` |  |
| `vendorName` |  |
| `xmlTemplateFile` |  |

Operations: Create.

API path: `/merchantportalws/createNewProduct`

#### OutputDetail

| Field | Description |
| --- | --- |
| `batch` |  |
| `lines` |  |
| `progress` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/details/{id}`

#### OutputList

| Field | Description |
| --- | --- |
| `items` |  |
| `pagination` |  |
| `responseCode` |  |
| `responseMessage` |  |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/list`

#### OutputMessage

| Field | Description |
| --- | --- |
| `responseCode` |  |
| `responseMessage` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/restart/{id}`

#### OutputMoveTid

| Field | Description |
| --- | --- |
| `productOrderUUIDs` |  |
| `responseCode` |  |
| `responseMessage` |  |
| `targetPackageOrderUUID` |  |
| `targetProductOrderUUID` |  |

Operations: Create.

API path: `/merchantportalws/moveTid`

#### OutputRemoveProduct

| Field | Description |
| --- | --- |
| `packageUUID` |  |
| `productUUIDs` |  |
| `responseCode` |  |
| `responseMessage` |  |

Operations: Create.

API path: `/merchantportalws/removeProductsFromPackage`

#### OutputStart

| Field | Description |
| --- | --- |
| `id` |  |
| `responseCode` |  |
| `responseMessage` |  |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/start`

#### OutputStatus

| Field | Description |
| --- | --- |
| `percentage` |  |
| `responseCode` |  |
| `responseMessage` |  |
| `status` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/status/{id}`

#### OutputUpdateProduct

| Field | Description |
| --- | --- |
| `allowMultipleOrders` |  |
| `appFormName` |  |
| `contractNeeded` |  |
| `credentialsNeeded` |  |
| `descriptionKey` |  |
| `nameKey` |  |
| `prescreeningAllowed` |  |
| `productName` |  |
| `productStatus` |  |
| `productUUID` |  |
| `responseCode` |  |
| `responseMessage` |  |
| `vendorName` |  |

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
# load returns the ENTITY — call data_get for the MerchantPortalCommonController record (raises on error).
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
| `productOrderUUID` | `String` |  |

#### Example: Create

```ruby
merchant_portal_pam_contract_controller = client.MerchantPortalPamContractController.create({
  "language" => "example_language", # String
  "productOrderUUID" => "example_productOrderUUID", # String
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
| `appFormFieldDescUUID` | `String` |  |
| `packageOrderUUID` | `String` |  |
| `productOrderUUID` | `String` |  |

#### Example: Create

```ruby
merchant_portal_pam_document_controller = client.MerchantPortalPamDocumentController.create({
  "appFormFieldDescUUID" => "example_appFormFieldDescUUID", # String
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
| `appFormFieldsDescUUID` | `String` |  |
| `filter` | `Hash` |  |
| `language` | `String` |  |
| `packageOrder` | `Hash` |  |
| `packageOrderUUID` | `String` |  |
| `packageUUID` | `String` |  |
| `productOrderUUID` | `String` |  |
| `productOrders` | `Array` |  |
| `reasonOfReopening` | `String` |  |

#### Example: Create

```ruby
merchant_portal_pam_form_controller = client.MerchantPortalPamFormController.create({
  "appFormFieldsDescUUID" => "example_appFormFieldsDescUUID", # String
  "language" => "example_language", # String
  "packageOrderUUID" => "example_packageOrderUUID", # String
  "reasonOfReopening" => "example_reasonOfReopening", # String
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
| `clientSecret` | `String` |  |
| `mandatorName` | `String` |  |
| `notificationEmail` | `String` |  |
| `packageUUID` | `String` |  |

#### Example: Create

```ruby
merchant_portal_pam_mandator_controller = client.MerchantPortalPamMandatorController.create({
  "mandatorName" => "example_mandatorName", # String
  "packageUUID" => "example_packageUUID", # String
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
| `businessRegistrationNumber` | `String` |  |
| `city` | `String` |  |
| `companyName` | `String` |  |
| `corporateUUID` | `String` |  |
| `country` | `String` |  |
| `currency` | `String` |  |
| `email` | `String` |  |
| `language` | `String` |  |
| `login` | `String` |  |
| `mandator` | `String` |  |
| `merchantContractNumber` | `String` |  |
| `merchantName` | `String` |  |
| `merchant_category_code` | `String` |  |
| `packageUUID` | `String` |  |
| `packageorderuuid` | `String` |  |
| `phoneNumber` | `String` |  |
| `postalCode` | `String` |  |
| `productid_acquirer` | `String` |  |
| `region` | `String` |  |
| `registrationNumber` | `String` |  |
| `signature` | `String` |  |
| `street` | `String` |  |
| `terminalIds` | `Array` |  |
| `terminalid_acquirer` | `String` |  |
| `vu_nummer` | `String` |  |

#### Example: Create

```ruby
merchant_portal_pam_merchant_controller = client.MerchantPortalPamMerchantController.create({
  "businessRegistrationNumber" => "example_businessRegistrationNumber", # String
  "companyName" => "example_companyName", # String
  "corporateUUID" => "example_corporateUUID", # String
  "currency" => "example_currency", # String
  "email" => "example_email", # String
  "language" => "example_language", # String
  "login" => "example_login", # String
  "mandator" => "example_mandator", # String
  "merchantContractNumber" => "example_merchantContractNumber", # String
  "packageorderuuid" => "example_packageorderuuid", # String
  "phoneNumber" => "example_phoneNumber", # String
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
| `consumerUUID` | `String` |  |
| `corporateUUID` | `String` |  |
| `country` | `String` |  |
| `descriptionKey` | `String` |  |
| `filter` | `Hash` |  |
| `language` | `String` |  |
| `nameKey` | `String` |  |
| `packageStatus` | `String` |  |
| `packageUUID` | `String` |  |
| `pagination` | `Hash` |  |
| `sorting` | `Hash` |  |

#### Example: Create

```ruby
merchant_portal_pam_package_controller = client.MerchantPortalPamPackageController.create({
  "language" => "example_language", # String
  "packageUUID" => "example_packageUUID", # String
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
| `consumerUUID` | `String` |  |
| `filter` | `Hash` |  |
| `language` | `String` |  |
| `merchantID` | `String` |  |
| `packageOrderUUID` | `String` |  |
| `pagination` | `Hash` |  |
| `productOrderUUID` | `String` |  |
| `productUUID` | `String` |  |
| `reason_decline` | `String` |  |
| `sorting` | `Hash` |  |

#### Example: Create

```ruby
merchant_portal_pam_product_controller = client.MerchantPortalPamProductController.create({
  "packageOrderUUID" => "example_packageOrderUUID", # String
  "productOrderUUID" => "example_productOrderUUID", # String
  "productUUID" => "example_productUUID", # String
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
| `packageUUID` | `String` |  |
| `productUUIDs` | `Array` |  |
| `responseCode` | `Integer` |  |
| `responseMessage` | `String` |  |

#### Example: Create

```ruby
output_add_product = client.OutputAddProduct.create({
  "packageUUID" => "example_packageUUID", # String
  "productUUIDs" => [], # Array
  "responseCode" => 1, # Integer
  "responseMessage" => "example_responseMessage", # String
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
| `acquirerId` | `String` |  |
| `allowMultipleOrders` | `Boolean` |  |
| `appFormTemplateName` | `String` |  |
| `contractNeeded` | `Boolean` |  |
| `credentialsNeeded` | `Boolean` |  |
| `descriptionKey` | `String` |  |
| `nameKey` | `String` |  |
| `prescreeningAllowed` | `Boolean` |  |
| `productName` | `String` |  |
| `responseCode` | `Integer` |  |
| `responseMessage` | `String` |  |
| `terminalTemplateName` | `String` |  |
| `vendorName` | `String` |  |
| `xmlTemplateFile` | `String` |  |

#### Example: Create

```ruby
output_create_product = client.OutputCreateProduct.create({
  "allowMultipleOrders" => true, # Boolean
  "appFormTemplateName" => "example_appFormTemplateName", # String
  "contractNeeded" => true, # Boolean
  "descriptionKey" => "example_descriptionKey", # String
  "nameKey" => "example_nameKey", # String
  "prescreeningAllowed" => true, # Boolean
  "productName" => "example_productName", # String
  "responseCode" => 1, # Integer
  "responseMessage" => "example_responseMessage", # String
  "terminalTemplateName" => "example_terminalTemplateName", # String
  "vendorName" => "example_vendorName", # String
  "xmlTemplateFile" => "example_xmlTemplateFile", # String
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
| `batch` | `Hash` |  |
| `lines` | `Hash` |  |
| `progress` | `Hash` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the OutputDetail record (raises on error).
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
| `items` | `Array` |  |
| `pagination` | `Hash` |  |
| `responseCode` | `Integer` |  |
| `responseMessage` | `String` |  |
| `sorting` | `Hash` |  |

#### Example: Create

```ruby
output_list = client.OutputList.create({
  "pagination" => {}, # Hash
  "responseCode" => 1, # Integer
  "responseMessage" => "example_responseMessage", # String
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
| `responseCode` | `Integer` |  |
| `responseMessage` | `String` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the OutputMessage record (raises on error).
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
| `productOrderUUIDs` | `Array` |  |
| `responseCode` | `Integer` |  |
| `responseMessage` | `String` |  |
| `targetPackageOrderUUID` | `String` |  |
| `targetProductOrderUUID` | `String` |  |

#### Example: Create

```ruby
output_move_tid = client.OutputMoveTid.create({
  "productOrderUUIDs" => [], # Array
  "responseCode" => 1, # Integer
  "responseMessage" => "example_responseMessage", # String
  "targetPackageOrderUUID" => "example_targetPackageOrderUUID", # String
  "targetProductOrderUUID" => "example_targetProductOrderUUID", # String
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
| `packageUUID` | `String` |  |
| `productUUIDs` | `Array` |  |
| `responseCode` | `Integer` |  |
| `responseMessage` | `String` |  |

#### Example: Create

```ruby
output_remove_product = client.OutputRemoveProduct.create({
  "packageUUID" => "example_packageUUID", # String
  "productUUIDs" => [], # Array
  "responseCode" => 1, # Integer
  "responseMessage" => "example_responseMessage", # String
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
| `responseCode` | `Integer` |  |
| `responseMessage` | `String` |  |

#### Example: Create

```ruby
output_start = client.OutputStart.create({
  "responseCode" => 1, # Integer
  "responseMessage" => "example_responseMessage", # String
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
| `responseCode` | `Integer` |  |
| `responseMessage` | `String` |  |
| `status` | `String` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the OutputStatus record (raises on error).
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
| `allowMultipleOrders` | `Boolean` |  |
| `appFormName` | `String` |  |
| `contractNeeded` | `Boolean` |  |
| `credentialsNeeded` | `Boolean` |  |
| `descriptionKey` | `String` |  |
| `nameKey` | `String` |  |
| `prescreeningAllowed` | `Boolean` |  |
| `productName` | `String` |  |
| `productStatus` | `String` |  |
| `productUUID` | `String` |  |
| `responseCode` | `Integer` |  |
| `responseMessage` | `String` |  |
| `vendorName` | `String` |  |

#### Example: Create

```ruby
output_update_product = client.OutputUpdateProduct.create({
  "productUUID" => "example_productUUID", # String
  "responseCode" => 1, # Integer
  "responseMessage" => "example_responseMessage", # String
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
outputdetail = client.OutputDetail
outputdetail.load({ "id" => "example_id" })

# outputdetail.data_get now returns the outputdetail data from the last load
# outputdetail.match_get returns the last match criteria
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
