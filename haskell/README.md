# BluefinTecsMerchantPortal Haskell SDK



The Haskell SDK for the BluefinTecsMerchantPortal API — an entity-oriented client following idiomatic Haskell conventions (pure functions, explicit `IO`, and the dependency-free vendored `Value` struct model).

The SDK exposes the API as capitalised, semantic **Entities** — for example `merchant_portal_api_controller sdk VNoval` — each
carrying a small, uniform set of operations (`eLoad`, `eCreate`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Hackage. Install it from the GitHub
release tag (`haskell/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases)) or
from a source checkout. The runtime has no third-party dependencies (only the
GHC boot libraries: `base`, `containers`, `array`, `time`), so the
bundled Makefile drives stock GHC with no cabal solve:

```bash
cd haskell && make test
```

A `.cabal` file is also generated for use with `cabal`/`stack`:

```bash
cd haskell && cabal build
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```haskell
import qualified SdkClient as Sdk
import VoxgigStruct (Value (..), emptyMap)
import SdkHelpers (jo)

main :: IO ()
main = do
  sdk <- Sdk.newSdk0
```

Entity operations raise on error (via `Control.Exception.throwIO`) and
return the bare result `Value`. Wrap a call in `Control.Exception.try`
to recover from failures.

### 4. Create, update, and remove

```haskell
  createEnt <- Sdk.merchant_portal_api_controller sdk VNoval
  d <- jo [("business_reg_number", VStr "example_business_reg_number"), ("city", VStr "example_city"), ("country", VStr "example_country"), ("currency", VStr "example_currency"), ("merchant_category_code", VNum 1), ("merchant_name", VStr "example_merchant_name"), ("packageid", VStr "example_packageid"), ("packageorderuuid", VStr "example_packageorderuuid"), ("reason_deactivation", VStr "example_reason_deactivation"), ("reason_reactivation", VStr "example_reason_reactivation"), ("street", VStr "example_street"), ("terminal_country_code", VStr "example_terminal_country_code"), ("terminal_language_code", VStr "example_terminal_language_code"), ("terminal_location", VStr "example_terminal_location"), ("terminal_serial_number", VStr "example_terminal_serial_number"), ("terminalid", VNum 1), ("vu_nummer", VStr "example_vu_nummer"), ("zipcode", VStr "example_zipcode")]
  cctrl <- emptyMap
  created <- Sdk.eCreate createEnt d cctrl
  print =<< Sdk.eDataGet created
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

For endpoints not covered by entity accessors, use `direct` — it never
raises and returns a result `Value` you branch on via its `ok` field:

```haskell
import qualified SdkClient as Sdk
import qualified SdkFeatures as F
import VoxgigStruct (Value (..))
import SdkHelpers (jo, getp)

main :: IO ()
main = do
  sdk <- Sdk.newSdk0
  params <- jo [("id", VStr "example")]
  args <- jo [("path", VStr "/api/resource/{id}"), ("method", VStr "GET"), ("params", params)]
  result <- F.direct sdk args
  ok <- getp result "ok"
  case ok of
    VBool True -> do
      status <- getp result "status"   -- e.g. VNum 200
      body <- getp result "data"       -- the response body
      print (status, body)
    _ -> do
      -- A non-2xx response carries status + data (the error body); a
      -- transport-level failure carries err instead.
      status <- getp result "status"
      err <- getp result "err"
      print (status, err)
```

### Prepare a request without sending it

```haskell
import qualified SdkClient as Sdk
import qualified SdkFeatures as F
import VoxgigStruct (Value (..))
import SdkHelpers (jo, getp)

main :: IO ()
main = do
  sdk <- Sdk.newSdk0
  params <- jo [("id", VStr "example")]
  args <- jo [("path", VStr "/api/resource/{id}"), ("method", VStr "DELETE"), ("params", params)]
  -- prepare returns the fetch definition and raises on error.
  fetchdef <- F.prepare sdk args
  url <- getp fetchdef "url"
  method <- getp fetchdef "method"
  print (url, method)
```

### Use test mode

Create a mock client for unit testing — no server required:

```haskell
import qualified SdkClient as Sdk
import qualified SdkFeatures as F
import VoxgigStruct (Value (..), emptyMap)
import SdkHelpers (jo)

main :: IO ()
main = do
  sdk <- Sdk.testSdk0
  ent <- Sdk.output_detail sdk VNoval
  arg <- jo [("id", VStr "test01")]
  ctrl <- emptyMap
  -- Entity ops return the bare record and raise on error.
  output_detail <- Sdk.eLoad ent arg ctrl
  print output_detail
```

### Use a custom fetch function

Replace the HTTP transport with your own `VFunc` under `system.fetch`:

```haskell
import qualified SdkClient as Sdk
import VoxgigStruct (Value (..))
import SdkHelpers (jo, jsonThunk)

customClient :: IO Sdk.Client
customClient = do
  let mockFetch = VFunc (\_ _ _ _ -> do
        body <- jo [("id", VStr "mock01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk body)])
  sys <- jo [("fetch", mockFetch)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  Sdk.newSdk opts
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run the suite (stock GHC, no third-party dependencies):

```bash
cd haskell && make test
```


## Reference

### Client constructors

```haskell
import qualified SdkClient as Sdk
import VoxgigStruct (Value (..))
import SdkHelpers (jo)

makeClient :: IO Sdk.Client
makeClient = do
  opts <- jo [("base", VStr "https://api.example.com")]
  Sdk.newSdk opts
```

`newSdk :: Value -> IO Client` constructs a client from an options map;
`newSdk0 :: IO Client` is the no-argument convenience form.

| Option (map key) | Type | Description |
| --- | --- | --- |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `headers` | `Value` | Custom headers for all requests. |
| `feature` | `Value` | Feature activation flags. |
| `system` | `Value` | System overrides (e.g. custom `fetch` function). |

### Test client

```haskell
client <- Sdk.testSdk testopts sdkopts
```

`testSdk :: Value -> Value -> IO Client` constructs a test-mode client with
mock transport (`testSdk0 :: IO Client` for the no-argument form). Pass
`VNoval` for defaults.

### Client functions

| Function | Signature | Description |
| --- | --- | --- |
| `newSdk` | `Value -> IO Client` | Construct a live client from options. |
| `newSdk0` | `IO Client` | Construct a live client with defaults. |
| `testSdk` | `Value -> Value -> IO Client` | Construct a test-mode client. |
| `prepare` | `Client -> Value -> IO Value` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `Client -> Value -> IO Value` | Build and send an HTTP request. Returns a result `Value` (branch on `ok`). |
| `merchant_portal_api_controller` | `Client -> Value -> IO Entity` | Create a MerchantPortalApiController entity instance. |
| `merchant_portal_common_controller` | `Client -> Value -> IO Entity` | Create a MerchantPortalCommonController entity instance. |
| `merchant_portal_pam_contract_controller` | `Client -> Value -> IO Entity` | Create a MerchantPortalPamContractController entity instance. |
| `merchant_portal_pam_document_controller` | `Client -> Value -> IO Entity` | Create a MerchantPortalPamDocumentController entity instance. |
| `merchant_portal_pam_form_controller` | `Client -> Value -> IO Entity` | Create a MerchantPortalPamFormController entity instance. |
| `merchant_portal_pam_mandator_controller` | `Client -> Value -> IO Entity` | Create a MerchantPortalPamMandatorController entity instance. |
| `merchant_portal_pam_merchant_controller` | `Client -> Value -> IO Entity` | Create a MerchantPortalPamMerchantController entity instance. |
| `merchant_portal_pam_package_controller` | `Client -> Value -> IO Entity` | Create a MerchantPortalPamPackageController entity instance. |
| `merchant_portal_pam_product_controller` | `Client -> Value -> IO Entity` | Create a MerchantPortalPamProductController entity instance. |
| `output_add_product` | `Client -> Value -> IO Entity` | Create an OutputAddProduct entity instance. |
| `output_create_product` | `Client -> Value -> IO Entity` | Create an OutputCreateProduct entity instance. |
| `output_detail` | `Client -> Value -> IO Entity` | Create an OutputDetail entity instance. |
| `output_list` | `Client -> Value -> IO Entity` | Create an OutputList entity instance. |
| `output_message` | `Client -> Value -> IO Entity` | Create an OutputMessage entity instance. |
| `output_move_tid` | `Client -> Value -> IO Entity` | Create an OutputMoveTid entity instance. |
| `output_remove_product` | `Client -> Value -> IO Entity` | Create an OutputRemoveProduct entity instance. |
| `output_start` | `Client -> Value -> IO Entity` | Create an OutputStart entity instance. |
| `output_status` | `Client -> Value -> IO Entity` | Create an OutputStatus entity instance. |
| `output_update_product` | `Client -> Value -> IO Entity` | Create an OutputUpdateProduct entity instance. |

### Entity interface

All entities share the same record interface (fields of the `Entity` type).

| Field | Signature | Description |
| --- | --- | --- |
| `eLoad` | `Value -> Value -> IO Entity` | Load a single entity by match criteria. Resolves to the entity. Raises on error. |
| `eCreate` | `Value -> Value -> IO Entity` | Create a new entity. Resolves to the entity. Raises on error. |
| `eDataGet` | `IO Value` | Get entity data. |
| `eDataSet` | `Value -> IO ()` | Set entity data. |
| `eStream` | `String -> Value -> Value -> IO [Value]` | Run an op as a lazy stream of items. |
| `eMake` | `IO Entity` | Create a new instance with the same options. |
| `eName` | `String` | The entity name. |

### Result shape

Entity operations resolve to the ENTITY, not the raw record — `eList` to
one entity per record — and raise on error. The record is reached through
`eDataGet`, which returns the entity's data container. `eRemove` resolves to
the entity marked deleted (`eDeleted`); it keeps the data it held. Wrap calls
in `Control.Exception.try` to handle failures.

The `direct` escape hatch never raises — it returns a result `Value`
you branch on via its `ok` field (read with `getp result "ok"`):

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Bool` | `True` if the HTTP status is 2xx. |
| `status` | `Int` | HTTP status code. |
| `headers` | `Value` | Response headers. |
| `data` | `Value` | Parsed JSON response body. |

On error, `ok` is `False` and `err` carries the error value.

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

Create an instance: `merchant_portal_api_controller <- Sdk.merchant_portal_api_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `Int` |  |
| `additional_data` | `Value` |  |
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

```haskell
  ent <- Sdk.merchant_portal_api_controller sdk VNoval
  d <- jo
    [ ("business_reg_number", VStr "example_business_reg_number")   -- String
    , ("city", VStr "example_city")   -- String
    , ("country", VStr "example_country")   -- String
    , ("currency", VStr "example_currency")   -- String
    , ("merchant_category_code", VNum 1)   -- Int
    , ("merchant_name", VStr "example_merchant_name")   -- String
    , ("packageid", VStr "example_packageid")   -- String
    , ("packageorderuuid", VStr "example_packageorderuuid")   -- String
    , ("reason_deactivation", VStr "example_reason_deactivation")   -- String
    , ("reason_reactivation", VStr "example_reason_reactivation")   -- String
    , ("street", VStr "example_street")   -- String
    , ("terminal_country_code", VStr "example_terminal_country_code")   -- String
    , ("terminal_language_code", VStr "example_terminal_language_code")   -- String
    , ("terminal_location", VStr "example_terminal_location")   -- String
    , ("terminal_serial_number", VStr "example_terminal_serial_number")   -- String
    , ("terminalid", VNum 1)   -- Int
    , ("vu_nummer", VStr "example_vu_nummer")   -- String
    , ("zipcode", VStr "example_zipcode")   -- String
    ]
  ctrl <- emptyMap
  merchant_portal_api_controller <- Sdk.eCreate ent d ctrl
  merchant_portal_api_controllerData <- Sdk.eDataGet merchant_portal_api_controller
```


### MerchantPortalCommonController

Create an instance: `merchant_portal_common_controller <- Sdk.merchant_portal_common_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Example: Load

```haskell
  ent <- Sdk.merchant_portal_common_controller sdk VNoval
  match <- jo []
  ctrl <- emptyMap
  merchant_portal_common_controller <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  merchant_portal_common_controllerData <- Sdk.eDataGet merchant_portal_common_controller
```


### MerchantPortalPamContractController

Create an instance: `merchant_portal_pam_contract_controller <- Sdk.merchant_portal_pam_contract_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `String` |  |
| `productOrderUUID` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.merchant_portal_pam_contract_controller sdk VNoval
  d <- jo
    [ ("language", VStr "example_language")   -- String
    , ("productOrderUUID", VStr "example_productOrderUUID")   -- String
    ]
  ctrl <- emptyMap
  merchant_portal_pam_contract_controller <- Sdk.eCreate ent d ctrl
  merchant_portal_pam_contract_controllerData <- Sdk.eDataGet merchant_portal_pam_contract_controller
```


### MerchantPortalPamDocumentController

Create an instance: `merchant_portal_pam_document_controller <- Sdk.merchant_portal_pam_document_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldDescUUID` | `String` |  |
| `packageOrderUUID` | `String` |  |
| `productOrderUUID` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.merchant_portal_pam_document_controller sdk VNoval
  d <- jo
    [ ("appFormFieldDescUUID", VStr "example_appFormFieldDescUUID")   -- String
    ]
  ctrl <- emptyMap
  merchant_portal_pam_document_controller <- Sdk.eCreate ent d ctrl
  merchant_portal_pam_document_controllerData <- Sdk.eDataGet merchant_portal_pam_document_controller
```


### MerchantPortalPamFormController

Create an instance: `merchant_portal_pam_form_controller <- Sdk.merchant_portal_pam_form_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldsDescUUID` | `String` |  |
| `filter` | `Value` |  |
| `language` | `String` |  |
| `packageOrder` | `Value` |  |
| `packageOrderUUID` | `String` |  |
| `packageUUID` | `String` |  |
| `productOrderUUID` | `String` |  |
| `productOrders` | `[Value]` |  |
| `reasonOfReopening` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.merchant_portal_pam_form_controller sdk VNoval
  d <- jo
    [ ("appFormFieldsDescUUID", VStr "example_appFormFieldsDescUUID")   -- String
    , ("language", VStr "example_language")   -- String
    , ("packageOrderUUID", VStr "example_packageOrderUUID")   -- String
    , ("reasonOfReopening", VStr "example_reasonOfReopening")   -- String
    ]
  ctrl <- emptyMap
  merchant_portal_pam_form_controller <- Sdk.eCreate ent d ctrl
  merchant_portal_pam_form_controllerData <- Sdk.eDataGet merchant_portal_pam_form_controller
```


### MerchantPortalPamMandatorController

Create an instance: `merchant_portal_pam_mandator_controller <- Sdk.merchant_portal_pam_mandator_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `clientSecret` | `String` |  |
| `mandatorName` | `String` |  |
| `notificationEmail` | `String` |  |
| `packageUUID` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.merchant_portal_pam_mandator_controller sdk VNoval
  d <- jo
    [ ("mandatorName", VStr "example_mandatorName")   -- String
    , ("packageUUID", VStr "example_packageUUID")   -- String
    ]
  ctrl <- emptyMap
  merchant_portal_pam_mandator_controller <- Sdk.eCreate ent d ctrl
  merchant_portal_pam_mandator_controllerData <- Sdk.eDataGet merchant_portal_pam_mandator_controller
```


### MerchantPortalPamMerchantController

Create an instance: `merchant_portal_pam_merchant_controller <- Sdk.merchant_portal_pam_merchant_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `Value` |  |
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

```haskell
  ent <- Sdk.merchant_portal_pam_merchant_controller sdk VNoval
  d <- jo
    [ ("businessRegistrationNumber", VStr "example_businessRegistrationNumber")   -- String
    , ("companyName", VStr "example_companyName")   -- String
    , ("corporateUUID", VStr "example_corporateUUID")   -- String
    , ("currency", VStr "example_currency")   -- String
    , ("email", VStr "example_email")   -- String
    , ("language", VStr "example_language")   -- String
    , ("login", VStr "example_login")   -- String
    , ("mandator", VStr "example_mandator")   -- String
    , ("merchantContractNumber", VStr "example_merchantContractNumber")   -- String
    , ("packageorderuuid", VStr "example_packageorderuuid")   -- String
    , ("phoneNumber", VStr "example_phoneNumber")   -- String
    , ("productid_acquirer", VStr "example_productid_acquirer")   -- String
    , ("vu_nummer", VStr "example_vu_nummer")   -- String
    ]
  ctrl <- emptyMap
  merchant_portal_pam_merchant_controller <- Sdk.eCreate ent d ctrl
  merchant_portal_pam_merchant_controllerData <- Sdk.eDataGet merchant_portal_pam_merchant_controller
```


### MerchantPortalPamPackageController

Create an instance: `merchant_portal_pam_package_controller <- Sdk.merchant_portal_pam_package_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `String` |  |
| `corporateUUID` | `String` |  |
| `country` | `String` |  |
| `descriptionKey` | `String` |  |
| `filter` | `Value` |  |
| `language` | `String` |  |
| `nameKey` | `String` |  |
| `packageStatus` | `String` |  |
| `packageUUID` | `String` |  |
| `pagination` | `Value` |  |
| `sorting` | `Value` |  |

#### Example: Create

```haskell
  ent <- Sdk.merchant_portal_pam_package_controller sdk VNoval
  d <- jo
    [ ("language", VStr "example_language")   -- String
    , ("packageUUID", VStr "example_packageUUID")   -- String
    ]
  ctrl <- emptyMap
  merchant_portal_pam_package_controller <- Sdk.eCreate ent d ctrl
  merchant_portal_pam_package_controllerData <- Sdk.eDataGet merchant_portal_pam_package_controller
```


### MerchantPortalPamProductController

Create an instance: `merchant_portal_pam_product_controller <- Sdk.merchant_portal_pam_product_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `String` |  |
| `filter` | `Value` |  |
| `language` | `String` |  |
| `merchantID` | `String` |  |
| `packageOrderUUID` | `String` |  |
| `pagination` | `Value` |  |
| `productOrderUUID` | `String` |  |
| `productUUID` | `String` |  |
| `reason_decline` | `String` |  |
| `sorting` | `Value` |  |

#### Example: Create

```haskell
  ent <- Sdk.merchant_portal_pam_product_controller sdk VNoval
  d <- jo
    [ ("packageOrderUUID", VStr "example_packageOrderUUID")   -- String
    , ("productOrderUUID", VStr "example_productOrderUUID")   -- String
    , ("productUUID", VStr "example_productUUID")   -- String
    , ("reason_decline", VStr "example_reason_decline")   -- String
    ]
  ctrl <- emptyMap
  merchant_portal_pam_product_controller <- Sdk.eCreate ent d ctrl
  merchant_portal_pam_product_controllerData <- Sdk.eDataGet merchant_portal_pam_product_controller
```


### OutputAddProduct

Create an instance: `output_add_product <- Sdk.output_add_product sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `String` |  |
| `productUUIDs` | `[Value]` |  |
| `responseCode` | `Int` |  |
| `responseMessage` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.output_add_product sdk VNoval
  d <- jo
    [ ("packageUUID", VStr "example_packageUUID")   -- String
    , ("productUUIDs", VNoval)   -- [Value]
    , ("responseCode", VNum 1)   -- Int
    , ("responseMessage", VStr "example_responseMessage")   -- String
    ]
  ctrl <- emptyMap
  output_add_product <- Sdk.eCreate ent d ctrl
  output_add_productData <- Sdk.eDataGet output_add_product
```


### OutputCreateProduct

Create an instance: `output_create_product <- Sdk.output_create_product sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

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

```haskell
  ent <- Sdk.output_create_product sdk VNoval
  d <- jo
    [ ("allowMultipleOrders", VBool True)   -- Bool
    , ("appFormTemplateName", VStr "example_appFormTemplateName")   -- String
    , ("contractNeeded", VBool True)   -- Bool
    , ("descriptionKey", VStr "example_descriptionKey")   -- String
    , ("nameKey", VStr "example_nameKey")   -- String
    , ("prescreeningAllowed", VBool True)   -- Bool
    , ("productName", VStr "example_productName")   -- String
    , ("responseCode", VNum 1)   -- Int
    , ("responseMessage", VStr "example_responseMessage")   -- String
    , ("terminalTemplateName", VStr "example_terminalTemplateName")   -- String
    , ("vendorName", VStr "example_vendorName")   -- String
    , ("xmlTemplateFile", VStr "example_xmlTemplateFile")   -- String
    ]
  ctrl <- emptyMap
  output_create_product <- Sdk.eCreate ent d ctrl
  output_create_productData <- Sdk.eDataGet output_create_product
```


### OutputDetail

Create an instance: `output_detail <- Sdk.output_detail sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `batch` | `Value` |  |
| `lines` | `Value` |  |
| `progress` | `Value` |  |

#### Example: Load

```haskell
  ent <- Sdk.output_detail sdk VNoval
  match <- jo [("id", VStr "output_detail_id")]
  ctrl <- emptyMap
  output_detail <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  output_detailData <- Sdk.eDataGet output_detail
```


### OutputList

Create an instance: `output_list <- Sdk.output_list sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `items` | `[Value]` |  |
| `pagination` | `Value` |  |
| `responseCode` | `Int` |  |
| `responseMessage` | `String` |  |
| `sorting` | `Value` |  |

#### Example: Create

```haskell
  ent <- Sdk.output_list sdk VNoval
  d <- jo
    [ ("pagination", VNoval)   -- Value
    , ("responseCode", VNum 1)   -- Int
    , ("responseMessage", VStr "example_responseMessage")   -- String
    ]
  ctrl <- emptyMap
  output_list <- Sdk.eCreate ent d ctrl
  output_listData <- Sdk.eDataGet output_list
```


### OutputMessage

Create an instance: `output_message <- Sdk.output_message sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `responseCode` | `Int` |  |
| `responseMessage` | `String` |  |

#### Example: Load

```haskell
  ent <- Sdk.output_message sdk VNoval
  match <- jo [("id", VStr "output_message_id")]
  ctrl <- emptyMap
  output_message <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  output_messageData <- Sdk.eDataGet output_message
```


### OutputMoveTid

Create an instance: `output_move_tid <- Sdk.output_move_tid sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `productOrderUUIDs` | `[Value]` |  |
| `responseCode` | `Int` |  |
| `responseMessage` | `String` |  |
| `targetPackageOrderUUID` | `String` |  |
| `targetProductOrderUUID` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.output_move_tid sdk VNoval
  d <- jo
    [ ("productOrderUUIDs", VNoval)   -- [Value]
    , ("responseCode", VNum 1)   -- Int
    , ("responseMessage", VStr "example_responseMessage")   -- String
    , ("targetPackageOrderUUID", VStr "example_targetPackageOrderUUID")   -- String
    , ("targetProductOrderUUID", VStr "example_targetProductOrderUUID")   -- String
    ]
  ctrl <- emptyMap
  output_move_tid <- Sdk.eCreate ent d ctrl
  output_move_tidData <- Sdk.eDataGet output_move_tid
```


### OutputRemoveProduct

Create an instance: `output_remove_product <- Sdk.output_remove_product sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `String` |  |
| `productUUIDs` | `[Value]` |  |
| `responseCode` | `Int` |  |
| `responseMessage` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.output_remove_product sdk VNoval
  d <- jo
    [ ("packageUUID", VStr "example_packageUUID")   -- String
    , ("productUUIDs", VNoval)   -- [Value]
    , ("responseCode", VNum 1)   -- Int
    , ("responseMessage", VStr "example_responseMessage")   -- String
    ]
  ctrl <- emptyMap
  output_remove_product <- Sdk.eCreate ent d ctrl
  output_remove_productData <- Sdk.eDataGet output_remove_product
```


### OutputStart

Create an instance: `output_start <- Sdk.output_start sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `String` |  |
| `responseCode` | `Int` |  |
| `responseMessage` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.output_start sdk VNoval
  d <- jo
    [ ("responseCode", VNum 1)   -- Int
    , ("responseMessage", VStr "example_responseMessage")   -- String
    ]
  ctrl <- emptyMap
  output_start <- Sdk.eCreate ent d ctrl
  output_startData <- Sdk.eDataGet output_start
```


### OutputStatus

Create an instance: `output_status <- Sdk.output_status sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `Int` |  |
| `responseCode` | `Int` |  |
| `responseMessage` | `String` |  |
| `status` | `String` |  |

#### Example: Load

```haskell
  ent <- Sdk.output_status sdk VNoval
  match <- jo [("id", VStr "output_status_id")]
  ctrl <- emptyMap
  output_status <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  output_statusData <- Sdk.eDataGet output_status
```


### OutputUpdateProduct

Create an instance: `output_update_product <- Sdk.output_update_product sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

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

```haskell
  ent <- Sdk.output_update_product sdk VNoval
  d <- jo
    [ ("productUUID", VStr "example_productUUID")   -- String
    , ("responseCode", VNum 1)   -- Int
    , ("responseMessage", VStr "example_responseMessage")   -- String
    ]
  ctrl <- emptyMap
  output_update_product <- Sdk.eCreate ent d ctrl
  output_update_productData <- Sdk.eDataGet output_update_product
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

### Data as struct Values

The Haskell SDK models every API record as the dynamic `Value` type (from
the vendored `VoxgigStruct` module) rather than bespoke Haskell records.
This mirrors the dynamic nature of the API and keeps the SDK flexible — no
new datatypes or code generation are needed when the API schema changes.

Build request maps with `jo [(key, value)]` and read fields back with
`getp value "field"`; scalars are the `VStr` / `VNum` / `VBool`
constructors, and `VNoval` stands for an absent property.

### Module structure

```
haskell/
├── src/
│   ├── VoxgigStruct.hs   -- vendored dependency-free struct library (Value)
│   ├── Vregex.hs         -- vendored regex support
│   ├── SdkTypes.hs       -- core types (Client, Entity, Feature)
│   ├── SdkHelpers.hs     -- helper functions (jo, getp, ...)
│   ├── SdkRuntime.hs     -- the generic operation pipeline
│   ├── SdkFeatures.hs    -- built-in features + makeEntity
│   ├── SdkConfig.hs      -- generated API configuration + feature factory
│   └── SdkClient.hs      -- generated public client (newSdk, entity accessors)
├── test/                 -- test suites
├── Makefile              -- stock-GHC build/test (no third-party deps)
└── bluefintecsmerchantportal-sdk.cabal      -- package manifest (for Hackage)
```

The public module (`SdkClient`) exports the SDK constructors (`newSdk`,
`testSdk`) and one accessor per entity. Import `VoxgigStruct` for the
`Value` constructors and `SdkHelpers` for `jo` / `getp`.

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
