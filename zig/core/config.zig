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
            .{ "slug", h.vstr("bluefin-tecs-merchant-portal") },
            .{ "version", h.vstr("0.1.1") },
            .{ "target", h.vstr("zig") },
        }) },
        .{ "feature", h.jo(&.{
            .{ "audit", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "actor", h.vstr("anonymous") },
                    .{ "max", h.vnum(1000) },
                }) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "clienttrack", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "clientVersion", h.vstr("0.0.1") },
                }) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "idempotency", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "header", h.vstr("Idempotency-Key") },
                    .{ "methods", h.ja(&.{
                        h.vstr("POST"),
                        h.vstr("PUT"),
                        h.vstr("PATCH"),
                        h.vstr("DELETE"),
                    }) },
                    .{ "ops", h.ja(&.{
                        h.vstr("create"),
                        h.vstr("update"),
                        h.vstr("remove"),
                    }) },
                }) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "log", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(true) },
                }) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "metrics", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "paging", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "afterVar", h.vstr("after") },
                    .{ "cursorParam", h.vstr("cursor") },
                    .{ "firstVar", h.vstr("first") },
                    .{ "limitParam", h.vstr("limit") },
                    .{ "pageParam", h.vstr("page") },
                    .{ "startPage", h.vnum(1) },
                }) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "ratelimit", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "burst", h.vnum(5) },
                    .{ "rate", h.vnum(5) },
                }) },
                .{ "transport", h.vstr("wrap") },
            }) },
            .{ "retry", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "factor", h.vnum(2) },
                    .{ "maxDelay", h.vnum(2000) },
                    .{ "minDelay", h.vnum(50) },
                    .{ "retries", h.vnum(2) },
                    .{ "statuses", h.ja(&.{
                        h.vnum(408),
                        h.vnum(425),
                        h.vnum(429),
                        h.vnum(500),
                        h.vnum(502),
                        h.vnum(503),
                        h.vnum(504),
                    }) },
                }) },
                .{ "transport", h.vstr("wrap") },
            }) },
            .{ "telemetry", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "test", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
                .{ "transport", h.vstr("base") },
            }) },
            .{ "timeout", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "ms", h.vnum(30000) },
                }) },
                .{ "transport", h.vstr("wrap") },
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
                        .{ "format", h.vstr("int32") },
                        .{ "name", h.vstr("account_number") },
                        .{ "short", h.vstr("Account number provided by the acquirer.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("additional_data") },
                        .{ "short", h.vstr("Arbitrary merchant-specific data related to terminal registration.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("business_reg_number") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Merchant business registration number as stated in the company registry.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("city") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Merchant's address: city.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("corporateuuid") },
                        .{ "short", h.vstr("Unique identifier for the corporate entity (UUID format).") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("country") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format).") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("currency") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Transaction currency (must be in \"ISO 4217\" format).") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "format", h.vstr("int32") },
                        .{ "name", h.vstr("merchant_category_code") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Merchant category code as defined by the payment network.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "format", h.vstr("email") },
                        .{ "name", h.vstr("merchant_email") },
                        .{ "short", h.vstr("Merchant's email address for receiving notifications.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("merchant_name") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("The officially incorporated company name of the merchant.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("merchant_phone_number") },
                        .{ "short", h.vstr("Merchant's phone number for notifications.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageid") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Identifier of the package in the TECS processing engine provided by TECS.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageorderuuid") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("password") },
                        .{ "short", h.vstr("Merchant password for MPOS.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productid") },
                        .{ "short", h.vstr("Identifier of the product for which terminal registration is to be performed.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productid_acquirer") },
                        .{ "short", h.vstr("Identifier of the product for which acquiring is enabled.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reason_deactivation") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reason for terminal deactivation.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reason_reactivation") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reason for terminal reactivation.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "format", h.vstr("int32") },
                        .{ "name", h.vstr("sorting_code") },
                        .{ "short", h.vstr("Sorting code provided by the acquirer.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("state") },
                        .{ "short", h.vstr("Merchant's address: state.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("street") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Merchant's address: street and house number.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("terminal_country_code") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Terminal country code (must be in 'ISO-3166 ALPHA-3' format).") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("terminal_language_code") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Terminal language code (must be in 'ISO 639-1' format).") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("terminal_location") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Physical or logical location of the terminal.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("terminal_serial_number") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Terminal serial number.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "format", h.vstr("int32") },
                        .{ "name", h.vstr("terminalid") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("TECS terminalid given by Tecs processing engine.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("terminalid_acquirer") },
                        .{ "short", h.vstr("Terminal ID as set by the acquirer (optional).") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "format", h.vstr("email") },
                        .{ "name", h.vstr("user_email") },
                        .{ "short", h.vstr("Email address of the user acting on behalf of the merchant.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("user_phone_number") },
                        .{ "short", h.vstr("Phone number of the user acting on behalf of the merchant.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("username") },
                        .{ "short", h.vstr("Merchant username for MPOS.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("vu_nummer") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Merchant contract number with the acquirer.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "format", h.vstr("uri") },
                        .{ "name", h.vstr("web_shop_url") },
                        .{ "short", h.vstr("URL of the merchant's web shop.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("zipcode") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Merchant's address: postal code.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_api_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/deactivateTerminal") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("deactivateTerminal") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("deactivateTerminal"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/reactivateTerminal") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("reactivateTerminal") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("reactivateTerminal"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/registerAdditionalTerminal") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("registerAdditionalTerminal") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("registerAdditionalTerminal"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/registerNewMerchant") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("registerNewMerchant") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("registerNewMerchant"),
                                }) },
                            }),
                        }) },
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
                                .{ "args", h.omap() },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/merchantportalws/logDeveloperInfo") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("logDeveloperInfo") },
                                    }),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("logDeveloperInfo"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.omap() },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/merchantportalws/version") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("version") },
                                    }),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("version"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "merchant_portal_pam_contract_controller", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("language") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productOrderUUID") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_contract_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/generateContract") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("generateContract") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("generateContract"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/uploadContract") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("uploadContract") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("uploadContract"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "merchant_portal_pam_document_controller", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("appFormFieldDescUUID") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageOrderUUID") },
                        .{ "short", h.vstr("UUID of the package order.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productOrderUUID") },
                        .{ "short", h.vstr("UUID of the product order.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_document_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/documentsList") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("documentsList") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("documentsList"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/downloadDocument") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("downloadDocument") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("downloadDocument"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "merchant_portal_pam_form_controller", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("appFormFieldsDescUUID") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("filter") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("language") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageOrder") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageOrderUUID") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("UUID of the package order.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageUUID") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productOrderUUID") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("UUID of the product order.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productOrders") },
                        .{ "type", h.vstr("`$ARRAY`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reasonOfReopening") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_form_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/applicationForm") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("applicationForm") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("applicationForm"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/packageForm") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("packageForm") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("packageForm"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/reopenForm") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("reopenForm") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("reopenForm"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/secretKey") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("secretKey") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("secretKey"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/submitForm") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("submitForm") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("submitForm"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/submitValues") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("submitValues") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("submitValues"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "merchant_portal_pam_mandator_controller", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("clientSecret") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mandatorName") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("notificationEmail") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageUUID") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_mandator_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/createMandatorConfig") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("createMandatorConfig") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("createMandatorConfig"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/introduceMandatorPackage") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("introduceMandatorPackage") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("introduceMandatorPackage"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/selfRegistrationLink") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("selfRegistrationLink") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("selfRegistrationLink"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "merchant_portal_pam_merchant_controller", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("additional_data") },
                        .{ "short", h.vstr("Optional additional merchant-specific data related to enabling acquiring.") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("businessRegistrationNumber") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("city") },
                        .{ "short", h.vstr("City where the merchant is located.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("companyName") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("corporateUUID") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Unique identifier for the corporate entity.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("country") },
                        .{ "short", h.vstr("Country where the merchant is located.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("currency") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Transaction currency in ISO 4217 format.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("email") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("language") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("login") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mandator") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Mandator name assigned by TECS.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("merchantContractNumber") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Unique identifier for the merchant within a specific system.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("merchantName") },
                        .{ "short", h.vstr("Name of the merchant.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("merchant_category_code") },
                        .{ "short", h.vstr("Merchant Category Code (MCC) describing the merchant’s type of business.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageUUID") },
                        .{ "short", h.vstr("UUID of the package.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageorderuuid") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Unique identifier for the registered merchant in the TECS system.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("phoneNumber") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("postalCode") },
                        .{ "short", h.vstr("Postal or ZIP code of the merchant’s location.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productid_acquirer") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Identifier of the product for which acquiring is to be enabled.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("region") },
                        .{ "short", h.vstr("State or province where the merchant is located.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("registrationNumber") },
                        .{ "short", h.vstr("Business registration number.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("signature") },
                        .{ "short", h.vstr("Signature value = saltAsHex-hashAsHex.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("street") },
                        .{ "short", h.vstr("Street address of the merchant.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("terminalIds") },
                        .{ "short", h.vstr("Optional list of terminal IDs for which acquiring should be activated.") },
                        .{ "type", h.vstr("`$ARRAY`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("terminalid_acquirer") },
                        .{ "short", h.vstr("Optional terminal ID provided by the acquirer.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("vu_nummer") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Merchant contract number with the acquirer.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_merchant_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/contractNumber") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("contractNumber") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("contractNumber"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/registerAdditionalAcquiring") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("registerAdditionalAcquiring") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("registerAdditionalAcquiring"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/updateMerchant") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("updateMerchant") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("updateMerchant"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.omap() },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/registerMerchant") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("registerMerchant") },
                                    }),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("registerMerchant"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "merchant_portal_pam_package_controller", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("consumerUUID") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("corporateUUID") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("country") },
                        .{ "short", h.vstr("Country associated with the package.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("descriptionKey") },
                        .{ "short", h.vstr("Key for the description of the package.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("filter") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("language") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("nameKey") },
                        .{ "short", h.vstr("Key for the name of the package.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageStatus") },
                        .{ "short", h.vstr("Status of the package.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageUUID") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Unique identifier for the package.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("pagination") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("sorting") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_package_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/availablePackages") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("availablePackages") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("availablePackages"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/orderPackage") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("orderPackage") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("orderPackage"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/orderedPackages") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("orderedPackages") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("orderedPackages"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/packageTemplates") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("packageTemplates") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("packageTemplates"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/updatePackageData") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("updatePackageData") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("updatePackageData"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "merchant_portal_pam_product_controller", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("consumerUUID") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("filter") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("language") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("merchantID") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageOrderUUID") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("pagination") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productOrderUUID") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productUUID") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reason_decline") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reason for product decline.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("sorting") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_product_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/approveProduct") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("approveProduct") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("approveProduct"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/declineProduct") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("declineProduct") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("declineProduct"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/orderAdditionalProduct") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("orderAdditionalProduct") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("orderAdditionalProduct"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/productsList") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("productsList") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("productsList"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_add_product", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("packageUUID") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Unique identifier for the package.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productUUIDs") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("The list of unique identifiers of the products.") },
                        .{ "type", h.vstr("`$ARRAY`") },
                    }),
                    h.jo(&.{
                        .{ "format", h.vstr("int32") },
                        .{ "name", h.vstr("responseCode") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                }) },
                .{ "name", h.vstr("output_add_product") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/addProductsToPackage") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("addProductsToPackage") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("addProductsToPackage"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_create_product", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("acquirerId") },
                        .{ "short", h.vstr("Unique identifier for the acquirer.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("allowMultipleOrders") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Indication whether multiple orders are allowed or not.") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("appFormTemplateName") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Name of the application form template.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("contractNeeded") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Indication whether contract is needed or not.") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("credentialsNeeded") },
                        .{ "short", h.vstr("Indication whether credentials are needed or not.") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("descriptionKey") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Key indicator for product description.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("nameKey") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Key indicator for product name.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("prescreeningAllowed") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Indication whether prescreening is allowed or not.") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productName") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Name of the product.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "format", h.vstr("int32") },
                        .{ "name", h.vstr("responseCode") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("terminalTemplateName") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Name of the terminal template.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("vendorName") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Name of the vendor.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("xmlTemplateFile") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("A string value containing the XML template file encoded in Base64.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                }) },
                .{ "name", h.vstr("output_create_product") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/createNewProduct") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("createNewProduct") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("createNewProduct"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_detail", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("batch") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("lines") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("progress") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("output_detail") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/merchantportalws/batch/registerAdditionalTerminal/details/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("batch") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("registerAdditionalTerminal") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("details") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.details`") },
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("details"),
                                    h.vstr("{id}"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_list", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("items") },
                        .{ "type", h.vstr("`$ARRAY`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("pagination") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "format", h.vstr("int32") },
                        .{ "name", h.vstr("responseCode") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("sorting") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                }) },
                .{ "name", h.vstr("output_list") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/batch/registerAdditionalTerminal/list") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("batch") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("registerAdditionalTerminal") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("list") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("list"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_message", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "format", h.vstr("int32") },
                        .{ "name", h.vstr("responseCode") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("output_message") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/merchantportalws/batch/registerAdditionalTerminal/restart/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("batch") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("registerAdditionalTerminal") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("restart") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("restart"),
                                    h.vstr("{id}"),
                                }) },
                            }),
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/merchantportalws/batch/registerAdditionalTerminal/stop/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("batch") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("registerAdditionalTerminal") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("stop") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("stop"),
                                    h.vstr("{id}"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_move_tid", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("productOrderUUIDs") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$ARRAY`") },
                    }),
                    h.jo(&.{
                        .{ "format", h.vstr("int32") },
                        .{ "name", h.vstr("responseCode") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("targetPackageOrderUUID") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("targetProductOrderUUID") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                }) },
                .{ "name", h.vstr("output_move_tid") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/moveTid") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("moveTid") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("moveTid"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_remove_product", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("packageUUID") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Unique identifier for the package.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productUUIDs") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("List of product unique identifiers.") },
                        .{ "type", h.vstr("`$ARRAY`") },
                    }),
                    h.jo(&.{
                        .{ "format", h.vstr("int32") },
                        .{ "name", h.vstr("responseCode") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                }) },
                .{ "name", h.vstr("output_remove_product") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/removeProductsFromPackage") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("removeProductsFromPackage") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("removeProductsFromPackage"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_start", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "format", h.vstr("int32") },
                        .{ "name", h.vstr("responseCode") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("output_start") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/batch/registerAdditionalTerminal/start") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("batch") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("registerAdditionalTerminal") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("start") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("start"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_status", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "format", h.vstr("int32") },
                        .{ "name", h.vstr("percentage") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "format", h.vstr("int32") },
                        .{ "name", h.vstr("responseCode") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("status") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("output_status") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/merchantportalws/batch/registerAdditionalTerminal/status/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("batch") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("registerAdditionalTerminal") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("status") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("status"),
                                    h.vstr("{id}"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "output_update_product", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("allowMultipleOrders") },
                        .{ "short", h.vstr("An attribute to indicate if multiple orders are allowed") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("appFormName") },
                        .{ "short", h.vstr("The name of the application form") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("contractNeeded") },
                        .{ "short", h.vstr("An attribute to indicate if a contract is needed") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("credentialsNeeded") },
                        .{ "short", h.vstr("An attribute to indicate if credentials are needed") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("descriptionKey") },
                        .{ "short", h.vstr("The description of the product") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("nameKey") },
                        .{ "short", h.vstr("The key of the product name") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("prescreeningAllowed") },
                        .{ "short", h.vstr("An attribute to indicate if prescreening is allowed") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productName") },
                        .{ "short", h.vstr("The name of the product") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productStatus") },
                        .{ "short", h.vstr("The status of the product") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productUUID") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("The UUID of the product to update") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "format", h.vstr("int32") },
                        .{ "name", h.vstr("responseCode") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "type", h.vstr("`$INTEGER`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("vendorName") },
                        .{ "short", h.vstr("The name of the vendor") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                }) },
                .{ "name", h.vstr("output_update_product") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/merchantportalws/updateProduct") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("merchantportalws") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("updateProduct") },
                                    }),
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("updateProduct"),
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
        }) },
    });
}

// SHARED CONFIG (sdkgen rung L2).
//
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client. Above the
// size threshold make_config re-parses the whole embedded JSON, so this is the
// difference between parsing the model once and once per client.
//
// Value nodes are arena-allocated and reference-stable, so the shared value is
// genuinely one structure, not a copy.
var shared_config_val: ?Value = null;

/// The process-wide config, built once on first use.
///
/// The returned Value SHARES its nodes: treat it as read-only. Callers that
/// need to mutate should use make_config, which always returns a fresh copy.
pub fn shared_config() Value {
    if (shared_config_val) |c| return c;
    const c = make_config();
    shared_config_val = c;
    return c;
}

pub fn make_feature(name: []const u8) Feature {
    if (std.mem.eql(u8, name, "audit")) return @import("../feature/audit.zig").AuditFeature.make();
    if (std.mem.eql(u8, name, "cache")) return @import("../feature/cache.zig").CacheFeature.make();
    if (std.mem.eql(u8, name, "clienttrack")) return @import("../feature/clienttrack.zig").ClienttrackFeature.make();
    if (std.mem.eql(u8, name, "cost")) return @import("../feature/cost.zig").CostFeature.make();
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
