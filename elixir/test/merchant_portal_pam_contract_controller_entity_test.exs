# MerchantPortalPamContractController entity test (offline, mock transport)

defmodule BluefinTecsMerchantPortal.MerchantPortalPamContractControllerEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S

  test "should create instance" do
    sdk = BluefinTecsMerchantPortal.test()
    ent = BluefinTecsMerchantPortal.merchant_portal_pam_contract_controller(sdk)
    assert ent != nil
  end

  test "should create then read back" do
    sdk = BluefinTecsMerchantPortal.test(S.jm(["entity", S.jm(["merchant_portal_pam_contract_controller", S.jm([])])]))
    ent = BluefinTecsMerchantPortal.merchant_portal_pam_contract_controller(sdk)
    created = BluefinTecsMerchantPortal.Entity.MerchantPortalPamContractController.create(ent, S.jm(["name", "test-create"]))
    made = BluefinTecsMerchantPortal.EntityBase.data_get(created)
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end

  test "should refuse an invalid request" do
    if BluefinTecsMerchantPortal.FeatureHarness.has_feature("validate") do
      client = BluefinTecsMerchantPortal.test(nil, S.jm(["feature", S.jm(["validate", S.jm(["active", true])])]))

      err =
        assert_raise BluefinTecsMerchantPortal.Error, fn ->
          BluefinTecsMerchantPortal.Entity.MerchantPortalPamContractController.create(BluefinTecsMerchantPortal.merchant_portal_pam_contract_controller(client), S.jm(["language", 1, "productOrderUUID", "x"]))
        end

      assert err.code == "validate_failed"
    end
  end
end
