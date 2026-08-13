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
| `productOrderUUID` | `std::string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->merchant_portal_pam_contract_controller()->create(vmap({
    {"language", Value("example_language")},  // std::string
    {"productOrderUUID", Value("example_productOrderUUID")},  // std::string
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
| `appFormFieldDescUUID` | `std::string` | Yes |  |
| `packageOrderUUID` | `std::string` | No |  |
| `productOrderUUID` | `std::string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->merchant_portal_pam_document_controller()->create(vmap({
    {"appFormFieldDescUUID", Value("example_appFormFieldDescUUID")},  // std::string
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
| `appFormFieldsDescUUID` | `std::string` | Yes |  |
| `filter` | `std::map<std::string, Value>` | No |  |
| `language` | `std::string` | Yes |  |
| `packageOrder` | `std::map<std::string, Value>` | No |  |
| `packageOrderUUID` | `std::string` | Yes |  |
| `packageUUID` | `std::string` | No |  |
| `productOrderUUID` | `std::string` | No |  |
| `productOrders` | `std::vector<Value>` | No |  |
| `reasonOfReopening` | `std::string` | Yes |  |

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

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->merchant_portal_pam_form_controller()->create(vmap({
    {"appFormFieldsDescUUID", Value("example_appFormFieldsDescUUID")},  // std::string
    {"language", Value("example_language")},  // std::string
    {"packageOrderUUID", Value("example_packageOrderUUID")},  // std::string
    {"reasonOfReopening", Value("example_reasonOfReopening")},  // std::string
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
| `clientSecret` | `std::string` | No |  |
| `mandatorName` | `std::string` | Yes |  |
| `notificationEmail` | `std::string` | No |  |
| `packageUUID` | `std::string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->merchant_portal_pam_mandator_controller()->create(vmap({
    {"mandatorName", Value("example_mandatorName")},  // std::string
    {"packageUUID", Value("example_packageUUID")},  // std::string
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
| `businessRegistrationNumber` | `std::string` | Yes |  |
| `city` | `std::string` | No |  |
| `companyName` | `std::string` | Yes |  |
| `corporateUUID` | `std::string` | Yes |  |
| `country` | `std::string` | No |  |
| `currency` | `std::string` | Yes |  |
| `email` | `std::string` | Yes |  |
| `language` | `std::string` | Yes |  |
| `login` | `std::string` | Yes |  |
| `mandator` | `std::string` | Yes |  |
| `merchantContractNumber` | `std::string` | Yes |  |
| `merchantName` | `std::string` | No |  |
| `merchant_category_code` | `std::string` | No |  |
| `packageUUID` | `std::string` | No |  |
| `packageorderuuid` | `std::string` | Yes |  |
| `phoneNumber` | `std::string` | Yes |  |
| `postalCode` | `std::string` | No |  |
| `productid_acquirer` | `std::string` | Yes |  |
| `region` | `std::string` | No |  |
| `registrationNumber` | `std::string` | No |  |
| `signature` | `std::string` | No |  |
| `street` | `std::string` | No |  |
| `terminalIds` | `std::vector<Value>` | No |  |
| `terminalid_acquirer` | `std::string` | No |  |
| `vu_nummer` | `std::string` | Yes |  |

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

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->merchant_portal_pam_merchant_controller()->create(vmap({
    {"businessRegistrationNumber", Value("example_businessRegistrationNumber")},  // std::string
    {"companyName", Value("example_companyName")},  // std::string
    {"corporateUUID", Value("example_corporateUUID")},  // std::string
    {"currency", Value("example_currency")},  // std::string
    {"email", Value("example_email")},  // std::string
    {"language", Value("example_language")},  // std::string
    {"login", Value("example_login")},  // std::string
    {"mandator", Value("example_mandator")},  // std::string
    {"merchantContractNumber", Value("example_merchantContractNumber")},  // std::string
    {"packageorderuuid", Value("example_packageorderuuid")},  // std::string
    {"phoneNumber", Value("example_phoneNumber")},  // std::string
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
| `consumerUUID` | `std::string` | No |  |
| `corporateUUID` | `std::string` | No |  |
| `country` | `std::string` | No |  |
| `descriptionKey` | `std::string` | No |  |
| `filter` | `std::map<std::string, Value>` | No |  |
| `language` | `std::string` | Yes |  |
| `nameKey` | `std::string` | No |  |
| `packageStatus` | `std::string` | No |  |
| `packageUUID` | `std::string` | Yes |  |
| `pagination` | `std::map<std::string, Value>` | No |  |
| `sorting` | `std::map<std::string, Value>` | No |  |

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

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->merchant_portal_pam_package_controller()->create(vmap({
    {"language", Value("example_language")},  // std::string
    {"packageUUID", Value("example_packageUUID")},  // std::string
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
| `consumerUUID` | `std::string` | No |  |
| `filter` | `std::map<std::string, Value>` | No |  |
| `language` | `std::string` | No |  |
| `merchantID` | `std::string` | No |  |
| `packageOrderUUID` | `std::string` | Yes |  |
| `pagination` | `std::map<std::string, Value>` | No |  |
| `productOrderUUID` | `std::string` | Yes |  |
| `productUUID` | `std::string` | Yes |  |
| `reason_decline` | `std::string` | Yes |  |
| `sorting` | `std::map<std::string, Value>` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->merchant_portal_pam_product_controller()->create(vmap({
    {"packageOrderUUID", Value("example_packageOrderUUID")},  // std::string
    {"productOrderUUID", Value("example_productOrderUUID")},  // std::string
    {"productUUID", Value("example_productUUID")},  // std::string
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
| `packageUUID` | `std::string` | Yes |  |
| `productUUIDs` | `std::vector<Value>` | Yes |  |
| `responseCode` | `int64_t` | Yes |  |
| `responseMessage` | `std::string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->output_add_product()->create(vmap({
    {"packageUUID", Value("example_packageUUID")},  // std::string
    {"productUUIDs", vlist()},  // std::vector<Value>
    {"responseCode", Value(1)},  // int64_t
    {"responseMessage", Value("example_responseMessage")},  // std::string
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
| `acquirerId` | `std::string` | No |  |
| `allowMultipleOrders` | `bool` | Yes |  |
| `appFormTemplateName` | `std::string` | Yes |  |
| `contractNeeded` | `bool` | Yes |  |
| `credentialsNeeded` | `bool` | No |  |
| `descriptionKey` | `std::string` | Yes |  |
| `nameKey` | `std::string` | Yes |  |
| `prescreeningAllowed` | `bool` | Yes |  |
| `productName` | `std::string` | Yes |  |
| `responseCode` | `int64_t` | Yes |  |
| `responseMessage` | `std::string` | Yes |  |
| `terminalTemplateName` | `std::string` | Yes |  |
| `vendorName` | `std::string` | Yes |  |
| `xmlTemplateFile` | `std::string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->output_create_product()->create(vmap({
    {"allowMultipleOrders", Value(true)},  // bool
    {"appFormTemplateName", Value("example_appFormTemplateName")},  // std::string
    {"contractNeeded", Value(true)},  // bool
    {"descriptionKey", Value("example_descriptionKey")},  // std::string
    {"nameKey", Value("example_nameKey")},  // std::string
    {"prescreeningAllowed", Value(true)},  // bool
    {"productName", Value("example_productName")},  // std::string
    {"responseCode", Value(1)},  // int64_t
    {"responseMessage", Value("example_responseMessage")},  // std::string
    {"terminalTemplateName", Value("example_terminalTemplateName")},  // std::string
    {"vendorName", Value("example_vendorName")},  // std::string
    {"xmlTemplateFile", Value("example_xmlTemplateFile")},  // std::string
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
| `batch` | `std::map<std::string, Value>` | No |  |
| `lines` | `std::map<std::string, Value>` | No |  |
| `progress` | `std::map<std::string, Value>` | No |  |

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
| `items` | `std::vector<Value>` | No |  |
| `pagination` | `std::map<std::string, Value>` | Yes |  |
| `responseCode` | `int64_t` | Yes |  |
| `responseMessage` | `std::string` | Yes |  |
| `sorting` | `std::map<std::string, Value>` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `items` | - |
| `pagination` | Yes |
| `responseCode` | - |
| `responseMessage` | - |
| `sorting` | - |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->output_list()->create(vmap({
    {"pagination", vmap()},  // std::map<std::string, Value>
    {"responseCode", Value(1)},  // int64_t
    {"responseMessage", Value("example_responseMessage")},  // std::string
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
| `responseCode` | `int64_t` | Yes |  |
| `responseMessage` | `std::string` | Yes |  |

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
| `productOrderUUIDs` | `std::vector<Value>` | Yes |  |
| `responseCode` | `int64_t` | Yes |  |
| `responseMessage` | `std::string` | Yes |  |
| `targetPackageOrderUUID` | `std::string` | Yes |  |
| `targetProductOrderUUID` | `std::string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->output_move_tid()->create(vmap({
    {"productOrderUUIDs", vlist()},  // std::vector<Value>
    {"responseCode", Value(1)},  // int64_t
    {"responseMessage", Value("example_responseMessage")},  // std::string
    {"targetPackageOrderUUID", Value("example_targetPackageOrderUUID")},  // std::string
    {"targetProductOrderUUID", Value("example_targetProductOrderUUID")},  // std::string
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
| `packageUUID` | `std::string` | Yes |  |
| `productUUIDs` | `std::vector<Value>` | Yes |  |
| `responseCode` | `int64_t` | Yes |  |
| `responseMessage` | `std::string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->output_remove_product()->create(vmap({
    {"packageUUID", Value("example_packageUUID")},  // std::string
    {"productUUIDs", vlist()},  // std::vector<Value>
    {"responseCode", Value(1)},  // int64_t
    {"responseMessage", Value("example_responseMessage")},  // std::string
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
| `responseCode` | `int64_t` | Yes |  |
| `responseMessage` | `std::string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->output_start()->create(vmap({
    {"responseCode", Value(1)},  // int64_t
    {"responseMessage", Value("example_responseMessage")},  // std::string
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
| `responseCode` | `int64_t` | Yes |  |
| `responseMessage` | `std::string` | Yes |  |
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
| `allowMultipleOrders` | `bool` | No |  |
| `appFormName` | `std::string` | No |  |
| `contractNeeded` | `bool` | No |  |
| `credentialsNeeded` | `bool` | No |  |
| `descriptionKey` | `std::string` | No |  |
| `nameKey` | `std::string` | No |  |
| `prescreeningAllowed` | `bool` | No |  |
| `productName` | `std::string` | No |  |
| `productStatus` | `std::string` | No |  |
| `productUUID` | `std::string` | Yes |  |
| `responseCode` | `int64_t` | Yes |  |
| `responseMessage` | `std::string` | Yes |  |
| `vendorName` | `std::string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->output_update_product()->create(vmap({
    {"productUUID", Value("example_productUUID")},  // std::string
    {"responseCode", Value(1)},  // int64_t
    {"responseMessage", Value("example_responseMessage")},  // std::string
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

