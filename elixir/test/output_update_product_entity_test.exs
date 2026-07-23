# OutputUpdateProduct entity test (offline, mock transport)

defmodule BluefinTecsMerchantPortal.OutputUpdateProductEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinTecsMerchantPortal.Helpers, as: H
  alias BluefinTecsMerchantPortal.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/output_update_product/OutputUpdateProductTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinTecsMerchantPortal.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.output_update_product"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinTecsMerchantPortal.test()
    ent = BluefinTecsMerchantPortal.output_update_product(sdk)
    assert ent != nil
  end

  test "should create then read back" do
    sdk = BluefinTecsMerchantPortal.test(S.jm(["entity", S.jm(["output_update_product", S.jm([])])]))
    ent = BluefinTecsMerchantPortal.output_update_product(sdk)
    made = BluefinTecsMerchantPortal.Entity.OutputUpdateProduct.create(ent, S.jm(["name", "test-create"]))
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end
end
