# BluefinTecsMerchantPortal Rust SDK



The Rust SDK for the BluefinTecsMerchantPortal API — an entity-oriented client following idiomatic Rust conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.merchant_portal_api_controller(Value::Noval)` — each
carrying a small, uniform set of operations (`load`, `create`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This crate is not yet published to crates.io. Depend on it from the GitHub
release tag (`rust/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases)) or
from a source checkout by adding it to your `Cargo.toml`:

```toml
[dependencies]
# From a source checkout:
voxgig-bluefin-tecs-merchant-portal-sdk = { path = "../rust" }

# Or from the git release tag:
# voxgig-bluefin-tecs-merchant-portal-sdk = { git = "<repo-url>", tag = "rust/vX.Y.Z" }
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```rust
use bluefin_tecs_merchant_portal_sdk::{getp, jo, BluefinTecsMerchantPortalSDK, Value};

let client = BluefinTecsMerchantPortalSDK::new(Value::Noval);
```

### 4. Create, update, and remove

```rust
// Create — returns the bare created record
let created = client.merchant_portal_api_controller(Value::Noval).create(jo(vec![("business_reg_number", Value::str("example_business_reg_number")), ("city", Value::str("example_city")), ("country", Value::str("example_country")), ("currency", Value::str("example_currency")), ("merchant_category_code", Value::Num(1.0)), ("merchant_name", Value::str("example_merchant_name")), ("packageid", Value::str("example_packageid")), ("packageorderuuid", Value::str("example_packageorderuuid")), ("reason_deactivation", Value::str("example_reason_deactivation")), ("reason_reactivation", Value::str("example_reason_reactivation")), ("street", Value::str("example_street")), ("terminal_country_code", Value::str("example_terminal_country_code")), ("terminal_language_code", Value::str("example_terminal_language_code")), ("terminal_location", Value::str("example_terminal_location")), ("terminal_serial_number", Value::str("example_terminal_serial_number")), ("terminalid", Value::Num(1.0)), ("vu_nummer", Value::str("example_vu_nummer")), ("zipcode", Value::str("example_zipcode"))]), Value::Noval).unwrap();

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

```rust
let result = client.direct(jo(vec![
    ("path", Value::str("/api/resource/{id}")),
    ("method", Value::str("GET")),
    ("params", jo(vec![("id", Value::str("example"))])),
])).unwrap();

if getp(&result, "ok") == Value::Bool(true) {
    println!("{:?}", getp(&result, "status"));  // 200
    println!("{:?}", getp(&result, "data"));    // response body
} else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present.
    println!("{:?} {:?}", getp(&result, "status"), getp(&result, "err"));
}
```

### Prepare a request without sending it

```rust
// prepare() returns the fetch definition on Ok and Err on failure.
let fetchdef = client.prepare(jo(vec![
    ("path", Value::str("/api/resource/{id}")),
    ("method", Value::str("DELETE")),
    ("params", jo(vec![("id", Value::str("example"))])),
])).unwrap();

println!("{:?}", getp(&fetchdef, "url"));
println!("{:?}", getp(&fetchdef, "method"));
println!("{:?}", getp(&fetchdef, "headers"));
```

### Use test mode

Create a mock client for unit testing — no server required:

```rust
let client = test_sdk(Value::Noval, Value::Noval);

// Entity ops return the bare record on Ok and Err on failure.
let output_detail = client.output_detail(Value::Noval).load(jo(vec![("id", Value::str("test01"))]), Value::Noval).unwrap();
// output_detail contains the mock response record
```

### Point at a different server

Override the base URL to reach a local or staging server:

```rust
let client = BluefinTecsMerchantPortalSDK::new(jo(vec![
    ("base", Value::str("http://localhost:8080")),
]));
```

### Run live tests

Create a `.env.local` file at the crate root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run:

```bash
cd rust && cargo test
```


## Reference

### BluefinTecsMerchantPortalSDK

```rust
use bluefin_tecs_merchant_portal_sdk::{BluefinTecsMerchantPortalSDK, Value};

let client = BluefinTecsMerchantPortalSDK::new(options);
```

Creates a new SDK client. `options` is a `Value` map (`Value::Noval` for
none) carrying any of the following keys:

| Option | Value type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `system` | `map` | System overrides (e.g. a custom fetcher). |

### test_sdk

```rust
use bluefin_tecs_merchant_portal_sdk::{test_sdk, Value};

let client = test_sdk(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`Value::Noval`.

### BluefinTecsMerchantPortalSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Value` | Deep copy of the current SDK options. |
| `get_utility` | `() -> Rc<Utility>` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs: Value) -> Result<Value, BluefinTecsMerchantPortalError>` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs: Value) -> Result<Value, BluefinTecsMerchantPortalError>` | Build and send an HTTP request. `Ok` is a result map (branch on `ok`). |
| `merchant_portal_api_controller` | `(entopts: Value) -> Rc<MerchantPortalApiControllerEntity>` | Create a MerchantPortalApiController entity instance. |
| `merchant_portal_common_controller` | `(entopts: Value) -> Rc<MerchantPortalCommonControllerEntity>` | Create a MerchantPortalCommonController entity instance. |
| `merchant_portal_pam_contract_controller` | `(entopts: Value) -> Rc<MerchantPortalPamContractControllerEntity>` | Create a MerchantPortalPamContractController entity instance. |
| `merchant_portal_pam_document_controller` | `(entopts: Value) -> Rc<MerchantPortalPamDocumentControllerEntity>` | Create a MerchantPortalPamDocumentController entity instance. |
| `merchant_portal_pam_form_controller` | `(entopts: Value) -> Rc<MerchantPortalPamFormControllerEntity>` | Create a MerchantPortalPamFormController entity instance. |
| `merchant_portal_pam_mandator_controller` | `(entopts: Value) -> Rc<MerchantPortalPamMandatorControllerEntity>` | Create a MerchantPortalPamMandatorController entity instance. |
| `merchant_portal_pam_merchant_controller` | `(entopts: Value) -> Rc<MerchantPortalPamMerchantControllerEntity>` | Create a MerchantPortalPamMerchantController entity instance. |
| `merchant_portal_pam_package_controller` | `(entopts: Value) -> Rc<MerchantPortalPamPackageControllerEntity>` | Create a MerchantPortalPamPackageController entity instance. |
| `merchant_portal_pam_product_controller` | `(entopts: Value) -> Rc<MerchantPortalPamProductControllerEntity>` | Create a MerchantPortalPamProductController entity instance. |
| `output_add_product` | `(entopts: Value) -> Rc<OutputAddProductEntity>` | Create an OutputAddProduct entity instance. |
| `output_create_product` | `(entopts: Value) -> Rc<OutputCreateProductEntity>` | Create an OutputCreateProduct entity instance. |
| `output_detail` | `(entopts: Value) -> Rc<OutputDetailEntity>` | Create an OutputDetail entity instance. |
| `output_list` | `(entopts: Value) -> Rc<OutputListEntity>` | Create an OutputList entity instance. |
| `output_message` | `(entopts: Value) -> Rc<OutputMessageEntity>` | Create an OutputMessage entity instance. |
| `output_move_tid` | `(entopts: Value) -> Rc<OutputMoveTidEntity>` | Create an OutputMoveTid entity instance. |
| `output_remove_product` | `(entopts: Value) -> Rc<OutputRemoveProductEntity>` | Create an OutputRemoveProduct entity instance. |
| `output_start` | `(entopts: Value) -> Rc<OutputStartEntity>` | Create an OutputStart entity instance. |
| `output_status` | `(entopts: Value) -> Rc<OutputStatusEntity>` | Create an OutputStatus entity instance. |
| `output_update_product` | `(entopts: Value) -> Rc<OutputUpdateProductEntity>` | Create an OutputUpdateProduct entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>` | Load a single entity by match criteria. |
| `create` | `(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>` | Create a new entity. |
| `data` | `(args: Option<&Value>) -> Value` | Get entity data (pass `Some(&map)` to set). |
| `matchv` | `(args: Option<&Value>) -> Value` | Get entity match criteria (pass `Some(&map)` to set). |
| `make` | `() -> Rc<dyn Entity>` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return `Result<Value, BluefinTecsMerchantPortalError>` — the
bare result data on `Ok` (a `Value::Map` for single-entity ops, a
`Value::List` for `list`) and the branded error on `Err`.

The `direct()` escape hatch resolves to `Ok` even on a non-2xx response —
it returns a result `Value::Map` you branch on via `getp(&result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `number` | HTTP status code. |
| `headers` | `map` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `false` and `err` carries the error value.

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

Create an instance: `let merchant_portal_api_controller = client.merchant_portal_api_controller(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `i64` |  |
| `additional_data` | `std::collections::HashMap<String, Value>` |  |
| `business_reg_number` | `String` |  |
| `city` | `String` |  |
| `corporateuuid` | `String` |  |
| `country` | `String` |  |
| `currency` | `String` |  |
| `merchant_category_code` | `i64` |  |
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
| `sorting_code` | `i64` |  |
| `state` | `String` |  |
| `street` | `String` |  |
| `terminal_country_code` | `String` |  |
| `terminal_language_code` | `String` |  |
| `terminal_location` | `String` |  |
| `terminal_serial_number` | `String` |  |
| `terminalid` | `i64` |  |
| `terminalid_acquirer` | `String` |  |
| `user_email` | `String` |  |
| `user_phone_number` | `String` |  |
| `username` | `String` |  |
| `vu_nummer` | `String` |  |
| `web_shop_url` | `String` |  |
| `zipcode` | `String` |  |

#### Example: Create

```rust
let merchant_portal_api_controller = client.merchant_portal_api_controller(Value::Noval).create(jo(vec![
    ("business_reg_number", Value::str("example_business_reg_number")),  // String
    ("city", Value::str("example_city")),  // String
    ("country", Value::str("example_country")),  // String
    ("currency", Value::str("example_currency")),  // String
    ("merchant_category_code", Value::Num(1.0)),  // i64
    ("merchant_name", Value::str("example_merchant_name")),  // String
    ("packageid", Value::str("example_packageid")),  // String
    ("packageorderuuid", Value::str("example_packageorderuuid")),  // String
    ("reason_deactivation", Value::str("example_reason_deactivation")),  // String
    ("reason_reactivation", Value::str("example_reason_reactivation")),  // String
    ("street", Value::str("example_street")),  // String
    ("terminal_country_code", Value::str("example_terminal_country_code")),  // String
    ("terminal_language_code", Value::str("example_terminal_language_code")),  // String
    ("terminal_location", Value::str("example_terminal_location")),  // String
    ("terminal_serial_number", Value::str("example_terminal_serial_number")),  // String
    ("terminalid", Value::Num(1.0)),  // i64
    ("vu_nummer", Value::str("example_vu_nummer")),  // String
    ("zipcode", Value::str("example_zipcode")),  // String
]), Value::Noval).unwrap();
```


### MerchantPortalCommonController

Create an instance: `let merchant_portal_common_controller = client.merchant_portal_common_controller(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```rust
let merchant_portal_common_controller = client.merchant_portal_common_controller(Value::Noval).load(Value::Noval, Value::Noval).unwrap();
```


### MerchantPortalPamContractController

Create an instance: `let merchant_portal_pam_contract_controller = client.merchant_portal_pam_contract_controller(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `String` |  |
| `product_order_uuid` | `String` |  |

#### Example: Create

```rust
let merchant_portal_pam_contract_controller = client.merchant_portal_pam_contract_controller(Value::Noval).create(jo(vec![
    ("language", Value::str("example_language")),  // String
    ("product_order_uuid", Value::str("example_product_order_uuid")),  // String
]), Value::Noval).unwrap();
```


### MerchantPortalPamDocumentController

Create an instance: `let merchant_portal_pam_document_controller = client.merchant_portal_pam_document_controller(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_field_desc_uuid` | `String` |  |
| `package_order_uuid` | `String` |  |
| `product_order_uuid` | `String` |  |

#### Example: Create

```rust
let merchant_portal_pam_document_controller = client.merchant_portal_pam_document_controller(Value::Noval).create(jo(vec![
    ("app_form_field_desc_uuid", Value::str("example_app_form_field_desc_uuid")),  // String
]), Value::Noval).unwrap();
```


### MerchantPortalPamFormController

Create an instance: `let merchant_portal_pam_form_controller = client.merchant_portal_pam_form_controller(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_fields_desc_uuid` | `String` |  |
| `filter` | `std::collections::HashMap<String, Value>` |  |
| `language` | `String` |  |
| `package_order` | `std::collections::HashMap<String, Value>` |  |
| `package_order_uuid` | `String` |  |
| `package_uuid` | `String` |  |
| `product_order` | `Vec<Value>` |  |
| `product_order_uuid` | `String` |  |
| `reason_of_reopening` | `String` |  |

#### Example: Create

```rust
let merchant_portal_pam_form_controller = client.merchant_portal_pam_form_controller(Value::Noval).create(jo(vec![
    ("app_form_fields_desc_uuid", Value::str("example_app_form_fields_desc_uuid")),  // String
    ("language", Value::str("example_language")),  // String
    ("package_order_uuid", Value::str("example_package_order_uuid")),  // String
    ("reason_of_reopening", Value::str("example_reason_of_reopening")),  // String
]), Value::Noval).unwrap();
```


### MerchantPortalPamMandatorController

Create an instance: `let merchant_portal_pam_mandator_controller = client.merchant_portal_pam_mandator_controller(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client_secret` | `String` |  |
| `mandator_name` | `String` |  |
| `notification_email` | `String` |  |
| `package_uuid` | `String` |  |

#### Example: Create

```rust
let merchant_portal_pam_mandator_controller = client.merchant_portal_pam_mandator_controller(Value::Noval).create(jo(vec![
    ("mandator_name", Value::str("example_mandator_name")),  // String
    ("package_uuid", Value::str("example_package_uuid")),  // String
]), Value::Noval).unwrap();
```


### MerchantPortalPamMerchantController

Create an instance: `let merchant_portal_pam_merchant_controller = client.merchant_portal_pam_merchant_controller(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `std::collections::HashMap<String, Value>` |  |
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
| `terminal_id` | `Vec<Value>` |  |
| `terminalid_acquirer` | `String` |  |
| `vu_nummer` | `String` |  |

#### Example: Create

```rust
let merchant_portal_pam_merchant_controller = client.merchant_portal_pam_merchant_controller(Value::Noval).create(jo(vec![
    ("business_registration_number", Value::str("example_business_registration_number")),  // String
    ("company_name", Value::str("example_company_name")),  // String
    ("corporate_uuid", Value::str("example_corporate_uuid")),  // String
    ("currency", Value::str("example_currency")),  // String
    ("email", Value::str("example_email")),  // String
    ("language", Value::str("example_language")),  // String
    ("login", Value::str("example_login")),  // String
    ("mandator", Value::str("example_mandator")),  // String
    ("merchant_contract_number", Value::str("example_merchant_contract_number")),  // String
    ("packageorderuuid", Value::str("example_packageorderuuid")),  // String
    ("phone_number", Value::str("example_phone_number")),  // String
    ("productid_acquirer", Value::str("example_productid_acquirer")),  // String
    ("vu_nummer", Value::str("example_vu_nummer")),  // String
]), Value::Noval).unwrap();
```


### MerchantPortalPamPackageController

Create an instance: `let merchant_portal_pam_package_controller = client.merchant_portal_pam_package_controller(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `String` |  |
| `corporate_uuid` | `String` |  |
| `country` | `String` |  |
| `description_key` | `String` |  |
| `filter` | `std::collections::HashMap<String, Value>` |  |
| `language` | `String` |  |
| `name_key` | `String` |  |
| `package_status` | `String` |  |
| `package_uuid` | `String` |  |
| `pagination` | `std::collections::HashMap<String, Value>` |  |
| `sorting` | `std::collections::HashMap<String, Value>` |  |

#### Example: Create

```rust
let merchant_portal_pam_package_controller = client.merchant_portal_pam_package_controller(Value::Noval).create(jo(vec![
    ("language", Value::str("example_language")),  // String
    ("package_uuid", Value::str("example_package_uuid")),  // String
]), Value::Noval).unwrap();
```


### MerchantPortalPamProductController

Create an instance: `let merchant_portal_pam_product_controller = client.merchant_portal_pam_product_controller(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `String` |  |
| `filter` | `std::collections::HashMap<String, Value>` |  |
| `language` | `String` |  |
| `merchant_id` | `String` |  |
| `package_order_uuid` | `String` |  |
| `pagination` | `std::collections::HashMap<String, Value>` |  |
| `product_order_uuid` | `String` |  |
| `product_uuid` | `String` |  |
| `reason_decline` | `String` |  |
| `sorting` | `std::collections::HashMap<String, Value>` |  |

#### Example: Create

```rust
let merchant_portal_pam_product_controller = client.merchant_portal_pam_product_controller(Value::Noval).create(jo(vec![
    ("package_order_uuid", Value::str("example_package_order_uuid")),  // String
    ("product_order_uuid", Value::str("example_product_order_uuid")),  // String
    ("product_uuid", Value::str("example_product_uuid")),  // String
    ("reason_decline", Value::str("example_reason_decline")),  // String
]), Value::Noval).unwrap();
```


### OutputAddProduct

Create an instance: `let output_add_product = client.output_add_product(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `String` |  |
| `product_uui_d` | `Vec<Value>` |  |
| `response_code` | `i64` |  |
| `response_message` | `String` |  |

#### Example: Create

```rust
let output_add_product = client.output_add_product(Value::Noval).create(jo(vec![
    ("package_uuid", Value::str("example_package_uuid")),  // String
    ("product_uui_d", Value::empty_list()),  // Vec<Value>
    ("response_code", Value::Num(1.0)),  // i64
    ("response_message", Value::str("example_response_message")),  // String
]), Value::Noval).unwrap();
```


### OutputCreateProduct

Create an instance: `let output_create_product = client.output_create_product(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirer_id` | `String` |  |
| `allow_multiple_order` | `bool` |  |
| `app_form_template_name` | `String` |  |
| `contract_needed` | `bool` |  |
| `credentials_needed` | `bool` |  |
| `description_key` | `String` |  |
| `name_key` | `String` |  |
| `prescreening_allowed` | `bool` |  |
| `product_name` | `String` |  |
| `response_code` | `i64` |  |
| `response_message` | `String` |  |
| `terminal_template_name` | `String` |  |
| `vendor_name` | `String` |  |
| `xml_template_file` | `String` |  |

#### Example: Create

```rust
let output_create_product = client.output_create_product(Value::Noval).create(jo(vec![
    ("allow_multiple_order", Value::Bool(true)),  // bool
    ("app_form_template_name", Value::str("example_app_form_template_name")),  // String
    ("contract_needed", Value::Bool(true)),  // bool
    ("description_key", Value::str("example_description_key")),  // String
    ("name_key", Value::str("example_name_key")),  // String
    ("prescreening_allowed", Value::Bool(true)),  // bool
    ("product_name", Value::str("example_product_name")),  // String
    ("response_code", Value::Num(1.0)),  // i64
    ("response_message", Value::str("example_response_message")),  // String
    ("terminal_template_name", Value::str("example_terminal_template_name")),  // String
    ("vendor_name", Value::str("example_vendor_name")),  // String
    ("xml_template_file", Value::str("example_xml_template_file")),  // String
]), Value::Noval).unwrap();
```


### OutputDetail

Create an instance: `let output_detail = client.output_detail(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `detail` | `std::collections::HashMap<String, Value>` |  |
| `response_code` | `i64` |  |
| `response_message` | `String` |  |

#### Example: Load

```rust
let output_detail = client.output_detail(Value::Noval).load(jo(vec![("id", Value::str("output_detail_id"))]), Value::Noval).unwrap();
```


### OutputList

Create an instance: `let output_list = client.output_list(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `item` | `Vec<Value>` |  |
| `pagination` | `std::collections::HashMap<String, Value>` |  |
| `response_code` | `i64` |  |
| `response_message` | `String` |  |
| `sorting` | `std::collections::HashMap<String, Value>` |  |

#### Example: Create

```rust
let output_list = client.output_list(Value::Noval).create(jo(vec![
    ("pagination", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("response_code", Value::Num(1.0)),  // i64
    ("response_message", Value::str("example_response_message")),  // String
]), Value::Noval).unwrap();
```


### OutputMessage

Create an instance: `let output_message = client.output_message(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `response_code` | `i64` |  |
| `response_message` | `String` |  |

#### Example: Load

```rust
let output_message = client.output_message(Value::Noval).load(jo(vec![("id", Value::str("output_message_id"))]), Value::Noval).unwrap();
```


### OutputMoveTid

Create an instance: `let output_move_tid = client.output_move_tid(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `product_order_uui_d` | `Vec<Value>` |  |
| `response_code` | `i64` |  |
| `response_message` | `String` |  |
| `target_package_order_uuid` | `String` |  |
| `target_product_order_uuid` | `String` |  |

#### Example: Create

```rust
let output_move_tid = client.output_move_tid(Value::Noval).create(jo(vec![
    ("product_order_uui_d", Value::empty_list()),  // Vec<Value>
    ("response_code", Value::Num(1.0)),  // i64
    ("response_message", Value::str("example_response_message")),  // String
    ("target_package_order_uuid", Value::str("example_target_package_order_uuid")),  // String
    ("target_product_order_uuid", Value::str("example_target_product_order_uuid")),  // String
]), Value::Noval).unwrap();
```


### OutputRemoveProduct

Create an instance: `let output_remove_product = client.output_remove_product(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `String` |  |
| `product_uui_d` | `Vec<Value>` |  |
| `response_code` | `i64` |  |
| `response_message` | `String` |  |

#### Example: Create

```rust
let output_remove_product = client.output_remove_product(Value::Noval).create(jo(vec![
    ("package_uuid", Value::str("example_package_uuid")),  // String
    ("product_uui_d", Value::empty_list()),  // Vec<Value>
    ("response_code", Value::Num(1.0)),  // i64
    ("response_message", Value::str("example_response_message")),  // String
]), Value::Noval).unwrap();
```


### OutputStart

Create an instance: `let output_start = client.output_start(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `String` |  |
| `response_code` | `i64` |  |
| `response_message` | `String` |  |

#### Example: Create

```rust
let output_start = client.output_start(Value::Noval).create(jo(vec![
    ("response_code", Value::Num(1.0)),  // i64
    ("response_message", Value::str("example_response_message")),  // String
]), Value::Noval).unwrap();
```


### OutputStatus

Create an instance: `let output_status = client.output_status(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `i64` |  |
| `response_code` | `i64` |  |
| `response_message` | `String` |  |
| `status` | `String` |  |

#### Example: Load

```rust
let output_status = client.output_status(Value::Noval).load(jo(vec![("id", Value::str("output_status_id"))]), Value::Noval).unwrap();
```


### OutputUpdateProduct

Create an instance: `let output_update_product = client.output_update_product(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allow_multiple_order` | `bool` |  |
| `app_form_name` | `String` |  |
| `contract_needed` | `bool` |  |
| `credentials_needed` | `bool` |  |
| `description_key` | `String` |  |
| `name_key` | `String` |  |
| `prescreening_allowed` | `bool` |  |
| `product_name` | `String` |  |
| `product_status` | `String` |  |
| `product_uuid` | `String` |  |
| `response_code` | `i64` |  |
| `response_message` | `String` |  |
| `vendor_name` | `String` |  |

#### Example: Create

```rust
let output_update_product = client.output_update_product(Value::Noval).create(jo(vec![
    ("product_uuid", Value::str("example_product_uuid")),  // String
    ("response_code", Value::Num(1.0)),  // i64
    ("response_message", Value::str("example_response_message")),  // String
]), Value::Noval).unwrap();
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

The Rust SDK uses a single dynamic `Value` type throughout rather than a
typed struct per entity. `Value` is the vendored voxgig struct port (a
JSON-shaped enum: `Str`, `Num`, `Bool`, `List`, `Map`, `Null`,
`Noval`). This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with the `jo` / `ja` helpers and read fields back with
`getp`; use `to_map` to safely coerce a value to a map.

### Crate structure

```
rust/
├── lib.rs                       -- Crate root (module decls + re-exports)
├── core/                        -- Pipeline types, config, client (sdk.rs)
├── entity/                      -- Per-entity clients (one module each)
├── feature/                     -- Built-in features (base, test, log)
└── utility/                     -- Utilities + the vendored voxgig struct port
```

The public API is re-exported from the crate root, so `use bluefin_tecs_merchant_portal_sdk::{...}`
reaches the SDK client, `Value`, and the `jo` / `ja` / `getp` helpers
directly. Import entity or utility modules only when needed.

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
