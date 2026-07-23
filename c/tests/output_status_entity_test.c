// Generated instance test for the output_status entity.

#include "ctest.h"

int main(void) {
  BluefinTecsMerchantPortalSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefintecsmerchantportal_output_status(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "output_status", "entity get_name");

  TEST_SUMMARY("output_status_entity");
}
