# BluefinTecsMerchantPortal C++ SDK



The C++ SDK for the BluefinTecsMerchantPortal API — a header-only,
entity-oriented client following idiomatic modern C++ (C++17) conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client->merchant_portal_api_controller()` — each
carrying a small, uniform set of operations (`load`, `create`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low. Every value flows through a single dynamic
`sdk::Value` type (a JSON-like variant), so there is no schema-driven code to
regenerate when the API changes.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
The C++ SDK is **header-only** — there is no package to install
from a registry. Vendor the `cpp/` directory into your project (or add the
repository as a git submodule) and put it on your compiler's include path.
Releases are cut as the git tag `cpp/vX.Y.Z` (see
[Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases)).

```bash
# Add the SDK as a submodule (or copy the cpp/ directory into your tree).
git submodule add <repo-url> third_party/bluefintecsmerchantportal-sdk
```

Then include the umbrella header and compile with C++17:

```cpp
#include "core/sdk.hpp"
```

```bash
g++ -std=c++17 -Ithird_party/bluefintecsmerchantportal-sdk/cpp your_app.cpp -o your_app
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```cpp
#include "core/sdk.hpp"

using namespace sdk;

auto client = BluefinTecsMerchantPortalSDK::create();
```

### 4. Create, update, and remove

```cpp
// Create — returns the bare created record.
Value created = client->merchant_portal_api_controller()->create(vmap({{"business_reg_number", Value("example_business_reg_number")}, {"city", Value("example_city")}, {"country", Value("example_country")}, {"currency", Value("example_currency")}, {"merchant_category_code", Value(1)}, {"merchant_name", Value("example_merchant_name")}, {"packageid", Value("example_packageid")}, {"packageorderuuid", Value("example_packageorderuuid")}, {"reason_deactivation", Value("example_reason_deactivation")}, {"reason_reactivation", Value("example_reason_reactivation")}, {"street", Value("example_street")}, {"terminal_country_code", Value("example_terminal_country_code")}, {"terminal_language_code", Value("example_terminal_language_code")}, {"terminal_location", Value("example_terminal_location")}, {"terminal_serial_number", Value("example_terminal_serial_number")}, {"terminalid", Value(1)}, {"vu_nummer", Value("example_vu_nummer")}, {"zipcode", Value("example_zipcode")}}), Value::undef());

```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const outputdetail = await client.OutputDetail().load({ id: "example_id" })
  console.log(outputdetail)
} catch (err) {
  console.error('load failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```cpp
Value result = client->direct(vmap({
    {"path", Value("/api/resource/{id}")},
    {"method", Value("GET")},
    {"params", vmap({{"id", Value("example")}})},
}));

if (getp(result, "ok") == Value(true)) {
  std::cout << Helpers::toInt(getp(result, "status")) << std::endl;  // 200
  std::cout << Struct::jsonify(getp(result, "data")) << std::endl;   // response body
} else {
  // A non-2xx response carries status + data (the error body); a
  // transport-level failure carries err instead. Only one is present.
  std::cerr << Helpers::toInt(getp(result, "status")) << " "
            << Struct::jsonify(getp(result, "err")) << std::endl;
}
```

`direct()` is the escape hatch: it never throws — branch on
`getp(result, "ok")`.

### Prepare a request without sending it

```cpp
// prepare() returns the fetch definition and throws on error.
Value fetchdef = client->prepare(vmap({
    {"path", Value("/api/resource/{id}")},
    {"method", Value("DELETE")},
    {"params", vmap({{"id", Value("example")}})},
}));

std::cout << Struct::stringify(getp(fetchdef, "url")) << std::endl;
std::cout << Struct::stringify(getp(fetchdef, "method")) << std::endl;
std::cout << Struct::jsonify(getp(fetchdef, "headers")) << std::endl;
```

### Use test mode

Create a mock client for unit testing — no server required. The test
feature installs an in-memory mock transport:

```cpp
auto client = BluefinTecsMerchantPortalSDK::testSDK();

// Entity ops return the bare record and throw on error.
Value output_detail = client->output_detail()->load(vmap({{"id", Value("test01")}}), Value::undef());
// output_detail contains the mock response record
std::cout << Struct::jsonify(output_detail) << std::endl;
```

You can seed the mock store by passing test options — see the generated
`test/` suite for worked examples.

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then build and run the test suite:

```bash
cd cpp && make test
```


## Reference

### BluefinTecsMerchantPortalSDK

```cpp
#include "core/sdk.hpp"

using namespace sdk;

auto client = std::make_shared<BluefinTecsMerchantPortalSDK>(options);
```

Creates a new SDK client. `options` is an `sdk::Value` map.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `std::string` | Base URL of the API server. |
| `prefix` | `std::string` | URL path prefix prepended to all requests. |
| `suffix` | `std::string` | URL path suffix appended to all requests. |
| `feature` | `Value` | Feature activation flags. |
| `system` | `Value` | System overrides. |

### testSDK

```cpp
auto client = BluefinTecsMerchantPortalSDK::testSDK(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`Value::undef()`; a no-arg `BluefinTecsMerchantPortalSDK::testSDK()` overload is
also provided.

### BluefinTecsMerchantPortalSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `optionsMap` | `() -> Value` | Deep copy of current SDK options. |
| `getUtility` | `() -> UtilityPtr` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Value` | Build an HTTP request definition without sending. Throws on error. |
| `direct` | `(fetchargs) -> Value` | Build and send an HTTP request. Returns a result Value (branch on `ok`). |
| `merchant_portal_api_controller` | `(entopts) -> std::shared_ptr<MerchantPortalApiControllerEntity>` | Create a MerchantPortalApiController entity instance. |
| `merchant_portal_common_controller` | `(entopts) -> std::shared_ptr<MerchantPortalCommonControllerEntity>` | Create a MerchantPortalCommonController entity instance. |
| `merchant_portal_pam_contract_controller` | `(entopts) -> std::shared_ptr<MerchantPortalPamContractControllerEntity>` | Create a MerchantPortalPamContractController entity instance. |
| `merchant_portal_pam_document_controller` | `(entopts) -> std::shared_ptr<MerchantPortalPamDocumentControllerEntity>` | Create a MerchantPortalPamDocumentController entity instance. |
| `merchant_portal_pam_form_controller` | `(entopts) -> std::shared_ptr<MerchantPortalPamFormControllerEntity>` | Create a MerchantPortalPamFormController entity instance. |
| `merchant_portal_pam_mandator_controller` | `(entopts) -> std::shared_ptr<MerchantPortalPamMandatorControllerEntity>` | Create a MerchantPortalPamMandatorController entity instance. |
| `merchant_portal_pam_merchant_controller` | `(entopts) -> std::shared_ptr<MerchantPortalPamMerchantControllerEntity>` | Create a MerchantPortalPamMerchantController entity instance. |
| `merchant_portal_pam_package_controller` | `(entopts) -> std::shared_ptr<MerchantPortalPamPackageControllerEntity>` | Create a MerchantPortalPamPackageController entity instance. |
| `merchant_portal_pam_product_controller` | `(entopts) -> std::shared_ptr<MerchantPortalPamProductControllerEntity>` | Create a MerchantPortalPamProductController entity instance. |
| `output_add_product` | `(entopts) -> std::shared_ptr<OutputAddProductEntity>` | Create an OutputAddProduct entity instance. |
| `output_create_product` | `(entopts) -> std::shared_ptr<OutputCreateProductEntity>` | Create an OutputCreateProduct entity instance. |
| `output_detail` | `(entopts) -> std::shared_ptr<OutputDetailEntity>` | Create an OutputDetail entity instance. |
| `output_list` | `(entopts) -> std::shared_ptr<OutputListEntity>` | Create an OutputList entity instance. |
| `output_message` | `(entopts) -> std::shared_ptr<OutputMessageEntity>` | Create an OutputMessage entity instance. |
| `output_move_tid` | `(entopts) -> std::shared_ptr<OutputMoveTidEntity>` | Create an OutputMoveTid entity instance. |
| `output_remove_product` | `(entopts) -> std::shared_ptr<OutputRemoveProductEntity>` | Create an OutputRemoveProduct entity instance. |
| `output_start` | `(entopts) -> std::shared_ptr<OutputStartEntity>` | Create an OutputStart entity instance. |
| `output_status` | `(entopts) -> std::shared_ptr<OutputStatusEntity>` | Create an OutputStatus entity instance. |
| `output_update_product` | `(entopts) -> std::shared_ptr<OutputUpdateProductEntity>` | Create an OutputUpdateProduct entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> Value` | Load a single entity by match criteria. Throws on error. |
| `create` | `(reqdata, ctrl) -> Value` | Create a new entity. Throws on error. |
| `data` | `(arg) -> Value` | Get (no arg) or set (with arg) entity data. |
| `match` | `(arg) -> Value` | Get (no arg) or set (with arg) entity match criteria. |
| `make` | `() -> EntityPtr` | Create a new instance with the same options. |
| `getName` | `() -> std::string` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a map `Value` for
single-entity ops, a list `Value` for `list`) and throw
`sdk::SdkErrorPtr` on error. Wrap calls in `try`/`catch` to handle
failures.

The `direct()` escape hatch never throws — it returns a result `Value`
you branch on via `getp(result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `Value` | Response headers. |
| `data` | `Value` | Parsed JSON response body. |

On error, `ok` is `false` and `err` contains the error value.

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

Create an instance: `auto merchant_portal_api_controller = client->merchant_portal_api_controller();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `int64_t` |  |
| `additional_data` | `std::map<std::string, Value>` |  |
| `business_reg_number` | `std::string` |  |
| `city` | `std::string` |  |
| `corporateuuid` | `std::string` |  |
| `country` | `std::string` |  |
| `currency` | `std::string` |  |
| `merchant_category_code` | `int64_t` |  |
| `merchant_email` | `std::string` |  |
| `merchant_name` | `std::string` |  |
| `merchant_phone_number` | `std::string` |  |
| `packageid` | `std::string` |  |
| `packageorderuuid` | `std::string` |  |
| `password` | `std::string` |  |
| `productid` | `std::string` |  |
| `productid_acquirer` | `std::string` |  |
| `reason_deactivation` | `std::string` |  |
| `reason_reactivation` | `std::string` |  |
| `sorting_code` | `int64_t` |  |
| `state` | `std::string` |  |
| `street` | `std::string` |  |
| `terminal_country_code` | `std::string` |  |
| `terminal_language_code` | `std::string` |  |
| `terminal_location` | `std::string` |  |
| `terminal_serial_number` | `std::string` |  |
| `terminalid` | `int64_t` |  |
| `terminalid_acquirer` | `std::string` |  |
| `user_email` | `std::string` |  |
| `user_phone_number` | `std::string` |  |
| `username` | `std::string` |  |
| `vu_nummer` | `std::string` |  |
| `web_shop_url` | `std::string` |  |
| `zipcode` | `std::string` |  |

#### Example: Create

```cpp
Value merchant_portal_api_controller = client->merchant_portal_api_controller()->create(vmap({
    {"business_reg_number", Value("example_business_reg_number")},  // std::string
    {"city", Value("example_city")},  // std::string
    {"country", Value("example_country")},  // std::string
    {"currency", Value("example_currency")},  // std::string
    {"merchant_category_code", Value(1)},  // int64_t
    {"merchant_name", Value("example_merchant_name")},  // std::string
    {"packageid", Value("example_packageid")},  // std::string
    {"packageorderuuid", Value("example_packageorderuuid")},  // std::string
    {"reason_deactivation", Value("example_reason_deactivation")},  // std::string
    {"reason_reactivation", Value("example_reason_reactivation")},  // std::string
    {"street", Value("example_street")},  // std::string
    {"terminal_country_code", Value("example_terminal_country_code")},  // std::string
    {"terminal_language_code", Value("example_terminal_language_code")},  // std::string
    {"terminal_location", Value("example_terminal_location")},  // std::string
    {"terminal_serial_number", Value("example_terminal_serial_number")},  // std::string
    {"terminalid", Value(1)},  // int64_t
    {"vu_nummer", Value("example_vu_nummer")},  // std::string
    {"zipcode", Value("example_zipcode")},  // std::string
}), Value::undef());
```


### MerchantPortalCommonController

Create an instance: `auto merchant_portal_common_controller = client->merchant_portal_common_controller();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```cpp
Value merchant_portal_common_controller = client->merchant_portal_common_controller()->load(Value::undef(), Value::undef());
```


### MerchantPortalPamContractController

Create an instance: `auto merchant_portal_pam_contract_controller = client->merchant_portal_pam_contract_controller();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `std::string` |  |
| `product_order_uuid` | `std::string` |  |

#### Example: Create

```cpp
Value merchant_portal_pam_contract_controller = client->merchant_portal_pam_contract_controller()->create(vmap({
    {"language", Value("example_language")},  // std::string
    {"product_order_uuid", Value("example_product_order_uuid")},  // std::string
}), Value::undef());
```


### MerchantPortalPamDocumentController

Create an instance: `auto merchant_portal_pam_document_controller = client->merchant_portal_pam_document_controller();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_field_desc_uuid` | `std::string` |  |
| `package_order_uuid` | `std::string` |  |
| `product_order_uuid` | `std::string` |  |

#### Example: Create

```cpp
Value merchant_portal_pam_document_controller = client->merchant_portal_pam_document_controller()->create(vmap({
    {"app_form_field_desc_uuid", Value("example_app_form_field_desc_uuid")},  // std::string
}), Value::undef());
```


### MerchantPortalPamFormController

Create an instance: `auto merchant_portal_pam_form_controller = client->merchant_portal_pam_form_controller();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_fields_desc_uuid` | `std::string` |  |
| `filter` | `std::map<std::string, Value>` |  |
| `language` | `std::string` |  |
| `package_order` | `std::map<std::string, Value>` |  |
| `package_order_uuid` | `std::string` |  |
| `package_uuid` | `std::string` |  |
| `product_order` | `std::vector<Value>` |  |
| `product_order_uuid` | `std::string` |  |
| `reason_of_reopening` | `std::string` |  |

#### Example: Create

```cpp
Value merchant_portal_pam_form_controller = client->merchant_portal_pam_form_controller()->create(vmap({
    {"app_form_fields_desc_uuid", Value("example_app_form_fields_desc_uuid")},  // std::string
    {"language", Value("example_language")},  // std::string
    {"package_order_uuid", Value("example_package_order_uuid")},  // std::string
    {"reason_of_reopening", Value("example_reason_of_reopening")},  // std::string
}), Value::undef());
```


### MerchantPortalPamMandatorController

Create an instance: `auto merchant_portal_pam_mandator_controller = client->merchant_portal_pam_mandator_controller();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client_secret` | `std::string` |  |
| `mandator_name` | `std::string` |  |
| `notification_email` | `std::string` |  |
| `package_uuid` | `std::string` |  |

#### Example: Create

```cpp
Value merchant_portal_pam_mandator_controller = client->merchant_portal_pam_mandator_controller()->create(vmap({
    {"mandator_name", Value("example_mandator_name")},  // std::string
    {"package_uuid", Value("example_package_uuid")},  // std::string
}), Value::undef());
```


### MerchantPortalPamMerchantController

Create an instance: `auto merchant_portal_pam_merchant_controller = client->merchant_portal_pam_merchant_controller();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `std::map<std::string, Value>` |  |
| `business_registration_number` | `std::string` |  |
| `city` | `std::string` |  |
| `company_name` | `std::string` |  |
| `corporate_uuid` | `std::string` |  |
| `country` | `std::string` |  |
| `currency` | `std::string` |  |
| `email` | `std::string` |  |
| `language` | `std::string` |  |
| `login` | `std::string` |  |
| `mandator` | `std::string` |  |
| `merchant_category_code` | `std::string` |  |
| `merchant_contract_number` | `std::string` |  |
| `merchant_name` | `std::string` |  |
| `package_uuid` | `std::string` |  |
| `packageorderuuid` | `std::string` |  |
| `phone_number` | `std::string` |  |
| `postal_code` | `std::string` |  |
| `productid_acquirer` | `std::string` |  |
| `region` | `std::string` |  |
| `registration_number` | `std::string` |  |
| `signature` | `std::string` |  |
| `street` | `std::string` |  |
| `terminal_id` | `std::vector<Value>` |  |
| `terminalid_acquirer` | `std::string` |  |
| `vu_nummer` | `std::string` |  |

#### Example: Create

```cpp
Value merchant_portal_pam_merchant_controller = client->merchant_portal_pam_merchant_controller()->create(vmap({
    {"business_registration_number", Value("example_business_registration_number")},  // std::string
    {"company_name", Value("example_company_name")},  // std::string
    {"corporate_uuid", Value("example_corporate_uuid")},  // std::string
    {"currency", Value("example_currency")},  // std::string
    {"email", Value("example_email")},  // std::string
    {"language", Value("example_language")},  // std::string
    {"login", Value("example_login")},  // std::string
    {"mandator", Value("example_mandator")},  // std::string
    {"merchant_contract_number", Value("example_merchant_contract_number")},  // std::string
    {"packageorderuuid", Value("example_packageorderuuid")},  // std::string
    {"phone_number", Value("example_phone_number")},  // std::string
    {"productid_acquirer", Value("example_productid_acquirer")},  // std::string
    {"vu_nummer", Value("example_vu_nummer")},  // std::string
}), Value::undef());
```


### MerchantPortalPamPackageController

Create an instance: `auto merchant_portal_pam_package_controller = client->merchant_portal_pam_package_controller();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `std::string` |  |
| `corporate_uuid` | `std::string` |  |
| `country` | `std::string` |  |
| `description_key` | `std::string` |  |
| `filter` | `std::map<std::string, Value>` |  |
| `language` | `std::string` |  |
| `name_key` | `std::string` |  |
| `package_status` | `std::string` |  |
| `package_uuid` | `std::string` |  |
| `pagination` | `std::map<std::string, Value>` |  |
| `sorting` | `std::map<std::string, Value>` |  |

#### Example: Create

```cpp
Value merchant_portal_pam_package_controller = client->merchant_portal_pam_package_controller()->create(vmap({
    {"language", Value("example_language")},  // std::string
    {"package_uuid", Value("example_package_uuid")},  // std::string
}), Value::undef());
```


### MerchantPortalPamProductController

Create an instance: `auto merchant_portal_pam_product_controller = client->merchant_portal_pam_product_controller();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `std::string` |  |
| `filter` | `std::map<std::string, Value>` |  |
| `language` | `std::string` |  |
| `merchant_id` | `std::string` |  |
| `package_order_uuid` | `std::string` |  |
| `pagination` | `std::map<std::string, Value>` |  |
| `product_order_uuid` | `std::string` |  |
| `product_uuid` | `std::string` |  |
| `reason_decline` | `std::string` |  |
| `sorting` | `std::map<std::string, Value>` |  |

#### Example: Create

```cpp
Value merchant_portal_pam_product_controller = client->merchant_portal_pam_product_controller()->create(vmap({
    {"package_order_uuid", Value("example_package_order_uuid")},  // std::string
    {"product_order_uuid", Value("example_product_order_uuid")},  // std::string
    {"product_uuid", Value("example_product_uuid")},  // std::string
    {"reason_decline", Value("example_reason_decline")},  // std::string
}), Value::undef());
```


### OutputAddProduct

Create an instance: `auto output_add_product = client->output_add_product();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `std::string` |  |
| `product_uui_d` | `std::vector<Value>` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `std::string` |  |

#### Example: Create

```cpp
Value output_add_product = client->output_add_product()->create(vmap({
    {"package_uuid", Value("example_package_uuid")},  // std::string
    {"product_uui_d", vlist()},  // std::vector<Value>
    {"response_code", Value(1)},  // int64_t
    {"response_message", Value("example_response_message")},  // std::string
}), Value::undef());
```


### OutputCreateProduct

Create an instance: `auto output_create_product = client->output_create_product();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirer_id` | `std::string` |  |
| `allow_multiple_order` | `bool` |  |
| `app_form_template_name` | `std::string` |  |
| `contract_needed` | `bool` |  |
| `credentials_needed` | `bool` |  |
| `description_key` | `std::string` |  |
| `name_key` | `std::string` |  |
| `prescreening_allowed` | `bool` |  |
| `product_name` | `std::string` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `std::string` |  |
| `terminal_template_name` | `std::string` |  |
| `vendor_name` | `std::string` |  |
| `xml_template_file` | `std::string` |  |

#### Example: Create

```cpp
Value output_create_product = client->output_create_product()->create(vmap({
    {"allow_multiple_order", Value(true)},  // bool
    {"app_form_template_name", Value("example_app_form_template_name")},  // std::string
    {"contract_needed", Value(true)},  // bool
    {"description_key", Value("example_description_key")},  // std::string
    {"name_key", Value("example_name_key")},  // std::string
    {"prescreening_allowed", Value(true)},  // bool
    {"product_name", Value("example_product_name")},  // std::string
    {"response_code", Value(1)},  // int64_t
    {"response_message", Value("example_response_message")},  // std::string
    {"terminal_template_name", Value("example_terminal_template_name")},  // std::string
    {"vendor_name", Value("example_vendor_name")},  // std::string
    {"xml_template_file", Value("example_xml_template_file")},  // std::string
}), Value::undef());
```


### OutputDetail

Create an instance: `auto output_detail = client->output_detail();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `detail` | `std::map<std::string, Value>` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `std::string` |  |

#### Example: Load

```cpp
Value output_detail = client->output_detail()->load(vmap({{"id", Value("output_detail_id")}}), Value::undef());
```


### OutputList

Create an instance: `auto output_list = client->output_list();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `item` | `std::vector<Value>` |  |
| `pagination` | `std::map<std::string, Value>` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `std::string` |  |
| `sorting` | `std::map<std::string, Value>` |  |

#### Example: Create

```cpp
Value output_list = client->output_list()->create(vmap({
    {"pagination", vmap()},  // std::map<std::string, Value>
    {"response_code", Value(1)},  // int64_t
    {"response_message", Value("example_response_message")},  // std::string
}), Value::undef());
```


### OutputMessage

Create an instance: `auto output_message = client->output_message();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `response_code` | `int64_t` |  |
| `response_message` | `std::string` |  |

#### Example: Load

```cpp
Value output_message = client->output_message()->load(vmap({{"id", Value("output_message_id")}}), Value::undef());
```


### OutputMoveTid

Create an instance: `auto output_move_tid = client->output_move_tid();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `product_order_uui_d` | `std::vector<Value>` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `std::string` |  |
| `target_package_order_uuid` | `std::string` |  |
| `target_product_order_uuid` | `std::string` |  |

#### Example: Create

```cpp
Value output_move_tid = client->output_move_tid()->create(vmap({
    {"product_order_uui_d", vlist()},  // std::vector<Value>
    {"response_code", Value(1)},  // int64_t
    {"response_message", Value("example_response_message")},  // std::string
    {"target_package_order_uuid", Value("example_target_package_order_uuid")},  // std::string
    {"target_product_order_uuid", Value("example_target_product_order_uuid")},  // std::string
}), Value::undef());
```


### OutputRemoveProduct

Create an instance: `auto output_remove_product = client->output_remove_product();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `std::string` |  |
| `product_uui_d` | `std::vector<Value>` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `std::string` |  |

#### Example: Create

```cpp
Value output_remove_product = client->output_remove_product()->create(vmap({
    {"package_uuid", Value("example_package_uuid")},  // std::string
    {"product_uui_d", vlist()},  // std::vector<Value>
    {"response_code", Value(1)},  // int64_t
    {"response_message", Value("example_response_message")},  // std::string
}), Value::undef());
```


### OutputStart

Create an instance: `auto output_start = client->output_start();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `std::string` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `std::string` |  |

#### Example: Create

```cpp
Value output_start = client->output_start()->create(vmap({
    {"response_code", Value(1)},  // int64_t
    {"response_message", Value("example_response_message")},  // std::string
}), Value::undef());
```


### OutputStatus

Create an instance: `auto output_status = client->output_status();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `int64_t` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `std::string` |  |
| `status` | `std::string` |  |

#### Example: Load

```cpp
Value output_status = client->output_status()->load(vmap({{"id", Value("output_status_id")}}), Value::undef());
```


### OutputUpdateProduct

Create an instance: `auto output_update_product = client->output_update_product();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allow_multiple_order` | `bool` |  |
| `app_form_name` | `std::string` |  |
| `contract_needed` | `bool` |  |
| `credentials_needed` | `bool` |  |
| `description_key` | `std::string` |  |
| `name_key` | `std::string` |  |
| `prescreening_allowed` | `bool` |  |
| `product_name` | `std::string` |  |
| `product_status` | `std::string` |  |
| `product_uuid` | `std::string` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `std::string` |  |
| `vendor_name` | `std::string` |  |

#### Example: Create

```cpp
Value output_update_product = client->output_update_product()->create(vmap({
    {"product_uuid", Value("example_product_uuid")},  // std::string
    {"response_code", Value(1)},  // int64_t
    {"response_message", Value("example_response_message")},  // std::string
}), Value::undef());
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

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as `Value`

The C++ SDK uses a single dynamic `sdk::Value` type (a JSON-like variant
over string / number / bool / list / map) throughout rather than generated
typed structs. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema changes.

Build maps with `sdk::vmap({{"key", sdk::Value("v")}})` and lists with
`sdk::vlist({...})`; read fields back with `sdk::getp(value, "key")`. Use
`sdk::to_map()` to safely coerce a value that should be a map, and
`sdk::Struct::jsonify(value)` to render it as JSON.

### Directory structure

```
cpp/
├── core/                        -- Runtime type graph, config, generated client
├── entity/                      -- Per-entity client headers
├── feature/                     -- Built-in features (Base, Test, Log, ...)
├── utility/                     -- Operation pipeline + vendored struct library
├── test/                        -- Test suites
├── Makefile                     -- Build & run the tests (C++17)
└── VERSION                      -- SDK version
```

Include the umbrella header `core/sdk.hpp` to pull in the whole SDK: the
runtime types, the pipeline utilities, the vendored struct, the generated
config, the per-entity clients and the generated `BluefinTecsMerchantPortalSDK`
client class. Everything lives in the `sdk` namespace.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const outputdetail = client.OutputDetail()
await outputdetail.load({ id: "example_id" })

// outputdetail.data() now returns the outputdetail data from the last `load`
// outputdetail.match() returns { id: "example_id" }
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
