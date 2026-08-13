# BluefinTecsMerchantPortal C# SDK



The C# SDK for the BluefinTecsMerchantPortal API — an entity-oriented client following idiomatic C# conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.MerchantPortalApiController()` — each
carrying a small, uniform set of operations (`load`, `create`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to NuGet. Install it from the GitHub
release tag (`csharp/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases)) or
from a source checkout — build the library and add a project reference:

```bash
cd csharp && dotnet build BluefinTecsMerchantPortalSDK.csproj
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```csharp
using BluefinTecsMerchantPortalSdk;

var client = new BluefinTecsMerchantPortalSDK();
```

### 4. Create, update, and remove

```csharp
// Create — returns the bare created record (as object?)
var created = client.MerchantPortalApiController().Create(new Dictionary<string, object?> { ["business_reg_number"] = "example_business_reg_number", ["city"] = "example_city", ["country"] = "example_country", ["currency"] = "example_currency", ["merchant_category_code"] = 1L, ["merchant_name"] = "example_merchant_name", ["packageid"] = "example_packageid", ["packageorderuuid"] = "example_packageorderuuid", ["reason_deactivation"] = "example_reason_deactivation", ["reason_reactivation"] = "example_reason_reactivation", ["street"] = "example_street", ["terminal_country_code"] = "example_terminal_country_code", ["terminal_language_code"] = "example_terminal_language_code", ["terminal_location"] = "example_terminal_location", ["terminal_serial_number"] = "example_terminal_serial_number", ["terminalid"] = 1L, ["vu_nummer"] = "example_vu_nummer", ["zipcode"] = "example_zipcode" });

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

```csharp
var result = client.Direct(new Dictionary<string, object?>
{
    ["path"] = "/api/resource/{id}",
    ["method"] = "GET",
    ["params"] = new Dictionary<string, object?> { ["id"] = "example" },
});

if (Equals(result["ok"], true))
{
    Console.WriteLine(result["status"]);  // 200
    Console.WriteLine(result["data"]);    // response body
}
else
{
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // read both with TryGetValue rather than indexing a key that may be absent.
    result.TryGetValue("status", out var status);
    result.TryGetValue("err", out var err);
    Console.WriteLine($"{status} {err}");
}
```

### Prepare a request without sending it

```csharp
// Prepare() returns the fetch definition and raises on error.
var fetchdef = client.Prepare(new Dictionary<string, object?>
{
    ["path"] = "/api/resource/{id}",
    ["method"] = "DELETE",
    ["params"] = new Dictionary<string, object?> { ["id"] = "example" },
});

Console.WriteLine(fetchdef["url"]);
Console.WriteLine(fetchdef["method"]);
Console.WriteLine(fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required:

```csharp
var client = BluefinTecsMerchantPortalSDK.TestSDK(null, null);

// Entity ops return the bare record and raise on error.
var outputDetail = client.OutputDetail().Load(new Dictionary<string, object?> { ["id"] = "test01" });
// outputDetail holds the mock response record
Console.WriteLine(outputDetail);
```

### Use a custom fetch function

Replace the HTTP transport with your own delegate:

```csharp
Func<string, Dictionary<string, object?>, Dictionary<string, object?>> mockFetch =
    (url, init) => new Dictionary<string, object?>
    {
        ["status"] = 200,
        ["statusText"] = "OK",
        ["headers"] = new Dictionary<string, object?>(),
        ["json"] = (Func<object?>)(() => new Dictionary<string, object?> { ["id"] = "mock01" }),
    };

var client = new BluefinTecsMerchantPortalSDK(new Dictionary<string, object?>
{
    ["base"] = "http://localhost:8080",
    ["system"] = new Dictionary<string, object?>
    {
        ["fetch"] = mockFetch,
    },
});
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run:

```bash
cd csharp && dotnet test
```


## Reference

### BluefinTecsMerchantPortalSDK

```csharp
using BluefinTecsMerchantPortalSdk;

var client = new BluefinTecsMerchantPortalSDK(options);
```

Creates a new SDK client. `options` is a `Dictionary<string, object?>`.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `Dictionary` | Feature activation flags. |
| `extend` | `List` | Additional Feature instances to load. |
| `system` | `Dictionary` | System overrides (e.g. custom `fetch` delegate). |

### TestSDK

```csharp
var client = BluefinTecsMerchantPortalSDK.TestSDK(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinTecsMerchantPortalSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `OptionsMap` | `() -> Dictionary` | Deep copy of current SDK options. |
| `GetUtility` | `() -> Utility` | Copy of the SDK utility object. |
| `Prepare` | `(fetchargs) -> Dictionary` | Build an HTTP request definition without sending. Raises on error. |
| `Direct` | `(fetchargs) -> Dictionary` | Build and send an HTTP request. Returns a result dictionary (branch on `ok`). |
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
| `Load` | `(reqmatch, ctrl) -> object?` | Load a single entity by match criteria. Raises on error. |
| `Create` | `(reqdata, ctrl) -> object?` | Create a new entity. Raises on error. |
| `Data` | `(newdata) -> object?` | Get or set entity data. |
| `Match` | `(newmatch) -> object?` | Get or set entity match criteria. |
| `Make` | `() -> IEntity` | Create a new instance with the same options. |
| `GetName` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `Dictionary` for
single-entity ops, an aggregate list for `List`) as `object?` and raise on
error. Wrap calls in `try`/`catch` to handle failures.

The `Direct()` escape hatch never raises — it returns a result
`Dictionary<string, object?>` you branch on via `result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `Dictionary` | Response headers. |
| `data` | `object?` | Parsed JSON response body. |

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

Create an instance: `var merchantPortalApiController = client.MerchantPortalApiController();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `long` |  |
| `additional_data` | `Dictionary<string, object?>` |  |
| `business_reg_number` | `string` |  |
| `city` | `string` |  |
| `corporateuuid` | `string` |  |
| `country` | `string` |  |
| `currency` | `string` |  |
| `merchant_category_code` | `long` |  |
| `merchant_email` | `string` |  |
| `merchant_name` | `string` |  |
| `merchant_phone_number` | `string` |  |
| `packageid` | `string` |  |
| `packageorderuuid` | `string` |  |
| `password` | `string` |  |
| `productid` | `string` |  |
| `productid_acquirer` | `string` |  |
| `reason_deactivation` | `string` |  |
| `reason_reactivation` | `string` |  |
| `sorting_code` | `long` |  |
| `state` | `string` |  |
| `street` | `string` |  |
| `terminal_country_code` | `string` |  |
| `terminal_language_code` | `string` |  |
| `terminal_location` | `string` |  |
| `terminal_serial_number` | `string` |  |
| `terminalid` | `long` |  |
| `terminalid_acquirer` | `string` |  |
| `user_email` | `string` |  |
| `user_phone_number` | `string` |  |
| `username` | `string` |  |
| `vu_nummer` | `string` |  |
| `web_shop_url` | `string` |  |
| `zipcode` | `string` |  |

#### Example: Create

```csharp
var merchantPortalApiController = client.MerchantPortalApiController().Create(new Dictionary<string, object?>
{
    ["business_reg_number"] = "example_business_reg_number",  // string
    ["city"] = "example_city",  // string
    ["country"] = "example_country",  // string
    ["currency"] = "example_currency",  // string
    ["merchant_category_code"] = 1L,  // long
    ["merchant_name"] = "example_merchant_name",  // string
    ["packageid"] = "example_packageid",  // string
    ["packageorderuuid"] = "example_packageorderuuid",  // string
    ["reason_deactivation"] = "example_reason_deactivation",  // string
    ["reason_reactivation"] = "example_reason_reactivation",  // string
    ["street"] = "example_street",  // string
    ["terminal_country_code"] = "example_terminal_country_code",  // string
    ["terminal_language_code"] = "example_terminal_language_code",  // string
    ["terminal_location"] = "example_terminal_location",  // string
    ["terminal_serial_number"] = "example_terminal_serial_number",  // string
    ["terminalid"] = 1L,  // long
    ["vu_nummer"] = "example_vu_nummer",  // string
    ["zipcode"] = "example_zipcode",  // string
});
```


### MerchantPortalCommonController

Create an instance: `var merchantPortalCommonController = client.MerchantPortalCommonController();`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match)` | Load a single entity by match criteria. |

#### Example: Load

```csharp
var merchantPortalCommonController = client.MerchantPortalCommonController().Load(null);
```


### MerchantPortalPamContractController

Create an instance: `var merchantPortalPamContractController = client.MerchantPortalPamContractController();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `string` |  |
| `productOrderUUID` | `string` |  |

#### Example: Create

```csharp
var merchantPortalPamContractController = client.MerchantPortalPamContractController().Create(new Dictionary<string, object?>
{
    ["language"] = "example_language",  // string
    ["productOrderUUID"] = "example_productOrderUUID",  // string
});
```


### MerchantPortalPamDocumentController

Create an instance: `var merchantPortalPamDocumentController = client.MerchantPortalPamDocumentController();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldDescUUID` | `string` |  |
| `packageOrderUUID` | `string` |  |
| `productOrderUUID` | `string` |  |

#### Example: Create

```csharp
var merchantPortalPamDocumentController = client.MerchantPortalPamDocumentController().Create(new Dictionary<string, object?>
{
    ["appFormFieldDescUUID"] = "example_appFormFieldDescUUID",  // string
});
```


### MerchantPortalPamFormController

Create an instance: `var merchantPortalPamFormController = client.MerchantPortalPamFormController();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldsDescUUID` | `string` |  |
| `filter` | `Dictionary<string, object?>` |  |
| `language` | `string` |  |
| `packageOrder` | `Dictionary<string, object?>` |  |
| `packageOrderUUID` | `string` |  |
| `packageUUID` | `string` |  |
| `productOrderUUID` | `string` |  |
| `productOrders` | `List<object?>` |  |
| `reasonOfReopening` | `string` |  |

#### Example: Create

```csharp
var merchantPortalPamFormController = client.MerchantPortalPamFormController().Create(new Dictionary<string, object?>
{
    ["appFormFieldsDescUUID"] = "example_appFormFieldsDescUUID",  // string
    ["language"] = "example_language",  // string
    ["packageOrderUUID"] = "example_packageOrderUUID",  // string
    ["reasonOfReopening"] = "example_reasonOfReopening",  // string
});
```


### MerchantPortalPamMandatorController

Create an instance: `var merchantPortalPamMandatorController = client.MerchantPortalPamMandatorController();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `clientSecret` | `string` |  |
| `mandatorName` | `string` |  |
| `notificationEmail` | `string` |  |
| `packageUUID` | `string` |  |

#### Example: Create

```csharp
var merchantPortalPamMandatorController = client.MerchantPortalPamMandatorController().Create(new Dictionary<string, object?>
{
    ["mandatorName"] = "example_mandatorName",  // string
    ["packageUUID"] = "example_packageUUID",  // string
});
```


### MerchantPortalPamMerchantController

Create an instance: `var merchantPortalPamMerchantController = client.MerchantPortalPamMerchantController();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `Dictionary<string, object?>` |  |
| `businessRegistrationNumber` | `string` |  |
| `city` | `string` |  |
| `companyName` | `string` |  |
| `corporateUUID` | `string` |  |
| `country` | `string` |  |
| `currency` | `string` |  |
| `email` | `string` |  |
| `language` | `string` |  |
| `login` | `string` |  |
| `mandator` | `string` |  |
| `merchantContractNumber` | `string` |  |
| `merchantName` | `string` |  |
| `merchant_category_code` | `string` |  |
| `packageUUID` | `string` |  |
| `packageorderuuid` | `string` |  |
| `phoneNumber` | `string` |  |
| `postalCode` | `string` |  |
| `productid_acquirer` | `string` |  |
| `region` | `string` |  |
| `registrationNumber` | `string` |  |
| `signature` | `string` |  |
| `street` | `string` |  |
| `terminalIds` | `List<object?>` |  |
| `terminalid_acquirer` | `string` |  |
| `vu_nummer` | `string` |  |

#### Example: Create

```csharp
var merchantPortalPamMerchantController = client.MerchantPortalPamMerchantController().Create(new Dictionary<string, object?>
{
    ["businessRegistrationNumber"] = "example_businessRegistrationNumber",  // string
    ["companyName"] = "example_companyName",  // string
    ["corporateUUID"] = "example_corporateUUID",  // string
    ["currency"] = "example_currency",  // string
    ["email"] = "example_email",  // string
    ["language"] = "example_language",  // string
    ["login"] = "example_login",  // string
    ["mandator"] = "example_mandator",  // string
    ["merchantContractNumber"] = "example_merchantContractNumber",  // string
    ["packageorderuuid"] = "example_packageorderuuid",  // string
    ["phoneNumber"] = "example_phoneNumber",  // string
    ["productid_acquirer"] = "example_productid_acquirer",  // string
    ["vu_nummer"] = "example_vu_nummer",  // string
});
```


### MerchantPortalPamPackageController

Create an instance: `var merchantPortalPamPackageController = client.MerchantPortalPamPackageController();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `string` |  |
| `corporateUUID` | `string` |  |
| `country` | `string` |  |
| `descriptionKey` | `string` |  |
| `filter` | `Dictionary<string, object?>` |  |
| `language` | `string` |  |
| `nameKey` | `string` |  |
| `packageStatus` | `string` |  |
| `packageUUID` | `string` |  |
| `pagination` | `Dictionary<string, object?>` |  |
| `sorting` | `Dictionary<string, object?>` |  |

#### Example: Create

```csharp
var merchantPortalPamPackageController = client.MerchantPortalPamPackageController().Create(new Dictionary<string, object?>
{
    ["language"] = "example_language",  // string
    ["packageUUID"] = "example_packageUUID",  // string
});
```


### MerchantPortalPamProductController

Create an instance: `var merchantPortalPamProductController = client.MerchantPortalPamProductController();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `string` |  |
| `filter` | `Dictionary<string, object?>` |  |
| `language` | `string` |  |
| `merchantID` | `string` |  |
| `packageOrderUUID` | `string` |  |
| `pagination` | `Dictionary<string, object?>` |  |
| `productOrderUUID` | `string` |  |
| `productUUID` | `string` |  |
| `reason_decline` | `string` |  |
| `sorting` | `Dictionary<string, object?>` |  |

#### Example: Create

```csharp
var merchantPortalPamProductController = client.MerchantPortalPamProductController().Create(new Dictionary<string, object?>
{
    ["packageOrderUUID"] = "example_packageOrderUUID",  // string
    ["productOrderUUID"] = "example_productOrderUUID",  // string
    ["productUUID"] = "example_productUUID",  // string
    ["reason_decline"] = "example_reason_decline",  // string
});
```


### OutputAddProduct

Create an instance: `var outputAddProduct = client.OutputAddProduct();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `string` |  |
| `productUUIDs` | `List<object?>` |  |
| `responseCode` | `long` |  |
| `responseMessage` | `string` |  |

#### Example: Create

```csharp
var outputAddProduct = client.OutputAddProduct().Create(new Dictionary<string, object?>
{
    ["packageUUID"] = "example_packageUUID",  // string
    ["productUUIDs"] = new List<object?>(),  // List<object?>
    ["responseCode"] = 1L,  // long
    ["responseMessage"] = "example_responseMessage",  // string
});
```


### OutputCreateProduct

Create an instance: `var outputCreateProduct = client.OutputCreateProduct();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirerId` | `string` |  |
| `allowMultipleOrders` | `bool` |  |
| `appFormTemplateName` | `string` |  |
| `contractNeeded` | `bool` |  |
| `credentialsNeeded` | `bool` |  |
| `descriptionKey` | `string` |  |
| `nameKey` | `string` |  |
| `prescreeningAllowed` | `bool` |  |
| `productName` | `string` |  |
| `responseCode` | `long` |  |
| `responseMessage` | `string` |  |
| `terminalTemplateName` | `string` |  |
| `vendorName` | `string` |  |
| `xmlTemplateFile` | `string` |  |

#### Example: Create

```csharp
var outputCreateProduct = client.OutputCreateProduct().Create(new Dictionary<string, object?>
{
    ["allowMultipleOrders"] = true,  // bool
    ["appFormTemplateName"] = "example_appFormTemplateName",  // string
    ["contractNeeded"] = true,  // bool
    ["descriptionKey"] = "example_descriptionKey",  // string
    ["nameKey"] = "example_nameKey",  // string
    ["prescreeningAllowed"] = true,  // bool
    ["productName"] = "example_productName",  // string
    ["responseCode"] = 1L,  // long
    ["responseMessage"] = "example_responseMessage",  // string
    ["terminalTemplateName"] = "example_terminalTemplateName",  // string
    ["vendorName"] = "example_vendorName",  // string
    ["xmlTemplateFile"] = "example_xmlTemplateFile",  // string
});
```


### OutputDetail

Create an instance: `var outputDetail = client.OutputDetail();`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `batch` | `Dictionary<string, object?>` |  |
| `lines` | `Dictionary<string, object?>` |  |
| `progress` | `Dictionary<string, object?>` |  |

#### Example: Load

```csharp
var outputDetail = client.OutputDetail().Load(new Dictionary<string, object?> { ["id"] = "output_detail_id" });
```


### OutputList

Create an instance: `var outputList = client.OutputList();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `items` | `List<object?>` |  |
| `pagination` | `Dictionary<string, object?>` |  |
| `responseCode` | `long` |  |
| `responseMessage` | `string` |  |
| `sorting` | `Dictionary<string, object?>` |  |

#### Example: Create

```csharp
var outputList = client.OutputList().Create(new Dictionary<string, object?>
{
    ["pagination"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["responseCode"] = 1L,  // long
    ["responseMessage"] = "example_responseMessage",  // string
});
```


### OutputMessage

Create an instance: `var outputMessage = client.OutputMessage();`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `responseCode` | `long` |  |
| `responseMessage` | `string` |  |

#### Example: Load

```csharp
var outputMessage = client.OutputMessage().Load(new Dictionary<string, object?> { ["id"] = "output_message_id" });
```


### OutputMoveTid

Create an instance: `var outputMoveTid = client.OutputMoveTid();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `productOrderUUIDs` | `List<object?>` |  |
| `responseCode` | `long` |  |
| `responseMessage` | `string` |  |
| `targetPackageOrderUUID` | `string` |  |
| `targetProductOrderUUID` | `string` |  |

#### Example: Create

```csharp
var outputMoveTid = client.OutputMoveTid().Create(new Dictionary<string, object?>
{
    ["productOrderUUIDs"] = new List<object?>(),  // List<object?>
    ["responseCode"] = 1L,  // long
    ["responseMessage"] = "example_responseMessage",  // string
    ["targetPackageOrderUUID"] = "example_targetPackageOrderUUID",  // string
    ["targetProductOrderUUID"] = "example_targetProductOrderUUID",  // string
});
```


### OutputRemoveProduct

Create an instance: `var outputRemoveProduct = client.OutputRemoveProduct();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `string` |  |
| `productUUIDs` | `List<object?>` |  |
| `responseCode` | `long` |  |
| `responseMessage` | `string` |  |

#### Example: Create

```csharp
var outputRemoveProduct = client.OutputRemoveProduct().Create(new Dictionary<string, object?>
{
    ["packageUUID"] = "example_packageUUID",  // string
    ["productUUIDs"] = new List<object?>(),  // List<object?>
    ["responseCode"] = 1L,  // long
    ["responseMessage"] = "example_responseMessage",  // string
});
```


### OutputStart

Create an instance: `var outputStart = client.OutputStart();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `string` |  |
| `responseCode` | `long` |  |
| `responseMessage` | `string` |  |

#### Example: Create

```csharp
var outputStart = client.OutputStart().Create(new Dictionary<string, object?>
{
    ["responseCode"] = 1L,  // long
    ["responseMessage"] = "example_responseMessage",  // string
});
```


### OutputStatus

Create an instance: `var outputStatus = client.OutputStatus();`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `long` |  |
| `responseCode` | `long` |  |
| `responseMessage` | `string` |  |
| `status` | `string` |  |

#### Example: Load

```csharp
var outputStatus = client.OutputStatus().Load(new Dictionary<string, object?> { ["id"] = "output_status_id" });
```


### OutputUpdateProduct

Create an instance: `var outputUpdateProduct = client.OutputUpdateProduct();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allowMultipleOrders` | `bool` |  |
| `appFormName` | `string` |  |
| `contractNeeded` | `bool` |  |
| `credentialsNeeded` | `bool` |  |
| `descriptionKey` | `string` |  |
| `nameKey` | `string` |  |
| `prescreeningAllowed` | `bool` |  |
| `productName` | `string` |  |
| `productStatus` | `string` |  |
| `productUUID` | `string` |  |
| `responseCode` | `long` |  |
| `responseMessage` | `string` |  |
| `vendorName` | `string` |  |

#### Example: Create

```csharp
var outputUpdateProduct = client.OutputUpdateProduct().Create(new Dictionary<string, object?>
{
    ["productUUID"] = "example_productUUID",  // string
    ["responseCode"] = 1L,  // long
    ["responseMessage"] = "example_responseMessage",  // string
});
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

### Data as dictionaries

The C# SDK uses a loose object model — `Dictionary<string, object?>`
throughout — rather than a bespoke typed class per endpoint. This mirrors
the dynamic nature of the API and keeps the SDK flexible: no regeneration is
needed when the API schema changes.

Use `Helpers.ToMapAny(value)` to safely coerce a value to a
`Dictionary<string, object?>`. A `BluefinTecsMerchantPortalTypes.cs` module of
reference `record` types is also generated for editor documentation.

### Project structure

```
csharp/
├── BluefinTecsMerchantPortalSDK.csproj    -- Library project (compiles everything except test/)
├── core/                       -- Main SDK client, config, entity base, error type
├── entity/                     -- Entity implementations
├── feature/                    -- Built-in features (Base, Test, Log, ...)
├── utility/                    -- Utility functions and the vendored struct library
└── test/                       -- xUnit test suites
```

The main client class (`BluefinTecsMerchantPortalSDK`, namespace
`BluefinTecsMerchantPortalSdk`) exposes the entity accessors. Reference entity or
utility types directly only when needed.

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
