(* Generated merchant_portal_pam_merchant_controller entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "merchant_portal_pam_merchant_controller.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.merchant_portal_pam_merchant_controller client Noval in
      check_str "name" ent.e_name "merchant_portal_pam_merchant_controller")

let () =
  test "merchant_portal_pam_merchant_controller.validate" (fun () ->
      if Harness.has_feature "validate" then begin
        let client = Sdk_client.test_with Noval
            (jo [("feature", jo [("validate", jo [("active", Bool true)])])]) in
        let ent = Sdk_client.merchant_portal_pam_merchant_controller client Noval in
        let err = (try ignore (ent.e_create (jo [("businessRegistrationNumber", Num 1.); ("companyName", Str "x"); ("corporateUUID", Str "x"); ("currency", Str "x"); ("email", Str "x"); ("language", Str "x"); ("login", Str "x"); ("mandator", Str "x"); ("merchantContractNumber", Str "x"); ("packageorderuuid", Str "x"); ("phoneNumber", Str "x"); ("productid_acquirer", Str "x"); ("vu_nummer", Str "x")]) Noval); None with e -> Some e) in
        check_str "validate refuses an invalid request"
          (match err with Some (Sdk_error_exc er) -> er.err_code | _ -> "<no SDK error>") "validate_failed"
      end)
