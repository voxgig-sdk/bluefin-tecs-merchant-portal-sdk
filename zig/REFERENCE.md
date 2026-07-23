# BluefinTecsMerchantPortal Zig SDK Reference

Complete API reference for the BluefinTecsMerchantPortal Zig SDK.


## BluefinTecsMerchantPortalSDK

### Constructor

```zig
const sdk = @import("sdk");
const h = sdk.h;

const client = sdk.BluefinTecsMerchantPortalSDK.new(options);
```

Create a new SDK client instance. `options` is a `Value` map
(`h.vnull()` for none).

**Parameters:**

| Key | Value type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides. |


### Static Functions

#### `test_sdk(testopts: Value, sdkopts: Value) *BluefinTecsMerchantPortalSDK`

Create a test client with mock features active. Both arguments may be
`h.vnull()`.

```zig
const client = sdk.test_sdk(h.vnull(), h.vnull());
```


### Instance Methods

#### `merchant_portal_api_controller(entopts: Value) *MerchantPortalApiControllerEntity`

Create a new `MerchantPortalApiControllerEntity` instance. Pass `h.vnull()` for no
initial options.

#### `merchant_portal_common_controller(entopts: Value) *MerchantPortalCommonControllerEntity`

Create a new `MerchantPortalCommonControllerEntity` instance. Pass `h.vnull()` for no
initial options.

#### `merchant_portal_pam_contract_controller(entopts: Value) *MerchantPortalPamContractControllerEntity`

Create a new `MerchantPortalPamContractControllerEntity` instance. Pass `h.vnull()` for no
initial options.

#### `merchant_portal_pam_document_controller(entopts: Value) *MerchantPortalPamDocumentControllerEntity`

Create a new `MerchantPortalPamDocumentControllerEntity` instance. Pass `h.vnull()` for no
initial options.

#### `merchant_portal_pam_form_controller(entopts: Value) *MerchantPortalPamFormControllerEntity`

Create a new `MerchantPortalPamFormControllerEntity` instance. Pass `h.vnull()` for no
initial options.

#### `merchant_portal_pam_mandator_controller(entopts: Value) *MerchantPortalPamMandatorControllerEntity`

Create a new `MerchantPortalPamMandatorControllerEntity` instance. Pass `h.vnull()` for no
initial options.

#### `merchant_portal_pam_merchant_controller(entopts: Value) *MerchantPortalPamMerchantControllerEntity`

Create a new `MerchantPortalPamMerchantControllerEntity` instance. Pass `h.vnull()` for no
initial options.

#### `merchant_portal_pam_package_controller(entopts: Value) *MerchantPortalPamPackageControllerEntity`

Create a new `MerchantPortalPamPackageControllerEntity` instance. Pass `h.vnull()` for no
initial options.

#### `merchant_portal_pam_product_controller(entopts: Value) *MerchantPortalPamProductControllerEntity`

Create a new `MerchantPortalPamProductControllerEntity` instance. Pass `h.vnull()` for no
initial options.

#### `output_add_product(entopts: Value) *OutputAddProductEntity`

Create a new `OutputAddProductEntity` instance. Pass `h.vnull()` for no
initial options.

#### `output_create_product(entopts: Value) *OutputCreateProductEntity`

Create a new `OutputCreateProductEntity` instance. Pass `h.vnull()` for no
initial options.

#### `output_detail(entopts: Value) *OutputDetailEntity`

Create a new `OutputDetailEntity` instance. Pass `h.vnull()` for no
initial options.

#### `output_list(entopts: Value) *OutputListEntity`

Create a new `OutputListEntity` instance. Pass `h.vnull()` for no
initial options.

#### `output_message(entopts: Value) *OutputMessageEntity`

Create a new `OutputMessageEntity` instance. Pass `h.vnull()` for no
initial options.

#### `output_move_tid(entopts: Value) *OutputMoveTidEntity`

Create a new `OutputMoveTidEntity` instance. Pass `h.vnull()` for no
initial options.

#### `output_remove_product(entopts: Value) *OutputRemoveProductEntity`

Create a new `OutputRemoveProductEntity` instance. Pass `h.vnull()` for no
initial options.

#### `output_start(entopts: Value) *OutputStartEntity`

Create a new `OutputStartEntity` instance. Pass `h.vnull()` for no
initial options.

#### `output_status(entopts: Value) *OutputStatusEntity`

Create a new `OutputStatusEntity` instance. Pass `h.vnull()` for no
initial options.

#### `output_update_product(entopts: Value) *OutputUpdateProductEntity`

Create a new `OutputUpdateProductEntity` instance. Pass `h.vnull()` for no
initial options.

#### `options_map() Value`

Return a deep copy of the current SDK options.

#### `get_utility() *Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs: Value) Value`

Make a direct HTTP request to any API endpoint. Returns a result `Value`
map with `ok`, `status`, `headers`, and `data` (or `err` on failure).
This escape hatch returns a map even on a non-2xx response — branch on
`h.get_bool(result, "ok")`.

**Parameters (`fetchargs` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

#### `prepare(fetchargs: Value) E!Value`

Prepare a fetch definition without sending. Returns the fetchdef (use
`catch`/`try` to handle the error union).


---

## MerchantPortalApiControllerEntity

```zig
const merchant_portal_api_controller = client.merchant_portal_api_controller(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `i64` | No |  |
| `additional_data` | `Value (object)` | No |  |
| `business_reg_number` | `[]const u8` | Yes |  |
| `city` | `[]const u8` | Yes |  |
| `corporateuuid` | `[]const u8` | No |  |
| `country` | `[]const u8` | Yes |  |
| `currency` | `[]const u8` | Yes |  |
| `merchant_category_code` | `i64` | Yes |  |
| `merchant_email` | `[]const u8` | No |  |
| `merchant_name` | `[]const u8` | Yes |  |
| `merchant_phone_number` | `[]const u8` | No |  |
| `packageid` | `[]const u8` | Yes |  |
| `packageorderuuid` | `[]const u8` | Yes |  |
| `password` | `[]const u8` | No |  |
| `productid` | `[]const u8` | No |  |
| `productid_acquirer` | `[]const u8` | No |  |
| `reason_deactivation` | `[]const u8` | Yes |  |
| `reason_reactivation` | `[]const u8` | Yes |  |
| `sorting_code` | `i64` | No |  |
| `state` | `[]const u8` | No |  |
| `street` | `[]const u8` | Yes |  |
| `terminal_country_code` | `[]const u8` | Yes |  |
| `terminal_language_code` | `[]const u8` | Yes |  |
| `terminal_location` | `[]const u8` | Yes |  |
| `terminal_serial_number` | `[]const u8` | Yes |  |
| `terminalid` | `i64` | Yes |  |
| `terminalid_acquirer` | `[]const u8` | No |  |
| `user_email` | `[]const u8` | No |  |
| `user_phone_number` | `[]const u8` | No |  |
| `username` | `[]const u8` | No |  |
| `vu_nummer` | `[]const u8` | Yes |  |
| `web_shop_url` | `[]const u8` | No |  |
| `zipcode` | `[]const u8` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

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
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## MerchantPortalCommonControllerEntity

```zig
const merchant_portal_common_controller = client.merchant_portal_common_controller(h.vnull());
```

### Operations

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.merchant_portal_common_controller(h.vnull()).load(h.vnull(), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## MerchantPortalPamContractControllerEntity

```zig
const merchant_portal_pam_contract_controller = client.merchant_portal_pam_contract_controller(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `[]const u8` | Yes |  |
| `product_order_uuid` | `[]const u8` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.merchant_portal_pam_contract_controller(h.vnull()).create(h.jo(&.{
    .{ "language", h.vstr("example_language") }, // []const u8
    .{ "product_order_uuid", h.vstr("example_product_order_uuid") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## MerchantPortalPamDocumentControllerEntity

```zig
const merchant_portal_pam_document_controller = client.merchant_portal_pam_document_controller(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_field_desc_uuid` | `[]const u8` | Yes |  |
| `package_order_uuid` | `[]const u8` | No |  |
| `product_order_uuid` | `[]const u8` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.merchant_portal_pam_document_controller(h.vnull()).create(h.jo(&.{
    .{ "app_form_field_desc_uuid", h.vstr("example_app_form_field_desc_uuid") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## MerchantPortalPamFormControllerEntity

```zig
const merchant_portal_pam_form_controller = client.merchant_portal_pam_form_controller(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_fields_desc_uuid` | `[]const u8` | Yes |  |
| `filter` | `Value (object)` | No |  |
| `language` | `[]const u8` | Yes |  |
| `package_order` | `Value (object)` | No |  |
| `package_order_uuid` | `[]const u8` | Yes |  |
| `package_uuid` | `[]const u8` | No |  |
| `product_order` | `Value (array)` | No |  |
| `product_order_uuid` | `[]const u8` | No |  |
| `reason_of_reopening` | `[]const u8` | Yes |  |

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

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.merchant_portal_pam_form_controller(h.vnull()).create(h.jo(&.{
    .{ "app_form_fields_desc_uuid", h.vstr("example_app_form_fields_desc_uuid") }, // []const u8
    .{ "language", h.vstr("example_language") }, // []const u8
    .{ "package_order_uuid", h.vstr("example_package_order_uuid") }, // []const u8
    .{ "reason_of_reopening", h.vstr("example_reason_of_reopening") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## MerchantPortalPamMandatorControllerEntity

```zig
const merchant_portal_pam_mandator_controller = client.merchant_portal_pam_mandator_controller(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client_secret` | `[]const u8` | No |  |
| `mandator_name` | `[]const u8` | Yes |  |
| `notification_email` | `[]const u8` | No |  |
| `package_uuid` | `[]const u8` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.merchant_portal_pam_mandator_controller(h.vnull()).create(h.jo(&.{
    .{ "mandator_name", h.vstr("example_mandator_name") }, // []const u8
    .{ "package_uuid", h.vstr("example_package_uuid") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## MerchantPortalPamMerchantControllerEntity

```zig
const merchant_portal_pam_merchant_controller = client.merchant_portal_pam_merchant_controller(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `Value (object)` | No |  |
| `business_registration_number` | `[]const u8` | Yes |  |
| `city` | `[]const u8` | No |  |
| `company_name` | `[]const u8` | Yes |  |
| `corporate_uuid` | `[]const u8` | Yes |  |
| `country` | `[]const u8` | No |  |
| `currency` | `[]const u8` | Yes |  |
| `email` | `[]const u8` | Yes |  |
| `language` | `[]const u8` | Yes |  |
| `login` | `[]const u8` | Yes |  |
| `mandator` | `[]const u8` | Yes |  |
| `merchant_category_code` | `[]const u8` | No |  |
| `merchant_contract_number` | `[]const u8` | Yes |  |
| `merchant_name` | `[]const u8` | No |  |
| `package_uuid` | `[]const u8` | No |  |
| `packageorderuuid` | `[]const u8` | Yes |  |
| `phone_number` | `[]const u8` | Yes |  |
| `postal_code` | `[]const u8` | No |  |
| `productid_acquirer` | `[]const u8` | Yes |  |
| `region` | `[]const u8` | No |  |
| `registration_number` | `[]const u8` | No |  |
| `signature` | `[]const u8` | No |  |
| `street` | `[]const u8` | No |  |
| `terminal_id` | `Value (array)` | No |  |
| `terminalid_acquirer` | `[]const u8` | No |  |
| `vu_nummer` | `[]const u8` | Yes |  |

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

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

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
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## MerchantPortalPamPackageControllerEntity

```zig
const merchant_portal_pam_package_controller = client.merchant_portal_pam_package_controller(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `[]const u8` | No |  |
| `corporate_uuid` | `[]const u8` | No |  |
| `country` | `[]const u8` | No |  |
| `description_key` | `[]const u8` | No |  |
| `filter` | `Value (object)` | No |  |
| `language` | `[]const u8` | Yes |  |
| `name_key` | `[]const u8` | No |  |
| `package_status` | `[]const u8` | No |  |
| `package_uuid` | `[]const u8` | Yes |  |
| `pagination` | `Value (object)` | No |  |
| `sorting` | `Value (object)` | No |  |

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

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.merchant_portal_pam_package_controller(h.vnull()).create(h.jo(&.{
    .{ "language", h.vstr("example_language") }, // []const u8
    .{ "package_uuid", h.vstr("example_package_uuid") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## MerchantPortalPamProductControllerEntity

```zig
const merchant_portal_pam_product_controller = client.merchant_portal_pam_product_controller(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `[]const u8` | No |  |
| `filter` | `Value (object)` | No |  |
| `language` | `[]const u8` | No |  |
| `merchant_id` | `[]const u8` | No |  |
| `package_order_uuid` | `[]const u8` | Yes |  |
| `pagination` | `Value (object)` | No |  |
| `product_order_uuid` | `[]const u8` | Yes |  |
| `product_uuid` | `[]const u8` | Yes |  |
| `reason_decline` | `[]const u8` | Yes |  |
| `sorting` | `Value (object)` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.merchant_portal_pam_product_controller(h.vnull()).create(h.jo(&.{
    .{ "package_order_uuid", h.vstr("example_package_order_uuid") }, // []const u8
    .{ "product_order_uuid", h.vstr("example_product_order_uuid") }, // []const u8
    .{ "product_uuid", h.vstr("example_product_uuid") }, // []const u8
    .{ "reason_decline", h.vstr("example_reason_decline") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## OutputAddProductEntity

```zig
const output_add_product = client.output_add_product(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `[]const u8` | Yes |  |
| `product_uui_d` | `Value (array)` | Yes |  |
| `response_code` | `i64` | Yes |  |
| `response_message` | `[]const u8` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.output_add_product(h.vnull()).create(h.jo(&.{
    .{ "package_uuid", h.vstr("example_package_uuid") }, // []const u8
    .{ "product_uui_d", h.olist() }, // Value (array)
    .{ "response_code", h.vnum(1) }, // i64
    .{ "response_message", h.vstr("example_response_message") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## OutputCreateProductEntity

```zig
const output_create_product = client.output_create_product(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acquirer_id` | `[]const u8` | No |  |
| `allow_multiple_order` | `bool` | Yes |  |
| `app_form_template_name` | `[]const u8` | Yes |  |
| `contract_needed` | `bool` | Yes |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `[]const u8` | Yes |  |
| `name_key` | `[]const u8` | Yes |  |
| `prescreening_allowed` | `bool` | Yes |  |
| `product_name` | `[]const u8` | Yes |  |
| `response_code` | `i64` | Yes |  |
| `response_message` | `[]const u8` | Yes |  |
| `terminal_template_name` | `[]const u8` | Yes |  |
| `vendor_name` | `[]const u8` | Yes |  |
| `xml_template_file` | `[]const u8` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

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
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## OutputDetailEntity

```zig
const output_detail = client.output_detail(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `detail` | `Value (object)` | No |  |
| `response_code` | `i64` | Yes |  |
| `response_message` | `[]const u8` | Yes |  |

### Operations

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.output_detail(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("output_detail_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## OutputListEntity

```zig
const output_list = client.output_list(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `item` | `Value (array)` | No |  |
| `pagination` | `Value (object)` | Yes |  |
| `response_code` | `i64` | Yes |  |
| `response_message` | `[]const u8` | Yes |  |
| `sorting` | `Value (object)` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.output_list(h.vnull()).create(h.jo(&.{
    .{ "pagination", h.omap() }, // Value (object)
    .{ "response_code", h.vnum(1) }, // i64
    .{ "response_message", h.vstr("example_response_message") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## OutputMessageEntity

```zig
const output_message = client.output_message(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `response_code` | `i64` | Yes |  |
| `response_message` | `[]const u8` | Yes |  |

### Operations

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.output_message(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("output_message_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## OutputMoveTidEntity

```zig
const output_move_tid = client.output_move_tid(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `product_order_uui_d` | `Value (array)` | Yes |  |
| `response_code` | `i64` | Yes |  |
| `response_message` | `[]const u8` | Yes |  |
| `target_package_order_uuid` | `[]const u8` | Yes |  |
| `target_product_order_uuid` | `[]const u8` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.output_move_tid(h.vnull()).create(h.jo(&.{
    .{ "product_order_uui_d", h.olist() }, // Value (array)
    .{ "response_code", h.vnum(1) }, // i64
    .{ "response_message", h.vstr("example_response_message") }, // []const u8
    .{ "target_package_order_uuid", h.vstr("example_target_package_order_uuid") }, // []const u8
    .{ "target_product_order_uuid", h.vstr("example_target_product_order_uuid") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## OutputRemoveProductEntity

```zig
const output_remove_product = client.output_remove_product(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `[]const u8` | Yes |  |
| `product_uui_d` | `Value (array)` | Yes |  |
| `response_code` | `i64` | Yes |  |
| `response_message` | `[]const u8` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.output_remove_product(h.vnull()).create(h.jo(&.{
    .{ "package_uuid", h.vstr("example_package_uuid") }, // []const u8
    .{ "product_uui_d", h.olist() }, // Value (array)
    .{ "response_code", h.vnum(1) }, // i64
    .{ "response_message", h.vstr("example_response_message") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## OutputStartEntity

```zig
const output_start = client.output_start(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `[]const u8` | No |  |
| `response_code` | `i64` | Yes |  |
| `response_message` | `[]const u8` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.output_start(h.vnull()).create(h.jo(&.{
    .{ "response_code", h.vnum(1) }, // i64
    .{ "response_message", h.vstr("example_response_message") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## OutputStatusEntity

```zig
const output_status = client.output_status(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `i64` | No |  |
| `response_code` | `i64` | Yes |  |
| `response_message` | `[]const u8` | Yes |  |
| `status` | `[]const u8` | No |  |

### Operations

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.output_status(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("output_status_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## OutputUpdateProductEntity

```zig
const output_update_product = client.output_update_product(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `allow_multiple_order` | `bool` | No |  |
| `app_form_name` | `[]const u8` | No |  |
| `contract_needed` | `bool` | No |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `[]const u8` | No |  |
| `name_key` | `[]const u8` | No |  |
| `prescreening_allowed` | `bool` | No |  |
| `product_name` | `[]const u8` | No |  |
| `product_status` | `[]const u8` | No |  |
| `product_uuid` | `[]const u8` | Yes |  |
| `response_code` | `i64` | Yes |  |
| `response_message` | `[]const u8` | Yes |  |
| `vendor_name` | `[]const u8` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.output_update_product(h.vnull()).create(h.jo(&.{
    .{ "product_uuid", h.vstr("example_product_uuid") }, // []const u8
    .{ "response_code", h.vnum(1) }, // i64
    .{ "response_message", h.vstr("example_response_message") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```zig
const client = sdk.BluefinTecsMerchantPortalSDK.new(h.jo(&.{
    .{ "feature", h.jo(&.{
        .{ "test", h.jo(&.{.{ "active", h.vbool(true) }}) },
    }) },
}));
```

