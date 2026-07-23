# BluefinTecsMerchantPortal Clojure SDK Reference

Complete API reference for the BluefinTecsMerchantPortal Clojure SDK.


## Client

### make-sdk

```clojure
(require '[sdk.api :as api]
         '[voxgig.struct :as vs])

(def client (api/make-sdk options))
```

Create a new SDK client instance. `options` is a `voxgig.struct` map.

**Options:**

| Key | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides (e.g. custom fetch). |


### Test client

#### `(api/test-sdk testopts sdkopts)`

Create a test client with mock features active. Both arguments may be `nil`.

```clojure
(def client (api/test-sdk nil nil))
```


### Client functions

#### `(api/merchant_portal_api_controller client data)`

Create a new `MerchantPortalApiController` entity instance. Pass `nil` for no initial data.

#### `(api/merchant_portal_common_controller client data)`

Create a new `MerchantPortalCommonController` entity instance. Pass `nil` for no initial data.

#### `(api/merchant_portal_pam_contract_controller client data)`

Create a new `MerchantPortalPamContractController` entity instance. Pass `nil` for no initial data.

#### `(api/merchant_portal_pam_document_controller client data)`

Create a new `MerchantPortalPamDocumentController` entity instance. Pass `nil` for no initial data.

#### `(api/merchant_portal_pam_form_controller client data)`

Create a new `MerchantPortalPamFormController` entity instance. Pass `nil` for no initial data.

#### `(api/merchant_portal_pam_mandator_controller client data)`

Create a new `MerchantPortalPamMandatorController` entity instance. Pass `nil` for no initial data.

#### `(api/merchant_portal_pam_merchant_controller client data)`

Create a new `MerchantPortalPamMerchantController` entity instance. Pass `nil` for no initial data.

#### `(api/merchant_portal_pam_package_controller client data)`

Create a new `MerchantPortalPamPackageController` entity instance. Pass `nil` for no initial data.

#### `(api/merchant_portal_pam_product_controller client data)`

Create a new `MerchantPortalPamProductController` entity instance. Pass `nil` for no initial data.

#### `(api/output_add_product client data)`

Create a new `OutputAddProduct` entity instance. Pass `nil` for no initial data.

#### `(api/output_create_product client data)`

Create a new `OutputCreateProduct` entity instance. Pass `nil` for no initial data.

#### `(api/output_detail client data)`

Create a new `OutputDetail` entity instance. Pass `nil` for no initial data.

#### `(api/output_list client data)`

Create a new `OutputList` entity instance. Pass `nil` for no initial data.

#### `(api/output_message client data)`

Create a new `OutputMessage` entity instance. Pass `nil` for no initial data.

#### `(api/output_move_tid client data)`

Create a new `OutputMoveTid` entity instance. Pass `nil` for no initial data.

#### `(api/output_remove_product client data)`

Create a new `OutputRemoveProduct` entity instance. Pass `nil` for no initial data.

#### `(api/output_start client data)`

Create a new `OutputStart` entity instance. Pass `nil` for no initial data.

#### `(api/output_status client data)`

Create a new `OutputStatus` entity instance. Pass `nil` for no initial data.

#### `(api/output_update_product client data)`

Create a new `OutputUpdateProduct` entity instance. Pass `nil` for no initial data.

#### `(api/options-map client) -> map`

Return a deep copy of the current SDK options.

#### `(api/get-utility client) -> utility`

Return a copy of the SDK utility object.

#### `(api/direct client fetchargs) -> map`

Make a direct HTTP request to any API endpoint. Returns a result `map` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `(vs/getprop result "ok")`.

**Fetch args:**

| Key | Type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

**Returns:** a result `map`.

#### `(api/prepare client fetchargs) -> map`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## MerchantPortalApiController

```clojure
(require '[sdk.entity.merchant_portal_api_controller :as e-merchant_portal_api_controller])

(def merchant_portal_api_controller (api/merchant_portal_api_controller client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `long` | No |  |
| `additional_data` | `map` | No |  |
| `business_reg_number` | `string` | Yes |  |
| `city` | `string` | Yes |  |
| `corporateuuid` | `string` | No |  |
| `country` | `string` | Yes |  |
| `currency` | `string` | Yes |  |
| `merchant_category_code` | `long` | Yes |  |
| `merchant_email` | `string` | No |  |
| `merchant_name` | `string` | Yes |  |
| `merchant_phone_number` | `string` | No |  |
| `packageid` | `string` | Yes |  |
| `packageorderuuid` | `string` | Yes |  |
| `password` | `string` | No |  |
| `productid` | `string` | No |  |
| `productid_acquirer` | `string` | No |  |
| `reason_deactivation` | `string` | Yes |  |
| `reason_reactivation` | `string` | Yes |  |
| `sorting_code` | `long` | No |  |
| `state` | `string` | No |  |
| `street` | `string` | Yes |  |
| `terminal_country_code` | `string` | Yes |  |
| `terminal_language_code` | `string` | Yes |  |
| `terminal_location` | `string` | Yes |  |
| `terminal_serial_number` | `string` | Yes |  |
| `terminalid` | `long` | Yes |  |
| `terminalid_acquirer` | `string` | No |  |
| `user_email` | `string` | No |  |
| `user_phone_number` | `string` | No |  |
| `username` | `string` | No |  |
| `vu_nummer` | `string` | Yes |  |
| `web_shop_url` | `string` | No |  |
| `zipcode` | `string` | Yes |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
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

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `MerchantPortalApiController` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## MerchantPortalCommonController

```clojure
(require '[sdk.entity.merchant_portal_common_controller :as e-merchant_portal_common_controller])

(def merchant_portal_common_controller (api/merchant_portal_common_controller client nil))
```

### Operations

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-merchant_portal_common_controller/load (api/merchant_portal_common_controller client nil) nil nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `MerchantPortalCommonController` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## MerchantPortalPamContractController

```clojure
(require '[sdk.entity.merchant_portal_pam_contract_controller :as e-merchant_portal_pam_contract_controller])

(def merchant_portal_pam_contract_controller (api/merchant_portal_pam_contract_controller client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `string` | Yes |  |
| `product_order_uuid` | `string` | Yes |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-merchant_portal_pam_contract_controller/create (api/merchant_portal_pam_contract_controller client nil)
    (vs/jm
      "language" "example_language"  ;; string
      "product_order_uuid" "example_product_order_uuid"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `MerchantPortalPamContractController` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## MerchantPortalPamDocumentController

```clojure
(require '[sdk.entity.merchant_portal_pam_document_controller :as e-merchant_portal_pam_document_controller])

(def merchant_portal_pam_document_controller (api/merchant_portal_pam_document_controller client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_field_desc_uuid` | `string` | Yes |  |
| `package_order_uuid` | `string` | No |  |
| `product_order_uuid` | `string` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-merchant_portal_pam_document_controller/create (api/merchant_portal_pam_document_controller client nil)
    (vs/jm
      "app_form_field_desc_uuid" "example_app_form_field_desc_uuid"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `MerchantPortalPamDocumentController` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## MerchantPortalPamFormController

```clojure
(require '[sdk.entity.merchant_portal_pam_form_controller :as e-merchant_portal_pam_form_controller])

(def merchant_portal_pam_form_controller (api/merchant_portal_pam_form_controller client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_fields_desc_uuid` | `string` | Yes |  |
| `filter` | `map` | No |  |
| `language` | `string` | Yes |  |
| `package_order` | `map` | No |  |
| `package_order_uuid` | `string` | Yes |  |
| `package_uuid` | `string` | No |  |
| `product_order` | `vector` | No |  |
| `product_order_uuid` | `string` | No |  |
| `reason_of_reopening` | `string` | Yes |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `app_form_fields_desc_uuid` | - |
| `filter` | - |
| `language` | Yes |
| `package_order` | - |
| `package_order_uuid` | Yes |
| `package_uuid` | - |
| `product_order` | - |
| `product_order_uuid` | Yes |
| `reason_of_reopening` | - |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-merchant_portal_pam_form_controller/create (api/merchant_portal_pam_form_controller client nil)
    (vs/jm
      "app_form_fields_desc_uuid" "example_app_form_fields_desc_uuid"  ;; string
      "language" "example_language"  ;; string
      "package_order_uuid" "example_package_order_uuid"  ;; string
      "reason_of_reopening" "example_reason_of_reopening"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `MerchantPortalPamFormController` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## MerchantPortalPamMandatorController

```clojure
(require '[sdk.entity.merchant_portal_pam_mandator_controller :as e-merchant_portal_pam_mandator_controller])

(def merchant_portal_pam_mandator_controller (api/merchant_portal_pam_mandator_controller client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client_secret` | `string` | No |  |
| `mandator_name` | `string` | Yes |  |
| `notification_email` | `string` | No |  |
| `package_uuid` | `string` | Yes |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-merchant_portal_pam_mandator_controller/create (api/merchant_portal_pam_mandator_controller client nil)
    (vs/jm
      "mandator_name" "example_mandator_name"  ;; string
      "package_uuid" "example_package_uuid"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `MerchantPortalPamMandatorController` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## MerchantPortalPamMerchantController

```clojure
(require '[sdk.entity.merchant_portal_pam_merchant_controller :as e-merchant_portal_pam_merchant_controller])

(def merchant_portal_pam_merchant_controller (api/merchant_portal_pam_merchant_controller client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `map` | No |  |
| `business_registration_number` | `string` | Yes |  |
| `city` | `string` | No |  |
| `company_name` | `string` | Yes |  |
| `corporate_uuid` | `string` | Yes |  |
| `country` | `string` | No |  |
| `currency` | `string` | Yes |  |
| `email` | `string` | Yes |  |
| `language` | `string` | Yes |  |
| `login` | `string` | Yes |  |
| `mandator` | `string` | Yes |  |
| `merchant_category_code` | `string` | No |  |
| `merchant_contract_number` | `string` | Yes |  |
| `merchant_name` | `string` | No |  |
| `package_uuid` | `string` | No |  |
| `packageorderuuid` | `string` | Yes |  |
| `phone_number` | `string` | Yes |  |
| `postal_code` | `string` | No |  |
| `productid_acquirer` | `string` | Yes |  |
| `region` | `string` | No |  |
| `registration_number` | `string` | No |  |
| `signature` | `string` | No |  |
| `street` | `string` | No |  |
| `terminal_id` | `vector` | No |  |
| `terminalid_acquirer` | `string` | No |  |
| `vu_nummer` | `string` | Yes |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `additional_data` | - |
| `business_registration_number` | - |
| `city` | - |
| `company_name` | - |
| `corporate_uuid` | - |
| `country` | - |
| `currency` | - |
| `email` | - |
| `language` | - |
| `login` | - |
| `mandator` | - |
| `merchant_category_code` | - |
| `merchant_contract_number` | Yes |
| `merchant_name` | - |
| `package_uuid` | - |
| `packageorderuuid` | - |
| `phone_number` | - |
| `postal_code` | - |
| `productid_acquirer` | - |
| `region` | - |
| `registration_number` | - |
| `signature` | - |
| `street` | - |
| `terminal_id` | - |
| `terminalid_acquirer` | - |
| `vu_nummer` | - |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
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

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `MerchantPortalPamMerchantController` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## MerchantPortalPamPackageController

```clojure
(require '[sdk.entity.merchant_portal_pam_package_controller :as e-merchant_portal_pam_package_controller])

(def merchant_portal_pam_package_controller (api/merchant_portal_pam_package_controller client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `string` | No |  |
| `corporate_uuid` | `string` | No |  |
| `country` | `string` | No |  |
| `description_key` | `string` | No |  |
| `filter` | `map` | No |  |
| `language` | `string` | Yes |  |
| `name_key` | `string` | No |  |
| `package_status` | `string` | No |  |
| `package_uuid` | `string` | Yes |  |
| `pagination` | `map` | No |  |
| `sorting` | `map` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `consumer_uuid` | - |
| `corporate_uuid` | - |
| `country` | - |
| `description_key` | - |
| `filter` | - |
| `language` | Yes |
| `name_key` | - |
| `package_status` | - |
| `package_uuid` | - |
| `pagination` | - |
| `sorting` | - |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-merchant_portal_pam_package_controller/create (api/merchant_portal_pam_package_controller client nil)
    (vs/jm
      "language" "example_language"  ;; string
      "package_uuid" "example_package_uuid"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `MerchantPortalPamPackageController` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## MerchantPortalPamProductController

```clojure
(require '[sdk.entity.merchant_portal_pam_product_controller :as e-merchant_portal_pam_product_controller])

(def merchant_portal_pam_product_controller (api/merchant_portal_pam_product_controller client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `string` | No |  |
| `filter` | `map` | No |  |
| `language` | `string` | No |  |
| `merchant_id` | `string` | No |  |
| `package_order_uuid` | `string` | Yes |  |
| `pagination` | `map` | No |  |
| `product_order_uuid` | `string` | Yes |  |
| `product_uuid` | `string` | Yes |  |
| `reason_decline` | `string` | Yes |  |
| `sorting` | `map` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-merchant_portal_pam_product_controller/create (api/merchant_portal_pam_product_controller client nil)
    (vs/jm
      "package_order_uuid" "example_package_order_uuid"  ;; string
      "product_order_uuid" "example_product_order_uuid"  ;; string
      "product_uuid" "example_product_uuid"  ;; string
      "reason_decline" "example_reason_decline"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `MerchantPortalPamProductController` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## OutputAddProduct

```clojure
(require '[sdk.entity.output_add_product :as e-output_add_product])

(def output_add_product (api/output_add_product client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `string` | Yes |  |
| `product_uui_d` | `vector` | Yes |  |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-output_add_product/create (api/output_add_product client nil)
    (vs/jm
      "package_uuid" "example_package_uuid"  ;; string
      "product_uui_d" (vs/jt)  ;; vector
      "response_code" 1  ;; long
      "response_message" "example_response_message"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `OutputAddProduct` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## OutputCreateProduct

```clojure
(require '[sdk.entity.output_create_product :as e-output_create_product])

(def output_create_product (api/output_create_product client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acquirer_id` | `string` | No |  |
| `allow_multiple_order` | `boolean` | Yes |  |
| `app_form_template_name` | `string` | Yes |  |
| `contract_needed` | `boolean` | Yes |  |
| `credentials_needed` | `boolean` | No |  |
| `description_key` | `string` | Yes |  |
| `name_key` | `string` | Yes |  |
| `prescreening_allowed` | `boolean` | Yes |  |
| `product_name` | `string` | Yes |  |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |
| `terminal_template_name` | `string` | Yes |  |
| `vendor_name` | `string` | Yes |  |
| `xml_template_file` | `string` | Yes |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
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

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `OutputCreateProduct` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## OutputDetail

```clojure
(require '[sdk.entity.output_detail :as e-output_detail])

(def output_detail (api/output_detail client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `detail` | `map` | No |  |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-output_detail/load (api/output_detail client nil) (vs/jm "id" "output_detail_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `OutputDetail` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## OutputList

```clojure
(require '[sdk.entity.output_list :as e-output_list])

(def output_list (api/output_list client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `item` | `vector` | No |  |
| `pagination` | `map` | Yes |  |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |
| `sorting` | `map` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-output_list/create (api/output_list client nil)
    (vs/jm
      "pagination" (vs/jm)  ;; map
      "response_code" 1  ;; long
      "response_message" "example_response_message"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `OutputList` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## OutputMessage

```clojure
(require '[sdk.entity.output_message :as e-output_message])

(def output_message (api/output_message client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-output_message/load (api/output_message client nil) (vs/jm "id" "output_message_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `OutputMessage` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## OutputMoveTid

```clojure
(require '[sdk.entity.output_move_tid :as e-output_move_tid])

(def output_move_tid (api/output_move_tid client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `product_order_uui_d` | `vector` | Yes |  |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |
| `target_package_order_uuid` | `string` | Yes |  |
| `target_product_order_uuid` | `string` | Yes |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
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

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `OutputMoveTid` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## OutputRemoveProduct

```clojure
(require '[sdk.entity.output_remove_product :as e-output_remove_product])

(def output_remove_product (api/output_remove_product client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `string` | Yes |  |
| `product_uui_d` | `vector` | Yes |  |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-output_remove_product/create (api/output_remove_product client nil)
    (vs/jm
      "package_uuid" "example_package_uuid"  ;; string
      "product_uui_d" (vs/jt)  ;; vector
      "response_code" 1  ;; long
      "response_message" "example_response_message"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `OutputRemoveProduct` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## OutputStart

```clojure
(require '[sdk.entity.output_start :as e-output_start])

(def output_start (api/output_start client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No |  |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-output_start/create (api/output_start client nil)
    (vs/jm
      "response_code" 1  ;; long
      "response_message" "example_response_message"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `OutputStart` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## OutputStatus

```clojure
(require '[sdk.entity.output_status :as e-output_status])

(def output_status (api/output_status client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `long` | No |  |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |
| `status` | `string` | No |  |

### Operations

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-output_status/load (api/output_status client nil) (vs/jm "id" "output_status_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `OutputStatus` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## OutputUpdateProduct

```clojure
(require '[sdk.entity.output_update_product :as e-output_update_product])

(def output_update_product (api/output_update_product client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `allow_multiple_order` | `boolean` | No |  |
| `app_form_name` | `string` | No |  |
| `contract_needed` | `boolean` | No |  |
| `credentials_needed` | `boolean` | No |  |
| `description_key` | `string` | No |  |
| `name_key` | `string` | No |  |
| `prescreening_allowed` | `boolean` | No |  |
| `product_name` | `string` | No |  |
| `product_status` | `string` | No |  |
| `product_uuid` | `string` | Yes |  |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |
| `vendor_name` | `string` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-output_update_product/create (api/output_update_product client nil)
    (vs/jm
      "product_uuid" "example_product_uuid"  ;; string
      "response_code" 1  ;; long
      "response_message" "example_response_message"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `OutputUpdateProduct` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```clojure
(def client
  (api/make-sdk
    (vs/jm "feature"
      (vs/jm
        "test" (vs/jm "active" true)
        ))))
```

