# BluefinTecsMerchantPortal Rust SDK Reference

Complete API reference for the BluefinTecsMerchantPortal Rust SDK.


## BluefinTecsMerchantPortalSDK

### Constructor

```rust
use bluefin_tecs_merchant_portal_sdk::{BluefinTecsMerchantPortalSDK, Value};

let client = BluefinTecsMerchantPortalSDK::new(options);
```

Create a new SDK client instance. `options` is a `Value` map
(`Value::Noval` for none).

**Parameters:**

| Key | Value type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides. |


### Static Functions

#### `test_sdk(testopts: Value, sdkopts: Value) -> Rc<BluefinTecsMerchantPortalSDK>`

Create a test client with mock features active. Both arguments may be
`Value::Noval`.

```rust
use bluefin_tecs_merchant_portal_sdk::{test_sdk, Value};

let client = test_sdk(Value::Noval, Value::Noval);
```


### Instance Methods

#### `merchant_portal_api_controller(entopts: Value) -> Rc<MerchantPortalApiControllerEntity>`

Create a new `MerchantPortalApiControllerEntity` instance. Pass `Value::Noval` for no
initial options.

#### `merchant_portal_common_controller(entopts: Value) -> Rc<MerchantPortalCommonControllerEntity>`

Create a new `MerchantPortalCommonControllerEntity` instance. Pass `Value::Noval` for no
initial options.

#### `merchant_portal_pam_contract_controller(entopts: Value) -> Rc<MerchantPortalPamContractControllerEntity>`

Create a new `MerchantPortalPamContractControllerEntity` instance. Pass `Value::Noval` for no
initial options.

#### `merchant_portal_pam_document_controller(entopts: Value) -> Rc<MerchantPortalPamDocumentControllerEntity>`

Create a new `MerchantPortalPamDocumentControllerEntity` instance. Pass `Value::Noval` for no
initial options.

#### `merchant_portal_pam_form_controller(entopts: Value) -> Rc<MerchantPortalPamFormControllerEntity>`

Create a new `MerchantPortalPamFormControllerEntity` instance. Pass `Value::Noval` for no
initial options.

#### `merchant_portal_pam_mandator_controller(entopts: Value) -> Rc<MerchantPortalPamMandatorControllerEntity>`

Create a new `MerchantPortalPamMandatorControllerEntity` instance. Pass `Value::Noval` for no
initial options.

#### `merchant_portal_pam_merchant_controller(entopts: Value) -> Rc<MerchantPortalPamMerchantControllerEntity>`

Create a new `MerchantPortalPamMerchantControllerEntity` instance. Pass `Value::Noval` for no
initial options.

#### `merchant_portal_pam_package_controller(entopts: Value) -> Rc<MerchantPortalPamPackageControllerEntity>`

Create a new `MerchantPortalPamPackageControllerEntity` instance. Pass `Value::Noval` for no
initial options.

#### `merchant_portal_pam_product_controller(entopts: Value) -> Rc<MerchantPortalPamProductControllerEntity>`

Create a new `MerchantPortalPamProductControllerEntity` instance. Pass `Value::Noval` for no
initial options.

#### `output_add_product(entopts: Value) -> Rc<OutputAddProductEntity>`

Create a new `OutputAddProductEntity` instance. Pass `Value::Noval` for no
initial options.

#### `output_create_product(entopts: Value) -> Rc<OutputCreateProductEntity>`

Create a new `OutputCreateProductEntity` instance. Pass `Value::Noval` for no
initial options.

#### `output_detail(entopts: Value) -> Rc<OutputDetailEntity>`

Create a new `OutputDetailEntity` instance. Pass `Value::Noval` for no
initial options.

#### `output_list(entopts: Value) -> Rc<OutputListEntity>`

Create a new `OutputListEntity` instance. Pass `Value::Noval` for no
initial options.

#### `output_message(entopts: Value) -> Rc<OutputMessageEntity>`

Create a new `OutputMessageEntity` instance. Pass `Value::Noval` for no
initial options.

#### `output_move_tid(entopts: Value) -> Rc<OutputMoveTidEntity>`

Create a new `OutputMoveTidEntity` instance. Pass `Value::Noval` for no
initial options.

#### `output_remove_product(entopts: Value) -> Rc<OutputRemoveProductEntity>`

Create a new `OutputRemoveProductEntity` instance. Pass `Value::Noval` for no
initial options.

#### `output_start(entopts: Value) -> Rc<OutputStartEntity>`

Create a new `OutputStartEntity` instance. Pass `Value::Noval` for no
initial options.

#### `output_status(entopts: Value) -> Rc<OutputStatusEntity>`

Create a new `OutputStatusEntity` instance. Pass `Value::Noval` for no
initial options.

#### `output_update_product(entopts: Value) -> Rc<OutputUpdateProductEntity>`

Create a new `OutputUpdateProductEntity` instance. Pass `Value::Noval` for no
initial options.

#### `options_map() -> Value`

Return a deep copy of the current SDK options.

#### `get_utility() -> Rc<Utility>`

Return a copy of the SDK utility object.

#### `direct(fetchargs: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Make a direct HTTP request to any API endpoint. `Ok` is a result `Value::Map`
with `ok`, `status`, `headers`, and `data` (or `err` on failure). This
escape hatch resolves to `Ok` even on a non-2xx response — branch on
`getp(&result, "ok")`.

**Parameters (`fetchargs` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

#### `prepare(fetchargs: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Prepare a fetch definition without sending. Returns the fetchdef on `Ok`.


---

## MerchantPortalApiControllerEntity

```rust
let merchant_portal_api_controller = client.merchant_portal_api_controller(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `i64` | No | Account number provided by the acquirer. |
| `additional_data` | `std::collections::HashMap<String, Value>` | No | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `String` | Yes | Merchant business registration number as stated in the company registry. |
| `city` | `String` | Yes | Merchant's address: city. |
| `corporateuuid` | `String` | No | Unique identifier for the corporate entity (UUID format). |
| `country` | `String` | Yes | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `String` | Yes | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `i64` | Yes | Merchant category code as defined by the payment network. |
| `merchant_email` | `String` | No | Merchant's email address for receiving notifications. |
| `merchant_name` | `String` | Yes | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | `String` | No | Merchant's phone number for notifications. |
| `packageid` | `String` | Yes | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | `String` | Yes | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | `String` | No | Merchant password for MPOS. |
| `productid` | `String` | No | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | `String` | No | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | `String` | Yes | Reason for terminal deactivation. |
| `reason_reactivation` | `String` | Yes | Reason for terminal reactivation. |
| `sorting_code` | `i64` | No | Sorting code provided by the acquirer. |
| `state` | `String` | No | Merchant's address: state. |
| `street` | `String` | Yes | Merchant's address: street and house number. |
| `terminal_country_code` | `String` | Yes | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `String` | Yes | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `String` | Yes | Physical or logical location of the terminal. |
| `terminal_serial_number` | `String` | Yes | Terminal serial number. |
| `terminalid` | `i64` | Yes | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `String` | No | Terminal ID as set by the acquirer (optional). |
| `user_email` | `String` | No | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `String` | No | Phone number of the user acting on behalf of the merchant. |
| `username` | `String` | No | Merchant username for MPOS. |
| `vu_nummer` | `String` | Yes | Merchant contract number with the acquirer. |
| `web_shop_url` | `String` | No | URL of the merchant's web shop. |
| `zipcode` | `String` | Yes | Merchant's address: postal code. |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.merchant_portal_api_controller(Value::Noval).create(jo(vec![
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

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `MerchantPortalApiControllerEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## MerchantPortalCommonControllerEntity

```rust
let merchant_portal_common_controller = client.merchant_portal_common_controller(Value::Noval);
```

### Operations

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.merchant_portal_common_controller(Value::Noval).load(Value::Noval, Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `MerchantPortalCommonControllerEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## MerchantPortalPamContractControllerEntity

```rust
let merchant_portal_pam_contract_controller = client.merchant_portal_pam_contract_controller(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `String` | Yes |  |
| `productOrderUUID` | `String` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.merchant_portal_pam_contract_controller(Value::Noval).create(jo(vec![
    ("language", Value::str("example_language")),  // String
    ("productOrderUUID", Value::str("example_productOrderUUID")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `MerchantPortalPamContractControllerEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## MerchantPortalPamDocumentControllerEntity

```rust
let merchant_portal_pam_document_controller = client.merchant_portal_pam_document_controller(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appFormFieldDescUUID` | `String` | Yes |  |
| `packageOrderUUID` | `String` | No | UUID of the package order. |
| `productOrderUUID` | `String` | No | UUID of the product order. |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.merchant_portal_pam_document_controller(Value::Noval).create(jo(vec![
    ("appFormFieldDescUUID", Value::str("example_appFormFieldDescUUID")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `MerchantPortalPamDocumentControllerEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## MerchantPortalPamFormControllerEntity

```rust
let merchant_portal_pam_form_controller = client.merchant_portal_pam_form_controller(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appFormFieldsDescUUID` | `String` | Yes |  |
| `filter` | `std::collections::HashMap<String, Value>` | No |  |
| `language` | `String` | Yes |  |
| `packageOrder` | `std::collections::HashMap<String, Value>` | No |  |
| `packageOrderUUID` | `String` | Yes | UUID of the package order. |
| `packageUUID` | `String` | No |  |
| `productOrderUUID` | `String` | No | UUID of the product order. |
| `productOrders` | `Vec<Value>` | No |  |
| `reasonOfReopening` | `String` | Yes |  |

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

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.merchant_portal_pam_form_controller(Value::Noval).create(jo(vec![
    ("appFormFieldsDescUUID", Value::str("example_appFormFieldsDescUUID")),  // String
    ("language", Value::str("example_language")),  // String
    ("packageOrderUUID", Value::str("example_packageOrderUUID")),  // String
    ("reasonOfReopening", Value::str("example_reasonOfReopening")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `MerchantPortalPamFormControllerEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## MerchantPortalPamMandatorControllerEntity

```rust
let merchant_portal_pam_mandator_controller = client.merchant_portal_pam_mandator_controller(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `clientSecret` | `String` | No |  |
| `mandatorName` | `String` | Yes |  |
| `notificationEmail` | `String` | No |  |
| `packageUUID` | `String` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.merchant_portal_pam_mandator_controller(Value::Noval).create(jo(vec![
    ("mandatorName", Value::str("example_mandatorName")),  // String
    ("packageUUID", Value::str("example_packageUUID")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `MerchantPortalPamMandatorControllerEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## MerchantPortalPamMerchantControllerEntity

```rust
let merchant_portal_pam_merchant_controller = client.merchant_portal_pam_merchant_controller(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `std::collections::HashMap<String, Value>` | No | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` | `String` | Yes |  |
| `city` | `String` | No | City where the merchant is located. |
| `companyName` | `String` | Yes |  |
| `corporateUUID` | `String` | Yes | Unique identifier for the corporate entity. |
| `country` | `String` | No | Country where the merchant is located. |
| `currency` | `String` | Yes | Transaction currency in ISO 4217 format. |
| `email` | `String` | Yes |  |
| `language` | `String` | Yes |  |
| `login` | `String` | Yes |  |
| `mandator` | `String` | Yes | Mandator name assigned by TECS. |
| `merchantContractNumber` | `String` | Yes | Unique identifier for the merchant within a specific system. |
| `merchantName` | `String` | No | Name of the merchant. |
| `merchant_category_code` | `String` | No | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | `String` | No | UUID of the package. |
| `packageorderuuid` | `String` | Yes | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` | `String` | Yes |  |
| `postalCode` | `String` | No | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | `String` | Yes | Identifier of the product for which acquiring is to be enabled. |
| `region` | `String` | No | State or province where the merchant is located. |
| `registrationNumber` | `String` | No | Business registration number. |
| `signature` | `String` | No | Signature value = saltAsHex-hashAsHex. |
| `street` | `String` | No | Street address of the merchant. |
| `terminalIds` | `Vec<Value>` | No | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `String` | No | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `String` | Yes | Merchant contract number with the acquirer. |

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

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.merchant_portal_pam_merchant_controller(Value::Noval).create(jo(vec![
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

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `MerchantPortalPamMerchantControllerEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## MerchantPortalPamPackageControllerEntity

```rust
let merchant_portal_pam_package_controller = client.merchant_portal_pam_package_controller(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumerUUID` | `String` | No |  |
| `corporateUUID` | `String` | No |  |
| `country` | `String` | No | Country associated with the package. |
| `descriptionKey` | `String` | No | Key for the description of the package. |
| `filter` | `std::collections::HashMap<String, Value>` | No |  |
| `language` | `String` | Yes |  |
| `nameKey` | `String` | No | Key for the name of the package. |
| `packageStatus` | `String` | No | Status of the package. |
| `packageUUID` | `String` | Yes | Unique identifier for the package. |
| `pagination` | `std::collections::HashMap<String, Value>` | No |  |
| `sorting` | `std::collections::HashMap<String, Value>` | No |  |

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

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.merchant_portal_pam_package_controller(Value::Noval).create(jo(vec![
    ("language", Value::str("example_language")),  // String
    ("packageUUID", Value::str("example_packageUUID")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `MerchantPortalPamPackageControllerEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## MerchantPortalPamProductControllerEntity

```rust
let merchant_portal_pam_product_controller = client.merchant_portal_pam_product_controller(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumerUUID` | `String` | No |  |
| `filter` | `std::collections::HashMap<String, Value>` | No |  |
| `language` | `String` | No |  |
| `merchantID` | `String` | No |  |
| `packageOrderUUID` | `String` | Yes |  |
| `pagination` | `std::collections::HashMap<String, Value>` | No |  |
| `productOrderUUID` | `String` | Yes |  |
| `productUUID` | `String` | Yes |  |
| `reason_decline` | `String` | Yes | Reason for product decline. |
| `sorting` | `std::collections::HashMap<String, Value>` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.merchant_portal_pam_product_controller(Value::Noval).create(jo(vec![
    ("packageOrderUUID", Value::str("example_packageOrderUUID")),  // String
    ("productOrderUUID", Value::str("example_productOrderUUID")),  // String
    ("productUUID", Value::str("example_productUUID")),  // String
    ("reason_decline", Value::str("example_reason_decline")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `MerchantPortalPamProductControllerEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## OutputAddProductEntity

```rust
let output_add_product = client.output_add_product(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `packageUUID` | `String` | Yes | Unique identifier for the package. |
| `productUUIDs` | `Vec<Value>` | Yes | The list of unique identifiers of the products. |
| `responseCode` | `i64` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.output_add_product(Value::Noval).create(jo(vec![
    ("packageUUID", Value::str("example_packageUUID")),  // String
    ("productUUIDs", Value::empty_list()),  // Vec<Value>
    ("responseCode", Value::Num(1.0)),  // i64
    ("responseMessage", Value::str("example_responseMessage")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `OutputAddProductEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## OutputCreateProductEntity

```rust
let output_create_product = client.output_create_product(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acquirerId` | `String` | No | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `bool` | Yes | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `String` | Yes | Name of the application form template. |
| `contractNeeded` | `bool` | Yes | Indication whether contract is needed or not. |
| `credentialsNeeded` | `bool` | No | Indication whether credentials are needed or not. |
| `descriptionKey` | `String` | Yes | Key indicator for product description. |
| `nameKey` | `String` | Yes | Key indicator for product name. |
| `prescreeningAllowed` | `bool` | Yes | Indication whether prescreening is allowed or not. |
| `productName` | `String` | Yes | Name of the product. |
| `responseCode` | `i64` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `terminalTemplateName` | `String` | Yes | Name of the terminal template. |
| `vendorName` | `String` | Yes | Name of the vendor. |
| `xmlTemplateFile` | `String` | Yes | A string value containing the XML template file encoded in Base64. |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.output_create_product(Value::Noval).create(jo(vec![
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

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `OutputCreateProductEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## OutputDetailEntity

```rust
let output_detail = client.output_detail(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `batch` | `std::collections::HashMap<String, Value>` | No |  |
| `lines` | `std::collections::HashMap<String, Value>` | No |  |
| `progress` | `std::collections::HashMap<String, Value>` | No |  |

### Operations

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.output_detail(Value::Noval).load(jo(vec![("id", Value::str("output_detail_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `OutputDetailEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## OutputListEntity

```rust
let output_list = client.output_list(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `items` | `Vec<Value>` | No |  |
| `pagination` | `std::collections::HashMap<String, Value>` | Yes |  |
| `responseCode` | `i64` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `sorting` | `std::collections::HashMap<String, Value>` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `items` | - |
| `pagination` | Yes |
| `responseCode` | - |
| `responseMessage` | - |
| `sorting` | - |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.output_list(Value::Noval).create(jo(vec![
    ("pagination", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("responseCode", Value::Num(1.0)),  // i64
    ("responseMessage", Value::str("example_responseMessage")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `OutputListEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## OutputMessageEntity

```rust
let output_message = client.output_message(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `responseCode` | `i64` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

### Operations

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.output_message(Value::Noval).load(jo(vec![("id", Value::str("output_message_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `OutputMessageEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## OutputMoveTidEntity

```rust
let output_move_tid = client.output_move_tid(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `productOrderUUIDs` | `Vec<Value>` | Yes |  |
| `responseCode` | `i64` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `targetPackageOrderUUID` | `String` | Yes |  |
| `targetProductOrderUUID` | `String` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.output_move_tid(Value::Noval).create(jo(vec![
    ("productOrderUUIDs", Value::empty_list()),  // Vec<Value>
    ("responseCode", Value::Num(1.0)),  // i64
    ("responseMessage", Value::str("example_responseMessage")),  // String
    ("targetPackageOrderUUID", Value::str("example_targetPackageOrderUUID")),  // String
    ("targetProductOrderUUID", Value::str("example_targetProductOrderUUID")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `OutputMoveTidEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## OutputRemoveProductEntity

```rust
let output_remove_product = client.output_remove_product(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `packageUUID` | `String` | Yes | Unique identifier for the package. |
| `productUUIDs` | `Vec<Value>` | Yes | List of product unique identifiers. |
| `responseCode` | `i64` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.output_remove_product(Value::Noval).create(jo(vec![
    ("packageUUID", Value::str("example_packageUUID")),  // String
    ("productUUIDs", Value::empty_list()),  // Vec<Value>
    ("responseCode", Value::Num(1.0)),  // i64
    ("responseMessage", Value::str("example_responseMessage")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `OutputRemoveProductEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## OutputStartEntity

```rust
let output_start = client.output_start(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `String` | No |  |
| `responseCode` | `i64` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.output_start(Value::Noval).create(jo(vec![
    ("responseCode", Value::Num(1.0)),  // i64
    ("responseMessage", Value::str("example_responseMessage")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `OutputStartEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## OutputStatusEntity

```rust
let output_status = client.output_status(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `i64` | No |  |
| `responseCode` | `i64` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `status` | `String` | No |  |

### Operations

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.output_status(Value::Noval).load(jo(vec![("id", Value::str("output_status_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `OutputStatusEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## OutputUpdateProductEntity

```rust
let output_update_product = client.output_update_product(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `allowMultipleOrders` | `bool` | No | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `String` | No | The name of the application form |
| `contractNeeded` | `bool` | No | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `bool` | No | An attribute to indicate if credentials are needed |
| `descriptionKey` | `String` | No | The description of the product |
| `nameKey` | `String` | No | The key of the product name |
| `prescreeningAllowed` | `bool` | No | An attribute to indicate if prescreening is allowed |
| `productName` | `String` | No | The name of the product |
| `productStatus` | `String` | No | The status of the product |
| `productUUID` | `String` | Yes | The UUID of the product to update |
| `responseCode` | `i64` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `vendorName` | `String` | No | The name of the vendor |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.output_update_product(Value::Noval).create(jo(vec![
    ("productUUID", Value::str("example_productUUID")),  // String
    ("responseCode", Value::Num(1.0)),  // i64
    ("responseMessage", Value::str("example_responseMessage")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `OutputUpdateProductEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```rust
let client = BluefinTecsMerchantPortalSDK::new(jo(vec![
    ("feature", jo(vec![
        ("test", jo(vec![("active", Value::Bool(true))])),
    ])),
]));
```

