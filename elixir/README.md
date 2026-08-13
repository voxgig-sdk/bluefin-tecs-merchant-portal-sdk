# BluefinTecsMerchantPortal Elixir SDK



The Elixir SDK for the BluefinTecsMerchantPortal API — an entity-oriented client
following idiomatic, functional Elixir conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `BluefinTecsMerchantPortal.merchant_portal_api_controller(sdk)` — each
carrying a small, uniform set of operations (`load`, `create`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to [Hex](https://hex.pm). Install it from
the GitHub release tag (`elixir/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases))
by adding a git dependency to your `mix.exs`:

```elixir
def deps do
  [
    {:bluefin_tecs_merchant_portal, git: "https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk.git", tag: "elixir/vX.Y.Z"}
  ]
end
```

Or from a local source checkout:

```elixir
def deps do
  [
    {:bluefin_tecs_merchant_portal, path: "../bluefin-tecs-merchant-portal-sdk/elixir"}
  ]
end
```

Then run `mix deps.get`.


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```elixir
alias BluefinTecsMerchantPortal.Helpers, as: H

sdk = BluefinTecsMerchantPortal.new()
```

### 4. Create, update, and remove

```elixir
merchant_portal_api_controller = BluefinTecsMerchantPortal.merchant_portal_api_controller(sdk)

# Create — returns the bare created record
created = BluefinTecsMerchantPortal.Entity.MerchantPortalApiController.create(merchant_portal_api_controller, H.deep(%{"business_reg_number" => "example_business_reg_number", "city" => "example_city", "country" => "example_country", "currency" => "example_currency", "merchant_category_code" => 1, "merchant_name" => "example_merchant_name", "packageid" => "example_packageid", "packageorderuuid" => "example_packageorderuuid", "reason_deactivation" => "example_reason_deactivation", "reason_reactivation" => "example_reason_reactivation", "street" => "example_street", "terminal_country_code" => "example_terminal_country_code", "terminal_language_code" => "example_terminal_language_code", "terminal_location" => "example_terminal_location", "terminal_serial_number" => "example_terminal_serial_number", "terminalid" => 1, "vu_nummer" => "example_vu_nummer", "zipcode" => "example_zipcode"}))

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

For endpoints not covered by entity operations. `direct/2` never raises —
it returns a result node you branch on with `Voxgig.Struct.getprop/2`:

```elixir
alias Voxgig.Struct, as: S
alias BluefinTecsMerchantPortal.Helpers, as: H

result = BluefinTecsMerchantPortal.direct(sdk, H.deep(%{
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => %{"id" => "example"}
}))

if S.getprop(result, "ok") do
  IO.inspect(S.getprop(result, "status"))  # 200
  IO.inspect(S.getprop(result, "data"))    # response body
else
  # A non-2xx response carries status + data (the error body); a
  # transport-level failure carries err instead.
  IO.inspect(S.getprop(result, "err"))
end
```

### Prepare a request without sending it

```elixir
alias BluefinTecsMerchantPortal.Helpers, as: H

# prepare/2 returns the fetch definition and raises on error.
fetchdef = BluefinTecsMerchantPortal.prepare(sdk, H.deep(%{
  "path" => "/api/resource/{id}",
  "method" => "DELETE",
  "params" => %{"id" => "example"}
}))

IO.inspect(Voxgig.Struct.getprop(fetchdef, "url"))
IO.inspect(Voxgig.Struct.getprop(fetchdef, "method"))
```

### Use test mode

Create a mock client for unit testing — no server required:

```elixir
alias BluefinTecsMerchantPortal.Helpers, as: H

sdk = BluefinTecsMerchantPortal.test()

# Entity ops return the bare record (raise on error).
output_detail = BluefinTecsMerchantPortal.output_detail(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputDetail.load(output_detail, H.deep(%{"id" => "test01"}))
IO.inspect(record)
```

### Use a custom fetch function

Replace the HTTP transport with your own function. It receives `(url,
fetchdef)` and returns a `{response, error}` tuple:

```elixir
alias Voxgig.Struct, as: S
alias BluefinTecsMerchantPortal.Helpers, as: H

mock_fetch = fn _url, _fetchdef ->
  response = H.deep(%{
    "status" => 200,
    "statusText" => "OK",
    "headers" => %{},
    "json" => fn -> %{"id" => "mock01"} end
  })
  {response, nil}
end

sdk = BluefinTecsMerchantPortal.new(H.deep(%{
  "base" => "http://localhost:8080",
  "system" => %{"fetch" => mock_fetch}
}))
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run:

```bash
cd elixir && mix test
```


## Reference

### BluefinTecsMerchantPortal

```elixir
sdk = BluefinTecsMerchantPortal.new(options)
```

Creates a new SDK client. `options` is a struct value node — build one from a
native map with `BluefinTecsMerchantPortal.Helpers.deep/1`.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `String.t()` | Base URL of the API server. |
| `prefix` | `String.t()` | URL path prefix prepended to all requests. |
| `suffix` | `String.t()` | URL path suffix appended to all requests. |
| `feature` | `map()` | Feature activation flags. |
| `extend` | `list()` | Additional feature instances to load. |
| `system` | `map()` | System overrides (e.g. custom `fetch` function). |

### test

```elixir
sdk = BluefinTecsMerchantPortal.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinTecsMerchantPortal functions

| Function | Signature | Description |
| --- | --- | --- |
| `options_map` | `(client) :: map()` | Deep copy of current SDK options. |
| `get_utility` | `(client) :: map()` | The SDK utility node. |
| `prepare` | `(client, fetchargs) :: map()` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(client, fetchargs) :: map()` | Build and send an HTTP request. Returns a result node (branch on `ok`). |
| `merchant_portal_api_controller` | `(client, entopts \\ nil) :: entity` | Create a MerchantPortalApiController entity handle. |
| `merchant_portal_common_controller` | `(client, entopts \\ nil) :: entity` | Create a MerchantPortalCommonController entity handle. |
| `merchant_portal_pam_contract_controller` | `(client, entopts \\ nil) :: entity` | Create a MerchantPortalPamContractController entity handle. |
| `merchant_portal_pam_document_controller` | `(client, entopts \\ nil) :: entity` | Create a MerchantPortalPamDocumentController entity handle. |
| `merchant_portal_pam_form_controller` | `(client, entopts \\ nil) :: entity` | Create a MerchantPortalPamFormController entity handle. |
| `merchant_portal_pam_mandator_controller` | `(client, entopts \\ nil) :: entity` | Create a MerchantPortalPamMandatorController entity handle. |
| `merchant_portal_pam_merchant_controller` | `(client, entopts \\ nil) :: entity` | Create a MerchantPortalPamMerchantController entity handle. |
| `merchant_portal_pam_package_controller` | `(client, entopts \\ nil) :: entity` | Create a MerchantPortalPamPackageController entity handle. |
| `merchant_portal_pam_product_controller` | `(client, entopts \\ nil) :: entity` | Create a MerchantPortalPamProductController entity handle. |
| `output_add_product` | `(client, entopts \\ nil) :: entity` | Create an OutputAddProduct entity handle. |
| `output_create_product` | `(client, entopts \\ nil) :: entity` | Create an OutputCreateProduct entity handle. |
| `output_detail` | `(client, entopts \\ nil) :: entity` | Create an OutputDetail entity handle. |
| `output_list` | `(client, entopts \\ nil) :: entity` | Create an OutputList entity handle. |
| `output_message` | `(client, entopts \\ nil) :: entity` | Create an OutputMessage entity handle. |
| `output_move_tid` | `(client, entopts \\ nil) :: entity` | Create an OutputMoveTid entity handle. |
| `output_remove_product` | `(client, entopts \\ nil) :: entity` | Create an OutputRemoveProduct entity handle. |
| `output_start` | `(client, entopts \\ nil) :: entity` | Create an OutputStart entity handle. |
| `output_status` | `(client, entopts \\ nil) :: entity` | Create an OutputStatus entity handle. |
| `output_update_product` | `(client, entopts \\ nil) :: entity` | Create an OutputUpdateProduct entity handle. |

### Entity interface

Every entity's `BluefinTecsMerchantPortal.Entity.<Name>` module shares the same interface.

| Function | Signature | Description |
| --- | --- | --- |
| `load` | `(entity, reqmatch, ctrl \\ nil) :: map()` | Load a single entity by match criteria. Raises on error. |
| `create` | `(entity, reqdata, ctrl \\ nil) :: map()` | Create a new entity. Raises on error. |
| `data_get` | `(entity) :: map()` | Get entity data. |
| `data_set` | `(entity, data)` | Set entity data. |
| `match_get` | `(entity) :: map()` | Get entity match criteria. |
| `match_set` | `(entity, match)` | Set entity match criteria. |
| `make` | `(entity) :: entity` | Create a new handle with the same options. |
| `get_name` | `(entity) :: String.t()` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a value node — a map for
single-entity ops, a list for `list`) and raise a `BluefinTecsMerchantPortal.Error` on
failure. Wrap calls in `try`/`rescue` to handle errors.

The `direct/2` escape hatch never raises — it returns a result node you
branch on via `Voxgig.Struct.getprop(result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `boolean()` | `true` if the HTTP status is 2xx. |
| `status` | `integer()` | HTTP status code. |
| `headers` | `map()` | Response headers. |
| `data` | `any()` | Parsed JSON response body. |

On error, `ok` is `false` and `err` carries the error value.

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

Every operation lives on the entity's `BluefinTecsMerchantPortal.Entity.<Name>` module and
takes an entity handle built from the client:


### MerchantPortalApiController

Create a handle: `merchant_portal_api_controller = BluefinTecsMerchantPortal.merchant_portal_api_controller(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `integer()` |  |
| `additional_data` | `map()` |  |
| `business_reg_number` | `String.t()` |  |
| `city` | `String.t()` |  |
| `corporateuuid` | `String.t()` |  |
| `country` | `String.t()` |  |
| `currency` | `String.t()` |  |
| `merchant_category_code` | `integer()` |  |
| `merchant_email` | `String.t()` |  |
| `merchant_name` | `String.t()` |  |
| `merchant_phone_number` | `String.t()` |  |
| `packageid` | `String.t()` |  |
| `packageorderuuid` | `String.t()` |  |
| `password` | `String.t()` |  |
| `productid` | `String.t()` |  |
| `productid_acquirer` | `String.t()` |  |
| `reason_deactivation` | `String.t()` |  |
| `reason_reactivation` | `String.t()` |  |
| `sorting_code` | `integer()` |  |
| `state` | `String.t()` |  |
| `street` | `String.t()` |  |
| `terminal_country_code` | `String.t()` |  |
| `terminal_language_code` | `String.t()` |  |
| `terminal_location` | `String.t()` |  |
| `terminal_serial_number` | `String.t()` |  |
| `terminalid` | `integer()` |  |
| `terminalid_acquirer` | `String.t()` |  |
| `user_email` | `String.t()` |  |
| `user_phone_number` | `String.t()` |  |
| `username` | `String.t()` |  |
| `vu_nummer` | `String.t()` |  |
| `web_shop_url` | `String.t()` |  |
| `zipcode` | `String.t()` |  |

#### Example: Create

```elixir
merchant_portal_api_controller = BluefinTecsMerchantPortal.merchant_portal_api_controller(sdk)
record = BluefinTecsMerchantPortal.Entity.MerchantPortalApiController.create(merchant_portal_api_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "business_reg_number" => "example_business_reg_number",  # String.t()
  "city" => "example_city",  # String.t()
  "country" => "example_country",  # String.t()
  "currency" => "example_currency",  # String.t()
  "merchant_category_code" => 1,  # integer()
  "merchant_name" => "example_merchant_name",  # String.t()
  "packageid" => "example_packageid",  # String.t()
  "packageorderuuid" => "example_packageorderuuid",  # String.t()
  "reason_deactivation" => "example_reason_deactivation",  # String.t()
  "reason_reactivation" => "example_reason_reactivation",  # String.t()
  "street" => "example_street",  # String.t()
  "terminal_country_code" => "example_terminal_country_code",  # String.t()
  "terminal_language_code" => "example_terminal_language_code",  # String.t()
  "terminal_location" => "example_terminal_location",  # String.t()
  "terminal_serial_number" => "example_terminal_serial_number",  # String.t()
  "terminalid" => 1,  # integer()
  "vu_nummer" => "example_vu_nummer",  # String.t()
  "zipcode" => "example_zipcode",  # String.t()
}))
```


### MerchantPortalCommonController

Create a handle: `merchant_portal_common_controller = BluefinTecsMerchantPortal.merchant_portal_common_controller(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Example: Load

```elixir
merchant_portal_common_controller = BluefinTecsMerchantPortal.merchant_portal_common_controller(sdk)
record = BluefinTecsMerchantPortal.Entity.MerchantPortalCommonController.load(merchant_portal_common_controller, BluefinTecsMerchantPortal.Helpers.deep(%{}))
```


### MerchantPortalPamContractController

Create a handle: `merchant_portal_pam_contract_controller = BluefinTecsMerchantPortal.merchant_portal_pam_contract_controller(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `String.t()` |  |
| `productOrderUUID` | `String.t()` |  |

#### Example: Create

```elixir
merchant_portal_pam_contract_controller = BluefinTecsMerchantPortal.merchant_portal_pam_contract_controller(sdk)
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamContractController.create(merchant_portal_pam_contract_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "language" => "example_language",  # String.t()
  "productOrderUUID" => "example_productOrderUUID",  # String.t()
}))
```


### MerchantPortalPamDocumentController

Create a handle: `merchant_portal_pam_document_controller = BluefinTecsMerchantPortal.merchant_portal_pam_document_controller(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldDescUUID` | `String.t()` |  |
| `packageOrderUUID` | `String.t()` |  |
| `productOrderUUID` | `String.t()` |  |

#### Example: Create

```elixir
merchant_portal_pam_document_controller = BluefinTecsMerchantPortal.merchant_portal_pam_document_controller(sdk)
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamDocumentController.create(merchant_portal_pam_document_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "appFormFieldDescUUID" => "example_appFormFieldDescUUID",  # String.t()
}))
```


### MerchantPortalPamFormController

Create a handle: `merchant_portal_pam_form_controller = BluefinTecsMerchantPortal.merchant_portal_pam_form_controller(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldsDescUUID` | `String.t()` |  |
| `filter` | `map()` |  |
| `language` | `String.t()` |  |
| `packageOrder` | `map()` |  |
| `packageOrderUUID` | `String.t()` |  |
| `packageUUID` | `String.t()` |  |
| `productOrderUUID` | `String.t()` |  |
| `productOrders` | `list()` |  |
| `reasonOfReopening` | `String.t()` |  |

#### Example: Create

```elixir
merchant_portal_pam_form_controller = BluefinTecsMerchantPortal.merchant_portal_pam_form_controller(sdk)
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamFormController.create(merchant_portal_pam_form_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "appFormFieldsDescUUID" => "example_appFormFieldsDescUUID",  # String.t()
  "language" => "example_language",  # String.t()
  "packageOrderUUID" => "example_packageOrderUUID",  # String.t()
  "reasonOfReopening" => "example_reasonOfReopening",  # String.t()
}))
```


### MerchantPortalPamMandatorController

Create a handle: `merchant_portal_pam_mandator_controller = BluefinTecsMerchantPortal.merchant_portal_pam_mandator_controller(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `clientSecret` | `String.t()` |  |
| `mandatorName` | `String.t()` |  |
| `notificationEmail` | `String.t()` |  |
| `packageUUID` | `String.t()` |  |

#### Example: Create

```elixir
merchant_portal_pam_mandator_controller = BluefinTecsMerchantPortal.merchant_portal_pam_mandator_controller(sdk)
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamMandatorController.create(merchant_portal_pam_mandator_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "mandatorName" => "example_mandatorName",  # String.t()
  "packageUUID" => "example_packageUUID",  # String.t()
}))
```


### MerchantPortalPamMerchantController

Create a handle: `merchant_portal_pam_merchant_controller = BluefinTecsMerchantPortal.merchant_portal_pam_merchant_controller(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `map()` |  |
| `businessRegistrationNumber` | `String.t()` |  |
| `city` | `String.t()` |  |
| `companyName` | `String.t()` |  |
| `corporateUUID` | `String.t()` |  |
| `country` | `String.t()` |  |
| `currency` | `String.t()` |  |
| `email` | `String.t()` |  |
| `language` | `String.t()` |  |
| `login` | `String.t()` |  |
| `mandator` | `String.t()` |  |
| `merchantContractNumber` | `String.t()` |  |
| `merchantName` | `String.t()` |  |
| `merchant_category_code` | `String.t()` |  |
| `packageUUID` | `String.t()` |  |
| `packageorderuuid` | `String.t()` |  |
| `phoneNumber` | `String.t()` |  |
| `postalCode` | `String.t()` |  |
| `productid_acquirer` | `String.t()` |  |
| `region` | `String.t()` |  |
| `registrationNumber` | `String.t()` |  |
| `signature` | `String.t()` |  |
| `street` | `String.t()` |  |
| `terminalIds` | `list()` |  |
| `terminalid_acquirer` | `String.t()` |  |
| `vu_nummer` | `String.t()` |  |

#### Example: Create

```elixir
merchant_portal_pam_merchant_controller = BluefinTecsMerchantPortal.merchant_portal_pam_merchant_controller(sdk)
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamMerchantController.create(merchant_portal_pam_merchant_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "businessRegistrationNumber" => "example_businessRegistrationNumber",  # String.t()
  "companyName" => "example_companyName",  # String.t()
  "corporateUUID" => "example_corporateUUID",  # String.t()
  "currency" => "example_currency",  # String.t()
  "email" => "example_email",  # String.t()
  "language" => "example_language",  # String.t()
  "login" => "example_login",  # String.t()
  "mandator" => "example_mandator",  # String.t()
  "merchantContractNumber" => "example_merchantContractNumber",  # String.t()
  "packageorderuuid" => "example_packageorderuuid",  # String.t()
  "phoneNumber" => "example_phoneNumber",  # String.t()
  "productid_acquirer" => "example_productid_acquirer",  # String.t()
  "vu_nummer" => "example_vu_nummer",  # String.t()
}))
```


### MerchantPortalPamPackageController

Create a handle: `merchant_portal_pam_package_controller = BluefinTecsMerchantPortal.merchant_portal_pam_package_controller(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `String.t()` |  |
| `corporateUUID` | `String.t()` |  |
| `country` | `String.t()` |  |
| `descriptionKey` | `String.t()` |  |
| `filter` | `map()` |  |
| `language` | `String.t()` |  |
| `nameKey` | `String.t()` |  |
| `packageStatus` | `String.t()` |  |
| `packageUUID` | `String.t()` |  |
| `pagination` | `map()` |  |
| `sorting` | `map()` |  |

#### Example: Create

```elixir
merchant_portal_pam_package_controller = BluefinTecsMerchantPortal.merchant_portal_pam_package_controller(sdk)
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamPackageController.create(merchant_portal_pam_package_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "language" => "example_language",  # String.t()
  "packageUUID" => "example_packageUUID",  # String.t()
}))
```


### MerchantPortalPamProductController

Create a handle: `merchant_portal_pam_product_controller = BluefinTecsMerchantPortal.merchant_portal_pam_product_controller(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `String.t()` |  |
| `filter` | `map()` |  |
| `language` | `String.t()` |  |
| `merchantID` | `String.t()` |  |
| `packageOrderUUID` | `String.t()` |  |
| `pagination` | `map()` |  |
| `productOrderUUID` | `String.t()` |  |
| `productUUID` | `String.t()` |  |
| `reason_decline` | `String.t()` |  |
| `sorting` | `map()` |  |

#### Example: Create

```elixir
merchant_portal_pam_product_controller = BluefinTecsMerchantPortal.merchant_portal_pam_product_controller(sdk)
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamProductController.create(merchant_portal_pam_product_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "packageOrderUUID" => "example_packageOrderUUID",  # String.t()
  "productOrderUUID" => "example_productOrderUUID",  # String.t()
  "productUUID" => "example_productUUID",  # String.t()
  "reason_decline" => "example_reason_decline",  # String.t()
}))
```


### OutputAddProduct

Create a handle: `output_add_product = BluefinTecsMerchantPortal.output_add_product(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `String.t()` |  |
| `productUUIDs` | `list()` |  |
| `responseCode` | `integer()` |  |
| `responseMessage` | `String.t()` |  |

#### Example: Create

```elixir
output_add_product = BluefinTecsMerchantPortal.output_add_product(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputAddProduct.create(output_add_product, BluefinTecsMerchantPortal.Helpers.deep(%{
  "packageUUID" => "example_packageUUID",  # String.t()
  "productUUIDs" => [],  # list()
  "responseCode" => 1,  # integer()
  "responseMessage" => "example_responseMessage",  # String.t()
}))
```


### OutputCreateProduct

Create a handle: `output_create_product = BluefinTecsMerchantPortal.output_create_product(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirerId` | `String.t()` |  |
| `allowMultipleOrders` | `boolean()` |  |
| `appFormTemplateName` | `String.t()` |  |
| `contractNeeded` | `boolean()` |  |
| `credentialsNeeded` | `boolean()` |  |
| `descriptionKey` | `String.t()` |  |
| `nameKey` | `String.t()` |  |
| `prescreeningAllowed` | `boolean()` |  |
| `productName` | `String.t()` |  |
| `responseCode` | `integer()` |  |
| `responseMessage` | `String.t()` |  |
| `terminalTemplateName` | `String.t()` |  |
| `vendorName` | `String.t()` |  |
| `xmlTemplateFile` | `String.t()` |  |

#### Example: Create

```elixir
output_create_product = BluefinTecsMerchantPortal.output_create_product(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputCreateProduct.create(output_create_product, BluefinTecsMerchantPortal.Helpers.deep(%{
  "allowMultipleOrders" => true,  # boolean()
  "appFormTemplateName" => "example_appFormTemplateName",  # String.t()
  "contractNeeded" => true,  # boolean()
  "descriptionKey" => "example_descriptionKey",  # String.t()
  "nameKey" => "example_nameKey",  # String.t()
  "prescreeningAllowed" => true,  # boolean()
  "productName" => "example_productName",  # String.t()
  "responseCode" => 1,  # integer()
  "responseMessage" => "example_responseMessage",  # String.t()
  "terminalTemplateName" => "example_terminalTemplateName",  # String.t()
  "vendorName" => "example_vendorName",  # String.t()
  "xmlTemplateFile" => "example_xmlTemplateFile",  # String.t()
}))
```


### OutputDetail

Create a handle: `output_detail = BluefinTecsMerchantPortal.output_detail(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `batch` | `map()` |  |
| `lines` | `map()` |  |
| `progress` | `map()` |  |

#### Example: Load

```elixir
output_detail = BluefinTecsMerchantPortal.output_detail(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputDetail.load(output_detail, BluefinTecsMerchantPortal.Helpers.deep(%{"id" => "output_detail_id"}))
```


### OutputList

Create a handle: `output_list = BluefinTecsMerchantPortal.output_list(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `items` | `list()` |  |
| `pagination` | `map()` |  |
| `responseCode` | `integer()` |  |
| `responseMessage` | `String.t()` |  |
| `sorting` | `map()` |  |

#### Example: Create

```elixir
output_list = BluefinTecsMerchantPortal.output_list(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputList.create(output_list, BluefinTecsMerchantPortal.Helpers.deep(%{
  "pagination" => %{},  # map()
  "responseCode" => 1,  # integer()
  "responseMessage" => "example_responseMessage",  # String.t()
}))
```


### OutputMessage

Create a handle: `output_message = BluefinTecsMerchantPortal.output_message(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `responseCode` | `integer()` |  |
| `responseMessage` | `String.t()` |  |

#### Example: Load

```elixir
output_message = BluefinTecsMerchantPortal.output_message(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputMessage.load(output_message, BluefinTecsMerchantPortal.Helpers.deep(%{"id" => "output_message_id"}))
```


### OutputMoveTid

Create a handle: `output_move_tid = BluefinTecsMerchantPortal.output_move_tid(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `productOrderUUIDs` | `list()` |  |
| `responseCode` | `integer()` |  |
| `responseMessage` | `String.t()` |  |
| `targetPackageOrderUUID` | `String.t()` |  |
| `targetProductOrderUUID` | `String.t()` |  |

#### Example: Create

```elixir
output_move_tid = BluefinTecsMerchantPortal.output_move_tid(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputMoveTid.create(output_move_tid, BluefinTecsMerchantPortal.Helpers.deep(%{
  "productOrderUUIDs" => [],  # list()
  "responseCode" => 1,  # integer()
  "responseMessage" => "example_responseMessage",  # String.t()
  "targetPackageOrderUUID" => "example_targetPackageOrderUUID",  # String.t()
  "targetProductOrderUUID" => "example_targetProductOrderUUID",  # String.t()
}))
```


### OutputRemoveProduct

Create a handle: `output_remove_product = BluefinTecsMerchantPortal.output_remove_product(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `String.t()` |  |
| `productUUIDs` | `list()` |  |
| `responseCode` | `integer()` |  |
| `responseMessage` | `String.t()` |  |

#### Example: Create

```elixir
output_remove_product = BluefinTecsMerchantPortal.output_remove_product(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputRemoveProduct.create(output_remove_product, BluefinTecsMerchantPortal.Helpers.deep(%{
  "packageUUID" => "example_packageUUID",  # String.t()
  "productUUIDs" => [],  # list()
  "responseCode" => 1,  # integer()
  "responseMessage" => "example_responseMessage",  # String.t()
}))
```


### OutputStart

Create a handle: `output_start = BluefinTecsMerchantPortal.output_start(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `String.t()` |  |
| `responseCode` | `integer()` |  |
| `responseMessage` | `String.t()` |  |

#### Example: Create

```elixir
output_start = BluefinTecsMerchantPortal.output_start(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputStart.create(output_start, BluefinTecsMerchantPortal.Helpers.deep(%{
  "responseCode" => 1,  # integer()
  "responseMessage" => "example_responseMessage",  # String.t()
}))
```


### OutputStatus

Create a handle: `output_status = BluefinTecsMerchantPortal.output_status(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `integer()` |  |
| `responseCode` | `integer()` |  |
| `responseMessage` | `String.t()` |  |
| `status` | `String.t()` |  |

#### Example: Load

```elixir
output_status = BluefinTecsMerchantPortal.output_status(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputStatus.load(output_status, BluefinTecsMerchantPortal.Helpers.deep(%{"id" => "output_status_id"}))
```


### OutputUpdateProduct

Create a handle: `output_update_product = BluefinTecsMerchantPortal.output_update_product(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allowMultipleOrders` | `boolean()` |  |
| `appFormName` | `String.t()` |  |
| `contractNeeded` | `boolean()` |  |
| `credentialsNeeded` | `boolean()` |  |
| `descriptionKey` | `String.t()` |  |
| `nameKey` | `String.t()` |  |
| `prescreeningAllowed` | `boolean()` |  |
| `productName` | `String.t()` |  |
| `productStatus` | `String.t()` |  |
| `productUUID` | `String.t()` |  |
| `responseCode` | `integer()` |  |
| `responseMessage` | `String.t()` |  |
| `vendorName` | `String.t()` |  |

#### Example: Create

```elixir
output_update_product = BluefinTecsMerchantPortal.output_update_product(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputUpdateProduct.create(output_update_product, BluefinTecsMerchantPortal.Helpers.deep(%{
  "productUUID" => "example_productUUID",  # String.t()
  "responseCode" => 1,  # integer()
  "responseMessage" => "example_responseMessage",  # String.t()
}))
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

### Data as struct value nodes

The Elixir SDK models every runtime object — clients, contexts, results and
record data — as reference-stable struct value nodes from the vendored
`Voxgig.Struct` library rather than as compile-time structs. This mirrors
the dynamic nature of the API and lets a feature hook mutate a shared node
that every later pipeline stage observes — the immutable-Elixir way to honour
the shared-mutable hook contract.

Build inputs from native Elixir maps with `BluefinTecsMerchantPortal.Helpers.deep/1`,
and read fields off results with `Voxgig.Struct.getprop/2`.

### Module structure

```
elixir/
├── lib/
│   ├── bluefin-tecs-merchant-portal.ex                 -- Main SDK module (entity factories)
│   ├── config.ex                 -- Resolved configuration
│   ├── features.ex               -- Feature factory
│   ├── pipeline.ex               -- Operation pipeline
│   └── bluefin-tecs-merchant-portal/
│       ├── context.ex            -- Operation context
│       ├── entity_base.ex        -- Shared entity behaviour
│       ├── error.ex              -- SDK error type
│       ├── feature.ex            -- Built-in features
│       ├── helpers.ex            -- Value helpers (deep/1, ...)
│       ├── json.ex               -- JSON encode/decode
│       └── utility.ex            -- Utility functions
│   └── entity/                   -- Per-entity modules
├── mix.exs                       -- Package manifest
└── test/                         -- ExUnit suites
```

The main module `BluefinTecsMerchantPortal` exposes the SDK constructors and one entity
factory function per entity. Call an operation on the matching
`BluefinTecsMerchantPortal.Entity.<Name>` module.

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
