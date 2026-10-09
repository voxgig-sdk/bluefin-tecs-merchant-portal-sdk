(* Generated output_create_product entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "output_create_product.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.output_create_product client Noval in
      check_str "name" ent.e_name "output_create_product")

let () =
  test "output_create_product.validate" (fun () ->
      if Harness.has_feature "validate" then begin
        let client = Sdk_client.test_with Noval
            (jo [("feature", jo [("validate", jo [("active", Bool true)])])]) in
        let ent = Sdk_client.output_create_product client Noval in
        let err = (try ignore (ent.e_create (jo [("acquirerId", Num 1.); ("allowMultipleOrders", Bool true); ("appFormTemplateName", Str "x"); ("contractNeeded", Bool true); ("descriptionKey", Str "x"); ("nameKey", Str "x"); ("prescreeningAllowed", Bool true); ("productName", Str "x"); ("responseCode", Num 1.); ("responseMessage", Str "x"); ("terminalTemplateName", Str "x"); ("vendorName", Str "x"); ("xmlTemplateFile", Str "x")]) Noval); None with e -> Some e) in
        check_str "validate refuses an invalid request"
          (match err with Some (Sdk_error_exc er) -> er.err_code | _ -> "<no SDK error>") "validate_failed"
      end)
