# BluefinTecsMerchantPortal Kotlin SDK Reference

Complete API reference for the BluefinTecsMerchantPortal Kotlin SDK.


## BluefinTecsMerchantPortalSDK

### Constructor

```kotlin
val client = BluefinTecsMerchantPortalSDK(options)
```

Create a new SDK client instance. `options` is a `MutableMap<String, Any?>`.

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

```kotlin
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

#### `optionsMap() -> MutableMap`

Return a deep copy of the current SDK options.

#### `getUtility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> MutableMap`

Make a direct HTTP request to any API endpoint. Returns a result
`MutableMap<String, Any?>` with `ok`, `status`, `headers`, and `data`
(or `err` on failure). This escape hatch never raises — branch on
`result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Map` | Path parameter values. |
| `fetchargs["query"]` | `Map` | Query string parameters. |
| `fetchargs["headers"]` | `Map` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Any?` | Request body (maps are JSON-serialized). |

**Returns:** `MutableMap<String, Any?>`

#### `prepare(fetchargs) -> MutableMap`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## MerchantPortalApiController

```kotlin
val merchantPortalApiController = client.merchantPortalApiController(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `Long?` | No |  |
| `additional_data` | `Map<String, Any?>?` | No |  |
| `business_reg_number` | `String?` | Yes |  |
| `city` | `String?` | Yes |  |
| `corporateuuid` | `String?` | No |  |
| `country` | `String?` | Yes |  |
| `currency` | `String?` | Yes |  |
| `merchant_category_code` | `Long?` | Yes |  |
| `merchant_email` | `String?` | No |  |
| `merchant_name` | `String?` | Yes |  |
| `merchant_phone_number` | `String?` | No |  |
| `packageid` | `String?` | Yes |  |
| `packageorderuuid` | `String?` | Yes |  |
| `password` | `String?` | No |  |
| `productid` | `String?` | No |  |
| `productid_acquirer` | `String?` | No |  |
| `reason_deactivation` | `String?` | Yes |  |
| `reason_reactivation` | `String?` | Yes |  |
| `sorting_code` | `Long?` | No |  |
| `state` | `String?` | No |  |
| `street` | `String?` | Yes |  |
| `terminal_country_code` | `String?` | Yes |  |
| `terminal_language_code` | `String?` | Yes |  |
| `terminal_location` | `String?` | Yes |  |
| `terminal_serial_number` | `String?` | Yes |  |
| `terminalid` | `Long?` | Yes |  |
| `terminalid_acquirer` | `String?` | No |  |
| `user_email` | `String?` | No |  |
| `user_phone_number` | `String?` | No |  |
| `username` | `String?` | No |  |
| `vu_nummer` | `String?` | Yes |  |
| `web_shop_url` | `String?` | No |  |
| `zipcode` | `String?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.merchantPortalApiController(null).create(mutableMapOf<String, Any?>(
    "business_reg_number" to "example_business_reg_number",  // String?
    "city" to "example_city",  // String?
    "country" to "example_country",  // String?
    "currency" to "example_currency",  // String?
    "merchant_category_code" to 1L,  // Long?
    "merchant_name" to "example_merchant_name",  // String?
    "packageid" to "example_packageid",  // String?
    "packageorderuuid" to "example_packageorderuuid",  // String?
    "reason_deactivation" to "example_reason_deactivation",  // String?
    "reason_reactivation" to "example_reason_reactivation",  // String?
    "street" to "example_street",  // String?
    "terminal_country_code" to "example_terminal_country_code",  // String?
    "terminal_language_code" to "example_terminal_language_code",  // String?
    "terminal_location" to "example_terminal_location",  // String?
    "terminal_serial_number" to "example_terminal_serial_number",  // String?
    "terminalid" to 1L,  // Long?
    "vu_nummer" to "example_vu_nummer",  // String?
    "zipcode" to "example_zipcode"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalApiController` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## MerchantPortalCommonController

```kotlin
val merchantPortalCommonController = client.merchantPortalCommonController(null)
```

### Operations

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.merchantPortalCommonController(null).load(null, null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalCommonController` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## MerchantPortalPamContractController

```kotlin
val merchantPortalPamContractController = client.merchantPortalPamContractController(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `String?` | Yes |  |
| `productOrderUUID` | `String?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.merchantPortalPamContractController(null).create(mutableMapOf<String, Any?>(
    "language" to "example_language",  // String?
    "productOrderUUID" to "example_productOrderUUID"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamContractController` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## MerchantPortalPamDocumentController

```kotlin
val merchantPortalPamDocumentController = client.merchantPortalPamDocumentController(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appFormFieldDescUUID` | `String?` | Yes |  |
| `packageOrderUUID` | `String?` | No |  |
| `productOrderUUID` | `String?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.merchantPortalPamDocumentController(null).create(mutableMapOf<String, Any?>(
    "appFormFieldDescUUID" to "example_appFormFieldDescUUID"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamDocumentController` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## MerchantPortalPamFormController

```kotlin
val merchantPortalPamFormController = client.merchantPortalPamFormController(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appFormFieldsDescUUID` | `String?` | Yes |  |
| `filter` | `Map<String, Any?>?` | No |  |
| `language` | `String?` | Yes |  |
| `packageOrder` | `Map<String, Any?>?` | No |  |
| `packageOrderUUID` | `String?` | Yes |  |
| `packageUUID` | `String?` | No |  |
| `productOrderUUID` | `String?` | No |  |
| `productOrders` | `List<Any?>?` | No |  |
| `reasonOfReopening` | `String?` | Yes |  |

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

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.merchantPortalPamFormController(null).create(mutableMapOf<String, Any?>(
    "appFormFieldsDescUUID" to "example_appFormFieldsDescUUID",  // String?
    "language" to "example_language",  // String?
    "packageOrderUUID" to "example_packageOrderUUID",  // String?
    "reasonOfReopening" to "example_reasonOfReopening"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamFormController` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## MerchantPortalPamMandatorController

```kotlin
val merchantPortalPamMandatorController = client.merchantPortalPamMandatorController(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `clientSecret` | `String?` | No |  |
| `mandatorName` | `String?` | Yes |  |
| `notificationEmail` | `String?` | No |  |
| `packageUUID` | `String?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.merchantPortalPamMandatorController(null).create(mutableMapOf<String, Any?>(
    "mandatorName" to "example_mandatorName",  // String?
    "packageUUID" to "example_packageUUID"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamMandatorController` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## MerchantPortalPamMerchantController

```kotlin
val merchantPortalPamMerchantController = client.merchantPortalPamMerchantController(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `Map<String, Any?>?` | No |  |
| `businessRegistrationNumber` | `String?` | Yes |  |
| `city` | `String?` | No |  |
| `companyName` | `String?` | Yes |  |
| `corporateUUID` | `String?` | Yes |  |
| `country` | `String?` | No |  |
| `currency` | `String?` | Yes |  |
| `email` | `String?` | Yes |  |
| `language` | `String?` | Yes |  |
| `login` | `String?` | Yes |  |
| `mandator` | `String?` | Yes |  |
| `merchantContractNumber` | `String?` | Yes |  |
| `merchantName` | `String?` | No |  |
| `merchant_category_code` | `String?` | No |  |
| `packageUUID` | `String?` | No |  |
| `packageorderuuid` | `String?` | Yes |  |
| `phoneNumber` | `String?` | Yes |  |
| `postalCode` | `String?` | No |  |
| `productid_acquirer` | `String?` | Yes |  |
| `region` | `String?` | No |  |
| `registrationNumber` | `String?` | No |  |
| `signature` | `String?` | No |  |
| `street` | `String?` | No |  |
| `terminalIds` | `List<Any?>?` | No |  |
| `terminalid_acquirer` | `String?` | No |  |
| `vu_nummer` | `String?` | Yes |  |

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

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.merchantPortalPamMerchantController(null).create(mutableMapOf<String, Any?>(
    "businessRegistrationNumber" to "example_businessRegistrationNumber",  // String?
    "companyName" to "example_companyName",  // String?
    "corporateUUID" to "example_corporateUUID",  // String?
    "currency" to "example_currency",  // String?
    "email" to "example_email",  // String?
    "language" to "example_language",  // String?
    "login" to "example_login",  // String?
    "mandator" to "example_mandator",  // String?
    "merchantContractNumber" to "example_merchantContractNumber",  // String?
    "packageorderuuid" to "example_packageorderuuid",  // String?
    "phoneNumber" to "example_phoneNumber",  // String?
    "productid_acquirer" to "example_productid_acquirer",  // String?
    "vu_nummer" to "example_vu_nummer"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamMerchantController` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## MerchantPortalPamPackageController

```kotlin
val merchantPortalPamPackageController = client.merchantPortalPamPackageController(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumerUUID` | `String?` | No |  |
| `corporateUUID` | `String?` | No |  |
| `country` | `String?` | No |  |
| `descriptionKey` | `String?` | No |  |
| `filter` | `Map<String, Any?>?` | No |  |
| `language` | `String?` | Yes |  |
| `nameKey` | `String?` | No |  |
| `packageStatus` | `String?` | No |  |
| `packageUUID` | `String?` | Yes |  |
| `pagination` | `Map<String, Any?>?` | No |  |
| `sorting` | `Map<String, Any?>?` | No |  |

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

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.merchantPortalPamPackageController(null).create(mutableMapOf<String, Any?>(
    "language" to "example_language",  // String?
    "packageUUID" to "example_packageUUID"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamPackageController` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## MerchantPortalPamProductController

```kotlin
val merchantPortalPamProductController = client.merchantPortalPamProductController(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumerUUID` | `String?` | No |  |
| `filter` | `Map<String, Any?>?` | No |  |
| `language` | `String?` | No |  |
| `merchantID` | `String?` | No |  |
| `packageOrderUUID` | `String?` | Yes |  |
| `pagination` | `Map<String, Any?>?` | No |  |
| `productOrderUUID` | `String?` | Yes |  |
| `productUUID` | `String?` | Yes |  |
| `reason_decline` | `String?` | Yes |  |
| `sorting` | `Map<String, Any?>?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.merchantPortalPamProductController(null).create(mutableMapOf<String, Any?>(
    "packageOrderUUID" to "example_packageOrderUUID",  // String?
    "productOrderUUID" to "example_productOrderUUID",  // String?
    "productUUID" to "example_productUUID",  // String?
    "reason_decline" to "example_reason_decline"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamProductController` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## OutputAddProduct

```kotlin
val outputAddProduct = client.outputAddProduct(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `packageUUID` | `String?` | Yes |  |
| `productUUIDs` | `List<Any?>?` | Yes |  |
| `responseCode` | `Long?` | Yes |  |
| `responseMessage` | `String?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.outputAddProduct(null).create(mutableMapOf<String, Any?>(
    "packageUUID" to "example_packageUUID",  // String?
    "productUUIDs" to listOf<Any?>(),  // List<Any?>?
    "responseCode" to 1L,  // Long?
    "responseMessage" to "example_responseMessage"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputAddProduct` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## OutputCreateProduct

```kotlin
val outputCreateProduct = client.outputCreateProduct(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acquirerId` | `String?` | No |  |
| `allowMultipleOrders` | `Boolean?` | Yes |  |
| `appFormTemplateName` | `String?` | Yes |  |
| `contractNeeded` | `Boolean?` | Yes |  |
| `credentialsNeeded` | `Boolean?` | No |  |
| `descriptionKey` | `String?` | Yes |  |
| `nameKey` | `String?` | Yes |  |
| `prescreeningAllowed` | `Boolean?` | Yes |  |
| `productName` | `String?` | Yes |  |
| `responseCode` | `Long?` | Yes |  |
| `responseMessage` | `String?` | Yes |  |
| `terminalTemplateName` | `String?` | Yes |  |
| `vendorName` | `String?` | Yes |  |
| `xmlTemplateFile` | `String?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.outputCreateProduct(null).create(mutableMapOf<String, Any?>(
    "allowMultipleOrders" to true,  // Boolean?
    "appFormTemplateName" to "example_appFormTemplateName",  // String?
    "contractNeeded" to true,  // Boolean?
    "descriptionKey" to "example_descriptionKey",  // String?
    "nameKey" to "example_nameKey",  // String?
    "prescreeningAllowed" to true,  // Boolean?
    "productName" to "example_productName",  // String?
    "responseCode" to 1L,  // Long?
    "responseMessage" to "example_responseMessage",  // String?
    "terminalTemplateName" to "example_terminalTemplateName",  // String?
    "vendorName" to "example_vendorName",  // String?
    "xmlTemplateFile" to "example_xmlTemplateFile"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputCreateProduct` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## OutputDetail

```kotlin
val outputDetail = client.outputDetail(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `batch` | `Map<String, Any?>?` | No |  |
| `lines` | `Map<String, Any?>?` | No |  |
| `progress` | `Map<String, Any?>?` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.outputDetail(null).load(mutableMapOf<String, Any?>("id" to "output_detail_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputDetail` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## OutputList

```kotlin
val outputList = client.outputList(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `items` | `List<Any?>?` | No |  |
| `pagination` | `Map<String, Any?>?` | Yes |  |
| `responseCode` | `Long?` | Yes |  |
| `responseMessage` | `String?` | Yes |  |
| `sorting` | `Map<String, Any?>?` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `items` | - |
| `pagination` | Yes |
| `responseCode` | - |
| `responseMessage` | - |
| `sorting` | - |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.outputList(null).create(mutableMapOf<String, Any?>(
    "pagination" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "responseCode" to 1L,  // Long?
    "responseMessage" to "example_responseMessage"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputList` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## OutputMessage

```kotlin
val outputMessage = client.outputMessage(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `responseCode` | `Long?` | Yes |  |
| `responseMessage` | `String?` | Yes |  |

### Operations

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.outputMessage(null).load(mutableMapOf<String, Any?>("id" to "output_message_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputMessage` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## OutputMoveTid

```kotlin
val outputMoveTid = client.outputMoveTid(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `productOrderUUIDs` | `List<Any?>?` | Yes |  |
| `responseCode` | `Long?` | Yes |  |
| `responseMessage` | `String?` | Yes |  |
| `targetPackageOrderUUID` | `String?` | Yes |  |
| `targetProductOrderUUID` | `String?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.outputMoveTid(null).create(mutableMapOf<String, Any?>(
    "productOrderUUIDs" to listOf<Any?>(),  // List<Any?>?
    "responseCode" to 1L,  // Long?
    "responseMessage" to "example_responseMessage",  // String?
    "targetPackageOrderUUID" to "example_targetPackageOrderUUID",  // String?
    "targetProductOrderUUID" to "example_targetProductOrderUUID"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputMoveTid` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## OutputRemoveProduct

```kotlin
val outputRemoveProduct = client.outputRemoveProduct(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `packageUUID` | `String?` | Yes |  |
| `productUUIDs` | `List<Any?>?` | Yes |  |
| `responseCode` | `Long?` | Yes |  |
| `responseMessage` | `String?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.outputRemoveProduct(null).create(mutableMapOf<String, Any?>(
    "packageUUID" to "example_packageUUID",  // String?
    "productUUIDs" to listOf<Any?>(),  // List<Any?>?
    "responseCode" to 1L,  // Long?
    "responseMessage" to "example_responseMessage"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputRemoveProduct` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## OutputStart

```kotlin
val outputStart = client.outputStart(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `String?` | No |  |
| `responseCode` | `Long?` | Yes |  |
| `responseMessage` | `String?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.outputStart(null).create(mutableMapOf<String, Any?>(
    "responseCode" to 1L,  // Long?
    "responseMessage" to "example_responseMessage"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputStart` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## OutputStatus

```kotlin
val outputStatus = client.outputStatus(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `Long?` | No |  |
| `responseCode` | `Long?` | Yes |  |
| `responseMessage` | `String?` | Yes |  |
| `status` | `String?` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.outputStatus(null).load(mutableMapOf<String, Any?>("id" to "output_status_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputStatus` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## OutputUpdateProduct

```kotlin
val outputUpdateProduct = client.outputUpdateProduct(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `allowMultipleOrders` | `Boolean?` | No |  |
| `appFormName` | `String?` | No |  |
| `contractNeeded` | `Boolean?` | No |  |
| `credentialsNeeded` | `Boolean?` | No |  |
| `descriptionKey` | `String?` | No |  |
| `nameKey` | `String?` | No |  |
| `prescreeningAllowed` | `Boolean?` | No |  |
| `productName` | `String?` | No |  |
| `productStatus` | `String?` | No |  |
| `productUUID` | `String?` | Yes |  |
| `responseCode` | `Long?` | Yes |  |
| `responseMessage` | `String?` | Yes |  |
| `vendorName` | `String?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.outputUpdateProduct(null).create(mutableMapOf<String, Any?>(
    "productUUID" to "example_productUUID",  // String?
    "responseCode" to 1L,  // Long?
    "responseMessage" to "example_responseMessage"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputUpdateProduct` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```kotlin
val feature = mutableMapOf<String, Any?>(
    "test" to mapOf("active" to true),
)
val client = BluefinTecsMerchantPortalSDK(mutableMapOf<String, Any?>("feature" to feature))
```

