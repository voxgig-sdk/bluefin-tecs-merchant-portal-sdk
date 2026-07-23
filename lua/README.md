# BluefinTecsMerchantPortal Lua SDK



The Lua SDK for the BluefinTecsMerchantPortal API — an entity-oriented client using Lua conventions.

It exposes the API as capitalised, semantic **Entities** — e.g. `client:MerchantPortalApiController()` — each with the same small set of operations (`load`, `create`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to LuaRocks. Install it from the
GitHub release tag (`lua/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases)),
or add the source directory to your `LUA_PATH`:

```bash
export LUA_PATH="path/to/lua/?.lua;path/to/lua/?/init.lua;;"
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```lua
local sdk = require("bluefin-tecs-merchant-portal_sdk")

local client = sdk.new()
```

### 4. Create, update, and remove

```lua
-- Create
local created, err = client:MerchantPortalApiController():create({ business_reg_number = "example_business_reg_number", city = "example_city", country = "example_country", currency = "example_currency", merchant_category_code = 1, merchant_name = "example_merchant_name", packageid = "example_packageid", packageorderuuid = "example_packageorderuuid", reason_deactivation = "example_reason_deactivation", reason_reactivation = "example_reason_reactivation", street = "example_street", terminal_country_code = "example_terminal_country_code", terminal_language_code = "example_terminal_language_code", terminal_location = "example_terminal_location", terminal_serial_number = "example_terminal_serial_number", terminalid = 1, vu_nummer = "example_vu_nummer", zipcode = "example_zipcode" })
if err then error(err) end

```


## Error handling

Entity operations return `(value, err)`. Check `err` before using
the value:

```lua
local outputdetail, err = client:OutputDetail():load({ id = "example_id" })
if err then error(err) end
```

`direct` follows the same `(value, err)` convention:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example_id" },
})
if err then error(err) end
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
if err then error(err) end

if result["ok"] then
  print(result["status"])  -- 200
  print(result["data"])    -- response body
end
```

### Prepare a request without sending it

```lua
local fetchdef, err = client:prepare({
  path = "/api/resource/{id}",
  method = "DELETE",
  params = { id = "example" },
})
if err then error(err) end

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```lua
local client = sdk.test()

local result, err = client:OutputDetail():load({ id = "test01" })
-- result is the returned data; err is set on failure
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```lua
local function mock_fetch(url, init)
  return {
    status = 200,
    statusText = "OK",
    headers = {},
    json = function()
      return { id = "mock01" }
    end,
  }, nil
end

local client = sdk.new({
  base = "http://localhost:8080",
  system = {
    fetch = mock_fetch,
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
cd lua && busted test/
```


## Reference

### BluefinTecsMerchantPortalSDK

```lua
local sdk = require("bluefin-tecs-merchant-portal_sdk")
local client = sdk.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `table` | Feature activation flags. |
| `extend` | `table` | Additional Feature instances to load. |
| `system` | `table` | System overrides (e.g. custom `fetch` function). |

### test

```lua
local client = sdk.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinTecsMerchantPortalSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> table` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> table, err` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs) -> table, err` | Build and send an HTTP request. |
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
| `load` | `(reqmatch, ctrl) -> any, err` | Load a single entity by match criteria. |
| `create` | `(reqdata, ctrl) -> any, err` | Create a new entity. |
| `data_get` | `() -> table` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> table` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return `(value, err)`. The `value` is the operation's
data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `load` / `create` | the entity record (a `table`) |

Check `err` first (it is non-`nil` on failure), then use `value`:

    local merchant_portal_api_controller, err = client:MerchantPortalApiController():load()
    if err then error(err) end
    -- merchant_portal_api_controller is the loaded record

Only `direct()` returns a response envelope — a `table` with `ok`,
`status`, `headers`, and `data` keys.

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

Create an instance: `local merchant_portal_api_controller = client:MerchantPortalApiController(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `number` |  |
| `additional_data` | `table` |  |
| `business_reg_number` | `string` |  |
| `city` | `string` |  |
| `corporateuuid` | `string` |  |
| `country` | `string` |  |
| `currency` | `string` |  |
| `merchant_category_code` | `number` |  |
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
| `sorting_code` | `number` |  |
| `state` | `string` |  |
| `street` | `string` |  |
| `terminal_country_code` | `string` |  |
| `terminal_language_code` | `string` |  |
| `terminal_location` | `string` |  |
| `terminal_serial_number` | `string` |  |
| `terminalid` | `number` |  |
| `terminalid_acquirer` | `string` |  |
| `user_email` | `string` |  |
| `user_phone_number` | `string` |  |
| `username` | `string` |  |
| `vu_nummer` | `string` |  |
| `web_shop_url` | `string` |  |
| `zipcode` | `string` |  |

#### Example: Create

```lua
local merchant_portal_api_controller, err = client:MerchantPortalApiController():create({
  business_reg_number = "example_business_reg_number", -- string
  city = "example_city", -- string
  country = "example_country", -- string
  currency = "example_currency", -- string
  merchant_category_code = 1, -- number
  merchant_name = "example_merchant_name", -- string
  packageid = "example_packageid", -- string
  packageorderuuid = "example_packageorderuuid", -- string
  reason_deactivation = "example_reason_deactivation", -- string
  reason_reactivation = "example_reason_reactivation", -- string
  street = "example_street", -- string
  terminal_country_code = "example_terminal_country_code", -- string
  terminal_language_code = "example_terminal_language_code", -- string
  terminal_location = "example_terminal_location", -- string
  terminal_serial_number = "example_terminal_serial_number", -- string
  terminalid = 1, -- number
  vu_nummer = "example_vu_nummer", -- string
  zipcode = "example_zipcode", -- string
})
```


### MerchantPortalCommonController

Create an instance: `local merchant_portal_common_controller = client:MerchantPortalCommonController(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local merchant_portal_common_controller, err = client:MerchantPortalCommonController():load()
```


### MerchantPortalPamContractController

Create an instance: `local merchant_portal_pam_contract_controller = client:MerchantPortalPamContractController(nil)`

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

```lua
local merchant_portal_pam_contract_controller, err = client:MerchantPortalPamContractController():create({
  language = "example_language", -- string
  product_order_uuid = "example_product_order_uuid", -- string
})
```


### MerchantPortalPamDocumentController

Create an instance: `local merchant_portal_pam_document_controller = client:MerchantPortalPamDocumentController(nil)`

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

```lua
local merchant_portal_pam_document_controller, err = client:MerchantPortalPamDocumentController():create({
  app_form_field_desc_uuid = "example_app_form_field_desc_uuid", -- string
})
```


### MerchantPortalPamFormController

Create an instance: `local merchant_portal_pam_form_controller = client:MerchantPortalPamFormController(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_fields_desc_uuid` | `string` |  |
| `filter` | `table` |  |
| `language` | `string` |  |
| `package_order` | `table` |  |
| `package_order_uuid` | `string` |  |
| `package_uuid` | `string` |  |
| `product_order` | `table` |  |
| `product_order_uuid` | `string` |  |
| `reason_of_reopening` | `string` |  |

#### Example: Create

```lua
local merchant_portal_pam_form_controller, err = client:MerchantPortalPamFormController():create({
  app_form_fields_desc_uuid = "example_app_form_fields_desc_uuid", -- string
  language = "example_language", -- string
  package_order_uuid = "example_package_order_uuid", -- string
  reason_of_reopening = "example_reason_of_reopening", -- string
})
```


### MerchantPortalPamMandatorController

Create an instance: `local merchant_portal_pam_mandator_controller = client:MerchantPortalPamMandatorController(nil)`

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

```lua
local merchant_portal_pam_mandator_controller, err = client:MerchantPortalPamMandatorController():create({
  mandator_name = "example_mandator_name", -- string
  package_uuid = "example_package_uuid", -- string
})
```


### MerchantPortalPamMerchantController

Create an instance: `local merchant_portal_pam_merchant_controller = client:MerchantPortalPamMerchantController(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `table` |  |
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
| `terminal_id` | `table` |  |
| `terminalid_acquirer` | `string` |  |
| `vu_nummer` | `string` |  |

#### Example: Create

```lua
local merchant_portal_pam_merchant_controller, err = client:MerchantPortalPamMerchantController():create({
  business_registration_number = "example_business_registration_number", -- string
  company_name = "example_company_name", -- string
  corporate_uuid = "example_corporate_uuid", -- string
  currency = "example_currency", -- string
  email = "example_email", -- string
  language = "example_language", -- string
  login = "example_login", -- string
  mandator = "example_mandator", -- string
  merchant_contract_number = "example_merchant_contract_number", -- string
  packageorderuuid = "example_packageorderuuid", -- string
  phone_number = "example_phone_number", -- string
  productid_acquirer = "example_productid_acquirer", -- string
  vu_nummer = "example_vu_nummer", -- string
})
```


### MerchantPortalPamPackageController

Create an instance: `local merchant_portal_pam_package_controller = client:MerchantPortalPamPackageController(nil)`

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
| `filter` | `table` |  |
| `language` | `string` |  |
| `name_key` | `string` |  |
| `package_status` | `string` |  |
| `package_uuid` | `string` |  |
| `pagination` | `table` |  |
| `sorting` | `table` |  |

#### Example: Create

```lua
local merchant_portal_pam_package_controller, err = client:MerchantPortalPamPackageController():create({
  language = "example_language", -- string
  package_uuid = "example_package_uuid", -- string
})
```


### MerchantPortalPamProductController

Create an instance: `local merchant_portal_pam_product_controller = client:MerchantPortalPamProductController(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `string` |  |
| `filter` | `table` |  |
| `language` | `string` |  |
| `merchant_id` | `string` |  |
| `package_order_uuid` | `string` |  |
| `pagination` | `table` |  |
| `product_order_uuid` | `string` |  |
| `product_uuid` | `string` |  |
| `reason_decline` | `string` |  |
| `sorting` | `table` |  |

#### Example: Create

```lua
local merchant_portal_pam_product_controller, err = client:MerchantPortalPamProductController():create({
  package_order_uuid = "example_package_order_uuid", -- string
  product_order_uuid = "example_product_order_uuid", -- string
  product_uuid = "example_product_uuid", -- string
  reason_decline = "example_reason_decline", -- string
})
```


### OutputAddProduct

Create an instance: `local output_add_product = client:OutputAddProduct(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `string` |  |
| `product_uui_d` | `table` |  |
| `response_code` | `number` |  |
| `response_message` | `string` |  |

#### Example: Create

```lua
local output_add_product, err = client:OutputAddProduct():create({
  package_uuid = "example_package_uuid", -- string
  product_uui_d = {}, -- table
  response_code = 1, -- number
  response_message = "example_response_message", -- string
})
```


### OutputCreateProduct

Create an instance: `local output_create_product = client:OutputCreateProduct(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirer_id` | `string` |  |
| `allow_multiple_order` | `boolean` |  |
| `app_form_template_name` | `string` |  |
| `contract_needed` | `boolean` |  |
| `credentials_needed` | `boolean` |  |
| `description_key` | `string` |  |
| `name_key` | `string` |  |
| `prescreening_allowed` | `boolean` |  |
| `product_name` | `string` |  |
| `response_code` | `number` |  |
| `response_message` | `string` |  |
| `terminal_template_name` | `string` |  |
| `vendor_name` | `string` |  |
| `xml_template_file` | `string` |  |

#### Example: Create

```lua
local output_create_product, err = client:OutputCreateProduct():create({
  allow_multiple_order = true, -- boolean
  app_form_template_name = "example_app_form_template_name", -- string
  contract_needed = true, -- boolean
  description_key = "example_description_key", -- string
  name_key = "example_name_key", -- string
  prescreening_allowed = true, -- boolean
  product_name = "example_product_name", -- string
  response_code = 1, -- number
  response_message = "example_response_message", -- string
  terminal_template_name = "example_terminal_template_name", -- string
  vendor_name = "example_vendor_name", -- string
  xml_template_file = "example_xml_template_file", -- string
})
```


### OutputDetail

Create an instance: `local output_detail = client:OutputDetail(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `detail` | `table` |  |
| `response_code` | `number` |  |
| `response_message` | `string` |  |

#### Example: Load

```lua
local output_detail, err = client:OutputDetail():load({ id = "output_detail_id" })
```


### OutputList

Create an instance: `local output_list = client:OutputList(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `item` | `table` |  |
| `pagination` | `table` |  |
| `response_code` | `number` |  |
| `response_message` | `string` |  |
| `sorting` | `table` |  |

#### Example: Create

```lua
local output_list, err = client:OutputList():create({
  pagination = {}, -- table
  response_code = 1, -- number
  response_message = "example_response_message", -- string
})
```


### OutputMessage

Create an instance: `local output_message = client:OutputMessage(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `response_code` | `number` |  |
| `response_message` | `string` |  |

#### Example: Load

```lua
local output_message, err = client:OutputMessage():load({ id = "output_message_id" })
```


### OutputMoveTid

Create an instance: `local output_move_tid = client:OutputMoveTid(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `product_order_uui_d` | `table` |  |
| `response_code` | `number` |  |
| `response_message` | `string` |  |
| `target_package_order_uuid` | `string` |  |
| `target_product_order_uuid` | `string` |  |

#### Example: Create

```lua
local output_move_tid, err = client:OutputMoveTid():create({
  product_order_uui_d = {}, -- table
  response_code = 1, -- number
  response_message = "example_response_message", -- string
  target_package_order_uuid = "example_target_package_order_uuid", -- string
  target_product_order_uuid = "example_target_product_order_uuid", -- string
})
```


### OutputRemoveProduct

Create an instance: `local output_remove_product = client:OutputRemoveProduct(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `string` |  |
| `product_uui_d` | `table` |  |
| `response_code` | `number` |  |
| `response_message` | `string` |  |

#### Example: Create

```lua
local output_remove_product, err = client:OutputRemoveProduct():create({
  package_uuid = "example_package_uuid", -- string
  product_uui_d = {}, -- table
  response_code = 1, -- number
  response_message = "example_response_message", -- string
})
```


### OutputStart

Create an instance: `local output_start = client:OutputStart(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `string` |  |
| `response_code` | `number` |  |
| `response_message` | `string` |  |

#### Example: Create

```lua
local output_start, err = client:OutputStart():create({
  response_code = 1, -- number
  response_message = "example_response_message", -- string
})
```


### OutputStatus

Create an instance: `local output_status = client:OutputStatus(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `number` |  |
| `response_code` | `number` |  |
| `response_message` | `string` |  |
| `status` | `string` |  |

#### Example: Load

```lua
local output_status, err = client:OutputStatus():load({ id = "output_status_id" })
```


### OutputUpdateProduct

Create an instance: `local output_update_product = client:OutputUpdateProduct(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allow_multiple_order` | `boolean` |  |
| `app_form_name` | `string` |  |
| `contract_needed` | `boolean` |  |
| `credentials_needed` | `boolean` |  |
| `description_key` | `string` |  |
| `name_key` | `string` |  |
| `prescreening_allowed` | `boolean` |  |
| `product_name` | `string` |  |
| `product_status` | `string` |  |
| `product_uuid` | `string` |  |
| `response_code` | `number` |  |
| `response_message` | `string` |  |
| `vendor_name` | `string` |  |

#### Example: Create

```lua
local output_update_product, err = client:OutputUpdateProduct():create({
  product_uuid = "example_product_uuid", -- string
  response_code = 1, -- number
  response_message = "example_response_message", -- string
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

Features are the extension mechanism. A feature is a Lua table
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as tables

The Lua SDK uses plain Lua tables throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a table.

### Module structure

```
lua/
├── bluefin-tecs-merchant-portal_sdk.lua    -- Main SDK module
├── config.lua               -- Configuration
├── features.lua             -- Feature factory
├── core/                    -- Core types and context
├── entity/                  -- Entity implementations
├── feature/                 -- Built-in features (Base, Test, Log)
├── utility/                 -- Utility functions and struct library
└── test/                    -- Test suites
```

The main module (`bluefin-tecs-merchant-portal_sdk`) exports the SDK constructor
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```lua
local outputdetail = client:OutputDetail()
outputdetail:load({ id = "example_id" })

-- outputdetail:data_get() now returns the outputdetail data from the last load
-- outputdetail:match_get() returns the last match criteria
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
