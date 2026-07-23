(* Generated output_remove_product entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "output_remove_product.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.output_remove_product client Noval in
      check_str "name" ent.e_name "output_remove_product")
