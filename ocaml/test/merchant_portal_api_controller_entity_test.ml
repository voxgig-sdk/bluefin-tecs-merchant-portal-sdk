(* Generated merchant_portal_api_controller entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "merchant_portal_api_controller.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.merchant_portal_api_controller client Noval in
      check_str "name" ent.e_name "merchant_portal_api_controller")

let () =
  test "merchant_portal_api_controller.validate" (fun () ->
      if Harness.has_feature "validate" then begin
        let client = Sdk_client.test_with Noval
            (jo [("feature", jo [("validate", jo [("active", Bool true)])])]) in
        let ent = Sdk_client.merchant_portal_api_controller client Noval in
        let err = (try ignore (ent.e_create (jo [("account_number", Str "x"); ("business_reg_number", Str "x"); ("city", Str "x"); ("country", Str "x"); ("currency", Str "x"); ("merchant_category_code", Num 1.); ("merchant_name", Str "x"); ("packageid", Str "x"); ("packageorderuuid", Str "x"); ("reason_deactivation", Str "x"); ("reason_reactivation", Str "x"); ("street", Str "x"); ("terminal_country_code", Str "x"); ("terminal_language_code", Str "x"); ("terminal_location", Str "x"); ("terminal_serial_number", Str "x"); ("terminalid", Num 1.); ("vu_nummer", Str "x"); ("zipcode", Str "x")]) Noval); None with e -> Some e) in
        check_str "validate refuses an invalid request"
          (match err with Some (Sdk_error_exc er) -> er.err_code | _ -> "<no SDK error>") "validate_failed"
      end)
