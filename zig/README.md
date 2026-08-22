# BluefinTecsMerchantPortal Zig SDK



The Zig SDK for the BluefinTecsMerchantPortal API — an entity-oriented client following idiomatic Zig conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.merchant_portal_api_controller(h.vnull())` — each
carrying a small, uniform set of operations (`load`, `create`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
Zig has no central package registry, so this package is distributed as a
git tag (`zig/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases)). Add it to
your `build.zig.zon` dependencies, or build from a source checkout:

```bash
cd zig && zig build
```

To depend on it from another project, add the tagged archive to
`build.zig.zon`:

```zig
.dependencies = .{
    .sdk = .{
        .url = "<repo-url>/archive/refs/tags/zig/vX.Y.Z.tar.gz",
        // .hash = "...", // filled in by `zig fetch`
    },
},
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```zig
const std = @import("std");
const sdk = @import("sdk");
const h = sdk.h;

const client = sdk.BluefinTecsMerchantPortalSDK.new(h.vnull());
```

### 4. Create, update, and remove

```zig
// Create — .ok carries the created record
switch (client.merchant_portal_api_controller(h.vnull()).create(h.jo(&.{.{ "business_reg_number", h.vstr("example_business_reg_number") }, .{ "city", h.vstr("example_city") }, .{ "country", h.vstr("example_country") }, .{ "currency", h.vstr("example_currency") }, .{ "merchant_category_code", h.vnum(1) }, .{ "merchant_name", h.vstr("example_merchant_name") }, .{ "packageid", h.vstr("example_packageid") }, .{ "packageorderuuid", h.vstr("example_packageorderuuid") }, .{ "reason_deactivation", h.vstr("example_reason_deactivation") }, .{ "reason_reactivation", h.vstr("example_reason_reactivation") }, .{ "street", h.vstr("example_street") }, .{ "terminal_country_code", h.vstr("example_terminal_country_code") }, .{ "terminal_language_code", h.vstr("example_terminal_language_code") }, .{ "terminal_location", h.vstr("example_terminal_location") }, .{ "terminal_serial_number", h.vstr("example_terminal_serial_number") }, .{ "terminalid", h.vnum(1) }, .{ "vu_nummer", h.vstr("example_vu_nummer") }, .{ "zipcode", h.vstr("example_zipcode") }}), h.vnull())) {
    .ok => |created| std.debug.print("{s}\n", .{h.stringify(created)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}

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

For endpoints not covered by entity methods:

```zig
const result = client.direct(h.jo(&.{
    .{ "path", h.vstr("/api/resource/{id}") },
    .{ "method", h.vstr("GET") },
    .{ "params", h.jo(&.{.{ "id", h.vstr("example") }}) },
}));

if (h.get_bool(result, "ok") orelse false) {
    std.debug.print("{d}\n", .{h.to_int(h.getp(result, "status"))}); // 200
    std.debug.print("{s}\n", .{h.stringify(h.getp(result, "data"))}); // response body
} else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present.
    std.debug.print("{s}\n", .{h.get_str(result, "err") orelse ""});
}
```

### Prepare a request without sending it

```zig
// prepare() returns the fetch definition (an error union — use `catch`/`try`).
const fetchdef = client.prepare(h.jo(&.{
    .{ "path", h.vstr("/api/resource/{id}") },
    .{ "method", h.vstr("DELETE") },
    .{ "params", h.jo(&.{.{ "id", h.vstr("example") }}) },
})) catch unreachable;

std.debug.print("{s}\n", .{h.get_str(fetchdef, "url") orelse ""});
std.debug.print("{s}\n", .{h.get_str(fetchdef, "method") orelse ""});
std.debug.print("{s}\n", .{h.stringify(h.getp(fetchdef, "headers"))});
```

### Use test mode

Create a mock client for unit testing — no server required:

```zig
const client = sdk.test_sdk(h.vnull(), h.vnull());

// Entity ops return an OpResult — .ok carries the record, .err the error.
switch (client.output_detail(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("test01") }}), h.vnull())) {
    .ok => |output_detail| std.debug.print("{s}\n", .{h.stringify(output_detail)}), // the mock record
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Point at a different server

Override the base URL to reach a local or staging server:

```zig
const client = sdk.BluefinTecsMerchantPortalSDK.new(h.jo(&.{
    .{ "base", h.vstr("http://localhost:8080") },
}));
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run:

```bash
cd zig && zig build test
```


## Reference

### BluefinTecsMerchantPortalSDK

```zig
const sdk = @import("sdk");
const h = sdk.h;

const client = sdk.BluefinTecsMerchantPortalSDK.new(options);
```

Creates a new SDK client. `options` is a `Value` map (`h.vnull()` for
none) carrying any of the following keys:

| Option | Value type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `system` | `map` | System overrides (e.g. a custom fetcher). |

### test_sdk

```zig
const client = sdk.test_sdk(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`h.vnull()`.

### BluefinTecsMerchantPortalSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() Value` | Deep copy of the current SDK options. |
| `get_utility` | `() *Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs: Value) E!Value` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs: Value) Value` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `merchant_portal_api_controller` | `(entopts: Value) *MerchantPortalApiControllerEntity` | Create a MerchantPortalApiController entity instance. |
| `merchant_portal_common_controller` | `(entopts: Value) *MerchantPortalCommonControllerEntity` | Create a MerchantPortalCommonController entity instance. |
| `merchant_portal_pam_contract_controller` | `(entopts: Value) *MerchantPortalPamContractControllerEntity` | Create a MerchantPortalPamContractController entity instance. |
| `merchant_portal_pam_document_controller` | `(entopts: Value) *MerchantPortalPamDocumentControllerEntity` | Create a MerchantPortalPamDocumentController entity instance. |
| `merchant_portal_pam_form_controller` | `(entopts: Value) *MerchantPortalPamFormControllerEntity` | Create a MerchantPortalPamFormController entity instance. |
| `merchant_portal_pam_mandator_controller` | `(entopts: Value) *MerchantPortalPamMandatorControllerEntity` | Create a MerchantPortalPamMandatorController entity instance. |
| `merchant_portal_pam_merchant_controller` | `(entopts: Value) *MerchantPortalPamMerchantControllerEntity` | Create a MerchantPortalPamMerchantController entity instance. |
| `merchant_portal_pam_package_controller` | `(entopts: Value) *MerchantPortalPamPackageControllerEntity` | Create a MerchantPortalPamPackageController entity instance. |
| `merchant_portal_pam_product_controller` | `(entopts: Value) *MerchantPortalPamProductControllerEntity` | Create a MerchantPortalPamProductController entity instance. |
| `output_add_product` | `(entopts: Value) *OutputAddProductEntity` | Create an OutputAddProduct entity instance. |
| `output_create_product` | `(entopts: Value) *OutputCreateProductEntity` | Create an OutputCreateProduct entity instance. |
| `output_detail` | `(entopts: Value) *OutputDetailEntity` | Create an OutputDetail entity instance. |
| `output_list` | `(entopts: Value) *OutputListEntity` | Create an OutputList entity instance. |
| `output_message` | `(entopts: Value) *OutputMessageEntity` | Create an OutputMessage entity instance. |
| `output_move_tid` | `(entopts: Value) *OutputMoveTidEntity` | Create an OutputMoveTid entity instance. |
| `output_remove_product` | `(entopts: Value) *OutputRemoveProductEntity` | Create an OutputRemoveProduct entity instance. |
| `output_start` | `(entopts: Value) *OutputStartEntity` | Create an OutputStart entity instance. |
| `output_status` | `(entopts: Value) *OutputStatusEntity` | Create an OutputStatus entity instance. |
| `output_update_product` | `(entopts: Value) *OutputUpdateProductEntity` | Create an OutputUpdateProduct entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch: Value, ctrl: Value) OpResult` | Load a single entity by match criteria. |
| `create` | `(reqdata: Value, ctrl: Value) OpResult` | Create a new entity. |
| `stream` | `(action: []const u8, args: Value, callopts: Value) []Value` | Run an op through the pipeline and materialise its result items. |
| `data` | `(args: ?Value) Value` | Get entity data (pass a map to set). |
| `matchv` | `(args: ?Value) Value` | Get entity match criteria (pass a map to set). |
| `get_name` | `() []const u8` | Return the entity name. |

### Result shape

Entity operations return an `OpResult` union — `switch` on it: `.ok`
carries the bare result data (a `Value` object for single-entity ops, a
`Value` array for `list`), `.err` carries the branded error pointer.

The `direct()` escape hatch returns a result `Value` map directly (no
error union) — even on a non-2xx response — that you branch on via
`h.get_bool(result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `number` | HTTP status code. |
| `headers` | `map` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `false` and `err` carries the error message.

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

Create an instance: `const merchant_portal_api_controller = client.merchant_portal_api_controller(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `i64` | Account number provided by the acquirer. |
| `additional_data` | `Value (object)` | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `[]const u8` | Merchant business registration number as stated in the company registry. |
| `city` | `[]const u8` | Merchant's address: city. |
| `corporateuuid` | `[]const u8` | Unique identifier for the corporate entity (UUID format). |
| `country` | `[]const u8` | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `[]const u8` | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `i64` | Merchant category code as defined by the payment network. |
| `merchant_email` | `[]const u8` | Merchant's email address for receiving notifications. |
| `merchant_name` | `[]const u8` | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | `[]const u8` | Merchant's phone number for notifications. |
| `packageid` | `[]const u8` | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | `[]const u8` | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | `[]const u8` | Merchant password for MPOS. |
| `productid` | `[]const u8` | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | `[]const u8` | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | `[]const u8` | Reason for terminal deactivation. |
| `reason_reactivation` | `[]const u8` | Reason for terminal reactivation. |
| `sorting_code` | `i64` | Sorting code provided by the acquirer. |
| `state` | `[]const u8` | Merchant's address: state. |
| `street` | `[]const u8` | Merchant's address: street and house number. |
| `terminal_country_code` | `[]const u8` | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `[]const u8` | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `[]const u8` | Physical or logical location of the terminal. |
| `terminal_serial_number` | `[]const u8` | Terminal serial number. |
| `terminalid` | `i64` | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `[]const u8` | Terminal ID as set by the acquirer (optional). |
| `user_email` | `[]const u8` | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `[]const u8` | Phone number of the user acting on behalf of the merchant. |
| `username` | `[]const u8` | Merchant username for MPOS. |
| `vu_nummer` | `[]const u8` | Merchant contract number with the acquirer. |
| `web_shop_url` | `[]const u8` | URL of the merchant's web shop. |
| `zipcode` | `[]const u8` | Merchant's address: postal code. |

#### Example: Create

```zig
switch (client.merchant_portal_api_controller(h.vnull()).create(h.jo(&.{
    .{ "business_reg_number", h.vstr("example_business_reg_number") }, // []const u8
    .{ "city", h.vstr("example_city") }, // []const u8
    .{ "country", h.vstr("example_country") }, // []const u8
    .{ "currency", h.vstr("example_currency") }, // []const u8
    .{ "merchant_category_code", h.vnum(1) }, // i64
    .{ "merchant_name", h.vstr("example_merchant_name") }, // []const u8
    .{ "packageid", h.vstr("example_packageid") }, // []const u8
    .{ "packageorderuuid", h.vstr("example_packageorderuuid") }, // []const u8
    .{ "reason_deactivation", h.vstr("example_reason_deactivation") }, // []const u8
    .{ "reason_reactivation", h.vstr("example_reason_reactivation") }, // []const u8
    .{ "street", h.vstr("example_street") }, // []const u8
    .{ "terminal_country_code", h.vstr("example_terminal_country_code") }, // []const u8
    .{ "terminal_language_code", h.vstr("example_terminal_language_code") }, // []const u8
    .{ "terminal_location", h.vstr("example_terminal_location") }, // []const u8
    .{ "terminal_serial_number", h.vstr("example_terminal_serial_number") }, // []const u8
    .{ "terminalid", h.vnum(1) }, // i64
    .{ "vu_nummer", h.vstr("example_vu_nummer") }, // []const u8
    .{ "zipcode", h.vstr("example_zipcode") }, // []const u8
}), h.vnull())) {
    .ok => |merchant_portal_api_controller| std.debug.print("{s}\n", .{h.stringify(merchant_portal_api_controller)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### MerchantPortalCommonController

Create an instance: `const merchant_portal_common_controller = client.merchant_portal_common_controller(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Example: Load

```zig
switch (client.merchant_portal_common_controller(h.vnull()).load(h.vnull(), h.vnull())) {
    .ok => |merchant_portal_common_controller| std.debug.print("{s}\n", .{h.stringify(merchant_portal_common_controller)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```


### MerchantPortalPamContractController

Create an instance: `const merchant_portal_pam_contract_controller = client.merchant_portal_pam_contract_controller(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `[]const u8` |  |
| `productOrderUUID` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.merchant_portal_pam_contract_controller(h.vnull()).create(h.jo(&.{
    .{ "language", h.vstr("example_language") }, // []const u8
    .{ "productOrderUUID", h.vstr("example_productOrderUUID") }, // []const u8
}), h.vnull())) {
    .ok => |merchant_portal_pam_contract_controller| std.debug.print("{s}\n", .{h.stringify(merchant_portal_pam_contract_controller)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### MerchantPortalPamDocumentController

Create an instance: `const merchant_portal_pam_document_controller = client.merchant_portal_pam_document_controller(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldDescUUID` | `[]const u8` |  |
| `packageOrderUUID` | `[]const u8` | UUID of the package order. |
| `productOrderUUID` | `[]const u8` | UUID of the product order. |

#### Example: Create

```zig
switch (client.merchant_portal_pam_document_controller(h.vnull()).create(h.jo(&.{
    .{ "appFormFieldDescUUID", h.vstr("example_appFormFieldDescUUID") }, // []const u8
}), h.vnull())) {
    .ok => |merchant_portal_pam_document_controller| std.debug.print("{s}\n", .{h.stringify(merchant_portal_pam_document_controller)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### MerchantPortalPamFormController

Create an instance: `const merchant_portal_pam_form_controller = client.merchant_portal_pam_form_controller(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldsDescUUID` | `[]const u8` |  |
| `filter` | `Value (object)` |  |
| `language` | `[]const u8` |  |
| `packageOrder` | `Value (object)` |  |
| `packageOrderUUID` | `[]const u8` | UUID of the package order. |
| `packageUUID` | `[]const u8` |  |
| `productOrderUUID` | `[]const u8` | UUID of the product order. |
| `productOrders` | `Value (array)` |  |
| `reasonOfReopening` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.merchant_portal_pam_form_controller(h.vnull()).create(h.jo(&.{
    .{ "appFormFieldsDescUUID", h.vstr("example_appFormFieldsDescUUID") }, // []const u8
    .{ "language", h.vstr("example_language") }, // []const u8
    .{ "packageOrderUUID", h.vstr("example_packageOrderUUID") }, // []const u8
    .{ "reasonOfReopening", h.vstr("example_reasonOfReopening") }, // []const u8
}), h.vnull())) {
    .ok => |merchant_portal_pam_form_controller| std.debug.print("{s}\n", .{h.stringify(merchant_portal_pam_form_controller)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### MerchantPortalPamMandatorController

Create an instance: `const merchant_portal_pam_mandator_controller = client.merchant_portal_pam_mandator_controller(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `clientSecret` | `[]const u8` |  |
| `mandatorName` | `[]const u8` |  |
| `notificationEmail` | `[]const u8` |  |
| `packageUUID` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.merchant_portal_pam_mandator_controller(h.vnull()).create(h.jo(&.{
    .{ "mandatorName", h.vstr("example_mandatorName") }, // []const u8
    .{ "packageUUID", h.vstr("example_packageUUID") }, // []const u8
}), h.vnull())) {
    .ok => |merchant_portal_pam_mandator_controller| std.debug.print("{s}\n", .{h.stringify(merchant_portal_pam_mandator_controller)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### MerchantPortalPamMerchantController

Create an instance: `const merchant_portal_pam_merchant_controller = client.merchant_portal_pam_merchant_controller(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `Value (object)` | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` | `[]const u8` |  |
| `city` | `[]const u8` | City where the merchant is located. |
| `companyName` | `[]const u8` |  |
| `corporateUUID` | `[]const u8` | Unique identifier for the corporate entity. |
| `country` | `[]const u8` | Country where the merchant is located. |
| `currency` | `[]const u8` | Transaction currency in ISO 4217 format. |
| `email` | `[]const u8` |  |
| `language` | `[]const u8` |  |
| `login` | `[]const u8` |  |
| `mandator` | `[]const u8` | Mandator name assigned by TECS. |
| `merchantContractNumber` | `[]const u8` | Unique identifier for the merchant within a specific system. |
| `merchantName` | `[]const u8` | Name of the merchant. |
| `merchant_category_code` | `[]const u8` | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | `[]const u8` | UUID of the package. |
| `packageorderuuid` | `[]const u8` | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` | `[]const u8` |  |
| `postalCode` | `[]const u8` | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | `[]const u8` | Identifier of the product for which acquiring is to be enabled. |
| `region` | `[]const u8` | State or province where the merchant is located. |
| `registrationNumber` | `[]const u8` | Business registration number. |
| `signature` | `[]const u8` | Signature value = saltAsHex-hashAsHex. |
| `street` | `[]const u8` | Street address of the merchant. |
| `terminalIds` | `Value (array)` | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `[]const u8` | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `[]const u8` | Merchant contract number with the acquirer. |

#### Example: Create

```zig
switch (client.merchant_portal_pam_merchant_controller(h.vnull()).create(h.jo(&.{
    .{ "businessRegistrationNumber", h.vstr("example_businessRegistrationNumber") }, // []const u8
    .{ "companyName", h.vstr("example_companyName") }, // []const u8
    .{ "corporateUUID", h.vstr("example_corporateUUID") }, // []const u8
    .{ "currency", h.vstr("example_currency") }, // []const u8
    .{ "email", h.vstr("example_email") }, // []const u8
    .{ "language", h.vstr("example_language") }, // []const u8
    .{ "login", h.vstr("example_login") }, // []const u8
    .{ "mandator", h.vstr("example_mandator") }, // []const u8
    .{ "merchantContractNumber", h.vstr("example_merchantContractNumber") }, // []const u8
    .{ "packageorderuuid", h.vstr("example_packageorderuuid") }, // []const u8
    .{ "phoneNumber", h.vstr("example_phoneNumber") }, // []const u8
    .{ "productid_acquirer", h.vstr("example_productid_acquirer") }, // []const u8
    .{ "vu_nummer", h.vstr("example_vu_nummer") }, // []const u8
}), h.vnull())) {
    .ok => |merchant_portal_pam_merchant_controller| std.debug.print("{s}\n", .{h.stringify(merchant_portal_pam_merchant_controller)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### MerchantPortalPamPackageController

Create an instance: `const merchant_portal_pam_package_controller = client.merchant_portal_pam_package_controller(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `[]const u8` |  |
| `corporateUUID` | `[]const u8` |  |
| `country` | `[]const u8` | Country associated with the package. |
| `descriptionKey` | `[]const u8` | Key for the description of the package. |
| `filter` | `Value (object)` |  |
| `language` | `[]const u8` |  |
| `nameKey` | `[]const u8` | Key for the name of the package. |
| `packageStatus` | `[]const u8` | Status of the package. |
| `packageUUID` | `[]const u8` | Unique identifier for the package. |
| `pagination` | `Value (object)` |  |
| `sorting` | `Value (object)` |  |

#### Example: Create

```zig
switch (client.merchant_portal_pam_package_controller(h.vnull()).create(h.jo(&.{
    .{ "language", h.vstr("example_language") }, // []const u8
    .{ "packageUUID", h.vstr("example_packageUUID") }, // []const u8
}), h.vnull())) {
    .ok => |merchant_portal_pam_package_controller| std.debug.print("{s}\n", .{h.stringify(merchant_portal_pam_package_controller)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### MerchantPortalPamProductController

Create an instance: `const merchant_portal_pam_product_controller = client.merchant_portal_pam_product_controller(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `[]const u8` |  |
| `filter` | `Value (object)` |  |
| `language` | `[]const u8` |  |
| `merchantID` | `[]const u8` |  |
| `packageOrderUUID` | `[]const u8` |  |
| `pagination` | `Value (object)` |  |
| `productOrderUUID` | `[]const u8` |  |
| `productUUID` | `[]const u8` |  |
| `reason_decline` | `[]const u8` | Reason for product decline. |
| `sorting` | `Value (object)` |  |

#### Example: Create

```zig
switch (client.merchant_portal_pam_product_controller(h.vnull()).create(h.jo(&.{
    .{ "packageOrderUUID", h.vstr("example_packageOrderUUID") }, // []const u8
    .{ "productOrderUUID", h.vstr("example_productOrderUUID") }, // []const u8
    .{ "productUUID", h.vstr("example_productUUID") }, // []const u8
    .{ "reason_decline", h.vstr("example_reason_decline") }, // []const u8
}), h.vnull())) {
    .ok => |merchant_portal_pam_product_controller| std.debug.print("{s}\n", .{h.stringify(merchant_portal_pam_product_controller)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### OutputAddProduct

Create an instance: `const output_add_product = client.output_add_product(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `[]const u8` | Unique identifier for the package. |
| `productUUIDs` | `Value (array)` | The list of unique identifiers of the products. |
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `[]const u8` | Response message. |

#### Example: Create

```zig
switch (client.output_add_product(h.vnull()).create(h.jo(&.{
    .{ "packageUUID", h.vstr("example_packageUUID") }, // []const u8
    .{ "productUUIDs", h.olist() }, // Value (array)
    .{ "responseCode", h.vnum(1) }, // i64
    .{ "responseMessage", h.vstr("example_responseMessage") }, // []const u8
}), h.vnull())) {
    .ok => |output_add_product| std.debug.print("{s}\n", .{h.stringify(output_add_product)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### OutputCreateProduct

Create an instance: `const output_create_product = client.output_create_product(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirerId` | `[]const u8` | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `bool` | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `[]const u8` | Name of the application form template. |
| `contractNeeded` | `bool` | Indication whether contract is needed or not. |
| `credentialsNeeded` | `bool` | Indication whether credentials are needed or not. |
| `descriptionKey` | `[]const u8` | Key indicator for product description. |
| `nameKey` | `[]const u8` | Key indicator for product name. |
| `prescreeningAllowed` | `bool` | Indication whether prescreening is allowed or not. |
| `productName` | `[]const u8` | Name of the product. |
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `[]const u8` | Response message. |
| `terminalTemplateName` | `[]const u8` | Name of the terminal template. |
| `vendorName` | `[]const u8` | Name of the vendor. |
| `xmlTemplateFile` | `[]const u8` | A string value containing the XML template file encoded in Base64. |

#### Example: Create

```zig
switch (client.output_create_product(h.vnull()).create(h.jo(&.{
    .{ "allowMultipleOrders", h.vbool(true) }, // bool
    .{ "appFormTemplateName", h.vstr("example_appFormTemplateName") }, // []const u8
    .{ "contractNeeded", h.vbool(true) }, // bool
    .{ "descriptionKey", h.vstr("example_descriptionKey") }, // []const u8
    .{ "nameKey", h.vstr("example_nameKey") }, // []const u8
    .{ "prescreeningAllowed", h.vbool(true) }, // bool
    .{ "productName", h.vstr("example_productName") }, // []const u8
    .{ "responseCode", h.vnum(1) }, // i64
    .{ "responseMessage", h.vstr("example_responseMessage") }, // []const u8
    .{ "terminalTemplateName", h.vstr("example_terminalTemplateName") }, // []const u8
    .{ "vendorName", h.vstr("example_vendorName") }, // []const u8
    .{ "xmlTemplateFile", h.vstr("example_xmlTemplateFile") }, // []const u8
}), h.vnull())) {
    .ok => |output_create_product| std.debug.print("{s}\n", .{h.stringify(output_create_product)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### OutputDetail

Create an instance: `const output_detail = client.output_detail(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `batch` | `Value (object)` |  |
| `lines` | `Value (object)` |  |
| `progress` | `Value (object)` |  |

#### Example: Load

```zig
switch (client.output_detail(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("output_detail_id") }}), h.vnull())) {
    .ok => |output_detail| std.debug.print("{s}\n", .{h.stringify(output_detail)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```


### OutputList

Create an instance: `const output_list = client.output_list(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `items` | `Value (array)` |  |
| `pagination` | `Value (object)` |  |
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `[]const u8` | Response message. |
| `sorting` | `Value (object)` |  |

#### Example: Create

```zig
switch (client.output_list(h.vnull()).create(h.jo(&.{
    .{ "pagination", h.omap() }, // Value (object)
    .{ "responseCode", h.vnum(1) }, // i64
    .{ "responseMessage", h.vstr("example_responseMessage") }, // []const u8
}), h.vnull())) {
    .ok => |output_list| std.debug.print("{s}\n", .{h.stringify(output_list)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### OutputMessage

Create an instance: `const output_message = client.output_message(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `[]const u8` | Response message. |

#### Example: Load

```zig
switch (client.output_message(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("output_message_id") }}), h.vnull())) {
    .ok => |output_message| std.debug.print("{s}\n", .{h.stringify(output_message)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```


### OutputMoveTid

Create an instance: `const output_move_tid = client.output_move_tid(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `productOrderUUIDs` | `Value (array)` |  |
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `[]const u8` | Response message. |
| `targetPackageOrderUUID` | `[]const u8` |  |
| `targetProductOrderUUID` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.output_move_tid(h.vnull()).create(h.jo(&.{
    .{ "productOrderUUIDs", h.olist() }, // Value (array)
    .{ "responseCode", h.vnum(1) }, // i64
    .{ "responseMessage", h.vstr("example_responseMessage") }, // []const u8
    .{ "targetPackageOrderUUID", h.vstr("example_targetPackageOrderUUID") }, // []const u8
    .{ "targetProductOrderUUID", h.vstr("example_targetProductOrderUUID") }, // []const u8
}), h.vnull())) {
    .ok => |output_move_tid| std.debug.print("{s}\n", .{h.stringify(output_move_tid)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### OutputRemoveProduct

Create an instance: `const output_remove_product = client.output_remove_product(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `[]const u8` | Unique identifier for the package. |
| `productUUIDs` | `Value (array)` | List of product unique identifiers. |
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `[]const u8` | Response message. |

#### Example: Create

```zig
switch (client.output_remove_product(h.vnull()).create(h.jo(&.{
    .{ "packageUUID", h.vstr("example_packageUUID") }, // []const u8
    .{ "productUUIDs", h.olist() }, // Value (array)
    .{ "responseCode", h.vnum(1) }, // i64
    .{ "responseMessage", h.vstr("example_responseMessage") }, // []const u8
}), h.vnull())) {
    .ok => |output_remove_product| std.debug.print("{s}\n", .{h.stringify(output_remove_product)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### OutputStart

Create an instance: `const output_start = client.output_start(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `[]const u8` |  |
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `[]const u8` | Response message. |

#### Example: Create

```zig
switch (client.output_start(h.vnull()).create(h.jo(&.{
    .{ "responseCode", h.vnum(1) }, // i64
    .{ "responseMessage", h.vstr("example_responseMessage") }, // []const u8
}), h.vnull())) {
    .ok => |output_start| std.debug.print("{s}\n", .{h.stringify(output_start)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### OutputStatus

Create an instance: `const output_status = client.output_status(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `i64` |  |
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `[]const u8` | Response message. |
| `status` | `[]const u8` |  |

#### Example: Load

```zig
switch (client.output_status(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("output_status_id") }}), h.vnull())) {
    .ok => |output_status| std.debug.print("{s}\n", .{h.stringify(output_status)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```


### OutputUpdateProduct

Create an instance: `const output_update_product = client.output_update_product(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allowMultipleOrders` | `bool` | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `[]const u8` | The name of the application form |
| `contractNeeded` | `bool` | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `bool` | An attribute to indicate if credentials are needed |
| `descriptionKey` | `[]const u8` | The description of the product |
| `nameKey` | `[]const u8` | The key of the product name |
| `prescreeningAllowed` | `bool` | An attribute to indicate if prescreening is allowed |
| `productName` | `[]const u8` | The name of the product |
| `productStatus` | `[]const u8` | The status of the product |
| `productUUID` | `[]const u8` | The UUID of the product to update |
| `responseCode` | `i64` | Response code. |
| `responseMessage` | `[]const u8` | Response message. |
| `vendorName` | `[]const u8` | The name of the vendor |

#### Example: Create

```zig
switch (client.output_update_product(h.vnull()).create(h.jo(&.{
    .{ "productUUID", h.vstr("example_productUUID") }, // []const u8
    .{ "responseCode", h.vnum(1) }, // i64
    .{ "responseMessage", h.vstr("example_responseMessage") }, // []const u8
}), h.vnull())) {
    .ok => |output_update_product| std.debug.print("{s}\n", .{h.stringify(output_update_product)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
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

### Data as `Value`

The Zig SDK uses a single dynamic `Value` type throughout rather than a
typed struct per entity. `Value` is the vendored voxgig struct port's
`JsonValue` (a JSON-shaped tagged union: `.string`, `.integer`,
`.float`, `.bool`, `.array`, `.object`, `.null`). This mirrors the
dynamic nature of the API and keeps the SDK flexible — no code generation is
needed when the API schema changes.

Build request maps with the `h.jo` / `h.ja` helpers and read fields back
with `h.getp` (or the typed `h.get_str` / `h.get_bool` / `h.to_int`
accessors); use `h.to_map` to safely coerce a value to a map.

### Module structure

```
zig/
├── root.zig                     -- Module root (re-exports the public surface)
├── build.zig                    -- Build + test wiring
├── core/                        -- Pipeline types, config, client (sdk.zig)
├── entity/                      -- Per-entity clients (one file each)
├── feature/                     -- Built-in features (base, test, log)
├── utility/                     -- Utilities + the vendored voxgig struct port
└── test/                        -- Test suites
```

The public API is re-exported from `root.zig`, so `@import("sdk")` reaches
the SDK client, `Value`, and the `h` (helpers) namespace directly. Import
entity or utility modules only when needed.

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
