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

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

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

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.merchant_portal_common_controller client Noval).e_load (Noval) Noval
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
| `product_order_uuid` | `string` | Yes |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.merchant_portal_pam_contract_controller client Noval).e_create (jo [
    ("language", (Str "example_language"));  (* string *)
    ("product_order_uuid", (Str "example_product_order_uuid"));  (* string *)
]) Noval
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
| `app_form_field_desc_uuid` | `string` | Yes |  |
| `package_order_uuid` | `string` | No |  |
| `product_order_uuid` | `string` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.merchant_portal_pam_document_controller client Noval).e_create (jo [
    ("app_form_field_desc_uuid", (Str "example_app_form_field_desc_uuid"));  (* string *)
]) Noval
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
| `app_form_fields_desc_uuid` | `string` | Yes |  |
| `filter` | `value map` | No |  |
| `language` | `string` | Yes |  |
| `package_order` | `value map` | No |  |
| `package_order_uuid` | `string` | Yes |  |
| `package_uuid` | `string` | No |  |
| `product_order` | `value list` | No |  |
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

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.merchant_portal_pam_form_controller client Noval).e_create (jo [
    ("app_form_fields_desc_uuid", (Str "example_app_form_fields_desc_uuid"));  (* string *)
    ("language", (Str "example_language"));  (* string *)
    ("package_order_uuid", (Str "example_package_order_uuid"));  (* string *)
    ("reason_of_reopening", (Str "example_reason_of_reopening"));  (* string *)
]) Noval
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
| `client_secret` | `string` | No |  |
| `mandator_name` | `string` | Yes |  |
| `notification_email` | `string` | No |  |
| `package_uuid` | `string` | Yes |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.merchant_portal_pam_mandator_controller client Noval).e_create (jo [
    ("mandator_name", (Str "example_mandator_name"));  (* string *)
    ("package_uuid", (Str "example_package_uuid"));  (* string *)
]) Noval
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
| `terminal_id` | `value list` | No |  |
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

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.merchant_portal_pam_merchant_controller client Noval).e_create (jo [
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
| `consumer_uuid` | `string` | No |  |
| `corporate_uuid` | `string` | No |  |
| `country` | `string` | No |  |
| `description_key` | `string` | No |  |
| `filter` | `value map` | No |  |
| `language` | `string` | Yes |  |
| `name_key` | `string` | No |  |
| `package_status` | `string` | No |  |
| `package_uuid` | `string` | Yes |  |
| `pagination` | `value map` | No |  |
| `sorting` | `value map` | No |  |

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

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.merchant_portal_pam_package_controller client Noval).e_create (jo [
    ("language", (Str "example_language"));  (* string *)
    ("package_uuid", (Str "example_package_uuid"));  (* string *)
]) Noval
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
| `consumer_uuid` | `string` | No |  |
| `filter` | `value map` | No |  |
| `language` | `string` | No |  |
| `merchant_id` | `string` | No |  |
| `package_order_uuid` | `string` | Yes |  |
| `pagination` | `value map` | No |  |
| `product_order_uuid` | `string` | Yes |  |
| `product_uuid` | `string` | Yes |  |
| `reason_decline` | `string` | Yes |  |
| `sorting` | `value map` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.merchant_portal_pam_product_controller client Noval).e_create (jo [
    ("package_order_uuid", (Str "example_package_order_uuid"));  (* string *)
    ("product_order_uuid", (Str "example_product_order_uuid"));  (* string *)
    ("product_uuid", (Str "example_product_uuid"));  (* string *)
    ("reason_decline", (Str "example_reason_decline"));  (* string *)
]) Noval
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
| `package_uuid` | `string` | Yes |  |
| `product_uui_d` | `value list` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.output_add_product client Noval).e_create (jo [
    ("package_uuid", (Str "example_package_uuid"));  (* string *)
    ("product_uui_d", (empty_list ()));  (* value list *)
    ("response_code", (Num 1.));  (* int *)
    ("response_message", (Str "example_response_message"));  (* string *)
]) Noval
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
| `acquirer_id` | `string` | No |  |
| `allow_multiple_order` | `bool` | Yes |  |
| `app_form_template_name` | `string` | Yes |  |
| `contract_needed` | `bool` | Yes |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `string` | Yes |  |
| `name_key` | `string` | Yes |  |
| `prescreening_allowed` | `bool` | Yes |  |
| `product_name` | `string` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |
| `terminal_template_name` | `string` | Yes |  |
| `vendor_name` | `string` | Yes |  |
| `xml_template_file` | `string` | Yes |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.output_create_product client Noval).e_create (jo [
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
| `detail` | `value map` | No |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.output_detail client Noval).e_load (jo [("id", (Str "output_detail_id"))]) Noval
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
| `item` | `value list` | No |  |
| `pagination` | `value map` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |
| `sorting` | `value map` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.output_list client Noval).e_create (jo [
    ("pagination", (empty_map ()));  (* value map *)
    ("response_code", (Num 1.));  (* int *)
    ("response_message", (Str "example_response_message"));  (* string *)
]) Noval
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
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.output_message client Noval).e_load (jo [("id", (Str "output_message_id"))]) Noval
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
| `product_order_uui_d` | `value list` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |
| `target_package_order_uuid` | `string` | Yes |  |
| `target_product_order_uuid` | `string` | Yes |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.output_move_tid client Noval).e_create (jo [
    ("product_order_uui_d", (empty_list ()));  (* value list *)
    ("response_code", (Num 1.));  (* int *)
    ("response_message", (Str "example_response_message"));  (* string *)
    ("target_package_order_uuid", (Str "example_target_package_order_uuid"));  (* string *)
    ("target_product_order_uuid", (Str "example_target_product_order_uuid"));  (* string *)
]) Noval
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
| `package_uuid` | `string` | Yes |  |
| `product_uui_d` | `value list` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.output_remove_product client Noval).e_create (jo [
    ("package_uuid", (Str "example_package_uuid"));  (* string *)
    ("product_uui_d", (empty_list ()));  (* value list *)
    ("response_code", (Num 1.));  (* int *)
    ("response_message", (Str "example_response_message"));  (* string *)
]) Noval
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
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.output_start client Noval).e_create (jo [
    ("response_code", (Num 1.));  (* int *)
    ("response_message", (Str "example_response_message"));  (* string *)
]) Noval
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
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |
| `status` | `string` | No |  |

### Operations

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.output_status client Noval).e_load (jo [("id", (Str "output_status_id"))]) Noval
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
| `allow_multiple_order` | `bool` | No |  |
| `app_form_name` | `string` | No |  |
| `contract_needed` | `bool` | No |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `string` | No |  |
| `name_key` | `string` | No |  |
| `prescreening_allowed` | `bool` | No |  |
| `product_name` | `string` | No |  |
| `product_status` | `string` | No |  |
| `product_uuid` | `string` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |
| `vendor_name` | `string` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.output_update_product client Noval).e_create (jo [
    ("product_uuid", (Str "example_product_uuid"));  (* string *)
    ("response_code", (Num 1.));  (* int *)
    ("response_message", (Str "example_response_message"));  (* string *)
]) Noval
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

