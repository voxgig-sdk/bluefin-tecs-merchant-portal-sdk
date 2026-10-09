# OutputRemoveProduct entity test (offline, mock transport)

defmodule BluefinTecsMerchantPortal.OutputRemoveProductEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S

  test "should create instance" do
    sdk = BluefinTecsMerchantPortal.test()
    ent = BluefinTecsMerchantPortal.output_remove_product(sdk)
    assert ent != nil
  end

  test "should create then read back" do
    sdk = BluefinTecsMerchantPortal.test(S.jm(["entity", S.jm(["output_remove_product", S.jm([])])]))
    ent = BluefinTecsMerchantPortal.output_remove_product(sdk)
    created = BluefinTecsMerchantPortal.Entity.OutputRemoveProduct.create(ent, S.jm(["name", "test-create"]))
    made = BluefinTecsMerchantPortal.EntityBase.data_get(created)
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end

  test "should refuse an invalid request" do
    if BluefinTecsMerchantPortal.FeatureHarness.has_feature("validate") do
      client = BluefinTecsMerchantPortal.test(nil, S.jm(["feature", S.jm(["validate", S.jm(["active", true])])]))

      err =
        assert_raise BluefinTecsMerchantPortal.Error, fn ->
          BluefinTecsMerchantPortal.Entity.OutputRemoveProduct.create(BluefinTecsMerchantPortal.output_remove_product(client), S.jm(["packageUUID", 1, "productUUIDs", "x", "responseCode", 1, "responseMessage", "x"]))
        end

      assert err.code == "validate_failed"
    end
  end
end
