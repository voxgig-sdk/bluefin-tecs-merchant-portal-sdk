# BluefinTecsMerchantPortal C++ SDK Reference

Complete API reference for the BluefinTecsMerchantPortal C++ SDK.


## BluefinTecsMerchantPortalSDK

### Constructor

```cpp
#include "core/sdk.hpp"

using namespace sdk;

auto client = std::make_shared<BluefinTecsMerchantPortalSDK>(options);
```

Create a new SDK client instance. `options` is an `sdk::Value` map.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Value` | SDK configuration options (a map). |
| `options["base"]` | `std::string` | Base URL for API requests. |
| `options["prefix"]` | `std::string` | URL prefix appended after base. |
| `options["suffix"]` | `std::string` | URL suffix appended after path. |
| `options["headers"]` | `Value` | Custom headers for all requests. |
| `options["feature"]` | `Value` | Feature configuration. |
| `options["system"]` | `Value` | System overrides. |


### Static Methods

#### `BluefinTecsMerchantPortalSDK::testSDK(testopts, sdkopts)`

Create a test client with mock features active. Both arguments may be
`Value::undef()`; a no-arg overload is also provided.

```cpp
auto client = BluefinTecsMerchantPortalSDK::testSDK();
```


### Instance Methods

#### `merchant_portal_api_controller(entopts = Value::undef()) -> std::shared_ptr<MerchantPortalApiControllerEntity>`

Create a new `MerchantPortalApiControllerEntity` instance bound to this client.

#### `merchant_portal_common_controller(entopts = Value::undef()) -> std::shared_ptr<MerchantPortalCommonControllerEntity>`

Create a new `MerchantPortalCommonControllerEntity` instance bound to this client.

#### `merchant_portal_pam_contract_controller(entopts = Value::undef()) -> std::shared_ptr<MerchantPortalPamContractControllerEntity>`

Create a new `MerchantPortalPamContractControllerEntity` instance bound to this client.

#### `merchant_portal_pam_document_controller(entopts = Value::undef()) -> std::shared_ptr<MerchantPortalPamDocumentControllerEntity>`

Create a new `MerchantPortalPamDocumentControllerEntity` instance bound to this client.

#### `merchant_portal_pam_form_controller(entopts = Value::undef()) -> std::shared_ptr<MerchantPortalPamFormControllerEntity>`

Create a new `MerchantPortalPamFormControllerEntity` instance bound to this client.

#### `merchant_portal_pam_mandator_controller(entopts = Value::undef()) -> std::shared_ptr<MerchantPortalPamMandatorControllerEntity>`

Create a new `MerchantPortalPamMandatorControllerEntity` instance bound to this client.

#### `merchant_portal_pam_merchant_controller(entopts = Value::undef()) -> std::shared_ptr<MerchantPortalPamMerchantControllerEntity>`

Create a new `MerchantPortalPamMerchantControllerEntity` instance bound to this client.

#### `merchant_portal_pam_package_controller(entopts = Value::undef()) -> std::shared_ptr<MerchantPortalPamPackageControllerEntity>`

Create a new `MerchantPortalPamPackageControllerEntity` instance bound to this client.

#### `merchant_portal_pam_product_controller(entopts = Value::undef()) -> std::shared_ptr<MerchantPortalPamProductControllerEntity>`

Create a new `MerchantPortalPamProductControllerEntity` instance bound to this client.

#### `output_add_product(entopts = Value::undef()) -> std::shared_ptr<OutputAddProductEntity>`

Create a new `OutputAddProductEntity` instance bound to this client.

#### `output_create_product(entopts = Value::undef()) -> std::shared_ptr<OutputCreateProductEntity>`

Create a new `OutputCreateProductEntity` instance bound to this client.

#### `output_detail(entopts = Value::undef()) -> std::shared_ptr<OutputDetailEntity>`

Create a new `OutputDetailEntity` instance bound to this client.

#### `output_list(entopts = Value::undef()) -> std::shared_ptr<OutputListEntity>`

Create a new `OutputListEntity` instance bound to this client.

#### `output_message(entopts = Value::undef()) -> std::shared_ptr<OutputMessageEntity>`

Create a new `OutputMessageEntity` instance bound to this client.

#### `output_move_tid(entopts = Value::undef()) -> std::shared_ptr<OutputMoveTidEntity>`

Create a new `OutputMoveTidEntity` instance bound to this client.

#### `output_remove_product(entopts = Value::undef()) -> std::shared_ptr<OutputRemoveProductEntity>`

Create a new `OutputRemoveProductEntity` instance bound to this client.

#### `output_start(entopts = Value::undef()) -> std::shared_ptr<OutputStartEntity>`

Create a new `OutputStartEntity` instance bound to this client.

#### `output_status(entopts = Value::undef()) -> std::shared_ptr<OutputStatusEntity>`

Create a new `OutputStatusEntity` instance bound to this client.

#### `output_update_product(entopts = Value::undef()) -> std::shared_ptr<OutputUpdateProductEntity>`

Create a new `OutputUpdateProductEntity` instance bound to this client.

#### `optionsMap() -> Value`

Return a deep copy of the current SDK options.

#### `getUtility() -> UtilityPtr`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> Value`

Make a direct HTTP request to any API endpoint. Returns a result `Value` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never throws — branch on `getp(result, "ok")`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `std::string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `std::string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Value` | Path parameter values. |
| `fetchargs["query"]` | `Value` | Query string parameters. |
| `fetchargs["headers"]` | `Value` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Value` | Request body (maps are JSON-serialized). |

**Returns:** `Value` (result map)

#### `prepare(fetchargs) -> Value`

Prepare a fetch definition without sending. Returns the `fetchdef` and throws on error.


---

## MerchantPortalApiControllerEntity

```cpp
auto merchant_portal_api_controller = client->merchant_portal_api_controller();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `int64_t` | No |  |
| `additional_data` | `std::map<std::string, Value>` | No |  |
| `business_reg_number` | `std::string` | Yes |  |
| `city` | `std::string` | Yes |  |
| `corporateuuid` | `std::string` | No |  |
| `country` | `std::string` | Yes |  |
| `currency` | `std::string` | Yes |  |
| `merchant_category_code` | `int64_t` | Yes |  |
| `merchant_email` | `std::string` | No |  |
| `merchant_name` | `std::string` | Yes |  |
| `merchant_phone_number` | `std::string` | No |  |
| `packageid` | `std::string` | Yes |  |
| `packageorderuuid` | `std::string` | Yes |  |
| `password` | `std::string` | No |  |
| `productid` | `std::string` | No |  |
| `productid_acquirer` | `std::string` | No |  |
| `reason_deactivation` | `std::string` | Yes |  |
| `reason_reactivation` | `std::string` | Yes |  |
| `sorting_code` | `int64_t` | No |  |
| `state` | `std::string` | No |  |
| `street` | `std::string` | Yes |  |
| `terminal_country_code` | `std::string` | Yes |  |
| `terminal_language_code` | `std::string` | Yes |  |
| `terminal_location` | `std::string` | Yes |  |
| `terminal_serial_number` | `std::string` | Yes |  |
| `terminalid` | `int64_t` | Yes |  |
| `terminalid_acquirer` | `std::string` | No |  |
| `user_email` | `std::string` | No |  |
| `user_phone_number` | `std::string` | No |  |
| `username` | `std::string` | No |  |
| `vu_nummer` | `std::string` | Yes |  |
| `web_shop_url` | `std::string` | No |  |
| `zipcode` | `std::string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->merchant_portal_api_controller()->create(vmap({
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

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `MerchantPortalApiControllerEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## MerchantPortalCommonControllerEntity

```cpp
auto merchant_portal_common_controller = client->merchant_portal_common_controller();
```

### Operations

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->merchant_portal_common_controller()->load(Value::undef(), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `MerchantPortalCommonControllerEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## MerchantPortalPamContractControllerEntity

```cpp
auto merchant_portal_pam_contract_controller = client->merchant_portal_pam_contract_controller();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `std::string` | Yes |  |
| `product_order_uuid` | `std::string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->merchant_portal_pam_contract_controller()->create(vmap({
    {"language", Value("example_language")},  // std::string
    {"product_order_uuid", Value("example_product_order_uuid")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `MerchantPortalPamContractControllerEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## MerchantPortalPamDocumentControllerEntity

```cpp
auto merchant_portal_pam_document_controller = client->merchant_portal_pam_document_controller();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_field_desc_uuid` | `std::string` | Yes |  |
| `package_order_uuid` | `std::string` | No |  |
| `product_order_uuid` | `std::string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->merchant_portal_pam_document_controller()->create(vmap({
    {"app_form_field_desc_uuid", Value("example_app_form_field_desc_uuid")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `MerchantPortalPamDocumentControllerEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## MerchantPortalPamFormControllerEntity

```cpp
auto merchant_portal_pam_form_controller = client->merchant_portal_pam_form_controller();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_fields_desc_uuid` | `std::string` | Yes |  |
| `filter` | `std::map<std::string, Value>` | No |  |
| `language` | `std::string` | Yes |  |
| `package_order` | `std::map<std::string, Value>` | No |  |
| `package_order_uuid` | `std::string` | Yes |  |
| `package_uuid` | `std::string` | No |  |
| `product_order` | `std::vector<Value>` | No |  |
| `product_order_uuid` | `std::string` | No |  |
| `reason_of_reopening` | `std::string` | Yes |  |

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

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->merchant_portal_pam_form_controller()->create(vmap({
    {"app_form_fields_desc_uuid", Value("example_app_form_fields_desc_uuid")},  // std::string
    {"language", Value("example_language")},  // std::string
    {"package_order_uuid", Value("example_package_order_uuid")},  // std::string
    {"reason_of_reopening", Value("example_reason_of_reopening")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `MerchantPortalPamFormControllerEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## MerchantPortalPamMandatorControllerEntity

```cpp
auto merchant_portal_pam_mandator_controller = client->merchant_portal_pam_mandator_controller();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client_secret` | `std::string` | No |  |
| `mandator_name` | `std::string` | Yes |  |
| `notification_email` | `std::string` | No |  |
| `package_uuid` | `std::string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->merchant_portal_pam_mandator_controller()->create(vmap({
    {"mandator_name", Value("example_mandator_name")},  // std::string
    {"package_uuid", Value("example_package_uuid")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `MerchantPortalPamMandatorControllerEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## MerchantPortalPamMerchantControllerEntity

```cpp
auto merchant_portal_pam_merchant_controller = client->merchant_portal_pam_merchant_controller();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `std::map<std::string, Value>` | No |  |
| `business_registration_number` | `std::string` | Yes |  |
| `city` | `std::string` | No |  |
| `company_name` | `std::string` | Yes |  |
| `corporate_uuid` | `std::string` | Yes |  |
| `country` | `std::string` | No |  |
| `currency` | `std::string` | Yes |  |
| `email` | `std::string` | Yes |  |
| `language` | `std::string` | Yes |  |
| `login` | `std::string` | Yes |  |
| `mandator` | `std::string` | Yes |  |
| `merchant_category_code` | `std::string` | No |  |
| `merchant_contract_number` | `std::string` | Yes |  |
| `merchant_name` | `std::string` | No |  |
| `package_uuid` | `std::string` | No |  |
| `packageorderuuid` | `std::string` | Yes |  |
| `phone_number` | `std::string` | Yes |  |
| `postal_code` | `std::string` | No |  |
| `productid_acquirer` | `std::string` | Yes |  |
| `region` | `std::string` | No |  |
| `registration_number` | `std::string` | No |  |
| `signature` | `std::string` | No |  |
| `street` | `std::string` | No |  |
| `terminal_id` | `std::vector<Value>` | No |  |
| `terminalid_acquirer` | `std::string` | No |  |
| `vu_nummer` | `std::string` | Yes |  |

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

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->merchant_portal_pam_merchant_controller()->create(vmap({
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

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `MerchantPortalPamMerchantControllerEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## MerchantPortalPamPackageControllerEntity

```cpp
auto merchant_portal_pam_package_controller = client->merchant_portal_pam_package_controller();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `std::string` | No |  |
| `corporate_uuid` | `std::string` | No |  |
| `country` | `std::string` | No |  |
| `description_key` | `std::string` | No |  |
| `filter` | `std::map<std::string, Value>` | No |  |
| `language` | `std::string` | Yes |  |
| `name_key` | `std::string` | No |  |
| `package_status` | `std::string` | No |  |
| `package_uuid` | `std::string` | Yes |  |
| `pagination` | `std::map<std::string, Value>` | No |  |
| `sorting` | `std::map<std::string, Value>` | No |  |

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

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->merchant_portal_pam_package_controller()->create(vmap({
    {"language", Value("example_language")},  // std::string
    {"package_uuid", Value("example_package_uuid")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `MerchantPortalPamPackageControllerEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## MerchantPortalPamProductControllerEntity

```cpp
auto merchant_portal_pam_product_controller = client->merchant_portal_pam_product_controller();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `std::string` | No |  |
| `filter` | `std::map<std::string, Value>` | No |  |
| `language` | `std::string` | No |  |
| `merchant_id` | `std::string` | No |  |
| `package_order_uuid` | `std::string` | Yes |  |
| `pagination` | `std::map<std::string, Value>` | No |  |
| `product_order_uuid` | `std::string` | Yes |  |
| `product_uuid` | `std::string` | Yes |  |
| `reason_decline` | `std::string` | Yes |  |
| `sorting` | `std::map<std::string, Value>` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->merchant_portal_pam_product_controller()->create(vmap({
    {"package_order_uuid", Value("example_package_order_uuid")},  // std::string
    {"product_order_uuid", Value("example_product_order_uuid")},  // std::string
    {"product_uuid", Value("example_product_uuid")},  // std::string
    {"reason_decline", Value("example_reason_decline")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `MerchantPortalPamProductControllerEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## OutputAddProductEntity

```cpp
auto output_add_product = client->output_add_product();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `std::string` | Yes |  |
| `product_uui_d` | `std::vector<Value>` | Yes |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `std::string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->output_add_product()->create(vmap({
    {"package_uuid", Value("example_package_uuid")},  // std::string
    {"product_uui_d", vlist()},  // std::vector<Value>
    {"response_code", Value(1)},  // int64_t
    {"response_message", Value("example_response_message")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `OutputAddProductEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## OutputCreateProductEntity

```cpp
auto output_create_product = client->output_create_product();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acquirer_id` | `std::string` | No |  |
| `allow_multiple_order` | `bool` | Yes |  |
| `app_form_template_name` | `std::string` | Yes |  |
| `contract_needed` | `bool` | Yes |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `std::string` | Yes |  |
| `name_key` | `std::string` | Yes |  |
| `prescreening_allowed` | `bool` | Yes |  |
| `product_name` | `std::string` | Yes |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `std::string` | Yes |  |
| `terminal_template_name` | `std::string` | Yes |  |
| `vendor_name` | `std::string` | Yes |  |
| `xml_template_file` | `std::string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->output_create_product()->create(vmap({
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

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `OutputCreateProductEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## OutputDetailEntity

```cpp
auto output_detail = client->output_detail();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `detail` | `std::map<std::string, Value>` | No |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `std::string` | Yes |  |

### Operations

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->output_detail()->load(vmap({{"id", Value("output_detail_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `OutputDetailEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## OutputListEntity

```cpp
auto output_list = client->output_list();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `item` | `std::vector<Value>` | No |  |
| `pagination` | `std::map<std::string, Value>` | Yes |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `std::string` | Yes |  |
| `sorting` | `std::map<std::string, Value>` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->output_list()->create(vmap({
    {"pagination", vmap()},  // std::map<std::string, Value>
    {"response_code", Value(1)},  // int64_t
    {"response_message", Value("example_response_message")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `OutputListEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## OutputMessageEntity

```cpp
auto output_message = client->output_message();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `std::string` | Yes |  |

### Operations

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->output_message()->load(vmap({{"id", Value("output_message_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `OutputMessageEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## OutputMoveTidEntity

```cpp
auto output_move_tid = client->output_move_tid();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `product_order_uui_d` | `std::vector<Value>` | Yes |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `std::string` | Yes |  |
| `target_package_order_uuid` | `std::string` | Yes |  |
| `target_product_order_uuid` | `std::string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->output_move_tid()->create(vmap({
    {"product_order_uui_d", vlist()},  // std::vector<Value>
    {"response_code", Value(1)},  // int64_t
    {"response_message", Value("example_response_message")},  // std::string
    {"target_package_order_uuid", Value("example_target_package_order_uuid")},  // std::string
    {"target_product_order_uuid", Value("example_target_product_order_uuid")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `OutputMoveTidEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## OutputRemoveProductEntity

```cpp
auto output_remove_product = client->output_remove_product();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `std::string` | Yes |  |
| `product_uui_d` | `std::vector<Value>` | Yes |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `std::string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->output_remove_product()->create(vmap({
    {"package_uuid", Value("example_package_uuid")},  // std::string
    {"product_uui_d", vlist()},  // std::vector<Value>
    {"response_code", Value(1)},  // int64_t
    {"response_message", Value("example_response_message")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `OutputRemoveProductEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## OutputStartEntity

```cpp
auto output_start = client->output_start();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `std::string` | No |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `std::string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->output_start()->create(vmap({
    {"response_code", Value(1)},  // int64_t
    {"response_message", Value("example_response_message")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `OutputStartEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## OutputStatusEntity

```cpp
auto output_status = client->output_status();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `int64_t` | No |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `std::string` | Yes |  |
| `status` | `std::string` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->output_status()->load(vmap({{"id", Value("output_status_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `OutputStatusEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## OutputUpdateProductEntity

```cpp
auto output_update_product = client->output_update_product();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `allow_multiple_order` | `bool` | No |  |
| `app_form_name` | `std::string` | No |  |
| `contract_needed` | `bool` | No |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `std::string` | No |  |
| `name_key` | `std::string` | No |  |
| `prescreening_allowed` | `bool` | No |  |
| `product_name` | `std::string` | No |  |
| `product_status` | `std::string` | No |  |
| `product_uuid` | `std::string` | Yes |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `std::string` | Yes |  |
| `vendor_name` | `std::string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->output_update_product()->create(vmap({
    {"product_uuid", Value("example_product_uuid")},  // std::string
    {"response_code", Value(1)},  // int64_t
    {"response_message", Value("example_response_message")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `OutputUpdateProductEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```cpp
auto client = std::make_shared<BluefinTecsMerchantPortalSDK>(vmap({
    {"feature", vmap({
        {"test", vmap({{"active", Value(true)}})},
    })},
}));
```

