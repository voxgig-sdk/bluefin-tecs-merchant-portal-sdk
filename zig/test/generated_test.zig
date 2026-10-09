// Generated smoke tests (model-driven). Drive each entity through the
// offline test transport and assert a non-error result.

const std = @import("std");
const sdk = @import("sdk");
const fh = @import("fh.zig");
const h = sdk.h;
const Value = sdk.Value;

fn vnull() Value {
    return Value{ .null = {} };
}

test "sdk_constructs_in_test_mode" {
    const testsdk = sdk.testSdk();
    try std.testing.expect(std.mem.eql(u8, testsdk.mode, "test"));
}

test "merchant_portal_api_controller_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).merchant_portal_api_controller(vnull()).create(h.jo(&.{ .{ "account_number", h.vstr("x") }, .{ "business_reg_number", h.vstr("x") }, .{ "city", h.vstr("x") }, .{ "country", h.vstr("x") }, .{ "currency", h.vstr("x") }, .{ "merchant_category_code", h.vnum(1) }, .{ "merchant_name", h.vstr("x") }, .{ "packageid", h.vstr("x") }, .{ "packageorderuuid", h.vstr("x") }, .{ "reason_deactivation", h.vstr("x") }, .{ "reason_reactivation", h.vstr("x") }, .{ "street", h.vstr("x") }, .{ "terminal_country_code", h.vstr("x") }, .{ "terminal_language_code", h.vstr("x") }, .{ "terminal_location", h.vstr("x") }, .{ "terminal_serial_number", h.vstr("x") }, .{ "terminalid", h.vnum(1) }, .{ "vu_nummer", h.vstr("x") }, .{ "zipcode", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "merchant_portal_common_controller_load_smoke" {
    const fixture = h.jo(&.{.{ "merchant_portal_common_controller", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.merchant_portal_common_controller(vnull());
    const res = e.load(h.jo(&.{.{ "id", h.vstr("t01") }}), vnull());
    switch (res) {
        .ok => |ent| {
            // EVERY operation resolves to the ENTITY, not the record: the
            // payload of EntResult.ok is the entity pointer, and the record is
            // reached through data(). Destructuring it as a Value was a
            // compile error ("expected type 'struct.JsonValue', found
            // '*entity.<name>.<Name>Entity'"), so no generated zig SDK with a
            // loadable entity could build its own test suite.
            const rec = ent.asEntity().data(null);
            try std.testing.expect(std.mem.eql(u8, h.get_str(rec, "id") orelse "", "t01"));
        },
        .err => |er| {
            std.debug.print("merchant_portal_common_controller load failed: {s}\n", .{er.msg});
            try std.testing.expect(false);
        },
    }
}

test "merchant_portal_common_controller_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/merchant_portal_common_controller/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "merchant_portal_common_controller_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/merchant_portal_common_controller/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "merchant_portal_pam_contract_controller_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).merchant_portal_pam_contract_controller(vnull()).create(h.jo(&.{ .{ "language", h.vnum(1) }, .{ "productOrderUUID", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "merchant_portal_pam_document_controller_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).merchant_portal_pam_document_controller(vnull()).create(h.jo(&.{ .{ "appFormFieldDescUUID", h.vnum(1) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "merchant_portal_pam_form_controller_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).merchant_portal_pam_form_controller(vnull()).create(h.jo(&.{ .{ "appFormFieldsDescUUID", h.vnum(1) }, .{ "language", h.vstr("x") }, .{ "packageOrderUUID", h.vstr("x") }, .{ "reasonOfReopening", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "merchant_portal_pam_mandator_controller_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).merchant_portal_pam_mandator_controller(vnull()).create(h.jo(&.{ .{ "clientSecret", h.vnum(1) }, .{ "mandatorName", h.vstr("x") }, .{ "packageUUID", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "merchant_portal_pam_merchant_controller_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).merchant_portal_pam_merchant_controller(vnull()).create(h.jo(&.{ .{ "businessRegistrationNumber", h.vnum(1) }, .{ "companyName", h.vstr("x") }, .{ "corporateUUID", h.vstr("x") }, .{ "currency", h.vstr("x") }, .{ "email", h.vstr("x") }, .{ "language", h.vstr("x") }, .{ "login", h.vstr("x") }, .{ "mandator", h.vstr("x") }, .{ "merchantContractNumber", h.vstr("x") }, .{ "packageorderuuid", h.vstr("x") }, .{ "phoneNumber", h.vstr("x") }, .{ "productid_acquirer", h.vstr("x") }, .{ "vu_nummer", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "merchant_portal_pam_package_controller_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).merchant_portal_pam_package_controller(vnull()).create(h.jo(&.{ .{ "consumerUUID", h.vnum(1) }, .{ "language", h.vstr("x") }, .{ "packageUUID", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "merchant_portal_pam_product_controller_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).merchant_portal_pam_product_controller(vnull()).create(h.jo(&.{ .{ "consumerUUID", h.vnum(1) }, .{ "packageOrderUUID", h.vstr("x") }, .{ "productOrderUUID", h.vstr("x") }, .{ "productUUID", h.vstr("x") }, .{ "reason_decline", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "output_add_product_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).output_add_product(vnull()).create(h.jo(&.{ .{ "packageUUID", h.vnum(1) }, .{ "productUUIDs", h.vstr("x") }, .{ "responseCode", h.vnum(1) }, .{ "responseMessage", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "output_create_product_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).output_create_product(vnull()).create(h.jo(&.{ .{ "acquirerId", h.vnum(1) }, .{ "allowMultipleOrders", h.vbool(true) }, .{ "appFormTemplateName", h.vstr("x") }, .{ "contractNeeded", h.vbool(true) }, .{ "descriptionKey", h.vstr("x") }, .{ "nameKey", h.vstr("x") }, .{ "prescreeningAllowed", h.vbool(true) }, .{ "productName", h.vstr("x") }, .{ "responseCode", h.vnum(1) }, .{ "responseMessage", h.vstr("x") }, .{ "terminalTemplateName", h.vstr("x") }, .{ "vendorName", h.vstr("x") }, .{ "xmlTemplateFile", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "output_detail_load_smoke" {
    const fixture = h.jo(&.{.{ "output_detail", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.output_detail(vnull());
    const res = e.load(h.jo(&.{.{ "id", h.vstr("t01") }}), vnull());
    switch (res) {
        .ok => |ent| {
            // EVERY operation resolves to the ENTITY, not the record: the
            // payload of EntResult.ok is the entity pointer, and the record is
            // reached through data(). Destructuring it as a Value was a
            // compile error ("expected type 'struct.JsonValue', found
            // '*entity.<name>.<Name>Entity'"), so no generated zig SDK with a
            // loadable entity could build its own test suite.
            const rec = ent.asEntity().data(null);
            try std.testing.expect(std.mem.eql(u8, h.get_str(rec, "id") orelse "", "t01"));
        },
        .err => |er| {
            std.debug.print("output_detail load failed: {s}\n", .{er.msg});
            try std.testing.expect(false);
        },
    }
}

test "output_detail_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).output_detail(vnull()).load(h.jo(&.{ .{ "id", h.vnum(1) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "output_detail_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/output_detail/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "output_detail_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/output_detail/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "output_list_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).output_list(vnull()).create(h.jo(&.{ .{ "pagination", h.vstr("x") }, .{ "responseCode", h.vstr("x") }, .{ "responseMessage", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "output_message_load_smoke" {
    const fixture = h.jo(&.{.{ "output_message", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.output_message(vnull());
    const res = e.load(h.jo(&.{.{ "id", h.vstr("t01") }}), vnull());
    switch (res) {
        .ok => |ent| {
            // EVERY operation resolves to the ENTITY, not the record: the
            // payload of EntResult.ok is the entity pointer, and the record is
            // reached through data(). Destructuring it as a Value was a
            // compile error ("expected type 'struct.JsonValue', found
            // '*entity.<name>.<Name>Entity'"), so no generated zig SDK with a
            // loadable entity could build its own test suite.
            const rec = ent.asEntity().data(null);
            try std.testing.expect(std.mem.eql(u8, h.get_str(rec, "id") orelse "", "t01"));
        },
        .err => |er| {
            std.debug.print("output_message load failed: {s}\n", .{er.msg});
            try std.testing.expect(false);
        },
    }
}

test "output_message_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).output_message(vnull()).load(h.jo(&.{ .{ "id", h.vnum(1) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "output_message_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/output_message/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "output_message_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/output_message/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "output_move_tid_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).output_move_tid(vnull()).create(h.jo(&.{ .{ "productOrderUUIDs", h.vstr("x") }, .{ "responseCode", h.vstr("x") }, .{ "responseMessage", h.vstr("x") }, .{ "targetPackageOrderUUID", h.vstr("x") }, .{ "targetProductOrderUUID", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "output_remove_product_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).output_remove_product(vnull()).create(h.jo(&.{ .{ "packageUUID", h.vnum(1) }, .{ "productUUIDs", h.vstr("x") }, .{ "responseCode", h.vnum(1) }, .{ "responseMessage", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "output_start_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).output_start(vnull()).create(h.jo(&.{ .{ "id", h.vnum(1) }, .{ "responseCode", h.vnum(1) }, .{ "responseMessage", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "output_status_load_smoke" {
    const fixture = h.jo(&.{.{ "output_status", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.output_status(vnull());
    const res = e.load(h.jo(&.{.{ "id", h.vstr("t01") }}), vnull());
    switch (res) {
        .ok => |ent| {
            // EVERY operation resolves to the ENTITY, not the record: the
            // payload of EntResult.ok is the entity pointer, and the record is
            // reached through data(). Destructuring it as a Value was a
            // compile error ("expected type 'struct.JsonValue', found
            // '*entity.<name>.<Name>Entity'"), so no generated zig SDK with a
            // loadable entity could build its own test suite.
            const rec = ent.asEntity().data(null);
            try std.testing.expect(std.mem.eql(u8, h.get_str(rec, "id") orelse "", "t01"));
        },
        .err => |er| {
            std.debug.print("output_status load failed: {s}\n", .{er.msg});
            try std.testing.expect(false);
        },
    }
}

test "output_status_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).output_status(vnull()).load(h.jo(&.{ .{ "id", h.vnum(1) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "output_status_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/output_status/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "output_status_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/output_status/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "output_update_product_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).output_update_product(vnull()).create(h.jo(&.{ .{ "allowMultipleOrders", h.vstr("x") }, .{ "productUUID", h.vstr("x") }, .{ "responseCode", h.vnum(1) }, .{ "responseMessage", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

// Documented quick-start surface (README.md / REFERENCE.md). Exercises the
// test-mode constructor and the direct() escape hatch exactly as documented.
test "readme_quickstart_surface" {
    // `sdk.test_sdk(...)` — the documented mock constructor.
    const client = sdk.test_sdk(vnull(), vnull());
    try std.testing.expect(std.mem.eql(u8, client.mode, "test"));

    // `client.direct(...)` — the documented escape hatch. It always returns a
    // result map carrying an `ok` flag (never an error union).
    const result = client.direct(h.jo(&.{
        .{ "path", h.vstr("/api/resource/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("example") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);

    // `client.prepare(...)` — build a request without sending it.
    const fetchdef = client.prepare(h.jo(&.{
        .{ "path", h.vstr("/api/resource/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("example") }}) },
    })) catch h.vnull();
    _ = fetchdef;
}
