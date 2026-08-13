# BluefinTecsMerchantPortal Swift SDK



The Swift SDK for the BluefinTecsMerchantPortal API — an entity-oriented client following idiomatic Swift conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.MerchantPortalApiController()` — each
carrying a small, uniform set of operations (`load`, `create`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to a SwiftPM registry. The generated SDK
is a dependency-free SwiftPM package (Foundation only, plus the vendored
Voxgig Struct port). Depend on it from the GitHub release tag
(`swift/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases)) by adding it to
your `Package.swift`:

```swift
dependencies: [
    // From the git release tag:
    .package(url: "<repo-url>", exact: "0.0.1"),
],
```

Or build from a source checkout with SwiftPM:

```bash
cd swift && swift build
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```swift
import BluefinTecsMerchantPortalSdk

let client = BluefinTecsMerchantPortalSDK()
```

### 4. Create, update, and remove

```swift
// Create — returns the ENTITY (call data() for the record)
let created = try client.MerchantPortalApiController().create(VMap([("business_reg_number", .string("example_business_reg_number")), ("city", .string("example_city")), ("country", .string("example_country")), ("currency", .string("example_currency")), ("merchant_category_code", .int(1)), ("merchant_name", .string("example_merchant_name")), ("packageid", .string("example_packageid")), ("packageorderuuid", .string("example_packageorderuuid")), ("reason_deactivation", .string("example_reason_deactivation")), ("reason_reactivation", .string("example_reason_reactivation")), ("street", .string("example_street")), ("terminal_country_code", .string("example_terminal_country_code")), ("terminal_language_code", .string("example_terminal_language_code")), ("terminal_location", .string("example_terminal_location")), ("terminal_serial_number", .string("example_terminal_serial_number")), ("terminalid", .int(1)), ("vu_nummer", .string("example_vu_nummer")), ("zipcode", .string("example_zipcode"))]), nil)

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

```swift
let result = client.direct(VMap([
    ("path", .string("/api/resource/{id}")),
    ("method", .string("GET")),
    ("params", .map([("id", .string("example"))])),
]))

if result.entries["ok"] == .bool(true) {
    print(result.entries["status"] ?? .noval)  // 200
    print(result.entries["data"] ?? .noval)     // response body
}
else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // an absent key simply reads as .noval.
    print(result.entries["status"] ?? .noval, result.entries["err"] ?? .noval)
}
```

### Prepare a request without sending it

```swift
// prepare() returns the fetch definition and throws on error.
let fetchdef = try client.prepare(VMap([
    ("path", .string("/api/resource/{id}")),
    ("method", .string("DELETE")),
    ("params", .map([("id", .string("example"))])),
]))

print(fetchdef.entries["url"] ?? .noval)
print(fetchdef.entries["method"] ?? .noval)
print(fetchdef.entries["headers"] ?? .noval)
```

### Use test mode

Create a mock client for unit testing — no server required:

```swift
let client = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)

// Entity ops return the ENTITY and throws on error;
// call data() for the record.
let outputDetail = try client.OutputDetail().load(VMap([("id", .string("test01"))]), nil)
// outputDetail holds the mock response record
print(outputDetail)
```

### Use a custom fetch function

Replace the HTTP transport with your own `SystemFetch` closure:

```swift
let fetch: SystemFetch = { url, _ in
    let m = VMap()
    m.entries["status"] = .int(200)
    m.entries["statusText"] = .string("OK")
    m.entries["headers"] = .map(VMap())
    m.entries["json"] = .nat({ () -> Value in .map(VMap([("id", .string("mock01"))])) } as NativeCall0)
    return .map(m)
}

let system = VMap()
system.entries["fetch"] = .nat(fetch)
let options = VMap()
options.entries["base"] = .string("http://localhost:8080")
options.entries["system"] = .map(system)
let client = BluefinTecsMerchantPortalSDK(options)
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run:

```bash
cd swift && make test
```


## Reference

### BluefinTecsMerchantPortalSDK

```swift
let client = BluefinTecsMerchantPortalSDK(options)
```

Creates a new SDK client. `options` is a `VMap` of `Value`.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `VMap` | Feature activation flags. |
| `extend` | `VList` | Additional Feature instances to load. |
| `system` | `VMap` | System overrides (e.g. custom `fetch` function). |

### testSDK

```swift
let client = BluefinTecsMerchantPortalSDK.testSDK(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinTecsMerchantPortalSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `optionsMap` | `() -> VMap` | Deep copy of current SDK options. |
| `getUtility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) throws -> VMap` | Build an HTTP request definition without sending. Throws on error. |
| `direct` | `(fetchargs) -> VMap` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `MerchantPortalApiController` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create a MerchantPortalApiController entity instance. |
| `MerchantPortalCommonController` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create a MerchantPortalCommonController entity instance. |
| `MerchantPortalPamContractController` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create a MerchantPortalPamContractController entity instance. |
| `MerchantPortalPamDocumentController` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create a MerchantPortalPamDocumentController entity instance. |
| `MerchantPortalPamFormController` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create a MerchantPortalPamFormController entity instance. |
| `MerchantPortalPamMandatorController` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create a MerchantPortalPamMandatorController entity instance. |
| `MerchantPortalPamMerchantController` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create a MerchantPortalPamMerchantController entity instance. |
| `MerchantPortalPamPackageController` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create a MerchantPortalPamPackageController entity instance. |
| `MerchantPortalPamProductController` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create a MerchantPortalPamProductController entity instance. |
| `OutputAddProduct` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create an OutputAddProduct entity instance. |
| `OutputCreateProduct` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create an OutputCreateProduct entity instance. |
| `OutputDetail` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create an OutputDetail entity instance. |
| `OutputList` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create an OutputList entity instance. |
| `OutputMessage` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create an OutputMessage entity instance. |
| `OutputMoveTid` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create an OutputMoveTid entity instance. |
| `OutputRemoveProduct` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create an OutputRemoveProduct entity instance. |
| `OutputStart` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create an OutputStart entity instance. |
| `OutputStatus` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create an OutputStatus entity instance. |
| `OutputUpdateProduct` | `(entopts) -> BluefinTecsMerchantPortalEntityBase` | Create an OutputUpdateProduct entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) throws -> Value` | Load a single entity by match criteria. Throws on error. |
| `create` | `(reqdata, ctrl) throws -> Value` | Create a new entity. Throws on error. |
| `data` | `(newdata?) -> Value` | Get or set entity data. |
| `matchv` | `(newmatch?) -> Value` | Get or set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `getName` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the ENTITY (call data() for the record) (a `Value` map for
single-entity ops, a `Value` list for `list`) and throw on error. Wrap
calls in `do`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `VMap` you
branch on via `result.entries["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Bool` | `true` if the HTTP status is 2xx. |
| `status` | `Int` | HTTP status code. |
| `headers` | `VMap` | Response headers. |
| `data` | `Value` | Parsed JSON response body. |

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

Operations: Create.

API path: `/merchantportalws/deactivateTerminal`

#### MerchantPortalCommonController

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/merchantportalws/logDeveloperInfo`

#### MerchantPortalPamContractController

| Field | Description |
| --- | --- |
| `language` |  |
| `productOrderUUID` |  |

Operations: Create.

API path: `/merchantportalws/generateContract`

#### MerchantPortalPamDocumentController

| Field | Description |
| --- | --- |
| `appFormFieldDescUUID` |  |
| `packageOrderUUID` |  |
| `productOrderUUID` |  |

Operations: Create.

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

Operations: Create.

API path: `/merchantportalws/applicationForm`

#### MerchantPortalPamMandatorController

| Field | Description |
| --- | --- |
| `clientSecret` |  |
| `mandatorName` |  |
| `notificationEmail` |  |
| `packageUUID` |  |

Operations: Create.

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

Operations: Create.

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

Operations: Create.

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

Operations: Create.

API path: `/merchantportalws/approveProduct`

#### OutputAddProduct

| Field | Description |
| --- | --- |
| `packageUUID` |  |
| `productUUIDs` |  |
| `responseCode` |  |
| `responseMessage` |  |

Operations: Create.

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

Operations: Create.

API path: `/merchantportalws/createNewProduct`

#### OutputDetail

| Field | Description |
| --- | --- |
| `batch` |  |
| `lines` |  |
| `progress` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/details/{id}`

#### OutputList

| Field | Description |
| --- | --- |
| `items` |  |
| `pagination` |  |
| `responseCode` |  |
| `responseMessage` |  |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/list`

#### OutputMessage

| Field | Description |
| --- | --- |
| `responseCode` |  |
| `responseMessage` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/restart/{id}`

#### OutputMoveTid

| Field | Description |
| --- | --- |
| `productOrderUUIDs` |  |
| `responseCode` |  |
| `responseMessage` |  |
| `targetPackageOrderUUID` |  |
| `targetProductOrderUUID` |  |

Operations: Create.

API path: `/merchantportalws/moveTid`

#### OutputRemoveProduct

| Field | Description |
| --- | --- |
| `packageUUID` |  |
| `productUUIDs` |  |
| `responseCode` |  |
| `responseMessage` |  |

Operations: Create.

API path: `/merchantportalws/removeProductsFromPackage`

#### OutputStart

| Field | Description |
| --- | --- |
| `id` |  |
| `responseCode` |  |
| `responseMessage` |  |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/start`

#### OutputStatus

| Field | Description |
| --- | --- |
| `percentage` |  |
| `responseCode` |  |
| `responseMessage` |  |
| `status` |  |

Operations: Load.

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

Operations: Create.

API path: `/merchantportalws/updateProduct`



## Entities


### MerchantPortalApiController

Create an instance: `let merchantPortalApiController = client.MerchantPortalApiController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `Int` |  |
| `additional_data` | `VMap` |  |
| `business_reg_number` | `String` |  |
| `city` | `String` |  |
| `corporateuuid` | `String` |  |
| `country` | `String` |  |
| `currency` | `String` |  |
| `merchant_category_code` | `Int` |  |
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
| `sorting_code` | `Int` |  |
| `state` | `String` |  |
| `street` | `String` |  |
| `terminal_country_code` | `String` |  |
| `terminal_language_code` | `String` |  |
| `terminal_location` | `String` |  |
| `terminal_serial_number` | `String` |  |
| `terminalid` | `Int` |  |
| `terminalid_acquirer` | `String` |  |
| `user_email` | `String` |  |
| `user_phone_number` | `String` |  |
| `username` | `String` |  |
| `vu_nummer` | `String` |  |
| `web_shop_url` | `String` |  |
| `zipcode` | `String` |  |

#### Example: Create

```swift
let merchantPortalApiController = try client.MerchantPortalApiController().create(VMap([
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


### MerchantPortalCommonController

Create an instance: `let merchantPortalCommonController = client.MerchantPortalCommonController()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Example: Load

```swift
let merchantPortalCommonController = try client.MerchantPortalCommonController().load(nil, nil)
```


### MerchantPortalPamContractController

Create an instance: `let merchantPortalPamContractController = client.MerchantPortalPamContractController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `String` |  |
| `productOrderUUID` | `String` |  |

#### Example: Create

```swift
let merchantPortalPamContractController = try client.MerchantPortalPamContractController().create(VMap([
    ("language", .string("example_language")),  // String
    ("productOrderUUID", .string("example_productOrderUUID"))  // String
]), nil)
```


### MerchantPortalPamDocumentController

Create an instance: `let merchantPortalPamDocumentController = client.MerchantPortalPamDocumentController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldDescUUID` | `String` |  |
| `packageOrderUUID` | `String` |  |
| `productOrderUUID` | `String` |  |

#### Example: Create

```swift
let merchantPortalPamDocumentController = try client.MerchantPortalPamDocumentController().create(VMap([
    ("appFormFieldDescUUID", .string("example_appFormFieldDescUUID"))  // String
]), nil)
```


### MerchantPortalPamFormController

Create an instance: `let merchantPortalPamFormController = client.MerchantPortalPamFormController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldsDescUUID` | `String` |  |
| `filter` | `VMap` |  |
| `language` | `String` |  |
| `packageOrder` | `VMap` |  |
| `packageOrderUUID` | `String` |  |
| `packageUUID` | `String` |  |
| `productOrderUUID` | `String` |  |
| `productOrders` | `[Value]` |  |
| `reasonOfReopening` | `String` |  |

#### Example: Create

```swift
let merchantPortalPamFormController = try client.MerchantPortalPamFormController().create(VMap([
    ("appFormFieldsDescUUID", .string("example_appFormFieldsDescUUID")),  // String
    ("language", .string("example_language")),  // String
    ("packageOrderUUID", .string("example_packageOrderUUID")),  // String
    ("reasonOfReopening", .string("example_reasonOfReopening"))  // String
]), nil)
```


### MerchantPortalPamMandatorController

Create an instance: `let merchantPortalPamMandatorController = client.MerchantPortalPamMandatorController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `clientSecret` | `String` |  |
| `mandatorName` | `String` |  |
| `notificationEmail` | `String` |  |
| `packageUUID` | `String` |  |

#### Example: Create

```swift
let merchantPortalPamMandatorController = try client.MerchantPortalPamMandatorController().create(VMap([
    ("mandatorName", .string("example_mandatorName")),  // String
    ("packageUUID", .string("example_packageUUID"))  // String
]), nil)
```


### MerchantPortalPamMerchantController

Create an instance: `let merchantPortalPamMerchantController = client.MerchantPortalPamMerchantController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `VMap` |  |
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
| `terminalIds` | `[Value]` |  |
| `terminalid_acquirer` | `String` |  |
| `vu_nummer` | `String` |  |

#### Example: Create

```swift
let merchantPortalPamMerchantController = try client.MerchantPortalPamMerchantController().create(VMap([
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


### MerchantPortalPamPackageController

Create an instance: `let merchantPortalPamPackageController = client.MerchantPortalPamPackageController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `String` |  |
| `corporateUUID` | `String` |  |
| `country` | `String` |  |
| `descriptionKey` | `String` |  |
| `filter` | `VMap` |  |
| `language` | `String` |  |
| `nameKey` | `String` |  |
| `packageStatus` | `String` |  |
| `packageUUID` | `String` |  |
| `pagination` | `VMap` |  |
| `sorting` | `VMap` |  |

#### Example: Create

```swift
let merchantPortalPamPackageController = try client.MerchantPortalPamPackageController().create(VMap([
    ("language", .string("example_language")),  // String
    ("packageUUID", .string("example_packageUUID"))  // String
]), nil)
```


### MerchantPortalPamProductController

Create an instance: `let merchantPortalPamProductController = client.MerchantPortalPamProductController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `String` |  |
| `filter` | `VMap` |  |
| `language` | `String` |  |
| `merchantID` | `String` |  |
| `packageOrderUUID` | `String` |  |
| `pagination` | `VMap` |  |
| `productOrderUUID` | `String` |  |
| `productUUID` | `String` |  |
| `reason_decline` | `String` |  |
| `sorting` | `VMap` |  |

#### Example: Create

```swift
let merchantPortalPamProductController = try client.MerchantPortalPamProductController().create(VMap([
    ("packageOrderUUID", .string("example_packageOrderUUID")),  // String
    ("productOrderUUID", .string("example_productOrderUUID")),  // String
    ("productUUID", .string("example_productUUID")),  // String
    ("reason_decline", .string("example_reason_decline"))  // String
]), nil)
```


### OutputAddProduct

Create an instance: `let outputAddProduct = client.OutputAddProduct()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `String` |  |
| `productUUIDs` | `[Value]` |  |
| `responseCode` | `Int` |  |
| `responseMessage` | `String` |  |

#### Example: Create

```swift
let outputAddProduct = try client.OutputAddProduct().create(VMap([
    ("packageUUID", .string("example_packageUUID")),  // String
    ("productUUIDs", .list([])),  // [Value]
    ("responseCode", .int(1)),  // Int
    ("responseMessage", .string("example_responseMessage"))  // String
]), nil)
```


### OutputCreateProduct

Create an instance: `let outputCreateProduct = client.OutputCreateProduct()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirerId` | `String` |  |
| `allowMultipleOrders` | `Bool` |  |
| `appFormTemplateName` | `String` |  |
| `contractNeeded` | `Bool` |  |
| `credentialsNeeded` | `Bool` |  |
| `descriptionKey` | `String` |  |
| `nameKey` | `String` |  |
| `prescreeningAllowed` | `Bool` |  |
| `productName` | `String` |  |
| `responseCode` | `Int` |  |
| `responseMessage` | `String` |  |
| `terminalTemplateName` | `String` |  |
| `vendorName` | `String` |  |
| `xmlTemplateFile` | `String` |  |

#### Example: Create

```swift
let outputCreateProduct = try client.OutputCreateProduct().create(VMap([
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


### OutputDetail

Create an instance: `let outputDetail = client.OutputDetail()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `batch` | `VMap` |  |
| `lines` | `VMap` |  |
| `progress` | `VMap` |  |

#### Example: Load

```swift
let outputDetail = try client.OutputDetail().load(VMap([("id", .string("output_detail_id"))]), nil)
```


### OutputList

Create an instance: `let outputList = client.OutputList()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `items` | `[Value]` |  |
| `pagination` | `VMap` |  |
| `responseCode` | `Int` |  |
| `responseMessage` | `String` |  |
| `sorting` | `VMap` |  |

#### Example: Create

```swift
let outputList = try client.OutputList().create(VMap([
    ("pagination", .map(VMap())),  // VMap
    ("responseCode", .int(1)),  // Int
    ("responseMessage", .string("example_responseMessage"))  // String
]), nil)
```


### OutputMessage

Create an instance: `let outputMessage = client.OutputMessage()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `responseCode` | `Int` |  |
| `responseMessage` | `String` |  |

#### Example: Load

```swift
let outputMessage = try client.OutputMessage().load(VMap([("id", .string("output_message_id"))]), nil)
```


### OutputMoveTid

Create an instance: `let outputMoveTid = client.OutputMoveTid()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `productOrderUUIDs` | `[Value]` |  |
| `responseCode` | `Int` |  |
| `responseMessage` | `String` |  |
| `targetPackageOrderUUID` | `String` |  |
| `targetProductOrderUUID` | `String` |  |

#### Example: Create

```swift
let outputMoveTid = try client.OutputMoveTid().create(VMap([
    ("productOrderUUIDs", .list([])),  // [Value]
    ("responseCode", .int(1)),  // Int
    ("responseMessage", .string("example_responseMessage")),  // String
    ("targetPackageOrderUUID", .string("example_targetPackageOrderUUID")),  // String
    ("targetProductOrderUUID", .string("example_targetProductOrderUUID"))  // String
]), nil)
```


### OutputRemoveProduct

Create an instance: `let outputRemoveProduct = client.OutputRemoveProduct()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `String` |  |
| `productUUIDs` | `[Value]` |  |
| `responseCode` | `Int` |  |
| `responseMessage` | `String` |  |

#### Example: Create

```swift
let outputRemoveProduct = try client.OutputRemoveProduct().create(VMap([
    ("packageUUID", .string("example_packageUUID")),  // String
    ("productUUIDs", .list([])),  // [Value]
    ("responseCode", .int(1)),  // Int
    ("responseMessage", .string("example_responseMessage"))  // String
]), nil)
```


### OutputStart

Create an instance: `let outputStart = client.OutputStart()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `String` |  |
| `responseCode` | `Int` |  |
| `responseMessage` | `String` |  |

#### Example: Create

```swift
let outputStart = try client.OutputStart().create(VMap([
    ("responseCode", .int(1)),  // Int
    ("responseMessage", .string("example_responseMessage"))  // String
]), nil)
```


### OutputStatus

Create an instance: `let outputStatus = client.OutputStatus()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `Int` |  |
| `responseCode` | `Int` |  |
| `responseMessage` | `String` |  |
| `status` | `String` |  |

#### Example: Load

```swift
let outputStatus = try client.OutputStatus().load(VMap([("id", .string("output_status_id"))]), nil)
```


### OutputUpdateProduct

Create an instance: `let outputUpdateProduct = client.OutputUpdateProduct()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allowMultipleOrders` | `Bool` |  |
| `appFormName` | `String` |  |
| `contractNeeded` | `Bool` |  |
| `credentialsNeeded` | `Bool` |  |
| `descriptionKey` | `String` |  |
| `nameKey` | `String` |  |
| `prescreeningAllowed` | `Bool` |  |
| `productName` | `String` |  |
| `productStatus` | `String` |  |
| `productUUID` | `String` |  |
| `responseCode` | `Int` |  |
| `responseMessage` | `String` |  |
| `vendorName` | `String` |  |

#### Example: Create

```swift
let outputUpdateProduct = try client.OutputUpdateProduct().create(VMap([
    ("productUUID", .string("example_productUUID")),  // String
    ("responseCode", .int(1)),  // Int
    ("responseMessage", .string("example_responseMessage"))  // String
]), nil)
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

### Data as loose values

The Swift SDK uses a loose object model — the vendored `Value` enum
(with `VMap` / `VList` wrappers) throughout — rather than a bespoke typed
struct per endpoint. This mirrors the dynamic nature of the API and keeps the
SDK flexible: no regeneration is needed when the API schema changes.

Use the `.asMap` / `.asList` / `.asString` accessors to safely coerce a
`Value` to a concrete Swift type (each returns `nil` on a type mismatch).
A `BluefinTecsMerchantPortalTypes.swift` file of reference `struct` types is also
generated for editor documentation.

### Project structure

```
swift/
├── Package.swift                     -- SwiftPM manifest (zero runtime deps)
├── Sources/ProjectNameSDK/
│   ├── core/                         -- Main client, config, entity base, error type
│   ├── entity/                       -- Generated entity clients
│   ├── feature/                      -- Built-in features (Base, Test, Log, ...)
│   ├── utility/                      -- Utility functions
│   └── Struct/                       -- Vendored Voxgig Struct port
└── Tests/ProjectNameSDKTests/        -- Test suites (XCTest)
```

The main client class (`BluefinTecsMerchantPortalSDK`, under `Sources/ProjectNameSDK/core`)
exposes the entity accessors. Reference entity or utility types directly only
when needed. The SDK is dependency-free: JSON parsing is the vendored
`Struct/JSON.swift`, HTTP transport is Foundation's `URLSession`, and the
struct library is inlined under `Struct/`.

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
