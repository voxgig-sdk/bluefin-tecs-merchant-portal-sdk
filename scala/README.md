# BluefinTecsMerchantPortal Scala SDK



The Scala SDK for the BluefinTecsMerchantPortal API — an entity-oriented client following idiomatic Scala conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.merchantPortalApiController(null)` — each
carrying a small, uniform set of operations (`load`, `create`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Maven Central. The generated SDK is a
plain-source scala-cli project (no build tool, no third-party runtime
dependencies). Install it from the GitHub release tag
(`scala/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases)) or from a source
checkout — compile it with scala-cli:

```bash
cd scala && scala-cli compile .
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```scala
import voxgig.bluefintecsmerchantportalsdk.core.BluefinTecsMerchantPortalSDK

val client = new BluefinTecsMerchantPortalSDK()
```

### 4. Create, update, and remove

```scala
// Create — returns the ENTITY (call data() for the record)
val created = client.merchantPortalApiController(null).create(java.util.Map.of("business_reg_number", "example_business_reg_number", "city", "example_city", "country", "example_country", "currency", "example_currency", "merchant_category_code", 1L, "merchant_name", "example_merchant_name", "packageid", "example_packageid", "packageorderuuid", "example_packageorderuuid", "reason_deactivation", "example_reason_deactivation", "reason_reactivation", "example_reason_reactivation", "street", "example_street", "terminal_country_code", "example_terminal_country_code", "terminal_language_code", "example_terminal_language_code", "terminal_location", "example_terminal_location", "terminal_serial_number", "example_terminal_serial_number", "terminalid", 1L, "vu_nummer", "example_vu_nummer", "zipcode", "example_zipcode"), null)

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

```scala
val result = client.direct(java.util.Map.of(
    "path", "/api/resource/{id}",
    "method", "GET",
    "params", java.util.Map.of("id", "example")))

if (java.lang.Boolean.TRUE == result.get("ok")) {
    println(result.get("status"))  // 200
    println(result.get("data"))    // response body
}
else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // read both — an absent key simply reads as null.
    println("status=" + result.get("status") + " err=" + result.get("err"))
}
```

### Prepare a request without sending it

```scala
// prepare() returns the fetch definition and raises on error.
val fetchdef = client.prepare(java.util.Map.of(
    "path", "/api/resource/{id}",
    "method", "DELETE",
    "params", java.util.Map.of("id", "example")))

println(fetchdef.get("url"))
println(fetchdef.get("method"))
println(fetchdef.get("headers"))
```

### Use test mode

Create a mock client for unit testing — no server required:

```scala
val client = BluefinTecsMerchantPortalSDK.testSDK(null, null)

// Entity ops return the ENTITY and raises on error;
// call data() for the record.
val outputDetail = client.outputDetail(null).load(java.util.Map.of("id", "test01"), null)
// outputDetail holds the mock response record
println(outputDetail)
```

### Use a custom fetch function

Replace the HTTP transport with your own `BiFunction`:

```scala
val mockFetch: java.util.function.BiFunction[String, java.util.Map[String, Object], Object] =
    (url, init) => {
        val res = new java.util.LinkedHashMap[String, Object]()
        res.put("status", java.lang.Integer.valueOf(200))
        res.put("statusText", "OK")
        res.put("headers", new java.util.LinkedHashMap[String, Object]())
        res.put("json", (() => java.util.Map.of("id", "mock01")): java.util.function.Supplier[Object])
        res
    }

val options = new java.util.LinkedHashMap[String, Object]()
options.put("base", "http://localhost:8080")
options.put("system", java.util.Map.of("fetch", mockFetch))
val client = new BluefinTecsMerchantPortalSDK(options)
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run:

```bash
cd scala && make test
```


## Reference

### BluefinTecsMerchantPortalSDK

```scala
val client = new BluefinTecsMerchantPortalSDK(options)
```

Creates a new SDK client. `options` is a `java.util.Map[String, Object]`.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Map` | Feature activation flags. |
| `extend` | `List` | Additional Feature instances to load. |
| `system` | `Map` | System overrides (e.g. custom `fetch` function). |

### testSDK

```scala
val client = BluefinTecsMerchantPortalSDK.testSDK(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinTecsMerchantPortalSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `optionsMap` | `() -> Map` | Deep copy of current SDK options. |
| `getUtility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Map` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> Map` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
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
| `load` | `(reqmatch, ctrl) -> Object` | Load a single entity by match criteria. Raises on error. |
| `create` | `(reqdata, ctrl) -> Object` | Create a new entity. Raises on error. |
| `data` | `(newdata*) -> Object` | Get or set entity data. |
| `matchArgs` | `(newmatch*) -> Object` | Get or set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `getName` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the ENTITY (call data() for the record) (a `Map` for single-entity
ops, an aggregate `List` for `list`) as `Object` and raise on error. Wrap
calls in `try`/`catch` to handle failures.

The `direct()` escape hatch never raises — it returns a result
`java.util.Map[String, Object]` you branch on via `result.get("ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Int` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `Object` | Parsed JSON response body. |

On error, `ok` is `false` and `err` contains the error value.

### Entities

#### MerchantPortalApiController

| Field | Description |
| --- | --- |
| `account_number` |  |
| `additional_data` |  |
| `business_reg_number` |  |
| `city` |  |
| `corporateuuid` |  |
| `country` |  |
| `currency` |  |
| `merchant_category_code` |  |
| `merchant_email` |  |
| `merchant_name` |  |
| `merchant_phone_number` |  |
| `packageid` |  |
| `packageorderuuid` |  |
| `password` |  |
| `productid` |  |
| `productid_acquirer` |  |
| `reason_deactivation` |  |
| `reason_reactivation` |  |
| `sorting_code` |  |
| `state` |  |
| `street` |  |
| `terminal_country_code` |  |
| `terminal_language_code` |  |
| `terminal_location` |  |
| `terminal_serial_number` |  |
| `terminalid` |  |
| `terminalid_acquirer` |  |
| `user_email` |  |
| `user_phone_number` |  |
| `username` |  |
| `vu_nummer` |  |
| `web_shop_url` |  |
| `zipcode` |  |

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
| `packageOrderUUID` |  |
| `productOrderUUID` |  |

Operations: create.

API path: `/merchantportalws/documentsList`

#### MerchantPortalPamFormController

| Field | Description |
| --- | --- |
| `appFormFieldsDescUUID` |  |
| `filter` |  |
| `language` |  |
| `packageOrder` |  |
| `packageOrderUUID` |  |
| `packageUUID` |  |
| `productOrderUUID` |  |
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
| `additional_data` |  |
| `businessRegistrationNumber` |  |
| `city` |  |
| `companyName` |  |
| `corporateUUID` |  |
| `country` |  |
| `currency` |  |
| `email` |  |
| `language` |  |
| `login` |  |
| `mandator` |  |
| `merchantContractNumber` |  |
| `merchantName` |  |
| `merchant_category_code` |  |
| `packageUUID` |  |
| `packageorderuuid` |  |
| `phoneNumber` |  |
| `postalCode` |  |
| `productid_acquirer` |  |
| `region` |  |
| `registrationNumber` |  |
| `signature` |  |
| `street` |  |
| `terminalIds` |  |
| `terminalid_acquirer` |  |
| `vu_nummer` |  |

Operations: create.

API path: `/merchantportalws/contractNumber`

#### MerchantPortalPamPackageController

| Field | Description |
| --- | --- |
| `consumerUUID` |  |
| `corporateUUID` |  |
| `country` |  |
| `descriptionKey` |  |
| `filter` |  |
| `language` |  |
| `nameKey` |  |
| `packageStatus` |  |
| `packageUUID` |  |
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
| `reason_decline` |  |
| `sorting` |  |

Operations: create.

API path: `/merchantportalws/approveProduct`

#### OutputAddProduct

| Field | Description |
| --- | --- |
| `packageUUID` |  |
| `productUUIDs` |  |
| `responseCode` |  |
| `responseMessage` |  |

Operations: create.

API path: `/merchantportalws/addProductsToPackage`

#### OutputCreateProduct

| Field | Description |
| --- | --- |
| `acquirerId` |  |
| `allowMultipleOrders` |  |
| `appFormTemplateName` |  |
| `contractNeeded` |  |
| `credentialsNeeded` |  |
| `descriptionKey` |  |
| `nameKey` |  |
| `prescreeningAllowed` |  |
| `productName` |  |
| `responseCode` |  |
| `responseMessage` |  |
| `terminalTemplateName` |  |
| `vendorName` |  |
| `xmlTemplateFile` |  |

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
| `responseCode` |  |
| `responseMessage` |  |
| `sorting` |  |

Operations: create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/list`

#### OutputMessage

| Field | Description |
| --- | --- |
| `responseCode` |  |
| `responseMessage` |  |

Operations: load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/restart/{id}`

#### OutputMoveTid

| Field | Description |
| --- | --- |
| `productOrderUUIDs` |  |
| `responseCode` |  |
| `responseMessage` |  |
| `targetPackageOrderUUID` |  |
| `targetProductOrderUUID` |  |

Operations: create.

API path: `/merchantportalws/moveTid`

#### OutputRemoveProduct

| Field | Description |
| --- | --- |
| `packageUUID` |  |
| `productUUIDs` |  |
| `responseCode` |  |
| `responseMessage` |  |

Operations: create.

API path: `/merchantportalws/removeProductsFromPackage`

#### OutputStart

| Field | Description |
| --- | --- |
| `id` |  |
| `responseCode` |  |
| `responseMessage` |  |

Operations: create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/start`

#### OutputStatus

| Field | Description |
| --- | --- |
| `percentage` |  |
| `responseCode` |  |
| `responseMessage` |  |
| `status` |  |

Operations: load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/status/{id}`

#### OutputUpdateProduct

| Field | Description |
| --- | --- |
| `allowMultipleOrders` |  |
| `appFormName` |  |
| `contractNeeded` |  |
| `credentialsNeeded` |  |
| `descriptionKey` |  |
| `nameKey` |  |
| `prescreeningAllowed` |  |
| `productName` |  |
| `productStatus` |  |
| `productUUID` |  |
| `responseCode` |  |
| `responseMessage` |  |
| `vendorName` |  |

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
| `account_number` | `java.lang.Long` |  |
| `additional_data` | `java.util.Map[String, Object]` |  |
| `business_reg_number` | `String` |  |
| `city` | `String` |  |
| `corporateuuid` | `String` |  |
| `country` | `String` |  |
| `currency` | `String` |  |
| `merchant_category_code` | `java.lang.Long` |  |
| `merchant_email` | `String` |  |
| `merchant_name` | `String` |  |
| `merchant_phone_number` | `String` |  |
| `packageid` | `String` |  |
| `packageorderuuid` | `String` |  |
| `password` | `String` |  |
| `productid` | `String` |  |
| `productid_acquirer` | `String` |  |
| `reason_deactivation` | `String` |  |
| `reason_reactivation` | `String` |  |
| `sorting_code` | `java.lang.Long` |  |
| `state` | `String` |  |
| `street` | `String` |  |
| `terminal_country_code` | `String` |  |
| `terminal_language_code` | `String` |  |
| `terminal_location` | `String` |  |
| `terminal_serial_number` | `String` |  |
| `terminalid` | `java.lang.Long` |  |
| `terminalid_acquirer` | `String` |  |
| `user_email` | `String` |  |
| `user_phone_number` | `String` |  |
| `username` | `String` |  |
| `vu_nummer` | `String` |  |
| `web_shop_url` | `String` |  |
| `zipcode` | `String` |  |

#### Example: Create

```scala
val merchantPortalApiController = client.merchantPortalApiController(null).create(java.util.Map.of(
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


### MerchantPortalCommonController

Create an instance: `val merchantPortalCommonController = client.merchantPortalCommonController(null)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Example: Load

```scala
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
| `language` | `String` |  |
| `productOrderUUID` | `String` |  |

#### Example: Create

```scala
val merchantPortalPamContractController = client.merchantPortalPamContractController(null).create(java.util.Map.of(
    "language", "example_language",  // String
    "productOrderUUID", "example_productOrderUUID"  // String
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
| `appFormFieldDescUUID` | `String` |  |
| `packageOrderUUID` | `String` |  |
| `productOrderUUID` | `String` |  |

#### Example: Create

```scala
val merchantPortalPamDocumentController = client.merchantPortalPamDocumentController(null).create(java.util.Map.of(
    "appFormFieldDescUUID", "example_appFormFieldDescUUID"  // String
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
| `appFormFieldsDescUUID` | `String` |  |
| `filter` | `java.util.Map[String, Object]` |  |
| `language` | `String` |  |
| `packageOrder` | `java.util.Map[String, Object]` |  |
| `packageOrderUUID` | `String` |  |
| `packageUUID` | `String` |  |
| `productOrderUUID` | `String` |  |
| `productOrders` | `java.util.List[Object]` |  |
| `reasonOfReopening` | `String` |  |

#### Example: Create

```scala
val merchantPortalPamFormController = client.merchantPortalPamFormController(null).create(java.util.Map.of(
    "appFormFieldsDescUUID", "example_appFormFieldsDescUUID",  // String
    "language", "example_language",  // String
    "packageOrderUUID", "example_packageOrderUUID",  // String
    "reasonOfReopening", "example_reasonOfReopening"  // String
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
| `clientSecret` | `String` |  |
| `mandatorName` | `String` |  |
| `notificationEmail` | `String` |  |
| `packageUUID` | `String` |  |

#### Example: Create

```scala
val merchantPortalPamMandatorController = client.merchantPortalPamMandatorController(null).create(java.util.Map.of(
    "mandatorName", "example_mandatorName",  // String
    "packageUUID", "example_packageUUID"  // String
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
| `additional_data` | `java.util.Map[String, Object]` |  |
| `businessRegistrationNumber` | `String` |  |
| `city` | `String` |  |
| `companyName` | `String` |  |
| `corporateUUID` | `String` |  |
| `country` | `String` |  |
| `currency` | `String` |  |
| `email` | `String` |  |
| `language` | `String` |  |
| `login` | `String` |  |
| `mandator` | `String` |  |
| `merchantContractNumber` | `String` |  |
| `merchantName` | `String` |  |
| `merchant_category_code` | `String` |  |
| `packageUUID` | `String` |  |
| `packageorderuuid` | `String` |  |
| `phoneNumber` | `String` |  |
| `postalCode` | `String` |  |
| `productid_acquirer` | `String` |  |
| `region` | `String` |  |
| `registrationNumber` | `String` |  |
| `signature` | `String` |  |
| `street` | `String` |  |
| `terminalIds` | `java.util.List[Object]` |  |
| `terminalid_acquirer` | `String` |  |
| `vu_nummer` | `String` |  |

#### Example: Create

```scala
val merchantPortalPamMerchantController = client.merchantPortalPamMerchantController(null).create(java.util.Map.of(
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


### MerchantPortalPamPackageController

Create an instance: `val merchantPortalPamPackageController = client.merchantPortalPamPackageController(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `String` |  |
| `corporateUUID` | `String` |  |
| `country` | `String` |  |
| `descriptionKey` | `String` |  |
| `filter` | `java.util.Map[String, Object]` |  |
| `language` | `String` |  |
| `nameKey` | `String` |  |
| `packageStatus` | `String` |  |
| `packageUUID` | `String` |  |
| `pagination` | `java.util.Map[String, Object]` |  |
| `sorting` | `java.util.Map[String, Object]` |  |

#### Example: Create

```scala
val merchantPortalPamPackageController = client.merchantPortalPamPackageController(null).create(java.util.Map.of(
    "language", "example_language",  // String
    "packageUUID", "example_packageUUID"  // String
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
| `consumerUUID` | `String` |  |
| `filter` | `java.util.Map[String, Object]` |  |
| `language` | `String` |  |
| `merchantID` | `String` |  |
| `packageOrderUUID` | `String` |  |
| `pagination` | `java.util.Map[String, Object]` |  |
| `productOrderUUID` | `String` |  |
| `productUUID` | `String` |  |
| `reason_decline` | `String` |  |
| `sorting` | `java.util.Map[String, Object]` |  |

#### Example: Create

```scala
val merchantPortalPamProductController = client.merchantPortalPamProductController(null).create(java.util.Map.of(
    "packageOrderUUID", "example_packageOrderUUID",  // String
    "productOrderUUID", "example_productOrderUUID",  // String
    "productUUID", "example_productUUID",  // String
    "reason_decline", "example_reason_decline"  // String
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
| `packageUUID` | `String` |  |
| `productUUIDs` | `java.util.List[Object]` |  |
| `responseCode` | `java.lang.Long` |  |
| `responseMessage` | `String` |  |

#### Example: Create

```scala
val outputAddProduct = client.outputAddProduct(null).create(java.util.Map.of(
    "packageUUID", "example_packageUUID",  // String
    "productUUIDs", java.util.List.of(),  // java.util.List[Object]
    "responseCode", 1L,  // java.lang.Long
    "responseMessage", "example_responseMessage"  // String
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
| `acquirerId` | `String` |  |
| `allowMultipleOrders` | `java.lang.Boolean` |  |
| `appFormTemplateName` | `String` |  |
| `contractNeeded` | `java.lang.Boolean` |  |
| `credentialsNeeded` | `java.lang.Boolean` |  |
| `descriptionKey` | `String` |  |
| `nameKey` | `String` |  |
| `prescreeningAllowed` | `java.lang.Boolean` |  |
| `productName` | `String` |  |
| `responseCode` | `java.lang.Long` |  |
| `responseMessage` | `String` |  |
| `terminalTemplateName` | `String` |  |
| `vendorName` | `String` |  |
| `xmlTemplateFile` | `String` |  |

#### Example: Create

```scala
val outputCreateProduct = client.outputCreateProduct(null).create(java.util.Map.of(
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


### OutputDetail

Create an instance: `val outputDetail = client.outputDetail(null)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `batch` | `java.util.Map[String, Object]` |  |
| `lines` | `java.util.Map[String, Object]` |  |
| `progress` | `java.util.Map[String, Object]` |  |

#### Example: Load

```scala
val outputDetail = client.outputDetail(null).load(java.util.Map.of("id", "output_detail_id"), null)
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
| `items` | `java.util.List[Object]` |  |
| `pagination` | `java.util.Map[String, Object]` |  |
| `responseCode` | `java.lang.Long` |  |
| `responseMessage` | `String` |  |
| `sorting` | `java.util.Map[String, Object]` |  |

#### Example: Create

```scala
val outputList = client.outputList(null).create(java.util.Map.of(
    "pagination", java.util.Map.of(),  // java.util.Map[String, Object]
    "responseCode", 1L,  // java.lang.Long
    "responseMessage", "example_responseMessage"  // String
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
| `responseCode` | `java.lang.Long` |  |
| `responseMessage` | `String` |  |

#### Example: Load

```scala
val outputMessage = client.outputMessage(null).load(java.util.Map.of("id", "output_message_id"), null)
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
| `productOrderUUIDs` | `java.util.List[Object]` |  |
| `responseCode` | `java.lang.Long` |  |
| `responseMessage` | `String` |  |
| `targetPackageOrderUUID` | `String` |  |
| `targetProductOrderUUID` | `String` |  |

#### Example: Create

```scala
val outputMoveTid = client.outputMoveTid(null).create(java.util.Map.of(
    "productOrderUUIDs", java.util.List.of(),  // java.util.List[Object]
    "responseCode", 1L,  // java.lang.Long
    "responseMessage", "example_responseMessage",  // String
    "targetPackageOrderUUID", "example_targetPackageOrderUUID",  // String
    "targetProductOrderUUID", "example_targetProductOrderUUID"  // String
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
| `packageUUID` | `String` |  |
| `productUUIDs` | `java.util.List[Object]` |  |
| `responseCode` | `java.lang.Long` |  |
| `responseMessage` | `String` |  |

#### Example: Create

```scala
val outputRemoveProduct = client.outputRemoveProduct(null).create(java.util.Map.of(
    "packageUUID", "example_packageUUID",  // String
    "productUUIDs", java.util.List.of(),  // java.util.List[Object]
    "responseCode", 1L,  // java.lang.Long
    "responseMessage", "example_responseMessage"  // String
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
| `id` | `String` |  |
| `responseCode` | `java.lang.Long` |  |
| `responseMessage` | `String` |  |

#### Example: Create

```scala
val outputStart = client.outputStart(null).create(java.util.Map.of(
    "responseCode", 1L,  // java.lang.Long
    "responseMessage", "example_responseMessage"  // String
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
| `percentage` | `java.lang.Long` |  |
| `responseCode` | `java.lang.Long` |  |
| `responseMessage` | `String` |  |
| `status` | `String` |  |

#### Example: Load

```scala
val outputStatus = client.outputStatus(null).load(java.util.Map.of("id", "output_status_id"), null)
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
| `allowMultipleOrders` | `java.lang.Boolean` |  |
| `appFormName` | `String` |  |
| `contractNeeded` | `java.lang.Boolean` |  |
| `credentialsNeeded` | `java.lang.Boolean` |  |
| `descriptionKey` | `String` |  |
| `nameKey` | `String` |  |
| `prescreeningAllowed` | `java.lang.Boolean` |  |
| `productName` | `String` |  |
| `productStatus` | `String` |  |
| `productUUID` | `String` |  |
| `responseCode` | `java.lang.Long` |  |
| `responseMessage` | `String` |  |
| `vendorName` | `String` |  |

#### Example: Create

```scala
val outputUpdateProduct = client.outputUpdateProduct(null).create(java.util.Map.of(
    "productUUID", "example_productUUID",  // String
    "responseCode", 1L,  // java.lang.Long
    "responseMessage", "example_responseMessage"  // String
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

The Scala SDK uses a loose object model — `java.util.Map[String, Object]`
throughout — rather than a bespoke typed class per endpoint. This mirrors the
dynamic nature of the API and keeps the SDK flexible: no regeneration is
needed when the API schema changes.

Use `Helpers.toMapAny(value)` to safely coerce a value to a
`java.util.Map[String, Object]`. A `BluefinTecsMerchantPortalTypes.scala` module of
reference `case class` types is also generated for editor documentation.

### Project structure

```
scala/
├── project.scala               -- scala-cli project config (Scala 3, no deps)
├── core/                        -- Main SDK client, config, entity base, error type
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (Base, Test, Log, ...)
├── utility/                     -- Utility functions and the vendored struct library
└── sdktest/                     -- Generated per-entity tests (scala-cli mains)
```

The main client class (`BluefinTecsMerchantPortalSDK`, package `voxgig.bluefintecsmerchantportalsdk.core`)
exposes the entity accessors. Reference entity or utility types directly only
when needed. The SDK is a dependency-free scala-cli project: JSON parsing is
the vendored `utility/Json.java`, HTTP transport is the JDK
`java.net.http.HttpClient`, and the struct library is inlined under
`utility/struct`.

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
