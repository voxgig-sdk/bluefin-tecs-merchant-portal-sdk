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
| `packageOrderUUID` | UUID of the package order. |
| `productOrderUUID` | UUID of the product order. |

Operations: Create.

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

Operations: Create.

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
| `reason_decline` | Reason for product decline. |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/approveProduct`

#### OutputAddProduct

| Field | Description |
| --- | --- |
| `packageUUID` | Unique identifier for the package. |
| `productUUIDs` | The list of unique identifiers of the products. |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: Create.

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
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/list`

#### OutputMessage

| Field | Description |
| --- | --- |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/restart/{id}`

#### OutputMoveTid

| Field | Description |
| --- | --- |
| `productOrderUUIDs` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `targetPackageOrderUUID` |  |
| `targetProductOrderUUID` |  |

Operations: Create.

API path: `/merchantportalws/moveTid`

#### OutputRemoveProduct

| Field | Description |
| --- | --- |
| `packageUUID` | Unique identifier for the package. |
| `productUUIDs` | List of product unique identifiers. |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: Create.

API path: `/merchantportalws/removeProductsFromPackage`

#### OutputStart

| Field | Description |
| --- | --- |
| `id` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/start`

#### OutputStatus

| Field | Description |
| --- | --- |
| `percentage` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `status` |  |

Operations: Load.

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
| `account_number` | `long` | Account number provided by the acquirer. |
| `additional_data` | `Dictionary<string, object?>` | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `string` | Merchant business registration number as stated in the company registry. |
| `city` | `string` | Merchant's address: city. |
| `corporateuuid` | `string` | Unique identifier for the corporate entity (UUID format). |
| `country` | `string` | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `string` | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `long` | Merchant category code as defined by the payment network. |
| `merchant_email` | `string` | Merchant's email address for receiving notifications. |
| `merchant_name` | `string` | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | `string` | Merchant's phone number for notifications. |
| `packageid` | `string` | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | `string` | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | `string` | Merchant password for MPOS. |
| `productid` | `string` | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | `string` | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | `string` | Reason for terminal deactivation. |
| `reason_reactivation` | `string` | Reason for terminal reactivation. |
| `sorting_code` | `long` | Sorting code provided by the acquirer. |
| `state` | `string` | Merchant's address: state. |
| `street` | `string` | Merchant's address: street and house number. |
| `terminal_country_code` | `string` | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `string` | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `string` | Physical or logical location of the terminal. |
| `terminal_serial_number` | `string` | Terminal serial number. |
| `terminalid` | `long` | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `string` | Terminal ID as set by the acquirer (optional). |
| `user_email` | `string` | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `string` | Phone number of the user acting on behalf of the merchant. |
| `username` | `string` | Merchant username for MPOS. |
| `vu_nummer` | `string` | Merchant contract number with the acquirer. |
| `web_shop_url` | `string` | URL of the merchant's web shop. |
| `zipcode` | `string` | Merchant's address: postal code. |

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
| `packageOrderUUID` | `string` | UUID of the package order. |
| `productOrderUUID` | `string` | UUID of the product order. |

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
| `packageOrderUUID` | `string` | UUID of the package order. |
| `packageUUID` | `string` |  |
| `productOrderUUID` | `string` | UUID of the product order. |
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
| `additional_data` | `Dictionary<string, object?>` | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` | `string` |  |
| `city` | `string` | City where the merchant is located. |
| `companyName` | `string` |  |
| `corporateUUID` | `string` | Unique identifier for the corporate entity. |
| `country` | `string` | Country where the merchant is located. |
| `currency` | `string` | Transaction currency in ISO 4217 format. |
| `email` | `string` |  |
| `language` | `string` |  |
| `login` | `string` |  |
| `mandator` | `string` | Mandator name assigned by TECS. |
| `merchantContractNumber` | `string` | Unique identifier for the merchant within a specific system. |
| `merchantName` | `string` | Name of the merchant. |
| `merchant_category_code` | `string` | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | `string` | UUID of the package. |
| `packageorderuuid` | `string` | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` | `string` |  |
| `postalCode` | `string` | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | `string` | Identifier of the product for which acquiring is to be enabled. |
| `region` | `string` | State or province where the merchant is located. |
| `registrationNumber` | `string` | Business registration number. |
| `signature` | `string` | Signature value = saltAsHex-hashAsHex. |
| `street` | `string` | Street address of the merchant. |
| `terminalIds` | `List<object?>` | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `string` | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `string` | Merchant contract number with the acquirer. |

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
| `country` | `string` | Country associated with the package. |
| `descriptionKey` | `string` | Key for the description of the package. |
| `filter` | `Dictionary<string, object?>` |  |
| `language` | `string` |  |
| `nameKey` | `string` | Key for the name of the package. |
| `packageStatus` | `string` | Status of the package. |
| `packageUUID` | `string` | Unique identifier for the package. |
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
| `reason_decline` | `string` | Reason for product decline. |
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
| `packageUUID` | `string` | Unique identifier for the package. |
| `productUUIDs` | `List<object?>` | The list of unique identifiers of the products. |
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |

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
| `acquirerId` | `string` | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `bool` | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `string` | Name of the application form template. |
| `contractNeeded` | `bool` | Indication whether contract is needed or not. |
| `credentialsNeeded` | `bool` | Indication whether credentials are needed or not. |
| `descriptionKey` | `string` | Key indicator for product description. |
| `nameKey` | `string` | Key indicator for product name. |
| `prescreeningAllowed` | `bool` | Indication whether prescreening is allowed or not. |
| `productName` | `string` | Name of the product. |
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |
| `terminalTemplateName` | `string` | Name of the terminal template. |
| `vendorName` | `string` | Name of the vendor. |
| `xmlTemplateFile` | `string` | A string value containing the XML template file encoded in Base64. |

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
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |
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
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |

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
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |
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
| `packageUUID` | `string` | Unique identifier for the package. |
| `productUUIDs` | `List<object?>` | List of product unique identifiers. |
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |

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
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |

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
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |
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
| `allowMultipleOrders` | `bool` | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `string` | The name of the application form |
| `contractNeeded` | `bool` | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `bool` | An attribute to indicate if credentials are needed |
| `descriptionKey` | `string` | The description of the product |
| `nameKey` | `string` | The key of the product name |
| `prescreeningAllowed` | `bool` | An attribute to indicate if prescreening is allowed |
| `productName` | `string` | The name of the product |
| `productStatus` | `string` | The status of the product |
| `productUUID` | `string` | The UUID of the product to update |
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |
| `vendorName` | `string` | The name of the vendor |

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
