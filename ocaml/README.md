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
(* Create — resolves to the ENTITY; e_data_get gives the record *)
let created = (Sdk_client.merchant_portal_api_controller client Noval).e_create (jo [("business_reg_number", (Str "example_business_reg_number")); ("city", (Str "example_city")); ("country", (Str "example_country")); ("currency", (Str "example_currency")); ("merchant_category_code", (Num 1.)); ("merchant_name", (Str "example_merchant_name")); ("packageid", (Str "example_packageid")); ("packageorderuuid", (Str "example_packageorderuuid")); ("reason_deactivation", (Str "example_reason_deactivation")); ("reason_reactivation", (Str "example_reason_reactivation")); ("street", (Str "example_street")); ("terminal_country_code", (Str "example_terminal_country_code")); ("terminal_language_code", (Str "example_terminal_language_code")); ("terminal_location", (Str "example_terminal_location")); ("terminal_serial_number", (Str "example_terminal_serial_number")); ("terminalid", (Num 1.)); ("vu_nummer", (Str "example_vu_nummer")); ("zipcode", (Str "example_zipcode"))]) Noval in
print_endline (stringify (created.e_data_get ()));

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
  (* Entity ops resolve to the ENTITY and raise on error. *)
  let output_detail = (Sdk_client.output_detail client Noval).e_load (jo [("id", Str "test01")]) Noval in
  print_endline (stringify (output_detail.e_data_get ()))  (* the mock response record *)
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
| `e_load` | `value -> value -> entity_obj` | Load a single entity by match criteria. Resolves to the entity. Raises on error. |
| `e_create` | `value -> value -> entity_obj` | Create a new entity. Resolves to the entity. Raises on error. |
| `e_data_get` | `unit -> value` | Get entity data. |
| `e_data_set` | `value -> unit` | Set entity data. |
| `e_match_get` | `unit -> value` | Get entity match criteria. |
| `e_match_set` | `value -> unit` | Set entity match criteria. |
| `e_make` | `unit -> entity_obj` | Create a new instance with the same options. |
| `e_name` | `string` | The entity name. |

### Result shape

Entity operations resolve to the ENTITY, not the raw record — `e_list` to
one entity per record — and raise `Sdk_error.E` on error. The record is
reached through `e_data_get`, which returns the entity's data container.
`e_remove` resolves to the entity marked deleted (`e_deleted`); it keeps the
data it held. Wrap calls in `try`/`with` to handle failures.

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

Create an instance: `let merchant_portal_api_controller = Sdk_client.merchant_portal_api_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

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
let merchant_portal_api_controller_data = merchant_portal_api_controller.e_data_get ()
```


### MerchantPortalCommonController

Create an instance: `let merchant_portal_common_controller = Sdk_client.merchant_portal_common_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let merchant_portal_common_controller = (Sdk_client.merchant_portal_common_controller client Noval).e_load (Noval) Noval
let merchant_portal_common_controller_data = merchant_portal_common_controller.e_data_get ()
```


### MerchantPortalPamContractController

Create an instance: `let merchant_portal_pam_contract_controller = Sdk_client.merchant_portal_pam_contract_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `string` |  |
| `productOrderUUID` | `string` |  |

#### Example: Create

```ocaml
let merchant_portal_pam_contract_controller = (Sdk_client.merchant_portal_pam_contract_controller client Noval).e_create (jo [
    ("language", (Str "example_language"));  (* string *)
    ("productOrderUUID", (Str "example_productOrderUUID"));  (* string *)
]) Noval
let merchant_portal_pam_contract_controller_data = merchant_portal_pam_contract_controller.e_data_get ()
```


### MerchantPortalPamDocumentController

Create an instance: `let merchant_portal_pam_document_controller = Sdk_client.merchant_portal_pam_document_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldDescUUID` | `string` |  |
| `packageOrderUUID` | `string` |  |
| `productOrderUUID` | `string` |  |

#### Example: Create

```ocaml
let merchant_portal_pam_document_controller = (Sdk_client.merchant_portal_pam_document_controller client Noval).e_create (jo [
    ("appFormFieldDescUUID", (Str "example_appFormFieldDescUUID"));  (* string *)
]) Noval
let merchant_portal_pam_document_controller_data = merchant_portal_pam_document_controller.e_data_get ()
```


### MerchantPortalPamFormController

Create an instance: `let merchant_portal_pam_form_controller = Sdk_client.merchant_portal_pam_form_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldsDescUUID` | `string` |  |
| `filter` | `value map` |  |
| `language` | `string` |  |
| `packageOrder` | `value map` |  |
| `packageOrderUUID` | `string` |  |
| `packageUUID` | `string` |  |
| `productOrderUUID` | `string` |  |
| `productOrders` | `value list` |  |
| `reasonOfReopening` | `string` |  |

#### Example: Create

```ocaml
let merchant_portal_pam_form_controller = (Sdk_client.merchant_portal_pam_form_controller client Noval).e_create (jo [
    ("appFormFieldsDescUUID", (Str "example_appFormFieldsDescUUID"));  (* string *)
    ("language", (Str "example_language"));  (* string *)
    ("packageOrderUUID", (Str "example_packageOrderUUID"));  (* string *)
    ("reasonOfReopening", (Str "example_reasonOfReopening"));  (* string *)
]) Noval
let merchant_portal_pam_form_controller_data = merchant_portal_pam_form_controller.e_data_get ()
```


### MerchantPortalPamMandatorController

Create an instance: `let merchant_portal_pam_mandator_controller = Sdk_client.merchant_portal_pam_mandator_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `clientSecret` | `string` |  |
| `mandatorName` | `string` |  |
| `notificationEmail` | `string` |  |
| `packageUUID` | `string` |  |

#### Example: Create

```ocaml
let merchant_portal_pam_mandator_controller = (Sdk_client.merchant_portal_pam_mandator_controller client Noval).e_create (jo [
    ("mandatorName", (Str "example_mandatorName"));  (* string *)
    ("packageUUID", (Str "example_packageUUID"));  (* string *)
]) Noval
let merchant_portal_pam_mandator_controller_data = merchant_portal_pam_mandator_controller.e_data_get ()
```


### MerchantPortalPamMerchantController

Create an instance: `let merchant_portal_pam_merchant_controller = Sdk_client.merchant_portal_pam_merchant_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `value map` |  |
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
| `terminalIds` | `value list` |  |
| `terminalid_acquirer` | `string` |  |
| `vu_nummer` | `string` |  |

#### Example: Create

```ocaml
let merchant_portal_pam_merchant_controller = (Sdk_client.merchant_portal_pam_merchant_controller client Noval).e_create (jo [
    ("businessRegistrationNumber", (Str "example_businessRegistrationNumber"));  (* string *)
    ("companyName", (Str "example_companyName"));  (* string *)
    ("corporateUUID", (Str "example_corporateUUID"));  (* string *)
    ("currency", (Str "example_currency"));  (* string *)
    ("email", (Str "example_email"));  (* string *)
    ("language", (Str "example_language"));  (* string *)
    ("login", (Str "example_login"));  (* string *)
    ("mandator", (Str "example_mandator"));  (* string *)
    ("merchantContractNumber", (Str "example_merchantContractNumber"));  (* string *)
    ("packageorderuuid", (Str "example_packageorderuuid"));  (* string *)
    ("phoneNumber", (Str "example_phoneNumber"));  (* string *)
    ("productid_acquirer", (Str "example_productid_acquirer"));  (* string *)
    ("vu_nummer", (Str "example_vu_nummer"));  (* string *)
]) Noval
let merchant_portal_pam_merchant_controller_data = merchant_portal_pam_merchant_controller.e_data_get ()
```


### MerchantPortalPamPackageController

Create an instance: `let merchant_portal_pam_package_controller = Sdk_client.merchant_portal_pam_package_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `string` |  |
| `corporateUUID` | `string` |  |
| `country` | `string` |  |
| `descriptionKey` | `string` |  |
| `filter` | `value map` |  |
| `language` | `string` |  |
| `nameKey` | `string` |  |
| `packageStatus` | `string` |  |
| `packageUUID` | `string` |  |
| `pagination` | `value map` |  |
| `sorting` | `value map` |  |

#### Example: Create

```ocaml
let merchant_portal_pam_package_controller = (Sdk_client.merchant_portal_pam_package_controller client Noval).e_create (jo [
    ("language", (Str "example_language"));  (* string *)
    ("packageUUID", (Str "example_packageUUID"));  (* string *)
]) Noval
let merchant_portal_pam_package_controller_data = merchant_portal_pam_package_controller.e_data_get ()
```


### MerchantPortalPamProductController

Create an instance: `let merchant_portal_pam_product_controller = Sdk_client.merchant_portal_pam_product_controller client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `string` |  |
| `filter` | `value map` |  |
| `language` | `string` |  |
| `merchantID` | `string` |  |
| `packageOrderUUID` | `string` |  |
| `pagination` | `value map` |  |
| `productOrderUUID` | `string` |  |
| `productUUID` | `string` |  |
| `reason_decline` | `string` |  |
| `sorting` | `value map` |  |

#### Example: Create

```ocaml
let merchant_portal_pam_product_controller = (Sdk_client.merchant_portal_pam_product_controller client Noval).e_create (jo [
    ("packageOrderUUID", (Str "example_packageOrderUUID"));  (* string *)
    ("productOrderUUID", (Str "example_productOrderUUID"));  (* string *)
    ("productUUID", (Str "example_productUUID"));  (* string *)
    ("reason_decline", (Str "example_reason_decline"));  (* string *)
]) Noval
let merchant_portal_pam_product_controller_data = merchant_portal_pam_product_controller.e_data_get ()
```


### OutputAddProduct

Create an instance: `let output_add_product = Sdk_client.output_add_product client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `string` |  |
| `productUUIDs` | `value list` |  |
| `responseCode` | `int` |  |
| `responseMessage` | `string` |  |

#### Example: Create

```ocaml
let output_add_product = (Sdk_client.output_add_product client Noval).e_create (jo [
    ("packageUUID", (Str "example_packageUUID"));  (* string *)
    ("productUUIDs", (empty_list ()));  (* value list *)
    ("responseCode", (Num 1.));  (* int *)
    ("responseMessage", (Str "example_responseMessage"));  (* string *)
]) Noval
let output_add_product_data = output_add_product.e_data_get ()
```


### OutputCreateProduct

Create an instance: `let output_create_product = Sdk_client.output_create_product client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

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

```ocaml
let output_create_product = (Sdk_client.output_create_product client Noval).e_create (jo [
    ("allowMultipleOrders", (Bool true));  (* bool *)
    ("appFormTemplateName", (Str "example_appFormTemplateName"));  (* string *)
    ("contractNeeded", (Bool true));  (* bool *)
    ("descriptionKey", (Str "example_descriptionKey"));  (* string *)
    ("nameKey", (Str "example_nameKey"));  (* string *)
    ("prescreeningAllowed", (Bool true));  (* bool *)
    ("productName", (Str "example_productName"));  (* string *)
    ("responseCode", (Num 1.));  (* int *)
    ("responseMessage", (Str "example_responseMessage"));  (* string *)
    ("terminalTemplateName", (Str "example_terminalTemplateName"));  (* string *)
    ("vendorName", (Str "example_vendorName"));  (* string *)
    ("xmlTemplateFile", (Str "example_xmlTemplateFile"));  (* string *)
]) Noval
let output_create_product_data = output_create_product.e_data_get ()
```


### OutputDetail

Create an instance: `let output_detail = Sdk_client.output_detail client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `batch` | `value map` |  |
| `lines` | `value map` |  |
| `progress` | `value map` |  |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let output_detail = (Sdk_client.output_detail client Noval).e_load (jo [("id", (Str "output_detail_id"))]) Noval
let output_detail_data = output_detail.e_data_get ()
```


### OutputList

Create an instance: `let output_list = Sdk_client.output_list client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `items` | `value list` |  |
| `pagination` | `value map` |  |
| `responseCode` | `int` |  |
| `responseMessage` | `string` |  |
| `sorting` | `value map` |  |

#### Example: Create

```ocaml
let output_list = (Sdk_client.output_list client Noval).e_create (jo [
    ("pagination", (empty_map ()));  (* value map *)
    ("responseCode", (Num 1.));  (* int *)
    ("responseMessage", (Str "example_responseMessage"));  (* string *)
]) Noval
let output_list_data = output_list.e_data_get ()
```


### OutputMessage

Create an instance: `let output_message = Sdk_client.output_message client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `responseCode` | `int` |  |
| `responseMessage` | `string` |  |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let output_message = (Sdk_client.output_message client Noval).e_load (jo [("id", (Str "output_message_id"))]) Noval
let output_message_data = output_message.e_data_get ()
```


### OutputMoveTid

Create an instance: `let output_move_tid = Sdk_client.output_move_tid client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `productOrderUUIDs` | `value list` |  |
| `responseCode` | `int` |  |
| `responseMessage` | `string` |  |
| `targetPackageOrderUUID` | `string` |  |
| `targetProductOrderUUID` | `string` |  |

#### Example: Create

```ocaml
let output_move_tid = (Sdk_client.output_move_tid client Noval).e_create (jo [
    ("productOrderUUIDs", (empty_list ()));  (* value list *)
    ("responseCode", (Num 1.));  (* int *)
    ("responseMessage", (Str "example_responseMessage"));  (* string *)
    ("targetPackageOrderUUID", (Str "example_targetPackageOrderUUID"));  (* string *)
    ("targetProductOrderUUID", (Str "example_targetProductOrderUUID"));  (* string *)
]) Noval
let output_move_tid_data = output_move_tid.e_data_get ()
```


### OutputRemoveProduct

Create an instance: `let output_remove_product = Sdk_client.output_remove_product client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `string` |  |
| `productUUIDs` | `value list` |  |
| `responseCode` | `int` |  |
| `responseMessage` | `string` |  |

#### Example: Create

```ocaml
let output_remove_product = (Sdk_client.output_remove_product client Noval).e_create (jo [
    ("packageUUID", (Str "example_packageUUID"));  (* string *)
    ("productUUIDs", (empty_list ()));  (* value list *)
    ("responseCode", (Num 1.));  (* int *)
    ("responseMessage", (Str "example_responseMessage"));  (* string *)
]) Noval
let output_remove_product_data = output_remove_product.e_data_get ()
```


### OutputStart

Create an instance: `let output_start = Sdk_client.output_start client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `string` |  |
| `responseCode` | `int` |  |
| `responseMessage` | `string` |  |

#### Example: Create

```ocaml
let output_start = (Sdk_client.output_start client Noval).e_create (jo [
    ("responseCode", (Num 1.));  (* int *)
    ("responseMessage", (Str "example_responseMessage"));  (* string *)
]) Noval
let output_start_data = output_start.e_data_get ()
```


### OutputStatus

Create an instance: `let output_status = Sdk_client.output_status client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `int` |  |
| `responseCode` | `int` |  |
| `responseMessage` | `string` |  |
| `status` | `string` |  |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let output_status = (Sdk_client.output_status client Noval).e_load (jo [("id", (Str "output_status_id"))]) Noval
let output_status_data = output_status.e_data_get ()
```


### OutputUpdateProduct

Create an instance: `let output_update_product = Sdk_client.output_update_product client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

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

```ocaml
let output_update_product = (Sdk_client.output_update_product client Noval).e_create (jo [
    ("productUUID", (Str "example_productUUID"));  (* string *)
    ("responseCode", (Num 1.));  (* int *)
    ("responseMessage", (Str "example_responseMessage"));  (* string *)
]) Noval
let output_update_product_data = output_update_product.e_data_get ()
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
