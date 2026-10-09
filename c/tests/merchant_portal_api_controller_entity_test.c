// Generated instance test for the merchant_portal_api_controller entity.

#include "ctest.h"

int main(void) {
  BluefinTecsMerchantPortalSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefintecsmerchantportal_merchant_portal_api_controller(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "merchant_portal_api_controller", "entity get_name");

  if (!v_is_noval(getp(getp(shared_config(), "feature"), "validate"))) {
    PNError* verr = NULL;
    Entity* ve = bluefintecsmerchantportal_merchant_portal_api_controller(test_sdk(NULL, cmap(1, "feature",
      cmap(1, "validate", cmap(1, "active", v_bool(true))))), NULL);
    ve->vt->create(ve, cmap(19, "account_number", v_str("x"), "business_reg_number", v_str("x"), "city", v_str("x"), "country", v_str("x"), "currency", v_str("x"), "merchant_category_code", v_num(1), "merchant_name", v_str("x"), "packageid", v_str("x"), "packageorderuuid", v_str("x"), "reason_deactivation", v_str("x"), "reason_reactivation", v_str("x"), "street", v_str("x"), "terminal_country_code", v_str("x"), "terminal_language_code", v_str("x"), "terminal_location", v_str("x"), "terminal_serial_number", v_str("x"), "terminalid", v_num(1), "vu_nummer", v_str("x"), "zipcode", v_str("x")), NULL, &verr);
    CHECK(NULL != verr && 0 == strcmp(verr->code, "validate_failed"),
      "an invalid request fails with validate_failed");
  }

  TEST_SUMMARY("merchant_portal_api_controller_entity");
}
