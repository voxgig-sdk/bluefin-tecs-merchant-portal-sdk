# BluefinTecsMerchantPortal OCaml SDK



The OCaml SDK for the BluefinTecsMerchantPortal API — an entity-oriented client
following idiomatic OCaml conventions (a dependency-free library that compiles
with the stock `ocamlc`).

The SDK exposes the API as capitalised, semantic **Entities** — for example `Sdk_client.merchant_portal_api_controller client Noval` — each
carrying a small, uniform set of operations (`load`, `create`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to the opam registry. Install it from the
GitHub release tag (`ocaml/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases))
or from a source checkout. The SDK is dependency-free and compiles with the
stock `ocamlc` — no opam packages, no dune:

```bash
cd ocaml && make build
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ocaml
open Voxgig_struct
open Sdk_helpers

let client = Sdk_client.make0 ()
```

### 4. Create, update, and remove

```ocaml
(* Create — returns the bare created record (a Map) *)
let created = (Sdk_client.merchant_portal_api_controller client Noval).e_create (jo [("business_reg_number", (Str "example_business_reg_number")); ("city", (Str "example_city")); ("country", (Str "example_country")); ("currency", (Str "example_currency")); ("merchant_category_code", (Num 1.)); ("merchant_name", (Str "example_merchant_name")); ("packageid", (Str "example_packageid")); ("packageorderuuid", (Str "example_packageorderuuid")); ("reason_deactivation", (Str "example_reason_deactivation")); ("reason_reactivation", (Str "example_reason_reactivation")); ("street", (Str "example_street")); ("terminal_country_code", (Str "example_terminal_country_code")); ("terminal_language_code", (Str "example_terminal_language_code")); ("terminal_location", (Str "example_terminal_location")); ("terminal_serial_number", (Str "example_terminal_serial_number")); ("terminalid", (Num 1.)); ("vu_nummer", (Str "example_vu_nummer")); ("zipcode", (Str "example_zipcode"))]) Noval in
ignore created;

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

```ocaml
let result = Sdk_client.direct client (jo [
    ("path", Str "/api/resource/{id}");
    ("method", Str "GET");
    ("params", jo [("id", Str "example")]);
]) in
(match getp result "ok" with
 | Bool true ->
   print_endline (stringify (getp result "status"));  (* 200 *)
   print_endline (stringify (getp result "data"))      (* response body *)
 | _ ->
   (* A non-2xx response carries status + data (the error body); a transport
      failure carries err instead. Read whichever is present. *)
   print_endline (stringify (getp result "status"));
   print_endline (stringify (getp result "err")))
```

### Prepare a request without sending it

```ocaml
(* prepare returns the fetch definition and raises on error. *)
let fetchdef = Sdk_client.prepare client (jo [
    ("path", Str "/api/resource/{id}");
    ("method", Str "DELETE");
    ("params", jo [("id", Str "example")]);
]) in
print_endline (stringify (getp fetchdef "url"));
print_endline (stringify (getp fetchdef "method"));
print_endline (stringify (getp fetchdef "headers"))
```

### Use test mode

Create a mock client for unit testing — no server required:

```ocaml
let () =
  let client = Sdk_client.test () in
  (* Entity ops return the bare record and raise on error. *)
  let output_detail = (Sdk_client.output_detail client Noval).e_load (jo [("id", Str "test01")]) Noval in
  print_endline (stringify output_detail)  (* the mock response record *)
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```ocaml
let mock_fetch = Func (fun _ _args _ _ ->
    jo [("status", Num 200.); ("statusText", Str "OK"); ("headers", empty_map ());
        ("json", json_thunk (jo [("id", Str "mock01")]))]) in
let client = Sdk_client.make (jo [
    ("base", Str "http://localhost:8080");
    ("system", jo [("fetch", mock_fetch)]);
]) in
ignore client
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run:

```bash
cd ocaml && make test
```


## Reference

### Sdk_client

```ocaml
open Voxgig_struct
open Sdk_helpers

let client = Sdk_client.make options
```

Creates a new SDK client from a `value` options map. Use `Sdk_client.make0 ()`
for defaults.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `extend` | `list` | Additional feature instances to load. |
| `system` | `map` | System overrides (e.g. custom `fetch` function). |

### Sdk_client.test

```ocaml
let client = Sdk_client.test_with testopts sdkopts
```

Creates a test-mode client with mock transport. Both arguments may be `Noval`
(`Sdk_client.test ()` uses defaults).

### Sdk_client functions

| Function | Signature | Description |
| --- | --- | --- |
| `make` | `value -> sdk_client` | Construct a client from options. |
| `make0` | `unit -> sdk_client` | Construct a client with defaults. |
| `prepare` | `sdk_client -> value -> value` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `sdk_client -> value -> value` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `merchant_portal_api_controller` | `sdk_client -> value -> entity_obj` | A MerchantPortalApiController entity accessor. |
| `merchant_portal_common_controller` | `sdk_client -> value -> entity_obj` | A MerchantPortalCommonController entity accessor. |
| `merchant_portal_pam_contract_controller` | `sdk_client -> value -> entity_obj` | A MerchantPortalPamContractController entity accessor. |
| `merchant_portal_pam_document_controller` | `sdk_client -> value -> entity_obj` | A MerchantPortalPamDocumentController entity accessor. |
| `merchant_portal_pam_form_controller` | `sdk_client -> value -> entity_obj` | A MerchantPortalPamFormController entity accessor. |
| `merchant_portal_pam_mandator_controller` | `sdk_client -> value -> entity_obj` | A MerchantPortalPamMandatorController entity accessor. |
| `merchant_portal_pam_merchant_controller` | `sdk_client -> value -> entity_obj` | A MerchantPortalPamMerchantController entity accessor. |
| `merchant_portal_pam_package_controller` | `sdk_client -> value -> entity_obj` | A MerchantPortalPamPackageController entity accessor. |
| `merchant_portal_pam_product_controller` | `sdk_client -> value -> entity_obj` | A MerchantPortalPamProductController entity accessor. |
| `output_add_product` | `sdk_client -> value -> entity_obj` | An OutputAddProduct entity accessor. |
| `output_create_product` | `sdk_client -> value -> entity_obj` | An OutputCreateProduct entity accessor. |
| `output_detail` | `sdk_client -> value -> entity_obj` | An OutputDetail entity accessor. |
| `output_list` | `sdk_client -> value -> entity_obj` | An OutputList entity accessor. |
| `output_message` | `sdk_client -> value -> entity_obj` | An OutputMessage entity accessor. |
| `output_move_tid` | `sdk_client -> value -> entity_obj` | An OutputMoveTid entity accessor. |
| `output_remove_product` | `sdk_client -> value -> entity_obj` | An OutputRemoveProduct entity accessor. |
| `output_start` | `sdk_client -> value -> entity_obj` | An OutputStart entity accessor. |
| `output_status` | `sdk_client -> value -> entity_obj` | An OutputStatus entity accessor. |
| `output_update_product` | `sdk_client -> value -> entity_obj` | An OutputUpdateProduct entity accessor. |

### Entity interface

All entities are `entity_obj` records sharing the same fields.

| Field | Signature | Description |
| --- | --- | --- |
| `e_load` | `value -> value -> value` | Load a single entity by match criteria. Raises on error. |
| `e_create` | `value -> value -> value` | Create a new entity. Raises on error. |
| `e_data_get` | `unit -> value` | Get entity data. |
| `e_data_set` | `value -> unit` | Set entity data. |
| `e_match_get` | `unit -> value` | Get entity match criteria. |
| `e_match_set` | `value -> unit` | Set entity match criteria. |
| `e_make` | `unit -> entity_obj` | Create a new instance with the same options. |
| `e_name` | `string` | The entity name. |

### Result shape

Entity operations return the bare result value (a `Map` for single-entity
ops, a `List` for `e_list`) and raise `Sdk_error.E` on error. Wrap calls
in `try`/`with` to handle failures.

The `direct` escape hatch never raises — it returns a result `value` map
you branch on via `getp result "ok"`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Bool` | `Bool true` if the HTTP status is 2xx. |
| `status` | `Num` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `value` | Parsed JSON response body. |

On error, `ok` is `Bool false` and `err` carries the error value.

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

Create an instance: `let merchant_portal_api_controller = Sdk_client.merchant_portal_api_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `int` |  |
| `additional_data` | `value map` |  |
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

```ocaml
let merchant_portal_api_controller = (Sdk_client.merchant_portal_api_controller client Noval).e_create (jo [
    ("business_reg_number", (Str "example_business_reg_number"));  (* string *)
    ("city", (Str "example_city"));  (* string *)
    ("country", (Str "example_country"));  (* string *)
    ("currency", (Str "example_currency"));  (* string *)
    ("merchant_category_code", (Num 1.));  (* int *)
    ("merchant_name", (Str "example_merchant_name"));  (* string *)
    ("packageid", (Str "example_packageid"));  (* string *)
    ("packageorderuuid", (Str "example_packageorderuuid"));  (* string *)
    ("reason_deactivation", (Str "example_reason_deactivation"));  (* string *)
    ("reason_reactivation", (Str "example_reason_reactivation"));  (* string *)
    ("street", (Str "example_street"));  (* string *)
    ("terminal_country_code", (Str "example_terminal_country_code"));  (* string *)
    ("terminal_language_code", (Str "example_terminal_language_code"));  (* string *)
    ("terminal_location", (Str "example_terminal_location"));  (* string *)
    ("terminal_serial_number", (Str "example_terminal_serial_number"));  (* string *)
    ("terminalid", (Num 1.));  (* int *)
    ("vu_nummer", (Str "example_vu_nummer"));  (* string *)
    ("zipcode", (Str "example_zipcode"));  (* string *)
]) Noval
```


### MerchantPortalCommonController

Create an instance: `let merchant_portal_common_controller = Sdk_client.merchant_portal_common_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Example: Load

```ocaml
let merchant_portal_common_controller = (Sdk_client.merchant_portal_common_controller client Noval).e_load (Noval) Noval
```


### MerchantPortalPamContractController

Create an instance: `let merchant_portal_pam_contract_controller = Sdk_client.merchant_portal_pam_contract_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `string` |  |
| `product_order_uuid` | `string` |  |

#### Example: Create

```ocaml
let merchant_portal_pam_contract_controller = (Sdk_client.merchant_portal_pam_contract_controller client Noval).e_create (jo [
    ("language", (Str "example_language"));  (* string *)
    ("product_order_uuid", (Str "example_product_order_uuid"));  (* string *)
]) Noval
```


### MerchantPortalPamDocumentController

Create an instance: `let merchant_portal_pam_document_controller = Sdk_client.merchant_portal_pam_document_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_field_desc_uuid` | `string` |  |
| `package_order_uuid` | `string` |  |
| `product_order_uuid` | `string` |  |

#### Example: Create

```ocaml
let merchant_portal_pam_document_controller = (Sdk_client.merchant_portal_pam_document_controller client Noval).e_create (jo [
    ("app_form_field_desc_uuid", (Str "example_app_form_field_desc_uuid"));  (* string *)
]) Noval
```


### MerchantPortalPamFormController

Create an instance: `let merchant_portal_pam_form_controller = Sdk_client.merchant_portal_pam_form_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_fields_desc_uuid` | `string` |  |
| `filter` | `value map` |  |
| `language` | `string` |  |
| `package_order` | `value map` |  |
| `package_order_uuid` | `string` |  |
| `package_uuid` | `string` |  |
| `product_order` | `value list` |  |
| `product_order_uuid` | `string` |  |
| `reason_of_reopening` | `string` |  |

#### Example: Create

```ocaml
let merchant_portal_pam_form_controller = (Sdk_client.merchant_portal_pam_form_controller client Noval).e_create (jo [
    ("app_form_fields_desc_uuid", (Str "example_app_form_fields_desc_uuid"));  (* string *)
    ("language", (Str "example_language"));  (* string *)
    ("package_order_uuid", (Str "example_package_order_uuid"));  (* string *)
    ("reason_of_reopening", (Str "example_reason_of_reopening"));  (* string *)
]) Noval
```


### MerchantPortalPamMandatorController

Create an instance: `let merchant_portal_pam_mandator_controller = Sdk_client.merchant_portal_pam_mandator_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client_secret` | `string` |  |
| `mandator_name` | `string` |  |
| `notification_email` | `string` |  |
| `package_uuid` | `string` |  |

#### Example: Create

```ocaml
let merchant_portal_pam_mandator_controller = (Sdk_client.merchant_portal_pam_mandator_controller client Noval).e_create (jo [
    ("mandator_name", (Str "example_mandator_name"));  (* string *)
    ("package_uuid", (Str "example_package_uuid"));  (* string *)
]) Noval
```


### MerchantPortalPamMerchantController

Create an instance: `let merchant_portal_pam_merchant_controller = Sdk_client.merchant_portal_pam_merchant_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `value map` |  |
| `business_registration_number` | `string` |  |
| `city` | `string` |  |
| `company_name` | `string` |  |
| `corporate_uuid` | `string` |  |
| `country` | `string` |  |
| `currency` | `string` |  |
| `email` | `string` |  |
| `language` | `string` |  |
| `login` | `string` |  |
| `mandator` | `string` |  |
| `merchant_category_code` | `string` |  |
| `merchant_contract_number` | `string` |  |
| `merchant_name` | `string` |  |
| `package_uuid` | `string` |  |
| `packageorderuuid` | `string` |  |
| `phone_number` | `string` |  |
| `postal_code` | `string` |  |
| `productid_acquirer` | `string` |  |
| `region` | `string` |  |
| `registration_number` | `string` |  |
| `signature` | `string` |  |
| `street` | `string` |  |
| `terminal_id` | `value list` |  |
| `terminalid_acquirer` | `string` |  |
| `vu_nummer` | `string` |  |

#### Example: Create

```ocaml
let merchant_portal_pam_merchant_controller = (Sdk_client.merchant_portal_pam_merchant_controller client Noval).e_create (jo [
    ("business_registration_number", (Str "example_business_registration_number"));  (* string *)
    ("company_name", (Str "example_company_name"));  (* string *)
    ("corporate_uuid", (Str "example_corporate_uuid"));  (* string *)
    ("currency", (Str "example_currency"));  (* string *)
    ("email", (Str "example_email"));  (* string *)
    ("language", (Str "example_language"));  (* string *)
    ("login", (Str "example_login"));  (* string *)
    ("mandator", (Str "example_mandator"));  (* string *)
    ("merchant_contract_number", (Str "example_merchant_contract_number"));  (* string *)
    ("packageorderuuid", (Str "example_packageorderuuid"));  (* string *)
    ("phone_number", (Str "example_phone_number"));  (* string *)
    ("productid_acquirer", (Str "example_productid_acquirer"));  (* string *)
    ("vu_nummer", (Str "example_vu_nummer"));  (* string *)
]) Noval
```


### MerchantPortalPamPackageController

Create an instance: `let merchant_portal_pam_package_controller = Sdk_client.merchant_portal_pam_package_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `string` |  |
| `corporate_uuid` | `string` |  |
| `country` | `string` |  |
| `description_key` | `string` |  |
| `filter` | `value map` |  |
| `language` | `string` |  |
| `name_key` | `string` |  |
| `package_status` | `string` |  |
| `package_uuid` | `string` |  |
| `pagination` | `value map` |  |
| `sorting` | `value map` |  |

#### Example: Create

```ocaml
let merchant_portal_pam_package_controller = (Sdk_client.merchant_portal_pam_package_controller client Noval).e_create (jo [
    ("language", (Str "example_language"));  (* string *)
    ("package_uuid", (Str "example_package_uuid"));  (* string *)
]) Noval
```


### MerchantPortalPamProductController

Create an instance: `let merchant_portal_pam_product_controller = Sdk_client.merchant_portal_pam_product_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `string` |  |
| `filter` | `value map` |  |
| `language` | `string` |  |
| `merchant_id` | `string` |  |
| `package_order_uuid` | `string` |  |
| `pagination` | `value map` |  |
| `product_order_uuid` | `string` |  |
| `product_uuid` | `string` |  |
| `reason_decline` | `string` |  |
| `sorting` | `value map` |  |

#### Example: Create

```ocaml
let merchant_portal_pam_product_controller = (Sdk_client.merchant_portal_pam_product_controller client Noval).e_create (jo [
    ("package_order_uuid", (Str "example_package_order_uuid"));  (* string *)
    ("product_order_uuid", (Str "example_product_order_uuid"));  (* string *)
    ("product_uuid", (Str "example_product_uuid"));  (* string *)
    ("reason_decline", (Str "example_reason_decline"));  (* string *)
]) Noval
```


### OutputAddProduct

Create an instance: `let output_add_product = Sdk_client.output_add_product client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `string` |  |
| `product_uui_d` | `value list` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |

#### Example: Create

```ocaml
let output_add_product = (Sdk_client.output_add_product client Noval).e_create (jo [
    ("package_uuid", (Str "example_package_uuid"));  (* string *)
    ("product_uui_d", (empty_list ()));  (* value list *)
    ("response_code", (Num 1.));  (* int *)
    ("response_message", (Str "example_response_message"));  (* string *)
]) Noval
```


### OutputCreateProduct

Create an instance: `let output_create_product = Sdk_client.output_create_product client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirer_id` | `string` |  |
| `allow_multiple_order` | `bool` |  |
| `app_form_template_name` | `string` |  |
| `contract_needed` | `bool` |  |
| `credentials_needed` | `bool` |  |
| `description_key` | `string` |  |
| `name_key` | `string` |  |
| `prescreening_allowed` | `bool` |  |
| `product_name` | `string` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |
| `terminal_template_name` | `string` |  |
| `vendor_name` | `string` |  |
| `xml_template_file` | `string` |  |

#### Example: Create

```ocaml
let output_create_product = (Sdk_client.output_create_product client Noval).e_create (jo [
    ("allow_multiple_order", (Bool true));  (* bool *)
    ("app_form_template_name", (Str "example_app_form_template_name"));  (* string *)
    ("contract_needed", (Bool true));  (* bool *)
    ("description_key", (Str "example_description_key"));  (* string *)
    ("name_key", (Str "example_name_key"));  (* string *)
    ("prescreening_allowed", (Bool true));  (* bool *)
    ("product_name", (Str "example_product_name"));  (* string *)
    ("response_code", (Num 1.));  (* int *)
    ("response_message", (Str "example_response_message"));  (* string *)
    ("terminal_template_name", (Str "example_terminal_template_name"));  (* string *)
    ("vendor_name", (Str "example_vendor_name"));  (* string *)
    ("xml_template_file", (Str "example_xml_template_file"));  (* string *)
]) Noval
```


### OutputDetail

Create an instance: `let output_detail = Sdk_client.output_detail client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `detail` | `value map` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |

#### Example: Load

```ocaml
let output_detail = (Sdk_client.output_detail client Noval).e_load (jo [("id", (Str "output_detail_id"))]) Noval
```


### OutputList

Create an instance: `let output_list = Sdk_client.output_list client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `item` | `value list` |  |
| `pagination` | `value map` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |
| `sorting` | `value map` |  |

#### Example: Create

```ocaml
let output_list = (Sdk_client.output_list client Noval).e_create (jo [
    ("pagination", (empty_map ()));  (* value map *)
    ("response_code", (Num 1.));  (* int *)
    ("response_message", (Str "example_response_message"));  (* string *)
]) Noval
```


### OutputMessage

Create an instance: `let output_message = Sdk_client.output_message client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `response_code` | `int` |  |
| `response_message` | `string` |  |

#### Example: Load

```ocaml
let output_message = (Sdk_client.output_message client Noval).e_load (jo [("id", (Str "output_message_id"))]) Noval
```


### OutputMoveTid

Create an instance: `let output_move_tid = Sdk_client.output_move_tid client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `product_order_uui_d` | `value list` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |
| `target_package_order_uuid` | `string` |  |
| `target_product_order_uuid` | `string` |  |

#### Example: Create

```ocaml
let output_move_tid = (Sdk_client.output_move_tid client Noval).e_create (jo [
    ("product_order_uui_d", (empty_list ()));  (* value list *)
    ("response_code", (Num 1.));  (* int *)
    ("response_message", (Str "example_response_message"));  (* string *)
    ("target_package_order_uuid", (Str "example_target_package_order_uuid"));  (* string *)
    ("target_product_order_uuid", (Str "example_target_product_order_uuid"));  (* string *)
]) Noval
```


### OutputRemoveProduct

Create an instance: `let output_remove_product = Sdk_client.output_remove_product client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `string` |  |
| `product_uui_d` | `value list` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |

#### Example: Create

```ocaml
let output_remove_product = (Sdk_client.output_remove_product client Noval).e_create (jo [
    ("package_uuid", (Str "example_package_uuid"));  (* string *)
    ("product_uui_d", (empty_list ()));  (* value list *)
    ("response_code", (Num 1.));  (* int *)
    ("response_message", (Str "example_response_message"));  (* string *)
]) Noval
```


### OutputStart

Create an instance: `let output_start = Sdk_client.output_start client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `string` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |

#### Example: Create

```ocaml
let output_start = (Sdk_client.output_start client Noval).e_create (jo [
    ("response_code", (Num 1.));  (* int *)
    ("response_message", (Str "example_response_message"));  (* string *)
]) Noval
```


### OutputStatus

Create an instance: `let output_status = Sdk_client.output_status client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `int` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |
| `status` | `string` |  |

#### Example: Load

```ocaml
let output_status = (Sdk_client.output_status client Noval).e_load (jo [("id", (Str "output_status_id"))]) Noval
```


### OutputUpdateProduct

Create an instance: `let output_update_product = Sdk_client.output_update_product client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allow_multiple_order` | `bool` |  |
| `app_form_name` | `string` |  |
| `contract_needed` | `bool` |  |
| `credentials_needed` | `bool` |  |
| `description_key` | `string` |  |
| `name_key` | `string` |  |
| `prescreening_allowed` | `bool` |  |
| `product_name` | `string` |  |
| `product_status` | `string` |  |
| `product_uuid` | `string` |  |
| `response_code` | `int` |  |
| `response_message` | `string` |  |
| `vendor_name` | `string` |  |

#### Example: Create

```ocaml
let output_update_product = (Sdk_client.output_update_product client Noval).e_create (jo [
    ("product_uuid", (Str "example_product_uuid"));  (* string *)
    ("response_code", (Num 1.));  (* int *)
    ("response_message", (Str "example_response_message"));  (* string *)
]) Noval
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

### Data as `value`

The OCaml SDK uses a single dynamic `value` type throughout rather than a
typed record per entity. `value` is the vendored voxgig struct port (a
JSON-shaped variant: `Str`, `Num`, `Bool`, `List`, `Map`, `Null`,
`Noval`). This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with the `jo` / `ja` helpers and read fields back with
`getp`; use `to_map` to safely coerce a value to a map.

### Module structure

```
ocaml/
├── sdk_client.ml               -- Main SDK client (constructors + accessors)
├── sdk_config.ml               -- Embedded API config + feature factory
├── sdk_error.ml                -- Branded error re-exports
├── sdk_entity_*.ml             -- Per-entity implementations (one each)
├── sdk_types.ml                -- Core pipeline types
├── sdk_helpers.ml              -- jo / ja / getp and friends
├── sdk_runtime.ml              -- Operation pipeline runner
├── sdk_features.ml             -- Built-in features (base, test, log)
├── utility/                    -- Vendored voxgig struct port
└── test/                       -- Test suites
```

The public surface lives in `Sdk_client` (the constructors and per-entity
accessors); `Sdk_helpers` carries the `jo` / `ja` / `getp` value
helpers. Open the runtime modules directly only when needed.

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
