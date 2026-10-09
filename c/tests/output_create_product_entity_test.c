// Generated instance test for the output_create_product entity.

#include "ctest.h"

int main(void) {
  BluefinTecsMerchantPortalSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefintecsmerchantportal_output_create_product(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "output_create_product", "entity get_name");

  if (!v_is_noval(getp(getp(shared_config(), "feature"), "validate"))) {
    PNError* verr = NULL;
    Entity* ve = bluefintecsmerchantportal_output_create_product(test_sdk(NULL, cmap(1, "feature",
      cmap(1, "validate", cmap(1, "active", v_bool(true))))), NULL);
    ve->vt->create(ve, cmap(13, "acquirerId", v_num(1), "allowMultipleOrders", v_bool(true), "appFormTemplateName", v_str("x"), "contractNeeded", v_bool(true), "descriptionKey", v_str("x"), "nameKey", v_str("x"), "prescreeningAllowed", v_bool(true), "productName", v_str("x"), "responseCode", v_num(1), "responseMessage", v_str("x"), "terminalTemplateName", v_str("x"), "vendorName", v_str("x"), "xmlTemplateFile", v_str("x")), NULL, &verr);
    CHECK(NULL != verr && 0 == strcmp(verr->code, "validate_failed"),
      "an invalid request fails with validate_failed");
  }

  TEST_SUMMARY("output_create_product_entity");
}
