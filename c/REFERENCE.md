# BluefinTecsMerchantPortal C SDK Reference

Complete API reference for the BluefinTecsMerchantPortal C SDK.


## BluefinTecsMerchantPortalSDK

### Constructor

```c
#include "core/api.h"

BluefinTecsMerchantPortalSDK* client = bluefintecsmerchantportal_sdk_new(options);
```

Create a new SDK client instance. `options` is a `voxgig_value*` map
(`NULL` for none).

**Parameters (`options` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides. |


### Test Constructor

#### `BluefinTecsMerchantPortalSDK* test_sdk(voxgig_value* testopts, voxgig_value* sdkopts)`

Create a test client with mock features active. Both arguments may be
`NULL`.

```c
BluefinTecsMerchantPortalSDK* client = test_sdk(NULL, NULL);
```


### Entity Accessors

#### `Entity* bluefintecsmerchantportal_merchant_portal_api_controller(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `MerchantPortalApiController` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_merchant_portal_common_controller(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `MerchantPortalCommonController` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_merchant_portal_pam_contract_controller(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `MerchantPortalPamContractController` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_merchant_portal_pam_document_controller(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `MerchantPortalPamDocumentController` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_merchant_portal_pam_form_controller(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `MerchantPortalPamFormController` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_merchant_portal_pam_mandator_controller(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `MerchantPortalPamMandatorController` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_merchant_portal_pam_merchant_controller(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `MerchantPortalPamMerchantController` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_merchant_portal_pam_package_controller(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `MerchantPortalPamPackageController` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_merchant_portal_pam_product_controller(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `MerchantPortalPamProductController` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_output_add_product(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `OutputAddProduct` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_output_create_product(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `OutputCreateProduct` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_output_detail(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `OutputDetail` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_output_list(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `OutputList` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_output_message(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `OutputMessage` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_output_move_tid(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `OutputMoveTid` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_output_remove_product(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `OutputRemoveProduct` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_output_start(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `OutputStart` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_output_status(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `OutputStatus` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefintecsmerchantportal_output_update_product(BluefinTecsMerchantPortalSDK* client, voxgig_value* entopts)`

Create a new `OutputUpdateProduct` entity instance. Pass `NULL` for no initial
options.

#### `voxgig_value* sdk_direct(BluefinTecsMerchantPortalSDK* client, voxgig_value* fetchargs, PNError** err)`

Make a direct HTTP request to any API endpoint. Returns a result map with
`ok`, `status`, `headers`, and `data` (or `err` on failure). This escape
hatch never sets `*err` for a non-2xx response — branch on
`getp(result, "ok")`.

**Parameters (`fetchargs` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

#### `voxgig_value* sdk_prepare(BluefinTecsMerchantPortalSDK* client, voxgig_value* fetchargs, PNError** err)`

Prepare a fetch definition without sending. Returns the fetchdef and sets
`*err` on failure.


---

## MerchantPortalApiController

```c
Entity* merchant_portal_api_controller = bluefintecsmerchantportal_merchant_portal_api_controller(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `int64_t` | No |  |
| `additional_data` | `voxgig_value* (map)` | No |  |
| `business_reg_number` | `char*` | Yes |  |
| `city` | `char*` | Yes |  |
| `corporateuuid` | `char*` | No |  |
| `country` | `char*` | Yes |  |
| `currency` | `char*` | Yes |  |
| `merchant_category_code` | `int64_t` | Yes |  |
| `merchant_email` | `char*` | No |  |
| `merchant_name` | `char*` | Yes |  |
| `merchant_phone_number` | `char*` | No |  |
| `packageid` | `char*` | Yes |  |
| `packageorderuuid` | `char*` | Yes |  |
| `password` | `char*` | No |  |
| `productid` | `char*` | No |  |
| `productid_acquirer` | `char*` | No |  |
| `reason_deactivation` | `char*` | Yes |  |
| `reason_reactivation` | `char*` | Yes |  |
| `sorting_code` | `int64_t` | No |  |
| `state` | `char*` | No |  |
| `street` | `char*` | Yes |  |
| `terminal_country_code` | `char*` | Yes |  |
| `terminal_language_code` | `char*` | Yes |  |
| `terminal_location` | `char*` | Yes |  |
| `terminal_serial_number` | `char*` | Yes |  |
| `terminalid` | `int64_t` | Yes |  |
| `terminalid_acquirer` | `char*` | No |  |
| `user_email` | `char*` | No |  |
| `user_phone_number` | `char*` | No |  |
| `username` | `char*` | No |  |
| `vu_nummer` | `char*` | Yes |  |
| `web_shop_url` | `char*` | No |  |
| `zipcode` | `char*` | Yes |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* merchant_portal_api_controller = bluefintecsmerchantportal_merchant_portal_api_controller(client, NULL);
voxgig_value* result = merchant_portal_api_controller->vt->create(merchant_portal_api_controller, cmap(18,
    "business_reg_number", v_str("example_business_reg_number"),  // char*
    "city", v_str("example_city"),  // char*
    "country", v_str("example_country"),  // char*
    "currency", v_str("example_currency"),  // char*
    "merchant_category_code", v_num(1),  // int64_t
    "merchant_name", v_str("example_merchant_name"),  // char*
    "packageid", v_str("example_packageid"),  // char*
    "packageorderuuid", v_str("example_packageorderuuid"),  // char*
    "reason_deactivation", v_str("example_reason_deactivation"),  // char*
    "reason_reactivation", v_str("example_reason_reactivation"),  // char*
    "street", v_str("example_street"),  // char*
    "terminal_country_code", v_str("example_terminal_country_code"),  // char*
    "terminal_language_code", v_str("example_terminal_language_code"),  // char*
    "terminal_location", v_str("example_terminal_location"),  // char*
    "terminal_serial_number", v_str("example_terminal_serial_number"),  // char*
    "terminalid", v_num(1),  // int64_t
    "vu_nummer", v_str("example_vu_nummer"),  // char*
    "zipcode", v_str("example_zipcode"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `MerchantPortalApiController` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## MerchantPortalCommonController

```c
Entity* merchant_portal_common_controller = bluefintecsmerchantportal_merchant_portal_common_controller(client, NULL);
```

### Operations

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* merchant_portal_common_controller = bluefintecsmerchantportal_merchant_portal_common_controller(client, NULL);
voxgig_value* result = merchant_portal_common_controller->vt->load(merchant_portal_common_controller, NULL, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `MerchantPortalCommonController` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## MerchantPortalPamContractController

```c
Entity* merchant_portal_pam_contract_controller = bluefintecsmerchantportal_merchant_portal_pam_contract_controller(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `char*` | Yes |  |
| `product_order_uuid` | `char*` | Yes |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* merchant_portal_pam_contract_controller = bluefintecsmerchantportal_merchant_portal_pam_contract_controller(client, NULL);
voxgig_value* result = merchant_portal_pam_contract_controller->vt->create(merchant_portal_pam_contract_controller, cmap(2,
    "language", v_str("example_language"),  // char*
    "product_order_uuid", v_str("example_product_order_uuid"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `MerchantPortalPamContractController` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## MerchantPortalPamDocumentController

```c
Entity* merchant_portal_pam_document_controller = bluefintecsmerchantportal_merchant_portal_pam_document_controller(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_field_desc_uuid` | `char*` | Yes |  |
| `package_order_uuid` | `char*` | No |  |
| `product_order_uuid` | `char*` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* merchant_portal_pam_document_controller = bluefintecsmerchantportal_merchant_portal_pam_document_controller(client, NULL);
voxgig_value* result = merchant_portal_pam_document_controller->vt->create(merchant_portal_pam_document_controller, cmap(1,
    "app_form_field_desc_uuid", v_str("example_app_form_field_desc_uuid"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `MerchantPortalPamDocumentController` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## MerchantPortalPamFormController

```c
Entity* merchant_portal_pam_form_controller = bluefintecsmerchantportal_merchant_portal_pam_form_controller(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_fields_desc_uuid` | `char*` | Yes |  |
| `filter` | `voxgig_value* (map)` | No |  |
| `language` | `char*` | Yes |  |
| `package_order` | `voxgig_value* (map)` | No |  |
| `package_order_uuid` | `char*` | Yes |  |
| `package_uuid` | `char*` | No |  |
| `product_order` | `voxgig_value* (list)` | No |  |
| `product_order_uuid` | `char*` | No |  |
| `reason_of_reopening` | `char*` | Yes |  |

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

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* merchant_portal_pam_form_controller = bluefintecsmerchantportal_merchant_portal_pam_form_controller(client, NULL);
voxgig_value* result = merchant_portal_pam_form_controller->vt->create(merchant_portal_pam_form_controller, cmap(4,
    "app_form_fields_desc_uuid", v_str("example_app_form_fields_desc_uuid"),  // char*
    "language", v_str("example_language"),  // char*
    "package_order_uuid", v_str("example_package_order_uuid"),  // char*
    "reason_of_reopening", v_str("example_reason_of_reopening"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `MerchantPortalPamFormController` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## MerchantPortalPamMandatorController

```c
Entity* merchant_portal_pam_mandator_controller = bluefintecsmerchantportal_merchant_portal_pam_mandator_controller(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client_secret` | `char*` | No |  |
| `mandator_name` | `char*` | Yes |  |
| `notification_email` | `char*` | No |  |
| `package_uuid` | `char*` | Yes |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* merchant_portal_pam_mandator_controller = bluefintecsmerchantportal_merchant_portal_pam_mandator_controller(client, NULL);
voxgig_value* result = merchant_portal_pam_mandator_controller->vt->create(merchant_portal_pam_mandator_controller, cmap(2,
    "mandator_name", v_str("example_mandator_name"),  // char*
    "package_uuid", v_str("example_package_uuid"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `MerchantPortalPamMandatorController` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## MerchantPortalPamMerchantController

```c
Entity* merchant_portal_pam_merchant_controller = bluefintecsmerchantportal_merchant_portal_pam_merchant_controller(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `voxgig_value* (map)` | No |  |
| `business_registration_number` | `char*` | Yes |  |
| `city` | `char*` | No |  |
| `company_name` | `char*` | Yes |  |
| `corporate_uuid` | `char*` | Yes |  |
| `country` | `char*` | No |  |
| `currency` | `char*` | Yes |  |
| `email` | `char*` | Yes |  |
| `language` | `char*` | Yes |  |
| `login` | `char*` | Yes |  |
| `mandator` | `char*` | Yes |  |
| `merchant_category_code` | `char*` | No |  |
| `merchant_contract_number` | `char*` | Yes |  |
| `merchant_name` | `char*` | No |  |
| `package_uuid` | `char*` | No |  |
| `packageorderuuid` | `char*` | Yes |  |
| `phone_number` | `char*` | Yes |  |
| `postal_code` | `char*` | No |  |
| `productid_acquirer` | `char*` | Yes |  |
| `region` | `char*` | No |  |
| `registration_number` | `char*` | No |  |
| `signature` | `char*` | No |  |
| `street` | `char*` | No |  |
| `terminal_id` | `voxgig_value* (list)` | No |  |
| `terminalid_acquirer` | `char*` | No |  |
| `vu_nummer` | `char*` | Yes |  |

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

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* merchant_portal_pam_merchant_controller = bluefintecsmerchantportal_merchant_portal_pam_merchant_controller(client, NULL);
voxgig_value* result = merchant_portal_pam_merchant_controller->vt->create(merchant_portal_pam_merchant_controller, cmap(13,
    "business_registration_number", v_str("example_business_registration_number"),  // char*
    "company_name", v_str("example_company_name"),  // char*
    "corporate_uuid", v_str("example_corporate_uuid"),  // char*
    "currency", v_str("example_currency"),  // char*
    "email", v_str("example_email"),  // char*
    "language", v_str("example_language"),  // char*
    "login", v_str("example_login"),  // char*
    "mandator", v_str("example_mandator"),  // char*
    "merchant_contract_number", v_str("example_merchant_contract_number"),  // char*
    "packageorderuuid", v_str("example_packageorderuuid"),  // char*
    "phone_number", v_str("example_phone_number"),  // char*
    "productid_acquirer", v_str("example_productid_acquirer"),  // char*
    "vu_nummer", v_str("example_vu_nummer"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `MerchantPortalPamMerchantController` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## MerchantPortalPamPackageController

```c
Entity* merchant_portal_pam_package_controller = bluefintecsmerchantportal_merchant_portal_pam_package_controller(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `char*` | No |  |
| `corporate_uuid` | `char*` | No |  |
| `country` | `char*` | No |  |
| `description_key` | `char*` | No |  |
| `filter` | `voxgig_value* (map)` | No |  |
| `language` | `char*` | Yes |  |
| `name_key` | `char*` | No |  |
| `package_status` | `char*` | No |  |
| `package_uuid` | `char*` | Yes |  |
| `pagination` | `voxgig_value* (map)` | No |  |
| `sorting` | `voxgig_value* (map)` | No |  |

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

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* merchant_portal_pam_package_controller = bluefintecsmerchantportal_merchant_portal_pam_package_controller(client, NULL);
voxgig_value* result = merchant_portal_pam_package_controller->vt->create(merchant_portal_pam_package_controller, cmap(2,
    "language", v_str("example_language"),  // char*
    "package_uuid", v_str("example_package_uuid"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `MerchantPortalPamPackageController` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## MerchantPortalPamProductController

```c
Entity* merchant_portal_pam_product_controller = bluefintecsmerchantportal_merchant_portal_pam_product_controller(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `char*` | No |  |
| `filter` | `voxgig_value* (map)` | No |  |
| `language` | `char*` | No |  |
| `merchant_id` | `char*` | No |  |
| `package_order_uuid` | `char*` | Yes |  |
| `pagination` | `voxgig_value* (map)` | No |  |
| `product_order_uuid` | `char*` | Yes |  |
| `product_uuid` | `char*` | Yes |  |
| `reason_decline` | `char*` | Yes |  |
| `sorting` | `voxgig_value* (map)` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* merchant_portal_pam_product_controller = bluefintecsmerchantportal_merchant_portal_pam_product_controller(client, NULL);
voxgig_value* result = merchant_portal_pam_product_controller->vt->create(merchant_portal_pam_product_controller, cmap(4,
    "package_order_uuid", v_str("example_package_order_uuid"),  // char*
    "product_order_uuid", v_str("example_product_order_uuid"),  // char*
    "product_uuid", v_str("example_product_uuid"),  // char*
    "reason_decline", v_str("example_reason_decline"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `MerchantPortalPamProductController` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## OutputAddProduct

```c
Entity* output_add_product = bluefintecsmerchantportal_output_add_product(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `char*` | Yes |  |
| `product_uui_d` | `voxgig_value* (list)` | Yes |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `char*` | Yes |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* output_add_product = bluefintecsmerchantportal_output_add_product(client, NULL);
voxgig_value* result = output_add_product->vt->create(output_add_product, cmap(4,
    "package_uuid", v_str("example_package_uuid"),  // char*
    "product_uui_d", v_list(),  // voxgig_value* (list)
    "response_code", v_num(1),  // int64_t
    "response_message", v_str("example_response_message"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `OutputAddProduct` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## OutputCreateProduct

```c
Entity* output_create_product = bluefintecsmerchantportal_output_create_product(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acquirer_id` | `char*` | No |  |
| `allow_multiple_order` | `bool` | Yes |  |
| `app_form_template_name` | `char*` | Yes |  |
| `contract_needed` | `bool` | Yes |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `char*` | Yes |  |
| `name_key` | `char*` | Yes |  |
| `prescreening_allowed` | `bool` | Yes |  |
| `product_name` | `char*` | Yes |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `char*` | Yes |  |
| `terminal_template_name` | `char*` | Yes |  |
| `vendor_name` | `char*` | Yes |  |
| `xml_template_file` | `char*` | Yes |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* output_create_product = bluefintecsmerchantportal_output_create_product(client, NULL);
voxgig_value* result = output_create_product->vt->create(output_create_product, cmap(12,
    "allow_multiple_order", v_bool(true),  // bool
    "app_form_template_name", v_str("example_app_form_template_name"),  // char*
    "contract_needed", v_bool(true),  // bool
    "description_key", v_str("example_description_key"),  // char*
    "name_key", v_str("example_name_key"),  // char*
    "prescreening_allowed", v_bool(true),  // bool
    "product_name", v_str("example_product_name"),  // char*
    "response_code", v_num(1),  // int64_t
    "response_message", v_str("example_response_message"),  // char*
    "terminal_template_name", v_str("example_terminal_template_name"),  // char*
    "vendor_name", v_str("example_vendor_name"),  // char*
    "xml_template_file", v_str("example_xml_template_file"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `OutputCreateProduct` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## OutputDetail

```c
Entity* output_detail = bluefintecsmerchantportal_output_detail(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `detail` | `voxgig_value* (map)` | No |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `char*` | Yes |  |

### Operations

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* output_detail = bluefintecsmerchantportal_output_detail(client, NULL);
voxgig_value* result = output_detail->vt->load(output_detail, cmap(1, "id", v_str("output_detail_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `OutputDetail` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## OutputList

```c
Entity* output_list = bluefintecsmerchantportal_output_list(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `item` | `voxgig_value* (list)` | No |  |
| `pagination` | `voxgig_value* (map)` | Yes |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `char*` | Yes |  |
| `sorting` | `voxgig_value* (map)` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* output_list = bluefintecsmerchantportal_output_list(client, NULL);
voxgig_value* result = output_list->vt->create(output_list, cmap(3,
    "pagination", v_map(),  // voxgig_value* (map)
    "response_code", v_num(1),  // int64_t
    "response_message", v_str("example_response_message"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `OutputList` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## OutputMessage

```c
Entity* output_message = bluefintecsmerchantportal_output_message(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `char*` | Yes |  |

### Operations

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* output_message = bluefintecsmerchantportal_output_message(client, NULL);
voxgig_value* result = output_message->vt->load(output_message, cmap(1, "id", v_str("output_message_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `OutputMessage` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## OutputMoveTid

```c
Entity* output_move_tid = bluefintecsmerchantportal_output_move_tid(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `product_order_uui_d` | `voxgig_value* (list)` | Yes |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `char*` | Yes |  |
| `target_package_order_uuid` | `char*` | Yes |  |
| `target_product_order_uuid` | `char*` | Yes |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* output_move_tid = bluefintecsmerchantportal_output_move_tid(client, NULL);
voxgig_value* result = output_move_tid->vt->create(output_move_tid, cmap(5,
    "product_order_uui_d", v_list(),  // voxgig_value* (list)
    "response_code", v_num(1),  // int64_t
    "response_message", v_str("example_response_message"),  // char*
    "target_package_order_uuid", v_str("example_target_package_order_uuid"),  // char*
    "target_product_order_uuid", v_str("example_target_product_order_uuid"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `OutputMoveTid` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## OutputRemoveProduct

```c
Entity* output_remove_product = bluefintecsmerchantportal_output_remove_product(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `char*` | Yes |  |
| `product_uui_d` | `voxgig_value* (list)` | Yes |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `char*` | Yes |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* output_remove_product = bluefintecsmerchantportal_output_remove_product(client, NULL);
voxgig_value* result = output_remove_product->vt->create(output_remove_product, cmap(4,
    "package_uuid", v_str("example_package_uuid"),  // char*
    "product_uui_d", v_list(),  // voxgig_value* (list)
    "response_code", v_num(1),  // int64_t
    "response_message", v_str("example_response_message"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `OutputRemoveProduct` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## OutputStart

```c
Entity* output_start = bluefintecsmerchantportal_output_start(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `char*` | No |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `char*` | Yes |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* output_start = bluefintecsmerchantportal_output_start(client, NULL);
voxgig_value* result = output_start->vt->create(output_start, cmap(2,
    "response_code", v_num(1),  // int64_t
    "response_message", v_str("example_response_message"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `OutputStart` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## OutputStatus

```c
Entity* output_status = bluefintecsmerchantportal_output_status(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `int64_t` | No |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `char*` | Yes |  |
| `status` | `char*` | No |  |

### Operations

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* output_status = bluefintecsmerchantportal_output_status(client, NULL);
voxgig_value* result = output_status->vt->load(output_status, cmap(1, "id", v_str("output_status_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `OutputStatus` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## OutputUpdateProduct

```c
Entity* output_update_product = bluefintecsmerchantportal_output_update_product(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `allow_multiple_order` | `bool` | No |  |
| `app_form_name` | `char*` | No |  |
| `contract_needed` | `bool` | No |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `char*` | No |  |
| `name_key` | `char*` | No |  |
| `prescreening_allowed` | `bool` | No |  |
| `product_name` | `char*` | No |  |
| `product_status` | `char*` | No |  |
| `product_uuid` | `char*` | Yes |  |
| `response_code` | `int64_t` | Yes |  |
| `response_message` | `char*` | Yes |  |
| `vendor_name` | `char*` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* output_update_product = bluefintecsmerchantportal_output_update_product(client, NULL);
voxgig_value* result = output_update_product->vt->create(output_update_product, cmap(3,
    "product_uuid", v_str("example_product_uuid"),  // char*
    "response_code", v_num(1),  // int64_t
    "response_message", v_str("example_response_message"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `OutputUpdateProduct` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```c
BluefinTecsMerchantPortalSDK* client = bluefintecsmerchantportal_sdk_new(cmap(1,
    "feature", cmap(1,
        "test", cmap(1, "active", v_bool(true)))
));
```

