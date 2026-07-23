(* Generated output_detail entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "output_detail.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.output_detail client Noval in
      check_str "name" ent.e_name "output_detail")

let () =
  test "output_detail.seeded_ops" (fun () ->
      let record = jo [("id", Str "output_detail01")] in
      let seed = jo [("output_detail",
                      jo [("output_detail01", record)])] in
      let client = Sdk_client.test_with (jo [("entity", seed)]) Noval in
      let ent = Sdk_client.output_detail client Noval in
      ignore ent;
      let loaded = ent.e_load (jo [("id", Str "output_detail01")]) Noval in
      check "load is a map" (ismap loaded);
      ())
