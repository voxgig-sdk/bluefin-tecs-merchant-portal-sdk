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
                .{ "optspec", h.jo(&.{
                    .{ "now", h.vstr("`$FUNCTION`") },
                    .{ "sink", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "clienttrack", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "clientVersion", h.vstr("0.0.1") },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "clientName", h.vstr("`$STRING`") },
                    .{ "clientVersion", h.vstr("`$STRING`") },
                    .{ "headers", h.vstr("`$MAP`") },
                    .{ "idgen", h.vstr("`$FUNCTION`") },
                    .{ "sessionId", h.vstr("`$STRING`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "debug", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "max", h.vnum(100) },
                    .{ "redact", h.ja(&.{
                        h.vstr("authorization"),
                        h.vstr("cookie"),
                        h.vstr("set-cookie"),
                        h.vstr("api-key"),
                        h.vstr("apikey"),
                        h.vstr("x-api-key"),
                        h.vstr("idempotency-key"),
                    }) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "now", h.vstr("`$FUNCTION`") },
                    .{ "onEntry", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
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
                .{ "optspec", h.jo(&.{
                    .{ "keygen", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "log", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(true) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "level", h.vstr("`$STRING`") },
                    .{ "logger", h.vstr("`$ANY`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "metrics", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "now", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
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
                .{ "optspec", h.jo(&.{
                    .{ "limit", h.vstr("`$NUMBER`") },
                    .{ "ops", h.vstr("`$LIST`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "ratelimit", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "burst", h.vnum(5) },
                    .{ "rate", h.vnum(5) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "now", h.vstr("`$FUNCTION`") },
                    .{ "sleep", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
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
                .{ "optspec", h.jo(&.{
                    .{ "jitter", h.vstr("`$BOOLEAN`") },
                    .{ "sleep", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("wrap") },
            }) },
            .{ "telemetry", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "exporter", h.vstr("`$FUNCTION`") },
                    .{ "headers", h.vstr("`$MAP`") },
                    .{ "idgen", h.vstr("`$FUNCTION`") },
                    .{ "now", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "test", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "entity", h.vstr("`$MAP`") },
                    .{ "net", h.vstr("`$MAP`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("base") },
            }) },
            .{ "timeout", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "ms", h.vnum(30000) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "clearTimer", h.vstr("`$FUNCTION`") },
                    .{ "setTimer", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
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
                        .{ "name", h.vstr("account_number") },
                        .{ "title", h.vstr("Account Number") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("Account number provided by the acquirer.") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("additional_data") },
                        .{ "title", h.vstr("Additional Data") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Arbitrary merchant-specific data related to terminal registration.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("business_reg_number") },
                        .{ "title", h.vstr("Business Reg Number") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Merchant business registration number as stated in the company registry.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("city") },
                        .{ "title", h.vstr("City") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Merchant's address: city.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("corporateuuid") },
                        .{ "title", h.vstr("Corporateuuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Unique identifier for the corporate entity (UUID format).") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("country") },
                        .{ "title", h.vstr("Country") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format).") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("currency") },
                        .{ "title", h.vstr("Currency") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Transaction currency (must be in \"ISO 4217\" format).") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("merchant_category_code") },
                        .{ "title", h.vstr("Merchant Category Code") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Merchant category code as defined by the payment network.") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("merchant_email") },
                        .{ "title", h.vstr("Merchant Email") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Merchant's email address for receiving notifications.") },
                        .{ "format", h.vstr("email") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("merchant_name") },
                        .{ "title", h.vstr("Merchant Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("The officially incorporated company name of the merchant.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("merchant_phone_number") },
                        .{ "title", h.vstr("Merchant Phone Number") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Merchant's phone number for notifications.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageid") },
                        .{ "title", h.vstr("Packageid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Identifier of the package in the TECS processing engine provided by TECS.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageorderuuid") },
                        .{ "title", h.vstr("Packageorderuuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("password") },
                        .{ "title", h.vstr("Password") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Merchant password for MPOS.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productid") },
                        .{ "title", h.vstr("Productid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Identifier of the product for which terminal registration is to be performed.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productid_acquirer") },
                        .{ "title", h.vstr("Productid Acquirer") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Identifier of the product for which acquiring is enabled.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reason_deactivation") },
                        .{ "title", h.vstr("Reason Deactivation") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reason for terminal deactivation.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reason_reactivation") },
                        .{ "title", h.vstr("Reason Reactivation") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reason for terminal reactivation.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("sorting_code") },
                        .{ "title", h.vstr("Sorting Code") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("Sorting code provided by the acquirer.") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("state") },
                        .{ "title", h.vstr("State") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Merchant's address: state.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("street") },
                        .{ "title", h.vstr("Street") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Merchant's address: street and house number.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("terminal_country_code") },
                        .{ "title", h.vstr("Terminal Country Code") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Terminal country code (must be in 'ISO-3166 ALPHA-3' format).") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("terminal_language_code") },
                        .{ "title", h.vstr("Terminal Language Code") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Terminal language code (must be in 'ISO 639-1' format).") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("terminal_location") },
                        .{ "title", h.vstr("Terminal Location") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Physical or logical location of the terminal.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("terminal_serial_number") },
                        .{ "title", h.vstr("Terminal Serial Number") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Terminal serial number.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("terminalid") },
                        .{ "title", h.vstr("Terminalid") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("TECS terminalid given by Tecs processing engine.") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("terminalid_acquirer") },
                        .{ "title", h.vstr("Terminalid Acquirer") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Terminal ID as set by the acquirer (optional).") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("user_email") },
                        .{ "title", h.vstr("User Email") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Email address of the user acting on behalf of the merchant.") },
                        .{ "format", h.vstr("email") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("user_phone_number") },
                        .{ "title", h.vstr("User Phone Number") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Phone number of the user acting on behalf of the merchant.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("username") },
                        .{ "title", h.vstr("Username") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Merchant username for MPOS.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("vu_nummer") },
                        .{ "title", h.vstr("Vu Nummer") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Merchant contract number with the acquirer.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("web_shop_url") },
                        .{ "title", h.vstr("Web Shop Url") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("URL of the merchant's web shop.") },
                        .{ "format", h.vstr("uri") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("zipcode") },
                        .{ "title", h.vstr("Zipcode") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Merchant's address: postal code.") },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_api_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("deactivateTerminal"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("reactivateTerminal"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("registerAdditionalTerminal"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("registerNewMerchant"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("logDeveloperInfo"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("version"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
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
                        .{ "title", h.vstr("Language") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productOrderUUID") },
                        .{ "title", h.vstr("Product Order Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_contract_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("generateContract"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("uploadContract"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
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
                        .{ "title", h.vstr("App Form Field Desc Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageOrderUUID") },
                        .{ "title", h.vstr("Package Order Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("UUID of the package order.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productOrderUUID") },
                        .{ "title", h.vstr("Product Order Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("UUID of the product order.") },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_document_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("documentsList"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("downloadDocument"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
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
                        .{ "title", h.vstr("App Form Fields Desc Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("filter") },
                        .{ "title", h.vstr("Filter") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("language") },
                        .{ "title", h.vstr("Language") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageOrder") },
                        .{ "title", h.vstr("Package Order") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageOrderUUID") },
                        .{ "title", h.vstr("Package Order Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("UUID of the package order.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageUUID") },
                        .{ "title", h.vstr("Package Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productOrderUUID") },
                        .{ "title", h.vstr("Product Order Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("UUID of the product order.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productOrders") },
                        .{ "title", h.vstr("Product Orders") },
                        .{ "type", h.vstr("`$ARRAY`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reasonOfReopening") },
                        .{ "title", h.vstr("Reason Of Reopening") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_form_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("applicationForm"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("packageForm"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("reopenForm"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("secretKey"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("submitForm"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("submitValues"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
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
                        .{ "title", h.vstr("Client Secret") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mandatorName") },
                        .{ "title", h.vstr("Mandator Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("notificationEmail") },
                        .{ "title", h.vstr("Notification Email") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageUUID") },
                        .{ "title", h.vstr("Package Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_mandator_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("createMandatorConfig"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("introduceMandatorPackage"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("selfRegistrationLink"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
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
                        .{ "title", h.vstr("Additional Data") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Optional additional merchant-specific data related to enabling acquiring.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("businessRegistrationNumber") },
                        .{ "title", h.vstr("Business Registration Number") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("city") },
                        .{ "title", h.vstr("City") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("City where the merchant is located.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("companyName") },
                        .{ "title", h.vstr("Company Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("corporateUUID") },
                        .{ "title", h.vstr("Corporate Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Unique identifier for the corporate entity.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("country") },
                        .{ "title", h.vstr("Country") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Country where the merchant is located.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("currency") },
                        .{ "title", h.vstr("Currency") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Transaction currency in ISO 4217 format.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("email") },
                        .{ "title", h.vstr("Email") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("language") },
                        .{ "title", h.vstr("Language") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("login") },
                        .{ "title", h.vstr("Login") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mandator") },
                        .{ "title", h.vstr("Mandator") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Mandator name assigned by TECS.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("merchantContractNumber") },
                        .{ "title", h.vstr("Merchant Contract Number") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Unique identifier for the merchant within a specific system.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("merchantName") },
                        .{ "title", h.vstr("Merchant Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Name of the merchant.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("merchant_category_code") },
                        .{ "title", h.vstr("Merchant Category Code") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Merchant Category Code (MCC) describing the merchant’s type of business.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageUUID") },
                        .{ "title", h.vstr("Package Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("UUID of the package.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageorderuuid") },
                        .{ "title", h.vstr("Packageorderuuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Unique identifier for the registered merchant in the TECS system.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("phoneNumber") },
                        .{ "title", h.vstr("Phone Number") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("postalCode") },
                        .{ "title", h.vstr("Postal Code") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Postal or ZIP code of the merchant’s location.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productid_acquirer") },
                        .{ "title", h.vstr("Productid Acquirer") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Identifier of the product for which acquiring is to be enabled.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("region") },
                        .{ "title", h.vstr("Region") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("State or province where the merchant is located.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("registrationNumber") },
                        .{ "title", h.vstr("Registration Number") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Business registration number.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("signature") },
                        .{ "title", h.vstr("Signature") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Signature value = saltAsHex-hashAsHex.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("street") },
                        .{ "title", h.vstr("Street") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Street address of the merchant.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("terminalIds") },
                        .{ "title", h.vstr("Terminal Ids") },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "short", h.vstr("Optional list of terminal IDs for which acquiring should be activated.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("terminalid_acquirer") },
                        .{ "title", h.vstr("Terminalid Acquirer") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Optional terminal ID provided by the acquirer.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("vu_nummer") },
                        .{ "title", h.vstr("Vu Nummer") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Merchant contract number with the acquirer.") },
                    }),
                }) },
                .{ "name", h.vstr("merchant_portal_pam_merchant_controller") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("contractNumber"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("registerAdditionalAcquiring"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("updateMerchant"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("registerMerchant"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
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
                        .{ "title", h.vstr("Consumer Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("corporateUUID") },
                        .{ "title", h.vstr("Corporate Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("country") },
                        .{ "title", h.vstr("Country") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Country associated with the package.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("descriptionKey") },
                        .{ "title", h.vstr("Description Key") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Key for the description of the package.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("filter") },
                        .{ "title", h.vstr("Filter") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("language") },
                        .{ "title", h.vstr("Language") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("nameKey") },
                        .{ "title", h.vstr("Name Key") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Key for the name of the package.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageStatus") },
                        .{ "title", h.vstr("Package Status") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Status of the package.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageUUID") },
                        .{ "title", h.vstr("Package Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Unique identifier for the package.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("pagination") },
                        .{ "title", h.vstr("Pagination") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("sorting") },
                        .{ "title", h.vstr("Sorting") },
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("availablePackages"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("orderPackage"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("orderedPackages"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("packageTemplates"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("updatePackageData"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
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
                        .{ "title", h.vstr("Consumer Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("filter") },
                        .{ "title", h.vstr("Filter") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("language") },
                        .{ "title", h.vstr("Language") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("merchantID") },
                        .{ "title", h.vstr("Merchant Id") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("packageOrderUUID") },
                        .{ "title", h.vstr("Package Order Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("pagination") },
                        .{ "title", h.vstr("Pagination") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productOrderUUID") },
                        .{ "title", h.vstr("Product Order Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productUUID") },
                        .{ "title", h.vstr("Product Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reason_decline") },
                        .{ "title", h.vstr("Reason Decline") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reason for product decline.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("sorting") },
                        .{ "title", h.vstr("Sorting") },
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("approveProduct"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("declineProduct"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("orderAdditionalProduct"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("productsList"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
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
                        .{ "title", h.vstr("Package Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Unique identifier for the package.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productUUIDs") },
                        .{ "title", h.vstr("Product Uui Ds") },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("The list of unique identifiers of the products.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseCode") },
                        .{ "title", h.vstr("Response Code") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "title", h.vstr("Response Message") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
                    }),
                }) },
                .{ "name", h.vstr("output_add_product") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("addProductsToPackage"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
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
                        .{ "title", h.vstr("Acquirer Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Unique identifier for the acquirer.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("allowMultipleOrders") },
                        .{ "title", h.vstr("Allow Multiple Orders") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Indication whether multiple orders are allowed or not.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("appFormTemplateName") },
                        .{ "title", h.vstr("App Form Template Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Name of the application form template.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("contractNeeded") },
                        .{ "title", h.vstr("Contract Needed") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Indication whether contract is needed or not.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("credentialsNeeded") },
                        .{ "title", h.vstr("Credentials Needed") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("Indication whether credentials are needed or not.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("descriptionKey") },
                        .{ "title", h.vstr("Description Key") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Key indicator for product description.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("nameKey") },
                        .{ "title", h.vstr("Name Key") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Key indicator for product name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("prescreeningAllowed") },
                        .{ "title", h.vstr("Prescreening Allowed") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Indication whether prescreening is allowed or not.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productName") },
                        .{ "title", h.vstr("Product Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Name of the product.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseCode") },
                        .{ "title", h.vstr("Response Code") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "title", h.vstr("Response Message") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("terminalTemplateName") },
                        .{ "title", h.vstr("Terminal Template Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Name of the terminal template.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("vendorName") },
                        .{ "title", h.vstr("Vendor Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Name of the vendor.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("xmlTemplateFile") },
                        .{ "title", h.vstr("Xml Template File") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("A string value containing the XML template file encoded in Base64.") },
                    }),
                }) },
                .{ "name", h.vstr("output_create_product") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("createNewProduct"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
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
                        .{ "title", h.vstr("Batch") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("lines") },
                        .{ "title", h.vstr("Lines") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("progress") },
                        .{ "title", h.vstr("Progress") },
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("details"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.details`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                        h.vstr("id"),
                                    }) },
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
                        .{ "title", h.vstr("Items") },
                        .{ "type", h.vstr("`$ARRAY`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("pagination") },
                        .{ "title", h.vstr("Pagination") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseCode") },
                        .{ "title", h.vstr("Response Code") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "title", h.vstr("Response Message") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("sorting") },
                        .{ "title", h.vstr("Sorting") },
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("list"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
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
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseCode") },
                        .{ "title", h.vstr("Response Code") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "title", h.vstr("Response Message") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("restart"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                        h.vstr("id"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("stop"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                        h.vstr("id"),
                                    }) },
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
                        .{ "title", h.vstr("Product Order Uui Ds") },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseCode") },
                        .{ "title", h.vstr("Response Code") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "title", h.vstr("Response Message") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("targetPackageOrderUUID") },
                        .{ "title", h.vstr("Target Package Order Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("targetProductOrderUUID") },
                        .{ "title", h.vstr("Target Product Order Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                    }),
                }) },
                .{ "name", h.vstr("output_move_tid") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("moveTid"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
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
                        .{ "title", h.vstr("Package Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Unique identifier for the package.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productUUIDs") },
                        .{ "title", h.vstr("Product Uui Ds") },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("List of product unique identifiers.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseCode") },
                        .{ "title", h.vstr("Response Code") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "title", h.vstr("Response Message") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
                    }),
                }) },
                .{ "name", h.vstr("output_remove_product") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("removeProductsFromPackage"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
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
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseCode") },
                        .{ "title", h.vstr("Response Code") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "title", h.vstr("Response Message") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("start"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
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
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("percentage") },
                        .{ "title", h.vstr("Percentage") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseCode") },
                        .{ "title", h.vstr("Response Code") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "title", h.vstr("Response Message") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("status") },
                        .{ "title", h.vstr("Status") },
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("batch"),
                                    h.vstr("registerAdditionalTerminal"),
                                    h.vstr("status"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                        h.vstr("id"),
                                    }) },
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
                        .{ "title", h.vstr("Allow Multiple Orders") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("An attribute to indicate if multiple orders are allowed") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("appFormName") },
                        .{ "title", h.vstr("App Form Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The name of the application form") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("contractNeeded") },
                        .{ "title", h.vstr("Contract Needed") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("An attribute to indicate if a contract is needed") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("credentialsNeeded") },
                        .{ "title", h.vstr("Credentials Needed") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("An attribute to indicate if credentials are needed") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("descriptionKey") },
                        .{ "title", h.vstr("Description Key") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The description of the product") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("nameKey") },
                        .{ "title", h.vstr("Name Key") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The key of the product name") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("prescreeningAllowed") },
                        .{ "title", h.vstr("Prescreening Allowed") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("An attribute to indicate if prescreening is allowed") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productName") },
                        .{ "title", h.vstr("Product Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The name of the product") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productStatus") },
                        .{ "title", h.vstr("Product Status") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The status of the product") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productUUID") },
                        .{ "title", h.vstr("Product Uuid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("The UUID of the product to update") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseCode") },
                        .{ "title", h.vstr("Response Code") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response code.") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("responseMessage") },
                        .{ "title", h.vstr("Response Message") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Response message.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("vendorName") },
                        .{ "title", h.vstr("Vendor Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The name of the vendor") },
                    }),
                }) },
                .{ "name", h.vstr("output_update_product") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
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
                                .{ "parts", h.ja(&.{
                                    h.vstr("merchantportalws"),
                                    h.vstr("updateProduct"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("authorization") },
                                            .{ "orig", h.vstr("authorization") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("authorization"),
                                    }) },
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
