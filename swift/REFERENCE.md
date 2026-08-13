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
| `productOrderUUID` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.MerchantPortalPamContractController().create(VMap([
    ("language", .string("example_language")),  // String
    ("productOrderUUID", .string("example_productOrderUUID"))  // String
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
| `appFormFieldDescUUID` | `String` | Yes |  |
| `packageOrderUUID` | `String` | No |  |
| `productOrderUUID` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.MerchantPortalPamDocumentController().create(VMap([
    ("appFormFieldDescUUID", .string("example_appFormFieldDescUUID"))  // String
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
| `appFormFieldsDescUUID` | `String` | Yes |  |
| `filter` | `VMap` | No |  |
| `language` | `String` | Yes |  |
| `packageOrder` | `VMap` | No |  |
| `packageOrderUUID` | `String` | Yes |  |
| `packageUUID` | `String` | No |  |
| `productOrderUUID` | `String` | No |  |
| `productOrders` | `[Value]` | No |  |
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

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.MerchantPortalPamFormController().create(VMap([
    ("appFormFieldsDescUUID", .string("example_appFormFieldsDescUUID")),  // String
    ("language", .string("example_language")),  // String
    ("packageOrderUUID", .string("example_packageOrderUUID")),  // String
    ("reasonOfReopening", .string("example_reasonOfReopening"))  // String
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
| `clientSecret` | `String` | No |  |
| `mandatorName` | `String` | Yes |  |
| `notificationEmail` | `String` | No |  |
| `packageUUID` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.MerchantPortalPamMandatorController().create(VMap([
    ("mandatorName", .string("example_mandatorName")),  // String
    ("packageUUID", .string("example_packageUUID"))  // String
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
| `businessRegistrationNumber` | `String` | Yes |  |
| `city` | `String` | No |  |
| `companyName` | `String` | Yes |  |
| `corporateUUID` | `String` | Yes |  |
| `country` | `String` | No |  |
| `currency` | `String` | Yes |  |
| `email` | `String` | Yes |  |
| `language` | `String` | Yes |  |
| `login` | `String` | Yes |  |
| `mandator` | `String` | Yes |  |
| `merchantContractNumber` | `String` | Yes |  |
| `merchantName` | `String` | No |  |
| `merchant_category_code` | `String` | No |  |
| `packageUUID` | `String` | No |  |
| `packageorderuuid` | `String` | Yes |  |
| `phoneNumber` | `String` | Yes |  |
| `postalCode` | `String` | No |  |
| `productid_acquirer` | `String` | Yes |  |
| `region` | `String` | No |  |
| `registrationNumber` | `String` | No |  |
| `signature` | `String` | No |  |
| `street` | `String` | No |  |
| `terminalIds` | `[Value]` | No |  |
| `terminalid_acquirer` | `String` | No |  |
| `vu_nummer` | `String` | Yes |  |

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

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.MerchantPortalPamMerchantController().create(VMap([
    ("businessRegistrationNumber", .string("example_businessRegistrationNumber")),  // String
    ("companyName", .string("example_companyName")),  // String
    ("corporateUUID", .string("example_corporateUUID")),  // String
    ("currency", .string("example_currency")),  // String
    ("email", .string("example_email")),  // String
    ("language", .string("example_language")),  // String
    ("login", .string("example_login")),  // String
    ("mandator", .string("example_mandator")),  // String
    ("merchantContractNumber", .string("example_merchantContractNumber")),  // String
    ("packageorderuuid", .string("example_packageorderuuid")),  // String
    ("phoneNumber", .string("example_phoneNumber")),  // String
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
| `consumerUUID` | `String` | No |  |
| `corporateUUID` | `String` | No |  |
| `country` | `String` | No |  |
| `descriptionKey` | `String` | No |  |
| `filter` | `VMap` | No |  |
| `language` | `String` | Yes |  |
| `nameKey` | `String` | No |  |
| `packageStatus` | `String` | No |  |
| `packageUUID` | `String` | Yes |  |
| `pagination` | `VMap` | No |  |
| `sorting` | `VMap` | No |  |

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

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.MerchantPortalPamPackageController().create(VMap([
    ("language", .string("example_language")),  // String
    ("packageUUID", .string("example_packageUUID"))  // String
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
| `consumerUUID` | `String` | No |  |
| `filter` | `VMap` | No |  |
| `language` | `String` | No |  |
| `merchantID` | `String` | No |  |
| `packageOrderUUID` | `String` | Yes |  |
| `pagination` | `VMap` | No |  |
| `productOrderUUID` | `String` | Yes |  |
| `productUUID` | `String` | Yes |  |
| `reason_decline` | `String` | Yes |  |
| `sorting` | `VMap` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.MerchantPortalPamProductController().create(VMap([
    ("packageOrderUUID", .string("example_packageOrderUUID")),  // String
    ("productOrderUUID", .string("example_productOrderUUID")),  // String
    ("productUUID", .string("example_productUUID")),  // String
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
| `packageUUID` | `String` | Yes |  |
| `productUUIDs` | `[Value]` | Yes |  |
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.OutputAddProduct().create(VMap([
    ("packageUUID", .string("example_packageUUID")),  // String
    ("productUUIDs", .list([])),  // [Value]
    ("responseCode", .int(1)),  // Int
    ("responseMessage", .string("example_responseMessage"))  // String
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
| `acquirerId` | `String` | No |  |
| `allowMultipleOrders` | `Bool` | Yes |  |
| `appFormTemplateName` | `String` | Yes |  |
| `contractNeeded` | `Bool` | Yes |  |
| `credentialsNeeded` | `Bool` | No |  |
| `descriptionKey` | `String` | Yes |  |
| `nameKey` | `String` | Yes |  |
| `prescreeningAllowed` | `Bool` | Yes |  |
| `productName` | `String` | Yes |  |
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |
| `terminalTemplateName` | `String` | Yes |  |
| `vendorName` | `String` | Yes |  |
| `xmlTemplateFile` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.OutputCreateProduct().create(VMap([
    ("allowMultipleOrders", .bool(true)),  // Bool
    ("appFormTemplateName", .string("example_appFormTemplateName")),  // String
    ("contractNeeded", .bool(true)),  // Bool
    ("descriptionKey", .string("example_descriptionKey")),  // String
    ("nameKey", .string("example_nameKey")),  // String
    ("prescreeningAllowed", .bool(true)),  // Bool
    ("productName", .string("example_productName")),  // String
    ("responseCode", .int(1)),  // Int
    ("responseMessage", .string("example_responseMessage")),  // String
    ("terminalTemplateName", .string("example_terminalTemplateName")),  // String
    ("vendorName", .string("example_vendorName")),  // String
    ("xmlTemplateFile", .string("example_xmlTemplateFile"))  // String
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
| `batch` | `VMap` | No |  |
| `lines` | `VMap` | No |  |
| `progress` | `VMap` | No |  |

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
| `items` | `[Value]` | No |  |
| `pagination` | `VMap` | Yes |  |
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |
| `sorting` | `VMap` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `items` | - |
| `pagination` | Yes |
| `responseCode` | - |
| `responseMessage` | - |
| `sorting` | - |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.OutputList().create(VMap([
    ("pagination", .map(VMap())),  // VMap
    ("responseCode", .int(1)),  // Int
    ("responseMessage", .string("example_responseMessage"))  // String
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
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |

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
| `productOrderUUIDs` | `[Value]` | Yes |  |
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |
| `targetPackageOrderUUID` | `String` | Yes |  |
| `targetProductOrderUUID` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.OutputMoveTid().create(VMap([
    ("productOrderUUIDs", .list([])),  // [Value]
    ("responseCode", .int(1)),  // Int
    ("responseMessage", .string("example_responseMessage")),  // String
    ("targetPackageOrderUUID", .string("example_targetPackageOrderUUID")),  // String
    ("targetProductOrderUUID", .string("example_targetProductOrderUUID"))  // String
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
| `packageUUID` | `String` | Yes |  |
| `productUUIDs` | `[Value]` | Yes |  |
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.OutputRemoveProduct().create(VMap([
    ("packageUUID", .string("example_packageUUID")),  // String
    ("productUUIDs", .list([])),  // [Value]
    ("responseCode", .int(1)),  // Int
    ("responseMessage", .string("example_responseMessage"))  // String
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
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.OutputStart().create(VMap([
    ("responseCode", .int(1)),  // Int
    ("responseMessage", .string("example_responseMessage"))  // String
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
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |
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
| `allowMultipleOrders` | `Bool` | No |  |
| `appFormName` | `String` | No |  |
| `contractNeeded` | `Bool` | No |  |
| `credentialsNeeded` | `Bool` | No |  |
| `descriptionKey` | `String` | No |  |
| `nameKey` | `String` | No |  |
| `prescreeningAllowed` | `Bool` | No |  |
| `productName` | `String` | No |  |
| `productStatus` | `String` | No |  |
| `productUUID` | `String` | Yes |  |
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |
| `vendorName` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.OutputUpdateProduct().create(VMap([
    ("productUUID", .string("example_productUUID")),  // String
    ("responseCode", .int(1)),  // Int
    ("responseMessage", .string("example_responseMessage"))  // String
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

