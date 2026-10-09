# MerchantPortalPamDocumentController entity test (offline, mock transport)

defmodule BluefinTecsMerchantPortal.MerchantPortalPamDocumentControllerEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S

  test "should create instance" do
    sdk = BluefinTecsMerchantPortal.test()
    ent = BluefinTecsMerchantPortal.merchant_portal_pam_document_controller(sdk)
    assert ent != nil
  end

  test "should create then read back" do
    sdk = BluefinTecsMerchantPortal.test(S.jm(["entity", S.jm(["merchant_portal_pam_document_controller", S.jm([])])]))
    ent = BluefinTecsMerchantPortal.merchant_portal_pam_document_controller(sdk)
    created = BluefinTecsMerchantPortal.Entity.MerchantPortalPamDocumentController.create(ent, S.jm(["name", "test-create"]))
    made = BluefinTecsMerchantPortal.EntityBase.data_get(created)
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end

  test "should refuse an invalid request" do
    if BluefinTecsMerchantPortal.FeatureHarness.has_feature("validate") do
      client = BluefinTecsMerchantPortal.test(nil, S.jm(["feature", S.jm(["validate", S.jm(["active", true])])]))

      err =
        assert_raise BluefinTecsMerchantPortal.Error, fn ->
          BluefinTecsMerchantPortal.Entity.MerchantPortalPamDocumentController.create(BluefinTecsMerchantPortal.merchant_portal_pam_document_controller(client), S.jm(["appFormFieldDescUUID", 1]))
        end

      assert err.code == "validate_failed"
    end
  end
end
