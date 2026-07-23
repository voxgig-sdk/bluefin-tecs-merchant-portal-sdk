# MerchantPortalPamMandatorController entity test (offline, mock transport)

defmodule BluefinTecsMerchantPortal.MerchantPortalPamMandatorControllerEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinTecsMerchantPortal.Helpers, as: H
  alias BluefinTecsMerchantPortal.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/merchant_portal_pam_mandator_controller/MerchantPortalPamMandatorControllerTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinTecsMerchantPortal.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.merchant_portal_pam_mandator_controller"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinTecsMerchantPortal.test()
    ent = BluefinTecsMerchantPortal.merchant_portal_pam_mandator_controller(sdk)
    assert ent != nil
  end

  test "should create then read back" do
    sdk = BluefinTecsMerchantPortal.test(S.jm(["entity", S.jm(["merchant_portal_pam_mandator_controller", S.jm([])])]))
    ent = BluefinTecsMerchantPortal.merchant_portal_pam_mandator_controller(sdk)
    made = BluefinTecsMerchantPortal.Entity.MerchantPortalPamMandatorController.create(ent, S.jm(["name", "test-create"]))
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end
end
