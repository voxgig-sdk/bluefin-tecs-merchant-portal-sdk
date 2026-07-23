(* Generated merchant_portal_common_controller entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "merchant_portal_common_controller.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.merchant_portal_common_controller client Noval in
      check_str "name" ent.e_name "merchant_portal_common_controller")

let () =
  test "merchant_portal_common_controller.seeded_ops" (fun () ->
      let record = jo [("id", Str "merchant_portal_common_controller01")] in
      let seed = jo [("merchant_portal_common_controller",
                      jo [("merchant_portal_common_controller01", record)])] in
      let client = Sdk_client.test_with (jo [("entity", seed)]) Noval in
      let ent = Sdk_client.merchant_portal_common_controller client Noval in
      ignore ent;
      let loaded = ent.e_load (jo [("id", Str "merchant_portal_common_controller01")]) Noval in
      check "load is a map" (ismap loaded);
      ())
