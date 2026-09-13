// Generated API configuration (mirrors go core/config.go).

use std::cell::RefCell;
use std::rc::Rc;

use crate::core::types::FeatureRef;
use crate::utility::voxgigstruct::Value;

pub fn make_config() -> Value {
    Value::map_of([
        ("main".to_string(), Value::map_of([
            ("name".to_string(), Value::str("BluefinTecsMerchantPortal")),
            ("slug".to_string(), Value::str("bluefin-tecs-merchant-portal")),
            ("version".to_string(), Value::str("0.1.1")),
            ("target".to_string(), Value::str("rust")),
        ])),
        ("feature".to_string(), Value::map_of([
            ("audit".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("actor".to_string(), Value::str("anonymous")),
                    ("max".to_string(), Value::Num(1000f64)),
                ])),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("clienttrack".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("clientVersion".to_string(), Value::str("0.0.1")),
                ])),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("idempotency".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("header".to_string(), Value::str("Idempotency-Key")),
                    ("methods".to_string(), Value::list(vec![
                        Value::str("POST"),
                        Value::str("PUT"),
                        Value::str("PATCH"),
                        Value::str("DELETE"),
                    ])),
                    ("ops".to_string(), Value::list(vec![
                        Value::str("create"),
                        Value::str("update"),
                        Value::str("remove"),
                    ])),
                ])),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("log".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(true)),
                ])),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("metrics".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                ])),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("paging".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("afterVar".to_string(), Value::str("after")),
                    ("cursorParam".to_string(), Value::str("cursor")),
                    ("firstVar".to_string(), Value::str("first")),
                    ("limitParam".to_string(), Value::str("limit")),
                    ("pageParam".to_string(), Value::str("page")),
                    ("startPage".to_string(), Value::Num(1f64)),
                ])),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("ratelimit".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("burst".to_string(), Value::Num(5f64)),
                    ("rate".to_string(), Value::Num(5f64)),
                ])),
                ("transport".to_string(), Value::str("wrap")),
            ])),
            ("retry".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("factor".to_string(), Value::Num(2f64)),
                    ("maxDelay".to_string(), Value::Num(2000f64)),
                    ("minDelay".to_string(), Value::Num(50f64)),
                    ("retries".to_string(), Value::Num(2f64)),
                    ("statuses".to_string(), Value::list(vec![
                        Value::Num(408f64),
                        Value::Num(425f64),
                        Value::Num(429f64),
                        Value::Num(500f64),
                        Value::Num(502f64),
                        Value::Num(503f64),
                        Value::Num(504f64),
                    ])),
                ])),
                ("transport".to_string(), Value::str("wrap")),
            ])),
            ("telemetry".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                ])),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("test".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                ])),
                ("transport".to_string(), Value::str("base")),
            ])),
            ("timeout".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("ms".to_string(), Value::Num(30000f64)),
                ])),
                ("transport".to_string(), Value::str("wrap")),
            ])),
        ])),
        ("options".to_string(), Value::map_of([
            ("base".to_string(), Value::str("https://test.tecs.at")),
            ("headers".to_string(), Value::map_of([
                ("content-type".to_string(), Value::str("application/json")),
            ])),
            ("entity".to_string(), Value::map_of([
                ("merchant_portal_api_controller".to_string(), Value::empty_map()),
                ("merchant_portal_common_controller".to_string(), Value::empty_map()),
                ("merchant_portal_pam_contract_controller".to_string(), Value::empty_map()),
                ("merchant_portal_pam_document_controller".to_string(), Value::empty_map()),
                ("merchant_portal_pam_form_controller".to_string(), Value::empty_map()),
                ("merchant_portal_pam_mandator_controller".to_string(), Value::empty_map()),
                ("merchant_portal_pam_merchant_controller".to_string(), Value::empty_map()),
                ("merchant_portal_pam_package_controller".to_string(), Value::empty_map()),
                ("merchant_portal_pam_product_controller".to_string(), Value::empty_map()),
                ("output_add_product".to_string(), Value::empty_map()),
                ("output_create_product".to_string(), Value::empty_map()),
                ("output_detail".to_string(), Value::empty_map()),
                ("output_list".to_string(), Value::empty_map()),
                ("output_message".to_string(), Value::empty_map()),
                ("output_move_tid".to_string(), Value::empty_map()),
                ("output_remove_product".to_string(), Value::empty_map()),
                ("output_start".to_string(), Value::empty_map()),
                ("output_status".to_string(), Value::empty_map()),
                ("output_update_product".to_string(), Value::empty_map()),
            ])),
        ])),
        ("entity".to_string(), Value::map_of([
            ("merchant_portal_api_controller".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("format".to_string(), Value::str("int32")),
                        ("name".to_string(), Value::str("account_number")),
                        ("short".to_string(), Value::str("Account number provided by the acquirer.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("additional_data")),
                        ("short".to_string(), Value::str("Arbitrary merchant-specific data related to terminal registration.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("business_reg_number")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Merchant business registration number as stated in the company registry.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("city")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Merchant's address: city.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("corporateuuid")),
                        ("short".to_string(), Value::str("Unique identifier for the corporate entity (UUID format).")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("country")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format).")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("currency")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Transaction currency (must be in \"ISO 4217\" format).")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("format".to_string(), Value::str("int32")),
                        ("name".to_string(), Value::str("merchant_category_code")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Merchant category code as defined by the payment network.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("format".to_string(), Value::str("email")),
                        ("name".to_string(), Value::str("merchant_email")),
                        ("short".to_string(), Value::str("Merchant's email address for receiving notifications.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("merchant_name")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("The officially incorporated company name of the merchant.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("merchant_phone_number")),
                        ("short".to_string(), Value::str("Merchant's phone number for notifications.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Identifier of the package in the TECS processing engine provided by TECS.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageorderuuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("password")),
                        ("short".to_string(), Value::str("Merchant password for MPOS.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productid")),
                        ("short".to_string(), Value::str("Identifier of the product for which terminal registration is to be performed.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productid_acquirer")),
                        ("short".to_string(), Value::str("Identifier of the product for which acquiring is enabled.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reason_deactivation")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reason for terminal deactivation.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reason_reactivation")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reason for terminal reactivation.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("format".to_string(), Value::str("int32")),
                        ("name".to_string(), Value::str("sorting_code")),
                        ("short".to_string(), Value::str("Sorting code provided by the acquirer.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("state")),
                        ("short".to_string(), Value::str("Merchant's address: state.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("street")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Merchant's address: street and house number.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("terminal_country_code")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Terminal country code (must be in 'ISO-3166 ALPHA-3' format).")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("terminal_language_code")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Terminal language code (must be in 'ISO 639-1' format).")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("terminal_location")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Physical or logical location of the terminal.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("terminal_serial_number")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Terminal serial number.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("format".to_string(), Value::str("int32")),
                        ("name".to_string(), Value::str("terminalid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("TECS terminalid given by Tecs processing engine.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("terminalid_acquirer")),
                        ("short".to_string(), Value::str("Terminal ID as set by the acquirer (optional).")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("format".to_string(), Value::str("email")),
                        ("name".to_string(), Value::str("user_email")),
                        ("short".to_string(), Value::str("Email address of the user acting on behalf of the merchant.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("user_phone_number")),
                        ("short".to_string(), Value::str("Phone number of the user acting on behalf of the merchant.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("username")),
                        ("short".to_string(), Value::str("Merchant username for MPOS.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("vu_nummer")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Merchant contract number with the acquirer.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("format".to_string(), Value::str("uri")),
                        ("name".to_string(), Value::str("web_shop_url")),
                        ("short".to_string(), Value::str("URL of the merchant's web shop.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("zipcode")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Merchant's address: postal code.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_api_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/deactivateTerminal")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("deactivateTerminal")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("deactivateTerminal"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/reactivateTerminal")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("reactivateTerminal")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("reactivateTerminal"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/registerAdditionalTerminal")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("registerAdditionalTerminal")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("registerAdditionalTerminal"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/registerNewMerchant")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("registerNewMerchant")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("registerNewMerchant"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("merchant_portal_common_controller".to_string(), Value::map_of([
                ("fields".to_string(), Value::empty_list()),
                ("name".to_string(), Value::str("merchant_portal_common_controller")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/merchantportalws/logDeveloperInfo")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("logDeveloperInfo")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("logDeveloperInfo"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/merchantportalws/version")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("version")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("version"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("merchant_portal_pam_contract_controller".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("language")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productOrderUUID")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_contract_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/generateContract")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("generateContract")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("generateContract"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/uploadContract")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("uploadContract")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("uploadContract"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("merchant_portal_pam_document_controller".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("appFormFieldDescUUID")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageOrderUUID")),
                        ("short".to_string(), Value::str("UUID of the package order.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productOrderUUID")),
                        ("short".to_string(), Value::str("UUID of the product order.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_document_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/documentsList")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("documentsList")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("documentsList"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/downloadDocument")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("downloadDocument")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("downloadDocument"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("merchant_portal_pam_form_controller".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("appFormFieldsDescUUID")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("filter")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("language")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageOrder")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageOrderUUID")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("UUID of the package order.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageUUID")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productOrderUUID")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("UUID of the product order.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productOrders")),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reasonOfReopening")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_form_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/applicationForm")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("applicationForm")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("applicationForm"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/packageForm")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("packageForm")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("packageForm"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/reopenForm")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("reopenForm")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("reopenForm"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/secretKey")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("secretKey")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("secretKey"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/submitForm")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("submitForm")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("submitForm"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/submitValues")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("submitValues")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("submitValues"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("merchant_portal_pam_mandator_controller".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("clientSecret")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("mandatorName")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("notificationEmail")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageUUID")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_mandator_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/createMandatorConfig")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("createMandatorConfig")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("createMandatorConfig"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/introduceMandatorPackage")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("introduceMandatorPackage")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("introduceMandatorPackage"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/selfRegistrationLink")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("selfRegistrationLink")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("selfRegistrationLink"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("merchant_portal_pam_merchant_controller".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("additional_data")),
                        ("short".to_string(), Value::str("Optional additional merchant-specific data related to enabling acquiring.")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("businessRegistrationNumber")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("city")),
                        ("short".to_string(), Value::str("City where the merchant is located.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("companyName")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("corporateUUID")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Unique identifier for the corporate entity.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("country")),
                        ("short".to_string(), Value::str("Country where the merchant is located.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("currency")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Transaction currency in ISO 4217 format.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("email")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("language")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("login")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("mandator")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Mandator name assigned by TECS.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("merchantContractNumber")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Unique identifier for the merchant within a specific system.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("merchantName")),
                        ("short".to_string(), Value::str("Name of the merchant.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("merchant_category_code")),
                        ("short".to_string(), Value::str("Merchant Category Code (MCC) describing the merchant’s type of business.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageUUID")),
                        ("short".to_string(), Value::str("UUID of the package.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageorderuuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Unique identifier for the registered merchant in the TECS system.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("phoneNumber")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("postalCode")),
                        ("short".to_string(), Value::str("Postal or ZIP code of the merchant’s location.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productid_acquirer")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Identifier of the product for which acquiring is to be enabled.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("region")),
                        ("short".to_string(), Value::str("State or province where the merchant is located.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("registrationNumber")),
                        ("short".to_string(), Value::str("Business registration number.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("signature")),
                        ("short".to_string(), Value::str("Signature value = saltAsHex-hashAsHex.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("street")),
                        ("short".to_string(), Value::str("Street address of the merchant.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("terminalIds")),
                        ("short".to_string(), Value::str("Optional list of terminal IDs for which acquiring should be activated.")),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("terminalid_acquirer")),
                        ("short".to_string(), Value::str("Optional terminal ID provided by the acquirer.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("vu_nummer")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Merchant contract number with the acquirer.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_merchant_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/contractNumber")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("contractNumber")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("contractNumber"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/registerAdditionalAcquiring")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("registerAdditionalAcquiring")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("registerAdditionalAcquiring"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/updateMerchant")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("updateMerchant")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("updateMerchant"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/registerMerchant")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("registerMerchant")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("registerMerchant"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("merchant_portal_pam_package_controller".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("consumerUUID")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("corporateUUID")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("country")),
                        ("short".to_string(), Value::str("Country associated with the package.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("descriptionKey")),
                        ("short".to_string(), Value::str("Key for the description of the package.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("filter")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("language")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("nameKey")),
                        ("short".to_string(), Value::str("Key for the name of the package.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageStatus")),
                        ("short".to_string(), Value::str("Status of the package.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageUUID")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Unique identifier for the package.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("pagination")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("sorting")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_package_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/availablePackages")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("availablePackages")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("availablePackages"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/orderPackage")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("orderPackage")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("orderPackage"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/orderedPackages")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("orderedPackages")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("orderedPackages"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/packageTemplates")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("packageTemplates")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("packageTemplates"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/updatePackageData")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("updatePackageData")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("updatePackageData"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("merchant_portal_pam_product_controller".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("consumerUUID")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("filter")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("language")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("merchantID")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageOrderUUID")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("pagination")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productOrderUUID")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productUUID")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reason_decline")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reason for product decline.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("sorting")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_product_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/approveProduct")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("approveProduct")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("approveProduct"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/declineProduct")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("declineProduct")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("declineProduct"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/orderAdditionalProduct")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("orderAdditionalProduct")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("orderAdditionalProduct"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/productsList")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("productsList")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("productsList"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_add_product".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("packageUUID")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Unique identifier for the package.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productUUIDs")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("The list of unique identifiers of the products.")),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                    ]),
                    Value::map_of([
                        ("format".to_string(), Value::str("int32")),
                        ("name".to_string(), Value::str("responseCode")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_add_product")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/addProductsToPackage")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("addProductsToPackage")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("addProductsToPackage"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_create_product".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("acquirerId")),
                        ("short".to_string(), Value::str("Unique identifier for the acquirer.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("allowMultipleOrders")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Indication whether multiple orders are allowed or not.")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("appFormTemplateName")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Name of the application form template.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("contractNeeded")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Indication whether contract is needed or not.")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("credentialsNeeded")),
                        ("short".to_string(), Value::str("Indication whether credentials are needed or not.")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("descriptionKey")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Key indicator for product description.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("nameKey")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Key indicator for product name.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("prescreeningAllowed")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Indication whether prescreening is allowed or not.")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productName")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Name of the product.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("format".to_string(), Value::str("int32")),
                        ("name".to_string(), Value::str("responseCode")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("terminalTemplateName")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Name of the terminal template.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("vendorName")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Name of the vendor.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("xmlTemplateFile")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("A string value containing the XML template file encoded in Base64.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_create_product")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/createNewProduct")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("createNewProduct")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("createNewProduct"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_detail".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("batch")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("lines")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("progress")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("output_detail")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/merchantportalws/batch/registerAdditionalTerminal/details/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("batch")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("registerAdditionalTerminal")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("details")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.details`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("details"),
                                    Value::str("{id}"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_list".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("items")),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("pagination")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("format".to_string(), Value::str("int32")),
                        ("name".to_string(), Value::str("responseCode")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("sorting")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_list")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/batch/registerAdditionalTerminal/list")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("batch")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("registerAdditionalTerminal")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("list")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("list"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_message".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("format".to_string(), Value::str("int32")),
                        ("name".to_string(), Value::str("responseCode")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("output_message")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/merchantportalws/batch/registerAdditionalTerminal/restart/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("batch")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("registerAdditionalTerminal")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("restart")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("restart"),
                                    Value::str("{id}"),
                                ])),
                            ]),
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/merchantportalws/batch/registerAdditionalTerminal/stop/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("batch")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("registerAdditionalTerminal")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("stop")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("stop"),
                                    Value::str("{id}"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_move_tid".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("productOrderUUIDs")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                    ]),
                    Value::map_of([
                        ("format".to_string(), Value::str("int32")),
                        ("name".to_string(), Value::str("responseCode")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("targetPackageOrderUUID")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("targetProductOrderUUID")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_move_tid")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/moveTid")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("moveTid")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("moveTid"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_remove_product".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("packageUUID")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Unique identifier for the package.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productUUIDs")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("List of product unique identifiers.")),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                    ]),
                    Value::map_of([
                        ("format".to_string(), Value::str("int32")),
                        ("name".to_string(), Value::str("responseCode")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_remove_product")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/removeProductsFromPackage")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("removeProductsFromPackage")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("removeProductsFromPackage"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_start".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("format".to_string(), Value::str("int32")),
                        ("name".to_string(), Value::str("responseCode")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("output_start")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/batch/registerAdditionalTerminal/start")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("batch")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("registerAdditionalTerminal")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("start")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("start"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_status".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("format".to_string(), Value::str("int32")),
                        ("name".to_string(), Value::str("percentage")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("format".to_string(), Value::str("int32")),
                        ("name".to_string(), Value::str("responseCode")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("status")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("output_status")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/merchantportalws/batch/registerAdditionalTerminal/status/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("batch")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("registerAdditionalTerminal")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("status")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("status"),
                                    Value::str("{id}"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_update_product".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("allowMultipleOrders")),
                        ("short".to_string(), Value::str("An attribute to indicate if multiple orders are allowed")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("appFormName")),
                        ("short".to_string(), Value::str("The name of the application form")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("contractNeeded")),
                        ("short".to_string(), Value::str("An attribute to indicate if a contract is needed")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("credentialsNeeded")),
                        ("short".to_string(), Value::str("An attribute to indicate if credentials are needed")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("descriptionKey")),
                        ("short".to_string(), Value::str("The description of the product")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("nameKey")),
                        ("short".to_string(), Value::str("The key of the product name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("prescreeningAllowed")),
                        ("short".to_string(), Value::str("An attribute to indicate if prescreening is allowed")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productName")),
                        ("short".to_string(), Value::str("The name of the product")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productStatus")),
                        ("short".to_string(), Value::str("The status of the product")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productUUID")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("The UUID of the product to update")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("format".to_string(), Value::str("int32")),
                        ("name".to_string(), Value::str("responseCode")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("vendorName")),
                        ("short".to_string(), Value::str("The name of the vendor")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_update_product")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/updateProduct")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("merchantportalws")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("updateProduct")),
                                    ]),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("updateProduct"),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
        ])),
    ])
}

// SHARED CONFIG (sdkgen rung L2).
//
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client. Above the
// size threshold make_config re-parses the whole embedded JSON, so this is the
// difference between parsing the model once and once per client.
//
// THREAD-LOCAL, not a global: Value is Rc/RefCell-backed and so is neither
// Send nor Sync. One config per thread is the widest scope that is sound here,
// and the clone is an Rc bump, not a deep copy.
thread_local! {
    static SHARED_CONFIG: Value = make_config();
}

/// The per-thread config, built once on first use.
///
/// The returned Value SHARES its nodes: treat it as read-only. Callers that
/// need to mutate should use make_config, which always returns a fresh copy.
pub fn shared_config() -> Value {
    SHARED_CONFIG.with(|c| c.clone())
}

pub fn make_feature(name: &str) -> FeatureRef {
    match name {
        "audit" => Rc::new(RefCell::new(crate::feature::audit::AuditFeature::new())),
        "clienttrack" => Rc::new(RefCell::new(crate::feature::clienttrack::ClienttrackFeature::new())),
        "idempotency" => Rc::new(RefCell::new(crate::feature::idempotency::IdempotencyFeature::new())),
        "log" => Rc::new(RefCell::new(crate::feature::log::LogFeature::new())),
        "metrics" => Rc::new(RefCell::new(crate::feature::metrics::MetricsFeature::new())),
        "paging" => Rc::new(RefCell::new(crate::feature::paging::PagingFeature::new())),
        "ratelimit" => Rc::new(RefCell::new(crate::feature::ratelimit::RatelimitFeature::new())),
        "retry" => Rc::new(RefCell::new(crate::feature::retry::RetryFeature::new())),
        "telemetry" => Rc::new(RefCell::new(crate::feature::telemetry::TelemetryFeature::new())),
        "test" => Rc::new(RefCell::new(crate::feature::test::TestFeature::new())),
        "timeout" => Rc::new(RefCell::new(crate::feature::timeout::TimeoutFeature::new())),
        _ => Rc::new(RefCell::new(crate::feature::base::BaseFeature::new())),
    }
}
