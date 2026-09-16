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
| `account_number` | `Int` | No | Account number provided by the acquirer. |
| `additional_data` | `VMap` | No | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `String` | Yes | Merchant business registration number as stated in the company registry. |
| `city` | `String` | Yes | Merchant's address: city. |
| `corporateuuid` | `String` | No | Unique identifier for the corporate entity (UUID format). |
| `country` | `String` | Yes | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `String` | Yes | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `Int` | Yes | Merchant category code as defined by the payment network. |
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
| `sorting_code` | `Int` | No | Sorting code provided by the acquirer. |
| `state` | `String` | No | Merchant's address: state. |
| `street` | `String` | Yes | Merchant's address: street and house number. |
| `terminal_country_code` | `String` | Yes | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `String` | Yes | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `String` | Yes | Physical or logical location of the terminal. |
| `terminal_serial_number` | `String` | Yes | Terminal serial number. |
| `terminalid` | `Int` | Yes | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `String` | No | Terminal ID as set by the acquirer (optional). |
| `user_email` | `String` | No | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `String` | No | Phone number of the user acting on behalf of the merchant. |
| `username` | `String` | No | Merchant username for MPOS. |
| `vu_nummer` | `String` | Yes | Merchant contract number with the acquirer. |
| `web_shop_url` | `String` | No | URL of the merchant's web shop. |
| `zipcode` | `String` | Yes | Merchant's address: postal code. |

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
| `packageOrderUUID` | `String` | No | UUID of the package order. |
| `productOrderUUID` | `String` | No | UUID of the product order. |

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
| `packageOrderUUID` | `String` | Yes | UUID of the package order. |
| `packageUUID` | `String` | No |  |
| `productOrderUUID` | `String` | No | UUID of the product order. |
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
| `additional_data` | `VMap` | No | Optional additional merchant-specific data related to enabling acquiring. |
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
| `terminalIds` | `[Value]` | No | Optional list of terminal IDs for which acquiring should be activated. |
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
| `country` | `String` | No | Country associated with the package. |
| `descriptionKey` | `String` | No | Key for the description of the package. |
| `filter` | `VMap` | No |  |
| `language` | `String` | Yes |  |
| `nameKey` | `String` | No | Key for the name of the package. |
| `packageStatus` | `String` | No | Status of the package. |
| `packageUUID` | `String` | Yes | Unique identifier for the package. |
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
| `reason_decline` | `String` | Yes | Reason for product decline. |
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
| `packageUUID` | `String` | Yes | Unique identifier for the package. |
| `productUUIDs` | `[Value]` | Yes | The list of unique identifiers of the products. |
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

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
| `acquirerId` | `String` | No | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `Bool` | Yes | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `String` | Yes | Name of the application form template. |
| `contractNeeded` | `Bool` | Yes | Indication whether contract is needed or not. |
| `credentialsNeeded` | `Bool` | No | Indication whether credentials are needed or not. |
| `descriptionKey` | `String` | Yes | Key indicator for product description. |
| `nameKey` | `String` | Yes | Key indicator for product name. |
| `prescreeningAllowed` | `Bool` | Yes | Indication whether prescreening is allowed or not. |
| `productName` | `String` | Yes | Name of the product. |
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `terminalTemplateName` | `String` | Yes | Name of the terminal template. |
| `vendorName` | `String` | Yes | Name of the vendor. |
| `xmlTemplateFile` | `String` | Yes | A string value containing the XML template file encoded in Base64. |

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
| `id` | `String` | No |  |
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
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
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
| `id` | `String` | No |  |
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

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
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
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
| `packageUUID` | `String` | Yes | Unique identifier for the package. |
| `productUUIDs` | `[Value]` | Yes | List of product unique identifiers. |
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

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
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

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
| `id` | `String` | No |  |
| `percentage` | `Int` | No |  |
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
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
| `allowMultipleOrders` | `Bool` | No | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `String` | No | The name of the application form |
| `contractNeeded` | `Bool` | No | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `Bool` | No | An attribute to indicate if credentials are needed |
| `descriptionKey` | `String` | No | The description of the product |
| `nameKey` | `String` | No | The key of the product name |
| `prescreeningAllowed` | `Bool` | No | An attribute to indicate if prescreening is allowed |
| `productName` | `String` | No | The name of the product |
| `productStatus` | `String` | No | The status of the product |
| `productUUID` | `String` | Yes | The UUID of the product to update |
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `vendorName` | `String` | No | The name of the vendor |

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
| `audit` | 0.0.1 | Structured audit trail of operations |
| `clienttrack` | 0.0.1 | Client identity and per-request correlation headers |
| `debug` | 0.0.1 | Request/response capture ring buffer for debugging |
| `idempotency` | 0.0.1 | Idempotency keys for safe retries of mutating operations |
| `log` | 0.0.1 | Structured request and response logging |
| `metrics` | 0.0.1 | Statistics capture: per-operation counters and latency |
| `paging` | 0.0.1 | Pagination signals for list operations |
| `ratelimit` | 0.0.1 | Client-side rate limiting via a token bucket |
| `retry` | 0.0.1 | Automatic retry of transient failures with exponential backoff |
| `telemetry` | 0.0.1 | Distributed tracing spans with W3C trace-context propagation |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |
| `timeout` | 0.0.1 | Per-request timeout with transport abort |


Features are activated via the `feature` option:

```swift
let feature = VMap()
feature.entries["audit"] = .map([("active", .bool(true))])
feature.entries["clienttrack"] = .map([("active", .bool(true))])
feature.entries["debug"] = .map([("active", .bool(true))])
feature.entries["idempotency"] = .map([("active", .bool(true))])
feature.entries["log"] = .map([("active", .bool(true))])
feature.entries["metrics"] = .map([("active", .bool(true))])
feature.entries["paging"] = .map([("active", .bool(true))])
feature.entries["ratelimit"] = .map([("active", .bool(true))])
feature.entries["retry"] = .map([("active", .bool(true))])
feature.entries["telemetry"] = .map([("active", .bool(true))])
feature.entries["test"] = .map([("active", .bool(true))])
feature.entries["timeout"] = .map([("active", .bool(true))])
let options = VMap()
options.entries["feature"] = .map(feature)
let client = BluefinTecsMerchantPortalSDK(options)
```


### Configuring features

Each feature is inactive until switched on, and an SDK with no feature
configured does no feature work at all. Every option below keeps its default
unless you name it.

The array form of \`feature\` is significant: several features wrap the
transport, and the order you list them in is the order they nest.

#### Ordering

`ratelimit`, `retry`, `timeout` wrap the transport. Each
wraps whatever is already installed, so **activation order is nesting order**:
a feature activated later sits OUTSIDE one activated earlier, and sees the call
first.

That decides behaviour, not just sequence: a feature that short-circuits the
call, such as a cache serving a hit, stops every feature nested inside it from
ever seeing that call.

`audit`, `clienttrack`, `debug`, `idempotency`, `log`, `metrics`, `paging`, `telemetry`, `test` attach to pipeline hooks
rather than the transport, so their order does not affect what they observe.

#### `audit`

Structured audit trail of operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

| Option | Type |
|---|---|
| `now` | function |
| `sink` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.audit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `clienttrack`

Client identity and per-request correlation headers.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

| Option | Type |
|---|---|
| `clientName` | string |
| `headers` | map |
| `idgen` | function |
| `sessionId` | string |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.clienttrack.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `debug`

Request/response capture ring buffer for debugging.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `max` | `100` |
| `redact` | `['authorization', 'cookie', 'set-cookie', 'api-key', 'apikey', 'x-api-key', 'idempotency-key']` |

| Option | Type |
|---|---|
| `now` | function |
| `onEntry` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.debug.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `idempotency`

Idempotency keys for safe retries of mutating operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

| Option | Type |
|---|---|
| `keygen` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.idempotency.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `log`

Structured request and response logging.

**Configuration**

| Option | Default |
|---|---|
| `active` | `true` |

| Option | Type |
|---|---|
| `level` | string |
| `logger` | any |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.log.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `metrics`

Statistics capture: per-operation counters and latency.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `now` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.metrics.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `paging`

Pagination signals for list operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `afterVar` | `'after'` |
| `cursorParam` | `'cursor'` |
| `firstVar` | `'first'` |
| `limitParam` | `'limit'` |
| `pageParam` | `'page'` |
| `startPage` | `1` |

| Option | Type |
|---|---|
| `limit` | number |
| `ops` | list |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.paging.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `ratelimit`

Client-side rate limiting via a token bucket.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

| Option | Type |
|---|---|
| `now` | function |
| `sleep` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.ratelimit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `retry`

Automatic retry of transient failures with exponential backoff.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

| Option | Type |
|---|---|
| `jitter` | boolean |
| `sleep` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.retry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `telemetry`

Distributed tracing spans with W3C trace-context propagation.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `exporter` | function |
| `headers` | map |
| `idgen` | function |
| `now` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.telemetry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `test`

In-memory mock transport for testing without a live server.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `entity` | map |
| `net` | map |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.test.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Installs the BASE transport that the wrapping features wrap, so it must be
  activated before them.
- Inactive by default: leaving it out costs nothing at runtime.

#### `timeout`

Per-request timeout with transport abort.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

| Option | Type |
|---|---|
| `clearTimer` | function |
| `setTimer` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.timeout.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

