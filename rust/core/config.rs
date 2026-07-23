// Generated API configuration (mirrors go core/config.go).

use std::cell::RefCell;
use std::rc::Rc;

use crate::core::types::FeatureRef;
use crate::utility::voxgigstruct::Value;

pub fn make_config() -> Value {
    Value::map_of([
        ("main".to_string(), Value::map_of([
            ("name".to_string(), Value::str("BluefinTecsMerchantPortal")),
        ])),
        ("feature".to_string(), Value::map_of([
            ("test".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                ])),
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
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("account_number")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("additional_data")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("business_reg_number")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("city")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("corporateuuid")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("country")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("currency")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("merchant_category_code")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("merchant_email")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("merchant_name")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("merchant_phone_number")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("packageid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(11f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("packageorderuuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(12f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("password")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(13f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("productid")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(14f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("productid_acquirer")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(15f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("reason_deactivation")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(16f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("reason_reactivation")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(17f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("sorting_code")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(18f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("state")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(19f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("street")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(20f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("terminal_country_code")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(21f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("terminal_language_code")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(22f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("terminal_location")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(23f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("terminal_serial_number")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(24f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("terminalid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(25f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("terminalid_acquirer")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(26f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("user_email")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(27f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("user_phone_number")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(28f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("username")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(29f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("vu_nummer")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(30f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("web_shop_url")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(31f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("zipcode")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(32f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_api_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/deactivateTerminal")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("deactivateTerminal"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/reactivateTerminal")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("reactivateTerminal"),
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
                                ("index$".to_string(), Value::Num(1f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/registerAdditionalTerminal")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("registerAdditionalTerminal"),
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
                                ("index$".to_string(), Value::Num(2f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/registerNewMerchant")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("registerNewMerchant"),
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
                                ("index$".to_string(), Value::Num(3f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
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
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/merchantportalws/logDeveloperInfo")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("logDeveloperInfo"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/merchantportalws/version")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("version"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(1f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("merchant_portal_pam_contract_controller".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("language")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("product_order_uuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_contract_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/generateContract")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("generateContract"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/uploadContract")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("uploadContract"),
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
                                ("index$".to_string(), Value::Num(1f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("merchant_portal_pam_document_controller".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("app_form_field_desc_uuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("package_order_uuid")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("product_order_uuid")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_document_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/documentsList")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("documentsList"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/downloadDocument")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("downloadDocument"),
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
                                ("index$".to_string(), Value::Num(1f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("merchant_portal_pam_form_controller".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("app_form_fields_desc_uuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("filter")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("language")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(false)),
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("package_order")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("package_order_uuid")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(false)),
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("package_uuid")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("product_order")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("product_order_uuid")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("reason_of_reopening")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_form_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/applicationForm")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("applicationForm"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/packageForm")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("packageForm"),
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
                                ("index$".to_string(), Value::Num(1f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/reopenForm")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("reopenForm"),
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
                                ("index$".to_string(), Value::Num(2f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/secretKey")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("secretKey"),
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
                                ("index$".to_string(), Value::Num(3f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/submitForm")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("submitForm"),
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
                                ("index$".to_string(), Value::Num(4f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/submitValues")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("submitValues"),
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
                                ("index$".to_string(), Value::Num(5f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("merchant_portal_pam_mandator_controller".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("client_secret")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("mandator_name")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("notification_email")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("package_uuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_mandator_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/createMandatorConfig")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("createMandatorConfig"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/introduceMandatorPackage")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("introduceMandatorPackage"),
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
                                ("index$".to_string(), Value::Num(1f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/selfRegistrationLink")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("selfRegistrationLink"),
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
                                ("index$".to_string(), Value::Num(2f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("merchant_portal_pam_merchant_controller".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("additional_data")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("business_registration_number")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("city")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("company_name")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("corporate_uuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("country")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("currency")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("email")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("language")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("login")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("mandator")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("merchant_category_code")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(11f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("merchant_contract_number")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(false)),
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(12f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("merchant_name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(13f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("package_uuid")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(14f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("packageorderuuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(15f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("phone_number")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(16f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("postal_code")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(17f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("productid_acquirer")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(18f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("region")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(19f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("registration_number")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(20f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("signature")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(21f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("street")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(22f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("terminal_id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(23f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("terminalid_acquirer")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(24f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("vu_nummer")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(25f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_merchant_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/contractNumber")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("contractNumber"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/registerAdditionalAcquiring")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("registerAdditionalAcquiring"),
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
                                ("index$".to_string(), Value::Num(1f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/updateMerchant")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("updateMerchant"),
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
                                ("index$".to_string(), Value::Num(2f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/registerMerchant")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("registerMerchant"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(3f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("merchant_portal_pam_package_controller".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("consumer_uuid")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("corporate_uuid")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("country")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("description_key")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("filter")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("language")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(false)),
                                ("type".to_string(), Value::str("`$STRING`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("name_key")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("package_status")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("package_uuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("pagination")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("sorting")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_package_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/availablePackages")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("availablePackages"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/orderPackage")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("orderPackage"),
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
                                ("index$".to_string(), Value::Num(1f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/orderedPackages")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("orderedPackages"),
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
                                ("index$".to_string(), Value::Num(2f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/packageTemplates")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("packageTemplates"),
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
                                ("index$".to_string(), Value::Num(3f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/updatePackageData")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("updatePackageData"),
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
                                ("index$".to_string(), Value::Num(4f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("merchant_portal_pam_product_controller".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("consumer_uuid")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("filter")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("language")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("merchant_id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("package_order_uuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("pagination")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("product_order_uuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("product_uuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("reason_decline")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("sorting")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("merchant_portal_pam_product_controller")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/approveProduct")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("approveProduct"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/declineProduct")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("declineProduct"),
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
                                ("index$".to_string(), Value::Num(1f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/orderAdditionalProduct")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("orderAdditionalProduct"),
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
                                ("index$".to_string(), Value::Num(2f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/productsList")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("productsList"),
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
                                ("index$".to_string(), Value::Num(3f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_add_product".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("package_uuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("product_uui_d")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_code")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_message")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_add_product")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/addProductsToPackage")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("addProductsToPackage"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_create_product".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("acquirer_id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("allow_multiple_order")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("app_form_template_name")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("contract_needed")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("credentials_needed")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("description_key")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("name_key")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("prescreening_allowed")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("product_name")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_code")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_message")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("terminal_template_name")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(11f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("vendor_name")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(12f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("xml_template_file")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(13f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_create_product")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/createNewProduct")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("createNewProduct"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_detail".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("detail")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_code")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_message")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_detail")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/merchantportalws/batch/registerAdditionalTerminal/details/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("details"),
                                    Value::str("{id}"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_list".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("item")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("pagination")),
                        ("op".to_string(), Value::map_of([
                            ("create".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(false)),
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_code")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_message")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("sorting")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_list")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/batch/registerAdditionalTerminal/list")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("list"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_message".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_code")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_message")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_message")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/merchantportalws/batch/registerAdditionalTerminal/restart/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("restart"),
                                    Value::str("{id}"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/merchantportalws/batch/registerAdditionalTerminal/stop/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("stop"),
                                    Value::str("{id}"),
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
                                ("index$".to_string(), Value::Num(1f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_move_tid".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("product_order_uui_d")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_code")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_message")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("target_package_order_uuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("target_product_order_uuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_move_tid")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/moveTid")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("moveTid"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_remove_product".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("package_uuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("product_uui_d")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_code")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_message")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_remove_product")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/removeProductsFromPackage")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("removeProductsFromPackage"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_start".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_code")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_message")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_start")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/batch/registerAdditionalTerminal/start")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("start"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_status".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("percentage")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_code")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_message")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("status")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_status")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/merchantportalws/batch/registerAdditionalTerminal/status/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("batch"),
                                    Value::str("registerAdditionalTerminal"),
                                    Value::str("status"),
                                    Value::str("{id}"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("output_update_product".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("allow_multiple_order")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("app_form_name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("contract_needed")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("credentials_needed")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("description_key")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("name_key")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("prescreening_allowed")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("product_name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("product_status")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("product_uuid")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_code")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("response_message")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(11f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("vendor_name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(12f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("output_update_product")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("authorization")),
                                            ("orig".to_string(), Value::str("authorization")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/merchantportalws/updateProduct")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("merchantportalws"),
                                    Value::str("updateProduct"),
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
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
        ])),
    ])
}

pub fn make_feature(name: &str) -> FeatureRef {
    match name {
        "test" => Rc::new(RefCell::new(crate::feature::test::TestFeature::new())),
        _ => Rc::new(RefCell::new(crate::feature::base::BaseFeature::new())),
    }
}
