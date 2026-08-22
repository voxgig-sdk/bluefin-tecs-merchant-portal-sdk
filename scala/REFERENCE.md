# BluefinTecsMerchantPortal Scala SDK Reference

Complete API reference for the BluefinTecsMerchantPortal Scala SDK.


## BluefinTecsMerchantPortalSDK

### Constructor

```scala
val client = new BluefinTecsMerchantPortalSDK(options)
```

Create a new SDK client instance. `options` is a `java.util.Map[String, Object]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Map` | SDK configuration options. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Map` | Custom headers for all requests. |
| `options["feature"]` | `Map` | Feature configuration. |
| `options["system"]` | `Map` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinTecsMerchantPortalSDK.testSDK(testopts, sdkopts)`

Create a test client with mock features active. Both arguments may be `null`.

```scala
val client = BluefinTecsMerchantPortalSDK.testSDK(null, null)
```


### Instance Methods

#### `merchantPortalApiController(entopts)`

Create a new `MerchantPortalApiController` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `merchantPortalCommonController(entopts)`

Create a new `MerchantPortalCommonController` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `merchantPortalPamContractController(entopts)`

Create a new `MerchantPortalPamContractController` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `merchantPortalPamDocumentController(entopts)`

Create a new `MerchantPortalPamDocumentController` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `merchantPortalPamFormController(entopts)`

Create a new `MerchantPortalPamFormController` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `merchantPortalPamMandatorController(entopts)`

Create a new `MerchantPortalPamMandatorController` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `merchantPortalPamMerchantController(entopts)`

Create a new `MerchantPortalPamMerchantController` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `merchantPortalPamPackageController(entopts)`

Create a new `MerchantPortalPamPackageController` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `merchantPortalPamProductController(entopts)`

Create a new `MerchantPortalPamProductController` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `outputAddProduct(entopts)`

Create a new `OutputAddProduct` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `outputCreateProduct(entopts)`

Create a new `OutputCreateProduct` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `outputDetail(entopts)`

Create a new `OutputDetail` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `outputList(entopts)`

Create a new `OutputList` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `outputMessage(entopts)`

Create a new `OutputMessage` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `outputMoveTid(entopts)`

Create a new `OutputMoveTid` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `outputRemoveProduct(entopts)`

Create a new `OutputRemoveProduct` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `outputStart(entopts)`

Create a new `OutputStart` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `outputStatus(entopts)`

Create a new `OutputStatus` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `outputUpdateProduct(entopts)`

Create a new `OutputUpdateProduct` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `optionsMap() -> Map`

Return a deep copy of the current SDK options.

#### `getUtility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> Map`

Make a direct HTTP request to any API endpoint. Returns a result
`java.util.Map[String, Object]` with `ok`, `status`, `headers`, and
`data` (or `err` on failure). This escape hatch never raises — branch on
`result.get("ok")`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Map` | Path parameter values. |
| `fetchargs["query"]` | `Map` | Query string parameters. |
| `fetchargs["headers"]` | `Map` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Object` | Request body (maps are JSON-serialized). |

**Returns:** `java.util.Map[String, Object]`

#### `prepare(fetchargs) -> Map`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## MerchantPortalApiController

```scala
val merchantPortalApiController = client.merchantPortalApiController(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `java.lang.Long` | No | Account number provided by the acquirer. |
| `additional_data` | `java.util.Map[String, Object]` | No | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `String` | Yes | Merchant business registration number as stated in the company registry. |
| `city` | `String` | Yes | Merchant's address: city. |
| `corporateuuid` | `String` | No | Unique identifier for the corporate entity (UUID format). |
| `country` | `String` | Yes | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `String` | Yes | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `java.lang.Long` | Yes | Merchant category code as defined by the payment network. |
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
| `sorting_code` | `java.lang.Long` | No | Sorting code provided by the acquirer. |
| `state` | `String` | No | Merchant's address: state. |
| `street` | `String` | Yes | Merchant's address: street and house number. |
| `terminal_country_code` | `String` | Yes | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `String` | Yes | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `String` | Yes | Physical or logical location of the terminal. |
| `terminal_serial_number` | `String` | Yes | Terminal serial number. |
| `terminalid` | `java.lang.Long` | Yes | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `String` | No | Terminal ID as set by the acquirer (optional). |
| `user_email` | `String` | No | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `String` | No | Phone number of the user acting on behalf of the merchant. |
| `username` | `String` | No | Merchant username for MPOS. |
| `vu_nummer` | `String` | Yes | Merchant contract number with the acquirer. |
| `web_shop_url` | `String` | No | URL of the merchant's web shop. |
| `zipcode` | `String` | Yes | Merchant's address: postal code. |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.merchantPortalApiController(null).create(java.util.Map.of(
    "business_reg_number", "example_business_reg_number",  // String
    "city", "example_city",  // String
    "country", "example_country",  // String
    "currency", "example_currency",  // String
    "merchant_category_code", 1L,  // java.lang.Long
    "merchant_name", "example_merchant_name",  // String
    "packageid", "example_packageid",  // String
    "packageorderuuid", "example_packageorderuuid",  // String
    "reason_deactivation", "example_reason_deactivation",  // String
    "reason_reactivation", "example_reason_reactivation",  // String
    "street", "example_street",  // String
    "terminal_country_code", "example_terminal_country_code",  // String
    "terminal_language_code", "example_terminal_language_code",  // String
    "terminal_location", "example_terminal_location",  // String
    "terminal_serial_number", "example_terminal_serial_number",  // String
    "terminalid", 1L,  // java.lang.Long
    "vu_nummer", "example_vu_nummer",  // String
    "zipcode", "example_zipcode"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalApiController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## MerchantPortalCommonController

```scala
val merchantPortalCommonController = client.merchantPortalCommonController(null)
```

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.merchantPortalCommonController(null).load(null, null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalCommonController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## MerchantPortalPamContractController

```scala
val merchantPortalPamContractController = client.merchantPortalPamContractController(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `String` | Yes |  |
| `productOrderUUID` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.merchantPortalPamContractController(null).create(java.util.Map.of(
    "language", "example_language",  // String
    "productOrderUUID", "example_productOrderUUID"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamContractController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## MerchantPortalPamDocumentController

```scala
val merchantPortalPamDocumentController = client.merchantPortalPamDocumentController(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appFormFieldDescUUID` | `String` | Yes |  |
| `packageOrderUUID` | `String` | No | UUID of the package order. |
| `productOrderUUID` | `String` | No | UUID of the product order. |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.merchantPortalPamDocumentController(null).create(java.util.Map.of(
    "appFormFieldDescUUID", "example_appFormFieldDescUUID"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamDocumentController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## MerchantPortalPamFormController

```scala
val merchantPortalPamFormController = client.merchantPortalPamFormController(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appFormFieldsDescUUID` | `String` | Yes |  |
| `filter` | `java.util.Map[String, Object]` | No |  |
| `language` | `String` | Yes |  |
| `packageOrder` | `java.util.Map[String, Object]` | No |  |
| `packageOrderUUID` | `String` | Yes | UUID of the package order. |
| `packageUUID` | `String` | No |  |
| `productOrderUUID` | `String` | No | UUID of the product order. |
| `productOrders` | `java.util.List[Object]` | No |  |
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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.merchantPortalPamFormController(null).create(java.util.Map.of(
    "appFormFieldsDescUUID", "example_appFormFieldsDescUUID",  // String
    "language", "example_language",  // String
    "packageOrderUUID", "example_packageOrderUUID",  // String
    "reasonOfReopening", "example_reasonOfReopening"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamFormController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## MerchantPortalPamMandatorController

```scala
val merchantPortalPamMandatorController = client.merchantPortalPamMandatorController(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `clientSecret` | `String` | No |  |
| `mandatorName` | `String` | Yes |  |
| `notificationEmail` | `String` | No |  |
| `packageUUID` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.merchantPortalPamMandatorController(null).create(java.util.Map.of(
    "mandatorName", "example_mandatorName",  // String
    "packageUUID", "example_packageUUID"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamMandatorController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## MerchantPortalPamMerchantController

```scala
val merchantPortalPamMerchantController = client.merchantPortalPamMerchantController(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `java.util.Map[String, Object]` | No | Optional additional merchant-specific data related to enabling acquiring. |
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
| `terminalIds` | `java.util.List[Object]` | No | Optional list of terminal IDs for which acquiring should be activated. |
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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.merchantPortalPamMerchantController(null).create(java.util.Map.of(
    "businessRegistrationNumber", "example_businessRegistrationNumber",  // String
    "companyName", "example_companyName",  // String
    "corporateUUID", "example_corporateUUID",  // String
    "currency", "example_currency",  // String
    "email", "example_email",  // String
    "language", "example_language",  // String
    "login", "example_login",  // String
    "mandator", "example_mandator",  // String
    "merchantContractNumber", "example_merchantContractNumber",  // String
    "packageorderuuid", "example_packageorderuuid",  // String
    "phoneNumber", "example_phoneNumber",  // String
    "productid_acquirer", "example_productid_acquirer",  // String
    "vu_nummer", "example_vu_nummer"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamMerchantController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## MerchantPortalPamPackageController

```scala
val merchantPortalPamPackageController = client.merchantPortalPamPackageController(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumerUUID` | `String` | No |  |
| `corporateUUID` | `String` | No |  |
| `country` | `String` | No | Country associated with the package. |
| `descriptionKey` | `String` | No | Key for the description of the package. |
| `filter` | `java.util.Map[String, Object]` | No |  |
| `language` | `String` | Yes |  |
| `nameKey` | `String` | No | Key for the name of the package. |
| `packageStatus` | `String` | No | Status of the package. |
| `packageUUID` | `String` | Yes | Unique identifier for the package. |
| `pagination` | `java.util.Map[String, Object]` | No |  |
| `sorting` | `java.util.Map[String, Object]` | No |  |

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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.merchantPortalPamPackageController(null).create(java.util.Map.of(
    "language", "example_language",  // String
    "packageUUID", "example_packageUUID"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamPackageController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## MerchantPortalPamProductController

```scala
val merchantPortalPamProductController = client.merchantPortalPamProductController(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumerUUID` | `String` | No |  |
| `filter` | `java.util.Map[String, Object]` | No |  |
| `language` | `String` | No |  |
| `merchantID` | `String` | No |  |
| `packageOrderUUID` | `String` | Yes |  |
| `pagination` | `java.util.Map[String, Object]` | No |  |
| `productOrderUUID` | `String` | Yes |  |
| `productUUID` | `String` | Yes |  |
| `reason_decline` | `String` | Yes | Reason for product decline. |
| `sorting` | `java.util.Map[String, Object]` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.merchantPortalPamProductController(null).create(java.util.Map.of(
    "packageOrderUUID", "example_packageOrderUUID",  // String
    "productOrderUUID", "example_productOrderUUID",  // String
    "productUUID", "example_productUUID",  // String
    "reason_decline", "example_reason_decline"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamProductController` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputAddProduct

```scala
val outputAddProduct = client.outputAddProduct(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `packageUUID` | `String` | Yes | Unique identifier for the package. |
| `productUUIDs` | `java.util.List[Object]` | Yes | The list of unique identifiers of the products. |
| `responseCode` | `java.lang.Long` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.outputAddProduct(null).create(java.util.Map.of(
    "packageUUID", "example_packageUUID",  // String
    "productUUIDs", java.util.List.of(),  // java.util.List[Object]
    "responseCode", 1L,  // java.lang.Long
    "responseMessage", "example_responseMessage"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputAddProduct` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputCreateProduct

```scala
val outputCreateProduct = client.outputCreateProduct(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acquirerId` | `String` | No | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `java.lang.Boolean` | Yes | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `String` | Yes | Name of the application form template. |
| `contractNeeded` | `java.lang.Boolean` | Yes | Indication whether contract is needed or not. |
| `credentialsNeeded` | `java.lang.Boolean` | No | Indication whether credentials are needed or not. |
| `descriptionKey` | `String` | Yes | Key indicator for product description. |
| `nameKey` | `String` | Yes | Key indicator for product name. |
| `prescreeningAllowed` | `java.lang.Boolean` | Yes | Indication whether prescreening is allowed or not. |
| `productName` | `String` | Yes | Name of the product. |
| `responseCode` | `java.lang.Long` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `terminalTemplateName` | `String` | Yes | Name of the terminal template. |
| `vendorName` | `String` | Yes | Name of the vendor. |
| `xmlTemplateFile` | `String` | Yes | A string value containing the XML template file encoded in Base64. |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.outputCreateProduct(null).create(java.util.Map.of(
    "allowMultipleOrders", true,  // java.lang.Boolean
    "appFormTemplateName", "example_appFormTemplateName",  // String
    "contractNeeded", true,  // java.lang.Boolean
    "descriptionKey", "example_descriptionKey",  // String
    "nameKey", "example_nameKey",  // String
    "prescreeningAllowed", true,  // java.lang.Boolean
    "productName", "example_productName",  // String
    "responseCode", 1L,  // java.lang.Long
    "responseMessage", "example_responseMessage",  // String
    "terminalTemplateName", "example_terminalTemplateName",  // String
    "vendorName", "example_vendorName",  // String
    "xmlTemplateFile", "example_xmlTemplateFile"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputCreateProduct` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputDetail

```scala
val outputDetail = client.outputDetail(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `batch` | `java.util.Map[String, Object]` | No |  |
| `lines` | `java.util.Map[String, Object]` | No |  |
| `progress` | `java.util.Map[String, Object]` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.outputDetail(null).load(java.util.Map.of("id", "output_detail_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputDetail` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputList

```scala
val outputList = client.outputList(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `items` | `java.util.List[Object]` | No |  |
| `pagination` | `java.util.Map[String, Object]` | Yes |  |
| `responseCode` | `java.lang.Long` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `sorting` | `java.util.Map[String, Object]` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `items` | - |
| `pagination` | Yes |
| `responseCode` | - |
| `responseMessage` | - |
| `sorting` | - |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.outputList(null).create(java.util.Map.of(
    "pagination", java.util.Map.of(),  // java.util.Map[String, Object]
    "responseCode", 1L,  // java.lang.Long
    "responseMessage", "example_responseMessage"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputList` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputMessage

```scala
val outputMessage = client.outputMessage(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `responseCode` | `java.lang.Long` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.outputMessage(null).load(java.util.Map.of("id", "output_message_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputMessage` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputMoveTid

```scala
val outputMoveTid = client.outputMoveTid(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `productOrderUUIDs` | `java.util.List[Object]` | Yes |  |
| `responseCode` | `java.lang.Long` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `targetPackageOrderUUID` | `String` | Yes |  |
| `targetProductOrderUUID` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.outputMoveTid(null).create(java.util.Map.of(
    "productOrderUUIDs", java.util.List.of(),  // java.util.List[Object]
    "responseCode", 1L,  // java.lang.Long
    "responseMessage", "example_responseMessage",  // String
    "targetPackageOrderUUID", "example_targetPackageOrderUUID",  // String
    "targetProductOrderUUID", "example_targetProductOrderUUID"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputMoveTid` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputRemoveProduct

```scala
val outputRemoveProduct = client.outputRemoveProduct(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `packageUUID` | `String` | Yes | Unique identifier for the package. |
| `productUUIDs` | `java.util.List[Object]` | Yes | List of product unique identifiers. |
| `responseCode` | `java.lang.Long` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.outputRemoveProduct(null).create(java.util.Map.of(
    "packageUUID", "example_packageUUID",  // String
    "productUUIDs", java.util.List.of(),  // java.util.List[Object]
    "responseCode", 1L,  // java.lang.Long
    "responseMessage", "example_responseMessage"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputRemoveProduct` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputStart

```scala
val outputStart = client.outputStart(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `String` | No |  |
| `responseCode` | `java.lang.Long` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.outputStart(null).create(java.util.Map.of(
    "responseCode", 1L,  // java.lang.Long
    "responseMessage", "example_responseMessage"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputStart` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputStatus

```scala
val outputStatus = client.outputStatus(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `java.lang.Long` | No |  |
| `responseCode` | `java.lang.Long` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `status` | `String` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.outputStatus(null).load(java.util.Map.of("id", "output_status_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputStatus` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## OutputUpdateProduct

```scala
val outputUpdateProduct = client.outputUpdateProduct(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `allowMultipleOrders` | `java.lang.Boolean` | No | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `String` | No | The name of the application form |
| `contractNeeded` | `java.lang.Boolean` | No | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `java.lang.Boolean` | No | An attribute to indicate if credentials are needed |
| `descriptionKey` | `String` | No | The description of the product |
| `nameKey` | `String` | No | The key of the product name |
| `prescreeningAllowed` | `java.lang.Boolean` | No | An attribute to indicate if prescreening is allowed |
| `productName` | `String` | No | The name of the product |
| `productStatus` | `String` | No | The status of the product |
| `productUUID` | `String` | Yes | The UUID of the product to update |
| `responseCode` | `java.lang.Long` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `vendorName` | `String` | No | The name of the vendor |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.outputUpdateProduct(null).create(java.util.Map.of(
    "productUUID", "example_productUUID",  // String
    "responseCode", 1L,  // java.lang.Long
    "responseMessage", "example_responseMessage"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

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

```scala
val feature = new java.util.LinkedHashMap[String, Object]()
feature.put("test", java.util.Map.of("active", true))
val options = new java.util.LinkedHashMap[String, Object]()
options.put("feature", feature)
val client = new BluefinTecsMerchantPortalSDK(options)
```

