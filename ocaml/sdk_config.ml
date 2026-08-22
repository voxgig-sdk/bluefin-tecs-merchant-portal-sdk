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
      ("name", (Str "BluefinTecsMerchantPortal")) ]));
    ("feature", (jo [
      ("test", (jo [
        ("options", (jo [
          ("active", (Bool false)) ])) ])) ]));
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
            ("short", (Str "Account number provided by the acquirer."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "additional_data"));
            ("short", (Str "Arbitrary merchant-specific data related to terminal registration."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "business_reg_number"));
            ("req", (Bool true));
            ("short", (Str "Merchant business registration number as stated in the company registry."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "city"));
            ("req", (Bool true));
            ("short", (Str "Merchant's address: city."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "corporateuuid"));
            ("short", (Str "Unique identifier for the corporate entity (UUID format)."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "country"));
            ("req", (Bool true));
            ("short", (Str "Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format)."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "currency"));
            ("req", (Bool true));
            ("short", (Str "Transaction currency (must be in \"ISO 4217\" format)."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "merchant_category_code"));
            ("req", (Bool true));
            ("short", (Str "Merchant category code as defined by the payment network."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "merchant_email"));
            ("short", (Str "Merchant's email address for receiving notifications."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "merchant_name"));
            ("req", (Bool true));
            ("short", (Str "The officially incorporated company name of the merchant."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "merchant_phone_number"));
            ("short", (Str "Merchant's phone number for notifications."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageid"));
            ("req", (Bool true));
            ("short", (Str "Identifier of the package in the TECS processing engine provided by TECS."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageorderuuid"));
            ("req", (Bool true));
            ("short", (Str "Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "password"));
            ("short", (Str "Merchant password for MPOS."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productid"));
            ("short", (Str "Identifier of the product for which terminal registration is to be performed."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productid_acquirer"));
            ("short", (Str "Identifier of the product for which acquiring is enabled."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "reason_deactivation"));
            ("req", (Bool true));
            ("short", (Str "Reason for terminal deactivation."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "reason_reactivation"));
            ("req", (Bool true));
            ("short", (Str "Reason for terminal reactivation."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "sorting_code"));
            ("short", (Str "Sorting code provided by the acquirer."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "state"));
            ("short", (Str "Merchant's address: state."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "street"));
            ("req", (Bool true));
            ("short", (Str "Merchant's address: street and house number."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "terminal_country_code"));
            ("req", (Bool true));
            ("short", (Str "Terminal country code (must be in 'ISO-3166 ALPHA-3' format)."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "terminal_language_code"));
            ("req", (Bool true));
            ("short", (Str "Terminal language code (must be in 'ISO 639-1' format)."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "terminal_location"));
            ("req", (Bool true));
            ("short", (Str "Physical or logical location of the terminal."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "terminal_serial_number"));
            ("req", (Bool true));
            ("short", (Str "Terminal serial number."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "terminalid"));
            ("req", (Bool true));
            ("short", (Str "TECS terminalid given by Tecs processing engine."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "terminalid_acquirer"));
            ("short", (Str "Terminal ID as set by the acquirer (optional)."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "user_email"));
            ("short", (Str "Email address of the user acting on behalf of the merchant."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "user_phone_number"));
            ("short", (Str "Phone number of the user acting on behalf of the merchant."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "username"));
            ("short", (Str "Merchant username for MPOS."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "vu_nummer"));
            ("req", (Bool true));
            ("short", (Str "Merchant contract number with the acquirer."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "web_shop_url"));
            ("short", (Str "URL of the merchant's web shop."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "zipcode"));
            ("req", (Bool true));
            ("short", (Str "Merchant's address: postal code."));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "merchant_portal_api_controller"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/deactivateTerminal"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "deactivateTerminal") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/reactivateTerminal"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "reactivateTerminal") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/registerAdditionalTerminal"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "registerAdditionalTerminal") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/registerNewMerchant"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "registerNewMerchant") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
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
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/merchantportalws/logDeveloperInfo"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "logDeveloperInfo") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/merchantportalws/version"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "version") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("merchant_portal_pam_contract_controller", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "language"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productOrderUUID"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "merchant_portal_pam_contract_controller"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/generateContract"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "generateContract") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/uploadContract"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "uploadContract") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("merchant_portal_pam_document_controller", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "appFormFieldDescUUID"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageOrderUUID"));
            ("short", (Str "UUID of the package order."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productOrderUUID"));
            ("short", (Str "UUID of the product order."));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "merchant_portal_pam_document_controller"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/documentsList"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "documentsList") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/downloadDocument"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "downloadDocument") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("merchant_portal_pam_form_controller", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "appFormFieldsDescUUID"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "filter"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "language"));
            ("op", (jo [
              ("create", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageOrder"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "packageOrderUUID"));
            ("op", (jo [
              ("create", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("short", (Str "UUID of the package order."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageUUID"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productOrderUUID"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "UUID of the product order."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productOrders"));
            ("type", (Str "`$ARRAY`")) ]);
          (jo [
            ("name", (Str "reasonOfReopening"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "merchant_portal_pam_form_controller"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/applicationForm"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "applicationForm") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/packageForm"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "packageForm") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/reopenForm"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "reopenForm") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/secretKey"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "secretKey") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/submitForm"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "submitForm") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/submitValues"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "submitValues") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("merchant_portal_pam_mandator_controller", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "clientSecret"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "mandatorName"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "notificationEmail"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageUUID"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "merchant_portal_pam_mandator_controller"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/createMandatorConfig"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "createMandatorConfig") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/introduceMandatorPackage"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "introduceMandatorPackage") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/selfRegistrationLink"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "selfRegistrationLink") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("merchant_portal_pam_merchant_controller", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "additional_data"));
            ("short", (Str "Optional additional merchant-specific data related to enabling acquiring."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "businessRegistrationNumber"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "city"));
            ("short", (Str "City where the merchant is located."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "companyName"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "corporateUUID"));
            ("req", (Bool true));
            ("short", (Str "Unique identifier for the corporate entity."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "country"));
            ("short", (Str "Country where the merchant is located."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "currency"));
            ("req", (Bool true));
            ("short", (Str "Transaction currency in ISO 4217 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "email"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "language"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "login"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "mandator"));
            ("req", (Bool true));
            ("short", (Str "Mandator name assigned by TECS."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "merchantContractNumber"));
            ("op", (jo [
              ("create", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("short", (Str "Unique identifier for the merchant within a specific system."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "merchantName"));
            ("short", (Str "Name of the merchant."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "merchant_category_code"));
            ("short", (Str "Merchant Category Code (MCC) describing the merchant’s type of business."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageUUID"));
            ("short", (Str "UUID of the package."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageorderuuid"));
            ("req", (Bool true));
            ("short", (Str "Unique identifier for the registered merchant in the TECS system."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "phoneNumber"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "postalCode"));
            ("short", (Str "Postal or ZIP code of the merchant’s location."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productid_acquirer"));
            ("req", (Bool true));
            ("short", (Str "Identifier of the product for which acquiring is to be enabled."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "region"));
            ("short", (Str "State or province where the merchant is located."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "registrationNumber"));
            ("short", (Str "Business registration number."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "signature"));
            ("short", (Str "Signature value = saltAsHex-hashAsHex."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "street"));
            ("short", (Str "Street address of the merchant."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "terminalIds"));
            ("short", (Str "Optional list of terminal IDs for which acquiring should be activated."));
            ("type", (Str "`$ARRAY`")) ]);
          (jo [
            ("name", (Str "terminalid_acquirer"));
            ("short", (Str "Optional terminal ID provided by the acquirer."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "vu_nummer"));
            ("req", (Bool true));
            ("short", (Str "Merchant contract number with the acquirer."));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "merchant_portal_pam_merchant_controller"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/contractNumber"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "contractNumber") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/registerAdditionalAcquiring"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "registerAdditionalAcquiring") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/updateMerchant"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "updateMerchant") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/registerMerchant"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "registerMerchant") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("merchant_portal_pam_package_controller", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "consumerUUID"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "corporateUUID"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "country"));
            ("short", (Str "Country associated with the package."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "descriptionKey"));
            ("short", (Str "Key for the description of the package."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "filter"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "language"));
            ("op", (jo [
              ("create", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "nameKey"));
            ("short", (Str "Key for the name of the package."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageStatus"));
            ("short", (Str "Status of the package."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageUUID"));
            ("req", (Bool true));
            ("short", (Str "Unique identifier for the package."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "pagination"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "sorting"));
            ("type", (Str "`$OBJECT`")) ]) ]));
        ("name", (Str "merchant_portal_pam_package_controller"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/availablePackages"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "availablePackages") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/orderPackage"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "orderPackage") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/orderedPackages"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "orderedPackages") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/packageTemplates"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "packageTemplates") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/updatePackageData"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "updatePackageData") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("merchant_portal_pam_product_controller", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "consumerUUID"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "filter"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "language"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "merchantID"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageOrderUUID"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "pagination"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "productOrderUUID"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productUUID"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "reason_decline"));
            ("req", (Bool true));
            ("short", (Str "Reason for product decline."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "sorting"));
            ("type", (Str "`$OBJECT`")) ]) ]));
        ("name", (Str "merchant_portal_pam_product_controller"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/approveProduct"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "approveProduct") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/declineProduct"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "declineProduct") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/orderAdditionalProduct"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "orderAdditionalProduct") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/productsList"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "productsList") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_add_product", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "packageUUID"));
            ("req", (Bool true));
            ("short", (Str "Unique identifier for the package."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productUUIDs"));
            ("req", (Bool true));
            ("short", (Str "The list of unique identifiers of the products."));
            ("type", (Str "`$ARRAY`")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
            ("short", (Str "Response message."));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "output_add_product"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/addProductsToPackage"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "addProductsToPackage") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_create_product", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "acquirerId"));
            ("short", (Str "Unique identifier for the acquirer."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "allowMultipleOrders"));
            ("req", (Bool true));
            ("short", (Str "Indication whether multiple orders are allowed or not."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "appFormTemplateName"));
            ("req", (Bool true));
            ("short", (Str "Name of the application form template."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "contractNeeded"));
            ("req", (Bool true));
            ("short", (Str "Indication whether contract is needed or not."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "credentialsNeeded"));
            ("short", (Str "Indication whether credentials are needed or not."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "descriptionKey"));
            ("req", (Bool true));
            ("short", (Str "Key indicator for product description."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "nameKey"));
            ("req", (Bool true));
            ("short", (Str "Key indicator for product name."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "prescreeningAllowed"));
            ("req", (Bool true));
            ("short", (Str "Indication whether prescreening is allowed or not."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "productName"));
            ("req", (Bool true));
            ("short", (Str "Name of the product."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
            ("short", (Str "Response message."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "terminalTemplateName"));
            ("req", (Bool true));
            ("short", (Str "Name of the terminal template."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "vendorName"));
            ("req", (Bool true));
            ("short", (Str "Name of the vendor."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "xmlTemplateFile"));
            ("req", (Bool true));
            ("short", (Str "A string value containing the XML template file encoded in Base64."));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "output_create_product"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/createNewProduct"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "createNewProduct") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_detail", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "batch"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "lines"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "progress"));
            ("type", (Str "`$OBJECT`")) ]) ]));
        ("name", (Str "output_detail"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ]));
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/merchantportalws/batch/registerAdditionalTerminal/details/{id}"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "batch");
                  (Str "registerAdditionalTerminal");
                  (Str "details");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization");
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.details`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_list", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "items"));
            ("type", (Str "`$ARRAY`")) ]);
          (jo [
            ("name", (Str "pagination"));
            ("op", (jo [
              ("create", (jo [
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
            ("short", (Str "Response message."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "sorting"));
            ("type", (Str "`$OBJECT`")) ]) ]));
        ("name", (Str "output_list"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/batch/registerAdditionalTerminal/list"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "batch");
                  (Str "registerAdditionalTerminal");
                  (Str "list") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_message", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "responseCode"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
            ("short", (Str "Response message."));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "output_message"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ]));
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/merchantportalws/batch/registerAdditionalTerminal/restart/{id}"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "batch");
                  (Str "registerAdditionalTerminal");
                  (Str "restart");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization");
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ]));
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/merchantportalws/batch/registerAdditionalTerminal/stop/{id}"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "batch");
                  (Str "registerAdditionalTerminal");
                  (Str "stop");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization");
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_move_tid", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "productOrderUUIDs"));
            ("req", (Bool true));
            ("type", (Str "`$ARRAY`")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
            ("short", (Str "Response message."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "targetPackageOrderUUID"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "targetProductOrderUUID"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "output_move_tid"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/moveTid"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "moveTid") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_remove_product", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "packageUUID"));
            ("req", (Bool true));
            ("short", (Str "Unique identifier for the package."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productUUIDs"));
            ("req", (Bool true));
            ("short", (Str "List of product unique identifiers."));
            ("type", (Str "`$ARRAY`")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
            ("short", (Str "Response message."));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "output_remove_product"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/removeProductsFromPackage"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "removeProductsFromPackage") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_start", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
            ("short", (Str "Response message."));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "output_start"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/batch/registerAdditionalTerminal/start"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "batch");
                  (Str "registerAdditionalTerminal");
                  (Str "start") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_status", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "percentage"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
            ("short", (Str "Response message."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "status"));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "output_status"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ]));
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/merchantportalws/batch/registerAdditionalTerminal/status/{id}"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "batch");
                  (Str "registerAdditionalTerminal");
                  (Str "status");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization");
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("output_update_product", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "allowMultipleOrders"));
            ("short", (Str "An attribute to indicate if multiple orders are allowed"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "appFormName"));
            ("short", (Str "The name of the application form"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "contractNeeded"));
            ("short", (Str "An attribute to indicate if a contract is needed"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "credentialsNeeded"));
            ("short", (Str "An attribute to indicate if credentials are needed"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "descriptionKey"));
            ("short", (Str "The description of the product"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "nameKey"));
            ("short", (Str "The key of the product name"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "prescreeningAllowed"));
            ("short", (Str "An attribute to indicate if prescreening is allowed"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "productName"));
            ("short", (Str "The name of the product"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productStatus"));
            ("short", (Str "The status of the product"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productUUID"));
            ("req", (Bool true));
            ("short", (Str "The UUID of the product to update"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("req", (Bool true));
            ("short", (Str "Response code."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
            ("short", (Str "Response message."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "vendorName"));
            ("short", (Str "The name of the vendor"));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "output_update_product"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "authorization"));
                      ("orig", (Str "authorization"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/merchantportalws/updateProduct"));
                ("parts", (ja [
                  (Str "merchantportalws");
                  (Str "updateProduct") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "authorization") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ])) ])) ])

let make_feature (name : string) : feature =
  match name with
  | "test" -> test_feature ()
  | _ -> base_feature ()
