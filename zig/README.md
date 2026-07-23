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
| `account_number` | `i64` |  |
| `additional_data` | `Value (object)` |  |
| `business_reg_number` | `[]const u8` |  |
| `city` | `[]const u8` |  |
| `corporateuuid` | `[]const u8` |  |
| `country` | `[]const u8` |  |
| `currency` | `[]const u8` |  |
| `merchant_category_code` | `i64` |  |
| `merchant_email` | `[]const u8` |  |
| `merchant_name` | `[]const u8` |  |
| `merchant_phone_number` | `[]const u8` |  |
| `packageid` | `[]const u8` |  |
| `packageorderuuid` | `[]const u8` |  |
| `password` | `[]const u8` |  |
| `productid` | `[]const u8` |  |
| `productid_acquirer` | `[]const u8` |  |
| `reason_deactivation` | `[]const u8` |  |
| `reason_reactivation` | `[]const u8` |  |
| `sorting_code` | `i64` |  |
| `state` | `[]const u8` |  |
| `street` | `[]const u8` |  |
| `terminal_country_code` | `[]const u8` |  |
| `terminal_language_code` | `[]const u8` |  |
| `terminal_location` | `[]const u8` |  |
| `terminal_serial_number` | `[]const u8` |  |
| `terminalid` | `i64` |  |
| `terminalid_acquirer` | `[]const u8` |  |
| `user_email` | `[]const u8` |  |
| `user_phone_number` | `[]const u8` |  |
| `username` | `[]const u8` |  |
| `vu_nummer` | `[]const u8` |  |
| `web_shop_url` | `[]const u8` |  |
| `zipcode` | `[]const u8` |  |

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
| `product_order_uuid` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.merchant_portal_pam_contract_controller(h.vnull()).create(h.jo(&.{
    .{ "language", h.vstr("example_language") }, // []const u8
    .{ "product_order_uuid", h.vstr("example_product_order_uuid") }, // []const u8
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
| `app_form_field_desc_uuid` | `[]const u8` |  |
| `package_order_uuid` | `[]const u8` |  |
| `product_order_uuid` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.merchant_portal_pam_document_controller(h.vnull()).create(h.jo(&.{
    .{ "app_form_field_desc_uuid", h.vstr("example_app_form_field_desc_uuid") }, // []const u8
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
| `app_form_fields_desc_uuid` | `[]const u8` |  |
| `filter` | `Value (object)` |  |
| `language` | `[]const u8` |  |
| `package_order` | `Value (object)` |  |
| `package_order_uuid` | `[]const u8` |  |
| `package_uuid` | `[]const u8` |  |
| `product_order` | `Value (array)` |  |
| `product_order_uuid` | `[]const u8` |  |
| `reason_of_reopening` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.merchant_portal_pam_form_controller(h.vnull()).create(h.jo(&.{
    .{ "app_form_fields_desc_uuid", h.vstr("example_app_form_fields_desc_uuid") }, // []const u8
    .{ "language", h.vstr("example_language") }, // []const u8
    .{ "package_order_uuid", h.vstr("example_package_order_uuid") }, // []const u8
    .{ "reason_of_reopening", h.vstr("example_reason_of_reopening") }, // []const u8
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
| `client_secret` | `[]const u8` |  |
| `mandator_name` | `[]const u8` |  |
| `notification_email` | `[]const u8` |  |
| `package_uuid` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.merchant_portal_pam_mandator_controller(h.vnull()).create(h.jo(&.{
    .{ "mandator_name", h.vstr("example_mandator_name") }, // []const u8
    .{ "package_uuid", h.vstr("example_package_uuid") }, // []const u8
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
| `additional_data` | `Value (object)` |  |
| `business_registration_number` | `[]const u8` |  |
| `city` | `[]const u8` |  |
| `company_name` | `[]const u8` |  |
| `corporate_uuid` | `[]const u8` |  |
| `country` | `[]const u8` |  |
| `currency` | `[]const u8` |  |
| `email` | `[]const u8` |  |
| `language` | `[]const u8` |  |
| `login` | `[]const u8` |  |
| `mandator` | `[]const u8` |  |
| `merchant_category_code` | `[]const u8` |  |
| `merchant_contract_number` | `[]const u8` |  |
| `merchant_name` | `[]const u8` |  |
| `package_uuid` | `[]const u8` |  |
| `packageorderuuid` | `[]const u8` |  |
| `phone_number` | `[]const u8` |  |
| `postal_code` | `[]const u8` |  |
| `productid_acquirer` | `[]const u8` |  |
| `region` | `[]const u8` |  |
| `registration_number` | `[]const u8` |  |
| `signature` | `[]const u8` |  |
| `street` | `[]const u8` |  |
| `terminal_id` | `Value (array)` |  |
| `terminalid_acquirer` | `[]const u8` |  |
| `vu_nummer` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.merchant_portal_pam_merchant_controller(h.vnull()).create(h.jo(&.{
    .{ "business_registration_number", h.vstr("example_business_registration_number") }, // []const u8
    .{ "company_name", h.vstr("example_company_name") }, // []const u8
    .{ "corporate_uuid", h.vstr("example_corporate_uuid") }, // []const u8
    .{ "currency", h.vstr("example_currency") }, // []const u8
    .{ "email", h.vstr("example_email") }, // []const u8
    .{ "language", h.vstr("example_language") }, // []const u8
    .{ "login", h.vstr("example_login") }, // []const u8
    .{ "mandator", h.vstr("example_mandator") }, // []const u8
    .{ "merchant_contract_number", h.vstr("example_merchant_contract_number") }, // []const u8
    .{ "packageorderuuid", h.vstr("example_packageorderuuid") }, // []const u8
    .{ "phone_number", h.vstr("example_phone_number") }, // []const u8
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
| `consumer_uuid` | `[]const u8` |  |
| `corporate_uuid` | `[]const u8` |  |
| `country` | `[]const u8` |  |
| `description_key` | `[]const u8` |  |
| `filter` | `Value (object)` |  |
| `language` | `[]const u8` |  |
| `name_key` | `[]const u8` |  |
| `package_status` | `[]const u8` |  |
| `package_uuid` | `[]const u8` |  |
| `pagination` | `Value (object)` |  |
| `sorting` | `Value (object)` |  |

#### Example: Create

```zig
switch (client.merchant_portal_pam_package_controller(h.vnull()).create(h.jo(&.{
    .{ "language", h.vstr("example_language") }, // []const u8
    .{ "package_uuid", h.vstr("example_package_uuid") }, // []const u8
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
| `consumer_uuid` | `[]const u8` |  |
| `filter` | `Value (object)` |  |
| `language` | `[]const u8` |  |
| `merchant_id` | `[]const u8` |  |
| `package_order_uuid` | `[]const u8` |  |
| `pagination` | `Value (object)` |  |
| `product_order_uuid` | `[]const u8` |  |
| `product_uuid` | `[]const u8` |  |
| `reason_decline` | `[]const u8` |  |
| `sorting` | `Value (object)` |  |

#### Example: Create

```zig
switch (client.merchant_portal_pam_product_controller(h.vnull()).create(h.jo(&.{
    .{ "package_order_uuid", h.vstr("example_package_order_uuid") }, // []const u8
    .{ "product_order_uuid", h.vstr("example_product_order_uuid") }, // []const u8
    .{ "product_uuid", h.vstr("example_product_uuid") }, // []const u8
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
| `package_uuid` | `[]const u8` |  |
| `product_uui_d` | `Value (array)` |  |
| `response_code` | `i64` |  |
| `response_message` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.output_add_product(h.vnull()).create(h.jo(&.{
    .{ "package_uuid", h.vstr("example_package_uuid") }, // []const u8
    .{ "product_uui_d", h.olist() }, // Value (array)
    .{ "response_code", h.vnum(1) }, // i64
    .{ "response_message", h.vstr("example_response_message") }, // []const u8
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
| `acquirer_id` | `[]const u8` |  |
| `allow_multiple_order` | `bool` |  |
| `app_form_template_name` | `[]const u8` |  |
| `contract_needed` | `bool` |  |
| `credentials_needed` | `bool` |  |
| `description_key` | `[]const u8` |  |
| `name_key` | `[]const u8` |  |
| `prescreening_allowed` | `bool` |  |
| `product_name` | `[]const u8` |  |
| `response_code` | `i64` |  |
| `response_message` | `[]const u8` |  |
| `terminal_template_name` | `[]const u8` |  |
| `vendor_name` | `[]const u8` |  |
| `xml_template_file` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.output_create_product(h.vnull()).create(h.jo(&.{
    .{ "allow_multiple_order", h.vbool(true) }, // bool
    .{ "app_form_template_name", h.vstr("example_app_form_template_name") }, // []const u8
    .{ "contract_needed", h.vbool(true) }, // bool
    .{ "description_key", h.vstr("example_description_key") }, // []const u8
    .{ "name_key", h.vstr("example_name_key") }, // []const u8
    .{ "prescreening_allowed", h.vbool(true) }, // bool
    .{ "product_name", h.vstr("example_product_name") }, // []const u8
    .{ "response_code", h.vnum(1) }, // i64
    .{ "response_message", h.vstr("example_response_message") }, // []const u8
    .{ "terminal_template_name", h.vstr("example_terminal_template_name") }, // []const u8
    .{ "vendor_name", h.vstr("example_vendor_name") }, // []const u8
    .{ "xml_template_file", h.vstr("example_xml_template_file") }, // []const u8
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
| `detail` | `Value (object)` |  |
| `response_code` | `i64` |  |
| `response_message` | `[]const u8` |  |

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
| `item` | `Value (array)` |  |
| `pagination` | `Value (object)` |  |
| `response_code` | `i64` |  |
| `response_message` | `[]const u8` |  |
| `sorting` | `Value (object)` |  |

#### Example: Create

```zig
switch (client.output_list(h.vnull()).create(h.jo(&.{
    .{ "pagination", h.omap() }, // Value (object)
    .{ "response_code", h.vnum(1) }, // i64
    .{ "response_message", h.vstr("example_response_message") }, // []const u8
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
| `response_code` | `i64` |  |
| `response_message` | `[]const u8` |  |

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
| `product_order_uui_d` | `Value (array)` |  |
| `response_code` | `i64` |  |
| `response_message` | `[]const u8` |  |
| `target_package_order_uuid` | `[]const u8` |  |
| `target_product_order_uuid` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.output_move_tid(h.vnull()).create(h.jo(&.{
    .{ "product_order_uui_d", h.olist() }, // Value (array)
    .{ "response_code", h.vnum(1) }, // i64
    .{ "response_message", h.vstr("example_response_message") }, // []const u8
    .{ "target_package_order_uuid", h.vstr("example_target_package_order_uuid") }, // []const u8
    .{ "target_product_order_uuid", h.vstr("example_target_product_order_uuid") }, // []const u8
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
| `package_uuid` | `[]const u8` |  |
| `product_uui_d` | `Value (array)` |  |
| `response_code` | `i64` |  |
| `response_message` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.output_remove_product(h.vnull()).create(h.jo(&.{
    .{ "package_uuid", h.vstr("example_package_uuid") }, // []const u8
    .{ "product_uui_d", h.olist() }, // Value (array)
    .{ "response_code", h.vnum(1) }, // i64
    .{ "response_message", h.vstr("example_response_message") }, // []const u8
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
| `response_code` | `i64` |  |
| `response_message` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.output_start(h.vnull()).create(h.jo(&.{
    .{ "response_code", h.vnum(1) }, // i64
    .{ "response_message", h.vstr("example_response_message") }, // []const u8
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
| `response_code` | `i64` |  |
| `response_message` | `[]const u8` |  |
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
| `allow_multiple_order` | `bool` |  |
| `app_form_name` | `[]const u8` |  |
| `contract_needed` | `bool` |  |
| `credentials_needed` | `bool` |  |
| `description_key` | `[]const u8` |  |
| `name_key` | `[]const u8` |  |
| `prescreening_allowed` | `bool` |  |
| `product_name` | `[]const u8` |  |
| `product_status` | `[]const u8` |  |
| `product_uuid` | `[]const u8` |  |
| `response_code` | `i64` |  |
| `response_message` | `[]const u8` |  |
| `vendor_name` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.output_update_product(h.vnull()).create(h.jo(&.{
    .{ "product_uuid", h.vstr("example_product_uuid") }, // []const u8
    .{ "response_code", h.vnum(1) }, // i64
    .{ "response_message", h.vstr("example_response_message") }, // []const u8
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
