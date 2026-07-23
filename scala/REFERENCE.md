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
| `account_number` | `java.lang.Long` | No |  |
| `additional_data` | `java.util.Map[String, Object]` | No |  |
| `business_reg_number` | `String` | Yes |  |
| `city` | `String` | Yes |  |
| `corporateuuid` | `String` | No |  |
| `country` | `String` | Yes |  |
| `currency` | `String` | Yes |  |
| `merchant_category_code` | `java.lang.Long` | Yes |  |
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
| `sorting_code` | `java.lang.Long` | No |  |
| `state` | `String` | No |  |
| `street` | `String` | Yes |  |
| `terminal_country_code` | `String` | Yes |  |
| `terminal_language_code` | `String` | Yes |  |
| `terminal_location` | `String` | Yes |  |
| `terminal_serial_number` | `String` | Yes |  |
| `terminalid` | `java.lang.Long` | Yes |  |
| `terminalid_acquirer` | `String` | No |  |
| `user_email` | `String` | No |  |
| `user_phone_number` | `String` | No |  |
| `username` | `String` | No |  |
| `vu_nummer` | `String` | Yes |  |
| `web_shop_url` | `String` | No |  |
| `zipcode` | `String` | Yes |  |

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
| `product_order_uuid` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.merchantPortalPamContractController(null).create(java.util.Map.of(
    "language", "example_language",  // String
    "product_order_uuid", "example_product_order_uuid"  // String
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
| `app_form_field_desc_uuid` | `String` | Yes |  |
| `package_order_uuid` | `String` | No |  |
| `product_order_uuid` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.merchantPortalPamDocumentController(null).create(java.util.Map.of(
    "app_form_field_desc_uuid", "example_app_form_field_desc_uuid"  // String
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
| `app_form_fields_desc_uuid` | `String` | Yes |  |
| `filter` | `java.util.Map[String, Object]` | No |  |
| `language` | `String` | Yes |  |
| `package_order` | `java.util.Map[String, Object]` | No |  |
| `package_order_uuid` | `String` | Yes |  |
| `package_uuid` | `String` | No |  |
| `product_order` | `java.util.List[Object]` | No |  |
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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.merchantPortalPamFormController(null).create(java.util.Map.of(
    "app_form_fields_desc_uuid", "example_app_form_fields_desc_uuid",  // String
    "language", "example_language",  // String
    "package_order_uuid", "example_package_order_uuid",  // String
    "reason_of_reopening", "example_reason_of_reopening"  // String
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
| `client_secret` | `String` | No |  |
| `mandator_name` | `String` | Yes |  |
| `notification_email` | `String` | No |  |
| `package_uuid` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.merchantPortalPamMandatorController(null).create(java.util.Map.of(
    "mandator_name", "example_mandator_name",  // String
    "package_uuid", "example_package_uuid"  // String
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
| `additional_data` | `java.util.Map[String, Object]` | No |  |
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
| `terminal_id` | `java.util.List[Object]` | No |  |
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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.merchantPortalPamMerchantController(null).create(java.util.Map.of(
    "business_registration_number", "example_business_registration_number",  // String
    "company_name", "example_company_name",  // String
    "corporate_uuid", "example_corporate_uuid",  // String
    "currency", "example_currency",  // String
    "email", "example_email",  // String
    "language", "example_language",  // String
    "login", "example_login",  // String
    "mandator", "example_mandator",  // String
    "merchant_contract_number", "example_merchant_contract_number",  // String
    "packageorderuuid", "example_packageorderuuid",  // String
    "phone_number", "example_phone_number",  // String
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
| `consumer_uuid` | `String` | No |  |
| `corporate_uuid` | `String` | No |  |
| `country` | `String` | No |  |
| `description_key` | `String` | No |  |
| `filter` | `java.util.Map[String, Object]` | No |  |
| `language` | `String` | Yes |  |
| `name_key` | `String` | No |  |
| `package_status` | `String` | No |  |
| `package_uuid` | `String` | Yes |  |
| `pagination` | `java.util.Map[String, Object]` | No |  |
| `sorting` | `java.util.Map[String, Object]` | No |  |

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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.merchantPortalPamPackageController(null).create(java.util.Map.of(
    "language", "example_language",  // String
    "package_uuid", "example_package_uuid"  // String
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
| `consumer_uuid` | `String` | No |  |
| `filter` | `java.util.Map[String, Object]` | No |  |
| `language` | `String` | No |  |
| `merchant_id` | `String` | No |  |
| `package_order_uuid` | `String` | Yes |  |
| `pagination` | `java.util.Map[String, Object]` | No |  |
| `product_order_uuid` | `String` | Yes |  |
| `product_uuid` | `String` | Yes |  |
| `reason_decline` | `String` | Yes |  |
| `sorting` | `java.util.Map[String, Object]` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.merchantPortalPamProductController(null).create(java.util.Map.of(
    "package_order_uuid", "example_package_order_uuid",  // String
    "product_order_uuid", "example_product_order_uuid",  // String
    "product_uuid", "example_product_uuid",  // String
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
| `package_uuid` | `String` | Yes |  |
| `product_uui_d` | `java.util.List[Object]` | Yes |  |
| `response_code` | `java.lang.Long` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.outputAddProduct(null).create(java.util.Map.of(
    "package_uuid", "example_package_uuid",  // String
    "product_uui_d", java.util.List.of(),  // java.util.List[Object]
    "response_code", 1L,  // java.lang.Long
    "response_message", "example_response_message"  // String
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
| `acquirer_id` | `String` | No |  |
| `allow_multiple_order` | `java.lang.Boolean` | Yes |  |
| `app_form_template_name` | `String` | Yes |  |
| `contract_needed` | `java.lang.Boolean` | Yes |  |
| `credentials_needed` | `java.lang.Boolean` | No |  |
| `description_key` | `String` | Yes |  |
| `name_key` | `String` | Yes |  |
| `prescreening_allowed` | `java.lang.Boolean` | Yes |  |
| `product_name` | `String` | Yes |  |
| `response_code` | `java.lang.Long` | Yes |  |
| `response_message` | `String` | Yes |  |
| `terminal_template_name` | `String` | Yes |  |
| `vendor_name` | `String` | Yes |  |
| `xml_template_file` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.outputCreateProduct(null).create(java.util.Map.of(
    "allow_multiple_order", true,  // java.lang.Boolean
    "app_form_template_name", "example_app_form_template_name",  // String
    "contract_needed", true,  // java.lang.Boolean
    "description_key", "example_description_key",  // String
    "name_key", "example_name_key",  // String
    "prescreening_allowed", true,  // java.lang.Boolean
    "product_name", "example_product_name",  // String
    "response_code", 1L,  // java.lang.Long
    "response_message", "example_response_message",  // String
    "terminal_template_name", "example_terminal_template_name",  // String
    "vendor_name", "example_vendor_name",  // String
    "xml_template_file", "example_xml_template_file"  // String
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
| `detail` | `java.util.Map[String, Object]` | No |  |
| `response_code` | `java.lang.Long` | Yes |  |
| `response_message` | `String` | Yes |  |

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
| `item` | `java.util.List[Object]` | No |  |
| `pagination` | `java.util.Map[String, Object]` | Yes |  |
| `response_code` | `java.lang.Long` | Yes |  |
| `response_message` | `String` | Yes |  |
| `sorting` | `java.util.Map[String, Object]` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.outputList(null).create(java.util.Map.of(
    "pagination", java.util.Map.of(),  // java.util.Map[String, Object]
    "response_code", 1L,  // java.lang.Long
    "response_message", "example_response_message"  // String
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
| `response_code` | `java.lang.Long` | Yes |  |
| `response_message` | `String` | Yes |  |

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
| `product_order_uui_d` | `java.util.List[Object]` | Yes |  |
| `response_code` | `java.lang.Long` | Yes |  |
| `response_message` | `String` | Yes |  |
| `target_package_order_uuid` | `String` | Yes |  |
| `target_product_order_uuid` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.outputMoveTid(null).create(java.util.Map.of(
    "product_order_uui_d", java.util.List.of(),  // java.util.List[Object]
    "response_code", 1L,  // java.lang.Long
    "response_message", "example_response_message",  // String
    "target_package_order_uuid", "example_target_package_order_uuid",  // String
    "target_product_order_uuid", "example_target_product_order_uuid"  // String
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
| `package_uuid` | `String` | Yes |  |
| `product_uui_d` | `java.util.List[Object]` | Yes |  |
| `response_code` | `java.lang.Long` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.outputRemoveProduct(null).create(java.util.Map.of(
    "package_uuid", "example_package_uuid",  // String
    "product_uui_d", java.util.List.of(),  // java.util.List[Object]
    "response_code", 1L,  // java.lang.Long
    "response_message", "example_response_message"  // String
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
| `response_code` | `java.lang.Long` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.outputStart(null).create(java.util.Map.of(
    "response_code", 1L,  // java.lang.Long
    "response_message", "example_response_message"  // String
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
| `response_code` | `java.lang.Long` | Yes |  |
| `response_message` | `String` | Yes |  |
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
| `allow_multiple_order` | `java.lang.Boolean` | No |  |
| `app_form_name` | `String` | No |  |
| `contract_needed` | `java.lang.Boolean` | No |  |
| `credentials_needed` | `java.lang.Boolean` | No |  |
| `description_key` | `String` | No |  |
| `name_key` | `String` | No |  |
| `prescreening_allowed` | `java.lang.Boolean` | No |  |
| `product_name` | `String` | No |  |
| `product_status` | `String` | No |  |
| `product_uuid` | `String` | Yes |  |
| `response_code` | `java.lang.Long` | Yes |  |
| `response_message` | `String` | Yes |  |
| `vendor_name` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.outputUpdateProduct(null).create(java.util.Map.of(
    "product_uuid", "example_product_uuid",  // String
    "response_code", 1L,  // java.lang.Long
    "response_message", "example_response_message"  // String
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

