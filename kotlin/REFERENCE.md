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
| `product_order_uuid` | `String?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.merchantPortalPamContractController(null).create(mutableMapOf<String, Any?>(
    "language" to "example_language",  // String?
    "product_order_uuid" to "example_product_order_uuid"  // String?
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
| `app_form_field_desc_uuid` | `String?` | Yes |  |
| `package_order_uuid` | `String?` | No |  |
| `product_order_uuid` | `String?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.merchantPortalPamDocumentController(null).create(mutableMapOf<String, Any?>(
    "app_form_field_desc_uuid" to "example_app_form_field_desc_uuid"  // String?
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
| `app_form_fields_desc_uuid` | `String?` | Yes |  |
| `filter` | `Map<String, Any?>?` | No |  |
| `language` | `String?` | Yes |  |
| `package_order` | `Map<String, Any?>?` | No |  |
| `package_order_uuid` | `String?` | Yes |  |
| `package_uuid` | `String?` | No |  |
| `product_order` | `List<Any?>?` | No |  |
| `product_order_uuid` | `String?` | No |  |
| `reason_of_reopening` | `String?` | Yes |  |

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

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.merchantPortalPamFormController(null).create(mutableMapOf<String, Any?>(
    "app_form_fields_desc_uuid" to "example_app_form_fields_desc_uuid",  // String?
    "language" to "example_language",  // String?
    "package_order_uuid" to "example_package_order_uuid",  // String?
    "reason_of_reopening" to "example_reason_of_reopening"  // String?
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
| `client_secret` | `String?` | No |  |
| `mandator_name` | `String?` | Yes |  |
| `notification_email` | `String?` | No |  |
| `package_uuid` | `String?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.merchantPortalPamMandatorController(null).create(mutableMapOf<String, Any?>(
    "mandator_name" to "example_mandator_name",  // String?
    "package_uuid" to "example_package_uuid"  // String?
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
| `business_registration_number` | `String?` | Yes |  |
| `city` | `String?` | No |  |
| `company_name` | `String?` | Yes |  |
| `corporate_uuid` | `String?` | Yes |  |
| `country` | `String?` | No |  |
| `currency` | `String?` | Yes |  |
| `email` | `String?` | Yes |  |
| `language` | `String?` | Yes |  |
| `login` | `String?` | Yes |  |
| `mandator` | `String?` | Yes |  |
| `merchant_category_code` | `String?` | No |  |
| `merchant_contract_number` | `String?` | Yes |  |
| `merchant_name` | `String?` | No |  |
| `package_uuid` | `String?` | No |  |
| `packageorderuuid` | `String?` | Yes |  |
| `phone_number` | `String?` | Yes |  |
| `postal_code` | `String?` | No |  |
| `productid_acquirer` | `String?` | Yes |  |
| `region` | `String?` | No |  |
| `registration_number` | `String?` | No |  |
| `signature` | `String?` | No |  |
| `street` | `String?` | No |  |
| `terminal_id` | `List<Any?>?` | No |  |
| `terminalid_acquirer` | `String?` | No |  |
| `vu_nummer` | `String?` | Yes |  |

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

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.merchantPortalPamMerchantController(null).create(mutableMapOf<String, Any?>(
    "business_registration_number" to "example_business_registration_number",  // String?
    "company_name" to "example_company_name",  // String?
    "corporate_uuid" to "example_corporate_uuid",  // String?
    "currency" to "example_currency",  // String?
    "email" to "example_email",  // String?
    "language" to "example_language",  // String?
    "login" to "example_login",  // String?
    "mandator" to "example_mandator",  // String?
    "merchant_contract_number" to "example_merchant_contract_number",  // String?
    "packageorderuuid" to "example_packageorderuuid",  // String?
    "phone_number" to "example_phone_number",  // String?
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
| `consumer_uuid` | `String?` | No |  |
| `corporate_uuid` | `String?` | No |  |
| `country` | `String?` | No |  |
| `description_key` | `String?` | No |  |
| `filter` | `Map<String, Any?>?` | No |  |
| `language` | `String?` | Yes |  |
| `name_key` | `String?` | No |  |
| `package_status` | `String?` | No |  |
| `package_uuid` | `String?` | Yes |  |
| `pagination` | `Map<String, Any?>?` | No |  |
| `sorting` | `Map<String, Any?>?` | No |  |

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

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.merchantPortalPamPackageController(null).create(mutableMapOf<String, Any?>(
    "language" to "example_language",  // String?
    "package_uuid" to "example_package_uuid"  // String?
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
| `consumer_uuid` | `String?` | No |  |
| `filter` | `Map<String, Any?>?` | No |  |
| `language` | `String?` | No |  |
| `merchant_id` | `String?` | No |  |
| `package_order_uuid` | `String?` | Yes |  |
| `pagination` | `Map<String, Any?>?` | No |  |
| `product_order_uuid` | `String?` | Yes |  |
| `product_uuid` | `String?` | Yes |  |
| `reason_decline` | `String?` | Yes |  |
| `sorting` | `Map<String, Any?>?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.merchantPortalPamProductController(null).create(mutableMapOf<String, Any?>(
    "package_order_uuid" to "example_package_order_uuid",  // String?
    "product_order_uuid" to "example_product_order_uuid",  // String?
    "product_uuid" to "example_product_uuid",  // String?
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
| `package_uuid` | `String?` | Yes |  |
| `product_uui_d` | `List<Any?>?` | Yes |  |
| `response_code` | `Long?` | Yes |  |
| `response_message` | `String?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.outputAddProduct(null).create(mutableMapOf<String, Any?>(
    "package_uuid" to "example_package_uuid",  // String?
    "product_uui_d" to listOf<Any?>(),  // List<Any?>?
    "response_code" to 1L,  // Long?
    "response_message" to "example_response_message"  // String?
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
| `acquirer_id` | `String?` | No |  |
| `allow_multiple_order` | `Boolean?` | Yes |  |
| `app_form_template_name` | `String?` | Yes |  |
| `contract_needed` | `Boolean?` | Yes |  |
| `credentials_needed` | `Boolean?` | No |  |
| `description_key` | `String?` | Yes |  |
| `name_key` | `String?` | Yes |  |
| `prescreening_allowed` | `Boolean?` | Yes |  |
| `product_name` | `String?` | Yes |  |
| `response_code` | `Long?` | Yes |  |
| `response_message` | `String?` | Yes |  |
| `terminal_template_name` | `String?` | Yes |  |
| `vendor_name` | `String?` | Yes |  |
| `xml_template_file` | `String?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.outputCreateProduct(null).create(mutableMapOf<String, Any?>(
    "allow_multiple_order" to true,  // Boolean?
    "app_form_template_name" to "example_app_form_template_name",  // String?
    "contract_needed" to true,  // Boolean?
    "description_key" to "example_description_key",  // String?
    "name_key" to "example_name_key",  // String?
    "prescreening_allowed" to true,  // Boolean?
    "product_name" to "example_product_name",  // String?
    "response_code" to 1L,  // Long?
    "response_message" to "example_response_message",  // String?
    "terminal_template_name" to "example_terminal_template_name",  // String?
    "vendor_name" to "example_vendor_name",  // String?
    "xml_template_file" to "example_xml_template_file"  // String?
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
| `detail` | `Map<String, Any?>?` | No |  |
| `response_code` | `Long?` | Yes |  |
| `response_message` | `String?` | Yes |  |

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
| `item` | `List<Any?>?` | No |  |
| `pagination` | `Map<String, Any?>?` | Yes |  |
| `response_code` | `Long?` | Yes |  |
| `response_message` | `String?` | Yes |  |
| `sorting` | `Map<String, Any?>?` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.outputList(null).create(mutableMapOf<String, Any?>(
    "pagination" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "response_code" to 1L,  // Long?
    "response_message" to "example_response_message"  // String?
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
| `response_code` | `Long?` | Yes |  |
| `response_message` | `String?` | Yes |  |

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
| `product_order_uui_d` | `List<Any?>?` | Yes |  |
| `response_code` | `Long?` | Yes |  |
| `response_message` | `String?` | Yes |  |
| `target_package_order_uuid` | `String?` | Yes |  |
| `target_product_order_uuid` | `String?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.outputMoveTid(null).create(mutableMapOf<String, Any?>(
    "product_order_uui_d" to listOf<Any?>(),  // List<Any?>?
    "response_code" to 1L,  // Long?
    "response_message" to "example_response_message",  // String?
    "target_package_order_uuid" to "example_target_package_order_uuid",  // String?
    "target_product_order_uuid" to "example_target_product_order_uuid"  // String?
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
| `package_uuid` | `String?` | Yes |  |
| `product_uui_d` | `List<Any?>?` | Yes |  |
| `response_code` | `Long?` | Yes |  |
| `response_message` | `String?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.outputRemoveProduct(null).create(mutableMapOf<String, Any?>(
    "package_uuid" to "example_package_uuid",  // String?
    "product_uui_d" to listOf<Any?>(),  // List<Any?>?
    "response_code" to 1L,  // Long?
    "response_message" to "example_response_message"  // String?
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
| `response_code` | `Long?` | Yes |  |
| `response_message` | `String?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.outputStart(null).create(mutableMapOf<String, Any?>(
    "response_code" to 1L,  // Long?
    "response_message" to "example_response_message"  // String?
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
| `response_code` | `Long?` | Yes |  |
| `response_message` | `String?` | Yes |  |
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
| `allow_multiple_order` | `Boolean?` | No |  |
| `app_form_name` | `String?` | No |  |
| `contract_needed` | `Boolean?` | No |  |
| `credentials_needed` | `Boolean?` | No |  |
| `description_key` | `String?` | No |  |
| `name_key` | `String?` | No |  |
| `prescreening_allowed` | `Boolean?` | No |  |
| `product_name` | `String?` | No |  |
| `product_status` | `String?` | No |  |
| `product_uuid` | `String?` | Yes |  |
| `response_code` | `Long?` | Yes |  |
| `response_message` | `String?` | Yes |  |
| `vendor_name` | `String?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.outputUpdateProduct(null).create(mutableMapOf<String, Any?>(
    "product_uuid" to "example_product_uuid",  // String?
    "response_code" to 1L,  // Long?
    "response_message" to "example_response_message"  // String?
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

