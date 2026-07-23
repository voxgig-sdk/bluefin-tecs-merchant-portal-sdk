// Generated instance test for the merchant_portal_pam_package_controller entity.

#include "ctest.h"

int main(void) {
  BluefinTecsMerchantPortalSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefintecsmerchantportal_merchant_portal_pam_package_controller(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "merchant_portal_pam_package_controller", "entity get_name");

  TEST_SUMMARY("merchant_portal_pam_package_controller_entity");
}
