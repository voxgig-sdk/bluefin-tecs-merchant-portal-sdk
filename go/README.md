# BluefinTecsMerchantPortal Golang SDK



The Golang SDK for the BluefinTecsMerchantPortal API — an entity-oriented client using standard Go conventions. No generics required; data flows as `map[string]any`.

It exposes the API as capitalised, semantic **Entities** — e.g. `client.MerchantPortalApiController(nil)` — each with the same small set of operations (`Load`, `Create`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
```bash
go get github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/go@latest
```

The Go module proxy resolves the version from the `go/vX.Y.Z` GitHub
release tag — see [Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases) for the available versions.

To vendor from a local checkout instead, clone this repo alongside your
project and add a `replace` directive pointing at the checked-out
`go/` directory:

```bash
go mod edit -replace github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/go=../bluefin-tecs-merchant-portal-sdk/go
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### Quickstart

A complete program: create a client, then call the entity operations.
Each operation returns `(value, error)` — the value is the data itself
(there is no `{ok, data}` wrapper), so check `err` and use the value
directly.

```go
package main

import (
    "fmt"
    sdk "github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/go"
)

func main() {
    client := sdk.New()

    // Create a merchantPortalApiController.
    created, err := client.MerchantPortalApiController(nil).Create(map[string]any{"business_reg_number": "example_business_reg_number", "city": "example_city", "country": "example_country", "currency": "example_currency", "merchant_category_code": 1, "merchant_name": "example_merchant_name", "packageid": "example_packageid", "packageorderuuid": "example_packageorderuuid", "reason_deactivation": "example_reason_deactivation", "reason_reactivation": "example_reason_reactivation", "street": "example_street", "terminal_country_code": "example_terminal_country_code", "terminal_language_code": "example_terminal_language_code", "terminal_location": "example_terminal_location", "terminal_serial_number": "example_terminal_serial_number", "terminalid": 1, "vu_nummer": "example_vu_nummer", "zipcode": "example_zipcode"}, nil)
    if err != nil {
        panic(err)
    }
    fmt.Println(created)
}
```


## Error handling

Every entity operation returns `(value, error)`. Check `err` before
using the value — there is no exception to catch:

```go
outputdetail, err := client.OutputDetail(nil).Load(map[string]any{"id": "example_id"}, nil)
if err != nil {
    // handle err
    return
}
_ = outputdetail
```

`Direct` follows the same `(value, error)` convention:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example_id"},
})
if err != nil {
    // handle err
}
_ = result
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

if result["ok"] == true {
    fmt.Println(result["status"]) // 200
    fmt.Println(result["data"])   // response body
}
```

### Prepare a request without sending it

```go
fetchdef, err := client.Prepare(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "DELETE",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

fmt.Println(fetchdef["url"])
fmt.Println(fetchdef["method"])
fmt.Println(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```go
client := sdk.Test()

outputDetail, err := client.OutputDetail(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
if err != nil {
    panic(err)
}
fmt.Println(outputDetail) // the returned mock data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```go
mockFetch := func(url string, init map[string]any) (map[string]any, error) {
    return map[string]any{
        "status":     200,
        "statusText": "OK",
        "headers":    map[string]any{},
        "json": (func() any)(func() any {
            return map[string]any{"id": "mock01"}
        }),
    }, nil
}

client := sdk.NewBluefinTecsMerchantPortalSDK(map[string]any{
    "base": "http://localhost:8080",
    "system": map[string]any{
        "fetch": (func(string, map[string]any) (map[string]any, error))(mockFetch),
    },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run:

```bash
cd go && go test ./test/...
```


## Reference

### NewBluefinTecsMerchantPortalSDK

```go
func NewBluefinTecsMerchantPortalSDK(options map[string]any) *BluefinTecsMerchantPortalSDK
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `"base"` | `string` | Base URL of the API server. |
| `"prefix"` | `string` | URL path prefix prepended to all requests. |
| `"suffix"` | `string` | URL path suffix appended to all requests. |
| `"feature"` | `map[string]any` | Feature activation flags. |
| `"extend"` | `[]any` | Additional Feature instances to load. |
| `"system"` | `map[string]any` | System overrides (e.g. custom `"fetch"` function). |

### TestSDK

```go
func TestSDK(testopts map[string]any, sdkopts map[string]any) *BluefinTecsMerchantPortalSDK
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinTecsMerchantPortalSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `OptionsMap` | `() map[string]any` | Deep copy of current SDK options. |
| `GetUtility` | `() *Utility` | Copy of the SDK utility object. |
| `Prepare` | `(fetchargs map[string]any) (map[string]any, error)` | Build an HTTP request definition without sending. |
| `Direct` | `(fetchargs map[string]any) (map[string]any, error)` | Build and send an HTTP request. |
| `MerchantPortalApiController` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create a MerchantPortalApiController entity instance. |
| `MerchantPortalCommonController` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create a MerchantPortalCommonController entity instance. |
| `MerchantPortalPamContractController` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create a MerchantPortalPamContractController entity instance. |
| `MerchantPortalPamDocumentController` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create a MerchantPortalPamDocumentController entity instance. |
| `MerchantPortalPamFormController` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create a MerchantPortalPamFormController entity instance. |
| `MerchantPortalPamMandatorController` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create a MerchantPortalPamMandatorController entity instance. |
| `MerchantPortalPamMerchantController` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create a MerchantPortalPamMerchantController entity instance. |
| `MerchantPortalPamPackageController` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create a MerchantPortalPamPackageController entity instance. |
| `MerchantPortalPamProductController` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create a MerchantPortalPamProductController entity instance. |
| `OutputAddProduct` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create an OutputAddProduct entity instance. |
| `OutputCreateProduct` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create an OutputCreateProduct entity instance. |
| `OutputDetail` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create an OutputDetail entity instance. |
| `OutputList` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create an OutputList entity instance. |
| `OutputMessage` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create an OutputMessage entity instance. |
| `OutputMoveTid` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create an OutputMoveTid entity instance. |
| `OutputRemoveProduct` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create an OutputRemoveProduct entity instance. |
| `OutputStart` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create an OutputStart entity instance. |
| `OutputStatus` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create an OutputStatus entity instance. |
| `OutputUpdateProduct` | `(data map[string]any) BluefinTecsMerchantPortalEntity` | Create an OutputUpdateProduct entity instance. |

### Entity interface (BluefinTecsMerchantPortalEntity)

All entities implement the `BluefinTecsMerchantPortalEntity` interface.

| Method | Signature | Description |
| --- | --- | --- |
| `Load` | `(reqmatch, ctrl map[string]any) (any, error)` | Load a single entity by match criteria. |
| `Create` | `(reqdata, ctrl map[string]any) (any, error)` | Create a new entity. |
| `Data` | `(args ...any) any` | Get or set entity data. |
| `Match` | `(args ...any) any` | Get or set entity match criteria. |
| `Make` | `() Entity` | Create a new instance with the same options. |
| `GetName` | `() string` | Return the entity name. |

### Result shape

Entity operations return `(value, error)`. The `value` is the
operation's data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `Load` / `Create` | the entity record (`map[string]any`) |

Check `err` first, then use the value directly (or the typed
`...Typed` variants, which return the entity's model struct and a typed
slice):

    merchantPortalApiController, err := client.MerchantPortalApiController(nil).Create(map[string]any{/* fields */}, nil)
    if err != nil { /* handle */ }
    // merchantPortalApiController is the returned record

Only `Direct()` returns a response envelope — a `map[string]any` with
`"ok"`, `"status"`, `"headers"`, and `"data"` keys.

### Entities

#### MerchantPortalApiController

| Field | Description |
| --- | --- |
| `"account_number"` |  |
| `"additional_data"` |  |
| `"business_reg_number"` |  |
| `"city"` |  |
| `"corporateuuid"` |  |
| `"country"` |  |
| `"currency"` |  |
| `"merchant_category_code"` |  |
| `"merchant_email"` |  |
| `"merchant_name"` |  |
| `"merchant_phone_number"` |  |
| `"packageid"` |  |
| `"packageorderuuid"` |  |
| `"password"` |  |
| `"productid"` |  |
| `"productid_acquirer"` |  |
| `"reason_deactivation"` |  |
| `"reason_reactivation"` |  |
| `"sorting_code"` |  |
| `"state"` |  |
| `"street"` |  |
| `"terminal_country_code"` |  |
| `"terminal_language_code"` |  |
| `"terminal_location"` |  |
| `"terminal_serial_number"` |  |
| `"terminalid"` |  |
| `"terminalid_acquirer"` |  |
| `"user_email"` |  |
| `"user_phone_number"` |  |
| `"username"` |  |
| `"vu_nummer"` |  |
| `"web_shop_url"` |  |
| `"zipcode"` |  |

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
| `"language"` |  |
| `"productOrderUUID"` |  |

Operations: Create.

API path: `/merchantportalws/generateContract`

#### MerchantPortalPamDocumentController

| Field | Description |
| --- | --- |
| `"appFormFieldDescUUID"` |  |
| `"packageOrderUUID"` |  |
| `"productOrderUUID"` |  |

Operations: Create.

API path: `/merchantportalws/documentsList`

#### MerchantPortalPamFormController

| Field | Description |
| --- | --- |
| `"appFormFieldsDescUUID"` |  |
| `"filter"` |  |
| `"language"` |  |
| `"packageOrder"` |  |
| `"packageOrderUUID"` |  |
| `"packageUUID"` |  |
| `"productOrderUUID"` |  |
| `"productOrders"` |  |
| `"reasonOfReopening"` |  |

Operations: Create.

API path: `/merchantportalws/applicationForm`

#### MerchantPortalPamMandatorController

| Field | Description |
| --- | --- |
| `"clientSecret"` |  |
| `"mandatorName"` |  |
| `"notificationEmail"` |  |
| `"packageUUID"` |  |

Operations: Create.

API path: `/merchantportalws/createMandatorConfig`

#### MerchantPortalPamMerchantController

| Field | Description |
| --- | --- |
| `"additional_data"` |  |
| `"businessRegistrationNumber"` |  |
| `"city"` |  |
| `"companyName"` |  |
| `"corporateUUID"` |  |
| `"country"` |  |
| `"currency"` |  |
| `"email"` |  |
| `"language"` |  |
| `"login"` |  |
| `"mandator"` |  |
| `"merchantContractNumber"` |  |
| `"merchantName"` |  |
| `"merchant_category_code"` |  |
| `"packageUUID"` |  |
| `"packageorderuuid"` |  |
| `"phoneNumber"` |  |
| `"postalCode"` |  |
| `"productid_acquirer"` |  |
| `"region"` |  |
| `"registrationNumber"` |  |
| `"signature"` |  |
| `"street"` |  |
| `"terminalIds"` |  |
| `"terminalid_acquirer"` |  |
| `"vu_nummer"` |  |

Operations: Create.

API path: `/merchantportalws/contractNumber`

#### MerchantPortalPamPackageController

| Field | Description |
| --- | --- |
| `"consumerUUID"` |  |
| `"corporateUUID"` |  |
| `"country"` |  |
| `"descriptionKey"` |  |
| `"filter"` |  |
| `"language"` |  |
| `"nameKey"` |  |
| `"packageStatus"` |  |
| `"packageUUID"` |  |
| `"pagination"` |  |
| `"sorting"` |  |

Operations: Create.

API path: `/merchantportalws/availablePackages`

#### MerchantPortalPamProductController

| Field | Description |
| --- | --- |
| `"consumerUUID"` |  |
| `"filter"` |  |
| `"language"` |  |
| `"merchantID"` |  |
| `"packageOrderUUID"` |  |
| `"pagination"` |  |
| `"productOrderUUID"` |  |
| `"productUUID"` |  |
| `"reason_decline"` |  |
| `"sorting"` |  |

Operations: Create.

API path: `/merchantportalws/approveProduct`

#### OutputAddProduct

| Field | Description |
| --- | --- |
| `"packageUUID"` |  |
| `"productUUIDs"` |  |
| `"responseCode"` |  |
| `"responseMessage"` |  |

Operations: Create.

API path: `/merchantportalws/addProductsToPackage`

#### OutputCreateProduct

| Field | Description |
| --- | --- |
| `"acquirerId"` |  |
| `"allowMultipleOrders"` |  |
| `"appFormTemplateName"` |  |
| `"contractNeeded"` |  |
| `"credentialsNeeded"` |  |
| `"descriptionKey"` |  |
| `"nameKey"` |  |
| `"prescreeningAllowed"` |  |
| `"productName"` |  |
| `"responseCode"` |  |
| `"responseMessage"` |  |
| `"terminalTemplateName"` |  |
| `"vendorName"` |  |
| `"xmlTemplateFile"` |  |

Operations: Create.

API path: `/merchantportalws/createNewProduct`

#### OutputDetail

| Field | Description |
| --- | --- |
| `"batch"` |  |
| `"lines"` |  |
| `"progress"` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/details/{id}`

#### OutputList

| Field | Description |
| --- | --- |
| `"items"` |  |
| `"pagination"` |  |
| `"responseCode"` |  |
| `"responseMessage"` |  |
| `"sorting"` |  |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/list`

#### OutputMessage

| Field | Description |
| --- | --- |
| `"responseCode"` |  |
| `"responseMessage"` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/restart/{id}`

#### OutputMoveTid

| Field | Description |
| --- | --- |
| `"productOrderUUIDs"` |  |
| `"responseCode"` |  |
| `"responseMessage"` |  |
| `"targetPackageOrderUUID"` |  |
| `"targetProductOrderUUID"` |  |

Operations: Create.

API path: `/merchantportalws/moveTid`

#### OutputRemoveProduct

| Field | Description |
| --- | --- |
| `"packageUUID"` |  |
| `"productUUIDs"` |  |
| `"responseCode"` |  |
| `"responseMessage"` |  |

Operations: Create.

API path: `/merchantportalws/removeProductsFromPackage`

#### OutputStart

| Field | Description |
| --- | --- |
| `"id"` |  |
| `"responseCode"` |  |
| `"responseMessage"` |  |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/start`

#### OutputStatus

| Field | Description |
| --- | --- |
| `"percentage"` |  |
| `"responseCode"` |  |
| `"responseMessage"` |  |
| `"status"` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/status/{id}`

#### OutputUpdateProduct

| Field | Description |
| --- | --- |
| `"allowMultipleOrders"` |  |
| `"appFormName"` |  |
| `"contractNeeded"` |  |
| `"credentialsNeeded"` |  |
| `"descriptionKey"` |  |
| `"nameKey"` |  |
| `"prescreeningAllowed"` |  |
| `"productName"` |  |
| `"productStatus"` |  |
| `"productUUID"` |  |
| `"responseCode"` |  |
| `"responseMessage"` |  |
| `"vendorName"` |  |

Operations: Create.

API path: `/merchantportalws/updateProduct`



## Entities


### MerchantPortalApiController

Create an instance: `merchantPortalApiController := client.MerchantPortalApiController(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `int` |  |
| `additional_data` | `map[string]any` |  |
| `business_reg_number` | `string` |  |
| `city` | `string` |  |
| `corporateuuid` | `string` |  |
| `country` | `string` |  |
| `currency` | `string` |  |
| `merchant_category_code` | `int` |  |
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
| `sorting_code` | `int` |  |
| `state` | `string` |  |
| `street` | `string` |  |
| `terminal_country_code` | `string` |  |
| `terminal_language_code` | `string` |  |
| `terminal_location` | `string` |  |
| `terminal_serial_number` | `string` |  |
| `terminalid` | `int` |  |
| `terminalid_acquirer` | `string` |  |
| `user_email` | `string` |  |
| `user_phone_number` | `string` |  |
| `username` | `string` |  |
| `vu_nummer` | `string` |  |
| `web_shop_url` | `string` |  |
| `zipcode` | `string` |  |

#### Example: Create

```go
result, err := client.MerchantPortalApiController(nil).Create(map[string]any{
    "business_reg_number": "example_business_reg_number",
    "city": "example_city",
    "country": "example_country",
    "currency": "example_currency",
    "merchant_category_code": 1,
    "merchant_name": "example_merchant_name",
    "packageid": "example_packageid",
    "packageorderuuid": "example_packageorderuuid",
    "reason_deactivation": "example_reason_deactivation",
    "reason_reactivation": "example_reason_reactivation",
    "street": "example_street",
    "terminal_country_code": "example_terminal_country_code",
    "terminal_language_code": "example_terminal_language_code",
    "terminal_location": "example_terminal_location",
    "terminal_serial_number": "example_terminal_serial_number",
    "terminalid": 1,
    "vu_nummer": "example_vu_nummer",
    "zipcode": "example_zipcode",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### MerchantPortalCommonController

Create an instance: `merchantPortalCommonController := client.MerchantPortalCommonController(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
merchantPortalCommonController, err := client.MerchantPortalCommonController(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(merchantPortalCommonController) // the loaded record
```


### MerchantPortalPamContractController

Create an instance: `merchantPortalPamContractController := client.MerchantPortalPamContractController(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `string` |  |
| `productOrderUUID` | `string` |  |

#### Example: Create

```go
result, err := client.MerchantPortalPamContractController(nil).Create(map[string]any{
    "language": "example_language",
    "productOrderUUID": "example_productOrderUUID",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### MerchantPortalPamDocumentController

Create an instance: `merchantPortalPamDocumentController := client.MerchantPortalPamDocumentController(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldDescUUID` | `string` |  |
| `packageOrderUUID` | `string` |  |
| `productOrderUUID` | `string` |  |

#### Example: Create

```go
result, err := client.MerchantPortalPamDocumentController(nil).Create(map[string]any{
    "appFormFieldDescUUID": "example_appFormFieldDescUUID",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### MerchantPortalPamFormController

Create an instance: `merchantPortalPamFormController := client.MerchantPortalPamFormController(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldsDescUUID` | `string` |  |
| `filter` | `map[string]any` |  |
| `language` | `string` |  |
| `packageOrder` | `map[string]any` |  |
| `packageOrderUUID` | `string` |  |
| `packageUUID` | `string` |  |
| `productOrderUUID` | `string` |  |
| `productOrders` | `[]any` |  |
| `reasonOfReopening` | `string` |  |

#### Example: Create

```go
result, err := client.MerchantPortalPamFormController(nil).Create(map[string]any{
    "appFormFieldsDescUUID": "example_appFormFieldsDescUUID",
    "language": "example_language",
    "packageOrderUUID": "example_packageOrderUUID",
    "reasonOfReopening": "example_reasonOfReopening",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### MerchantPortalPamMandatorController

Create an instance: `merchantPortalPamMandatorController := client.MerchantPortalPamMandatorController(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `clientSecret` | `string` |  |
| `mandatorName` | `string` |  |
| `notificationEmail` | `string` |  |
| `packageUUID` | `string` |  |

#### Example: Create

```go
result, err := client.MerchantPortalPamMandatorController(nil).Create(map[string]any{
    "mandatorName": "example_mandatorName",
    "packageUUID": "example_packageUUID",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### MerchantPortalPamMerchantController

Create an instance: `merchantPortalPamMerchantController := client.MerchantPortalPamMerchantController(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `map[string]any` |  |
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
| `terminalIds` | `[]any` |  |
| `terminalid_acquirer` | `string` |  |
| `vu_nummer` | `string` |  |

#### Example: Create

```go
result, err := client.MerchantPortalPamMerchantController(nil).Create(map[string]any{
    "businessRegistrationNumber": "example_businessRegistrationNumber",
    "companyName": "example_companyName",
    "corporateUUID": "example_corporateUUID",
    "currency": "example_currency",
    "email": "example_email",
    "language": "example_language",
    "login": "example_login",
    "mandator": "example_mandator",
    "merchantContractNumber": "example_merchantContractNumber",
    "packageorderuuid": "example_packageorderuuid",
    "phoneNumber": "example_phoneNumber",
    "productid_acquirer": "example_productid_acquirer",
    "vu_nummer": "example_vu_nummer",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### MerchantPortalPamPackageController

Create an instance: `merchantPortalPamPackageController := client.MerchantPortalPamPackageController(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `string` |  |
| `corporateUUID` | `string` |  |
| `country` | `string` |  |
| `descriptionKey` | `string` |  |
| `filter` | `map[string]any` |  |
| `language` | `string` |  |
| `nameKey` | `string` |  |
| `packageStatus` | `string` |  |
| `packageUUID` | `string` |  |
| `pagination` | `map[string]any` |  |
| `sorting` | `map[string]any` |  |

#### Example: Create

```go
result, err := client.MerchantPortalPamPackageController(nil).Create(map[string]any{
    "language": "example_language",
    "packageUUID": "example_packageUUID",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### MerchantPortalPamProductController

Create an instance: `merchantPortalPamProductController := client.MerchantPortalPamProductController(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `string` |  |
| `filter` | `map[string]any` |  |
| `language` | `string` |  |
| `merchantID` | `string` |  |
| `packageOrderUUID` | `string` |  |
| `pagination` | `map[string]any` |  |
| `productOrderUUID` | `string` |  |
| `productUUID` | `string` |  |
| `reason_decline` | `string` |  |
| `sorting` | `map[string]any` |  |

#### Example: Create

```go
result, err := client.MerchantPortalPamProductController(nil).Create(map[string]any{
    "packageOrderUUID": "example_packageOrderUUID",
    "productOrderUUID": "example_productOrderUUID",
    "productUUID": "example_productUUID",
    "reason_decline": "example_reason_decline",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### OutputAddProduct

Create an instance: `outputAddProduct := client.OutputAddProduct(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `string` |  |
| `productUUIDs` | `[]any` |  |
| `responseCode` | `int` |  |
| `responseMessage` | `string` |  |

#### Example: Create

```go
result, err := client.OutputAddProduct(nil).Create(map[string]any{
    "packageUUID": "example_packageUUID",
    "productUUIDs": []any{},
    "responseCode": 1,
    "responseMessage": "example_responseMessage",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### OutputCreateProduct

Create an instance: `outputCreateProduct := client.OutputCreateProduct(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

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
| `responseCode` | `int` |  |
| `responseMessage` | `string` |  |
| `terminalTemplateName` | `string` |  |
| `vendorName` | `string` |  |
| `xmlTemplateFile` | `string` |  |

#### Example: Create

```go
result, err := client.OutputCreateProduct(nil).Create(map[string]any{
    "allowMultipleOrders": true,
    "appFormTemplateName": "example_appFormTemplateName",
    "contractNeeded": true,
    "descriptionKey": "example_descriptionKey",
    "nameKey": "example_nameKey",
    "prescreeningAllowed": true,
    "productName": "example_productName",
    "responseCode": 1,
    "responseMessage": "example_responseMessage",
    "terminalTemplateName": "example_terminalTemplateName",
    "vendorName": "example_vendorName",
    "xmlTemplateFile": "example_xmlTemplateFile",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### OutputDetail

Create an instance: `outputDetail := client.OutputDetail(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `batch` | `map[string]any` |  |
| `lines` | `map[string]any` |  |
| `progress` | `map[string]any` |  |

#### Example: Load

```go
outputDetail, err := client.OutputDetail(nil).Load(map[string]any{"id": "output_detail_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(outputDetail) // the loaded record
```


### OutputList

Create an instance: `outputList := client.OutputList(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `items` | `[]any` |  |
| `pagination` | `map[string]any` |  |
| `responseCode` | `int` |  |
| `responseMessage` | `string` |  |
| `sorting` | `map[string]any` |  |

#### Example: Create

```go
result, err := client.OutputList(nil).Create(map[string]any{
    "pagination": map[string]any{},
    "responseCode": 1,
    "responseMessage": "example_responseMessage",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### OutputMessage

Create an instance: `outputMessage := client.OutputMessage(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `responseCode` | `int` |  |
| `responseMessage` | `string` |  |

#### Example: Load

```go
outputMessage, err := client.OutputMessage(nil).Load(map[string]any{"id": "output_message_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(outputMessage) // the loaded record
```


### OutputMoveTid

Create an instance: `outputMoveTid := client.OutputMoveTid(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `productOrderUUIDs` | `[]any` |  |
| `responseCode` | `int` |  |
| `responseMessage` | `string` |  |
| `targetPackageOrderUUID` | `string` |  |
| `targetProductOrderUUID` | `string` |  |

#### Example: Create

```go
result, err := client.OutputMoveTid(nil).Create(map[string]any{
    "productOrderUUIDs": []any{},
    "responseCode": 1,
    "responseMessage": "example_responseMessage",
    "targetPackageOrderUUID": "example_targetPackageOrderUUID",
    "targetProductOrderUUID": "example_targetProductOrderUUID",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### OutputRemoveProduct

Create an instance: `outputRemoveProduct := client.OutputRemoveProduct(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `string` |  |
| `productUUIDs` | `[]any` |  |
| `responseCode` | `int` |  |
| `responseMessage` | `string` |  |

#### Example: Create

```go
result, err := client.OutputRemoveProduct(nil).Create(map[string]any{
    "packageUUID": "example_packageUUID",
    "productUUIDs": []any{},
    "responseCode": 1,
    "responseMessage": "example_responseMessage",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### OutputStart

Create an instance: `outputStart := client.OutputStart(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `string` |  |
| `responseCode` | `int` |  |
| `responseMessage` | `string` |  |

#### Example: Create

```go
result, err := client.OutputStart(nil).Create(map[string]any{
    "responseCode": 1,
    "responseMessage": "example_responseMessage",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### OutputStatus

Create an instance: `outputStatus := client.OutputStatus(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `int` |  |
| `responseCode` | `int` |  |
| `responseMessage` | `string` |  |
| `status` | `string` |  |

#### Example: Load

```go
outputStatus, err := client.OutputStatus(nil).Load(map[string]any{"id": "output_status_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(outputStatus) // the loaded record
```


### OutputUpdateProduct

Create an instance: `outputUpdateProduct := client.OutputUpdateProduct(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

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
| `responseCode` | `int` |  |
| `responseMessage` | `string` |  |
| `vendorName` | `string` |  |

#### Example: Create

```go
result, err := client.OutputUpdateProduct(nil).Create(map[string]any{
    "productUUID": "example_productUUID",
    "responseCode": 1,
    "responseMessage": "example_responseMessage",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
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

Features are the extension mechanism. A feature implements the
`Feature` interface and provides hooks — functions keyed by pipeline
stage names.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as maps

The Go SDK uses `map[string]any` throughout rather than typed structs.
This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Use `core.ToMapAny()` to safely cast results and nested data.

### Package structure

```
github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/go/
├── bluefin-tecs-merchant-portal.go        # Root package — type aliases and constructors
├── core/               # SDK core — client, types, pipeline
├── entity/             # Entity implementations
├── feature/            # Built-in features (Base, Test, Log)
├── utility/            # Utility functions and struct library
└── test/               # Test suites
```

The root package (`github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/go`) re-exports everything needed
for normal use. Import sub-packages only when you need specific types
like `core.ToMapAny`.

### Entity state

Entity instances are stateful. After a successful `Load`, the entity
stores the returned data and match criteria internally.

```go
outputdetail := client.OutputDetail(nil)
outputdetail.Load(map[string]any{"id": "example_id"}, nil)

// outputdetail.Data() now returns the outputdetail data from the last load
// outputdetail.Match() returns the last match criteria
```

Call `Make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`Direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `Prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
