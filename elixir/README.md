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
| `product_order_uuid` | `String.t()` |  |

#### Example: Create

```elixir
merchant_portal_pam_contract_controller = BluefinTecsMerchantPortal.merchant_portal_pam_contract_controller(sdk)
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamContractController.create(merchant_portal_pam_contract_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "language" => "example_language",  # String.t()
  "product_order_uuid" => "example_product_order_uuid",  # String.t()
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
| `app_form_field_desc_uuid` | `String.t()` |  |
| `package_order_uuid` | `String.t()` |  |
| `product_order_uuid` | `String.t()` |  |

#### Example: Create

```elixir
merchant_portal_pam_document_controller = BluefinTecsMerchantPortal.merchant_portal_pam_document_controller(sdk)
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamDocumentController.create(merchant_portal_pam_document_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "app_form_field_desc_uuid" => "example_app_form_field_desc_uuid",  # String.t()
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
| `app_form_fields_desc_uuid` | `String.t()` |  |
| `filter` | `map()` |  |
| `language` | `String.t()` |  |
| `package_order` | `map()` |  |
| `package_order_uuid` | `String.t()` |  |
| `package_uuid` | `String.t()` |  |
| `product_order` | `list()` |  |
| `product_order_uuid` | `String.t()` |  |
| `reason_of_reopening` | `String.t()` |  |

#### Example: Create

```elixir
merchant_portal_pam_form_controller = BluefinTecsMerchantPortal.merchant_portal_pam_form_controller(sdk)
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamFormController.create(merchant_portal_pam_form_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "app_form_fields_desc_uuid" => "example_app_form_fields_desc_uuid",  # String.t()
  "language" => "example_language",  # String.t()
  "package_order_uuid" => "example_package_order_uuid",  # String.t()
  "reason_of_reopening" => "example_reason_of_reopening",  # String.t()
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
| `client_secret` | `String.t()` |  |
| `mandator_name` | `String.t()` |  |
| `notification_email` | `String.t()` |  |
| `package_uuid` | `String.t()` |  |

#### Example: Create

```elixir
merchant_portal_pam_mandator_controller = BluefinTecsMerchantPortal.merchant_portal_pam_mandator_controller(sdk)
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamMandatorController.create(merchant_portal_pam_mandator_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "mandator_name" => "example_mandator_name",  # String.t()
  "package_uuid" => "example_package_uuid",  # String.t()
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
| `business_registration_number` | `String.t()` |  |
| `city` | `String.t()` |  |
| `company_name` | `String.t()` |  |
| `corporate_uuid` | `String.t()` |  |
| `country` | `String.t()` |  |
| `currency` | `String.t()` |  |
| `email` | `String.t()` |  |
| `language` | `String.t()` |  |
| `login` | `String.t()` |  |
| `mandator` | `String.t()` |  |
| `merchant_category_code` | `String.t()` |  |
| `merchant_contract_number` | `String.t()` |  |
| `merchant_name` | `String.t()` |  |
| `package_uuid` | `String.t()` |  |
| `packageorderuuid` | `String.t()` |  |
| `phone_number` | `String.t()` |  |
| `postal_code` | `String.t()` |  |
| `productid_acquirer` | `String.t()` |  |
| `region` | `String.t()` |  |
| `registration_number` | `String.t()` |  |
| `signature` | `String.t()` |  |
| `street` | `String.t()` |  |
| `terminal_id` | `list()` |  |
| `terminalid_acquirer` | `String.t()` |  |
| `vu_nummer` | `String.t()` |  |

#### Example: Create

```elixir
merchant_portal_pam_merchant_controller = BluefinTecsMerchantPortal.merchant_portal_pam_merchant_controller(sdk)
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamMerchantController.create(merchant_portal_pam_merchant_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "business_registration_number" => "example_business_registration_number",  # String.t()
  "company_name" => "example_company_name",  # String.t()
  "corporate_uuid" => "example_corporate_uuid",  # String.t()
  "currency" => "example_currency",  # String.t()
  "email" => "example_email",  # String.t()
  "language" => "example_language",  # String.t()
  "login" => "example_login",  # String.t()
  "mandator" => "example_mandator",  # String.t()
  "merchant_contract_number" => "example_merchant_contract_number",  # String.t()
  "packageorderuuid" => "example_packageorderuuid",  # String.t()
  "phone_number" => "example_phone_number",  # String.t()
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
| `consumer_uuid` | `String.t()` |  |
| `corporate_uuid` | `String.t()` |  |
| `country` | `String.t()` |  |
| `description_key` | `String.t()` |  |
| `filter` | `map()` |  |
| `language` | `String.t()` |  |
| `name_key` | `String.t()` |  |
| `package_status` | `String.t()` |  |
| `package_uuid` | `String.t()` |  |
| `pagination` | `map()` |  |
| `sorting` | `map()` |  |

#### Example: Create

```elixir
merchant_portal_pam_package_controller = BluefinTecsMerchantPortal.merchant_portal_pam_package_controller(sdk)
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamPackageController.create(merchant_portal_pam_package_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "language" => "example_language",  # String.t()
  "package_uuid" => "example_package_uuid",  # String.t()
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
| `consumer_uuid` | `String.t()` |  |
| `filter` | `map()` |  |
| `language` | `String.t()` |  |
| `merchant_id` | `String.t()` |  |
| `package_order_uuid` | `String.t()` |  |
| `pagination` | `map()` |  |
| `product_order_uuid` | `String.t()` |  |
| `product_uuid` | `String.t()` |  |
| `reason_decline` | `String.t()` |  |
| `sorting` | `map()` |  |

#### Example: Create

```elixir
merchant_portal_pam_product_controller = BluefinTecsMerchantPortal.merchant_portal_pam_product_controller(sdk)
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamProductController.create(merchant_portal_pam_product_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "package_order_uuid" => "example_package_order_uuid",  # String.t()
  "product_order_uuid" => "example_product_order_uuid",  # String.t()
  "product_uuid" => "example_product_uuid",  # String.t()
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
| `package_uuid` | `String.t()` |  |
| `product_uui_d` | `list()` |  |
| `response_code` | `integer()` |  |
| `response_message` | `String.t()` |  |

#### Example: Create

```elixir
output_add_product = BluefinTecsMerchantPortal.output_add_product(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputAddProduct.create(output_add_product, BluefinTecsMerchantPortal.Helpers.deep(%{
  "package_uuid" => "example_package_uuid",  # String.t()
  "product_uui_d" => [],  # list()
  "response_code" => 1,  # integer()
  "response_message" => "example_response_message",  # String.t()
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
| `acquirer_id` | `String.t()` |  |
| `allow_multiple_order` | `boolean()` |  |
| `app_form_template_name` | `String.t()` |  |
| `contract_needed` | `boolean()` |  |
| `credentials_needed` | `boolean()` |  |
| `description_key` | `String.t()` |  |
| `name_key` | `String.t()` |  |
| `prescreening_allowed` | `boolean()` |  |
| `product_name` | `String.t()` |  |
| `response_code` | `integer()` |  |
| `response_message` | `String.t()` |  |
| `terminal_template_name` | `String.t()` |  |
| `vendor_name` | `String.t()` |  |
| `xml_template_file` | `String.t()` |  |

#### Example: Create

```elixir
output_create_product = BluefinTecsMerchantPortal.output_create_product(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputCreateProduct.create(output_create_product, BluefinTecsMerchantPortal.Helpers.deep(%{
  "allow_multiple_order" => true,  # boolean()
  "app_form_template_name" => "example_app_form_template_name",  # String.t()
  "contract_needed" => true,  # boolean()
  "description_key" => "example_description_key",  # String.t()
  "name_key" => "example_name_key",  # String.t()
  "prescreening_allowed" => true,  # boolean()
  "product_name" => "example_product_name",  # String.t()
  "response_code" => 1,  # integer()
  "response_message" => "example_response_message",  # String.t()
  "terminal_template_name" => "example_terminal_template_name",  # String.t()
  "vendor_name" => "example_vendor_name",  # String.t()
  "xml_template_file" => "example_xml_template_file",  # String.t()
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
| `detail` | `map()` |  |
| `response_code` | `integer()` |  |
| `response_message` | `String.t()` |  |

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
| `item` | `list()` |  |
| `pagination` | `map()` |  |
| `response_code` | `integer()` |  |
| `response_message` | `String.t()` |  |
| `sorting` | `map()` |  |

#### Example: Create

```elixir
output_list = BluefinTecsMerchantPortal.output_list(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputList.create(output_list, BluefinTecsMerchantPortal.Helpers.deep(%{
  "pagination" => %{},  # map()
  "response_code" => 1,  # integer()
  "response_message" => "example_response_message",  # String.t()
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
| `response_code` | `integer()` |  |
| `response_message` | `String.t()` |  |

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
| `product_order_uui_d` | `list()` |  |
| `response_code` | `integer()` |  |
| `response_message` | `String.t()` |  |
| `target_package_order_uuid` | `String.t()` |  |
| `target_product_order_uuid` | `String.t()` |  |

#### Example: Create

```elixir
output_move_tid = BluefinTecsMerchantPortal.output_move_tid(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputMoveTid.create(output_move_tid, BluefinTecsMerchantPortal.Helpers.deep(%{
  "product_order_uui_d" => [],  # list()
  "response_code" => 1,  # integer()
  "response_message" => "example_response_message",  # String.t()
  "target_package_order_uuid" => "example_target_package_order_uuid",  # String.t()
  "target_product_order_uuid" => "example_target_product_order_uuid",  # String.t()
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
| `package_uuid` | `String.t()` |  |
| `product_uui_d` | `list()` |  |
| `response_code` | `integer()` |  |
| `response_message` | `String.t()` |  |

#### Example: Create

```elixir
output_remove_product = BluefinTecsMerchantPortal.output_remove_product(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputRemoveProduct.create(output_remove_product, BluefinTecsMerchantPortal.Helpers.deep(%{
  "package_uuid" => "example_package_uuid",  # String.t()
  "product_uui_d" => [],  # list()
  "response_code" => 1,  # integer()
  "response_message" => "example_response_message",  # String.t()
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
| `response_code` | `integer()` |  |
| `response_message` | `String.t()` |  |

#### Example: Create

```elixir
output_start = BluefinTecsMerchantPortal.output_start(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputStart.create(output_start, BluefinTecsMerchantPortal.Helpers.deep(%{
  "response_code" => 1,  # integer()
  "response_message" => "example_response_message",  # String.t()
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
| `response_code` | `integer()` |  |
| `response_message` | `String.t()` |  |
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
| `allow_multiple_order` | `boolean()` |  |
| `app_form_name` | `String.t()` |  |
| `contract_needed` | `boolean()` |  |
| `credentials_needed` | `boolean()` |  |
| `description_key` | `String.t()` |  |
| `name_key` | `String.t()` |  |
| `prescreening_allowed` | `boolean()` |  |
| `product_name` | `String.t()` |  |
| `product_status` | `String.t()` |  |
| `product_uuid` | `String.t()` |  |
| `response_code` | `integer()` |  |
| `response_message` | `String.t()` |  |
| `vendor_name` | `String.t()` |  |

#### Example: Create

```elixir
output_update_product = BluefinTecsMerchantPortal.output_update_product(sdk)
record = BluefinTecsMerchantPortal.Entity.OutputUpdateProduct.create(output_update_product, BluefinTecsMerchantPortal.Helpers.deep(%{
  "product_uuid" => "example_product_uuid",  # String.t()
  "response_code" => 1,  # integer()
  "response_message" => "example_response_message",  # String.t()
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
