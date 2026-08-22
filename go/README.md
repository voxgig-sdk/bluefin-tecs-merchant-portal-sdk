# BluefinTecsMerchantPortal Golang SDK



The Golang SDK for the BluefinTecsMerchantPortal API — an entity-oriented client using standard Go conventions. No generics required; data flows as `map[string]any`.

It exposes the API as capitalised, semantic **Entities** — e.g. `client.MerchantPortalApiController(nil)` — each with the same small set of operations (`Load`, `Create`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Also generated from this model: `c`, `clojure`, `cpp`, `csharp`, `dart`, `elixir`, `go-cli`, `go-mcp`, `java`, `js`, `kotlin`, `lua`, `ocaml`, `perl`, `php`, `py`, `rb`, `rust`, `scala`, `swift`, `ts`, `zig` — see
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
| `"account_number"` | Account number provided by the acquirer. |
| `"additional_data"` | Arbitrary merchant-specific data related to terminal registration. |
| `"business_reg_number"` | Merchant business registration number as stated in the company registry. |
| `"city"` | Merchant's address: city. |
| `"corporateuuid"` | Unique identifier for the corporate entity (UUID format). |
| `"country"` | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `"currency"` | Transaction currency (must be in "ISO 4217" format). |
| `"merchant_category_code"` | Merchant category code as defined by the payment network. |
| `"merchant_email"` | Merchant's email address for receiving notifications. |
| `"merchant_name"` | The officially incorporated company name of the merchant. |
| `"merchant_phone_number"` | Merchant's phone number for notifications. |
| `"packageid"` | Identifier of the package in the TECS processing engine provided by TECS. |
| `"packageorderuuid"` | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `"password"` | Merchant password for MPOS. |
| `"productid"` | Identifier of the product for which terminal registration is to be performed. |
| `"productid_acquirer"` | Identifier of the product for which acquiring is enabled. |
| `"reason_deactivation"` | Reason for terminal deactivation. |
| `"reason_reactivation"` | Reason for terminal reactivation. |
| `"sorting_code"` | Sorting code provided by the acquirer. |
| `"state"` | Merchant's address: state. |
| `"street"` | Merchant's address: street and house number. |
| `"terminal_country_code"` | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `"terminal_language_code"` | Terminal language code (must be in 'ISO 639-1' format). |
| `"terminal_location"` | Physical or logical location of the terminal. |
| `"terminal_serial_number"` | Terminal serial number. |
| `"terminalid"` | TECS terminalid given by Tecs processing engine. |
| `"terminalid_acquirer"` | Terminal ID as set by the acquirer (optional). |
| `"user_email"` | Email address of the user acting on behalf of the merchant. |
| `"user_phone_number"` | Phone number of the user acting on behalf of the merchant. |
| `"username"` | Merchant username for MPOS. |
| `"vu_nummer"` | Merchant contract number with the acquirer. |
| `"web_shop_url"` | URL of the merchant's web shop. |
| `"zipcode"` | Merchant's address: postal code. |

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
| `"packageOrderUUID"` | UUID of the package order. |
| `"productOrderUUID"` | UUID of the product order. |

Operations: Create.

API path: `/merchantportalws/documentsList`

#### MerchantPortalPamFormController

| Field | Description |
| --- | --- |
| `"appFormFieldsDescUUID"` |  |
| `"filter"` |  |
| `"language"` |  |
| `"packageOrder"` |  |
| `"packageOrderUUID"` | UUID of the package order. |
| `"packageUUID"` |  |
| `"productOrderUUID"` | UUID of the product order. |
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
| `"additional_data"` | Optional additional merchant-specific data related to enabling acquiring. |
| `"businessRegistrationNumber"` |  |
| `"city"` | City where the merchant is located. |
| `"companyName"` |  |
| `"corporateUUID"` | Unique identifier for the corporate entity. |
| `"country"` | Country where the merchant is located. |
| `"currency"` | Transaction currency in ISO 4217 format. |
| `"email"` |  |
| `"language"` |  |
| `"login"` |  |
| `"mandator"` | Mandator name assigned by TECS. |
| `"merchantContractNumber"` | Unique identifier for the merchant within a specific system. |
| `"merchantName"` | Name of the merchant. |
| `"merchant_category_code"` | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `"packageUUID"` | UUID of the package. |
| `"packageorderuuid"` | Unique identifier for the registered merchant in the TECS system. |
| `"phoneNumber"` |  |
| `"postalCode"` | Postal or ZIP code of the merchant’s location. |
| `"productid_acquirer"` | Identifier of the product for which acquiring is to be enabled. |
| `"region"` | State or province where the merchant is located. |
| `"registrationNumber"` | Business registration number. |
| `"signature"` | Signature value = saltAsHex-hashAsHex. |
| `"street"` | Street address of the merchant. |
| `"terminalIds"` | Optional list of terminal IDs for which acquiring should be activated. |
| `"terminalid_acquirer"` | Optional terminal ID provided by the acquirer. |
| `"vu_nummer"` | Merchant contract number with the acquirer. |

Operations: Create.

API path: `/merchantportalws/contractNumber`

#### MerchantPortalPamPackageController

| Field | Description |
| --- | --- |
| `"consumerUUID"` |  |
| `"corporateUUID"` |  |
| `"country"` | Country associated with the package. |
| `"descriptionKey"` | Key for the description of the package. |
| `"filter"` |  |
| `"language"` |  |
| `"nameKey"` | Key for the name of the package. |
| `"packageStatus"` | Status of the package. |
| `"packageUUID"` | Unique identifier for the package. |
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
| `"reason_decline"` | Reason for product decline. |
| `"sorting"` |  |

Operations: Create.

API path: `/merchantportalws/approveProduct`

#### OutputAddProduct

| Field | Description |
| --- | --- |
| `"packageUUID"` | Unique identifier for the package. |
| `"productUUIDs"` | The list of unique identifiers of the products. |
| `"responseCode"` | Response code. |
| `"responseMessage"` | Response message. |

Operations: Create.

API path: `/merchantportalws/addProductsToPackage`

#### OutputCreateProduct

| Field | Description |
| --- | --- |
| `"acquirerId"` | Unique identifier for the acquirer. |
| `"allowMultipleOrders"` | Indication whether multiple orders are allowed or not. |
| `"appFormTemplateName"` | Name of the application form template. |
| `"contractNeeded"` | Indication whether contract is needed or not. |
| `"credentialsNeeded"` | Indication whether credentials are needed or not. |
| `"descriptionKey"` | Key indicator for product description. |
| `"nameKey"` | Key indicator for product name. |
| `"prescreeningAllowed"` | Indication whether prescreening is allowed or not. |
| `"productName"` | Name of the product. |
| `"responseCode"` | Response code. |
| `"responseMessage"` | Response message. |
| `"terminalTemplateName"` | Name of the terminal template. |
| `"vendorName"` | Name of the vendor. |
| `"xmlTemplateFile"` | A string value containing the XML template file encoded in Base64. |

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
| `"responseCode"` | Response code. |
| `"responseMessage"` | Response message. |
| `"sorting"` |  |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/list`

#### OutputMessage

| Field | Description |
| --- | --- |
| `"responseCode"` | Response code. |
| `"responseMessage"` | Response message. |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/restart/{id}`

#### OutputMoveTid

| Field | Description |
| --- | --- |
| `"productOrderUUIDs"` |  |
| `"responseCode"` | Response code. |
| `"responseMessage"` | Response message. |
| `"targetPackageOrderUUID"` |  |
| `"targetProductOrderUUID"` |  |

Operations: Create.

API path: `/merchantportalws/moveTid`

#### OutputRemoveProduct

| Field | Description |
| --- | --- |
| `"packageUUID"` | Unique identifier for the package. |
| `"productUUIDs"` | List of product unique identifiers. |
| `"responseCode"` | Response code. |
| `"responseMessage"` | Response message. |

Operations: Create.

API path: `/merchantportalws/removeProductsFromPackage`

#### OutputStart

| Field | Description |
| --- | --- |
| `"id"` |  |
| `"responseCode"` | Response code. |
| `"responseMessage"` | Response message. |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/start`

#### OutputStatus

| Field | Description |
| --- | --- |
| `"percentage"` |  |
| `"responseCode"` | Response code. |
| `"responseMessage"` | Response message. |
| `"status"` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/status/{id}`

#### OutputUpdateProduct

| Field | Description |
| --- | --- |
| `"allowMultipleOrders"` | An attribute to indicate if multiple orders are allowed |
| `"appFormName"` | The name of the application form |
| `"contractNeeded"` | An attribute to indicate if a contract is needed |
| `"credentialsNeeded"` | An attribute to indicate if credentials are needed |
| `"descriptionKey"` | The description of the product |
| `"nameKey"` | The key of the product name |
| `"prescreeningAllowed"` | An attribute to indicate if prescreening is allowed |
| `"productName"` | The name of the product |
| `"productStatus"` | The status of the product |
| `"productUUID"` | The UUID of the product to update |
| `"responseCode"` | Response code. |
| `"responseMessage"` | Response message. |
| `"vendorName"` | The name of the vendor |

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
| `account_number` | `int` | Account number provided by the acquirer. |
| `additional_data` | `map[string]any` | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `string` | Merchant business registration number as stated in the company registry. |
| `city` | `string` | Merchant's address: city. |
| `corporateuuid` | `string` | Unique identifier for the corporate entity (UUID format). |
| `country` | `string` | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `string` | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `int` | Merchant category code as defined by the payment network. |
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
| `sorting_code` | `int` | Sorting code provided by the acquirer. |
| `state` | `string` | Merchant's address: state. |
| `street` | `string` | Merchant's address: street and house number. |
| `terminal_country_code` | `string` | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `string` | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `string` | Physical or logical location of the terminal. |
| `terminal_serial_number` | `string` | Terminal serial number. |
| `terminalid` | `int` | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `string` | Terminal ID as set by the acquirer (optional). |
| `user_email` | `string` | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `string` | Phone number of the user acting on behalf of the merchant. |
| `username` | `string` | Merchant username for MPOS. |
| `vu_nummer` | `string` | Merchant contract number with the acquirer. |
| `web_shop_url` | `string` | URL of the merchant's web shop. |
| `zipcode` | `string` | Merchant's address: postal code. |

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
| `packageOrderUUID` | `string` | UUID of the package order. |
| `productOrderUUID` | `string` | UUID of the product order. |

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
| `packageOrderUUID` | `string` | UUID of the package order. |
| `packageUUID` | `string` |  |
| `productOrderUUID` | `string` | UUID of the product order. |
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
| `additional_data` | `map[string]any` | Optional additional merchant-specific data related to enabling acquiring. |
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
| `terminalIds` | `[]any` | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `string` | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `string` | Merchant contract number with the acquirer. |

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
| `country` | `string` | Country associated with the package. |
| `descriptionKey` | `string` | Key for the description of the package. |
| `filter` | `map[string]any` |  |
| `language` | `string` |  |
| `nameKey` | `string` | Key for the name of the package. |
| `packageStatus` | `string` | Status of the package. |
| `packageUUID` | `string` | Unique identifier for the package. |
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
| `reason_decline` | `string` | Reason for product decline. |
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
| `packageUUID` | `string` | Unique identifier for the package. |
| `productUUIDs` | `[]any` | The list of unique identifiers of the products. |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `string` | Response message. |

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
| `acquirerId` | `string` | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `bool` | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `string` | Name of the application form template. |
| `contractNeeded` | `bool` | Indication whether contract is needed or not. |
| `credentialsNeeded` | `bool` | Indication whether credentials are needed or not. |
| `descriptionKey` | `string` | Key indicator for product description. |
| `nameKey` | `string` | Key indicator for product name. |
| `prescreeningAllowed` | `bool` | Indication whether prescreening is allowed or not. |
| `productName` | `string` | Name of the product. |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `string` | Response message. |
| `terminalTemplateName` | `string` | Name of the terminal template. |
| `vendorName` | `string` | Name of the vendor. |
| `xmlTemplateFile` | `string` | A string value containing the XML template file encoded in Base64. |

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
| `responseCode` | `int` | Response code. |
| `responseMessage` | `string` | Response message. |
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
| `responseCode` | `int` | Response code. |
| `responseMessage` | `string` | Response message. |

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
| `responseCode` | `int` | Response code. |
| `responseMessage` | `string` | Response message. |
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
| `packageUUID` | `string` | Unique identifier for the package. |
| `productUUIDs` | `[]any` | List of product unique identifiers. |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `string` | Response message. |

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
| `responseCode` | `int` | Response code. |
| `responseMessage` | `string` | Response message. |

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
| `responseCode` | `int` | Response code. |
| `responseMessage` | `string` | Response message. |
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
| `responseCode` | `int` | Response code. |
| `responseMessage` | `string` | Response message. |
| `vendorName` | `string` | The name of the vendor |

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
