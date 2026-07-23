# BluefinTecsMerchantPortal Clojure SDK



The Clojure SDK for the BluefinTecsMerchantPortal API — an entity-oriented client
following idiomatic Clojure conventions (plain functions, immutable data, and
the vendored `voxgig.struct` value model).

The SDK exposes the API as capitalised, semantic **Entities** — for example `(api/merchant_portal_api_controller client nil)` — each
carrying a small, uniform set of operations (`load`, `create`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Clojars. Depend on it directly from the
GitHub release tag (`clojure/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases)),
using a `tools.deps` git dependency:

```clojure
;; deps.edn
{:deps {bluefintecsmerchantportal/sdk
        {:git/url "https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk"
         :git/tag "clojure/vX.Y.Z"
         :git/sha "..."
         :deps/root "clojure"}}}
```

Or from a local source checkout:

```clojure
;; deps.edn
{:deps {bluefintecsmerchantportal/sdk {:local/root "../clojure"}}}
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```clojure
(require '[sdk.api :as api]
         '[sdk.entity.merchant_portal_api_controller :as e-merchant_portal_api_controller]
         '[voxgig.struct :as vs])

(def client (api/make-sdk nil))
```

### 4. Create, update, and remove

```clojure
;; Create — returns the bare created record (a map)
(def created (e-merchant_portal_api_controller/create (api/merchant_portal_api_controller client nil) (vs/jm "business_reg_number" "example_business_reg_number" "city" "example_city" "country" "example_country" "currency" "example_currency" "merchant_category_code" 1 "merchant_name" "example_merchant_name" "packageid" "example_packageid" "packageorderuuid" "example_packageorderuuid" "reason_deactivation" "example_reason_deactivation" "reason_reactivation" "example_reason_reactivation" "street" "example_street" "terminal_country_code" "example_terminal_country_code" "terminal_language_code" "example_terminal_language_code" "terminal_location" "example_terminal_location" "terminal_serial_number" "example_terminal_serial_number" "terminalid" 1 "vu_nummer" "example_vu_nummer" "zipcode" "example_zipcode") nil))

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

For endpoints not covered by entity operations:

```clojure
(def result
  (api/direct client
    (vs/jm "path" "/api/resource/{id}"
           "method" "GET"
           "params" (vs/jm "id" "example"))))

(if (vs/getprop result "ok")
  (do
    (println (vs/getprop result "status"))  ;; 200
    (println (vs/getprop result "data")))   ;; response body
  ;; A non-2xx response carries status + data (the error body); a
  ;; transport-level failure carries err instead. Only one is present.
  (println (vs/getprop result "status") (vs/getprop result "err")))
```

### Prepare a request without sending it

```clojure
;; prepare returns the fetch definition and raises on error.
(def fetchdef
  (api/prepare client
    (vs/jm "path" "/api/resource/{id}"
           "method" "DELETE"
           "params" (vs/jm "id" "example"))))

(println (vs/getprop fetchdef "url"))
(println (vs/getprop fetchdef "method"))
(println (vs/getprop fetchdef "headers"))
```

### Use test mode

Create a mock client for unit testing — no server required:

```clojure
(require '[sdk.api :as api]
         '[sdk.entity.output_detail :as e-output_detail]
         '[voxgig.struct :as vs])

(def client (api/test-sdk nil nil))

;; Entity ops return the bare record and raise on error.
(def output_detail (e-output_detail/load (api/output_detail client nil) (vs/jm "id" "test01") nil))
;; output_detail contains the mock response record
(println output_detail)
```

### Use a custom fetch function

Replace the HTTP transport with your own function. A fetch fn takes the
URL and fetch definition and returns a `[response err]` pair; `response`
is a struct map carrying `status`, `headers`, and a `json` thunk:

```clojure
(defn mock-fetch [url fetchdef]
  [(vs/jm "status" 200
          "statusText" "OK"
          "headers" (vs/jm)
          "json" (fn [] (vs/jm "id" "mock01")))
   nil])

(def client
  (api/make-sdk
    (vs/jm "base" "http://localhost:8080"
           "system" (vs/jm "fetch" mock-fetch))))
```

### Run the test suite

The generated suite (pipeline, features, netsim, primary utility and the
vendored struct corpus) runs offline through a single `tools.deps` entry
point:

```bash
cd clojure && make test
```

To exercise the SDK against the live API, construct a client with real
credentials and call its operations directly.


## Reference

### make-sdk

```clojure
(require '[sdk.api :as api]
         '[voxgig.struct :as vs])

(def client (api/make-sdk options))
```

Creates a new SDK client. `options` is a `voxgig.struct` map (or `nil`).

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `extend` | `vector` | Additional feature atoms to load. |
| `system` | `map` | System overrides (e.g. custom `fetch` fn). |

### test-sdk

```clojure
(def client (api/test-sdk testopts sdkopts))
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### Client functions

| Function | Signature | Description |
| --- | --- | --- |
| `options-map` | `(client) -> map` | Deep copy of current SDK options. |
| `get-utility` | `(client) -> utility` | Copy of the SDK utility object. |
| `prepare` | `(client fetchargs) -> map` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(client fetchargs) -> map` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `merchant_portal_api_controller` | `(client data) -> MerchantPortalApiController entity` | Create a MerchantPortalApiController entity instance. |
| `merchant_portal_common_controller` | `(client data) -> MerchantPortalCommonController entity` | Create a MerchantPortalCommonController entity instance. |
| `merchant_portal_pam_contract_controller` | `(client data) -> MerchantPortalPamContractController entity` | Create a MerchantPortalPamContractController entity instance. |
| `merchant_portal_pam_document_controller` | `(client data) -> MerchantPortalPamDocumentController entity` | Create a MerchantPortalPamDocumentController entity instance. |
| `merchant_portal_pam_form_controller` | `(client data) -> MerchantPortalPamFormController entity` | Create a MerchantPortalPamFormController entity instance. |
| `merchant_portal_pam_mandator_controller` | `(client data) -> MerchantPortalPamMandatorController entity` | Create a MerchantPortalPamMandatorController entity instance. |
| `merchant_portal_pam_merchant_controller` | `(client data) -> MerchantPortalPamMerchantController entity` | Create a MerchantPortalPamMerchantController entity instance. |
| `merchant_portal_pam_package_controller` | `(client data) -> MerchantPortalPamPackageController entity` | Create a MerchantPortalPamPackageController entity instance. |
| `merchant_portal_pam_product_controller` | `(client data) -> MerchantPortalPamProductController entity` | Create a MerchantPortalPamProductController entity instance. |
| `output_add_product` | `(client data) -> OutputAddProduct entity` | Create an OutputAddProduct entity instance. |
| `output_create_product` | `(client data) -> OutputCreateProduct entity` | Create an OutputCreateProduct entity instance. |
| `output_detail` | `(client data) -> OutputDetail entity` | Create an OutputDetail entity instance. |
| `output_list` | `(client data) -> OutputList entity` | Create an OutputList entity instance. |
| `output_message` | `(client data) -> OutputMessage entity` | Create an OutputMessage entity instance. |
| `output_move_tid` | `(client data) -> OutputMoveTid entity` | Create an OutputMoveTid entity instance. |
| `output_remove_product` | `(client data) -> OutputRemoveProduct entity` | Create an OutputRemoveProduct entity instance. |
| `output_start` | `(client data) -> OutputStart entity` | Create an OutputStart entity instance. |
| `output_status` | `(client data) -> OutputStatus entity` | Create an OutputStatus entity instance. |
| `output_update_product` | `(client data) -> OutputUpdateProduct entity` | Create an OutputUpdateProduct entity instance. |

### Entity interface

All entities share the same interface. Operations are functions in the
entity namespace (`sdk.entity.<name>`); state accessors are stored on the
entity map and are called via keyword lookup.

| Member | Signature | Description |
| --- | --- | --- |
| `load` | `(ent reqmatch ctrl) -> map` | Load a single entity by match criteria. Raises on error. |
| `create` | `(ent reqdata ctrl) -> map` | Create a new entity. Raises on error. |
| `:data-get` | `() -> map` | Get entity data. |
| `:data-set` | `(data)` | Set entity data. |
| `:match-get` | `() -> map` | Get entity match criteria. |
| `:match-set` | `(match)` | Set entity match criteria. |
| `:make` | `() -> entity` | Create a new instance with the same options. |
| `:get-name` | `() -> string` | Return the entity name. |

State accessors are called by looking up the fn and applying it, e.g.
`((:data-get ent))` or `((:data-set ent) (vs/jm "k" "v"))`.

### Result shape

Entity operations return the bare result data (a `map` for single-entity
ops, a `vector` for `list`) and raise (via `ex-info`) on error. Wrap
calls in `try`/`catch` to handle failures.

The `direct` escape hatch never raises — it returns a result `map` you
branch on via `(vs/getprop result "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `boolean` | `true` if the HTTP status is 2xx. |
| `status` | `long` | HTTP status code. |
| `headers` | `map` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

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

Create an instance: `(def merchant_portal_api_controller (api/merchant_portal_api_controller client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `long` |  |
| `additional_data` | `map` |  |
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

```clojure
(def merchant_portal_api_controller
  (e-merchant_portal_api_controller/create (api/merchant_portal_api_controller client nil)
    (vs/jm
      "business_reg_number" "example_business_reg_number"  ;; string
      "city" "example_city"  ;; string
      "country" "example_country"  ;; string
      "currency" "example_currency"  ;; string
      "merchant_category_code" 1  ;; long
      "merchant_name" "example_merchant_name"  ;; string
      "packageid" "example_packageid"  ;; string
      "packageorderuuid" "example_packageorderuuid"  ;; string
      "reason_deactivation" "example_reason_deactivation"  ;; string
      "reason_reactivation" "example_reason_reactivation"  ;; string
      "street" "example_street"  ;; string
      "terminal_country_code" "example_terminal_country_code"  ;; string
      "terminal_language_code" "example_terminal_language_code"  ;; string
      "terminal_location" "example_terminal_location"  ;; string
      "terminal_serial_number" "example_terminal_serial_number"  ;; string
      "terminalid" 1  ;; long
      "vu_nummer" "example_vu_nummer"  ;; string
      "zipcode" "example_zipcode"  ;; string
      )
    nil))
```


### MerchantPortalCommonController

Create an instance: `(def merchant_portal_common_controller (api/merchant_portal_common_controller client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```clojure
(def merchant_portal_common_controller (e-merchant_portal_common_controller/load (api/merchant_portal_common_controller client nil) nil nil))
```


### MerchantPortalPamContractController

Create an instance: `(def merchant_portal_pam_contract_controller (api/merchant_portal_pam_contract_controller client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `string` |  |
| `product_order_uuid` | `string` |  |

#### Example: Create

```clojure
(def merchant_portal_pam_contract_controller
  (e-merchant_portal_pam_contract_controller/create (api/merchant_portal_pam_contract_controller client nil)
    (vs/jm
      "language" "example_language"  ;; string
      "product_order_uuid" "example_product_order_uuid"  ;; string
      )
    nil))
```


### MerchantPortalPamDocumentController

Create an instance: `(def merchant_portal_pam_document_controller (api/merchant_portal_pam_document_controller client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_field_desc_uuid` | `string` |  |
| `package_order_uuid` | `string` |  |
| `product_order_uuid` | `string` |  |

#### Example: Create

```clojure
(def merchant_portal_pam_document_controller
  (e-merchant_portal_pam_document_controller/create (api/merchant_portal_pam_document_controller client nil)
    (vs/jm
      "app_form_field_desc_uuid" "example_app_form_field_desc_uuid"  ;; string
      )
    nil))
```


### MerchantPortalPamFormController

Create an instance: `(def merchant_portal_pam_form_controller (api/merchant_portal_pam_form_controller client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_fields_desc_uuid` | `string` |  |
| `filter` | `map` |  |
| `language` | `string` |  |
| `package_order` | `map` |  |
| `package_order_uuid` | `string` |  |
| `package_uuid` | `string` |  |
| `product_order` | `vector` |  |
| `product_order_uuid` | `string` |  |
| `reason_of_reopening` | `string` |  |

#### Example: Create

```clojure
(def merchant_portal_pam_form_controller
  (e-merchant_portal_pam_form_controller/create (api/merchant_portal_pam_form_controller client nil)
    (vs/jm
      "app_form_fields_desc_uuid" "example_app_form_fields_desc_uuid"  ;; string
      "language" "example_language"  ;; string
      "package_order_uuid" "example_package_order_uuid"  ;; string
      "reason_of_reopening" "example_reason_of_reopening"  ;; string
      )
    nil))
```


### MerchantPortalPamMandatorController

Create an instance: `(def merchant_portal_pam_mandator_controller (api/merchant_portal_pam_mandator_controller client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client_secret` | `string` |  |
| `mandator_name` | `string` |  |
| `notification_email` | `string` |  |
| `package_uuid` | `string` |  |

#### Example: Create

```clojure
(def merchant_portal_pam_mandator_controller
  (e-merchant_portal_pam_mandator_controller/create (api/merchant_portal_pam_mandator_controller client nil)
    (vs/jm
      "mandator_name" "example_mandator_name"  ;; string
      "package_uuid" "example_package_uuid"  ;; string
      )
    nil))
```


### MerchantPortalPamMerchantController

Create an instance: `(def merchant_portal_pam_merchant_controller (api/merchant_portal_pam_merchant_controller client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `map` |  |
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
| `terminal_id` | `vector` |  |
| `terminalid_acquirer` | `string` |  |
| `vu_nummer` | `string` |  |

#### Example: Create

```clojure
(def merchant_portal_pam_merchant_controller
  (e-merchant_portal_pam_merchant_controller/create (api/merchant_portal_pam_merchant_controller client nil)
    (vs/jm
      "business_registration_number" "example_business_registration_number"  ;; string
      "company_name" "example_company_name"  ;; string
      "corporate_uuid" "example_corporate_uuid"  ;; string
      "currency" "example_currency"  ;; string
      "email" "example_email"  ;; string
      "language" "example_language"  ;; string
      "login" "example_login"  ;; string
      "mandator" "example_mandator"  ;; string
      "merchant_contract_number" "example_merchant_contract_number"  ;; string
      "packageorderuuid" "example_packageorderuuid"  ;; string
      "phone_number" "example_phone_number"  ;; string
      "productid_acquirer" "example_productid_acquirer"  ;; string
      "vu_nummer" "example_vu_nummer"  ;; string
      )
    nil))
```


### MerchantPortalPamPackageController

Create an instance: `(def merchant_portal_pam_package_controller (api/merchant_portal_pam_package_controller client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `string` |  |
| `corporate_uuid` | `string` |  |
| `country` | `string` |  |
| `description_key` | `string` |  |
| `filter` | `map` |  |
| `language` | `string` |  |
| `name_key` | `string` |  |
| `package_status` | `string` |  |
| `package_uuid` | `string` |  |
| `pagination` | `map` |  |
| `sorting` | `map` |  |

#### Example: Create

```clojure
(def merchant_portal_pam_package_controller
  (e-merchant_portal_pam_package_controller/create (api/merchant_portal_pam_package_controller client nil)
    (vs/jm
      "language" "example_language"  ;; string
      "package_uuid" "example_package_uuid"  ;; string
      )
    nil))
```


### MerchantPortalPamProductController

Create an instance: `(def merchant_portal_pam_product_controller (api/merchant_portal_pam_product_controller client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `string` |  |
| `filter` | `map` |  |
| `language` | `string` |  |
| `merchant_id` | `string` |  |
| `package_order_uuid` | `string` |  |
| `pagination` | `map` |  |
| `product_order_uuid` | `string` |  |
| `product_uuid` | `string` |  |
| `reason_decline` | `string` |  |
| `sorting` | `map` |  |

#### Example: Create

```clojure
(def merchant_portal_pam_product_controller
  (e-merchant_portal_pam_product_controller/create (api/merchant_portal_pam_product_controller client nil)
    (vs/jm
      "package_order_uuid" "example_package_order_uuid"  ;; string
      "product_order_uuid" "example_product_order_uuid"  ;; string
      "product_uuid" "example_product_uuid"  ;; string
      "reason_decline" "example_reason_decline"  ;; string
      )
    nil))
```


### OutputAddProduct

Create an instance: `(def output_add_product (api/output_add_product client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `string` |  |
| `product_uui_d` | `vector` |  |
| `response_code` | `long` |  |
| `response_message` | `string` |  |

#### Example: Create

```clojure
(def output_add_product
  (e-output_add_product/create (api/output_add_product client nil)
    (vs/jm
      "package_uuid" "example_package_uuid"  ;; string
      "product_uui_d" (vs/jt)  ;; vector
      "response_code" 1  ;; long
      "response_message" "example_response_message"  ;; string
      )
    nil))
```


### OutputCreateProduct

Create an instance: `(def output_create_product (api/output_create_product client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirer_id` | `string` |  |
| `allow_multiple_order` | `boolean` |  |
| `app_form_template_name` | `string` |  |
| `contract_needed` | `boolean` |  |
| `credentials_needed` | `boolean` |  |
| `description_key` | `string` |  |
| `name_key` | `string` |  |
| `prescreening_allowed` | `boolean` |  |
| `product_name` | `string` |  |
| `response_code` | `long` |  |
| `response_message` | `string` |  |
| `terminal_template_name` | `string` |  |
| `vendor_name` | `string` |  |
| `xml_template_file` | `string` |  |

#### Example: Create

```clojure
(def output_create_product
  (e-output_create_product/create (api/output_create_product client nil)
    (vs/jm
      "allow_multiple_order" true  ;; boolean
      "app_form_template_name" "example_app_form_template_name"  ;; string
      "contract_needed" true  ;; boolean
      "description_key" "example_description_key"  ;; string
      "name_key" "example_name_key"  ;; string
      "prescreening_allowed" true  ;; boolean
      "product_name" "example_product_name"  ;; string
      "response_code" 1  ;; long
      "response_message" "example_response_message"  ;; string
      "terminal_template_name" "example_terminal_template_name"  ;; string
      "vendor_name" "example_vendor_name"  ;; string
      "xml_template_file" "example_xml_template_file"  ;; string
      )
    nil))
```


### OutputDetail

Create an instance: `(def output_detail (api/output_detail client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `detail` | `map` |  |
| `response_code` | `long` |  |
| `response_message` | `string` |  |

#### Example: Load

```clojure
(def output_detail (e-output_detail/load (api/output_detail client nil) (vs/jm "id" "output_detail_id") nil))
```


### OutputList

Create an instance: `(def output_list (api/output_list client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `item` | `vector` |  |
| `pagination` | `map` |  |
| `response_code` | `long` |  |
| `response_message` | `string` |  |
| `sorting` | `map` |  |

#### Example: Create

```clojure
(def output_list
  (e-output_list/create (api/output_list client nil)
    (vs/jm
      "pagination" (vs/jm)  ;; map
      "response_code" 1  ;; long
      "response_message" "example_response_message"  ;; string
      )
    nil))
```


### OutputMessage

Create an instance: `(def output_message (api/output_message client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `response_code` | `long` |  |
| `response_message` | `string` |  |

#### Example: Load

```clojure
(def output_message (e-output_message/load (api/output_message client nil) (vs/jm "id" "output_message_id") nil))
```


### OutputMoveTid

Create an instance: `(def output_move_tid (api/output_move_tid client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `product_order_uui_d` | `vector` |  |
| `response_code` | `long` |  |
| `response_message` | `string` |  |
| `target_package_order_uuid` | `string` |  |
| `target_product_order_uuid` | `string` |  |

#### Example: Create

```clojure
(def output_move_tid
  (e-output_move_tid/create (api/output_move_tid client nil)
    (vs/jm
      "product_order_uui_d" (vs/jt)  ;; vector
      "response_code" 1  ;; long
      "response_message" "example_response_message"  ;; string
      "target_package_order_uuid" "example_target_package_order_uuid"  ;; string
      "target_product_order_uuid" "example_target_product_order_uuid"  ;; string
      )
    nil))
```


### OutputRemoveProduct

Create an instance: `(def output_remove_product (api/output_remove_product client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `string` |  |
| `product_uui_d` | `vector` |  |
| `response_code` | `long` |  |
| `response_message` | `string` |  |

#### Example: Create

```clojure
(def output_remove_product
  (e-output_remove_product/create (api/output_remove_product client nil)
    (vs/jm
      "package_uuid" "example_package_uuid"  ;; string
      "product_uui_d" (vs/jt)  ;; vector
      "response_code" 1  ;; long
      "response_message" "example_response_message"  ;; string
      )
    nil))
```


### OutputStart

Create an instance: `(def output_start (api/output_start client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `string` |  |
| `response_code` | `long` |  |
| `response_message` | `string` |  |

#### Example: Create

```clojure
(def output_start
  (e-output_start/create (api/output_start client nil)
    (vs/jm
      "response_code" 1  ;; long
      "response_message" "example_response_message"  ;; string
      )
    nil))
```


### OutputStatus

Create an instance: `(def output_status (api/output_status client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `long` |  |
| `response_code` | `long` |  |
| `response_message` | `string` |  |
| `status` | `string` |  |

#### Example: Load

```clojure
(def output_status (e-output_status/load (api/output_status client nil) (vs/jm "id" "output_status_id") nil))
```


### OutputUpdateProduct

Create an instance: `(def output_update_product (api/output_update_product client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allow_multiple_order` | `boolean` |  |
| `app_form_name` | `string` |  |
| `contract_needed` | `boolean` |  |
| `credentials_needed` | `boolean` |  |
| `description_key` | `string` |  |
| `name_key` | `string` |  |
| `prescreening_allowed` | `boolean` |  |
| `product_name` | `string` |  |
| `product_status` | `string` |  |
| `product_uuid` | `string` |  |
| `response_code` | `long` |  |
| `response_message` | `string` |  |
| `vendor_name` | `string` |  |

#### Example: Create

```clojure
(def output_update_product
  (e-output_update_product/create (api/output_update_product client nil)
    (vs/jm
      "product_uuid" "example_product_uuid"  ;; string
      "response_code" 1  ;; long
      "response_message" "example_response_message"  ;; string
      )
    nil))
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

### Data as struct value maps

The Clojure SDK represents API data with the vendored `voxgig.struct`
value model (ordered, Java-backed maps and lists) rather than typed
records. This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with `(vs/jm "k" v ...)` and lists with
`(vs/jt v ...)`; read values with `(vs/getprop m "k")`. Use
`(vs/ismap x)` to safely check that a value is a map.

### Namespace structure

```
clojure/
├── src/sdk/api.clj        -- public API namespace (entity accessors)
├── src/sdk/client.clj     -- client constructors (make-sdk, test-sdk)
├── src/sdk/config.clj     -- generated configuration
├── src/sdk/core.clj       -- core types, context and pipeline
├── src/sdk/features.clj   -- feature factory
├── src/sdk/entity/        -- entity namespaces (one per entity)
├── src/voxgig/struct.clj  -- vendored struct value library
└── test/                  -- test suites
```

Require `[sdk.api :as api]` for the public surface, and an entity
namespace (e.g. `[sdk.entity.bluefintecsmerchantportal :as e-bluefintecsmerchantportal]`)
only when you call its operations directly.

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
