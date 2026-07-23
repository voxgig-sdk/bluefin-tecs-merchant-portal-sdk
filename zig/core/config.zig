// Generated API configuration (mirrors go/rust core/config).

const std = @import("std");
const h = @import("helpers.zig");
const types = @import("types.zig");
const Value = h.Value;
const Feature = types.Feature;

pub fn make_config() Value {
    return h.jo(&.{
        .{ "main", h.jo(&.{
            .{ "name", h.vstr("BluefinTecsMerchantPortal") },
        }) },
        .{ "feature", h.jo(&.{
            .{ "test", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
            }) },
        }) },
        .{ "options", h.jo(&.{
            .{ "base", h.vstr("https://test.tecs.at") },
            .{ "headers", h.jo(&.{
                .{ "content-type", h.vstr("application/json") },
            }) },
            .{ "entity", h.jo(&.{
                .{ "merchant_portal_api_controller", h.omap() },
                .{ "merchant_portal_common_controller", h.omap() },
                .{ "merchant_portal_pam_contract_controller", h.omap() },
                .{ "merchant_portal_pam_document_controller", h.omap() },
                .{ "merchant_portal_pam_form_controller", h.omap() },
                .{ "merchant_portal_pam_mandator_controller", h.omap() },
                .{ "merchant_portal_pam_merchant_controller", h.omap() },
                .{ "merchant_portal_pam_package_controller", h.omap() },
                .{ "merchant_portal_pam_product_controller", h.omap() },
                .{ "output_add_product", h.omap() },
                .{ "output_create_product", h.omap() },
                .{ "output_detail", h.omap() },
                .{ "output_list", h.omap() },
                .{ "output_message", h.omap() },
                .{ "output_move_tid", h.omap() },
                .{ "output_remove_product", h.omap() },
                .{ "output_start", h.omap() },
                .{ "output_status", h.omap() },
                .{ "output_update_product", h.omap() },
            }) },
        }) },
        .{ "entity", h.jo(&.{
            .{ "merchant_portal_api_controller", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("account_number") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("additional_data") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("business_reg_number") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("city") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("corporateuuid") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("country") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("currency") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("merchant_category_code") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("merchant_email") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("merchant_name") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("merchant_phone_number") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(10) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("packageid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(11) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("packageorderuuid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(12) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("password") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(13) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("productid") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(14) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("productid_acquirer") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(15) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("reason_deactivation") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(16) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("reason_reactivation") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(17) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("sorting_code") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(18) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("state") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(19) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("street") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(20) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("terminal_country_code") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(21) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("terminal_language_code") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(22) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("terminal_location") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(23) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("terminal_serial_number") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(24) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("terminalid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(25) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("terminalid_acquirer") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(26) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("user_email") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(27) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("user_phone_number") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(28) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("username") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(29) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("vu_nummer") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(30) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("web_shop_url") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(31) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("zipcode") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(32) },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_api_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/deactivateTerminal") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("deactivateTerminal"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/reactivateTerminal") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("reactivateTerminal"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(1) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/registerAdditionalTerminal") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("registerAdditionalTerminal"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(2) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/registerNewMerchant") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("registerNewMerchant"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(3) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "merchant_portal_common_controller", h.jo(&.{
                .{ "fields", h.olist() },
                .{ "name", h.vstr("merchant_portal_common_controller") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/merchantportalws/logDeveloperInfo") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("logDeveloperInfo"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/merchantportalws/version") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("version"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(1) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "merchant_portal_pam_contract_controller", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("language") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("product_order_uuid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_contract_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/generateContract") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("generateContract"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/uploadContract") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("uploadContract"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(1) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "merchant_portal_pam_document_controller", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("app_form_field_desc_uuid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("package_order_uuid") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("product_order_uuid") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_document_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/documentsList") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("documentsList"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/downloadDocument") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("downloadDocument"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(1) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "merchant_portal_pam_form_controller", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("app_form_fields_desc_uuid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("filter") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("language") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(false) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("package_order") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("package_order_uuid") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(false) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("package_uuid") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("product_order") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("product_order_uuid") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("reason_of_reopening") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_form_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/applicationForm") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("applicationForm"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/packageForm") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("packageForm"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(1) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/reopenForm") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("reopenForm"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(2) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/secretKey") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("secretKey"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(3) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/submitForm") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("submitForm"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(4) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/submitValues") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("submitValues"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(5) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "merchant_portal_pam_mandator_controller", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("client_secret") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("mandator_name") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("notification_email") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("package_uuid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_mandator_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/createMandatorConfig") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("createMandatorConfig"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/introduceMandatorPackage") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("introduceMandatorPackage"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(1) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/selfRegistrationLink") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("selfRegistrationLink"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(2) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "merchant_portal_pam_merchant_controller", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("additional_data") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("business_registration_number") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("city") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("company_name") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("corporate_uuid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("country") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("currency") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("email") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("language") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("login") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("mandator") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(10) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("merchant_category_code") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(11) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("merchant_contract_number") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(false) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(12) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("merchant_name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(13) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("package_uuid") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(14) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("packageorderuuid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(15) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("phone_number") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(16) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("postal_code") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(17) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("productid_acquirer") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(18) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("region") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(19) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("registration_number") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(20) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("signature") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(21) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("street") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(22) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("terminal_id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(23) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("terminalid_acquirer") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(24) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("vu_nummer") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(25) },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_merchant_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/contractNumber") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("contractNumber"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/registerAdditionalAcquiring") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("registerAdditionalAcquiring"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(1) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/updateMerchant") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("updateMerchant"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(2) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/registerMerchant") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("registerMerchant"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(3) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "merchant_portal_pam_package_controller", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("consumer_uuid") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("corporate_uuid") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("country") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("description_key") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("filter") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("language") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(false) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("name_key") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("package_status") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("package_uuid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("pagination") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("sorting") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(10) },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_package_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/availablePackages") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("availablePackages"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/orderPackage") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("orderPackage"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(1) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/orderedPackages") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("orderedPackages"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(2) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/packageTemplates") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("packageTemplates"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(3) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/updatePackageData") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("updatePackageData"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(4) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "merchant_portal_pam_product_controller", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("consumer_uuid") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("filter") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("language") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("merchant_id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("package_order_uuid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("pagination") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("product_order_uuid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("product_uuid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("reason_decline") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("sorting") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(9) },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_product_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/approveProduct") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("approveProduct"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/declineProduct") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("declineProduct"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(1) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/orderAdditionalProduct") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("orderAdditionalProduct"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(2) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/productsList") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("productsList"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(3) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_add_product", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("package_uuid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("product_uui_d") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_code") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_message") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                }) },
                .{ "name", h.vstr("output_add_product") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/addProductsToPackage") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("addProductsToPackage"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_create_product", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("acquirer_id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("allow_multiple_order") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("app_form_template_name") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("contract_needed") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("credentials_needed") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("description_key") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("name_key") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("prescreening_allowed") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("product_name") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_code") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_message") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(10) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("terminal_template_name") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(11) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("vendor_name") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(12) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("xml_template_file") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(13) },
                    }),
                }) },
                .{ "name", h.vstr("output_create_product") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/createNewProduct") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("createNewProduct"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_detail", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("detail") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_code") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_message") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                }) },
                .{ "name", h.vstr("output_detail") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/merchantportalws/batch/registerAdditionalTerminal/details/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("details"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_list", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("item") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("pagination") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(false) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_code") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_message") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("sorting") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(4) },
                    }),
                }) },
                .{ "name", h.vstr("output_list") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/batch/registerAdditionalTerminal/list") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("list"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_message", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_code") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_message") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                }) },
                .{ "name", h.vstr("output_message") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/merchantportalws/batch/registerAdditionalTerminal/restart/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("restart"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/merchantportalws/batch/registerAdditionalTerminal/stop/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("stop"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(1) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_move_tid", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("product_order_uui_d") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_code") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_message") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("target_package_order_uuid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("target_product_order_uuid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                }) },
                .{ "name", h.vstr("output_move_tid") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/moveTid") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("moveTid"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_remove_product", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("package_uuid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("product_uui_d") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_code") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_message") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                }) },
                .{ "name", h.vstr("output_remove_product") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/removeProductsFromPackage") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("removeProductsFromPackage"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_start", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_code") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_message") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                }) },
                .{ "name", h.vstr("output_start") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/batch/registerAdditionalTerminal/start") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("start"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_status", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("percentage") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_code") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_message") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("status") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                }) },
                .{ "name", h.vstr("output_status") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/merchantportalws/batch/registerAdditionalTerminal/status/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("status"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_update_product", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("allow_multiple_order") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("app_form_name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("contract_needed") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("credentials_needed") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("description_key") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("name_key") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("prescreening_allowed") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("product_name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("product_status") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("product_uuid") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_code") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(10) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("response_message") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(11) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("vendor_name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(12) },
                    }),
                }) },
                .{ "name", h.vstr("output_update_product") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/updateProduct") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("updateProduct"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
        }) },
    });
}

pub fn make_feature(name: []const u8) Feature {
    if (std.mem.eql(u8, name, "audit")) return @import("../feature/audit.zig").AuditFeature.make();
    if (std.mem.eql(u8, name, "cache")) return @import("../feature/cache.zig").CacheFeature.make();
    if (std.mem.eql(u8, name, "clienttrack")) return @import("../feature/clienttrack.zig").ClienttrackFeature.make();
    if (std.mem.eql(u8, name, "debug")) return @import("../feature/debug.zig").DebugFeature.make();
    if (std.mem.eql(u8, name, "idempotency")) return @import("../feature/idempotency.zig").IdempotencyFeature.make();
    if (std.mem.eql(u8, name, "log")) return @import("../feature/log.zig").LogFeature.make();
    if (std.mem.eql(u8, name, "metrics")) return @import("../feature/metrics.zig").MetricsFeature.make();
    if (std.mem.eql(u8, name, "netsim")) return @import("../feature/netsim.zig").NetsimFeature.make();
    if (std.mem.eql(u8, name, "paging")) return @import("../feature/paging.zig").PagingFeature.make();
    if (std.mem.eql(u8, name, "proxy")) return @import("../feature/proxy.zig").ProxyFeature.make();
    if (std.mem.eql(u8, name, "ratelimit")) return @import("../feature/ratelimit.zig").RatelimitFeature.make();
    if (std.mem.eql(u8, name, "rbac")) return @import("../feature/rbac.zig").RbacFeature.make();
    if (std.mem.eql(u8, name, "retry")) return @import("../feature/retry.zig").RetryFeature.make();
    if (std.mem.eql(u8, name, "streaming")) return @import("../feature/streaming.zig").StreamingFeature.make();
    if (std.mem.eql(u8, name, "telemetry")) return @import("../feature/telemetry.zig").TelemetryFeature.make();
    if (std.mem.eql(u8, name, "test")) return @import("../feature/test.zig").TestFeature.make();
    if (std.mem.eql(u8, name, "timeout")) return @import("../feature/timeout.zig").TimeoutFeature.make();
    return @import("../feature/base.zig").BaseFeature.make();
}
