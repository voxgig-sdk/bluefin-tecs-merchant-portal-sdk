# OutputStatus entity test (offline, mock transport)

defmodule BluefinTecsMerchantPortal.OutputStatusEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinTecsMerchantPortal.Helpers, as: H
  alias BluefinTecsMerchantPortal.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/output_status/OutputStatusTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinTecsMerchantPortal.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.output_status"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinTecsMerchantPortal.test()
    ent = BluefinTecsMerchantPortal.output_status(sdk)
    assert ent != nil
  end

  test "should load an existing record" do
    id = first_id()

    if id != nil do
      sdk = mk_sdk()
      ent = BluefinTecsMerchantPortal.output_status(sdk)
      loaded = BluefinTecsMerchantPortal.Entity.OutputStatus.load(ent, S.jm(["id", id]))
      rec = BluefinTecsMerchantPortal.EntityBase.data_get(loaded)
      assert S.ismap(rec)
      assert S.getprop(rec, "id") == id
    end
  end

  test "should refuse an invalid request" do
    if BluefinTecsMerchantPortal.FeatureHarness.has_feature("validate") do
      client = BluefinTecsMerchantPortal.test(nil, S.jm(["feature", S.jm(["validate", S.jm(["active", true])])]))

      err =
        assert_raise BluefinTecsMerchantPortal.Error, fn ->
          BluefinTecsMerchantPortal.Entity.OutputStatus.load(BluefinTecsMerchantPortal.output_status(client), S.jm(["id", 1]))
        end

      assert err.code == "validate_failed"
    end
  end
end
