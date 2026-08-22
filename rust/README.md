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
| `account_number` | Account number provided by the acquirer. |
| `additional_data` | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | Merchant business registration number as stated in the company registry. |
| `city` | Merchant's address: city. |
| `corporateuuid` | Unique identifier for the corporate entity (UUID format). |
| `country` | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | Merchant category code as defined by the payment network. |
| `merchant_email` | Merchant's email address for receiving notifications. |
| `merchant_name` | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | Merchant's phone number for notifications. |
| `packageid` | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | Merchant password for MPOS. |
| `productid` | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | Reason for terminal deactivation. |
| `reason_reactivation` | Reason for terminal reactivation. |
| `sorting_code` | Sorting code provided by the acquirer. |
| `state` | Merchant's address: state. |
| `street` | Merchant's address: street and house number. |
| `terminal_country_code` | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | Physical or logical location of the terminal. |
| `terminal_serial_number` | Terminal serial number. |
| `terminalid` | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | Terminal ID as set by the acquirer (optional). |
| `user_email` | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | Phone number of the user acting on behalf of the merchant. |
| `username` | Merchant username for MPOS. |
| `vu_nummer` | Merchant contract number with the acquirer. |
| `web_shop_url` | URL of the merchant's web shop. |
| `zipcode` | Merchant's address: postal code. |

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
| `packageOrderUUID` | UUID of the package order. |
| `productOrderUUID` | UUID of the product order. |

Operations: Create.

API path: `/merchantportalws/documentsList`

#### MerchantPortalPamFormController

| Field | Description |
| --- | --- |
| `appFormFieldsDescUUID` |  |
| `filter` |  |
| `language` |  |
| `packageOrder` |  |
| `packageOrderUUID` | UUID of the package order. |
| `packageUUID` |  |
| `productOrderUUID` | UUID of the product order. |
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
| `additional_data` | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` |  |
| `city` | City where the merchant is located. |
| `companyName` |  |
| `corporateUUID` | Unique identifier for the corporate entity. |
| `country` | Country where the merchant is located. |
| `currency` | Transaction currency in ISO 4217 format. |
| `email` |  |
| `language` |  |
| `login` |  |
| `mandator` | Mandator name assigned by TECS. |
| `merchantContractNumber` | Unique identifier for the merchant within a specific system. |
| `merchantName` | Name of the merchant. |
| `merchant_category_code` | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | UUID of the package. |
| `packageorderuuid` | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` |  |
| `postalCode` | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | Identifier of the product for which acquiring is to be enabled. |
| `region` | State or province where the merchant is located. |
| `registrationNumber` | Business registration number. |
| `signature` | Signature value = saltAsHex-hashAsHex. |
| `street` | Street address of the merchant. |
| `terminalIds` | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | Merchant contract number with the acquirer. |

Operations: Create.

API path: `/merchantportalws/contractNumber`

#### MerchantPortalPamPackageController

| Field | Description |
| --- | --- |
| `consumerUUID` |  |
| `corporateUUID` |  |
| `country` | Country associated with the package. |
| `descriptionKey` | Key for the description of the package. |
| `filter` |  |
| `language` |  |
| `nameKey` | Key for the name of the package. |
| `packageStatus` | Status of the package. |
| `packageUUID` | Unique identifier for the package. |
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
| `reason_decline` | Reason for product decline. |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/approveProduct`

#### OutputAddProduct

| Field | Description |
| --- | --- |
| `packageUUID` | Unique identifier for the package. |
| `productUUIDs` | The list of unique identifiers of the products. |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: Create.

API path: `/merchantportalws/addProductsToPackage`

#### OutputCreateProduct

| Field | Description |
| --- | --- |
| `acquirerId` | Unique identifier for the acquirer. |
| `allowMultipleOrders` | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | Name of the application form template. |
| `contractNeeded` | Indication whether contract is needed or not. |
| `credentialsNeeded` | Indication whether credentials are needed or not. |
| `descriptionKey` | Key indicator for product description. |
| `nameKey` | Key indicator for product name. |
| `prescreeningAllowed` | Indication whether prescreening is allowed or not. |
| `productName` | Name of the product. |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `terminalTemplateName` | Name of the terminal template. |
| `vendorName` | Name of the vendor. |
| `xmlTemplateFile` | A string value containing the XML template file encoded in Base64. |

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
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/list`

#### OutputMessage

| Field | Description |
| --- | --- |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/restart/{id}`

#### OutputMoveTid

| Field | Description |
| --- | --- |
| `productOrderUUIDs` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `targetPackageOrderUUID` |  |
| `targetProductOrderUUID` |  |

Operations: Create.

API path: `/merchantportalws/moveTid`

#### OutputRemoveProduct

| Field | Description |
| --- | --- |
| `packageUUID` | Unique identifier for the package. |
| `productUUIDs` | List of product unique identifiers. |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: Create.

API path: `/merchantportalws/removeProductsFromPackage`

#### OutputStart

| Field | Description |
| --- | --- |
| `id` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/start`

#### OutputStatus

| Field | Description |
| --- | --- |
| `percentage` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `status` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/status/{id}`

#### OutputUpdateProduct

| Field | Description |
| --- | --- |
| `allowMultipleOrders` | An attribute to indicate if multiple orders are allowed |
| `appFormName` | The name of the application form |
| `contractNeeded` | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | An attribute to indicate if credentials are needed |
| `descriptionKey` | The description of the product |
| `nameKey` | The key of the product name |
| `prescreeningAllowed` | An attribute to indicate if prescreening is allowed |
| `productName` | The name of the product |
| `productStatus` | The status of the product |
| `productUUID` | The UUID of the product to update |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `vendorName` | The name of the vendor |

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
| `account_number` | `i64` | Account number provided by the acquirer. |
| `additional_data` | `std::collections::HashMap<String, Value>` | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `String` | Merchant business registration number as stated in the company registry. |
| `city` | `String` | Merchant's address: city. |
| `corporateuuid` | `String` | Unique identifier for the corporate entity (UUID format). |
| `country` | `String` | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `String` | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `i64` | Merchant category code as defined by the payment network. |
| `merchant_email` | `String` | Merchant's email address for receiving notifications. |
| `merchant_name` | `String` | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | `String` | Merchant's phone number for notifications. |
| `packageid` | `String` | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | `String` | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | `String` | Merchant password for MPOS. |
| `productid` | `String` | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | `String` | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | `String` | Reason for terminal deactivation. |
| `reason_reactivation` | `String` | Reason for terminal reactivation. |
| `sorting_code` | `i64` | Sorting code provided by the acquirer. |
| `state` | `String` | Merchant's address: state. |
| `street` | `String` | Merchant's address: street and house number. |
| `terminal_country_code` | `String` | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `String` | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `String` | Physical or logical location of the terminal. |
| `terminal_serial_number` | `String` | Terminal serial number. |
| `terminalid` | `i64` | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `String` | Terminal ID as set by the acquirer (optional). |
| `user_email` | `String` | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `String` | Phone number of the user acting on behalf of the merchant. |
| `username` | `String` | Merchant username for MPOS. |
| `vu_nummer` | `String` | Merchant contract number with the acquirer. |
| `web_shop_url` | `String` | URL of the merchant's web shop. |
| `zipcode` | `String` | Merchant's address: postal code. |

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
| `productOrderUUID` | `String` |  |

#### Example: Create

```rust
let merchant_portal_pam_contract_controller = client.merchant_portal_pam_contract_controller(Value::Noval).create(jo(vec![
    ("language", Value::str("example_language")),  // String
    ("productOrderUUID", Value::str("example_productOrderUUID")),  // String
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
| `appFormFieldDescUUID` | `String` |  |
| `packageOrderUUID` | `String` | UUID of the package order. |
| `productOrderUUID` | `String` | UUID of the product order. |

#### Example: Create

```rust
let merchant_portal_pam_document_controller = client.merchant_portal_pam_document_controller(Value::Noval).create(jo(vec![
    ("appFormFieldDescUUID", Value::str("example_appFormFieldDescUUID")),  // String
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
| `appFormFieldsDescUUID` | `String` |  |
| `filter` | `std::collections::HashMap<String, Value>` |  |
| `language` | `String` |  |
| `packageOrder` | `std::collections::HashMap<String, Value>` |  |
| `packageOrderUUID` | `String` | UUID of the package order. |
| `packageUUID` | `String` |  |
| `productOrderUUID` | `String` | UUID of the product order. |
| `productOrders` | `Vec<Value>` |  |
| `reasonOfReopening` | `String` |  |

#### Example: Create

```rust
let merchant_portal_pam_form_controller = client.merchant_portal_pam_form_controller(Value::Noval).create(jo(vec![
    ("appFormFieldsDescUUID", Value::str("example_appFormFieldsDescUUID")),  // String
    ("language", Value::str("example_language")),  // String
    ("packageOrderUUID", Value::str("example_packageOrderUUID")),  // String
    ("reasonOfReopening", Value::str("example_reasonOfReopening")),  // String
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
| `clientSecret` | `String` |  |
| `mandatorName` | `String` |  |
| `notificationEmail` | `String` |  |
| `packageUUID` | `String` |  |

#### Example: Create

```rust
let merchant_portal_pam_mandator_controller = client.merchant_portal_pam_mandator_controller(Value::Noval).create(jo(vec![
    ("mandatorName", Value::str("example_mandatorName")),  // String
    ("packageUUID", Value::str("example_packageUUID")),  // String
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
| `additional_data` | `std::collections::HashMap<String, Value>` | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` | `String` |  |
| `city` | `String` | City where the merchant is located. |
| `companyName` | `String` |  |
| `corporateUUID` | `String` | Unique identifier for the corporate entity. |
| `country` | `String` | Country where the merchant is located. |
| `currency` | `String` | Transaction currency in ISO 4217 format. |
| `email` | `String` |  |
| `language` | `String` |  |
| `login` | `String` |  |
| `mandator` | `String` | Mandator name assigned by TECS. |
| `merchantContractNumber` | `String` | Unique identifier for the merchant within a specific system. |
| `merchantName` | `String` | Name of the merchant. |
| `merchant_category_code` | `String` | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | `String` | UUID of the package. |
| `packageorderuuid` | `String` | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` | `String` |  |
| `postalCode` | `String` | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | `String` | Identifier of the product for which acquiring is to be enabled. |
| `region` | `String` | State or province where the merchant is located. |
| `registrationNumber` | `String` | Business registration number. |
| `signature` | `String` | Signature value = saltAsHex-hashAsHex. |
| `street` | `String` | Street address of the merchant. |
| `terminalIds` | `Vec<Value>` | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `String` | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `String` | Merchant contract number with the acquirer. |

#### Example: Create

```rust
let merchant_portal_pam_merchant_controller = client.merchant_portal_pam_merchant_controller(Value::Noval).create(jo(vec![
    ("businessRegistrationNumber", Value::str("example_businessRegistrationNumber")),  // String
    ("companyName", Value::str("example_companyName")),  // String
    ("corporateUUID", Value::str("example_corporateUUID")),  // String
    ("currency", Value::str("example_currency")),  // String
    ("email", Value::str("example_email")),  // String
    ("language", Value::str("example_language")),  // String
    ("login", Value::str("example_login")),  // String
    ("mandator", Value::str("example_mandator")),  // String
    ("merchantContractNumber", Value::str("example_merchantContractNumber")),  // String
    ("packageorderuuid", Value::str("example_packageorderuuid")),  // String
    ("phoneNumber", Value::str("example_phoneNumber")),  // String
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
| `consumerUUID` | `String` |  |
| `corporateUUID` | `String` |  |
| `country` | `String` | Country associated with the package. |
| `descriptionKey` | `String` | Key for the description of the package. |
| `filter` | `std::collections::HashMap<String, Value>` |  |
| `language` | `String` |  |
| `nameKey` | `String` | Key for the name of the package. |
| `packageStatus` | `String` | Status of the package. |
| `packageUUID` | `String` | Unique identifier for the package. |
| `pagination` | `std::collections::HashMap<String, Value>` |  |
| `sorting` | `std::collections::HashMap<String, Value>` |  |

#### Example: Create

```rust
let merchant_portal_pam_package_controller = client.merchant_portal_pam_package_controller(Value::Noval).create(jo(vec![
    ("language", Value::str("example_language")),  // String
    ("packageUUID", Value::str("example_packageUUID")),  // String
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
| `consumerUUID` | `String` |  |
| `filter` | `std::collections::HashMap<String, Value>` |  |
| `language` | `String` |  |
| `merchantID` | `String` |  |
| `packageOrderUUID` | `String` |  |
| `pagination` | `std::collections::HashMap<String, Value>` |  |
| `productOrderUUID` | `String` |  |
| `productUUID` | `String` |  |
| `reason_decline` | `String` | Reason for product decline. |
| `sorting` | `std::collections::HashMap<String, Value>` |  |

#### Example: Create

```rust
let merchant_portal_pam_product_controller = client.merchant_portal_pam_product_controller(Value::Noval).create(jo(vec![
    ("packageOrderUUID", Value::str("example_packageOrderUUID")),  // String
    ("productOrderUUID", Value::str("example_productOrderUUID")),  // String
    ("productUUID", Value::str("example_productUUID")),  // String
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
| `packageUUID` | `String` | Unique identifier for the package. |
| `productUUIDs` | `Vec<Value>` | The list of unique identifiers of the products. |
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `String` | Response message. |

#### Example: Create

```rust
let output_add_product = client.output_add_product(Value::Noval).create(jo(vec![
    ("packageUUID", Value::str("example_packageUUID")),  // String
    ("productUUIDs", Value::empty_list()),  // Vec<Value>
    ("responseCode", Value::Num(1.0)),  // i64
    ("responseMessage", Value::str("example_responseMessage")),  // String
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
| `acquirerId` | `String` | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `bool` | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `String` | Name of the application form template. |
| `contractNeeded` | `bool` | Indication whether contract is needed or not. |
| `credentialsNeeded` | `bool` | Indication whether credentials are needed or not. |
| `descriptionKey` | `String` | Key indicator for product description. |
| `nameKey` | `String` | Key indicator for product name. |
| `prescreeningAllowed` | `bool` | Indication whether prescreening is allowed or not. |
| `productName` | `String` | Name of the product. |
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `String` | Response message. |
| `terminalTemplateName` | `String` | Name of the terminal template. |
| `vendorName` | `String` | Name of the vendor. |
| `xmlTemplateFile` | `String` | A string value containing the XML template file encoded in Base64. |

#### Example: Create

```rust
let output_create_product = client.output_create_product(Value::Noval).create(jo(vec![
    ("allowMultipleOrders", Value::Bool(true)),  // bool
    ("appFormTemplateName", Value::str("example_appFormTemplateName")),  // String
    ("contractNeeded", Value::Bool(true)),  // bool
    ("descriptionKey", Value::str("example_descriptionKey")),  // String
    ("nameKey", Value::str("example_nameKey")),  // String
    ("prescreeningAllowed", Value::Bool(true)),  // bool
    ("productName", Value::str("example_productName")),  // String
    ("responseCode", Value::Num(1.0)),  // i64
    ("responseMessage", Value::str("example_responseMessage")),  // String
    ("terminalTemplateName", Value::str("example_terminalTemplateName")),  // String
    ("vendorName", Value::str("example_vendorName")),  // String
    ("xmlTemplateFile", Value::str("example_xmlTemplateFile")),  // String
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
| `batch` | `std::collections::HashMap<String, Value>` |  |
| `lines` | `std::collections::HashMap<String, Value>` |  |
| `progress` | `std::collections::HashMap<String, Value>` |  |

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
| `items` | `Vec<Value>` |  |
| `pagination` | `std::collections::HashMap<String, Value>` |  |
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `String` | Response message. |
| `sorting` | `std::collections::HashMap<String, Value>` |  |

#### Example: Create

```rust
let output_list = client.output_list(Value::Noval).create(jo(vec![
    ("pagination", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("responseCode", Value::Num(1.0)),  // i64
    ("responseMessage", Value::str("example_responseMessage")),  // String
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
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `String` | Response message. |

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
| `productOrderUUIDs` | `Vec<Value>` |  |
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `String` | Response message. |
| `targetPackageOrderUUID` | `String` |  |
| `targetProductOrderUUID` | `String` |  |

#### Example: Create

```rust
let output_move_tid = client.output_move_tid(Value::Noval).create(jo(vec![
    ("productOrderUUIDs", Value::empty_list()),  // Vec<Value>
    ("responseCode", Value::Num(1.0)),  // i64
    ("responseMessage", Value::str("example_responseMessage")),  // String
    ("targetPackageOrderUUID", Value::str("example_targetPackageOrderUUID")),  // String
    ("targetProductOrderUUID", Value::str("example_targetProductOrderUUID")),  // String
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
| `packageUUID` | `String` | Unique identifier for the package. |
| `productUUIDs` | `Vec<Value>` | List of product unique identifiers. |
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `String` | Response message. |

#### Example: Create

```rust
let output_remove_product = client.output_remove_product(Value::Noval).create(jo(vec![
    ("packageUUID", Value::str("example_packageUUID")),  // String
    ("productUUIDs", Value::empty_list()),  // Vec<Value>
    ("responseCode", Value::Num(1.0)),  // i64
    ("responseMessage", Value::str("example_responseMessage")),  // String
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
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `String` | Response message. |

#### Example: Create

```rust
let output_start = client.output_start(Value::Noval).create(jo(vec![
    ("responseCode", Value::Num(1.0)),  // i64
    ("responseMessage", Value::str("example_responseMessage")),  // String
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
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `String` | Response message. |
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
| `allowMultipleOrders` | `bool` | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `String` | The name of the application form |
| `contractNeeded` | `bool` | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `bool` | An attribute to indicate if credentials are needed |
| `descriptionKey` | `String` | The description of the product |
| `nameKey` | `String` | The key of the product name |
| `prescreeningAllowed` | `bool` | An attribute to indicate if prescreening is allowed |
| `productName` | `String` | The name of the product |
| `productStatus` | `String` | The status of the product |
| `productUUID` | `String` | The UUID of the product to update |
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `String` | Response message. |
| `vendorName` | `String` | The name of the vendor |

#### Example: Create

```rust
let output_update_product = client.output_update_product(Value::Noval).create(jo(vec![
    ("productUUID", Value::str("example_productUUID")),  // String
    ("responseCode", Value::Num(1.0)),  // i64
    ("responseMessage", Value::str("example_responseMessage")),  // String
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
