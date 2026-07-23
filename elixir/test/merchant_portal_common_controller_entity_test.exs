# MerchantPortalCommonController entity test (offline, mock transport)

defmodule BluefinTecsMerchantPortal.MerchantPortalCommonControllerEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinTecsMerchantPortal.Helpers, as: H
  alias BluefinTecsMerchantPortal.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/merchant_portal_common_controller/MerchantPortalCommonControllerTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinTecsMerchantPortal.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.merchant_portal_common_controller"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinTecsMerchantPortal.test()
    ent = BluefinTecsMerchantPortal.merchant_portal_common_controller(sdk)
    assert ent != nil
  end

  test "should load an existing record" do
    id = first_id()

    if id != nil do
      sdk = mk_sdk()
      ent = BluefinTecsMerchantPortal.merchant_portal_common_controller(sdk)
      rec = BluefinTecsMerchantPortal.Entity.MerchantPortalCommonController.load(ent, S.jm(["id", id]))
      assert S.ismap(rec)
      assert S.getprop(rec, "id") == id
    end
  end
end
