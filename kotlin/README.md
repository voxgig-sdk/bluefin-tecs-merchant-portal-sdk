# BluefinTecsMerchantPortal Kotlin SDK



The Kotlin SDK for the BluefinTecsMerchantPortal API — an entity-oriented client following idiomatic Kotlin conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.merchantPortalApiController(null)` — each
carrying a small, uniform set of operations (`load`, `create`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Maven Central. Install it from the GitHub
release tag (`kotlin/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases)) or
from a source checkout — build the library with Gradle:

```bash
cd kotlin && gradle build
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```kotlin
import voxgig.bluefintecsmerchantportalsdk.core.BluefinTecsMerchantPortalSDK

val client = BluefinTecsMerchantPortalSDK()
```

### 4. Create, update, and remove

```kotlin
// Create — returns the ENTITY (call data() for the record)
val created = client.merchantPortalApiController(null).create(mutableMapOf<String, Any?>("business_reg_number" to "example_business_reg_number", "city" to "example_city", "country" to "example_country", "currency" to "example_currency", "merchant_category_code" to 1L, "merchant_name" to "example_merchant_name", "packageid" to "example_packageid", "packageorderuuid" to "example_packageorderuuid", "reason_deactivation" to "example_reason_deactivation", "reason_reactivation" to "example_reason_reactivation", "street" to "example_street", "terminal_country_code" to "example_terminal_country_code", "terminal_language_code" to "example_terminal_language_code", "terminal_location" to "example_terminal_location", "terminal_serial_number" to "example_terminal_serial_number", "terminalid" to 1L, "vu_nummer" to "example_vu_nummer", "zipcode" to "example_zipcode"), null)

```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const outputdetail = await client.OutputDetail().load({ id: "example_id" })
  console.log(outputdetail)
} catch (err) {
  console.error('load failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```kotlin
val result = client.direct(mutableMapOf<String, Any?>(
    "path" to "/api/resource/{id}",
    "method" to "GET",
    "params" to mapOf("id" to "example")))

if (result["ok"] == true) {
    println(result["status"])  // 200
    println(result["data"])    // response body
}
else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // an absent key simply reads as null.
    println("" + result["status"] + " " + result["err"])
}
```

### Prepare a request without sending it

```kotlin
// prepare() returns the fetch definition and raises on error.
val fetchdef = client.prepare(mutableMapOf<String, Any?>(
    "path" to "/api/resource/{id}",
    "method" to "DELETE",
    "params" to mapOf("id" to "example")))

println(fetchdef["url"])
println(fetchdef["method"])
println(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```kotlin
val client = BluefinTecsMerchantPortalSDK.testSDK(null, null)

// Entity ops return the ENTITY and raises on error;
// call data() for the record.
val outputDetail = client.outputDetail(null).load(mutableMapOf<String, Any?>("id" to "test01"), null)
// outputDetail holds the mock response record
println(outputDetail)
```

### Use a custom fetch function

Replace the HTTP transport with your own `BiFunction`:

```kotlin
val mockFetch = java.util.function.BiFunction<String, MutableMap<String, Any?>, Any?> { url, init ->
    mutableMapOf<String, Any?>(
        "status" to 200,
        "statusText" to "OK",
        "headers" to mutableMapOf<String, Any?>(),
        "json" to java.util.function.Supplier<Any?> { mapOf("id" to "mock01") },
    )
}

val client = BluefinTecsMerchantPortalSDK(mutableMapOf<String, Any?>(
    "base" to "http://localhost:8080",
    "system" to mapOf("fetch" to mockFetch),
))
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run:

```bash
cd kotlin && gradle test
```


## Reference

### BluefinTecsMerchantPortalSDK

```kotlin
val client = BluefinTecsMerchantPortalSDK(options)
```

Creates a new SDK client. `options` is a `MutableMap<String, Any?>`.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Map` | Feature activation flags. |
| `extend` | `List` | Additional Feature instances to load. |
| `system` | `Map` | System overrides (e.g. custom `fetch` function). |

### testSDK

```kotlin
val client = BluefinTecsMerchantPortalSDK.testSDK(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinTecsMerchantPortalSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `optionsMap` | `() -> MutableMap` | Deep copy of current SDK options. |
| `getUtility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> MutableMap` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> MutableMap` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `merchantPortalApiController` | `(entopts) -> SdkEntity` | Create a MerchantPortalApiController entity instance. |
| `merchantPortalCommonController` | `(entopts) -> SdkEntity` | Create a MerchantPortalCommonController entity instance. |
| `merchantPortalPamContractController` | `(entopts) -> SdkEntity` | Create a MerchantPortalPamContractController entity instance. |
| `merchantPortalPamDocumentController` | `(entopts) -> SdkEntity` | Create a MerchantPortalPamDocumentController entity instance. |
| `merchantPortalPamFormController` | `(entopts) -> SdkEntity` | Create a MerchantPortalPamFormController entity instance. |
| `merchantPortalPamMandatorController` | `(entopts) -> SdkEntity` | Create a MerchantPortalPamMandatorController entity instance. |
| `merchantPortalPamMerchantController` | `(entopts) -> SdkEntity` | Create a MerchantPortalPamMerchantController entity instance. |
| `merchantPortalPamPackageController` | `(entopts) -> SdkEntity` | Create a MerchantPortalPamPackageController entity instance. |
| `merchantPortalPamProductController` | `(entopts) -> SdkEntity` | Create a MerchantPortalPamProductController entity instance. |
| `outputAddProduct` | `(entopts) -> SdkEntity` | Create an OutputAddProduct entity instance. |
| `outputCreateProduct` | `(entopts) -> SdkEntity` | Create an OutputCreateProduct entity instance. |
| `outputDetail` | `(entopts) -> SdkEntity` | Create an OutputDetail entity instance. |
| `outputList` | `(entopts) -> SdkEntity` | Create an OutputList entity instance. |
| `outputMessage` | `(entopts) -> SdkEntity` | Create an OutputMessage entity instance. |
| `outputMoveTid` | `(entopts) -> SdkEntity` | Create an OutputMoveTid entity instance. |
| `outputRemoveProduct` | `(entopts) -> SdkEntity` | Create an OutputRemoveProduct entity instance. |
| `outputStart` | `(entopts) -> SdkEntity` | Create an OutputStart entity instance. |
| `outputStatus` | `(entopts) -> SdkEntity` | Create an OutputStatus entity instance. |
| `outputUpdateProduct` | `(entopts) -> SdkEntity` | Create an OutputUpdateProduct entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> Any?` | Load a single entity by match criteria. Raises on error. |
| `create` | `(reqdata, ctrl) -> Any?` | Create a new entity. Raises on error. |
| `data` | `(vararg newdata) -> Any?` | Get or set entity data. |
| `match` | `(vararg newmatch) -> Any?` | Get or set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `name` | `val: String` | The entity name. |

### Result shape

Entity operations return the ENTITY (call data() for the record) (a `Map` for single-entity
ops, an aggregate `List` for `list`) as `Any?` and raise on error. Wrap
calls in `try`/`catch` to handle failures.

The `direct()` escape hatch never raises — it returns a result
`MutableMap<String, Any?>` you branch on via `result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Int` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `Any?` | Parsed JSON response body. |

On error, `ok` is `false` and `err` contains the error value.

### Entities

#### MerchantPortalApiController

| Field | Description |
| --- | --- |
| `account_number` | Account number provided by the acquirer. |
| `additional_data` | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | Merchant business registration number as stated in the company registry. |
| `city` | Merchant's address: city. |
| `corporateuuid` | Unique identifier for the corporate entity (UUID format). |
| `country` | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | Merchant category code as defined by the payment network. |
| `merchant_email` | Merchant's email address for receiving notifications. |
| `merchant_name` | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | Merchant's phone number for notifications. |
| `packageid` | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | Merchant password for MPOS. |
| `productid` | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | Reason for terminal deactivation. |
| `reason_reactivation` | Reason for terminal reactivation. |
| `sorting_code` | Sorting code provided by the acquirer. |
| `state` | Merchant's address: state. |
| `street` | Merchant's address: street and house number. |
| `terminal_country_code` | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | Physical or logical location of the terminal. |
| `terminal_serial_number` | Terminal serial number. |
| `terminalid` | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | Terminal ID as set by the acquirer (optional). |
| `user_email` | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | Phone number of the user acting on behalf of the merchant. |
| `username` | Merchant username for MPOS. |
| `vu_nummer` | Merchant contract number with the acquirer. |
| `web_shop_url` | URL of the merchant's web shop. |
| `zipcode` | Merchant's address: postal code. |

Operations: create.

API path: `/merchantportalws/deactivateTerminal`

#### MerchantPortalCommonController

| Field | Description |
| --- | --- |

Operations: load.

API path: `/merchantportalws/logDeveloperInfo`

#### MerchantPortalPamContractController

| Field | Description |
| --- | --- |
| `language` |  |
| `productOrderUUID` |  |

Operations: create.

API path: `/merchantportalws/generateContract`

#### MerchantPortalPamDocumentController

| Field | Description |
| --- | --- |
| `appFormFieldDescUUID` |  |
| `packageOrderUUID` | UUID of the package order. |
| `productOrderUUID` | UUID of the product order. |

Operations: create.

API path: `/merchantportalws/documentsList`

#### MerchantPortalPamFormController

| Field | Description |
| --- | --- |
| `appFormFieldsDescUUID` |  |
| `filter` |  |
| `language` |  |
| `packageOrder` |  |
| `packageOrderUUID` | UUID of the package order. |
| `packageUUID` |  |
| `productOrderUUID` | UUID of the product order. |
| `productOrders` |  |
| `reasonOfReopening` |  |

Operations: create.

API path: `/merchantportalws/applicationForm`

#### MerchantPortalPamMandatorController

| Field | Description |
| --- | --- |
| `clientSecret` |  |
| `mandatorName` |  |
| `notificationEmail` |  |
| `packageUUID` |  |

Operations: create.

API path: `/merchantportalws/createMandatorConfig`

#### MerchantPortalPamMerchantController

| Field | Description |
| --- | --- |
| `additional_data` | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` |  |
| `city` | City where the merchant is located. |
| `companyName` |  |
| `corporateUUID` | Unique identifier for the corporate entity. |
| `country` | Country where the merchant is located. |
| `currency` | Transaction currency in ISO 4217 format. |
| `email` |  |
| `language` |  |
| `login` |  |
| `mandator` | Mandator name assigned by TECS. |
| `merchantContractNumber` | Unique identifier for the merchant within a specific system. |
| `merchantName` | Name of the merchant. |
| `merchant_category_code` | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | UUID of the package. |
| `packageorderuuid` | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` |  |
| `postalCode` | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | Identifier of the product for which acquiring is to be enabled. |
| `region` | State or province where the merchant is located. |
| `registrationNumber` | Business registration number. |
| `signature` | Signature value = saltAsHex-hashAsHex. |
| `street` | Street address of the merchant. |
| `terminalIds` | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | Merchant contract number with the acquirer. |

Operations: create.

API path: `/merchantportalws/contractNumber`

#### MerchantPortalPamPackageController

| Field | Description |
| --- | --- |
| `consumerUUID` |  |
| `corporateUUID` |  |
| `country` | Country associated with the package. |
| `descriptionKey` | Key for the description of the package. |
| `filter` |  |
| `language` |  |
| `nameKey` | Key for the name of the package. |
| `packageStatus` | Status of the package. |
| `packageUUID` | Unique identifier for the package. |
| `pagination` |  |
| `sorting` |  |

Operations: create.

API path: `/merchantportalws/availablePackages`

#### MerchantPortalPamProductController

| Field | Description |
| --- | --- |
| `consumerUUID` |  |
| `filter` |  |
| `language` |  |
| `merchantID` |  |
| `packageOrderUUID` |  |
| `pagination` |  |
| `productOrderUUID` |  |
| `productUUID` |  |
| `reason_decline` | Reason for product decline. |
| `sorting` |  |

Operations: create.

API path: `/merchantportalws/approveProduct`

#### OutputAddProduct

| Field | Description |
| --- | --- |
| `packageUUID` | Unique identifier for the package. |
| `productUUIDs` | The list of unique identifiers of the products. |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: create.

API path: `/merchantportalws/addProductsToPackage`

#### OutputCreateProduct

| Field | Description |
| --- | --- |
| `acquirerId` | Unique identifier for the acquirer. |
| `allowMultipleOrders` | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | Name of the application form template. |
| `contractNeeded` | Indication whether contract is needed or not. |
| `credentialsNeeded` | Indication whether credentials are needed or not. |
| `descriptionKey` | Key indicator for product description. |
| `nameKey` | Key indicator for product name. |
| `prescreeningAllowed` | Indication whether prescreening is allowed or not. |
| `productName` | Name of the product. |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `terminalTemplateName` | Name of the terminal template. |
| `vendorName` | Name of the vendor. |
| `xmlTemplateFile` | A string value containing the XML template file encoded in Base64. |

Operations: create.

API path: `/merchantportalws/createNewProduct`

#### OutputDetail

| Field | Description |
| --- | --- |
| `batch` |  |
| `lines` |  |
| `progress` |  |

Operations: load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/details/{id}`

#### OutputList

| Field | Description |
| --- | --- |
| `items` |  |
| `pagination` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `sorting` |  |

Operations: create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/list`

#### OutputMessage

| Field | Description |
| --- | --- |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/restart/{id}`

#### OutputMoveTid

| Field | Description |
| --- | --- |
| `productOrderUUIDs` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `targetPackageOrderUUID` |  |
| `targetProductOrderUUID` |  |

Operations: create.

API path: `/merchantportalws/moveTid`

#### OutputRemoveProduct

| Field | Description |
| --- | --- |
| `packageUUID` | Unique identifier for the package. |
| `productUUIDs` | List of product unique identifiers. |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: create.

API path: `/merchantportalws/removeProductsFromPackage`

#### OutputStart

| Field | Description |
| --- | --- |
| `id` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/start`

#### OutputStatus

| Field | Description |
| --- | --- |
| `percentage` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `status` |  |

Operations: load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/status/{id}`

#### OutputUpdateProduct

| Field | Description |
| --- | --- |
| `allowMultipleOrders` | An attribute to indicate if multiple orders are allowed |
| `appFormName` | The name of the application form |
| `contractNeeded` | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | An attribute to indicate if credentials are needed |
| `descriptionKey` | The description of the product |
| `nameKey` | The key of the product name |
| `prescreeningAllowed` | An attribute to indicate if prescreening is allowed |
| `productName` | The name of the product |
| `productStatus` | The status of the product |
| `productUUID` | The UUID of the product to update |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `vendorName` | The name of the vendor |

Operations: create.

API path: `/merchantportalws/updateProduct`



## Entities


### MerchantPortalApiController

Create an instance: `val merchantPortalApiController = client.merchantPortalApiController(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `Long?` | Account number provided by the acquirer. |
| `additional_data` | `Map<String, Any?>?` | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `String?` | Merchant business registration number as stated in the company registry. |
| `city` | `String?` | Merchant's address: city. |
| `corporateuuid` | `String?` | Unique identifier for the corporate entity (UUID format). |
| `country` | `String?` | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `String?` | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `Long?` | Merchant category code as defined by the payment network. |
| `merchant_email` | `String?` | Merchant's email address for receiving notifications. |
| `merchant_name` | `String?` | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | `String?` | Merchant's phone number for notifications. |
| `packageid` | `String?` | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | `String?` | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | `String?` | Merchant password for MPOS. |
| `productid` | `String?` | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | `String?` | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | `String?` | Reason for terminal deactivation. |
| `reason_reactivation` | `String?` | Reason for terminal reactivation. |
| `sorting_code` | `Long?` | Sorting code provided by the acquirer. |
| `state` | `String?` | Merchant's address: state. |
| `street` | `String?` | Merchant's address: street and house number. |
| `terminal_country_code` | `String?` | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `String?` | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `String?` | Physical or logical location of the terminal. |
| `terminal_serial_number` | `String?` | Terminal serial number. |
| `terminalid` | `Long?` | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `String?` | Terminal ID as set by the acquirer (optional). |
| `user_email` | `String?` | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `String?` | Phone number of the user acting on behalf of the merchant. |
| `username` | `String?` | Merchant username for MPOS. |
| `vu_nummer` | `String?` | Merchant contract number with the acquirer. |
| `web_shop_url` | `String?` | URL of the merchant's web shop. |
| `zipcode` | `String?` | Merchant's address: postal code. |

#### Example: Create

```kotlin
val merchantPortalApiController = client.merchantPortalApiController(null).create(mutableMapOf<String, Any?>(
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


### MerchantPortalCommonController

Create an instance: `val merchantPortalCommonController = client.merchantPortalCommonController(null)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Example: Load

```kotlin
val merchantPortalCommonController = client.merchantPortalCommonController(null).load(null, null)
```


### MerchantPortalPamContractController

Create an instance: `val merchantPortalPamContractController = client.merchantPortalPamContractController(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `String?` |  |
| `productOrderUUID` | `String?` |  |

#### Example: Create

```kotlin
val merchantPortalPamContractController = client.merchantPortalPamContractController(null).create(mutableMapOf<String, Any?>(
    "language" to "example_language",  // String?
    "productOrderUUID" to "example_productOrderUUID"  // String?
), null)
```


### MerchantPortalPamDocumentController

Create an instance: `val merchantPortalPamDocumentController = client.merchantPortalPamDocumentController(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldDescUUID` | `String?` |  |
| `packageOrderUUID` | `String?` | UUID of the package order. |
| `productOrderUUID` | `String?` | UUID of the product order. |

#### Example: Create

```kotlin
val merchantPortalPamDocumentController = client.merchantPortalPamDocumentController(null).create(mutableMapOf<String, Any?>(
    "appFormFieldDescUUID" to "example_appFormFieldDescUUID"  // String?
), null)
```


### MerchantPortalPamFormController

Create an instance: `val merchantPortalPamFormController = client.merchantPortalPamFormController(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldsDescUUID` | `String?` |  |
| `filter` | `Map<String, Any?>?` |  |
| `language` | `String?` |  |
| `packageOrder` | `Map<String, Any?>?` |  |
| `packageOrderUUID` | `String?` | UUID of the package order. |
| `packageUUID` | `String?` |  |
| `productOrderUUID` | `String?` | UUID of the product order. |
| `productOrders` | `List<Any?>?` |  |
| `reasonOfReopening` | `String?` |  |

#### Example: Create

```kotlin
val merchantPortalPamFormController = client.merchantPortalPamFormController(null).create(mutableMapOf<String, Any?>(
    "appFormFieldsDescUUID" to "example_appFormFieldsDescUUID",  // String?
    "language" to "example_language",  // String?
    "packageOrderUUID" to "example_packageOrderUUID",  // String?
    "reasonOfReopening" to "example_reasonOfReopening"  // String?
), null)
```


### MerchantPortalPamMandatorController

Create an instance: `val merchantPortalPamMandatorController = client.merchantPortalPamMandatorController(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `clientSecret` | `String?` |  |
| `mandatorName` | `String?` |  |
| `notificationEmail` | `String?` |  |
| `packageUUID` | `String?` |  |

#### Example: Create

```kotlin
val merchantPortalPamMandatorController = client.merchantPortalPamMandatorController(null).create(mutableMapOf<String, Any?>(
    "mandatorName" to "example_mandatorName",  // String?
    "packageUUID" to "example_packageUUID"  // String?
), null)
```


### MerchantPortalPamMerchantController

Create an instance: `val merchantPortalPamMerchantController = client.merchantPortalPamMerchantController(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `Map<String, Any?>?` | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` | `String?` |  |
| `city` | `String?` | City where the merchant is located. |
| `companyName` | `String?` |  |
| `corporateUUID` | `String?` | Unique identifier for the corporate entity. |
| `country` | `String?` | Country where the merchant is located. |
| `currency` | `String?` | Transaction currency in ISO 4217 format. |
| `email` | `String?` |  |
| `language` | `String?` |  |
| `login` | `String?` |  |
| `mandator` | `String?` | Mandator name assigned by TECS. |
| `merchantContractNumber` | `String?` | Unique identifier for the merchant within a specific system. |
| `merchantName` | `String?` | Name of the merchant. |
| `merchant_category_code` | `String?` | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | `String?` | UUID of the package. |
| `packageorderuuid` | `String?` | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` | `String?` |  |
| `postalCode` | `String?` | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | `String?` | Identifier of the product for which acquiring is to be enabled. |
| `region` | `String?` | State or province where the merchant is located. |
| `registrationNumber` | `String?` | Business registration number. |
| `signature` | `String?` | Signature value = saltAsHex-hashAsHex. |
| `street` | `String?` | Street address of the merchant. |
| `terminalIds` | `List<Any?>?` | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `String?` | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `String?` | Merchant contract number with the acquirer. |

#### Example: Create

```kotlin
val merchantPortalPamMerchantController = client.merchantPortalPamMerchantController(null).create(mutableMapOf<String, Any?>(
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


### MerchantPortalPamPackageController

Create an instance: `val merchantPortalPamPackageController = client.merchantPortalPamPackageController(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `String?` |  |
| `corporateUUID` | `String?` |  |
| `country` | `String?` | Country associated with the package. |
| `descriptionKey` | `String?` | Key for the description of the package. |
| `filter` | `Map<String, Any?>?` |  |
| `language` | `String?` |  |
| `nameKey` | `String?` | Key for the name of the package. |
| `packageStatus` | `String?` | Status of the package. |
| `packageUUID` | `String?` | Unique identifier for the package. |
| `pagination` | `Map<String, Any?>?` |  |
| `sorting` | `Map<String, Any?>?` |  |

#### Example: Create

```kotlin
val merchantPortalPamPackageController = client.merchantPortalPamPackageController(null).create(mutableMapOf<String, Any?>(
    "language" to "example_language",  // String?
    "packageUUID" to "example_packageUUID"  // String?
), null)
```


### MerchantPortalPamProductController

Create an instance: `val merchantPortalPamProductController = client.merchantPortalPamProductController(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `String?` |  |
| `filter` | `Map<String, Any?>?` |  |
| `language` | `String?` |  |
| `merchantID` | `String?` |  |
| `packageOrderUUID` | `String?` |  |
| `pagination` | `Map<String, Any?>?` |  |
| `productOrderUUID` | `String?` |  |
| `productUUID` | `String?` |  |
| `reason_decline` | `String?` | Reason for product decline. |
| `sorting` | `Map<String, Any?>?` |  |

#### Example: Create

```kotlin
val merchantPortalPamProductController = client.merchantPortalPamProductController(null).create(mutableMapOf<String, Any?>(
    "packageOrderUUID" to "example_packageOrderUUID",  // String?
    "productOrderUUID" to "example_productOrderUUID",  // String?
    "productUUID" to "example_productUUID",  // String?
    "reason_decline" to "example_reason_decline"  // String?
), null)
```


### OutputAddProduct

Create an instance: `val outputAddProduct = client.outputAddProduct(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `String?` | Unique identifier for the package. |
| `productUUIDs` | `List<Any?>?` | The list of unique identifiers of the products. |
| `responseCode` | `Long?` | Response code. |
| `responseMessage` | `String?` | Response message. |

#### Example: Create

```kotlin
val outputAddProduct = client.outputAddProduct(null).create(mutableMapOf<String, Any?>(
    "packageUUID" to "example_packageUUID",  // String?
    "productUUIDs" to listOf<Any?>(),  // List<Any?>?
    "responseCode" to 1L,  // Long?
    "responseMessage" to "example_responseMessage"  // String?
), null)
```


### OutputCreateProduct

Create an instance: `val outputCreateProduct = client.outputCreateProduct(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirerId` | `String?` | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `Boolean?` | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `String?` | Name of the application form template. |
| `contractNeeded` | `Boolean?` | Indication whether contract is needed or not. |
| `credentialsNeeded` | `Boolean?` | Indication whether credentials are needed or not. |
| `descriptionKey` | `String?` | Key indicator for product description. |
| `nameKey` | `String?` | Key indicator for product name. |
| `prescreeningAllowed` | `Boolean?` | Indication whether prescreening is allowed or not. |
| `productName` | `String?` | Name of the product. |
| `responseCode` | `Long?` | Response code. |
| `responseMessage` | `String?` | Response message. |
| `terminalTemplateName` | `String?` | Name of the terminal template. |
| `vendorName` | `String?` | Name of the vendor. |
| `xmlTemplateFile` | `String?` | A string value containing the XML template file encoded in Base64. |

#### Example: Create

```kotlin
val outputCreateProduct = client.outputCreateProduct(null).create(mutableMapOf<String, Any?>(
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


### OutputDetail

Create an instance: `val outputDetail = client.outputDetail(null)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `batch` | `Map<String, Any?>?` |  |
| `lines` | `Map<String, Any?>?` |  |
| `progress` | `Map<String, Any?>?` |  |

#### Example: Load

```kotlin
val outputDetail = client.outputDetail(null).load(mutableMapOf<String, Any?>("id" to "output_detail_id"), null)
```


### OutputList

Create an instance: `val outputList = client.outputList(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `items` | `List<Any?>?` |  |
| `pagination` | `Map<String, Any?>?` |  |
| `responseCode` | `Long?` | Response code. |
| `responseMessage` | `String?` | Response message. |
| `sorting` | `Map<String, Any?>?` |  |

#### Example: Create

```kotlin
val outputList = client.outputList(null).create(mutableMapOf<String, Any?>(
    "pagination" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "responseCode" to 1L,  // Long?
    "responseMessage" to "example_responseMessage"  // String?
), null)
```


### OutputMessage

Create an instance: `val outputMessage = client.outputMessage(null)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `responseCode` | `Long?` | Response code. |
| `responseMessage` | `String?` | Response message. |

#### Example: Load

```kotlin
val outputMessage = client.outputMessage(null).load(mutableMapOf<String, Any?>("id" to "output_message_id"), null)
```


### OutputMoveTid

Create an instance: `val outputMoveTid = client.outputMoveTid(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `productOrderUUIDs` | `List<Any?>?` |  |
| `responseCode` | `Long?` | Response code. |
| `responseMessage` | `String?` | Response message. |
| `targetPackageOrderUUID` | `String?` |  |
| `targetProductOrderUUID` | `String?` |  |

#### Example: Create

```kotlin
val outputMoveTid = client.outputMoveTid(null).create(mutableMapOf<String, Any?>(
    "productOrderUUIDs" to listOf<Any?>(),  // List<Any?>?
    "responseCode" to 1L,  // Long?
    "responseMessage" to "example_responseMessage",  // String?
    "targetPackageOrderUUID" to "example_targetPackageOrderUUID",  // String?
    "targetProductOrderUUID" to "example_targetProductOrderUUID"  // String?
), null)
```


### OutputRemoveProduct

Create an instance: `val outputRemoveProduct = client.outputRemoveProduct(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `String?` | Unique identifier for the package. |
| `productUUIDs` | `List<Any?>?` | List of product unique identifiers. |
| `responseCode` | `Long?` | Response code. |
| `responseMessage` | `String?` | Response message. |

#### Example: Create

```kotlin
val outputRemoveProduct = client.outputRemoveProduct(null).create(mutableMapOf<String, Any?>(
    "packageUUID" to "example_packageUUID",  // String?
    "productUUIDs" to listOf<Any?>(),  // List<Any?>?
    "responseCode" to 1L,  // Long?
    "responseMessage" to "example_responseMessage"  // String?
), null)
```


### OutputStart

Create an instance: `val outputStart = client.outputStart(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `String?` |  |
| `responseCode` | `Long?` | Response code. |
| `responseMessage` | `String?` | Response message. |

#### Example: Create

```kotlin
val outputStart = client.outputStart(null).create(mutableMapOf<String, Any?>(
    "responseCode" to 1L,  // Long?
    "responseMessage" to "example_responseMessage"  // String?
), null)
```


### OutputStatus

Create an instance: `val outputStatus = client.outputStatus(null)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `Long?` |  |
| `responseCode` | `Long?` | Response code. |
| `responseMessage` | `String?` | Response message. |
| `status` | `String?` |  |

#### Example: Load

```kotlin
val outputStatus = client.outputStatus(null).load(mutableMapOf<String, Any?>("id" to "output_status_id"), null)
```


### OutputUpdateProduct

Create an instance: `val outputUpdateProduct = client.outputUpdateProduct(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allowMultipleOrders` | `Boolean?` | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `String?` | The name of the application form |
| `contractNeeded` | `Boolean?` | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `Boolean?` | An attribute to indicate if credentials are needed |
| `descriptionKey` | `String?` | The description of the product |
| `nameKey` | `String?` | The key of the product name |
| `prescreeningAllowed` | `Boolean?` | An attribute to indicate if prescreening is allowed |
| `productName` | `String?` | The name of the product |
| `productStatus` | `String?` | The status of the product |
| `productUUID` | `String?` | The UUID of the product to update |
| `responseCode` | `Long?` | Response code. |
| `responseMessage` | `String?` | Response message. |
| `vendorName` | `String?` | The name of the vendor |

#### Example: Create

```kotlin
val outputUpdateProduct = client.outputUpdateProduct(null).create(mutableMapOf<String, Any?>(
    "productUUID" to "example_productUUID",  // String?
    "responseCode" to 1L,  // Long?
    "responseMessage" to "example_responseMessage"  // String?
), null)
```


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as maps

The Kotlin SDK uses a loose object model — `MutableMap<String, Any?>`
throughout — rather than a bespoke typed class per endpoint. This mirrors the
dynamic nature of the API and keeps the SDK flexible: no regeneration is
needed when the API schema changes.

Use `Helpers.toMapAny(value)` to safely coerce a value to a
`MutableMap<String, Any?>`. A `BluefinTecsMerchantPortalTypes.kt` module of
reference `data class` types is also generated for editor documentation.

### Project structure

```
kotlin/
├── build.gradle.kts            -- Gradle build (compiles core/, utility/, feature/, entity/)
├── settings.gradle.kts         -- Gradle project settings
├── core/                       -- Main SDK client, config, entity base, error type
├── entity/                     -- Entity implementations
├── feature/                    -- Built-in features (Base, Test, Log, ...)
├── utility/                    -- Utility functions and the vendored struct library
└── test/                       -- JUnit test suites
```

The main client class (`BluefinTecsMerchantPortalSDK`, package `voxgig.bluefintecsmerchantportalsdk.core`)
exposes the entity accessors. Reference entity or utility types directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const outputdetail = client.OutputDetail()
await outputdetail.load({ id: "example_id" })

// outputdetail.data() now returns the outputdetail data from the last `load`
// outputdetail.match() returns { id: "example_id" }
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
