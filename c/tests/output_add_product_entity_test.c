// Generated instance test for the output_add_product entity.

#include "ctest.h"

int main(void) {
  BluefinTecsMerchantPortalSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefintecsmerchantportal_output_add_product(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "output_add_product", "entity get_name");

  TEST_SUMMARY("output_add_product_entity");
}
