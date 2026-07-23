// Generated instance test for the merchant_portal_api_controller entity.

#include "ctest.h"

int main(void) {
  BluefinTecsMerchantPortalSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefintecsmerchantportal_merchant_portal_api_controller(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "merchant_portal_api_controller", "entity get_name");

  TEST_SUMMARY("merchant_portal_api_controller_entity");
}
