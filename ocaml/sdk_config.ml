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
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "additional_data"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "business_reg_number"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "city"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "corporateuuid"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "country"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "currency"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "merchant_category_code"));
            ("req", (Bool true));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "merchant_email"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "merchant_name"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "merchant_phone_number"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageid"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageorderuuid"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "password"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productid"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productid_acquirer"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "reason_deactivation"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "reason_reactivation"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "sorting_code"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "state"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "street"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "terminal_country_code"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "terminal_language_code"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "terminal_location"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "terminal_serial_number"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "terminalid"));
            ("req", (Bool true));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "terminalid_acquirer"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "user_email"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "user_phone_number"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "username"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "vu_nummer"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "web_shop_url"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "zipcode"));
            ("req", (Bool true));
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
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productOrderUUID"));
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
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "businessRegistrationNumber"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "city"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "companyName"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "corporateUUID"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "country"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "currency"));
            ("req", (Bool true));
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
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "merchantContractNumber"));
            ("op", (jo [
              ("create", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "merchantName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "merchant_category_code"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageUUID"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageorderuuid"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "phoneNumber"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "postalCode"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productid_acquirer"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "region"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "registrationNumber"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "signature"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "street"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "terminalIds"));
            ("type", (Str "`$ARRAY`")) ]);
          (jo [
            ("name", (Str "terminalid_acquirer"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "vu_nummer"));
            ("req", (Bool true));
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
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "descriptionKey"));
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
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageStatus"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "packageUUID"));
            ("req", (Bool true));
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
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productUUIDs"));
            ("req", (Bool true));
            ("type", (Str "`$ARRAY`")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("req", (Bool true));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
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
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "allowMultipleOrders"));
            ("req", (Bool true));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "appFormTemplateName"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "contractNeeded"));
            ("req", (Bool true));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "credentialsNeeded"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "descriptionKey"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "nameKey"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "prescreeningAllowed"));
            ("req", (Bool true));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "productName"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("req", (Bool true));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "terminalTemplateName"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "vendorName"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "xmlTemplateFile"));
            ("req", (Bool true));
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
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
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
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
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
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
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
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
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
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productUUIDs"));
            ("req", (Bool true));
            ("type", (Str "`$ARRAY`")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("req", (Bool true));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
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
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
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
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
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
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "appFormName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "contractNeeded"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "credentialsNeeded"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "descriptionKey"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "nameKey"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "prescreeningAllowed"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "productName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productStatus"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productUUID"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "responseCode"));
            ("req", (Bool true));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "responseMessage"));
            ("req", (Bool true));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "vendorName"));
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
