# OutputCreateProduct entity test (offline, mock transport)

defmodule BluefinTecsMerchantPortal.OutputCreateProductEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinTecsMerchantPortal.Helpers, as: H
  alias BluefinTecsMerchantPortal.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/output_create_product/OutputCreateProductTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinTecsMerchantPortal.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.output_create_product"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinTecsMerchantPortal.test()
    ent = BluefinTecsMerchantPortal.output_create_product(sdk)
    assert ent != nil
  end

  test "should create then read back" do
    sdk = BluefinTecsMerchantPortal.test(S.jm(["entity", S.jm(["output_create_product", S.jm([])])]))
    ent = BluefinTecsMerchantPortal.output_create_product(sdk)
    made = BluefinTecsMerchantPortal.Entity.OutputCreateProduct.create(ent, S.jm(["name", "test-create"]))
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end
end
