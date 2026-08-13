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
| `account_number` | `int` | No |  |
| `additional_data` | `value map` | No |  |
| `business_reg_number` | `string` | Yes |  |
| `city` | `string` | Yes |  |
| `corporateuuid` | `string` | No |  |
| `country` | `string` | Yes |  |
| `currency` | `string` | Yes |  |
| `merchant_category_code` | `int` | Yes |  |
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
| `sorting_code` | `int` | No |  |
| `state` | `string` | No |  |
| `street` | `string` | Yes |  |
| `terminal_country_code` | `string` | Yes |  |
| `terminal_language_code` | `string` | Yes |  |
| `terminal_location` | `string` | Yes |  |
| `terminal_serial_number` | `string` | Yes |  |
| `terminalid` | `int` | Yes |  |
| `terminalid_acquirer` | `string` | No |  |
| `user_email` | `string` | No |  |
| `user_phone_number` | `string` | No |  |
| `username` | `string` | No |  |
| `vu_nummer` | `string` | Yes |  |
| `web_shop_url` | `string` | No |  |
| `zipcode` | `string` | Yes |  |

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
| `packageOrderUUID` | `string` | No |  |
| `productOrderUUID` | `string` | No |  |

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
| `packageOrderUUID` | `string` | Yes |  |
| `packageUUID` | `string` | No |  |
| `productOrderUUID` | `string` | No |  |
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
| `additional_data` | `value map` | No |  |
| `businessRegistrationNumber` | `string` | Yes |  |
| `city` | `string` | No |  |
| `companyName` | `string` | Yes |  |
| `corporateUUID` | `string` | Yes |  |
| `country` | `string` | No |  |
| `currency` | `string` | Yes |  |
| `email` | `string` | Yes |  |
| `language` | `string` | Yes |  |
| `login` | `string` | Yes |  |
| `mandator` | `string` | Yes |  |
| `merchantContractNumber` | `string` | Yes |  |
| `merchantName` | `string` | No |  |
| `merchant_category_code` | `string` | No |  |
| `packageUUID` | `string` | No |  |
| `packageorderuuid` | `string` | Yes |  |
| `phoneNumber` | `string` | Yes |  |
| `postalCode` | `string` | No |  |
| `productid_acquirer` | `string` | Yes |  |
| `region` | `string` | No |  |
| `registrationNumber` | `string` | No |  |
| `signature` | `string` | No |  |
| `street` | `string` | No |  |
| `terminalIds` | `value list` | No |  |
| `terminalid_acquirer` | `string` | No |  |
| `vu_nummer` | `string` | Yes |  |

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
| `country` | `string` | No |  |
| `descriptionKey` | `string` | No |  |
| `filter` | `value map` | No |  |
| `language` | `string` | Yes |  |
| `nameKey` | `string` | No |  |
| `packageStatus` | `string` | No |  |
| `packageUUID` | `string` | Yes |  |
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
| `reason_decline` | `string` | Yes |  |
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
| `packageUUID` | `string` | Yes |  |
| `productUUIDs` | `value list` | Yes |  |
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `string` | Yes |  |

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
| `acquirerId` | `string` | No |  |
| `allowMultipleOrders` | `bool` | Yes |  |
| `appFormTemplateName` | `string` | Yes |  |
| `contractNeeded` | `bool` | Yes |  |
| `credentialsNeeded` | `bool` | No |  |
| `descriptionKey` | `string` | Yes |  |
| `nameKey` | `string` | Yes |  |
| `prescreeningAllowed` | `bool` | Yes |  |
| `productName` | `string` | Yes |  |
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `string` | Yes |  |
| `terminalTemplateName` | `string` | Yes |  |
| `vendorName` | `string` | Yes |  |
| `xmlTemplateFile` | `string` | Yes |  |

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
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `string` | Yes |  |
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
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `string` | Yes |  |

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
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `string` | Yes |  |
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
| `packageUUID` | `string` | Yes |  |
| `productUUIDs` | `value list` | Yes |  |
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `string` | Yes |  |

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
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `string` | Yes |  |

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
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `string` | Yes |  |
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
| `allowMultipleOrders` | `bool` | No |  |
| `appFormName` | `string` | No |  |
| `contractNeeded` | `bool` | No |  |
| `credentialsNeeded` | `bool` | No |  |
| `descriptionKey` | `string` | No |  |
| `nameKey` | `string` | No |  |
| `prescreeningAllowed` | `bool` | No |  |
| `productName` | `string` | No |  |
| `productStatus` | `string` | No |  |
| `productUUID` | `string` | Yes |  |
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `string` | Yes |  |
| `vendorName` | `string` | No |  |

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

