// BluefinTecsMerchantPortal SDK test suite entry. GENERATED — do not edit.

import 'dart:io';

import 'harness.dart' as harness;

import 'exists_test.dart' as exists_test;
import 'struct_test.dart' as struct_test;
import 'primary_test.dart' as primary_test;
import 'pipeline_test.dart' as pipeline_test;
import 'feature_test.dart' as feature_test;
import 'netsim_test.dart' as netsim_test;
import 'custom_test.dart' as custom_test;
import 'readme_examples_test.dart' as readme_examples_test;
import 'entity/merchant_portal_api_controller/MerchantPortalApiControllerEntity_test.dart' as merchant_portal_api_controller_entity_test;
import 'entity/merchant_portal_common_controller/MerchantPortalCommonControllerEntity_test.dart' as merchant_portal_common_controller_entity_test;
import 'entity/merchant_portal_common_controller/MerchantPortalCommonControllerDirect_test.dart' as merchant_portal_common_controller_direct_test;
import 'entity/merchant_portal_pam_contract_controller/MerchantPortalPamContractControllerEntity_test.dart' as merchant_portal_pam_contract_controller_entity_test;
import 'entity/merchant_portal_pam_document_controller/MerchantPortalPamDocumentControllerEntity_test.dart' as merchant_portal_pam_document_controller_entity_test;
import 'entity/merchant_portal_pam_form_controller/MerchantPortalPamFormControllerEntity_test.dart' as merchant_portal_pam_form_controller_entity_test;
import 'entity/merchant_portal_pam_mandator_controller/MerchantPortalPamMandatorControllerEntity_test.dart' as merchant_portal_pam_mandator_controller_entity_test;
import 'entity/merchant_portal_pam_merchant_controller/MerchantPortalPamMerchantControllerEntity_test.dart' as merchant_portal_pam_merchant_controller_entity_test;
import 'entity/merchant_portal_pam_package_controller/MerchantPortalPamPackageControllerEntity_test.dart' as merchant_portal_pam_package_controller_entity_test;
import 'entity/merchant_portal_pam_product_controller/MerchantPortalPamProductControllerEntity_test.dart' as merchant_portal_pam_product_controller_entity_test;
import 'entity/output_add_product/OutputAddProductEntity_test.dart' as output_add_product_entity_test;
import 'entity/output_create_product/OutputCreateProductEntity_test.dart' as output_create_product_entity_test;
import 'entity/output_detail/OutputDetailEntity_test.dart' as output_detail_entity_test;
import 'entity/output_detail/OutputDetailDirect_test.dart' as output_detail_direct_test;
import 'entity/output_list/OutputListEntity_test.dart' as output_list_entity_test;
import 'entity/output_message/OutputMessageEntity_test.dart' as output_message_entity_test;
import 'entity/output_message/OutputMessageDirect_test.dart' as output_message_direct_test;
import 'entity/output_move_tid/OutputMoveTidEntity_test.dart' as output_move_tid_entity_test;
import 'entity/output_remove_product/OutputRemoveProductEntity_test.dart' as output_remove_product_entity_test;
import 'entity/output_start/OutputStartEntity_test.dart' as output_start_entity_test;
import 'entity/output_status/OutputStatusEntity_test.dart' as output_status_entity_test;
import 'entity/output_status/OutputStatusDirect_test.dart' as output_status_direct_test;
import 'entity/output_update_product/OutputUpdateProductEntity_test.dart' as output_update_product_entity_test;

Future<void> main() async {
  exists_test.tests();
  struct_test.tests();
  primary_test.tests();
  pipeline_test.tests();
  feature_test.tests();
  netsim_test.tests();
  custom_test.tests();
  readme_examples_test.tests();
  merchant_portal_api_controller_entity_test.tests();
  merchant_portal_common_controller_entity_test.tests();
  merchant_portal_common_controller_direct_test.tests();
  merchant_portal_pam_contract_controller_entity_test.tests();
  merchant_portal_pam_document_controller_entity_test.tests();
  merchant_portal_pam_form_controller_entity_test.tests();
  merchant_portal_pam_mandator_controller_entity_test.tests();
  merchant_portal_pam_merchant_controller_entity_test.tests();
  merchant_portal_pam_package_controller_entity_test.tests();
  merchant_portal_pam_product_controller_entity_test.tests();
  output_add_product_entity_test.tests();
  output_create_product_entity_test.tests();
  output_detail_entity_test.tests();
  output_detail_direct_test.tests();
  output_list_entity_test.tests();
  output_message_entity_test.tests();
  output_message_direct_test.tests();
  output_move_tid_entity_test.tests();
  output_remove_product_entity_test.tests();
  output_start_entity_test.tests();
  output_status_entity_test.tests();
  output_status_direct_test.tests();
  output_update_product_entity_test.tests();

  final failed = await harness.runAll();
  if (0 < failed) {
    exitCode = 1;
  }
}
