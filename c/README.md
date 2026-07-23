# BluefinTecsMerchantPortal C SDK



The C SDK for the BluefinTecsMerchantPortal API — an entity-oriented client following idiomatic C conventions (explicit structs, function-pointer vtables, and a trailing `PNError**` out-param for errors).

The SDK exposes the API as capitalised, semantic **Entities** — for example `bluefin_tecs_merchant_portal_merchant_portal_api_controller(client, NULL)` — each
carrying a small, uniform set of operations (`load`, `create`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
C has no central package registry — a release is the git tag
(`c/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases)). Build from a
source checkout with the bundled `Makefile`; the voxgig struct library is
vendored under `utility/struct`, so there are no external dependencies to
fetch:

```bash
cd c && make          # builds libsdk.a
cd c && make test     # builds + runs the test binaries
```

Link your program against `libsdk.a` and include `core/api.h`:

```bash
cc -I c/core -I c/utility/struct \
   myapp.c c/libsdk.a -lm -o myapp
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```c
#include "core/api.h"

BluefinTecsMerchantPortalSDK* client = bluefin_tecs_merchant_portal_sdk_new(NULL);
PNError* err = NULL;
```

### 4. Create, update, and remove

```c
Entity* merchant_portal_api_controller = bluefin_tecs_merchant_portal_merchant_portal_api_controller(client, NULL);
// Create — returns the bare created record
voxgig_value* created = merchant_portal_api_controller->vt->create(merchant_portal_api_controller, cmap(18, "business_reg_number", v_str("example_business_reg_number"), "city", v_str("example_city"), "country", v_str("example_country"), "currency", v_str("example_currency"), "merchant_category_code", v_num(1), "merchant_name", v_str("example_merchant_name"), "packageid", v_str("example_packageid"), "packageorderuuid", v_str("example_packageorderuuid"), "reason_deactivation", v_str("example_reason_deactivation"), "reason_reactivation", v_str("example_reason_reactivation"), "street", v_str("example_street"), "terminal_country_code", v_str("example_terminal_country_code"), "terminal_language_code", v_str("example_terminal_language_code"), "terminal_location", v_str("example_terminal_location"), "terminal_serial_number", v_str("example_terminal_serial_number"), "terminalid", v_num(1), "vu_nummer", v_str("example_vu_nummer"), "zipcode", v_str("example_zipcode")), NULL, &err);

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

```c
PNError* err = NULL;
voxgig_value* result = sdk_direct(client, cmap(3,
    "path", v_str("/api/resource/{id}"),
    "method", v_str("GET"),
    "params", cmap(1, "id", v_str("example"))), &err);

if (voxgig_as_bool(getp(result, "ok"))) {
    printf("%lld\n", (long long)to_int(getp(result, "status")));  // 200
    printf("%s\n", voxgig_to_json(getp(result, "data")));         // response body
} else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present.
    printf("%s\n", voxgig_to_json(getp(result, "err")));
}
```

`sdk_direct()` never sets `*err` for a non-2xx response — it always returns
a result map you branch on via `getp(result, "ok")`.

### Prepare a request without sending it

```c
PNError* err = NULL;
voxgig_value* fetchdef = sdk_prepare(client, cmap(3,
    "path", v_str("/api/resource/{id}"),
    "method", v_str("DELETE"),
    "params", cmap(1, "id", v_str("example"))), &err);

printf("%s\n", get_str(fetchdef, "url"));
printf("%s\n", get_str(fetchdef, "method"));
printf("%s\n", voxgig_to_json(getp(fetchdef, "headers")));
```

### Use test mode

Create a mock client for unit testing — no server required:

```c
BluefinTecsMerchantPortalSDK* client = test_sdk(NULL, NULL);
PNError* err = NULL;

// Entity ops return the bare record and set *err on failure.
Entity* output_detail = bluefin_tecs_merchant_portal_output_detail(client, NULL);
voxgig_value* output_detail_rec = output_detail->vt->load(output_detail, cmap(1, "id", v_str("test01")), NULL, &err);
// output_detail_rec contains the mock response record
```

### Use a custom fetch function

Replace the HTTP transport with your own function (the same shape the test
transport uses):

```c
static voxgig_value* mock_fetch(void* ud, voxgig_value* args) {
    (void)ud; (void)args;
    return cmap(4,
        "status", v_num(200),
        "statusText", v_str("OK"),
        "headers", v_map(),
        "json", json_thunk(cmap(1, "id", v_str("mock01"))));
}

BluefinTecsMerchantPortalSDK* client = bluefin_tecs_merchant_portal_sdk_new(cmap(2,
    "base", v_str("http://localhost:8080"),
    "system", cmap(1, "fetch", vfn(mock_fetch, NULL))));
```

### Point at a different server

Override the base URL to reach a local or staging server:

```c
BluefinTecsMerchantPortalSDK* client = bluefin_tecs_merchant_portal_sdk_new(cmap(1,
    "base", v_str("http://localhost:8080")));
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run:

```bash
cd c && make test
```


## Reference

### BluefinTecsMerchantPortalSDK

```c
#include "core/api.h"

BluefinTecsMerchantPortalSDK* client = bluefin_tecs_merchant_portal_sdk_new(options);
```

Creates a new SDK client. `options` is a `voxgig_value*` map (`NULL` for
none) carrying any of the following keys:

| Option | Value type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `system` | `map` | System overrides (e.g. a custom `fetch`). |

### test_sdk

```c
BluefinTecsMerchantPortalSDK* client = test_sdk(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`NULL`.

### BluefinTecsMerchantPortalSDK functions

| Function | Signature | Description |
| --- | --- | --- |
| `sdk_prepare` | `(BluefinTecsMerchantPortalSDK*, fetchargs, PNError**) -> voxgig_value*` | Build an HTTP request definition without sending. |
| `sdk_direct` | `(BluefinTecsMerchantPortalSDK*, fetchargs, PNError**) -> voxgig_value*` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `bluefin_tecs_merchant_portal_merchant_portal_api_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalApiController entity instance. |
| `bluefin_tecs_merchant_portal_merchant_portal_common_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalCommonController entity instance. |
| `bluefin_tecs_merchant_portal_merchant_portal_pam_contract_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalPamContractController entity instance. |
| `bluefin_tecs_merchant_portal_merchant_portal_pam_document_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalPamDocumentController entity instance. |
| `bluefin_tecs_merchant_portal_merchant_portal_pam_form_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalPamFormController entity instance. |
| `bluefin_tecs_merchant_portal_merchant_portal_pam_mandator_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalPamMandatorController entity instance. |
| `bluefin_tecs_merchant_portal_merchant_portal_pam_merchant_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalPamMerchantController entity instance. |
| `bluefin_tecs_merchant_portal_merchant_portal_pam_package_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalPamPackageController entity instance. |
| `bluefin_tecs_merchant_portal_merchant_portal_pam_product_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalPamProductController entity instance. |
| `bluefin_tecs_merchant_portal_output_add_product` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputAddProduct entity instance. |
| `bluefin_tecs_merchant_portal_output_create_product` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputCreateProduct entity instance. |
| `bluefin_tecs_merchant_portal_output_detail` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputDetail entity instance. |
| `bluefin_tecs_merchant_portal_output_list` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputList entity instance. |
| `bluefin_tecs_merchant_portal_output_message` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputMessage entity instance. |
| `bluefin_tecs_merchant_portal_output_move_tid` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputMoveTid entity instance. |
| `bluefin_tecs_merchant_portal_output_remove_product` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputRemoveProduct entity instance. |
| `bluefin_tecs_merchant_portal_output_start` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputStart entity instance. |
| `bluefin_tecs_merchant_portal_output_status` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputStatus entity instance. |
| `bluefin_tecs_merchant_portal_output_update_product` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputUpdateProduct entity instance. |

### Entity interface (vtable)

All entities share the same `EntityVT` vtable, reached via `e->vt->...`.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(Entity*, reqmatch, ctrl, PNError**) -> voxgig_value*` | Load a single entity by match criteria. |
| `create` | `(Entity*, reqdata, ctrl, PNError**) -> voxgig_value*` | Create a new entity. |
| `data` | `(Entity*, args) -> voxgig_value*` | Get entity data (pass a map to set). |
| `matchv` | `(Entity*, args) -> voxgig_value*` | Get entity match criteria (pass a map to set). |
| `make` | `(Entity*) -> Entity*` | Create a new instance with the same options. |
| `get_name` | `(Entity*) -> const char*` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `voxgig_value` map for
single-entity ops, a List for `list`) and set `*err` to a `PNError*` on
failure. Always initialise `PNError* err = NULL;` and check it after the
call.

The `sdk_direct()` escape hatch never sets `*err` for a non-2xx response —
it returns a result map you branch on via `getp(result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `number` | HTTP status code. |
| `headers` | `map` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `false` and `err` carries the error value.

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

Create an instance: `Entity* merchant_portal_api_controller = bluefin_tecs_merchant_portal_merchant_portal_api_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `int64_t` |  |
| `additional_data` | `voxgig_value* (map)` |  |
| `business_reg_number` | `char*` |  |
| `city` | `char*` |  |
| `corporateuuid` | `char*` |  |
| `country` | `char*` |  |
| `currency` | `char*` |  |
| `merchant_category_code` | `int64_t` |  |
| `merchant_email` | `char*` |  |
| `merchant_name` | `char*` |  |
| `merchant_phone_number` | `char*` |  |
| `packageid` | `char*` |  |
| `packageorderuuid` | `char*` |  |
| `password` | `char*` |  |
| `productid` | `char*` |  |
| `productid_acquirer` | `char*` |  |
| `reason_deactivation` | `char*` |  |
| `reason_reactivation` | `char*` |  |
| `sorting_code` | `int64_t` |  |
| `state` | `char*` |  |
| `street` | `char*` |  |
| `terminal_country_code` | `char*` |  |
| `terminal_language_code` | `char*` |  |
| `terminal_location` | `char*` |  |
| `terminal_serial_number` | `char*` |  |
| `terminalid` | `int64_t` |  |
| `terminalid_acquirer` | `char*` |  |
| `user_email` | `char*` |  |
| `user_phone_number` | `char*` |  |
| `username` | `char*` |  |
| `vu_nummer` | `char*` |  |
| `web_shop_url` | `char*` |  |
| `zipcode` | `char*` |  |

#### Example: Create

```c
Entity* merchant_portal_api_controller = bluefin_tecs_merchant_portal_merchant_portal_api_controller(client, NULL);
voxgig_value* merchant_portal_api_controller_rec = merchant_portal_api_controller->vt->create(merchant_portal_api_controller, cmap(18,
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


### MerchantPortalCommonController

Create an instance: `Entity* merchant_portal_common_controller = bluefin_tecs_merchant_portal_merchant_portal_common_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Example: Load

```c
Entity* merchant_portal_common_controller = bluefin_tecs_merchant_portal_merchant_portal_common_controller(client, NULL);
voxgig_value* merchant_portal_common_controller_rec = merchant_portal_common_controller->vt->load(merchant_portal_common_controller, NULL, NULL, &err);
```


### MerchantPortalPamContractController

Create an instance: `Entity* merchant_portal_pam_contract_controller = bluefin_tecs_merchant_portal_merchant_portal_pam_contract_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `char*` |  |
| `product_order_uuid` | `char*` |  |

#### Example: Create

```c
Entity* merchant_portal_pam_contract_controller = bluefin_tecs_merchant_portal_merchant_portal_pam_contract_controller(client, NULL);
voxgig_value* merchant_portal_pam_contract_controller_rec = merchant_portal_pam_contract_controller->vt->create(merchant_portal_pam_contract_controller, cmap(2,
    "language", v_str("example_language"),  // char*
    "product_order_uuid", v_str("example_product_order_uuid"))  // char*
, NULL, &err);
```


### MerchantPortalPamDocumentController

Create an instance: `Entity* merchant_portal_pam_document_controller = bluefin_tecs_merchant_portal_merchant_portal_pam_document_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_field_desc_uuid` | `char*` |  |
| `package_order_uuid` | `char*` |  |
| `product_order_uuid` | `char*` |  |

#### Example: Create

```c
Entity* merchant_portal_pam_document_controller = bluefin_tecs_merchant_portal_merchant_portal_pam_document_controller(client, NULL);
voxgig_value* merchant_portal_pam_document_controller_rec = merchant_portal_pam_document_controller->vt->create(merchant_portal_pam_document_controller, cmap(1,
    "app_form_field_desc_uuid", v_str("example_app_form_field_desc_uuid"))  // char*
, NULL, &err);
```


### MerchantPortalPamFormController

Create an instance: `Entity* merchant_portal_pam_form_controller = bluefin_tecs_merchant_portal_merchant_portal_pam_form_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_fields_desc_uuid` | `char*` |  |
| `filter` | `voxgig_value* (map)` |  |
| `language` | `char*` |  |
| `package_order` | `voxgig_value* (map)` |  |
| `package_order_uuid` | `char*` |  |
| `package_uuid` | `char*` |  |
| `product_order` | `voxgig_value* (list)` |  |
| `product_order_uuid` | `char*` |  |
| `reason_of_reopening` | `char*` |  |

#### Example: Create

```c
Entity* merchant_portal_pam_form_controller = bluefin_tecs_merchant_portal_merchant_portal_pam_form_controller(client, NULL);
voxgig_value* merchant_portal_pam_form_controller_rec = merchant_portal_pam_form_controller->vt->create(merchant_portal_pam_form_controller, cmap(4,
    "app_form_fields_desc_uuid", v_str("example_app_form_fields_desc_uuid"),  // char*
    "language", v_str("example_language"),  // char*
    "package_order_uuid", v_str("example_package_order_uuid"),  // char*
    "reason_of_reopening", v_str("example_reason_of_reopening"))  // char*
, NULL, &err);
```


### MerchantPortalPamMandatorController

Create an instance: `Entity* merchant_portal_pam_mandator_controller = bluefin_tecs_merchant_portal_merchant_portal_pam_mandator_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client_secret` | `char*` |  |
| `mandator_name` | `char*` |  |
| `notification_email` | `char*` |  |
| `package_uuid` | `char*` |  |

#### Example: Create

```c
Entity* merchant_portal_pam_mandator_controller = bluefin_tecs_merchant_portal_merchant_portal_pam_mandator_controller(client, NULL);
voxgig_value* merchant_portal_pam_mandator_controller_rec = merchant_portal_pam_mandator_controller->vt->create(merchant_portal_pam_mandator_controller, cmap(2,
    "mandator_name", v_str("example_mandator_name"),  // char*
    "package_uuid", v_str("example_package_uuid"))  // char*
, NULL, &err);
```


### MerchantPortalPamMerchantController

Create an instance: `Entity* merchant_portal_pam_merchant_controller = bluefin_tecs_merchant_portal_merchant_portal_pam_merchant_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `voxgig_value* (map)` |  |
| `business_registration_number` | `char*` |  |
| `city` | `char*` |  |
| `company_name` | `char*` |  |
| `corporate_uuid` | `char*` |  |
| `country` | `char*` |  |
| `currency` | `char*` |  |
| `email` | `char*` |  |
| `language` | `char*` |  |
| `login` | `char*` |  |
| `mandator` | `char*` |  |
| `merchant_category_code` | `char*` |  |
| `merchant_contract_number` | `char*` |  |
| `merchant_name` | `char*` |  |
| `package_uuid` | `char*` |  |
| `packageorderuuid` | `char*` |  |
| `phone_number` | `char*` |  |
| `postal_code` | `char*` |  |
| `productid_acquirer` | `char*` |  |
| `region` | `char*` |  |
| `registration_number` | `char*` |  |
| `signature` | `char*` |  |
| `street` | `char*` |  |
| `terminal_id` | `voxgig_value* (list)` |  |
| `terminalid_acquirer` | `char*` |  |
| `vu_nummer` | `char*` |  |

#### Example: Create

```c
Entity* merchant_portal_pam_merchant_controller = bluefin_tecs_merchant_portal_merchant_portal_pam_merchant_controller(client, NULL);
voxgig_value* merchant_portal_pam_merchant_controller_rec = merchant_portal_pam_merchant_controller->vt->create(merchant_portal_pam_merchant_controller, cmap(13,
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


### MerchantPortalPamPackageController

Create an instance: `Entity* merchant_portal_pam_package_controller = bluefin_tecs_merchant_portal_merchant_portal_pam_package_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `char*` |  |
| `corporate_uuid` | `char*` |  |
| `country` | `char*` |  |
| `description_key` | `char*` |  |
| `filter` | `voxgig_value* (map)` |  |
| `language` | `char*` |  |
| `name_key` | `char*` |  |
| `package_status` | `char*` |  |
| `package_uuid` | `char*` |  |
| `pagination` | `voxgig_value* (map)` |  |
| `sorting` | `voxgig_value* (map)` |  |

#### Example: Create

```c
Entity* merchant_portal_pam_package_controller = bluefin_tecs_merchant_portal_merchant_portal_pam_package_controller(client, NULL);
voxgig_value* merchant_portal_pam_package_controller_rec = merchant_portal_pam_package_controller->vt->create(merchant_portal_pam_package_controller, cmap(2,
    "language", v_str("example_language"),  // char*
    "package_uuid", v_str("example_package_uuid"))  // char*
, NULL, &err);
```


### MerchantPortalPamProductController

Create an instance: `Entity* merchant_portal_pam_product_controller = bluefin_tecs_merchant_portal_merchant_portal_pam_product_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `char*` |  |
| `filter` | `voxgig_value* (map)` |  |
| `language` | `char*` |  |
| `merchant_id` | `char*` |  |
| `package_order_uuid` | `char*` |  |
| `pagination` | `voxgig_value* (map)` |  |
| `product_order_uuid` | `char*` |  |
| `product_uuid` | `char*` |  |
| `reason_decline` | `char*` |  |
| `sorting` | `voxgig_value* (map)` |  |

#### Example: Create

```c
Entity* merchant_portal_pam_product_controller = bluefin_tecs_merchant_portal_merchant_portal_pam_product_controller(client, NULL);
voxgig_value* merchant_portal_pam_product_controller_rec = merchant_portal_pam_product_controller->vt->create(merchant_portal_pam_product_controller, cmap(4,
    "package_order_uuid", v_str("example_package_order_uuid"),  // char*
    "product_order_uuid", v_str("example_product_order_uuid"),  // char*
    "product_uuid", v_str("example_product_uuid"),  // char*
    "reason_decline", v_str("example_reason_decline"))  // char*
, NULL, &err);
```


### OutputAddProduct

Create an instance: `Entity* output_add_product = bluefin_tecs_merchant_portal_output_add_product(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `char*` |  |
| `product_uui_d` | `voxgig_value* (list)` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `char*` |  |

#### Example: Create

```c
Entity* output_add_product = bluefin_tecs_merchant_portal_output_add_product(client, NULL);
voxgig_value* output_add_product_rec = output_add_product->vt->create(output_add_product, cmap(4,
    "package_uuid", v_str("example_package_uuid"),  // char*
    "product_uui_d", v_list(),  // voxgig_value* (list)
    "response_code", v_num(1),  // int64_t
    "response_message", v_str("example_response_message"))  // char*
, NULL, &err);
```


### OutputCreateProduct

Create an instance: `Entity* output_create_product = bluefin_tecs_merchant_portal_output_create_product(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirer_id` | `char*` |  |
| `allow_multiple_order` | `bool` |  |
| `app_form_template_name` | `char*` |  |
| `contract_needed` | `bool` |  |
| `credentials_needed` | `bool` |  |
| `description_key` | `char*` |  |
| `name_key` | `char*` |  |
| `prescreening_allowed` | `bool` |  |
| `product_name` | `char*` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `char*` |  |
| `terminal_template_name` | `char*` |  |
| `vendor_name` | `char*` |  |
| `xml_template_file` | `char*` |  |

#### Example: Create

```c
Entity* output_create_product = bluefin_tecs_merchant_portal_output_create_product(client, NULL);
voxgig_value* output_create_product_rec = output_create_product->vt->create(output_create_product, cmap(12,
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


### OutputDetail

Create an instance: `Entity* output_detail = bluefin_tecs_merchant_portal_output_detail(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `detail` | `voxgig_value* (map)` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `char*` |  |

#### Example: Load

```c
Entity* output_detail = bluefin_tecs_merchant_portal_output_detail(client, NULL);
voxgig_value* output_detail_rec = output_detail->vt->load(output_detail, cmap(1, "id", v_str("output_detail_id")), NULL, &err);
```


### OutputList

Create an instance: `Entity* output_list = bluefin_tecs_merchant_portal_output_list(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `item` | `voxgig_value* (list)` |  |
| `pagination` | `voxgig_value* (map)` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `char*` |  |
| `sorting` | `voxgig_value* (map)` |  |

#### Example: Create

```c
Entity* output_list = bluefin_tecs_merchant_portal_output_list(client, NULL);
voxgig_value* output_list_rec = output_list->vt->create(output_list, cmap(3,
    "pagination", v_map(),  // voxgig_value* (map)
    "response_code", v_num(1),  // int64_t
    "response_message", v_str("example_response_message"))  // char*
, NULL, &err);
```


### OutputMessage

Create an instance: `Entity* output_message = bluefin_tecs_merchant_portal_output_message(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `response_code` | `int64_t` |  |
| `response_message` | `char*` |  |

#### Example: Load

```c
Entity* output_message = bluefin_tecs_merchant_portal_output_message(client, NULL);
voxgig_value* output_message_rec = output_message->vt->load(output_message, cmap(1, "id", v_str("output_message_id")), NULL, &err);
```


### OutputMoveTid

Create an instance: `Entity* output_move_tid = bluefin_tecs_merchant_portal_output_move_tid(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `product_order_uui_d` | `voxgig_value* (list)` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `char*` |  |
| `target_package_order_uuid` | `char*` |  |
| `target_product_order_uuid` | `char*` |  |

#### Example: Create

```c
Entity* output_move_tid = bluefin_tecs_merchant_portal_output_move_tid(client, NULL);
voxgig_value* output_move_tid_rec = output_move_tid->vt->create(output_move_tid, cmap(5,
    "product_order_uui_d", v_list(),  // voxgig_value* (list)
    "response_code", v_num(1),  // int64_t
    "response_message", v_str("example_response_message"),  // char*
    "target_package_order_uuid", v_str("example_target_package_order_uuid"),  // char*
    "target_product_order_uuid", v_str("example_target_product_order_uuid"))  // char*
, NULL, &err);
```


### OutputRemoveProduct

Create an instance: `Entity* output_remove_product = bluefin_tecs_merchant_portal_output_remove_product(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `char*` |  |
| `product_uui_d` | `voxgig_value* (list)` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `char*` |  |

#### Example: Create

```c
Entity* output_remove_product = bluefin_tecs_merchant_portal_output_remove_product(client, NULL);
voxgig_value* output_remove_product_rec = output_remove_product->vt->create(output_remove_product, cmap(4,
    "package_uuid", v_str("example_package_uuid"),  // char*
    "product_uui_d", v_list(),  // voxgig_value* (list)
    "response_code", v_num(1),  // int64_t
    "response_message", v_str("example_response_message"))  // char*
, NULL, &err);
```


### OutputStart

Create an instance: `Entity* output_start = bluefin_tecs_merchant_portal_output_start(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `char*` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `char*` |  |

#### Example: Create

```c
Entity* output_start = bluefin_tecs_merchant_portal_output_start(client, NULL);
voxgig_value* output_start_rec = output_start->vt->create(output_start, cmap(2,
    "response_code", v_num(1),  // int64_t
    "response_message", v_str("example_response_message"))  // char*
, NULL, &err);
```


### OutputStatus

Create an instance: `Entity* output_status = bluefin_tecs_merchant_portal_output_status(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `int64_t` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `char*` |  |
| `status` | `char*` |  |

#### Example: Load

```c
Entity* output_status = bluefin_tecs_merchant_portal_output_status(client, NULL);
voxgig_value* output_status_rec = output_status->vt->load(output_status, cmap(1, "id", v_str("output_status_id")), NULL, &err);
```


### OutputUpdateProduct

Create an instance: `Entity* output_update_product = bluefin_tecs_merchant_portal_output_update_product(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allow_multiple_order` | `bool` |  |
| `app_form_name` | `char*` |  |
| `contract_needed` | `bool` |  |
| `credentials_needed` | `bool` |  |
| `description_key` | `char*` |  |
| `name_key` | `char*` |  |
| `prescreening_allowed` | `bool` |  |
| `product_name` | `char*` |  |
| `product_status` | `char*` |  |
| `product_uuid` | `char*` |  |
| `response_code` | `int64_t` |  |
| `response_message` | `char*` |  |
| `vendor_name` | `char*` |  |

#### Example: Create

```c
Entity* output_update_product = bluefin_tecs_merchant_portal_output_update_product(client, NULL);
voxgig_value* output_update_product_rec = output_update_product->vt->create(output_update_product, cmap(3,
    "product_uuid", v_str("example_product_uuid"),  // char*
    "response_code", v_num(1),  // int64_t
    "response_message", v_str("example_response_message"))  // char*
, NULL, &err);
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

### Data as `voxgig_value*`

The C SDK uses a single dynamic `voxgig_value*` type throughout rather than
a typed struct per entity. `voxgig_value` is the vendored voxgig struct
port (a JSON-shaped tagged union: string, number, bool, list, map, null,
undef). This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with the `cmap` / `clist` / `v_str` / `v_num` /
`v_bool` helper builders, and read fields back with `getp` (or the typed
`get_str` / `get_bool` / `to_int`); use `to_map` to safely coerce a
value to a map.

Memory follows a retain-heavy, never-free discipline — pipeline values are
never released. This is safe (no use-after-free) and leaks are acceptable
for the short-lived SDK and test binaries.

### Error handling

Fallible functions return a `voxgig_value*` (or a struct pointer) and take a
trailing `PNError** err` out-param. On success `*err` is left `NULL`; on
failure `*err` points to a heap `PNError` carrying `code` and `msg`.
Always initialise `PNError* err = NULL;` and branch on it after each call.

### Project structure

```
c/
├── core/          -- Pipeline types, config, client (client.c), api.h + sdk.h
├── entity/        -- Per-entity implementations (one .c each)
├── feature/       -- Built-in features (base, test, log, ...)
├── utility/       -- Utilities + the vendored voxgig struct port (utility/struct)
├── tests/         -- Test binaries (each a standalone main())
└── Makefile       -- Builds libsdk.a and runs every tests/*.c
```

The public entry header is `core/api.h` — it includes `core/sdk.h` (the
umbrella runtime header) and declares each entity's constructor and SDK
accessor. Include it and link against `libsdk.a`.

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
