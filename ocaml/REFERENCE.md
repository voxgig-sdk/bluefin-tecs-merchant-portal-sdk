# BluefinTecsMerchantPortal OCaml SDK Reference

Complete API reference for the BluefinTecsMerchantPortal OCaml SDK.


## Sdk_client

### Constructor

```ocaml
open Voxgig_struct
open Sdk_helpers

let client = Sdk_client.make options
```

Create a new SDK client instance from a `value` options map. Use
`Sdk_client.make0 ()` for defaults.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `value` | SDK configuration options (a Map). |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides (e.g. custom fetch). |


### Static constructors

#### `Sdk_client.test testopts sdkopts`

Create a test client with mock features active. Both arguments may be `Noval`
(`Sdk_client.test ()` uses defaults, `Sdk_client.test_with` takes explicit
options).

```ocaml
let client = Sdk_client.test ()
```


### Instance functions

#### `Sdk_client.merchant_portal_api_controller client entopts : entity_obj`

Create a `MerchantPortalApiController` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.merchant_portal_common_controller client entopts : entity_obj`

Create a `MerchantPortalCommonController` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.merchant_portal_pam_contract_controller client entopts : entity_obj`

Create a `MerchantPortalPamContractController` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.merchant_portal_pam_document_controller client entopts : entity_obj`

Create a `MerchantPortalPamDocumentController` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.merchant_portal_pam_form_controller client entopts : entity_obj`

Create a `MerchantPortalPamFormController` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.merchant_portal_pam_mandator_controller client entopts : entity_obj`

Create a `MerchantPortalPamMandatorController` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.merchant_portal_pam_merchant_controller client entopts : entity_obj`

Create a `MerchantPortalPamMerchantController` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.merchant_portal_pam_package_controller client entopts : entity_obj`

Create a `MerchantPortalPamPackageController` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.merchant_portal_pam_product_controller client entopts : entity_obj`

Create a `MerchantPortalPamProductController` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.output_add_product client entopts : entity_obj`

Create a `OutputAddProduct` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.output_create_product client entopts : entity_obj`

Create a `OutputCreateProduct` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.output_detail client entopts : entity_obj`

Create a `OutputDetail` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.output_list client entopts : entity_obj`

Create a `OutputList` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.output_message client entopts : entity_obj`

Create a `OutputMessage` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.output_move_tid client entopts : entity_obj`

Create a `OutputMoveTid` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.output_remove_product client entopts : entity_obj`

Create a `OutputRemoveProduct` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.output_start client entopts : entity_obj`

Create a `OutputStart` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.output_status client entopts : entity_obj`

Create a `OutputStatus` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.output_update_product client entopts : entity_obj`

Create a `OutputUpdateProduct` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.direct client fetchargs : value`

Make a direct HTTP request to any API endpoint. Returns a result `value` map
with `ok`, `status`, `headers`, and `data` (or `err` on failure). This
escape hatch never raises — branch on `getp result "ok"`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `value` | Request body (Maps are JSON-serialized). |

**Returns:** a result `value` map.

#### `Sdk_client.prepare client fetchargs : value`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises
on error.


---

## MerchantPortalApiController

```ocaml
let merchant_portal_api_controller = Sdk_client.merchant_portal_api_controller client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `int` | No | Account number provided by the acquirer. |
| `additional_data` | `value map` | No | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `string` | Yes | Merchant business registration number as stated in the company registry. |
| `city` | `string` | Yes | Merchant's address: city. |
| `corporateuuid` | `string` | No | Unique identifier for the corporate entity (UUID format). |
| `country` | `string` | Yes | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `string` | Yes | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `int` | Yes | Merchant category code as defined by the payment network. |
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
| `sorting_code` | `int` | No | Sorting code provided by the acquirer. |
| `state` | `string` | No | Merchant's address: state. |
| `street` | `string` | Yes | Merchant's address: street and house number. |
| `terminal_country_code` | `string` | Yes | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `string` | Yes | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `string` | Yes | Physical or logical location of the terminal. |
| `terminal_serial_number` | `string` | Yes | Terminal serial number. |
| `terminalid` | `int` | Yes | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `string` | No | Terminal ID as set by the acquirer (optional). |
| `user_email` | `string` | No | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `string` | No | Phone number of the user acting on behalf of the merchant. |
| `username` | `string` | No | Merchant username for MPOS. |
| `vu_nummer` | `string` | Yes | Merchant contract number with the acquirer. |
| `web_shop_url` | `string` | No | URL of the merchant's web shop. |
| `zipcode` | `string` | Yes | Merchant's address: postal code. |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.merchant_portal_api_controller client Noval).e_create (jo [
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
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `MerchantPortalApiController` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## MerchantPortalCommonController

```ocaml
let merchant_portal_common_controller = Sdk_client.merchant_portal_common_controller client Noval
```

### Operations

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.merchant_portal_common_controller client Noval).e_load (Noval) Noval
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `MerchantPortalCommonController` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## MerchantPortalPamContractController

```ocaml
let merchant_portal_pam_contract_controller = Sdk_client.merchant_portal_pam_contract_controller client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `string` | Yes |  |
| `productOrderUUID` | `string` | Yes |  |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.merchant_portal_pam_contract_controller client Noval).e_create (jo [
    ("language", (Str "example_language"));  (* string *)
    ("productOrderUUID", (Str "example_productOrderUUID"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `MerchantPortalPamContractController` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## MerchantPortalPamDocumentController

```ocaml
let merchant_portal_pam_document_controller = Sdk_client.merchant_portal_pam_document_controller client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appFormFieldDescUUID` | `string` | Yes |  |
| `packageOrderUUID` | `string` | No | UUID of the package order. |
| `productOrderUUID` | `string` | No | UUID of the product order. |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.merchant_portal_pam_document_controller client Noval).e_create (jo [
    ("appFormFieldDescUUID", (Str "example_appFormFieldDescUUID"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `MerchantPortalPamDocumentController` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## MerchantPortalPamFormController

```ocaml
let merchant_portal_pam_form_controller = Sdk_client.merchant_portal_pam_form_controller client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appFormFieldsDescUUID` | `string` | Yes |  |
| `filter` | `value map` | No |  |
| `language` | `string` | Yes |  |
| `packageOrder` | `value map` | No |  |
| `packageOrderUUID` | `string` | Yes | UUID of the package order. |
| `packageUUID` | `string` | No |  |
| `productOrderUUID` | `string` | No | UUID of the product order. |
| `productOrders` | `value list` | No |  |
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

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.merchant_portal_pam_form_controller client Noval).e_create (jo [
    ("appFormFieldsDescUUID", (Str "example_appFormFieldsDescUUID"));  (* string *)
    ("language", (Str "example_language"));  (* string *)
    ("packageOrderUUID", (Str "example_packageOrderUUID"));  (* string *)
    ("reasonOfReopening", (Str "example_reasonOfReopening"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `MerchantPortalPamFormController` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## MerchantPortalPamMandatorController

```ocaml
let merchant_portal_pam_mandator_controller = Sdk_client.merchant_portal_pam_mandator_controller client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `clientSecret` | `string` | No |  |
| `mandatorName` | `string` | Yes |  |
| `notificationEmail` | `string` | No |  |
| `packageUUID` | `string` | Yes |  |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.merchant_portal_pam_mandator_controller client Noval).e_create (jo [
    ("mandatorName", (Str "example_mandatorName"));  (* string *)
    ("packageUUID", (Str "example_packageUUID"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `MerchantPortalPamMandatorController` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## MerchantPortalPamMerchantController

```ocaml
let merchant_portal_pam_merchant_controller = Sdk_client.merchant_portal_pam_merchant_controller client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `value map` | No | Optional additional merchant-specific data related to enabling acquiring. |
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
| `terminalIds` | `value list` | No | Optional list of terminal IDs for which acquiring should be activated. |
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

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.merchant_portal_pam_merchant_controller client Noval).e_create (jo [
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
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `MerchantPortalPamMerchantController` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## MerchantPortalPamPackageController

```ocaml
let merchant_portal_pam_package_controller = Sdk_client.merchant_portal_pam_package_controller client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumerUUID` | `string` | No |  |
| `corporateUUID` | `string` | No |  |
| `country` | `string` | No | Country associated with the package. |
| `descriptionKey` | `string` | No | Key for the description of the package. |
| `filter` | `value map` | No |  |
| `language` | `string` | Yes |  |
| `nameKey` | `string` | No | Key for the name of the package. |
| `packageStatus` | `string` | No | Status of the package. |
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `pagination` | `value map` | No |  |
| `sorting` | `value map` | No |  |

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

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.merchant_portal_pam_package_controller client Noval).e_create (jo [
    ("language", (Str "example_language"));  (* string *)
    ("packageUUID", (Str "example_packageUUID"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `MerchantPortalPamPackageController` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## MerchantPortalPamProductController

```ocaml
let merchant_portal_pam_product_controller = Sdk_client.merchant_portal_pam_product_controller client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumerUUID` | `string` | No |  |
| `filter` | `value map` | No |  |
| `language` | `string` | No |  |
| `merchantID` | `string` | No |  |
| `packageOrderUUID` | `string` | Yes |  |
| `pagination` | `value map` | No |  |
| `productOrderUUID` | `string` | Yes |  |
| `productUUID` | `string` | Yes |  |
| `reason_decline` | `string` | Yes | Reason for product decline. |
| `sorting` | `value map` | No |  |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.merchant_portal_pam_product_controller client Noval).e_create (jo [
    ("packageOrderUUID", (Str "example_packageOrderUUID"));  (* string *)
    ("productOrderUUID", (Str "example_productOrderUUID"));  (* string *)
    ("productUUID", (Str "example_productUUID"));  (* string *)
    ("reason_decline", (Str "example_reason_decline"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `MerchantPortalPamProductController` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## OutputAddProduct

```ocaml
let output_add_product = Sdk_client.output_add_product client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `productUUIDs` | `value list` | Yes | The list of unique identifiers of the products. |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.output_add_product client Noval).e_create (jo [
    ("packageUUID", (Str "example_packageUUID"));  (* string *)
    ("productUUIDs", (empty_list ()));  (* value list *)
    ("responseCode", (Num 1.));  (* int *)
    ("responseMessage", (Str "example_responseMessage"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `OutputAddProduct` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## OutputCreateProduct

```ocaml
let output_create_product = Sdk_client.output_create_product client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acquirerId` | `string` | No | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `bool` | Yes | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `string` | Yes | Name of the application form template. |
| `contractNeeded` | `bool` | Yes | Indication whether contract is needed or not. |
| `credentialsNeeded` | `bool` | No | Indication whether credentials are needed or not. |
| `descriptionKey` | `string` | Yes | Key indicator for product description. |
| `nameKey` | `string` | Yes | Key indicator for product name. |
| `prescreeningAllowed` | `bool` | Yes | Indication whether prescreening is allowed or not. |
| `productName` | `string` | Yes | Name of the product. |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `terminalTemplateName` | `string` | Yes | Name of the terminal template. |
| `vendorName` | `string` | Yes | Name of the vendor. |
| `xmlTemplateFile` | `string` | Yes | A string value containing the XML template file encoded in Base64. |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.output_create_product client Noval).e_create (jo [
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
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `OutputCreateProduct` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## OutputDetail

```ocaml
let output_detail = Sdk_client.output_detail client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `batch` | `value map` | No |  |
| `lines` | `value map` | No |  |
| `progress` | `value map` | No |  |

### Operations

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.output_detail client Noval).e_load (jo [("id", (Str "output_detail_id"))]) Noval
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `OutputDetail` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## OutputList

```ocaml
let output_list = Sdk_client.output_list client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `items` | `value list` | No |  |
| `pagination` | `value map` | Yes |  |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `sorting` | `value map` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `items` | - |
| `pagination` | Yes |
| `responseCode` | - |
| `responseMessage` | - |
| `sorting` | - |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.output_list client Noval).e_create (jo [
    ("pagination", (empty_map ()));  (* value map *)
    ("responseCode", (Num 1.));  (* int *)
    ("responseMessage", (Str "example_responseMessage"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `OutputList` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## OutputMessage

```ocaml
let output_message = Sdk_client.output_message client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.output_message client Noval).e_load (jo [("id", (Str "output_message_id"))]) Noval
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `OutputMessage` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## OutputMoveTid

```ocaml
let output_move_tid = Sdk_client.output_move_tid client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `productOrderUUIDs` | `value list` | Yes |  |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `targetPackageOrderUUID` | `string` | Yes |  |
| `targetProductOrderUUID` | `string` | Yes |  |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.output_move_tid client Noval).e_create (jo [
    ("productOrderUUIDs", (empty_list ()));  (* value list *)
    ("responseCode", (Num 1.));  (* int *)
    ("responseMessage", (Str "example_responseMessage"));  (* string *)
    ("targetPackageOrderUUID", (Str "example_targetPackageOrderUUID"));  (* string *)
    ("targetProductOrderUUID", (Str "example_targetProductOrderUUID"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `OutputMoveTid` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## OutputRemoveProduct

```ocaml
let output_remove_product = Sdk_client.output_remove_product client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `productUUIDs` | `value list` | Yes | List of product unique identifiers. |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.output_remove_product client Noval).e_create (jo [
    ("packageUUID", (Str "example_packageUUID"));  (* string *)
    ("productUUIDs", (empty_list ()));  (* value list *)
    ("responseCode", (Num 1.));  (* int *)
    ("responseMessage", (Str "example_responseMessage"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `OutputRemoveProduct` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## OutputStart

```ocaml
let output_start = Sdk_client.output_start client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No |  |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.output_start client Noval).e_create (jo [
    ("responseCode", (Num 1.));  (* int *)
    ("responseMessage", (Str "example_responseMessage"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `OutputStart` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## OutputStatus

```ocaml
let output_status = Sdk_client.output_status client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `int` | No |  |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `status` | `string` | No |  |

### Operations

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.output_status client Noval).e_load (jo [("id", (Str "output_status_id"))]) Noval
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `OutputStatus` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## OutputUpdateProduct

```ocaml
let output_update_product = Sdk_client.output_update_product client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `allowMultipleOrders` | `bool` | No | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `string` | No | The name of the application form |
| `contractNeeded` | `bool` | No | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `bool` | No | An attribute to indicate if credentials are needed |
| `descriptionKey` | `string` | No | The description of the product |
| `nameKey` | `string` | No | The key of the product name |
| `prescreeningAllowed` | `bool` | No | An attribute to indicate if prescreening is allowed |
| `productName` | `string` | No | The name of the product |
| `productStatus` | `string` | No | The status of the product |
| `productUUID` | `string` | Yes | The UUID of the product to update |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `vendorName` | `string` | No | The name of the vendor |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.output_update_product client Noval).e_create (jo [
    ("productUUID", (Str "example_productUUID"));  (* string *)
    ("responseCode", (Num 1.));  (* int *)
    ("responseMessage", (Str "example_responseMessage"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `OutputUpdateProduct` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ocaml
let client = Sdk_client.make (jo [
    ("feature", jo [
        ("test", jo [("active", Bool true)]);
    ]);
])
```

