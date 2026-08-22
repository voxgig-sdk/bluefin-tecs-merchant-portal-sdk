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
| `account_number` | `long` | No | Account number provided by the acquirer. |
| `additional_data` | `map` | No | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `string` | Yes | Merchant business registration number as stated in the company registry. |
| `city` | `string` | Yes | Merchant's address: city. |
| `corporateuuid` | `string` | No | Unique identifier for the corporate entity (UUID format). |
| `country` | `string` | Yes | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `string` | Yes | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `long` | Yes | Merchant category code as defined by the payment network. |
| `merchant_email` | `string` | No | Merchant's email address for receiving notifications. |
| `merchant_name` | `string` | Yes | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | `string` | No | Merchant's phone number for notifications. |
| `packageid` | `string` | Yes | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | `string` | Yes | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | `string` | No | Merchant password for MPOS. |
| `productid` | `string` | No | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | `string` | No | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | `string` | Yes | Reason for terminal deactivation. |
| `reason_reactivation` | `string` | Yes | Reason for terminal reactivation. |
| `sorting_code` | `long` | No | Sorting code provided by the acquirer. |
| `state` | `string` | No | Merchant's address: state. |
| `street` | `string` | Yes | Merchant's address: street and house number. |
| `terminal_country_code` | `string` | Yes | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `string` | Yes | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `string` | Yes | Physical or logical location of the terminal. |
| `terminal_serial_number` | `string` | Yes | Terminal serial number. |
| `terminalid` | `long` | Yes | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `string` | No | Terminal ID as set by the acquirer (optional). |
| `user_email` | `string` | No | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `string` | No | Phone number of the user acting on behalf of the merchant. |
| `username` | `string` | No | Merchant username for MPOS. |
| `vu_nummer` | `string` | Yes | Merchant contract number with the acquirer. |
| `web_shop_url` | `string` | No | URL of the merchant's web shop. |
| `zipcode` | `string` | Yes | Merchant's address: postal code. |

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
| `productOrderUUID` | `string` | Yes |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-merchant_portal_pam_contract_controller/create (api/merchant_portal_pam_contract_controller client nil)
    (vs/jm
      "language" "example_language"  ;; string
      "productOrderUUID" "example_productOrderUUID"  ;; string
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
| `appFormFieldDescUUID` | `string` | Yes |  |
| `packageOrderUUID` | `string` | No | UUID of the package order. |
| `productOrderUUID` | `string` | No | UUID of the product order. |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-merchant_portal_pam_document_controller/create (api/merchant_portal_pam_document_controller client nil)
    (vs/jm
      "appFormFieldDescUUID" "example_appFormFieldDescUUID"  ;; string
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
| `appFormFieldsDescUUID` | `string` | Yes |  |
| `filter` | `map` | No |  |
| `language` | `string` | Yes |  |
| `packageOrder` | `map` | No |  |
| `packageOrderUUID` | `string` | Yes | UUID of the package order. |
| `packageUUID` | `string` | No |  |
| `productOrderUUID` | `string` | No | UUID of the product order. |
| `productOrders` | `vector` | No |  |
| `reasonOfReopening` | `string` | Yes |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `appFormFieldsDescUUID` | - |
| `filter` | - |
| `language` | Yes |
| `packageOrder` | - |
| `packageOrderUUID` | Yes |
| `packageUUID` | - |
| `productOrderUUID` | Yes |
| `productOrders` | - |
| `reasonOfReopening` | - |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-merchant_portal_pam_form_controller/create (api/merchant_portal_pam_form_controller client nil)
    (vs/jm
      "appFormFieldsDescUUID" "example_appFormFieldsDescUUID"  ;; string
      "language" "example_language"  ;; string
      "packageOrderUUID" "example_packageOrderUUID"  ;; string
      "reasonOfReopening" "example_reasonOfReopening"  ;; string
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
| `clientSecret` | `string` | No |  |
| `mandatorName` | `string` | Yes |  |
| `notificationEmail` | `string` | No |  |
| `packageUUID` | `string` | Yes |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-merchant_portal_pam_mandator_controller/create (api/merchant_portal_pam_mandator_controller client nil)
    (vs/jm
      "mandatorName" "example_mandatorName"  ;; string
      "packageUUID" "example_packageUUID"  ;; string
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
| `additional_data` | `map` | No | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` | `string` | Yes |  |
| `city` | `string` | No | City where the merchant is located. |
| `companyName` | `string` | Yes |  |
| `corporateUUID` | `string` | Yes | Unique identifier for the corporate entity. |
| `country` | `string` | No | Country where the merchant is located. |
| `currency` | `string` | Yes | Transaction currency in ISO 4217 format. |
| `email` | `string` | Yes |  |
| `language` | `string` | Yes |  |
| `login` | `string` | Yes |  |
| `mandator` | `string` | Yes | Mandator name assigned by TECS. |
| `merchantContractNumber` | `string` | Yes | Unique identifier for the merchant within a specific system. |
| `merchantName` | `string` | No | Name of the merchant. |
| `merchant_category_code` | `string` | No | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | `string` | No | UUID of the package. |
| `packageorderuuid` | `string` | Yes | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` | `string` | Yes |  |
| `postalCode` | `string` | No | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | `string` | Yes | Identifier of the product for which acquiring is to be enabled. |
| `region` | `string` | No | State or province where the merchant is located. |
| `registrationNumber` | `string` | No | Business registration number. |
| `signature` | `string` | No | Signature value = saltAsHex-hashAsHex. |
| `street` | `string` | No | Street address of the merchant. |
| `terminalIds` | `vector` | No | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `string` | No | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `string` | Yes | Merchant contract number with the acquirer. |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `additional_data` | - |
| `businessRegistrationNumber` | - |
| `city` | - |
| `companyName` | - |
| `corporateUUID` | - |
| `country` | - |
| `currency` | - |
| `email` | - |
| `language` | - |
| `login` | - |
| `mandator` | - |
| `merchantContractNumber` | Yes |
| `merchantName` | - |
| `merchant_category_code` | - |
| `packageUUID` | - |
| `packageorderuuid` | - |
| `phoneNumber` | - |
| `postalCode` | - |
| `productid_acquirer` | - |
| `region` | - |
| `registrationNumber` | - |
| `signature` | - |
| `street` | - |
| `terminalIds` | - |
| `terminalid_acquirer` | - |
| `vu_nummer` | - |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
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
| `consumerUUID` | `string` | No |  |
| `corporateUUID` | `string` | No |  |
| `country` | `string` | No | Country associated with the package. |
| `descriptionKey` | `string` | No | Key for the description of the package. |
| `filter` | `map` | No |  |
| `language` | `string` | Yes |  |
| `nameKey` | `string` | No | Key for the name of the package. |
| `packageStatus` | `string` | No | Status of the package. |
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `pagination` | `map` | No |  |
| `sorting` | `map` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `consumerUUID` | - |
| `corporateUUID` | - |
| `country` | - |
| `descriptionKey` | - |
| `filter` | - |
| `language` | Yes |
| `nameKey` | - |
| `packageStatus` | - |
| `packageUUID` | - |
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
      "packageUUID" "example_packageUUID"  ;; string
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
| `consumerUUID` | `string` | No |  |
| `filter` | `map` | No |  |
| `language` | `string` | No |  |
| `merchantID` | `string` | No |  |
| `packageOrderUUID` | `string` | Yes |  |
| `pagination` | `map` | No |  |
| `productOrderUUID` | `string` | Yes |  |
| `productUUID` | `string` | Yes |  |
| `reason_decline` | `string` | Yes | Reason for product decline. |
| `sorting` | `map` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-merchant_portal_pam_product_controller/create (api/merchant_portal_pam_product_controller client nil)
    (vs/jm
      "packageOrderUUID" "example_packageOrderUUID"  ;; string
      "productOrderUUID" "example_productOrderUUID"  ;; string
      "productUUID" "example_productUUID"  ;; string
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
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `productUUIDs` | `vector` | Yes | The list of unique identifiers of the products. |
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-output_add_product/create (api/output_add_product client nil)
    (vs/jm
      "packageUUID" "example_packageUUID"  ;; string
      "productUUIDs" (vs/jt)  ;; vector
      "responseCode" 1  ;; long
      "responseMessage" "example_responseMessage"  ;; string
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
| `acquirerId` | `string` | No | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `boolean` | Yes | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `string` | Yes | Name of the application form template. |
| `contractNeeded` | `boolean` | Yes | Indication whether contract is needed or not. |
| `credentialsNeeded` | `boolean` | No | Indication whether credentials are needed or not. |
| `descriptionKey` | `string` | Yes | Key indicator for product description. |
| `nameKey` | `string` | Yes | Key indicator for product name. |
| `prescreeningAllowed` | `boolean` | Yes | Indication whether prescreening is allowed or not. |
| `productName` | `string` | Yes | Name of the product. |
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `terminalTemplateName` | `string` | Yes | Name of the terminal template. |
| `vendorName` | `string` | Yes | Name of the vendor. |
| `xmlTemplateFile` | `string` | Yes | A string value containing the XML template file encoded in Base64. |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
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
| `batch` | `map` | No |  |
| `lines` | `map` | No |  |
| `progress` | `map` | No |  |

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
| `items` | `vector` | No |  |
| `pagination` | `map` | Yes |  |
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `sorting` | `map` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `items` | - |
| `pagination` | Yes |
| `responseCode` | - |
| `responseMessage` | - |
| `sorting` | - |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-output_list/create (api/output_list client nil)
    (vs/jm
      "pagination" (vs/jm)  ;; map
      "responseCode" 1  ;; long
      "responseMessage" "example_responseMessage"  ;; string
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
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

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
| `productOrderUUIDs` | `vector` | Yes |  |
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `targetPackageOrderUUID` | `string` | Yes |  |
| `targetProductOrderUUID` | `string` | Yes |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
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
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `productUUIDs` | `vector` | Yes | List of product unique identifiers. |
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-output_remove_product/create (api/output_remove_product client nil)
    (vs/jm
      "packageUUID" "example_packageUUID"  ;; string
      "productUUIDs" (vs/jt)  ;; vector
      "responseCode" 1  ;; long
      "responseMessage" "example_responseMessage"  ;; string
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
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-output_start/create (api/output_start client nil)
    (vs/jm
      "responseCode" 1  ;; long
      "responseMessage" "example_responseMessage"  ;; string
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
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
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
| `allowMultipleOrders` | `boolean` | No | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `string` | No | The name of the application form |
| `contractNeeded` | `boolean` | No | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `boolean` | No | An attribute to indicate if credentials are needed |
| `descriptionKey` | `string` | No | The description of the product |
| `nameKey` | `string` | No | The key of the product name |
| `prescreeningAllowed` | `boolean` | No | An attribute to indicate if prescreening is allowed |
| `productName` | `string` | No | The name of the product |
| `productStatus` | `string` | No | The status of the product |
| `productUUID` | `string` | Yes | The UUID of the product to update |
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `vendorName` | `string` | No | The name of the vendor |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-output_update_product/create (api/output_update_product client nil)
    (vs/jm
      "productUUID" "example_productUUID"  ;; string
      "responseCode" 1  ;; long
      "responseMessage" "example_responseMessage"  ;; string
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

