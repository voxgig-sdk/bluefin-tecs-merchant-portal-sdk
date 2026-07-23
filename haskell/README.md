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
  print created
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
| `eLoad` | `Value -> Value -> IO Value` | Load a single entity by match criteria. Raises on error. |
| `eCreate` | `Value -> Value -> IO Value` | Create a new entity. Raises on error. |
| `eDataGet` | `IO Value` | Get entity data. |
| `eDataSet` | `Value -> IO ()` | Set entity data. |
| `eStream` | `String -> Value -> Value -> IO [Value]` | Run an op as a lazy stream of items. |
| `eMake` | `IO Entity` | Create a new instance with the same options. |
| `eName` | `String` | The entity name. |

### Result shape

Entity operations return the bare result `Value` (a map for single-entity
ops, a list for `eList`) and raise on error. Wrap calls in
`Control.Exception.try` to handle failures.

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
| `product_order_uuid` |  |

Operations: Create.

API path: `/merchantportalws/generateContract`

#### MerchantPortalPamDocumentController

| Field | Description |
| --- | --- |
| `app_form_field_desc_uuid` |  |
| `package_order_uuid` |  |
| `product_order_uuid` |  |

Operations: Create.

API path: `/merchantportalws/documentsList`

#### MerchantPortalPamFormController

| Field | Description |
| --- | --- |
| `app_form_fields_desc_uuid` |  |
| `filter` |  |
| `language` |  |
| `package_order` |  |
| `package_order_uuid` |  |
| `package_uuid` |  |
| `product_order` |  |
| `product_order_uuid` |  |
| `reason_of_reopening` |  |

Operations: Create.

API path: `/merchantportalws/applicationForm`

#### MerchantPortalPamMandatorController

| Field | Description |
| --- | --- |
| `client_secret` |  |
| `mandator_name` |  |
| `notification_email` |  |
| `package_uuid` |  |

Operations: Create.

API path: `/merchantportalws/createMandatorConfig`

#### MerchantPortalPamMerchantController

| Field | Description |
| --- | --- |
| `additional_data` |  |
| `business_registration_number` |  |
| `city` |  |
| `company_name` |  |
| `corporate_uuid` |  |
| `country` |  |
| `currency` |  |
| `email` |  |
| `language` |  |
| `login` |  |
| `mandator` |  |
| `merchant_category_code` |  |
| `merchant_contract_number` |  |
| `merchant_name` |  |
| `package_uuid` |  |
| `packageorderuuid` |  |
| `phone_number` |  |
| `postal_code` |  |
| `productid_acquirer` |  |
| `region` |  |
| `registration_number` |  |
| `signature` |  |
| `street` |  |
| `terminal_id` |  |
| `terminalid_acquirer` |  |
| `vu_nummer` |  |

Operations: Create.

API path: `/merchantportalws/contractNumber`

#### MerchantPortalPamPackageController

| Field | Description |
| --- | --- |
| `consumer_uuid` |  |
| `corporate_uuid` |  |
| `country` |  |
| `description_key` |  |
| `filter` |  |
| `language` |  |
| `name_key` |  |
| `package_status` |  |
| `package_uuid` |  |
| `pagination` |  |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/availablePackages`

#### MerchantPortalPamProductController

| Field | Description |
| --- | --- |
| `consumer_uuid` |  |
| `filter` |  |
| `language` |  |
| `merchant_id` |  |
| `package_order_uuid` |  |
| `pagination` |  |
| `product_order_uuid` |  |
| `product_uuid` |  |
| `reason_decline` |  |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/approveProduct`

#### OutputAddProduct

| Field | Description |
| --- | --- |
| `package_uuid` |  |
| `product_uui_d` |  |
| `response_code` |  |
| `response_message` |  |

Operations: Create.

API path: `/merchantportalws/addProductsToPackage`

#### OutputCreateProduct

| Field | Description |
| --- | --- |
| `acquirer_id` |  |
| `allow_multiple_order` |  |
| `app_form_template_name` |  |
| `contract_needed` |  |
| `credentials_needed` |  |
| `description_key` |  |
| `name_key` |  |
| `prescreening_allowed` |  |
| `product_name` |  |
| `response_code` |  |
| `response_message` |  |
| `terminal_template_name` |  |
| `vendor_name` |  |
| `xml_template_file` |  |

Operations: Create.

API path: `/merchantportalws/createNewProduct`

#### OutputDetail

| Field | Description |
| --- | --- |
| `detail` |  |
| `response_code` |  |
| `response_message` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/details/{id}`

#### OutputList

| Field | Description |
| --- | --- |
| `item` |  |
| `pagination` |  |
| `response_code` |  |
| `response_message` |  |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/list`

#### OutputMessage

| Field | Description |
| --- | --- |
| `response_code` |  |
| `response_message` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/restart/{id}`

#### OutputMoveTid

| Field | Description |
| --- | --- |
| `product_order_uui_d` |  |
| `response_code` |  |
| `response_message` |  |
| `target_package_order_uuid` |  |
| `target_product_order_uuid` |  |

Operations: Create.

API path: `/merchantportalws/moveTid`

#### OutputRemoveProduct

| Field | Description |
| --- | --- |
| `package_uuid` |  |
| `product_uui_d` |  |
| `response_code` |  |
| `response_message` |  |

Operations: Create.

API path: `/merchantportalws/removeProductsFromPackage`

#### OutputStart

| Field | Description |
| --- | --- |
| `id` |  |
| `response_code` |  |
| `response_message` |  |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/start`

#### OutputStatus

| Field | Description |
| --- | --- |
| `percentage` |  |
| `response_code` |  |
| `response_message` |  |
| `status` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/status/{id}`

#### OutputUpdateProduct

| Field | Description |
| --- | --- |
| `allow_multiple_order` |  |
| `app_form_name` |  |
| `contract_needed` |  |
| `credentials_needed` |  |
| `description_key` |  |
| `name_key` |  |
| `prescreening_allowed` |  |
| `product_name` |  |
| `product_status` |  |
| `product_uuid` |  |
| `response_code` |  |
| `response_message` |  |
| `vendor_name` |  |

Operations: Create.

API path: `/merchantportalws/updateProduct`



## Entities


### MerchantPortalApiController

Create an instance: `merchant_portal_api_controller <- Sdk.merchant_portal_api_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

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
```


### MerchantPortalCommonController

Create an instance: `merchant_portal_common_controller <- Sdk.merchant_portal_common_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Example: Load

```haskell
  ent <- Sdk.merchant_portal_common_controller sdk VNoval
  match <- jo []
  ctrl <- emptyMap
  merchant_portal_common_controller <- Sdk.eLoad ent match ctrl
```


### MerchantPortalPamContractController

Create an instance: `merchant_portal_pam_contract_controller <- Sdk.merchant_portal_pam_contract_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `String` |  |
| `product_order_uuid` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.merchant_portal_pam_contract_controller sdk VNoval
  d <- jo
    [ ("language", VStr "example_language")   -- String
    , ("product_order_uuid", VStr "example_product_order_uuid")   -- String
    ]
  ctrl <- emptyMap
  merchant_portal_pam_contract_controller <- Sdk.eCreate ent d ctrl
```


### MerchantPortalPamDocumentController

Create an instance: `merchant_portal_pam_document_controller <- Sdk.merchant_portal_pam_document_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_field_desc_uuid` | `String` |  |
| `package_order_uuid` | `String` |  |
| `product_order_uuid` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.merchant_portal_pam_document_controller sdk VNoval
  d <- jo
    [ ("app_form_field_desc_uuid", VStr "example_app_form_field_desc_uuid")   -- String
    ]
  ctrl <- emptyMap
  merchant_portal_pam_document_controller <- Sdk.eCreate ent d ctrl
```


### MerchantPortalPamFormController

Create an instance: `merchant_portal_pam_form_controller <- Sdk.merchant_portal_pam_form_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_fields_desc_uuid` | `String` |  |
| `filter` | `Value` |  |
| `language` | `String` |  |
| `package_order` | `Value` |  |
| `package_order_uuid` | `String` |  |
| `package_uuid` | `String` |  |
| `product_order` | `[Value]` |  |
| `product_order_uuid` | `String` |  |
| `reason_of_reopening` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.merchant_portal_pam_form_controller sdk VNoval
  d <- jo
    [ ("app_form_fields_desc_uuid", VStr "example_app_form_fields_desc_uuid")   -- String
    , ("language", VStr "example_language")   -- String
    , ("package_order_uuid", VStr "example_package_order_uuid")   -- String
    , ("reason_of_reopening", VStr "example_reason_of_reopening")   -- String
    ]
  ctrl <- emptyMap
  merchant_portal_pam_form_controller <- Sdk.eCreate ent d ctrl
```


### MerchantPortalPamMandatorController

Create an instance: `merchant_portal_pam_mandator_controller <- Sdk.merchant_portal_pam_mandator_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client_secret` | `String` |  |
| `mandator_name` | `String` |  |
| `notification_email` | `String` |  |
| `package_uuid` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.merchant_portal_pam_mandator_controller sdk VNoval
  d <- jo
    [ ("mandator_name", VStr "example_mandator_name")   -- String
    , ("package_uuid", VStr "example_package_uuid")   -- String
    ]
  ctrl <- emptyMap
  merchant_portal_pam_mandator_controller <- Sdk.eCreate ent d ctrl
```


### MerchantPortalPamMerchantController

Create an instance: `merchant_portal_pam_merchant_controller <- Sdk.merchant_portal_pam_merchant_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `Value` |  |
| `business_registration_number` | `String` |  |
| `city` | `String` |  |
| `company_name` | `String` |  |
| `corporate_uuid` | `String` |  |
| `country` | `String` |  |
| `currency` | `String` |  |
| `email` | `String` |  |
| `language` | `String` |  |
| `login` | `String` |  |
| `mandator` | `String` |  |
| `merchant_category_code` | `String` |  |
| `merchant_contract_number` | `String` |  |
| `merchant_name` | `String` |  |
| `package_uuid` | `String` |  |
| `packageorderuuid` | `String` |  |
| `phone_number` | `String` |  |
| `postal_code` | `String` |  |
| `productid_acquirer` | `String` |  |
| `region` | `String` |  |
| `registration_number` | `String` |  |
| `signature` | `String` |  |
| `street` | `String` |  |
| `terminal_id` | `[Value]` |  |
| `terminalid_acquirer` | `String` |  |
| `vu_nummer` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.merchant_portal_pam_merchant_controller sdk VNoval
  d <- jo
    [ ("business_registration_number", VStr "example_business_registration_number")   -- String
    , ("company_name", VStr "example_company_name")   -- String
    , ("corporate_uuid", VStr "example_corporate_uuid")   -- String
    , ("currency", VStr "example_currency")   -- String
    , ("email", VStr "example_email")   -- String
    , ("language", VStr "example_language")   -- String
    , ("login", VStr "example_login")   -- String
    , ("mandator", VStr "example_mandator")   -- String
    , ("merchant_contract_number", VStr "example_merchant_contract_number")   -- String
    , ("packageorderuuid", VStr "example_packageorderuuid")   -- String
    , ("phone_number", VStr "example_phone_number")   -- String
    , ("productid_acquirer", VStr "example_productid_acquirer")   -- String
    , ("vu_nummer", VStr "example_vu_nummer")   -- String
    ]
  ctrl <- emptyMap
  merchant_portal_pam_merchant_controller <- Sdk.eCreate ent d ctrl
```


### MerchantPortalPamPackageController

Create an instance: `merchant_portal_pam_package_controller <- Sdk.merchant_portal_pam_package_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `String` |  |
| `corporate_uuid` | `String` |  |
| `country` | `String` |  |
| `description_key` | `String` |  |
| `filter` | `Value` |  |
| `language` | `String` |  |
| `name_key` | `String` |  |
| `package_status` | `String` |  |
| `package_uuid` | `String` |  |
| `pagination` | `Value` |  |
| `sorting` | `Value` |  |

#### Example: Create

```haskell
  ent <- Sdk.merchant_portal_pam_package_controller sdk VNoval
  d <- jo
    [ ("language", VStr "example_language")   -- String
    , ("package_uuid", VStr "example_package_uuid")   -- String
    ]
  ctrl <- emptyMap
  merchant_portal_pam_package_controller <- Sdk.eCreate ent d ctrl
```


### MerchantPortalPamProductController

Create an instance: `merchant_portal_pam_product_controller <- Sdk.merchant_portal_pam_product_controller sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `String` |  |
| `filter` | `Value` |  |
| `language` | `String` |  |
| `merchant_id` | `String` |  |
| `package_order_uuid` | `String` |  |
| `pagination` | `Value` |  |
| `product_order_uuid` | `String` |  |
| `product_uuid` | `String` |  |
| `reason_decline` | `String` |  |
| `sorting` | `Value` |  |

#### Example: Create

```haskell
  ent <- Sdk.merchant_portal_pam_product_controller sdk VNoval
  d <- jo
    [ ("package_order_uuid", VStr "example_package_order_uuid")   -- String
    , ("product_order_uuid", VStr "example_product_order_uuid")   -- String
    , ("product_uuid", VStr "example_product_uuid")   -- String
    , ("reason_decline", VStr "example_reason_decline")   -- String
    ]
  ctrl <- emptyMap
  merchant_portal_pam_product_controller <- Sdk.eCreate ent d ctrl
```


### OutputAddProduct

Create an instance: `output_add_product <- Sdk.output_add_product sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `String` |  |
| `product_uui_d` | `[Value]` |  |
| `response_code` | `Int` |  |
| `response_message` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.output_add_product sdk VNoval
  d <- jo
    [ ("package_uuid", VStr "example_package_uuid")   -- String
    , ("product_uui_d", VNoval)   -- [Value]
    , ("response_code", VNum 1)   -- Int
    , ("response_message", VStr "example_response_message")   -- String
    ]
  ctrl <- emptyMap
  output_add_product <- Sdk.eCreate ent d ctrl
```


### OutputCreateProduct

Create an instance: `output_create_product <- Sdk.output_create_product sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirer_id` | `String` |  |
| `allow_multiple_order` | `Bool` |  |
| `app_form_template_name` | `String` |  |
| `contract_needed` | `Bool` |  |
| `credentials_needed` | `Bool` |  |
| `description_key` | `String` |  |
| `name_key` | `String` |  |
| `prescreening_allowed` | `Bool` |  |
| `product_name` | `String` |  |
| `response_code` | `Int` |  |
| `response_message` | `String` |  |
| `terminal_template_name` | `String` |  |
| `vendor_name` | `String` |  |
| `xml_template_file` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.output_create_product sdk VNoval
  d <- jo
    [ ("allow_multiple_order", VBool True)   -- Bool
    , ("app_form_template_name", VStr "example_app_form_template_name")   -- String
    , ("contract_needed", VBool True)   -- Bool
    , ("description_key", VStr "example_description_key")   -- String
    , ("name_key", VStr "example_name_key")   -- String
    , ("prescreening_allowed", VBool True)   -- Bool
    , ("product_name", VStr "example_product_name")   -- String
    , ("response_code", VNum 1)   -- Int
    , ("response_message", VStr "example_response_message")   -- String
    , ("terminal_template_name", VStr "example_terminal_template_name")   -- String
    , ("vendor_name", VStr "example_vendor_name")   -- String
    , ("xml_template_file", VStr "example_xml_template_file")   -- String
    ]
  ctrl <- emptyMap
  output_create_product <- Sdk.eCreate ent d ctrl
```


### OutputDetail

Create an instance: `output_detail <- Sdk.output_detail sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `detail` | `Value` |  |
| `response_code` | `Int` |  |
| `response_message` | `String` |  |

#### Example: Load

```haskell
  ent <- Sdk.output_detail sdk VNoval
  match <- jo [("id", VStr "output_detail_id")]
  ctrl <- emptyMap
  output_detail <- Sdk.eLoad ent match ctrl
```


### OutputList

Create an instance: `output_list <- Sdk.output_list sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `item` | `[Value]` |  |
| `pagination` | `Value` |  |
| `response_code` | `Int` |  |
| `response_message` | `String` |  |
| `sorting` | `Value` |  |

#### Example: Create

```haskell
  ent <- Sdk.output_list sdk VNoval
  d <- jo
    [ ("pagination", VNoval)   -- Value
    , ("response_code", VNum 1)   -- Int
    , ("response_message", VStr "example_response_message")   -- String
    ]
  ctrl <- emptyMap
  output_list <- Sdk.eCreate ent d ctrl
```


### OutputMessage

Create an instance: `output_message <- Sdk.output_message sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `response_code` | `Int` |  |
| `response_message` | `String` |  |

#### Example: Load

```haskell
  ent <- Sdk.output_message sdk VNoval
  match <- jo [("id", VStr "output_message_id")]
  ctrl <- emptyMap
  output_message <- Sdk.eLoad ent match ctrl
```


### OutputMoveTid

Create an instance: `output_move_tid <- Sdk.output_move_tid sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `product_order_uui_d` | `[Value]` |  |
| `response_code` | `Int` |  |
| `response_message` | `String` |  |
| `target_package_order_uuid` | `String` |  |
| `target_product_order_uuid` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.output_move_tid sdk VNoval
  d <- jo
    [ ("product_order_uui_d", VNoval)   -- [Value]
    , ("response_code", VNum 1)   -- Int
    , ("response_message", VStr "example_response_message")   -- String
    , ("target_package_order_uuid", VStr "example_target_package_order_uuid")   -- String
    , ("target_product_order_uuid", VStr "example_target_product_order_uuid")   -- String
    ]
  ctrl <- emptyMap
  output_move_tid <- Sdk.eCreate ent d ctrl
```


### OutputRemoveProduct

Create an instance: `output_remove_product <- Sdk.output_remove_product sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `String` |  |
| `product_uui_d` | `[Value]` |  |
| `response_code` | `Int` |  |
| `response_message` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.output_remove_product sdk VNoval
  d <- jo
    [ ("package_uuid", VStr "example_package_uuid")   -- String
    , ("product_uui_d", VNoval)   -- [Value]
    , ("response_code", VNum 1)   -- Int
    , ("response_message", VStr "example_response_message")   -- String
    ]
  ctrl <- emptyMap
  output_remove_product <- Sdk.eCreate ent d ctrl
```


### OutputStart

Create an instance: `output_start <- Sdk.output_start sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `String` |  |
| `response_code` | `Int` |  |
| `response_message` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.output_start sdk VNoval
  d <- jo
    [ ("response_code", VNum 1)   -- Int
    , ("response_message", VStr "example_response_message")   -- String
    ]
  ctrl <- emptyMap
  output_start <- Sdk.eCreate ent d ctrl
```


### OutputStatus

Create an instance: `output_status <- Sdk.output_status sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `Int` |  |
| `response_code` | `Int` |  |
| `response_message` | `String` |  |
| `status` | `String` |  |

#### Example: Load

```haskell
  ent <- Sdk.output_status sdk VNoval
  match <- jo [("id", VStr "output_status_id")]
  ctrl <- emptyMap
  output_status <- Sdk.eLoad ent match ctrl
```


### OutputUpdateProduct

Create an instance: `output_update_product <- Sdk.output_update_product sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allow_multiple_order` | `Bool` |  |
| `app_form_name` | `String` |  |
| `contract_needed` | `Bool` |  |
| `credentials_needed` | `Bool` |  |
| `description_key` | `String` |  |
| `name_key` | `String` |  |
| `prescreening_allowed` | `Bool` |  |
| `product_name` | `String` |  |
| `product_status` | `String` |  |
| `product_uuid` | `String` |  |
| `response_code` | `Int` |  |
| `response_message` | `String` |  |
| `vendor_name` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.output_update_product sdk VNoval
  d <- jo
    [ ("product_uuid", VStr "example_product_uuid")   -- String
    , ("response_code", VNum 1)   -- Int
    , ("response_message", VStr "example_response_message")   -- String
    ]
  ctrl <- emptyMap
  output_update_product <- Sdk.eCreate ent d ctrl
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
