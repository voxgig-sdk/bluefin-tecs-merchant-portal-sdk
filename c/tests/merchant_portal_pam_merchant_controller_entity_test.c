// Generated instance test for the merchant_portal_pam_merchant_controller entity.

#include "ctest.h"

int main(void) {
  BluefinTecsMerchantPortalSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefintecsmerchantportal_merchant_portal_pam_merchant_controller(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "merchant_portal_pam_merchant_controller", "entity get_name");

  if (!v_is_noval(getp(getp(shared_config(), "feature"), "validate"))) {
    PNError* verr = NULL;
    Entity* ve = bluefintecsmerchantportal_merchant_portal_pam_merchant_controller(test_sdk(NULL, cmap(1, "feature",
      cmap(1, "validate", cmap(1, "active", v_bool(true))))), NULL);
    ve->vt->create(ve, cmap(13, "businessRegistrationNumber", v_num(1), "companyName", v_str("x"), "corporateUUID", v_str("x"), "currency", v_str("x"), "email", v_str("x"), "language", v_str("x"), "login", v_str("x"), "mandator", v_str("x"), "merchantContractNumber", v_str("x"), "packageorderuuid", v_str("x"), "phoneNumber", v_str("x"), "productid_acquirer", v_str("x"), "vu_nummer", v_str("x")), NULL, &verr);
    CHECK(NULL != verr && 0 == strcmp(verr->code, "validate_failed"),
      "an invalid request fails with validate_failed");
  }

  TEST_SUMMARY("merchant_portal_pam_merchant_controller_entity");
}
