// Generated instance test for the output_move_tid entity.

#include "ctest.h"

int main(void) {
  BluefinTecsMerchantPortalSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefintecsmerchantportal_output_move_tid(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "output_move_tid", "entity get_name");

  TEST_SUMMARY("output_move_tid_entity");
}
