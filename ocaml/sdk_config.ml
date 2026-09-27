(* Generated API configuration (mirrors go core/config.go).
 *
 * make_config () — the embedded API model as a voxgig struct value.
 * make_feature name — the N-feature-safe factory the client uses. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Sdk_features

let make_config () : value =
  (jo [
    ("main", (jo [
      ("name", (Str "BluefinTecsMerchantPortal"));
      ("slug", (Str "bluefin-tecs-merchant-portal"));
      ("version", (Str "0.1.1"));
      ("target", (Str "ocaml")) ]));
    ("feature", (jo [
      ("audit", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("actor", (Str "anonymous"));
          ("max", (Num (1000.))) ]));
        ("optspec", (jo [
          ("now", (Str "`$FUNCTION`"));
          ("sink", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("clienttrack", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("clientVersion", (Str "0.0.1")) ]));
        ("optspec", (jo [
          ("clientName", (Str "`$STRING`"));
          ("clientVersion", (Str "`$STRING`"));
          ("headers", (Str "`$MAP`"));
          ("idgen", (Str "`$FUNCTION`"));
          ("sessionId", (Str "`$STRING`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("debug", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("max", (Num (100.)));
          ("redact", (ja [
            (Str "authorization");
            (Str "cookie");
            (Str "set-cookie");
            (Str "api-key");
            (Str "apikey");
            (Str "x-api-key");
            (Str "idempotency-key") ])) ]));
        ("optspec", (jo [
          ("now", (Str "`$FUNCTION`"));
          ("onEntry", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("idempotency", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("header", (Str "Idempotency-Key"));
          ("methods", (ja [
            (Str "POST");
            (Str "PUT");
            (Str "PATCH");
            (Str "DELETE") ]));
          ("ops", (ja [
            (Str "create");
            (Str "update");
            (Str "remove") ])) ]));
        ("optspec", (jo [
          ("keygen", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("log", (jo [
        ("options", (jo [
          ("active", (Bool true)) ]));
        ("optspec", (jo [
          ("level", (Str "`$STRING`"));
          ("logger", (Str "`$ANY`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("metrics", (jo [
        ("options", (jo [
          ("active", (Bool false)) ]));
        ("optspec", (jo [
          ("now", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("paging", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("afterVar", (Str "after"));
          ("cursorParam", (Str "cursor"));
          ("firstVar", (Str "first"));
          ("limitParam", (Str "limit"));
          ("pageParam", (Str "page"));
          ("startPage", (Num (1.))) ]));
        ("optspec", (jo [
          ("limit", (Str "`$NUMBER`"));
          ("ops", (Str "`$LIST`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("ratelimit", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("burst", (Num (5.)));
          ("rate", (Num (5.))) ]));
        ("optspec", (jo [
          ("now", (Str "`$FUNCTION`"));
          ("sleep", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "wrap")) ]));
      ("retry", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("factor", (Num (2.)));
          ("maxDelay", (Num (2000.)));
          ("minDelay", (Num (50.)));
          ("retries", (Num (2.)));
          ("statuses", (ja [
            (Num (408.));
            (Num (425.));
            (Num (429.));
            (Num (500.));
            (Num (502.));
            (Num (503.));
            (Num (504.)) ])) ]));
        ("optspec", (jo [
          ("jitter", (Str "`$BOOLEAN`"));
          ("sleep", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "wrap")) ]));
      ("telemetry", (jo [
        ("options", (jo [
          ("active", (Bool false)) ]));
        ("optspec", (jo [
          ("exporter", (Str "`$FUNCTION`"));
          ("headers", (Str "`$MAP`"));
          ("idgen", (Str "`$FUNCTION`"));
          ("now", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("test", (jo [
        ("options", (jo [
          ("active", (Bool false)) ]));
        ("optspec", (jo [
          ("entity", (Str "`$MAP`"));
          ("net", (Str "`$MAP`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "base")) ]));
      ("timeout", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("ms", (Num (30000.))) ]));
        ("optspec", (jo [
          ("clearTimer", (Str "`$FUNCTION`"));
          ("setTimer", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "wrap")) ])) ]));
    ("options", (jo [
      ("base", (Str "https://test.tecs.at"));
      ("headers", (jo [
        ("content-type", (Str "application/json")) ]));
      ("entity", (jo [
        ("merchant_portal_api_controller", (empty_map ()));
        ("merchant_portal_common_controller", (empty_map ()));
        ("merchant_portal_pam_contract_controller", (empty_map ()));
        ("merchant_portal_pam_document_controller", (empty_map ()));
        ("merchant_portal_pam_form_controller", (empty_map ()));
        ("merchant_portal_pam_mandator_controller", (empty_map ()));
        ("merchant_portal_pam_merchant_controller", (empty_map ()));
        ("merchant_portal_pam_package_controller", (empty_map ()));
        ("merchant_portal_pam_product_controller", (empty_map ()));
        ("output_add_product", (empty_map ()));
        ("output_create_product", (empty_map ()));
        ("output_detail", (empty_map ()));
        ("output_list", (empty_map ()));
        ("output_message", (empty_map ()));
        ("output_move_tid", (empty_map ()));
        ("output_remove_product", (empty_map ()));
        ("output_start", (empty_map ()));
        ("output_status", (empty_map ()));
        ("output_update_product", (empty_map ())) ])) ]));
    ("entity", (jo [
      ("merchant_portal_api_controller", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "account_number"));
            ("title", (Str "Account Number"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "Account number provided by the acquirer."));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "additional_data"));
            ("title", (Str "Additional Data"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Arbitrary merchant-specific data related to terminal registration.")) ]);
          (jo [
            ("name", (Str "business_reg_number"));
            ("title", (Str "Business Reg Number"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Merchant business registration number as stated in the company registry.")) ]);
          (jo [
            ("name", (Str "city"));
            ("title", (Str "City"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Merchant's address: city.")) ]);
          (jo [
            ("name", (Str "corporateuuid"));
            ("title", (Str "Corporateuuid"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Unique identifier for the corporate entity (UUID format).")) ]);
          (jo [
            ("name", (Str "country"));
            ("title", (Str "Country"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format).")) ]);
          (jo [
            ("name", (Str "currency"));
            ("title", (Str "Currency"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Transaction currency (must be in \"ISO 4217\" format).")) ]);
          (jo [
            ("name", (Str "merchant_category_code"));
            ("title", (Str "Merchant Category Code"));
            ("type", (Str "`$INTEGER`"));
            ("req", (Bool true));
            ("short", (Str "Merchant category code as defined by the payment network."));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "merchant_email"));
            ("title", (Str "Merchant Email"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Merchant's email address for receiving notifications."));
            ("format", (Str "email")) ]);
          (jo [
            ("name", (Str "merchant_name"));
            ("title", (Str "Merchant Name"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "The officially incorporated company name of the merchant.")) ]);
          (jo [
            ("name", (Str "merchant_phone_number"));
            ("title", (Str "Merchant Phone Number"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Merchant's phone number for notifications.")) ]);
          (jo [
            ("name", (Str "packageid"));
            ("title", (Str "Packageid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Identifier of the package in the TECS processing engine provided by TECS.")) ]);
          (jo [
            ("name", (Str "packageorderuuid"));
            ("title", (Str "Packageorderuuid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call.")) ]);
          (jo [
            ("name", (Str "password"));
            ("title", (Str "Password"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Merchant password for MPOS.")) ]);
          (jo [
            ("name", (Str "productid"));
            ("title", (Str "Productid"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Identifier of the product for which terminal registration is to be performed.")) ]);
          (jo [
            ("name", (Str "productid_acquirer"));
            ("title", (Str "Productid Acquirer"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Identifier of the product for which acquiring is enabled.")) ]);
          (jo [
            ("name", (Str "reason_deactivation"));
            ("title", (Str "Reason Deactivation"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Reason for terminal deactivation.")) ]);
          (jo [
            ("name", (Str "reason_reactivation"));
            ("title", (Str "Reason Reactivation"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Reason for terminal reactivation.")) ]);
          (jo [
            ("name", (Str "sorting_code"));
            ("title", (Str "Sorting Code"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "Sorting code provided by the acquirer."));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "state"));
            ("title", (Str "State"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Merchant's address: state.")) ]);
          (jo [
            ("name", (Str "street"));
            ("title", (Str "Street"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Merchant's address: street and house number.")) ]);
          (jo [
            ("name", (Str "terminal_country_code"));
            ("title", (Str "Terminal Country Code"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Terminal country code (must be in 'ISO-3166 ALPHA-3' format).")) ]);
          (jo [
            ("name", (Str "terminal_language_code"));
            ("title", (Str "Terminal Language Code"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Terminal language code (must be in 'ISO 639-1' format).")) ]);
          (jo [
            ("name", (Str "terminal_location"));
            ("title", (Str "Terminal Location"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Physical or logical location of the terminal.")) ]);
          (jo [
            ("name", (Str "terminal_serial_number"));
            ("title", (Str "Terminal Serial Number"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Terminal serial number.")) ]);
          (jo [
            ("name", (Str "terminalid"));
            ("title", (Str "Terminalid"));
            ("type", (Str "`$INTEGER`"));
            ("req", (Bool true));
            ("short", (Str "TECS terminalid given by Tecs processing engine."));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "terminalid_acquirer"));
            ("title", (Str "Terminalid Acquirer"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Terminal ID as set by the acquirer (optional).")) ]);
          (jo [
            ("name", (Str "user_email"));
            ("title", (Str "User Email"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Email address of the user acting on behalf of the merchant."));
            ("format", (Str "email")) ]);
          (jo [
            ("name", (Str "user_phone_number"));
            ("title", (Str "User Phone Number"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Phone number of the user acting on behalf of the merchant.")) ]);
          (jo [
            ("name", (Str "username"));
            ("title", (Str "Username"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Merchant username for MPOS.")) ]);
          (jo [
            ("name", (Str "vu_nummer"));
            ("title", (Str "Vu Nummer"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Merchant contract number with the acquirer.")) ]);
          (jo [
            ("name", (Str "web_shop_url"));
            ("title", (Str "Web Shop Url"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "URL of the merchant's web shop."));
            ("format", (Str "uri")) ]);
          (jo [
            ("name", (Str "zipcode"));
            ("title", (Str "Zipcode"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Merchant's address: postal code.")) ]) ]));
        ("name", (Str "merchant_portal_api_controller"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/deactivateTerminal"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "deactivateTerminal")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "deactivateTerminal") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/reactivateTerminal"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "reactivateTerminal")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "reactivateTerminal") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/registerAdditionalTerminal"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "registerAdditionalTerminal")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "registerAdditionalTerminal") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/registerNewMerchant"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "registerNewMerchant")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "registerNewMerchant") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("merchant_portal_common_controller", (jo [
        ("fields", (empty_list ()));
        ("name", (Str "merchant_portal_common_controller"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/merchantportalws/logDeveloperInfo"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "logDeveloperInfo")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "logDeveloperInfo") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ())) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/merchantportalws/version"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "version")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "version") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ())) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("merchant_portal_pam_contract_controller", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "language"));
            ("title", (Str "Language"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "productOrderUUID"));
            ("title", (Str "Product Order Uuid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]) ]));
        ("name", (Str "merchant_portal_pam_contract_controller"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/generateContract"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "generateContract")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "generateContract") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/uploadContract"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "uploadContract")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "uploadContract") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("merchant_portal_pam_document_controller", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "appFormFieldDescUUID"));
            ("title", (Str "App Form Field Desc Uuid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "packageOrderUUID"));
            ("title", (Str "Package Order Uuid"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "UUID of the package order.")) ]);
          (jo [
            ("name", (Str "productOrderUUID"));
            ("title", (Str "Product Order Uuid"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "UUID of the product order.")) ]) ]));
        ("name", (Str "merchant_portal_pam_document_controller"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/documentsList"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "documentsList")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "documentsList") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/downloadDocument"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "downloadDocument")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "downloadDocument") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("merchant_portal_pam_form_controller", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "appFormFieldsDescUUID"));
            ("title", (Str "App Form Fields Desc Uuid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "filter"));
            ("title", (Str "Filter"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "language"));
            ("title", (Str "Language"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("op", (jo [
              ("create", (jo [
                ("type", (Str "`$STRING`")) ])) ])) ]);
          (jo [
            ("name", (Str "packageOrder"));
            ("title", (Str "Package Order"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "packageOrderUUID"));
            ("title", (Str "Package Order Uuid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("op", (jo [
              ("create", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "UUID of the package order.")) ]);
          (jo [
            ("name", (Str "packageUUID"));
            ("title", (Str "Package Uuid"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productOrderUUID"));
            ("title", (Str "Product Order Uuid"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "UUID of the product order.")) ]);
          (jo [
            ("name", (Str "productOrders"));
            ("title", (Str "Product Orders"));
            ("type", (Str "`$ARRAY`")) ]);
          (jo [
            ("name", (Str "reasonOfReopening"));
            ("title", (Str "Reason Of Reopening"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]) ]));
        ("name", (Str "merchant_portal_pam_form_controller"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/applicationForm"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "applicationForm")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "applicationForm") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/packageForm"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "packageForm")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "packageForm") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/reopenForm"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "reopenForm")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "reopenForm") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/secretKey"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "secretKey")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "secretKey") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/submitForm"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "submitForm")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "submitForm") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/submitValues"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "submitValues")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "submitValues") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("merchant_portal_pam_mandator_controller", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "clientSecret"));
            ("title", (Str "Client Secret"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "mandatorName"));
            ("title", (Str "Mandator Name"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "notificationEmail"));
            ("title", (Str "Notification Email"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageUUID"));
            ("title", (Str "Package Uuid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]) ]));
        ("name", (Str "merchant_portal_pam_mandator_controller"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/createMandatorConfig"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "createMandatorConfig")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "createMandatorConfig") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/introduceMandatorPackage"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "introduceMandatorPackage")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "introduceMandatorPackage") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/selfRegistrationLink"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "selfRegistrationLink")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "selfRegistrationLink") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("merchant_portal_pam_merchant_controller", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "additional_data"));
            ("title", (Str "Additional Data"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Optional additional merchant-specific data related to enabling acquiring.")) ]);
          (jo [
            ("name", (Str "businessRegistrationNumber"));
            ("title", (Str "Business Registration Number"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "city"));
            ("title", (Str "City"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "City where the merchant is located.")) ]);
          (jo [
            ("name", (Str "companyName"));
            ("title", (Str "Company Name"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "corporateUUID"));
            ("title", (Str "Corporate Uuid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Unique identifier for the corporate entity.")) ]);
          (jo [
            ("name", (Str "country"));
            ("title", (Str "Country"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Country where the merchant is located.")) ]);
          (jo [
            ("name", (Str "currency"));
            ("title", (Str "Currency"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Transaction currency in ISO 4217 format.")) ]);
          (jo [
            ("name", (Str "email"));
            ("title", (Str "Email"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "language"));
            ("title", (Str "Language"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "login"));
            ("title", (Str "Login"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "mandator"));
            ("title", (Str "Mandator"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Mandator name assigned by TECS.")) ]);
          (jo [
            ("name", (Str "merchantContractNumber"));
            ("title", (Str "Merchant Contract Number"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("op", (jo [
              ("create", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "Unique identifier for the merchant within a specific system.")) ]);
          (jo [
            ("name", (Str "merchantName"));
            ("title", (Str "Merchant Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Name of the merchant.")) ]);
          (jo [
            ("name", (Str "merchant_category_code"));
            ("title", (Str "Merchant Category Code"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Merchant Category Code (MCC) describing the merchant’s type of business.")) ]);
          (jo [
            ("name", (Str "packageUUID"));
            ("title", (Str "Package Uuid"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "UUID of the package.")) ]);
          (jo [
            ("name", (Str "packageorderuuid"));
            ("title", (Str "Packageorderuuid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Unique identifier for the registered merchant in the TECS system.")) ]);
          (jo [
            ("name", (Str "phoneNumber"));
            ("title", (Str "Phone Number"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "postalCode"));
            ("title", (Str "Postal Code"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Postal or ZIP code of the merchant’s location.")) ]);
          (jo [
            ("name", (Str "productid_acquirer"));
            ("title", (Str "Productid Acquirer"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Identifier of the product for which acquiring is to be enabled.")) ]);
          (jo [
            ("name", (Str "region"));
            ("title", (Str "Region"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "State or province where the merchant is located.")) ]);
          (jo [
            ("name", (Str "registrationNumber"));
            ("title", (Str "Registration Number"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Business registration number.")) ]);
          (jo [
            ("name", (Str "signature"));
            ("title", (Str "Signature"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Signature value = saltAsHex-hashAsHex.")) ]);
          (jo [
            ("name", (Str "street"));
            ("title", (Str "Street"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Street address of the merchant.")) ]);
          (jo [
            ("name", (Str "terminalIds"));
            ("title", (Str "Terminal Ids"));
            ("type", (Str "`$ARRAY`"));
            ("short", (Str "Optional list of terminal IDs for which acquiring should be activated.")) ]);
          (jo [
            ("name", (Str "terminalid_acquirer"));
            ("title", (Str "Terminalid Acquirer"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Optional terminal ID provided by the acquirer.")) ]);
          (jo [
            ("name", (Str "vu_nummer"));
            ("title", (Str "Vu Nummer"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Merchant contract number with the acquirer.")) ]) ]));
        ("name", (Str "merchant_portal_pam_merchant_controller"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/contractNumber"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "contractNumber")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "contractNumber") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/registerAdditionalAcquiring"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "registerAdditionalAcquiring")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "registerAdditionalAcquiring") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/updateMerchant"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "updateMerchant")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "updateMerchant") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/registerMerchant"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "registerMerchant")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "registerMerchant") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ())) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("merchant_portal_pam_package_controller", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "consumerUUID"));
            ("title", (Str "Consumer Uuid"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "corporateUUID"));
            ("title", (Str "Corporate Uuid"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "country"));
            ("title", (Str "Country"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Country associated with the package.")) ]);
          (jo [
            ("name", (Str "descriptionKey"));
            ("title", (Str "Description Key"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Key for the description of the package.")) ]);
          (jo [
            ("name", (Str "filter"));
            ("title", (Str "Filter"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "language"));
            ("title", (Str "Language"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("op", (jo [
              ("create", (jo [
                ("type", (Str "`$STRING`")) ])) ])) ]);
          (jo [
            ("name", (Str "nameKey"));
            ("title", (Str "Name Key"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Key for the name of the package.")) ]);
          (jo [
            ("name", (Str "packageStatus"));
            ("title", (Str "Package Status"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Status of the package.")) ]);
          (jo [
            ("name", (Str "packageUUID"));
            ("title", (Str "Package Uuid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Unique identifier for the package.")) ]);
          (jo [
            ("name", (Str "pagination"));
            ("title", (Str "Pagination"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "sorting"));
            ("title", (Str "Sorting"));
            ("type", (Str "`$OBJECT`")) ]) ]));
        ("name", (Str "merchant_portal_pam_package_controller"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/availablePackages"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "availablePackages")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "availablePackages") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/orderPackage"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "orderPackage")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "orderPackage") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/orderedPackages"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "orderedPackages")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "orderedPackages") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/packageTemplates"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "packageTemplates")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "packageTemplates") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/updatePackageData"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "updatePackageData")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "updatePackageData") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header")) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("merchant_portal_pam_product_controller", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "consumerUUID"));
            ("title", (Str "Consumer Uuid"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "filter"));
            ("title", (Str "Filter"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "language"));
            ("title", (Str "Language"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "merchantID"));
            ("title", (Str "Merchant Id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageOrderUUID"));
            ("title", (Str "Package Order Uuid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "pagination"));
            ("title", (Str "Pagination"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "productOrderUUID"));
            ("title", (Str "Product Order Uuid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "productUUID"));
            ("title", (Str "Product Uuid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "reason_decline"));
            ("title", (Str "Reason Decline"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Reason for product decline.")) ]);
          (jo [
            ("name", (Str "sorting"));
            ("title", (Str "Sorting"));
            ("type", (Str "`$OBJECT`")) ]) ]));
        ("name", (Str "merchant_portal_pam_product_controller"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/approveProduct"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "approveProduct")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "approveProduct") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/declineProduct"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "declineProduct")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "declineProduct") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/orderAdditionalProduct"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "orderAdditionalProduct")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "orderAdditionalProduct") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/productsList"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "productsList")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "productsList") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_add_product", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "packageUUID"));
            ("title", (Str "Package Uuid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Unique identifier for the package.")) ]);
          (jo [
            ("name", (Str "productUUIDs"));
            ("title", (Str "Product Uui Ds"));
            ("type", (Str "`$ARRAY`"));
            ("req", (Bool true));
            ("short", (Str "The list of unique identifiers of the products.")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("title", (Str "Response Code"));
            ("type", (Str "`$INTEGER`"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("title", (Str "Response Message"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Response message.")) ]) ]));
        ("name", (Str "output_add_product"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/addProductsToPackage"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "addProductsToPackage")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "addProductsToPackage") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_create_product", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "acquirerId"));
            ("title", (Str "Acquirer Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Unique identifier for the acquirer.")) ]);
          (jo [
            ("name", (Str "allowMultipleOrders"));
            ("title", (Str "Allow Multiple Orders"));
            ("type", (Str "`$BOOLEAN`"));
            ("req", (Bool true));
            ("short", (Str "Indication whether multiple orders are allowed or not.")) ]);
          (jo [
            ("name", (Str "appFormTemplateName"));
            ("title", (Str "App Form Template Name"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Name of the application form template.")) ]);
          (jo [
            ("name", (Str "contractNeeded"));
            ("title", (Str "Contract Needed"));
            ("type", (Str "`$BOOLEAN`"));
            ("req", (Bool true));
            ("short", (Str "Indication whether contract is needed or not.")) ]);
          (jo [
            ("name", (Str "credentialsNeeded"));
            ("title", (Str "Credentials Needed"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "Indication whether credentials are needed or not.")) ]);
          (jo [
            ("name", (Str "descriptionKey"));
            ("title", (Str "Description Key"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Key indicator for product description.")) ]);
          (jo [
            ("name", (Str "nameKey"));
            ("title", (Str "Name Key"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Key indicator for product name.")) ]);
          (jo [
            ("name", (Str "prescreeningAllowed"));
            ("title", (Str "Prescreening Allowed"));
            ("type", (Str "`$BOOLEAN`"));
            ("req", (Bool true));
            ("short", (Str "Indication whether prescreening is allowed or not.")) ]);
          (jo [
            ("name", (Str "productName"));
            ("title", (Str "Product Name"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Name of the product.")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("title", (Str "Response Code"));
            ("type", (Str "`$INTEGER`"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("title", (Str "Response Message"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Response message.")) ]);
          (jo [
            ("name", (Str "terminalTemplateName"));
            ("title", (Str "Terminal Template Name"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Name of the terminal template.")) ]);
          (jo [
            ("name", (Str "vendorName"));
            ("title", (Str "Vendor Name"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Name of the vendor.")) ]);
          (jo [
            ("name", (Str "xmlTemplateFile"));
            ("title", (Str "Xml Template File"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "A string value containing the XML template file encoded in Base64.")) ]) ]));
        ("name", (Str "output_create_product"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/createNewProduct"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "createNewProduct")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "createNewProduct") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_detail", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "batch"));
            ("title", (Str "Batch"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "lines"));
            ("title", (Str "Lines"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "progress"));
            ("title", (Str "Progress"));
            ("type", (Str "`$OBJECT`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
        ("name", (Str "output_detail"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/merchantportalws/batch/registerAdditionalTerminal/details/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "batch")) ]);
                  (jo [
                    ("lit", (Str "registerAdditionalTerminal")) ]);
                  (jo [
                    ("lit", (Str "details")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "batch");
                  (Str "registerAdditionalTerminal");
                  (Str "details");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.details`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ]));
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization");
                    (Str "id") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_list", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "items"));
            ("title", (Str "Items"));
            ("type", (Str "`$ARRAY`")) ]);
          (jo [
            ("name", (Str "pagination"));
            ("title", (Str "Pagination"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("op", (jo [
              ("create", (jo [
                ("type", (Str "`$OBJECT`")) ])) ])) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("title", (Str "Response Code"));
            ("type", (Str "`$INTEGER`"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("title", (Str "Response Message"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Response message.")) ]);
          (jo [
            ("name", (Str "sorting"));
            ("title", (Str "Sorting"));
            ("type", (Str "`$OBJECT`")) ]) ]));
        ("name", (Str "output_list"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/batch/registerAdditionalTerminal/list"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "batch")) ]);
                  (jo [
                    ("lit", (Str "registerAdditionalTerminal")) ]);
                  (jo [
                    ("lit", (Str "list")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "batch");
                  (Str "registerAdditionalTerminal");
                  (Str "list") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_message", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("title", (Str "Response Code"));
            ("type", (Str "`$INTEGER`"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("title", (Str "Response Message"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Response message.")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
        ("name", (Str "output_message"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/merchantportalws/batch/registerAdditionalTerminal/restart/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "batch")) ]);
                  (jo [
                    ("lit", (Str "registerAdditionalTerminal")) ]);
                  (jo [
                    ("lit", (Str "restart")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "batch");
                  (Str "registerAdditionalTerminal");
                  (Str "restart");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ]));
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization");
                    (Str "id") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/merchantportalws/batch/registerAdditionalTerminal/stop/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "batch")) ]);
                  (jo [
                    ("lit", (Str "registerAdditionalTerminal")) ]);
                  (jo [
                    ("lit", (Str "stop")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "batch");
                  (Str "registerAdditionalTerminal");
                  (Str "stop");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ]));
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization");
                    (Str "id") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_move_tid", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "productOrderUUIDs"));
            ("title", (Str "Product Order Uui Ds"));
            ("type", (Str "`$ARRAY`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("title", (Str "Response Code"));
            ("type", (Str "`$INTEGER`"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("title", (Str "Response Message"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Response message.")) ]);
          (jo [
            ("name", (Str "targetPackageOrderUUID"));
            ("title", (Str "Target Package Order Uuid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "targetProductOrderUUID"));
            ("title", (Str "Target Product Order Uuid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true)) ]) ]));
        ("name", (Str "output_move_tid"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/moveTid"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "moveTid")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "moveTid") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_remove_product", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "packageUUID"));
            ("title", (Str "Package Uuid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Unique identifier for the package.")) ]);
          (jo [
            ("name", (Str "productUUIDs"));
            ("title", (Str "Product Uui Ds"));
            ("type", (Str "`$ARRAY`"));
            ("req", (Bool true));
            ("short", (Str "List of product unique identifiers.")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("title", (Str "Response Code"));
            ("type", (Str "`$INTEGER`"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("title", (Str "Response Message"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Response message.")) ]) ]));
        ("name", (Str "output_remove_product"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/removeProductsFromPackage"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "removeProductsFromPackage")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "removeProductsFromPackage") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_start", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("title", (Str "Response Code"));
            ("type", (Str "`$INTEGER`"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("title", (Str "Response Message"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Response message.")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
        ("name", (Str "output_start"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/batch/registerAdditionalTerminal/start"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "batch")) ]);
                  (jo [
                    ("lit", (Str "registerAdditionalTerminal")) ]);
                  (jo [
                    ("lit", (Str "start")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "batch");
                  (Str "registerAdditionalTerminal");
                  (Str "start") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_status", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "percentage"));
            ("title", (Str "Percentage"));
            ("type", (Str "`$INTEGER`"));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("title", (Str "Response Code"));
            ("type", (Str "`$INTEGER`"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("title", (Str "Response Message"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Response message.")) ]);
          (jo [
            ("name", (Str "status"));
            ("title", (Str "Status"));
            ("type", (Str "`$STRING`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
        ("name", (Str "output_status"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/merchantportalws/batch/registerAdditionalTerminal/status/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "batch")) ]);
                  (jo [
                    ("lit", (Str "registerAdditionalTerminal")) ]);
                  (jo [
                    ("lit", (Str "status")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "batch");
                  (Str "registerAdditionalTerminal");
                  (Str "status");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ]));
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization");
                    (Str "id") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_update_product", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "allowMultipleOrders"));
            ("title", (Str "Allow Multiple Orders"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "An attribute to indicate if multiple orders are allowed")) ]);
          (jo [
            ("name", (Str "appFormName"));
            ("title", (Str "App Form Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The name of the application form")) ]);
          (jo [
            ("name", (Str "contractNeeded"));
            ("title", (Str "Contract Needed"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "An attribute to indicate if a contract is needed")) ]);
          (jo [
            ("name", (Str "credentialsNeeded"));
            ("title", (Str "Credentials Needed"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "An attribute to indicate if credentials are needed")) ]);
          (jo [
            ("name", (Str "descriptionKey"));
            ("title", (Str "Description Key"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The description of the product")) ]);
          (jo [
            ("name", (Str "nameKey"));
            ("title", (Str "Name Key"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The key of the product name")) ]);
          (jo [
            ("name", (Str "prescreeningAllowed"));
            ("title", (Str "Prescreening Allowed"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "An attribute to indicate if prescreening is allowed")) ]);
          (jo [
            ("name", (Str "productName"));
            ("title", (Str "Product Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The name of the product")) ]);
          (jo [
            ("name", (Str "productStatus"));
            ("title", (Str "Product Status"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The status of the product")) ]);
          (jo [
            ("name", (Str "productUUID"));
            ("title", (Str "Product Uuid"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "The UUID of the product to update")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("title", (Str "Response Code"));
            ("type", (Str "`$INTEGER`"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("title", (Str "Response Message"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "Response message.")) ]);
          (jo [
            ("name", (Str "vendorName"));
            ("title", (Str "Vendor Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The name of the vendor")) ]) ]));
        ("name", (Str "output_update_product"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/updateProduct"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "merchantportalws")) ]);
                  (jo [
                    ("lit", (Str "updateProduct")) ]) ]));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "updateProduct") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ])) ])) ])

(* The plugin definitions the model selected, per feature: none - no
 * plugin-bearing feature is active in this SDK. *)
let feature_plugins (_name : string) = []

let make_feature (name : string) : feature =
  match name with
  | "audit" -> audit_feature ()
  | "clienttrack" -> clienttrack_feature ()
  | "debug" -> debug_feature ()
  | "idempotency" -> idempotency_feature ()
  | "log" -> log_feature ()
  | "metrics" -> metrics_feature ()
  | "paging" -> paging_feature ()
  | "ratelimit" -> ratelimit_feature ()
  | "retry" -> retry_feature ()
  | "telemetry" -> telemetry_feature ()
  | "test" -> test_feature ()
  | "timeout" -> timeout_feature ()
  | _ -> base_feature ()
