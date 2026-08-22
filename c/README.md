# BluefinTecsMerchantPortal C SDK



The C SDK for the BluefinTecsMerchantPortal API — an entity-oriented client following idiomatic C conventions (explicit structs, function-pointer vtables, and a trailing `PNError**` out-param for errors).

The SDK exposes the API as capitalised, semantic **Entities** — for example `bluefintecsmerchantportal_merchant_portal_api_controller(client, NULL)` — each
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

BluefinTecsMerchantPortalSDK* client = bluefintecsmerchantportal_sdk_new(NULL);
PNError* err = NULL;
```

### 4. Create, update, and remove

```c
Entity* merchant_portal_api_controller = bluefintecsmerchantportal_merchant_portal_api_controller(client, NULL);
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
Entity* output_detail = bluefintecsmerchantportal_output_detail(client, NULL);
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

BluefinTecsMerchantPortalSDK* client = bluefintecsmerchantportal_sdk_new(cmap(2,
    "base", v_str("http://localhost:8080"),
    "system", cmap(1, "fetch", vfn(mock_fetch, NULL))));
```

### Point at a different server

Override the base URL to reach a local or staging server:

```c
BluefinTecsMerchantPortalSDK* client = bluefintecsmerchantportal_sdk_new(cmap(1,
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

BluefinTecsMerchantPortalSDK* client = bluefintecsmerchantportal_sdk_new(options);
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
| `bluefintecsmerchantportal_merchant_portal_api_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalApiController entity instance. |
| `bluefintecsmerchantportal_merchant_portal_common_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalCommonController entity instance. |
| `bluefintecsmerchantportal_merchant_portal_pam_contract_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalPamContractController entity instance. |
| `bluefintecsmerchantportal_merchant_portal_pam_document_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalPamDocumentController entity instance. |
| `bluefintecsmerchantportal_merchant_portal_pam_form_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalPamFormController entity instance. |
| `bluefintecsmerchantportal_merchant_portal_pam_mandator_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalPamMandatorController entity instance. |
| `bluefintecsmerchantportal_merchant_portal_pam_merchant_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalPamMerchantController entity instance. |
| `bluefintecsmerchantportal_merchant_portal_pam_package_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalPamPackageController entity instance. |
| `bluefintecsmerchantportal_merchant_portal_pam_product_controller` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create a MerchantPortalPamProductController entity instance. |
| `bluefintecsmerchantportal_output_add_product` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputAddProduct entity instance. |
| `bluefintecsmerchantportal_output_create_product` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputCreateProduct entity instance. |
| `bluefintecsmerchantportal_output_detail` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputDetail entity instance. |
| `bluefintecsmerchantportal_output_list` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputList entity instance. |
| `bluefintecsmerchantportal_output_message` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputMessage entity instance. |
| `bluefintecsmerchantportal_output_move_tid` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputMoveTid entity instance. |
| `bluefintecsmerchantportal_output_remove_product` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputRemoveProduct entity instance. |
| `bluefintecsmerchantportal_output_start` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputStart entity instance. |
| `bluefintecsmerchantportal_output_status` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputStatus entity instance. |
| `bluefintecsmerchantportal_output_update_product` | `(BluefinTecsMerchantPortalSDK*, entopts) -> Entity*` | Create an OutputUpdateProduct entity instance. |

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

Create an instance: `Entity* merchant_portal_api_controller = bluefintecsmerchantportal_merchant_portal_api_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `int64_t` | Account number provided by the acquirer. |
| `additional_data` | `voxgig_value* (map)` | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `char*` | Merchant business registration number as stated in the company registry. |
| `city` | `char*` | Merchant's address: city. |
| `corporateuuid` | `char*` | Unique identifier for the corporate entity (UUID format). |
| `country` | `char*` | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `char*` | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `int64_t` | Merchant category code as defined by the payment network. |
| `merchant_email` | `char*` | Merchant's email address for receiving notifications. |
| `merchant_name` | `char*` | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | `char*` | Merchant's phone number for notifications. |
| `packageid` | `char*` | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | `char*` | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | `char*` | Merchant password for MPOS. |
| `productid` | `char*` | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | `char*` | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | `char*` | Reason for terminal deactivation. |
| `reason_reactivation` | `char*` | Reason for terminal reactivation. |
| `sorting_code` | `int64_t` | Sorting code provided by the acquirer. |
| `state` | `char*` | Merchant's address: state. |
| `street` | `char*` | Merchant's address: street and house number. |
| `terminal_country_code` | `char*` | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `char*` | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `char*` | Physical or logical location of the terminal. |
| `terminal_serial_number` | `char*` | Terminal serial number. |
| `terminalid` | `int64_t` | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `char*` | Terminal ID as set by the acquirer (optional). |
| `user_email` | `char*` | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `char*` | Phone number of the user acting on behalf of the merchant. |
| `username` | `char*` | Merchant username for MPOS. |
| `vu_nummer` | `char*` | Merchant contract number with the acquirer. |
| `web_shop_url` | `char*` | URL of the merchant's web shop. |
| `zipcode` | `char*` | Merchant's address: postal code. |

#### Example: Create

```c
Entity* merchant_portal_api_controller = bluefintecsmerchantportal_merchant_portal_api_controller(client, NULL);
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

Create an instance: `Entity* merchant_portal_common_controller = bluefintecsmerchantportal_merchant_portal_common_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Example: Load

```c
Entity* merchant_portal_common_controller = bluefintecsmerchantportal_merchant_portal_common_controller(client, NULL);
voxgig_value* merchant_portal_common_controller_rec = merchant_portal_common_controller->vt->load(merchant_portal_common_controller, NULL, NULL, &err);
```


### MerchantPortalPamContractController

Create an instance: `Entity* merchant_portal_pam_contract_controller = bluefintecsmerchantportal_merchant_portal_pam_contract_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `char*` |  |
| `productOrderUUID` | `char*` |  |

#### Example: Create

```c
Entity* merchant_portal_pam_contract_controller = bluefintecsmerchantportal_merchant_portal_pam_contract_controller(client, NULL);
voxgig_value* merchant_portal_pam_contract_controller_rec = merchant_portal_pam_contract_controller->vt->create(merchant_portal_pam_contract_controller, cmap(2,
    "language", v_str("example_language"),  // char*
    "productOrderUUID", v_str("example_productOrderUUID"))  // char*
, NULL, &err);
```


### MerchantPortalPamDocumentController

Create an instance: `Entity* merchant_portal_pam_document_controller = bluefintecsmerchantportal_merchant_portal_pam_document_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldDescUUID` | `char*` |  |
| `packageOrderUUID` | `char*` | UUID of the package order. |
| `productOrderUUID` | `char*` | UUID of the product order. |

#### Example: Create

```c
Entity* merchant_portal_pam_document_controller = bluefintecsmerchantportal_merchant_portal_pam_document_controller(client, NULL);
voxgig_value* merchant_portal_pam_document_controller_rec = merchant_portal_pam_document_controller->vt->create(merchant_portal_pam_document_controller, cmap(1,
    "appFormFieldDescUUID", v_str("example_appFormFieldDescUUID"))  // char*
, NULL, &err);
```


### MerchantPortalPamFormController

Create an instance: `Entity* merchant_portal_pam_form_controller = bluefintecsmerchantportal_merchant_portal_pam_form_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldsDescUUID` | `char*` |  |
| `filter` | `voxgig_value* (map)` |  |
| `language` | `char*` |  |
| `packageOrder` | `voxgig_value* (map)` |  |
| `packageOrderUUID` | `char*` | UUID of the package order. |
| `packageUUID` | `char*` |  |
| `productOrderUUID` | `char*` | UUID of the product order. |
| `productOrders` | `voxgig_value* (list)` |  |
| `reasonOfReopening` | `char*` |  |

#### Example: Create

```c
Entity* merchant_portal_pam_form_controller = bluefintecsmerchantportal_merchant_portal_pam_form_controller(client, NULL);
voxgig_value* merchant_portal_pam_form_controller_rec = merchant_portal_pam_form_controller->vt->create(merchant_portal_pam_form_controller, cmap(4,
    "appFormFieldsDescUUID", v_str("example_appFormFieldsDescUUID"),  // char*
    "language", v_str("example_language"),  // char*
    "packageOrderUUID", v_str("example_packageOrderUUID"),  // char*
    "reasonOfReopening", v_str("example_reasonOfReopening"))  // char*
, NULL, &err);
```


### MerchantPortalPamMandatorController

Create an instance: `Entity* merchant_portal_pam_mandator_controller = bluefintecsmerchantportal_merchant_portal_pam_mandator_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `clientSecret` | `char*` |  |
| `mandatorName` | `char*` |  |
| `notificationEmail` | `char*` |  |
| `packageUUID` | `char*` |  |

#### Example: Create

```c
Entity* merchant_portal_pam_mandator_controller = bluefintecsmerchantportal_merchant_portal_pam_mandator_controller(client, NULL);
voxgig_value* merchant_portal_pam_mandator_controller_rec = merchant_portal_pam_mandator_controller->vt->create(merchant_portal_pam_mandator_controller, cmap(2,
    "mandatorName", v_str("example_mandatorName"),  // char*
    "packageUUID", v_str("example_packageUUID"))  // char*
, NULL, &err);
```


### MerchantPortalPamMerchantController

Create an instance: `Entity* merchant_portal_pam_merchant_controller = bluefintecsmerchantportal_merchant_portal_pam_merchant_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `voxgig_value* (map)` | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` | `char*` |  |
| `city` | `char*` | City where the merchant is located. |
| `companyName` | `char*` |  |
| `corporateUUID` | `char*` | Unique identifier for the corporate entity. |
| `country` | `char*` | Country where the merchant is located. |
| `currency` | `char*` | Transaction currency in ISO 4217 format. |
| `email` | `char*` |  |
| `language` | `char*` |  |
| `login` | `char*` |  |
| `mandator` | `char*` | Mandator name assigned by TECS. |
| `merchantContractNumber` | `char*` | Unique identifier for the merchant within a specific system. |
| `merchantName` | `char*` | Name of the merchant. |
| `merchant_category_code` | `char*` | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | `char*` | UUID of the package. |
| `packageorderuuid` | `char*` | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` | `char*` |  |
| `postalCode` | `char*` | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | `char*` | Identifier of the product for which acquiring is to be enabled. |
| `region` | `char*` | State or province where the merchant is located. |
| `registrationNumber` | `char*` | Business registration number. |
| `signature` | `char*` | Signature value = saltAsHex-hashAsHex. |
| `street` | `char*` | Street address of the merchant. |
| `terminalIds` | `voxgig_value* (list)` | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `char*` | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `char*` | Merchant contract number with the acquirer. |

#### Example: Create

```c
Entity* merchant_portal_pam_merchant_controller = bluefintecsmerchantportal_merchant_portal_pam_merchant_controller(client, NULL);
voxgig_value* merchant_portal_pam_merchant_controller_rec = merchant_portal_pam_merchant_controller->vt->create(merchant_portal_pam_merchant_controller, cmap(13,
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


### MerchantPortalPamPackageController

Create an instance: `Entity* merchant_portal_pam_package_controller = bluefintecsmerchantportal_merchant_portal_pam_package_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `char*` |  |
| `corporateUUID` | `char*` |  |
| `country` | `char*` | Country associated with the package. |
| `descriptionKey` | `char*` | Key for the description of the package. |
| `filter` | `voxgig_value* (map)` |  |
| `language` | `char*` |  |
| `nameKey` | `char*` | Key for the name of the package. |
| `packageStatus` | `char*` | Status of the package. |
| `packageUUID` | `char*` | Unique identifier for the package. |
| `pagination` | `voxgig_value* (map)` |  |
| `sorting` | `voxgig_value* (map)` |  |

#### Example: Create

```c
Entity* merchant_portal_pam_package_controller = bluefintecsmerchantportal_merchant_portal_pam_package_controller(client, NULL);
voxgig_value* merchant_portal_pam_package_controller_rec = merchant_portal_pam_package_controller->vt->create(merchant_portal_pam_package_controller, cmap(2,
    "language", v_str("example_language"),  // char*
    "packageUUID", v_str("example_packageUUID"))  // char*
, NULL, &err);
```


### MerchantPortalPamProductController

Create an instance: `Entity* merchant_portal_pam_product_controller = bluefintecsmerchantportal_merchant_portal_pam_product_controller(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `char*` |  |
| `filter` | `voxgig_value* (map)` |  |
| `language` | `char*` |  |
| `merchantID` | `char*` |  |
| `packageOrderUUID` | `char*` |  |
| `pagination` | `voxgig_value* (map)` |  |
| `productOrderUUID` | `char*` |  |
| `productUUID` | `char*` |  |
| `reason_decline` | `char*` | Reason for product decline. |
| `sorting` | `voxgig_value* (map)` |  |

#### Example: Create

```c
Entity* merchant_portal_pam_product_controller = bluefintecsmerchantportal_merchant_portal_pam_product_controller(client, NULL);
voxgig_value* merchant_portal_pam_product_controller_rec = merchant_portal_pam_product_controller->vt->create(merchant_portal_pam_product_controller, cmap(4,
    "packageOrderUUID", v_str("example_packageOrderUUID"),  // char*
    "productOrderUUID", v_str("example_productOrderUUID"),  // char*
    "productUUID", v_str("example_productUUID"),  // char*
    "reason_decline", v_str("example_reason_decline"))  // char*
, NULL, &err);
```


### OutputAddProduct

Create an instance: `Entity* output_add_product = bluefintecsmerchantportal_output_add_product(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `char*` | Unique identifier for the package. |
| `productUUIDs` | `voxgig_value* (list)` | The list of unique identifiers of the products. |
| `responseCode` | `int64_t` | Response code. |
| `responseMessage` | `char*` | Response message. |

#### Example: Create

```c
Entity* output_add_product = bluefintecsmerchantportal_output_add_product(client, NULL);
voxgig_value* output_add_product_rec = output_add_product->vt->create(output_add_product, cmap(4,
    "packageUUID", v_str("example_packageUUID"),  // char*
    "productUUIDs", v_list(),  // voxgig_value* (list)
    "responseCode", v_num(1),  // int64_t
    "responseMessage", v_str("example_responseMessage"))  // char*
, NULL, &err);
```


### OutputCreateProduct

Create an instance: `Entity* output_create_product = bluefintecsmerchantportal_output_create_product(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirerId` | `char*` | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `bool` | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `char*` | Name of the application form template. |
| `contractNeeded` | `bool` | Indication whether contract is needed or not. |
| `credentialsNeeded` | `bool` | Indication whether credentials are needed or not. |
| `descriptionKey` | `char*` | Key indicator for product description. |
| `nameKey` | `char*` | Key indicator for product name. |
| `prescreeningAllowed` | `bool` | Indication whether prescreening is allowed or not. |
| `productName` | `char*` | Name of the product. |
| `responseCode` | `int64_t` | Response code. |
| `responseMessage` | `char*` | Response message. |
| `terminalTemplateName` | `char*` | Name of the terminal template. |
| `vendorName` | `char*` | Name of the vendor. |
| `xmlTemplateFile` | `char*` | A string value containing the XML template file encoded in Base64. |

#### Example: Create

```c
Entity* output_create_product = bluefintecsmerchantportal_output_create_product(client, NULL);
voxgig_value* output_create_product_rec = output_create_product->vt->create(output_create_product, cmap(12,
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


### OutputDetail

Create an instance: `Entity* output_detail = bluefintecsmerchantportal_output_detail(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `batch` | `voxgig_value* (map)` |  |
| `lines` | `voxgig_value* (map)` |  |
| `progress` | `voxgig_value* (map)` |  |

#### Example: Load

```c
Entity* output_detail = bluefintecsmerchantportal_output_detail(client, NULL);
voxgig_value* output_detail_rec = output_detail->vt->load(output_detail, cmap(1, "id", v_str("output_detail_id")), NULL, &err);
```


### OutputList

Create an instance: `Entity* output_list = bluefintecsmerchantportal_output_list(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `items` | `voxgig_value* (list)` |  |
| `pagination` | `voxgig_value* (map)` |  |
| `responseCode` | `int64_t` | Response code. |
| `responseMessage` | `char*` | Response message. |
| `sorting` | `voxgig_value* (map)` |  |

#### Example: Create

```c
Entity* output_list = bluefintecsmerchantportal_output_list(client, NULL);
voxgig_value* output_list_rec = output_list->vt->create(output_list, cmap(3,
    "pagination", v_map(),  // voxgig_value* (map)
    "responseCode", v_num(1),  // int64_t
    "responseMessage", v_str("example_responseMessage"))  // char*
, NULL, &err);
```


### OutputMessage

Create an instance: `Entity* output_message = bluefintecsmerchantportal_output_message(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `responseCode` | `int64_t` | Response code. |
| `responseMessage` | `char*` | Response message. |

#### Example: Load

```c
Entity* output_message = bluefintecsmerchantportal_output_message(client, NULL);
voxgig_value* output_message_rec = output_message->vt->load(output_message, cmap(1, "id", v_str("output_message_id")), NULL, &err);
```


### OutputMoveTid

Create an instance: `Entity* output_move_tid = bluefintecsmerchantportal_output_move_tid(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `productOrderUUIDs` | `voxgig_value* (list)` |  |
| `responseCode` | `int64_t` | Response code. |
| `responseMessage` | `char*` | Response message. |
| `targetPackageOrderUUID` | `char*` |  |
| `targetProductOrderUUID` | `char*` |  |

#### Example: Create

```c
Entity* output_move_tid = bluefintecsmerchantportal_output_move_tid(client, NULL);
voxgig_value* output_move_tid_rec = output_move_tid->vt->create(output_move_tid, cmap(5,
    "productOrderUUIDs", v_list(),  // voxgig_value* (list)
    "responseCode", v_num(1),  // int64_t
    "responseMessage", v_str("example_responseMessage"),  // char*
    "targetPackageOrderUUID", v_str("example_targetPackageOrderUUID"),  // char*
    "targetProductOrderUUID", v_str("example_targetProductOrderUUID"))  // char*
, NULL, &err);
```


### OutputRemoveProduct

Create an instance: `Entity* output_remove_product = bluefintecsmerchantportal_output_remove_product(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `char*` | Unique identifier for the package. |
| `productUUIDs` | `voxgig_value* (list)` | List of product unique identifiers. |
| `responseCode` | `int64_t` | Response code. |
| `responseMessage` | `char*` | Response message. |

#### Example: Create

```c
Entity* output_remove_product = bluefintecsmerchantportal_output_remove_product(client, NULL);
voxgig_value* output_remove_product_rec = output_remove_product->vt->create(output_remove_product, cmap(4,
    "packageUUID", v_str("example_packageUUID"),  // char*
    "productUUIDs", v_list(),  // voxgig_value* (list)
    "responseCode", v_num(1),  // int64_t
    "responseMessage", v_str("example_responseMessage"))  // char*
, NULL, &err);
```


### OutputStart

Create an instance: `Entity* output_start = bluefintecsmerchantportal_output_start(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `char*` |  |
| `responseCode` | `int64_t` | Response code. |
| `responseMessage` | `char*` | Response message. |

#### Example: Create

```c
Entity* output_start = bluefintecsmerchantportal_output_start(client, NULL);
voxgig_value* output_start_rec = output_start->vt->create(output_start, cmap(2,
    "responseCode", v_num(1),  // int64_t
    "responseMessage", v_str("example_responseMessage"))  // char*
, NULL, &err);
```


### OutputStatus

Create an instance: `Entity* output_status = bluefintecsmerchantportal_output_status(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `int64_t` |  |
| `responseCode` | `int64_t` | Response code. |
| `responseMessage` | `char*` | Response message. |
| `status` | `char*` |  |

#### Example: Load

```c
Entity* output_status = bluefintecsmerchantportal_output_status(client, NULL);
voxgig_value* output_status_rec = output_status->vt->load(output_status, cmap(1, "id", v_str("output_status_id")), NULL, &err);
```


### OutputUpdateProduct

Create an instance: `Entity* output_update_product = bluefintecsmerchantportal_output_update_product(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allowMultipleOrders` | `bool` | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `char*` | The name of the application form |
| `contractNeeded` | `bool` | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `bool` | An attribute to indicate if credentials are needed |
| `descriptionKey` | `char*` | The description of the product |
| `nameKey` | `char*` | The key of the product name |
| `prescreeningAllowed` | `bool` | An attribute to indicate if prescreening is allowed |
| `productName` | `char*` | The name of the product |
| `productStatus` | `char*` | The status of the product |
| `productUUID` | `char*` | The UUID of the product to update |
| `responseCode` | `int64_t` | Response code. |
| `responseMessage` | `char*` | Response message. |
| `vendorName` | `char*` | The name of the vendor |

#### Example: Create

```c
Entity* output_update_product = bluefintecsmerchantportal_output_update_product(client, NULL);
voxgig_value* output_update_product_rec = output_update_product->vt->create(output_update_product, cmap(3,
    "productUUID", v_str("example_productUUID"),  // char*
    "responseCode", v_num(1),  // int64_t
    "responseMessage", v_str("example_responseMessage"))  // char*
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
