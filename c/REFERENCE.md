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
| `account_number` | `int64_t` | No | Account number provided by the acquirer. |
| `additional_data` | `voxgig_value* (map)` | No | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `char*` | Yes | Merchant business registration number as stated in the company registry. |
| `city` | `char*` | Yes | Merchant's address: city. |
| `corporateuuid` | `char*` | No | Unique identifier for the corporate entity (UUID format). |
| `country` | `char*` | Yes | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `char*` | Yes | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `int64_t` | Yes | Merchant category code as defined by the payment network. |
| `merchant_email` | `char*` | No | Merchant's email address for receiving notifications. |
| `merchant_name` | `char*` | Yes | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | `char*` | No | Merchant's phone number for notifications. |
| `packageid` | `char*` | Yes | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | `char*` | Yes | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | `char*` | No | Merchant password for MPOS. |
| `productid` | `char*` | No | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | `char*` | No | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | `char*` | Yes | Reason for terminal deactivation. |
| `reason_reactivation` | `char*` | Yes | Reason for terminal reactivation. |
| `sorting_code` | `int64_t` | No | Sorting code provided by the acquirer. |
| `state` | `char*` | No | Merchant's address: state. |
| `street` | `char*` | Yes | Merchant's address: street and house number. |
| `terminal_country_code` | `char*` | Yes | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `char*` | Yes | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `char*` | Yes | Physical or logical location of the terminal. |
| `terminal_serial_number` | `char*` | Yes | Terminal serial number. |
| `terminalid` | `int64_t` | Yes | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `char*` | No | Terminal ID as set by the acquirer (optional). |
| `user_email` | `char*` | No | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `char*` | No | Phone number of the user acting on behalf of the merchant. |
| `username` | `char*` | No | Merchant username for MPOS. |
| `vu_nummer` | `char*` | Yes | Merchant contract number with the acquirer. |
| `web_shop_url` | `char*` | No | URL of the merchant's web shop. |
| `zipcode` | `char*` | Yes | Merchant's address: postal code. |

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
| `productOrderUUID` | `char*` | Yes |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* merchant_portal_pam_contract_controller = bluefintecsmerchantportal_merchant_portal_pam_contract_controller(client, NULL);
voxgig_value* result = merchant_portal_pam_contract_controller->vt->create(merchant_portal_pam_contract_controller, cmap(2,
    "language", v_str("example_language"),  // char*
    "productOrderUUID", v_str("example_productOrderUUID"))  // char*
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
| `appFormFieldDescUUID` | `char*` | Yes |  |
| `packageOrderUUID` | `char*` | No | UUID of the package order. |
| `productOrderUUID` | `char*` | No | UUID of the product order. |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* merchant_portal_pam_document_controller = bluefintecsmerchantportal_merchant_portal_pam_document_controller(client, NULL);
voxgig_value* result = merchant_portal_pam_document_controller->vt->create(merchant_portal_pam_document_controller, cmap(1,
    "appFormFieldDescUUID", v_str("example_appFormFieldDescUUID"))  // char*
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
| `appFormFieldsDescUUID` | `char*` | Yes |  |
| `filter` | `voxgig_value* (map)` | No |  |
| `language` | `char*` | Yes |  |
| `packageOrder` | `voxgig_value* (map)` | No |  |
| `packageOrderUUID` | `char*` | Yes | UUID of the package order. |
| `packageUUID` | `char*` | No |  |
| `productOrderUUID` | `char*` | No | UUID of the product order. |
| `productOrders` | `voxgig_value* (list)` | No |  |
| `reasonOfReopening` | `char*` | Yes |  |

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

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* merchant_portal_pam_form_controller = bluefintecsmerchantportal_merchant_portal_pam_form_controller(client, NULL);
voxgig_value* result = merchant_portal_pam_form_controller->vt->create(merchant_portal_pam_form_controller, cmap(4,
    "appFormFieldsDescUUID", v_str("example_appFormFieldsDescUUID"),  // char*
    "language", v_str("example_language"),  // char*
    "packageOrderUUID", v_str("example_packageOrderUUID"),  // char*
    "reasonOfReopening", v_str("example_reasonOfReopening"))  // char*
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
| `clientSecret` | `char*` | No |  |
| `mandatorName` | `char*` | Yes |  |
| `notificationEmail` | `char*` | No |  |
| `packageUUID` | `char*` | Yes |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* merchant_portal_pam_mandator_controller = bluefintecsmerchantportal_merchant_portal_pam_mandator_controller(client, NULL);
voxgig_value* result = merchant_portal_pam_mandator_controller->vt->create(merchant_portal_pam_mandator_controller, cmap(2,
    "mandatorName", v_str("example_mandatorName"),  // char*
    "packageUUID", v_str("example_packageUUID"))  // char*
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
| `additional_data` | `voxgig_value* (map)` | No | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` | `char*` | Yes |  |
| `city` | `char*` | No | City where the merchant is located. |
| `companyName` | `char*` | Yes |  |
| `corporateUUID` | `char*` | Yes | Unique identifier for the corporate entity. |
| `country` | `char*` | No | Country where the merchant is located. |
| `currency` | `char*` | Yes | Transaction currency in ISO 4217 format. |
| `email` | `char*` | Yes |  |
| `language` | `char*` | Yes |  |
| `login` | `char*` | Yes |  |
| `mandator` | `char*` | Yes | Mandator name assigned by TECS. |
| `merchantContractNumber` | `char*` | Yes | Unique identifier for the merchant within a specific system. |
| `merchantName` | `char*` | No | Name of the merchant. |
| `merchant_category_code` | `char*` | No | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | `char*` | No | UUID of the package. |
| `packageorderuuid` | `char*` | Yes | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` | `char*` | Yes |  |
| `postalCode` | `char*` | No | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | `char*` | Yes | Identifier of the product for which acquiring is to be enabled. |
| `region` | `char*` | No | State or province where the merchant is located. |
| `registrationNumber` | `char*` | No | Business registration number. |
| `signature` | `char*` | No | Signature value = saltAsHex-hashAsHex. |
| `street` | `char*` | No | Street address of the merchant. |
| `terminalIds` | `voxgig_value* (list)` | No | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `char*` | No | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `char*` | Yes | Merchant contract number with the acquirer. |

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

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* merchant_portal_pam_merchant_controller = bluefintecsmerchantportal_merchant_portal_pam_merchant_controller(client, NULL);
voxgig_value* result = merchant_portal_pam_merchant_controller->vt->create(merchant_portal_pam_merchant_controller, cmap(13,
    "businessRegistrationNumber", v_str("example_businessRegistrationNumber"),  // char*
    "companyName", v_str("example_companyName"),  // char*
    "corporateUUID", v_str("example_corporateUUID"),  // char*
    "currency", v_str("example_currency"),  // char*
    "email", v_str("example_email"),  // char*
    "language", v_str("example_language"),  // char*
    "login", v_str("example_login"),  // char*
    "mandator", v_str("example_mandator"),  // char*
    "merchantContractNumber", v_str("example_merchantContractNumber"),  // char*
    "packageorderuuid", v_str("example_packageorderuuid"),  // char*
    "phoneNumber", v_str("example_phoneNumber"),  // char*
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
| `consumerUUID` | `char*` | No |  |
| `corporateUUID` | `char*` | No |  |
| `country` | `char*` | No | Country associated with the package. |
| `descriptionKey` | `char*` | No | Key for the description of the package. |
| `filter` | `voxgig_value* (map)` | No |  |
| `language` | `char*` | Yes |  |
| `nameKey` | `char*` | No | Key for the name of the package. |
| `packageStatus` | `char*` | No | Status of the package. |
| `packageUUID` | `char*` | Yes | Unique identifier for the package. |
| `pagination` | `voxgig_value* (map)` | No |  |
| `sorting` | `voxgig_value* (map)` | No |  |

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

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* merchant_portal_pam_package_controller = bluefintecsmerchantportal_merchant_portal_pam_package_controller(client, NULL);
voxgig_value* result = merchant_portal_pam_package_controller->vt->create(merchant_portal_pam_package_controller, cmap(2,
    "language", v_str("example_language"),  // char*
    "packageUUID", v_str("example_packageUUID"))  // char*
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
| `consumerUUID` | `char*` | No |  |
| `filter` | `voxgig_value* (map)` | No |  |
| `language` | `char*` | No |  |
| `merchantID` | `char*` | No |  |
| `packageOrderUUID` | `char*` | Yes |  |
| `pagination` | `voxgig_value* (map)` | No |  |
| `productOrderUUID` | `char*` | Yes |  |
| `productUUID` | `char*` | Yes |  |
| `reason_decline` | `char*` | Yes | Reason for product decline. |
| `sorting` | `voxgig_value* (map)` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* merchant_portal_pam_product_controller = bluefintecsmerchantportal_merchant_portal_pam_product_controller(client, NULL);
voxgig_value* result = merchant_portal_pam_product_controller->vt->create(merchant_portal_pam_product_controller, cmap(4,
    "packageOrderUUID", v_str("example_packageOrderUUID"),  // char*
    "productOrderUUID", v_str("example_productOrderUUID"),  // char*
    "productUUID", v_str("example_productUUID"),  // char*
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
| `packageUUID` | `char*` | Yes | Unique identifier for the package. |
| `productUUIDs` | `voxgig_value* (list)` | Yes | The list of unique identifiers of the products. |
| `responseCode` | `int64_t` | Yes | Response code. |
| `responseMessage` | `char*` | Yes | Response message. |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* output_add_product = bluefintecsmerchantportal_output_add_product(client, NULL);
voxgig_value* result = output_add_product->vt->create(output_add_product, cmap(4,
    "packageUUID", v_str("example_packageUUID"),  // char*
    "productUUIDs", v_list(),  // voxgig_value* (list)
    "responseCode", v_num(1),  // int64_t
    "responseMessage", v_str("example_responseMessage"))  // char*
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
| `acquirerId` | `char*` | No | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `bool` | Yes | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `char*` | Yes | Name of the application form template. |
| `contractNeeded` | `bool` | Yes | Indication whether contract is needed or not. |
| `credentialsNeeded` | `bool` | No | Indication whether credentials are needed or not. |
| `descriptionKey` | `char*` | Yes | Key indicator for product description. |
| `nameKey` | `char*` | Yes | Key indicator for product name. |
| `prescreeningAllowed` | `bool` | Yes | Indication whether prescreening is allowed or not. |
| `productName` | `char*` | Yes | Name of the product. |
| `responseCode` | `int64_t` | Yes | Response code. |
| `responseMessage` | `char*` | Yes | Response message. |
| `terminalTemplateName` | `char*` | Yes | Name of the terminal template. |
| `vendorName` | `char*` | Yes | Name of the vendor. |
| `xmlTemplateFile` | `char*` | Yes | A string value containing the XML template file encoded in Base64. |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* output_create_product = bluefintecsmerchantportal_output_create_product(client, NULL);
voxgig_value* result = output_create_product->vt->create(output_create_product, cmap(12,
    "allowMultipleOrders", v_bool(true),  // bool
    "appFormTemplateName", v_str("example_appFormTemplateName"),  // char*
    "contractNeeded", v_bool(true),  // bool
    "descriptionKey", v_str("example_descriptionKey"),  // char*
    "nameKey", v_str("example_nameKey"),  // char*
    "prescreeningAllowed", v_bool(true),  // bool
    "productName", v_str("example_productName"),  // char*
    "responseCode", v_num(1),  // int64_t
    "responseMessage", v_str("example_responseMessage"),  // char*
    "terminalTemplateName", v_str("example_terminalTemplateName"),  // char*
    "vendorName", v_str("example_vendorName"),  // char*
    "xmlTemplateFile", v_str("example_xmlTemplateFile"))  // char*
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
| `batch` | `voxgig_value* (map)` | No |  |
| `lines` | `voxgig_value* (map)` | No |  |
| `progress` | `voxgig_value* (map)` | No |  |

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
| `items` | `voxgig_value* (list)` | No |  |
| `pagination` | `voxgig_value* (map)` | Yes |  |
| `responseCode` | `int64_t` | Yes | Response code. |
| `responseMessage` | `char*` | Yes | Response message. |
| `sorting` | `voxgig_value* (map)` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `items` | - |
| `pagination` | Yes |
| `responseCode` | - |
| `responseMessage` | - |
| `sorting` | - |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* output_list = bluefintecsmerchantportal_output_list(client, NULL);
voxgig_value* result = output_list->vt->create(output_list, cmap(3,
    "pagination", v_map(),  // voxgig_value* (map)
    "responseCode", v_num(1),  // int64_t
    "responseMessage", v_str("example_responseMessage"))  // char*
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
| `responseCode` | `int64_t` | Yes | Response code. |
| `responseMessage` | `char*` | Yes | Response message. |

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
| `productOrderUUIDs` | `voxgig_value* (list)` | Yes |  |
| `responseCode` | `int64_t` | Yes | Response code. |
| `responseMessage` | `char*` | Yes | Response message. |
| `targetPackageOrderUUID` | `char*` | Yes |  |
| `targetProductOrderUUID` | `char*` | Yes |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* output_move_tid = bluefintecsmerchantportal_output_move_tid(client, NULL);
voxgig_value* result = output_move_tid->vt->create(output_move_tid, cmap(5,
    "productOrderUUIDs", v_list(),  // voxgig_value* (list)
    "responseCode", v_num(1),  // int64_t
    "responseMessage", v_str("example_responseMessage"),  // char*
    "targetPackageOrderUUID", v_str("example_targetPackageOrderUUID"),  // char*
    "targetProductOrderUUID", v_str("example_targetProductOrderUUID"))  // char*
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
| `packageUUID` | `char*` | Yes | Unique identifier for the package. |
| `productUUIDs` | `voxgig_value* (list)` | Yes | List of product unique identifiers. |
| `responseCode` | `int64_t` | Yes | Response code. |
| `responseMessage` | `char*` | Yes | Response message. |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* output_remove_product = bluefintecsmerchantportal_output_remove_product(client, NULL);
voxgig_value* result = output_remove_product->vt->create(output_remove_product, cmap(4,
    "packageUUID", v_str("example_packageUUID"),  // char*
    "productUUIDs", v_list(),  // voxgig_value* (list)
    "responseCode", v_num(1),  // int64_t
    "responseMessage", v_str("example_responseMessage"))  // char*
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
| `responseCode` | `int64_t` | Yes | Response code. |
| `responseMessage` | `char*` | Yes | Response message. |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* output_start = bluefintecsmerchantportal_output_start(client, NULL);
voxgig_value* result = output_start->vt->create(output_start, cmap(2,
    "responseCode", v_num(1),  // int64_t
    "responseMessage", v_str("example_responseMessage"))  // char*
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
| `responseCode` | `int64_t` | Yes | Response code. |
| `responseMessage` | `char*` | Yes | Response message. |
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
| `allowMultipleOrders` | `bool` | No | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `char*` | No | The name of the application form |
| `contractNeeded` | `bool` | No | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `bool` | No | An attribute to indicate if credentials are needed |
| `descriptionKey` | `char*` | No | The description of the product |
| `nameKey` | `char*` | No | The key of the product name |
| `prescreeningAllowed` | `bool` | No | An attribute to indicate if prescreening is allowed |
| `productName` | `char*` | No | The name of the product |
| `productStatus` | `char*` | No | The status of the product |
| `productUUID` | `char*` | Yes | The UUID of the product to update |
| `responseCode` | `int64_t` | Yes | Response code. |
| `responseMessage` | `char*` | Yes | Response message. |
| `vendorName` | `char*` | No | The name of the vendor |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* output_update_product = bluefintecsmerchantportal_output_update_product(client, NULL);
voxgig_value* result = output_update_product->vt->create(output_update_product, cmap(3,
    "productUUID", v_str("example_productUUID"),  // char*
    "responseCode", v_num(1),  // int64_t
    "responseMessage", v_str("example_responseMessage"))  // char*
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

