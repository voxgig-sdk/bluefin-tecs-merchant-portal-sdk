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
                ("optspec".to_string(), Value::map_of([
                    ("now".to_string(), Value::str("`$FUNCTION`")),
                    ("sink".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("clienttrack".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("clientVersion".to_string(), Value::str("0.0.1")),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("clientName".to_string(), Value::str("`$STRING`")),
                    ("clientVersion".to_string(), Value::str("`$STRING`")),
                    ("headers".to_string(), Value::str("`$MAP`")),
                    ("idgen".to_string(), Value::str("`$FUNCTION`")),
                    ("sessionId".to_string(), Value::str("`$STRING`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("debug".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("max".to_string(), Value::Num(100f64)),
                    ("redact".to_string(), Value::list(vec![
                        Value::str("authorization"),
                        Value::str("cookie"),
                        Value::str("set-cookie"),
                        Value::str("api-key"),
                        Value::str("apikey"),
                        Value::str("x-api-key"),
                        Value::str("idempotency-key"),
                    ])),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("now".to_string(), Value::str("`$FUNCTION`")),
                    ("onEntry".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
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
                ("optspec".to_string(), Value::map_of([
                    ("keygen".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("log".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(true)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("level".to_string(), Value::str("`$STRING`")),
                    ("logger".to_string(), Value::str("`$ANY`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("metrics".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("now".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
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
                ("optspec".to_string(), Value::map_of([
                    ("limit".to_string(), Value::str("`$NUMBER`")),
                    ("ops".to_string(), Value::str("`$LIST`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("ratelimit".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("burst".to_string(), Value::Num(5f64)),
                    ("rate".to_string(), Value::Num(5f64)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("now".to_string(), Value::str("`$FUNCTION`")),
                    ("sleep".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
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
                ("optspec".to_string(), Value::map_of([
                    ("jitter".to_string(), Value::str("`$BOOLEAN`")),
                    ("sleep".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("wrap")),
            ])),
            ("telemetry".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("exporter".to_string(), Value::str("`$FUNCTION`")),
                    ("headers".to_string(), Value::str("`$MAP`")),
                    ("idgen".to_string(), Value::str("`$FUNCTION`")),
                    ("now".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("test".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("entity".to_string(), Value::str("`$MAP`")),
                    ("net".to_string(), Value::str("`$MAP`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("base")),
            ])),
            ("timeout".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("ms".to_string(), Value::Num(30000f64)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("clearTimer".to_string(), Value::str("`$FUNCTION`")),
                    ("setTimer".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
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
                        ("name".to_string(), Value::str("account_number")),
                        ("title".to_string(), Value::str("Account Number")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("Account number provided by the acquirer.")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("additional_data")),
                        ("title".to_string(), Value::str("Additional Data")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Arbitrary merchant-specific data related to terminal registration.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("business_reg_number")),
                        ("title".to_string(), Value::str("Business Reg Number")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Merchant business registration number as stated in the company registry.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("city")),
                        ("title".to_string(), Value::str("City")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Merchant's address: city.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("corporateuuid")),
                        ("title".to_string(), Value::str("Corporateuuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Unique identifier for the corporate entity (UUID format).")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("country")),
                        ("title".to_string(), Value::str("Country")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format).")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("currency")),
                        ("title".to_string(), Value::str("Currency")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Transaction currency (must be in \"ISO 4217\" format).")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("merchant_category_code")),
                        ("title".to_string(), Value::str("Merchant Category Code")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Merchant category code as defined by the payment network.")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("merchant_email")),
                        ("title".to_string(), Value::str("Merchant Email")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Merchant's email address for receiving notifications.")),
                        ("format".to_string(), Value::str("email")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("merchant_name")),
                        ("title".to_string(), Value::str("Merchant Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("The officially incorporated company name of the merchant.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("merchant_phone_number")),
                        ("title".to_string(), Value::str("Merchant Phone Number")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Merchant's phone number for notifications.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageid")),
                        ("title".to_string(), Value::str("Packageid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Identifier of the package in the TECS processing engine provided by TECS.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageorderuuid")),
                        ("title".to_string(), Value::str("Packageorderuuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("password")),
                        ("title".to_string(), Value::str("Password")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Merchant password for MPOS.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productid")),
                        ("title".to_string(), Value::str("Productid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Identifier of the product for which terminal registration is to be performed.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productid_acquirer")),
                        ("title".to_string(), Value::str("Productid Acquirer")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Identifier of the product for which acquiring is enabled.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reason_deactivation")),
                        ("title".to_string(), Value::str("Reason Deactivation")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reason for terminal deactivation.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reason_reactivation")),
                        ("title".to_string(), Value::str("Reason Reactivation")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reason for terminal reactivation.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("sorting_code")),
                        ("title".to_string(), Value::str("Sorting Code")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("Sorting code provided by the acquirer.")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("state")),
                        ("title".to_string(), Value::str("State")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Merchant's address: state.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("street")),
                        ("title".to_string(), Value::str("Street")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Merchant's address: street and house number.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("terminal_country_code")),
                        ("title".to_string(), Value::str("Terminal Country Code")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Terminal country code (must be in 'ISO-3166 ALPHA-3' format).")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("terminal_language_code")),
                        ("title".to_string(), Value::str("Terminal Language Code")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Terminal language code (must be in 'ISO 639-1' format).")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("terminal_location")),
                        ("title".to_string(), Value::str("Terminal Location")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Physical or logical location of the terminal.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("terminal_serial_number")),
                        ("title".to_string(), Value::str("Terminal Serial Number")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Terminal serial number.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("terminalid")),
                        ("title".to_string(), Value::str("Terminalid")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("TECS terminalid given by Tecs processing engine.")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("terminalid_acquirer")),
                        ("title".to_string(), Value::str("Terminalid Acquirer")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Terminal ID as set by the acquirer (optional).")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("user_email")),
                        ("title".to_string(), Value::str("User Email")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Email address of the user acting on behalf of the merchant.")),
                        ("format".to_string(), Value::str("email")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("user_phone_number")),
                        ("title".to_string(), Value::str("User Phone Number")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Phone number of the user acting on behalf of the merchant.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("username")),
                        ("title".to_string(), Value::str("Username")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Merchant username for MPOS.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("vu_nummer")),
                        ("title".to_string(), Value::str("Vu Nummer")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Merchant contract number with the acquirer.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("web_shop_url")),
                        ("title".to_string(), Value::str("Web Shop Url")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("URL of the merchant's web shop.")),
                        ("format".to_string(), Value::str("uri")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("zipcode")),
                        ("title".to_string(), Value::str("Zipcode")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Merchant's address: postal code.")),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_api_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("deactivateTerminal"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("reactivateTerminal"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("registerAdditionalTerminal"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("registerNewMerchant"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("logDeveloperInfo"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("version"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
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
                        ("title".to_string(), Value::str("Language")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productOrderUUID")),
                        ("title".to_string(), Value::str("Product Order Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_contract_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("generateContract"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("uploadContract"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
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
                        ("title".to_string(), Value::str("App Form Field Desc Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageOrderUUID")),
                        ("title".to_string(), Value::str("Package Order Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("UUID of the package order.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productOrderUUID")),
                        ("title".to_string(), Value::str("Product Order Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("UUID of the product order.")),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_document_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("documentsList"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("downloadDocument"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
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
                        ("title".to_string(), Value::str("App Form Fields Desc Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("filter")),
                        ("title".to_string(), Value::str("Filter")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("language")),
                        ("title".to_string(), Value::str("Language")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageOrder")),
                        ("title".to_string(), Value::str("Package Order")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageOrderUUID")),
                        ("title".to_string(), Value::str("Package Order Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("UUID of the package order.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageUUID")),
                        ("title".to_string(), Value::str("Package Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productOrderUUID")),
                        ("title".to_string(), Value::str("Product Order Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("UUID of the product order.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productOrders")),
                        ("title".to_string(), Value::str("Product Orders")),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reasonOfReopening")),
                        ("title".to_string(), Value::str("Reason Of Reopening")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_form_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("applicationForm"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("packageForm"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("reopenForm"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("secretKey"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("submitForm"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("submitValues"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
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
                        ("title".to_string(), Value::str("Client Secret")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("mandatorName")),
                        ("title".to_string(), Value::str("Mandator Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("notificationEmail")),
                        ("title".to_string(), Value::str("Notification Email")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageUUID")),
                        ("title".to_string(), Value::str("Package Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_mandator_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("createMandatorConfig"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("introduceMandatorPackage"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("selfRegistrationLink"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
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
                        ("title".to_string(), Value::str("Additional Data")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Optional additional merchant-specific data related to enabling acquiring.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("businessRegistrationNumber")),
                        ("title".to_string(), Value::str("Business Registration Number")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("city")),
                        ("title".to_string(), Value::str("City")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("City where the merchant is located.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("companyName")),
                        ("title".to_string(), Value::str("Company Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("corporateUUID")),
                        ("title".to_string(), Value::str("Corporate Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Unique identifier for the corporate entity.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("country")),
                        ("title".to_string(), Value::str("Country")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Country where the merchant is located.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("currency")),
                        ("title".to_string(), Value::str("Currency")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Transaction currency in ISO 4217 format.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("email")),
                        ("title".to_string(), Value::str("Email")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("language")),
                        ("title".to_string(), Value::str("Language")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("login")),
                        ("title".to_string(), Value::str("Login")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("mandator")),
                        ("title".to_string(), Value::str("Mandator")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Mandator name assigned by TECS.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("merchantContractNumber")),
                        ("title".to_string(), Value::str("Merchant Contract Number")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("Unique identifier for the merchant within a specific system.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("merchantName")),
                        ("title".to_string(), Value::str("Merchant Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Name of the merchant.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("merchant_category_code")),
                        ("title".to_string(), Value::str("Merchant Category Code")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Merchant Category Code (MCC) describing the merchant’s type of business.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageUUID")),
                        ("title".to_string(), Value::str("Package Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("UUID of the package.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageorderuuid")),
                        ("title".to_string(), Value::str("Packageorderuuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Unique identifier for the registered merchant in the TECS system.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("phoneNumber")),
                        ("title".to_string(), Value::str("Phone Number")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("postalCode")),
                        ("title".to_string(), Value::str("Postal Code")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Postal or ZIP code of the merchant’s location.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productid_acquirer")),
                        ("title".to_string(), Value::str("Productid Acquirer")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Identifier of the product for which acquiring is to be enabled.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("region")),
                        ("title".to_string(), Value::str("Region")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("State or province where the merchant is located.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("registrationNumber")),
                        ("title".to_string(), Value::str("Registration Number")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Business registration number.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("signature")),
                        ("title".to_string(), Value::str("Signature")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Signature value = saltAsHex-hashAsHex.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("street")),
                        ("title".to_string(), Value::str("Street")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Street address of the merchant.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("terminalIds")),
                        ("title".to_string(), Value::str("Terminal Ids")),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("short".to_string(), Value::str("Optional list of terminal IDs for which acquiring should be activated.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("terminalid_acquirer")),
                        ("title".to_string(), Value::str("Terminalid Acquirer")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Optional terminal ID provided by the acquirer.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("vu_nummer")),
                        ("title".to_string(), Value::str("Vu Nummer")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Merchant contract number with the acquirer.")),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_merchant_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("contractNumber"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("registerAdditionalAcquiring"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("updateMerchant"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("registerMerchant"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
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
                        ("title".to_string(), Value::str("Consumer Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("corporateUUID")),
                        ("title".to_string(), Value::str("Corporate Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("country")),
                        ("title".to_string(), Value::str("Country")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Country associated with the package.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("descriptionKey")),
                        ("title".to_string(), Value::str("Description Key")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Key for the description of the package.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("filter")),
                        ("title".to_string(), Value::str("Filter")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("language")),
                        ("title".to_string(), Value::str("Language")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("nameKey")),
                        ("title".to_string(), Value::str("Name Key")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Key for the name of the package.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageStatus")),
                        ("title".to_string(), Value::str("Package Status")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Status of the package.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageUUID")),
                        ("title".to_string(), Value::str("Package Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Unique identifier for the package.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("pagination")),
                        ("title".to_string(), Value::str("Pagination")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("sorting")),
                        ("title".to_string(), Value::str("Sorting")),
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("availablePackages"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("orderPackage"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("orderedPackages"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("packageTemplates"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("updatePackageData"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
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
                        ("title".to_string(), Value::str("Consumer Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("filter")),
                        ("title".to_string(), Value::str("Filter")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("language")),
                        ("title".to_string(), Value::str("Language")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("merchantID")),
                        ("title".to_string(), Value::str("Merchant Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("packageOrderUUID")),
                        ("title".to_string(), Value::str("Package Order Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("pagination")),
                        ("title".to_string(), Value::str("Pagination")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productOrderUUID")),
                        ("title".to_string(), Value::str("Product Order Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productUUID")),
                        ("title".to_string(), Value::str("Product Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reason_decline")),
                        ("title".to_string(), Value::str("Reason Decline")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reason for product decline.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("sorting")),
                        ("title".to_string(), Value::str("Sorting")),
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("approveProduct"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("declineProduct"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("orderAdditionalProduct"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("productsList"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
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
                        ("title".to_string(), Value::str("Package Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Unique identifier for the package.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productUUIDs")),
                        ("title".to_string(), Value::str("Product Uui Ds")),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("The list of unique identifiers of the products.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseCode")),
                        ("title".to_string(), Value::str("Response Code")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("title".to_string(), Value::str("Response Message")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_add_product")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("addProductsToPackage"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
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
                        ("title".to_string(), Value::str("Acquirer Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Unique identifier for the acquirer.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("allowMultipleOrders")),
                        ("title".to_string(), Value::str("Allow Multiple Orders")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Indication whether multiple orders are allowed or not.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("appFormTemplateName")),
                        ("title".to_string(), Value::str("App Form Template Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Name of the application form template.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("contractNeeded")),
                        ("title".to_string(), Value::str("Contract Needed")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Indication whether contract is needed or not.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("credentialsNeeded")),
                        ("title".to_string(), Value::str("Credentials Needed")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("Indication whether credentials are needed or not.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("descriptionKey")),
                        ("title".to_string(), Value::str("Description Key")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Key indicator for product description.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("nameKey")),
                        ("title".to_string(), Value::str("Name Key")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Key indicator for product name.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("prescreeningAllowed")),
                        ("title".to_string(), Value::str("Prescreening Allowed")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Indication whether prescreening is allowed or not.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productName")),
                        ("title".to_string(), Value::str("Product Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Name of the product.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseCode")),
                        ("title".to_string(), Value::str("Response Code")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("title".to_string(), Value::str("Response Message")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("terminalTemplateName")),
                        ("title".to_string(), Value::str("Terminal Template Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Name of the terminal template.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("vendorName")),
                        ("title".to_string(), Value::str("Vendor Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Name of the vendor.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("xmlTemplateFile")),
                        ("title".to_string(), Value::str("Xml Template File")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("A string value containing the XML template file encoded in Base64.")),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_create_product")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("createNewProduct"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
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
                        ("title".to_string(), Value::str("Batch")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("lines")),
                        ("title".to_string(), Value::str("Lines")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("progress")),
                        ("title".to_string(), Value::str("Progress")),
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("details"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.details`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                        Value::str("id"),
                                    ])),
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
                        ("title".to_string(), Value::str("Items")),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("pagination")),
                        ("title".to_string(), Value::str("Pagination")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                        ])),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseCode")),
                        ("title".to_string(), Value::str("Response Code")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("title".to_string(), Value::str("Response Message")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("sorting")),
                        ("title".to_string(), Value::str("Sorting")),
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("list"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
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
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseCode")),
                        ("title".to_string(), Value::str("Response Code")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("title".to_string(), Value::str("Response Message")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("restart"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("stop"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                        Value::str("id"),
                                    ])),
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
                        ("title".to_string(), Value::str("Product Order Uui Ds")),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseCode")),
                        ("title".to_string(), Value::str("Response Code")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("title".to_string(), Value::str("Response Message")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("targetPackageOrderUUID")),
                        ("title".to_string(), Value::str("Target Package Order Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("targetProductOrderUUID")),
                        ("title".to_string(), Value::str("Target Product Order Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_move_tid")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("moveTid"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
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
                        ("title".to_string(), Value::str("Package Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Unique identifier for the package.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productUUIDs")),
                        ("title".to_string(), Value::str("Product Uui Ds")),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("List of product unique identifiers.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseCode")),
                        ("title".to_string(), Value::str("Response Code")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("title".to_string(), Value::str("Response Message")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_remove_product")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("removeProductsFromPackage"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
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
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseCode")),
                        ("title".to_string(), Value::str("Response Code")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("title".to_string(), Value::str("Response Message")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("start"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
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
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("percentage")),
                        ("title".to_string(), Value::str("Percentage")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseCode")),
                        ("title".to_string(), Value::str("Response Code")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("title".to_string(), Value::str("Response Message")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("status")),
                        ("title".to_string(), Value::str("Status")),
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("status"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                        Value::str("id"),
                                    ])),
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
                        ("title".to_string(), Value::str("Allow Multiple Orders")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("An attribute to indicate if multiple orders are allowed")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("appFormName")),
                        ("title".to_string(), Value::str("App Form Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The name of the application form")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("contractNeeded")),
                        ("title".to_string(), Value::str("Contract Needed")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("An attribute to indicate if a contract is needed")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("credentialsNeeded")),
                        ("title".to_string(), Value::str("Credentials Needed")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("An attribute to indicate if credentials are needed")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("descriptionKey")),
                        ("title".to_string(), Value::str("Description Key")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The description of the product")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("nameKey")),
                        ("title".to_string(), Value::str("Name Key")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The key of the product name")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("prescreeningAllowed")),
                        ("title".to_string(), Value::str("Prescreening Allowed")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("An attribute to indicate if prescreening is allowed")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productName")),
                        ("title".to_string(), Value::str("Product Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The name of the product")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productStatus")),
                        ("title".to_string(), Value::str("Product Status")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The status of the product")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productUUID")),
                        ("title".to_string(), Value::str("Product Uuid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("The UUID of the product to update")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseCode")),
                        ("title".to_string(), Value::str("Response Code")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response code.")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("responseMessage")),
                        ("title".to_string(), Value::str("Response Message")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Response message.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("vendorName")),
                        ("title".to_string(), Value::str("Vendor Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The name of the vendor")),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_update_product")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
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
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("updateProduct"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("header")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("authorization"),
                                    ])),
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
        "debug" => Rc::new(RefCell::new(crate::feature::debug::DebugFeature::new())),
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
