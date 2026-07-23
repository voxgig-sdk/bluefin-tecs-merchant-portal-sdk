# BluefinTecsMerchantPortal Swift SDK Reference

Complete API reference for the BluefinTecsMerchantPortal Swift SDK.


## BluefinTecsMerchantPortalSDK

### Constructor

```swift
let client = BluefinTecsMerchantPortalSDK(options)
```

Create a new SDK client instance. `options` is a `VMap` of `Value`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `VMap` | SDK configuration options. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `VMap` | Custom headers for all requests. |
| `options["feature"]` | `VMap` | Feature configuration. |
| `options["system"]` | `VMap` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinTecsMerchantPortalSDK.testSDK(testopts, sdkopts)`

Create a test client with mock features active. Both arguments may be `nil`.

```swift
let client = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
```


### Instance Methods

#### `MerchantPortalApiController(entopts)`

Create a new `MerchantPortalApiController` entity instance. Pass `nil` for no initial
options.

#### `MerchantPortalCommonController(entopts)`

Create a new `MerchantPortalCommonController` entity instance. Pass `nil` for no initial
options.

#### `MerchantPortalPamContractController(entopts)`

Create a new `MerchantPortalPamContractController` entity instance. Pass `nil` for no initial
options.

#### `MerchantPortalPamDocumentController(entopts)`

Create a new `MerchantPortalPamDocumentController` entity instance. Pass `nil` for no initial
options.

#### `MerchantPortalPamFormController(entopts)`

Create a new `MerchantPortalPamFormController` entity instance. Pass `nil` for no initial
options.

#### `MerchantPortalPamMandatorController(entopts)`

Create a new `MerchantPortalPamMandatorController` entity instance. Pass `nil` for no initial
options.

#### `MerchantPortalPamMerchantController(entopts)`

Create a new `MerchantPortalPamMerchantController` entity instance. Pass `nil` for no initial
options.

#### `MerchantPortalPamPackageController(entopts)`

Create a new `MerchantPortalPamPackageController` entity instance. Pass `nil` for no initial
options.

#### `MerchantPortalPamProductController(entopts)`

Create a new `MerchantPortalPamProductController` entity instance. Pass `nil` for no initial
options.

#### `OutputAddProduct(entopts)`

Create a new `OutputAddProduct` entity instance. Pass `nil` for no initial
options.

#### `OutputCreateProduct(entopts)`

Create a new `OutputCreateProduct` entity instance. Pass `nil` for no initial
options.

#### `OutputDetail(entopts)`

Create a new `OutputDetail` entity instance. Pass `nil` for no initial
options.

#### `OutputList(entopts)`

Create a new `OutputList` entity instance. Pass `nil` for no initial
options.

#### `OutputMessage(entopts)`

Create a new `OutputMessage` entity instance. Pass `nil` for no initial
options.

#### `OutputMoveTid(entopts)`

Create a new `OutputMoveTid` entity instance. Pass `nil` for no initial
options.

#### `OutputRemoveProduct(entopts)`

Create a new `OutputRemoveProduct` entity instance. Pass `nil` for no initial
options.

#### `OutputStart(entopts)`

Create a new `OutputStart` entity instance. Pass `nil` for no initial
options.

#### `OutputStatus(entopts)`

Create a new `OutputStatus` entity instance. Pass `nil` for no initial
options.

#### `OutputUpdateProduct(entopts)`

Create a new `OutputUpdateProduct` entity instance. Pass `nil` for no initial
options.

#### `optionsMap() -> VMap`

Return a deep copy of the current SDK options.

#### `getUtility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> VMap`

Make a direct HTTP request to any API endpoint. Returns a result `VMap`
with `ok`, `status`, `headers`, and `data` (or `err` on failure).
This escape hatch never throws — branch on `result.entries["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `VMap` | Path parameter values. |
| `fetchargs["query"]` | `VMap` | Query string parameters. |
| `fetchargs["headers"]` | `VMap` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Value` | Request body (maps are JSON-serialized). |

**Returns:** `VMap`

#### `prepare(fetchargs) throws -> VMap`

Prepare a fetch definition without sending. Returns the `fetchdef` and throws on error.


---

## MerchantPortalApiController

```swift
let merchantPortalApiController = client.MerchantPortalApiController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `Int` | No |  |
| `additional_data` | `VMap` | No |  |
| `business_reg_number` | `String` | Yes |  |
| `city` | `String` | Yes |  |
| `corporateuuid` | `String` | No |  |
| `country` | `String` | Yes |  |
| `currency` | `String` | Yes |  |
| `merchant_category_code` | `Int` | Yes |  |
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
| `sorting_code` | `Int` | No |  |
| `state` | `String` | No |  |
| `street` | `String` | Yes |  |
| `terminal_country_code` | `String` | Yes |  |
| `terminal_language_code` | `String` | Yes |  |
| `terminal_location` | `String` | Yes |  |
| `terminal_serial_number` | `String` | Yes |  |
| `terminalid` | `Int` | Yes |  |
| `terminalid_acquirer` | `String` | No |  |
| `user_email` | `String` | No |  |
| `user_phone_number` | `String` | No |  |
| `username` | `String` | No |  |
| `vu_nummer` | `String` | Yes |  |
| `web_shop_url` | `String` | No |  |
| `zipcode` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.MerchantPortalApiController().create(VMap([
    ("business_reg_number", .string("example_business_reg_number")),  // String
    ("city", .string("example_city")),  // String
    ("country", .string("example_country")),  // String
    ("currency", .string("example_currency")),  // String
    ("merchant_category_code", .int(1)),  // Int
    ("merchant_name", .string("example_merchant_name")),  // String
    ("packageid", .string("example_packageid")),  // String
    ("packageorderuuid", .string("example_packageorderuuid")),  // String
    ("reason_deactivation", .string("example_reason_deactivation")),  // String
    ("reason_reactivation", .string("example_reason_reactivation")),  // String
    ("street", .string("example_street")),  // String
    ("terminal_country_code", .string("example_terminal_country_code")),  // String
    ("terminal_language_code", .string("example_terminal_language_code")),  // String
    ("terminal_location", .string("example_terminal_location")),  // String
    ("terminal_serial_number", .string("example_terminal_serial_number")),  // String
    ("terminalid", .int(1)),  // Int
    ("vu_nummer", .string("example_vu_nummer")),  // String
    ("zipcode", .string("example_zipcode"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalApiController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## MerchantPortalCommonController

```swift
let merchantPortalCommonController = client.MerchantPortalCommonController()
```

### Operations

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.MerchantPortalCommonController().load(nil, nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalCommonController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## MerchantPortalPamContractController

```swift
let merchantPortalPamContractController = client.MerchantPortalPamContractController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `String` | Yes |  |
| `product_order_uuid` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.MerchantPortalPamContractController().create(VMap([
    ("language", .string("example_language")),  // String
    ("product_order_uuid", .string("example_product_order_uuid"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamContractController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## MerchantPortalPamDocumentController

```swift
let merchantPortalPamDocumentController = client.MerchantPortalPamDocumentController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_field_desc_uuid` | `String` | Yes |  |
| `package_order_uuid` | `String` | No |  |
| `product_order_uuid` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.MerchantPortalPamDocumentController().create(VMap([
    ("app_form_field_desc_uuid", .string("example_app_form_field_desc_uuid"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamDocumentController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## MerchantPortalPamFormController

```swift
let merchantPortalPamFormController = client.MerchantPortalPamFormController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_fields_desc_uuid` | `String` | Yes |  |
| `filter` | `VMap` | No |  |
| `language` | `String` | Yes |  |
| `package_order` | `VMap` | No |  |
| `package_order_uuid` | `String` | Yes |  |
| `package_uuid` | `String` | No |  |
| `product_order` | `[Value]` | No |  |
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

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.MerchantPortalPamFormController().create(VMap([
    ("app_form_fields_desc_uuid", .string("example_app_form_fields_desc_uuid")),  // String
    ("language", .string("example_language")),  // String
    ("package_order_uuid", .string("example_package_order_uuid")),  // String
    ("reason_of_reopening", .string("example_reason_of_reopening"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamFormController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## MerchantPortalPamMandatorController

```swift
let merchantPortalPamMandatorController = client.MerchantPortalPamMandatorController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client_secret` | `String` | No |  |
| `mandator_name` | `String` | Yes |  |
| `notification_email` | `String` | No |  |
| `package_uuid` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.MerchantPortalPamMandatorController().create(VMap([
    ("mandator_name", .string("example_mandator_name")),  // String
    ("package_uuid", .string("example_package_uuid"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamMandatorController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## MerchantPortalPamMerchantController

```swift
let merchantPortalPamMerchantController = client.MerchantPortalPamMerchantController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `VMap` | No |  |
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
| `terminal_id` | `[Value]` | No |  |
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

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.MerchantPortalPamMerchantController().create(VMap([
    ("business_registration_number", .string("example_business_registration_number")),  // String
    ("company_name", .string("example_company_name")),  // String
    ("corporate_uuid", .string("example_corporate_uuid")),  // String
    ("currency", .string("example_currency")),  // String
    ("email", .string("example_email")),  // String
    ("language", .string("example_language")),  // String
    ("login", .string("example_login")),  // String
    ("mandator", .string("example_mandator")),  // String
    ("merchant_contract_number", .string("example_merchant_contract_number")),  // String
    ("packageorderuuid", .string("example_packageorderuuid")),  // String
    ("phone_number", .string("example_phone_number")),  // String
    ("productid_acquirer", .string("example_productid_acquirer")),  // String
    ("vu_nummer", .string("example_vu_nummer"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamMerchantController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## MerchantPortalPamPackageController

```swift
let merchantPortalPamPackageController = client.MerchantPortalPamPackageController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `String` | No |  |
| `corporate_uuid` | `String` | No |  |
| `country` | `String` | No |  |
| `description_key` | `String` | No |  |
| `filter` | `VMap` | No |  |
| `language` | `String` | Yes |  |
| `name_key` | `String` | No |  |
| `package_status` | `String` | No |  |
| `package_uuid` | `String` | Yes |  |
| `pagination` | `VMap` | No |  |
| `sorting` | `VMap` | No |  |

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

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.MerchantPortalPamPackageController().create(VMap([
    ("language", .string("example_language")),  // String
    ("package_uuid", .string("example_package_uuid"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamPackageController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## MerchantPortalPamProductController

```swift
let merchantPortalPamProductController = client.MerchantPortalPamProductController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `String` | No |  |
| `filter` | `VMap` | No |  |
| `language` | `String` | No |  |
| `merchant_id` | `String` | No |  |
| `package_order_uuid` | `String` | Yes |  |
| `pagination` | `VMap` | No |  |
| `product_order_uuid` | `String` | Yes |  |
| `product_uuid` | `String` | Yes |  |
| `reason_decline` | `String` | Yes |  |
| `sorting` | `VMap` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.MerchantPortalPamProductController().create(VMap([
    ("package_order_uuid", .string("example_package_order_uuid")),  // String
    ("product_order_uuid", .string("example_product_order_uuid")),  // String
    ("product_uuid", .string("example_product_uuid")),  // String
    ("reason_decline", .string("example_reason_decline"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamProductController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputAddProduct

```swift
let outputAddProduct = client.OutputAddProduct()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `String` | Yes |  |
| `product_uui_d` | `[Value]` | Yes |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.OutputAddProduct().create(VMap([
    ("package_uuid", .string("example_package_uuid")),  // String
    ("product_uui_d", .list([])),  // [Value]
    ("response_code", .int(1)),  // Int
    ("response_message", .string("example_response_message"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputAddProduct` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputCreateProduct

```swift
let outputCreateProduct = client.OutputCreateProduct()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acquirer_id` | `String` | No |  |
| `allow_multiple_order` | `Bool` | Yes |  |
| `app_form_template_name` | `String` | Yes |  |
| `contract_needed` | `Bool` | Yes |  |
| `credentials_needed` | `Bool` | No |  |
| `description_key` | `String` | Yes |  |
| `name_key` | `String` | Yes |  |
| `prescreening_allowed` | `Bool` | Yes |  |
| `product_name` | `String` | Yes |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |
| `terminal_template_name` | `String` | Yes |  |
| `vendor_name` | `String` | Yes |  |
| `xml_template_file` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.OutputCreateProduct().create(VMap([
    ("allow_multiple_order", .bool(true)),  // Bool
    ("app_form_template_name", .string("example_app_form_template_name")),  // String
    ("contract_needed", .bool(true)),  // Bool
    ("description_key", .string("example_description_key")),  // String
    ("name_key", .string("example_name_key")),  // String
    ("prescreening_allowed", .bool(true)),  // Bool
    ("product_name", .string("example_product_name")),  // String
    ("response_code", .int(1)),  // Int
    ("response_message", .string("example_response_message")),  // String
    ("terminal_template_name", .string("example_terminal_template_name")),  // String
    ("vendor_name", .string("example_vendor_name")),  // String
    ("xml_template_file", .string("example_xml_template_file"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputCreateProduct` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputDetail

```swift
let outputDetail = client.OutputDetail()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `detail` | `VMap` | No |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.OutputDetail().load(VMap([("id", .string("output_detail_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputDetail` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputList

```swift
let outputList = client.OutputList()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `item` | `[Value]` | No |  |
| `pagination` | `VMap` | Yes |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |
| `sorting` | `VMap` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.OutputList().create(VMap([
    ("pagination", .map(VMap())),  // VMap
    ("response_code", .int(1)),  // Int
    ("response_message", .string("example_response_message"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputList` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputMessage

```swift
let outputMessage = client.OutputMessage()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.OutputMessage().load(VMap([("id", .string("output_message_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputMessage` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputMoveTid

```swift
let outputMoveTid = client.OutputMoveTid()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `product_order_uui_d` | `[Value]` | Yes |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |
| `target_package_order_uuid` | `String` | Yes |  |
| `target_product_order_uuid` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.OutputMoveTid().create(VMap([
    ("product_order_uui_d", .list([])),  // [Value]
    ("response_code", .int(1)),  // Int
    ("response_message", .string("example_response_message")),  // String
    ("target_package_order_uuid", .string("example_target_package_order_uuid")),  // String
    ("target_product_order_uuid", .string("example_target_product_order_uuid"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputMoveTid` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputRemoveProduct

```swift
let outputRemoveProduct = client.OutputRemoveProduct()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `String` | Yes |  |
| `product_uui_d` | `[Value]` | Yes |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.OutputRemoveProduct().create(VMap([
    ("package_uuid", .string("example_package_uuid")),  // String
    ("product_uui_d", .list([])),  // [Value]
    ("response_code", .int(1)),  // Int
    ("response_message", .string("example_response_message"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputRemoveProduct` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputStart

```swift
let outputStart = client.OutputStart()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `String` | No |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.OutputStart().create(VMap([
    ("response_code", .int(1)),  // Int
    ("response_message", .string("example_response_message"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputStart` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputStatus

```swift
let outputStatus = client.OutputStatus()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `Int` | No |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |
| `status` | `String` | No |  |

### Operations

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.OutputStatus().load(VMap([("id", .string("output_status_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputStatus` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputUpdateProduct

```swift
let outputUpdateProduct = client.OutputUpdateProduct()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `allow_multiple_order` | `Bool` | No |  |
| `app_form_name` | `String` | No |  |
| `contract_needed` | `Bool` | No |  |
| `credentials_needed` | `Bool` | No |  |
| `description_key` | `String` | No |  |
| `name_key` | `String` | No |  |
| `prescreening_allowed` | `Bool` | No |  |
| `product_name` | `String` | No |  |
| `product_status` | `String` | No |  |
| `product_uuid` | `String` | Yes |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |
| `vendor_name` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.OutputUpdateProduct().create(VMap([
    ("product_uuid", .string("example_product_uuid")),  // String
    ("response_code", .int(1)),  // Int
    ("response_message", .string("example_response_message"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputUpdateProduct` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```swift
let feature = VMap()
feature.entries["test"] = .map([("active", .bool(true))])
let options = VMap()
options.entries["feature"] = .map(feature)
let client = BluefinTecsMerchantPortalSDK(options)
```

