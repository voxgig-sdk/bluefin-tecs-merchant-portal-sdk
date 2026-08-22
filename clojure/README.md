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

Create an instance: `(def merchant_portal_api_controller (api/merchant_portal_api_controller client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `long` | Account number provided by the acquirer. |
| `additional_data` | `map` | Arbitrary merchant-specific data related to terminal registration. |
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
| `productOrderUUID` | `string` |  |

#### Example: Create

```clojure
(def merchant_portal_pam_contract_controller
  (e-merchant_portal_pam_contract_controller/create (api/merchant_portal_pam_contract_controller client nil)
    (vs/jm
      "language" "example_language"  ;; string
      "productOrderUUID" "example_productOrderUUID"  ;; string
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
| `appFormFieldDescUUID` | `string` |  |
| `packageOrderUUID` | `string` | UUID of the package order. |
| `productOrderUUID` | `string` | UUID of the product order. |

#### Example: Create

```clojure
(def merchant_portal_pam_document_controller
  (e-merchant_portal_pam_document_controller/create (api/merchant_portal_pam_document_controller client nil)
    (vs/jm
      "appFormFieldDescUUID" "example_appFormFieldDescUUID"  ;; string
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
| `appFormFieldsDescUUID` | `string` |  |
| `filter` | `map` |  |
| `language` | `string` |  |
| `packageOrder` | `map` |  |
| `packageOrderUUID` | `string` | UUID of the package order. |
| `packageUUID` | `string` |  |
| `productOrderUUID` | `string` | UUID of the product order. |
| `productOrders` | `vector` |  |
| `reasonOfReopening` | `string` |  |

#### Example: Create

```clojure
(def merchant_portal_pam_form_controller
  (e-merchant_portal_pam_form_controller/create (api/merchant_portal_pam_form_controller client nil)
    (vs/jm
      "appFormFieldsDescUUID" "example_appFormFieldsDescUUID"  ;; string
      "language" "example_language"  ;; string
      "packageOrderUUID" "example_packageOrderUUID"  ;; string
      "reasonOfReopening" "example_reasonOfReopening"  ;; string
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
| `clientSecret` | `string` |  |
| `mandatorName` | `string` |  |
| `notificationEmail` | `string` |  |
| `packageUUID` | `string` |  |

#### Example: Create

```clojure
(def merchant_portal_pam_mandator_controller
  (e-merchant_portal_pam_mandator_controller/create (api/merchant_portal_pam_mandator_controller client nil)
    (vs/jm
      "mandatorName" "example_mandatorName"  ;; string
      "packageUUID" "example_packageUUID"  ;; string
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
| `additional_data` | `map` | Optional additional merchant-specific data related to enabling acquiring. |
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
| `terminalIds` | `vector` | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `string` | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `string` | Merchant contract number with the acquirer. |

#### Example: Create

```clojure
(def merchant_portal_pam_merchant_controller
  (e-merchant_portal_pam_merchant_controller/create (api/merchant_portal_pam_merchant_controller client nil)
    (vs/jm
      "businessRegistrationNumber" "example_businessRegistrationNumber"  ;; string
      "companyName" "example_companyName"  ;; string
      "corporateUUID" "example_corporateUUID"  ;; string
      "currency" "example_currency"  ;; string
      "email" "example_email"  ;; string
      "language" "example_language"  ;; string
      "login" "example_login"  ;; string
      "mandator" "example_mandator"  ;; string
      "merchantContractNumber" "example_merchantContractNumber"  ;; string
      "packageorderuuid" "example_packageorderuuid"  ;; string
      "phoneNumber" "example_phoneNumber"  ;; string
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
| `consumerUUID` | `string` |  |
| `corporateUUID` | `string` |  |
| `country` | `string` | Country associated with the package. |
| `descriptionKey` | `string` | Key for the description of the package. |
| `filter` | `map` |  |
| `language` | `string` |  |
| `nameKey` | `string` | Key for the name of the package. |
| `packageStatus` | `string` | Status of the package. |
| `packageUUID` | `string` | Unique identifier for the package. |
| `pagination` | `map` |  |
| `sorting` | `map` |  |

#### Example: Create

```clojure
(def merchant_portal_pam_package_controller
  (e-merchant_portal_pam_package_controller/create (api/merchant_portal_pam_package_controller client nil)
    (vs/jm
      "language" "example_language"  ;; string
      "packageUUID" "example_packageUUID"  ;; string
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
| `consumerUUID` | `string` |  |
| `filter` | `map` |  |
| `language` | `string` |  |
| `merchantID` | `string` |  |
| `packageOrderUUID` | `string` |  |
| `pagination` | `map` |  |
| `productOrderUUID` | `string` |  |
| `productUUID` | `string` |  |
| `reason_decline` | `string` | Reason for product decline. |
| `sorting` | `map` |  |

#### Example: Create

```clojure
(def merchant_portal_pam_product_controller
  (e-merchant_portal_pam_product_controller/create (api/merchant_portal_pam_product_controller client nil)
    (vs/jm
      "packageOrderUUID" "example_packageOrderUUID"  ;; string
      "productOrderUUID" "example_productOrderUUID"  ;; string
      "productUUID" "example_productUUID"  ;; string
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
| `packageUUID` | `string` | Unique identifier for the package. |
| `productUUIDs` | `vector` | The list of unique identifiers of the products. |
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |

#### Example: Create

```clojure
(def output_add_product
  (e-output_add_product/create (api/output_add_product client nil)
    (vs/jm
      "packageUUID" "example_packageUUID"  ;; string
      "productUUIDs" (vs/jt)  ;; vector
      "responseCode" 1  ;; long
      "responseMessage" "example_responseMessage"  ;; string
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
| `acquirerId` | `string` | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `boolean` | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `string` | Name of the application form template. |
| `contractNeeded` | `boolean` | Indication whether contract is needed or not. |
| `credentialsNeeded` | `boolean` | Indication whether credentials are needed or not. |
| `descriptionKey` | `string` | Key indicator for product description. |
| `nameKey` | `string` | Key indicator for product name. |
| `prescreeningAllowed` | `boolean` | Indication whether prescreening is allowed or not. |
| `productName` | `string` | Name of the product. |
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |
| `terminalTemplateName` | `string` | Name of the terminal template. |
| `vendorName` | `string` | Name of the vendor. |
| `xmlTemplateFile` | `string` | A string value containing the XML template file encoded in Base64. |

#### Example: Create

```clojure
(def output_create_product
  (e-output_create_product/create (api/output_create_product client nil)
    (vs/jm
      "allowMultipleOrders" true  ;; boolean
      "appFormTemplateName" "example_appFormTemplateName"  ;; string
      "contractNeeded" true  ;; boolean
      "descriptionKey" "example_descriptionKey"  ;; string
      "nameKey" "example_nameKey"  ;; string
      "prescreeningAllowed" true  ;; boolean
      "productName" "example_productName"  ;; string
      "responseCode" 1  ;; long
      "responseMessage" "example_responseMessage"  ;; string
      "terminalTemplateName" "example_terminalTemplateName"  ;; string
      "vendorName" "example_vendorName"  ;; string
      "xmlTemplateFile" "example_xmlTemplateFile"  ;; string
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
| `batch` | `map` |  |
| `lines` | `map` |  |
| `progress` | `map` |  |

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
| `items` | `vector` |  |
| `pagination` | `map` |  |
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |
| `sorting` | `map` |  |

#### Example: Create

```clojure
(def output_list
  (e-output_list/create (api/output_list client nil)
    (vs/jm
      "pagination" (vs/jm)  ;; map
      "responseCode" 1  ;; long
      "responseMessage" "example_responseMessage"  ;; string
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
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |

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
| `productOrderUUIDs` | `vector` |  |
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |
| `targetPackageOrderUUID` | `string` |  |
| `targetProductOrderUUID` | `string` |  |

#### Example: Create

```clojure
(def output_move_tid
  (e-output_move_tid/create (api/output_move_tid client nil)
    (vs/jm
      "productOrderUUIDs" (vs/jt)  ;; vector
      "responseCode" 1  ;; long
      "responseMessage" "example_responseMessage"  ;; string
      "targetPackageOrderUUID" "example_targetPackageOrderUUID"  ;; string
      "targetProductOrderUUID" "example_targetProductOrderUUID"  ;; string
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
| `packageUUID` | `string` | Unique identifier for the package. |
| `productUUIDs` | `vector` | List of product unique identifiers. |
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |

#### Example: Create

```clojure
(def output_remove_product
  (e-output_remove_product/create (api/output_remove_product client nil)
    (vs/jm
      "packageUUID" "example_packageUUID"  ;; string
      "productUUIDs" (vs/jt)  ;; vector
      "responseCode" 1  ;; long
      "responseMessage" "example_responseMessage"  ;; string
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
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |

#### Example: Create

```clojure
(def output_start
  (e-output_start/create (api/output_start client nil)
    (vs/jm
      "responseCode" 1  ;; long
      "responseMessage" "example_responseMessage"  ;; string
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
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |
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
| `allowMultipleOrders` | `boolean` | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `string` | The name of the application form |
| `contractNeeded` | `boolean` | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `boolean` | An attribute to indicate if credentials are needed |
| `descriptionKey` | `string` | The description of the product |
| `nameKey` | `string` | The key of the product name |
| `prescreeningAllowed` | `boolean` | An attribute to indicate if prescreening is allowed |
| `productName` | `string` | The name of the product |
| `productStatus` | `string` | The status of the product |
| `productUUID` | `string` | The UUID of the product to update |
| `responseCode` | `long` | Response code. |
| `responseMessage` | `string` | Response message. |
| `vendorName` | `string` | The name of the vendor |

#### Example: Create

```clojure
(def output_update_product
  (e-output_update_product/create (api/output_update_product client nil)
    (vs/jm
      "productUUID" "example_productUUID"  ;; string
      "responseCode" 1  ;; long
      "responseMessage" "example_responseMessage"  ;; string
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
