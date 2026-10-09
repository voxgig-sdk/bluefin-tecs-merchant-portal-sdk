# MerchantPortalApiController entity test (offline, mock transport)

defmodule BluefinTecsMerchantPortal.MerchantPortalApiControllerEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S

  test "should create instance" do
    sdk = BluefinTecsMerchantPortal.test()
    ent = BluefinTecsMerchantPortal.merchant_portal_api_controller(sdk)
    assert ent != nil
  end

  test "should create then read back" do
    sdk = BluefinTecsMerchantPortal.test(S.jm(["entity", S.jm(["merchant_portal_api_controller", S.jm([])])]))
    ent = BluefinTecsMerchantPortal.merchant_portal_api_controller(sdk)
    created = BluefinTecsMerchantPortal.Entity.MerchantPortalApiController.create(ent, S.jm(["name", "test-create"]))
    made = BluefinTecsMerchantPortal.EntityBase.data_get(created)
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end

  test "should refuse an invalid request" do
    if BluefinTecsMerchantPortal.FeatureHarness.has_feature("validate") do
      client = BluefinTecsMerchantPortal.test(nil, S.jm(["feature", S.jm(["validate", S.jm(["active", true])])]))

      err =
        assert_raise BluefinTecsMerchantPortal.Error, fn ->
          BluefinTecsMerchantPortal.Entity.MerchantPortalApiController.create(BluefinTecsMerchantPortal.merchant_portal_api_controller(client), S.jm(["account_number", "x", "business_reg_number", "x", "city", "x", "country", "x", "currency", "x", "merchant_category_code", 1, "merchant_name", "x", "packageid", "x", "packageorderuuid", "x", "reason_deactivation", "x", "reason_reactivation", "x", "street", "x", "terminal_country_code", "x", "terminal_language_code", "x", "terminal_location", "x", "terminal_serial_number", "x", "terminalid", 1, "vu_nummer", "x", "zipcode", "x"]))
        end

      assert err.code == "validate_failed"
    end
  end
end
