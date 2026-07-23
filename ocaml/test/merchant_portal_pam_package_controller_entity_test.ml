(* Generated merchant_portal_pam_package_controller entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "merchant_portal_pam_package_controller.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.merchant_portal_pam_package_controller client Noval in
      check_str "name" ent.e_name "merchant_portal_pam_package_controller")
