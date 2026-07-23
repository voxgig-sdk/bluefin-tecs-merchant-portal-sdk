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
| `account_number` | `i64` | No |  |
| `additional_data` | `std::collections::HashMap<String, Value>` | No |  |
| `business_reg_number` | `String` | Yes |  |
| `city` | `String` | Yes |  |
| `corporateuuid` | `String` | No |  |
| `country` | `String` | Yes |  |
| `currency` | `String` | Yes |  |
| `merchant_category_code` | `i64` | Yes |  |
| `merchant_email` | `String` | No |  |
| `merchant_name` | `String` | Yes |  |
| `merchant_phone_number` | `String` | No |  |
| `packageid` | `String` | Yes |  |
| `packageorderuuid` | `String` | Yes |  |
| `password` | `String` | No |  |
| `productid` | `String` | No |  |
| `productid_acquirer` | `String` | No |  |
| `reason_deactivation` | `String` | Yes |  |
| `reason_reactivation` | `String` | Yes |  |
| `sorting_code` | `i64` | No |  |
| `state` | `String` | No |  |
| `street` | `String` | Yes |  |
| `terminal_country_code` | `String` | Yes |  |
| `terminal_language_code` | `String` | Yes |  |
| `terminal_location` | `String` | Yes |  |
| `terminal_serial_number` | `String` | Yes |  |
| `terminalid` | `i64` | Yes |  |
| `terminalid_acquirer` | `String` | No |  |
| `user_email` | `String` | No |  |
| `user_phone_number` | `String` | No |  |
| `username` | `String` | No |  |
| `vu_nummer` | `String` | Yes |  |
| `web_shop_url` | `String` | No |  |
| `zipcode` | `String` | Yes |  |

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
| `product_order_uuid` | `String` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.merchant_portal_pam_contract_controller(Value::Noval).create(jo(vec![
    ("language", Value::str("example_language")),  // String
    ("product_order_uuid", Value::str("example_product_order_uuid")),  // String
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
| `app_form_field_desc_uuid` | `String` | Yes |  |
| `package_order_uuid` | `String` | No |  |
| `product_order_uuid` | `String` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.merchant_portal_pam_document_controller(Value::Noval).create(jo(vec![
    ("app_form_field_desc_uuid", Value::str("example_app_form_field_desc_uuid")),  // String
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
| `app_form_fields_desc_uuid` | `String` | Yes |  |
| `filter` | `std::collections::HashMap<String, Value>` | No |  |
| `language` | `String` | Yes |  |
| `package_order` | `std::collections::HashMap<String, Value>` | No |  |
| `package_order_uuid` | `String` | Yes |  |
| `package_uuid` | `String` | No |  |
| `product_order` | `Vec<Value>` | No |  |
| `product_order_uuid` | `String` | No |  |
| `reason_of_reopening` | `String` | Yes |  |

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

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.merchant_portal_pam_form_controller(Value::Noval).create(jo(vec![
    ("app_form_fields_desc_uuid", Value::str("example_app_form_fields_desc_uuid")),  // String
    ("language", Value::str("example_language")),  // String
    ("package_order_uuid", Value::str("example_package_order_uuid")),  // String
    ("reason_of_reopening", Value::str("example_reason_of_reopening")),  // String
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
| `client_secret` | `String` | No |  |
| `mandator_name` | `String` | Yes |  |
| `notification_email` | `String` | No |  |
| `package_uuid` | `String` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.merchant_portal_pam_mandator_controller(Value::Noval).create(jo(vec![
    ("mandator_name", Value::str("example_mandator_name")),  // String
    ("package_uuid", Value::str("example_package_uuid")),  // String
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
| `additional_data` | `std::collections::HashMap<String, Value>` | No |  |
| `business_registration_number` | `String` | Yes |  |
| `city` | `String` | No |  |
| `company_name` | `String` | Yes |  |
| `corporate_uuid` | `String` | Yes |  |
| `country` | `String` | No |  |
| `currency` | `String` | Yes |  |
| `email` | `String` | Yes |  |
| `language` | `String` | Yes |  |
| `login` | `String` | Yes |  |
| `mandator` | `String` | Yes |  |
| `merchant_category_code` | `String` | No |  |
| `merchant_contract_number` | `String` | Yes |  |
| `merchant_name` | `String` | No |  |
| `package_uuid` | `String` | No |  |
| `packageorderuuid` | `String` | Yes |  |
| `phone_number` | `String` | Yes |  |
| `postal_code` | `String` | No |  |
| `productid_acquirer` | `String` | Yes |  |
| `region` | `String` | No |  |
| `registration_number` | `String` | No |  |
| `signature` | `String` | No |  |
| `street` | `String` | No |  |
| `terminal_id` | `Vec<Value>` | No |  |
| `terminalid_acquirer` | `String` | No |  |
| `vu_nummer` | `String` | Yes |  |

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

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.merchant_portal_pam_merchant_controller(Value::Noval).create(jo(vec![
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
| `consumer_uuid` | `String` | No |  |
| `corporate_uuid` | `String` | No |  |
| `country` | `String` | No |  |
| `description_key` | `String` | No |  |
| `filter` | `std::collections::HashMap<String, Value>` | No |  |
| `language` | `String` | Yes |  |
| `name_key` | `String` | No |  |
| `package_status` | `String` | No |  |
| `package_uuid` | `String` | Yes |  |
| `pagination` | `std::collections::HashMap<String, Value>` | No |  |
| `sorting` | `std::collections::HashMap<String, Value>` | No |  |

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

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.merchant_portal_pam_package_controller(Value::Noval).create(jo(vec![
    ("language", Value::str("example_language")),  // String
    ("package_uuid", Value::str("example_package_uuid")),  // String
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
| `consumer_uuid` | `String` | No |  |
| `filter` | `std::collections::HashMap<String, Value>` | No |  |
| `language` | `String` | No |  |
| `merchant_id` | `String` | No |  |
| `package_order_uuid` | `String` | Yes |  |
| `pagination` | `std::collections::HashMap<String, Value>` | No |  |
| `product_order_uuid` | `String` | Yes |  |
| `product_uuid` | `String` | Yes |  |
| `reason_decline` | `String` | Yes |  |
| `sorting` | `std::collections::HashMap<String, Value>` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.merchant_portal_pam_product_controller(Value::Noval).create(jo(vec![
    ("package_order_uuid", Value::str("example_package_order_uuid")),  // String
    ("product_order_uuid", Value::str("example_product_order_uuid")),  // String
    ("product_uuid", Value::str("example_product_uuid")),  // String
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
| `package_uuid` | `String` | Yes |  |
| `product_uui_d` | `Vec<Value>` | Yes |  |
| `response_code` | `i64` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.output_add_product(Value::Noval).create(jo(vec![
    ("package_uuid", Value::str("example_package_uuid")),  // String
    ("product_uui_d", Value::empty_list()),  // Vec<Value>
    ("response_code", Value::Num(1.0)),  // i64
    ("response_message", Value::str("example_response_message")),  // String
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
| `acquirer_id` | `String` | No |  |
| `allow_multiple_order` | `bool` | Yes |  |
| `app_form_template_name` | `String` | Yes |  |
| `contract_needed` | `bool` | Yes |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `String` | Yes |  |
| `name_key` | `String` | Yes |  |
| `prescreening_allowed` | `bool` | Yes |  |
| `product_name` | `String` | Yes |  |
| `response_code` | `i64` | Yes |  |
| `response_message` | `String` | Yes |  |
| `terminal_template_name` | `String` | Yes |  |
| `vendor_name` | `String` | Yes |  |
| `xml_template_file` | `String` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.output_create_product(Value::Noval).create(jo(vec![
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
| `detail` | `std::collections::HashMap<String, Value>` | No |  |
| `response_code` | `i64` | Yes |  |
| `response_message` | `String` | Yes |  |

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
| `item` | `Vec<Value>` | No |  |
| `pagination` | `std::collections::HashMap<String, Value>` | Yes |  |
| `response_code` | `i64` | Yes |  |
| `response_message` | `String` | Yes |  |
| `sorting` | `std::collections::HashMap<String, Value>` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.output_list(Value::Noval).create(jo(vec![
    ("pagination", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("response_code", Value::Num(1.0)),  // i64
    ("response_message", Value::str("example_response_message")),  // String
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
| `response_code` | `i64` | Yes |  |
| `response_message` | `String` | Yes |  |

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
| `product_order_uui_d` | `Vec<Value>` | Yes |  |
| `response_code` | `i64` | Yes |  |
| `response_message` | `String` | Yes |  |
| `target_package_order_uuid` | `String` | Yes |  |
| `target_product_order_uuid` | `String` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.output_move_tid(Value::Noval).create(jo(vec![
    ("product_order_uui_d", Value::empty_list()),  // Vec<Value>
    ("response_code", Value::Num(1.0)),  // i64
    ("response_message", Value::str("example_response_message")),  // String
    ("target_package_order_uuid", Value::str("example_target_package_order_uuid")),  // String
    ("target_product_order_uuid", Value::str("example_target_product_order_uuid")),  // String
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
| `package_uuid` | `String` | Yes |  |
| `product_uui_d` | `Vec<Value>` | Yes |  |
| `response_code` | `i64` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.output_remove_product(Value::Noval).create(jo(vec![
    ("package_uuid", Value::str("example_package_uuid")),  // String
    ("product_uui_d", Value::empty_list()),  // Vec<Value>
    ("response_code", Value::Num(1.0)),  // i64
    ("response_message", Value::str("example_response_message")),  // String
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
| `response_code` | `i64` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.output_start(Value::Noval).create(jo(vec![
    ("response_code", Value::Num(1.0)),  // i64
    ("response_message", Value::str("example_response_message")),  // String
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
| `response_code` | `i64` | Yes |  |
| `response_message` | `String` | Yes |  |
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
| `allow_multiple_order` | `bool` | No |  |
| `app_form_name` | `String` | No |  |
| `contract_needed` | `bool` | No |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `String` | No |  |
| `name_key` | `String` | No |  |
| `prescreening_allowed` | `bool` | No |  |
| `product_name` | `String` | No |  |
| `product_status` | `String` | No |  |
| `product_uuid` | `String` | Yes |  |
| `response_code` | `i64` | Yes |  |
| `response_message` | `String` | Yes |  |
| `vendor_name` | `String` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinTecsMerchantPortalError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.output_update_product(Value::Noval).create(jo(vec![
    ("product_uuid", Value::str("example_product_uuid")),  // String
    ("response_code", Value::Num(1.0)),  // i64
    ("response_message", Value::str("example_response_message")),  // String
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

