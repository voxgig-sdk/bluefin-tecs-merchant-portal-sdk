// Typed models for the BluefinTecsMerchantPortal SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types are mapped
// from the canonical type sentinels. Do not edit by hand.
//
// These are DOCUMENTARY: the SDK runtime is dynamic (ops take/return
// `voxgig_value*`), so nothing consumes these structs yet — they mirror the
// entity/op shapes for reference and IDE support. This header is standalone
// and is not #included by any generated .c.

#ifndef BLUEFINTECSMERCHANTPORTAL_ENTITY_TYPES_H
#define BLUEFINTECSMERCHANTPORTAL_ENTITY_TYPES_H

#include "sdk.h"

// MerchantPortalApiController is the typed data model for the merchant_portal_api_controller entity.
typedef struct {
  int64_t account_number;  // optional
  voxgig_value*additional_data;  // optional
  char*business_reg_number;
  char*city;
  char*corporateuuid;  // optional
  char*country;
  char*currency;
  int64_t merchant_category_code;
  char*merchant_email;  // optional
  char*merchant_name;
  char*merchant_phone_number;  // optional
  char*packageid;
  char*packageorderuuid;
  char*password;  // optional
  char*productid;  // optional
  char*productid_acquirer;  // optional
  char*reason_deactivation;
  char*reason_reactivation;
  int64_t sorting_code;  // optional
  char*state;  // optional
  char*street;
  char*terminal_country_code;
  char*terminal_language_code;
  char*terminal_location;
  char*terminal_serial_number;
  int64_t terminalid;
  char*terminalid_acquirer;  // optional
  char*user_email;  // optional
  char*user_phone_number;  // optional
  char*username;  // optional
  char*vu_nummer;
  char*web_shop_url;  // optional
  char*zipcode;
} MerchantPortalApiController;

// MerchantPortalApiControllerCreateData is the typed request payload for MerchantPortalApiController.create.
typedef struct {
  int64_t account_number;  // optional
  voxgig_value*additional_data;  // optional
  char*business_reg_number;
  char*city;
  char*corporateuuid;  // optional
  char*country;
  char*currency;
  int64_t merchant_category_code;
  char*merchant_email;  // optional
  char*merchant_name;
  char*merchant_phone_number;  // optional
  char*packageid;
  char*packageorderuuid;
  char*password;  // optional
  char*productid;  // optional
  char*productid_acquirer;  // optional
  char*reason_deactivation;
  char*reason_reactivation;
  int64_t sorting_code;  // optional
  char*state;  // optional
  char*street;
  char*terminal_country_code;
  char*terminal_language_code;
  char*terminal_location;
  char*terminal_serial_number;
  int64_t terminalid;
  char*terminalid_acquirer;  // optional
  char*user_email;  // optional
  char*user_phone_number;  // optional
  char*username;  // optional
  char*vu_nummer;
  char*web_shop_url;  // optional
  char*zipcode;
} MerchantPortalApiControllerCreateData;

// MerchantPortalCommonController is the typed data model for the merchant_portal_common_controller entity.
typedef struct {
  char _unused;  // placeholder: no modelled members
} MerchantPortalCommonController;

// MerchantPortalCommonControllerLoadMatch is the typed request payload for MerchantPortalCommonController.load.
typedef struct {
  char _unused;  // placeholder: no modelled members
} MerchantPortalCommonControllerLoadMatch;

// MerchantPortalPamContractController is the typed data model for the merchant_portal_pam_contract_controller entity.
typedef struct {
  char*language;
  char*product_order_uuid;
} MerchantPortalPamContractController;

// MerchantPortalPamContractControllerCreateData is the typed request payload for MerchantPortalPamContractController.create.
typedef struct {
  char*language;
  char*product_order_uuid;
} MerchantPortalPamContractControllerCreateData;

// MerchantPortalPamDocumentController is the typed data model for the merchant_portal_pam_document_controller entity.
typedef struct {
  char*app_form_field_desc_uuid;
  char*package_order_uuid;  // optional
  char*product_order_uuid;  // optional
} MerchantPortalPamDocumentController;

// MerchantPortalPamDocumentControllerCreateData is the typed request payload for MerchantPortalPamDocumentController.create.
typedef struct {
  char*app_form_field_desc_uuid;
  char*package_order_uuid;  // optional
  char*product_order_uuid;  // optional
} MerchantPortalPamDocumentControllerCreateData;

// MerchantPortalPamFormController is the typed data model for the merchant_portal_pam_form_controller entity.
typedef struct {
  char*app_form_fields_desc_uuid;
  voxgig_value*filter;  // optional
  char*language;
  voxgig_value*package_order;  // optional
  char*package_order_uuid;
  char*package_uuid;  // optional
  voxgig_value*product_order;  // optional
  char*product_order_uuid;  // optional
  char*reason_of_reopening;
} MerchantPortalPamFormController;

// MerchantPortalPamFormControllerCreateData is the typed request payload for MerchantPortalPamFormController.create.
typedef struct {
  char*app_form_fields_desc_uuid;
  voxgig_value*filter;  // optional
  char*language;
  voxgig_value*package_order;  // optional
  char*package_order_uuid;
  char*package_uuid;  // optional
  voxgig_value*product_order;  // optional
  char*product_order_uuid;  // optional
  char*reason_of_reopening;
} MerchantPortalPamFormControllerCreateData;

// MerchantPortalPamMandatorController is the typed data model for the merchant_portal_pam_mandator_controller entity.
typedef struct {
  char*client_secret;  // optional
  char*mandator_name;
  char*notification_email;  // optional
  char*package_uuid;
} MerchantPortalPamMandatorController;

// MerchantPortalPamMandatorControllerCreateData is the typed request payload for MerchantPortalPamMandatorController.create.
typedef struct {
  char*client_secret;  // optional
  char*mandator_name;
  char*notification_email;  // optional
  char*package_uuid;
} MerchantPortalPamMandatorControllerCreateData;

// MerchantPortalPamMerchantController is the typed data model for the merchant_portal_pam_merchant_controller entity.
typedef struct {
  voxgig_value*additional_data;  // optional
  char*business_registration_number;
  char*city;  // optional
  char*company_name;
  char*corporate_uuid;
  char*country;  // optional
  char*currency;
  char*email;
  char*language;
  char*login;
  char*mandator;
  char*merchant_category_code;  // optional
  char*merchant_contract_number;
  char*merchant_name;  // optional
  char*package_uuid;  // optional
  char*packageorderuuid;
  char*phone_number;
  char*postal_code;  // optional
  char*productid_acquirer;
  char*region;  // optional
  char*registration_number;  // optional
  char*signature;  // optional
  char*street;  // optional
  voxgig_value*terminal_id;  // optional
  char*terminalid_acquirer;  // optional
  char*vu_nummer;
} MerchantPortalPamMerchantController;

// MerchantPortalPamMerchantControllerCreateData is the typed request payload for MerchantPortalPamMerchantController.create.
typedef struct {
  voxgig_value*additional_data;  // optional
  char*business_registration_number;
  char*city;  // optional
  char*company_name;
  char*corporate_uuid;
  char*country;  // optional
  char*currency;
  char*email;
  char*language;
  char*login;
  char*mandator;
  char*merchant_category_code;  // optional
  char*merchant_contract_number;
  char*merchant_name;  // optional
  char*package_uuid;  // optional
  char*packageorderuuid;
  char*phone_number;
  char*postal_code;  // optional
  char*productid_acquirer;
  char*region;  // optional
  char*registration_number;  // optional
  char*signature;  // optional
  char*street;  // optional
  voxgig_value*terminal_id;  // optional
  char*terminalid_acquirer;  // optional
  char*vu_nummer;
} MerchantPortalPamMerchantControllerCreateData;

// MerchantPortalPamPackageController is the typed data model for the merchant_portal_pam_package_controller entity.
typedef struct {
  char*consumer_uuid;  // optional
  char*corporate_uuid;  // optional
  char*country;  // optional
  char*description_key;  // optional
  voxgig_value*filter;  // optional
  char*language;
  char*name_key;  // optional
  char*package_status;  // optional
  char*package_uuid;
  voxgig_value*pagination;  // optional
  voxgig_value*sorting;  // optional
} MerchantPortalPamPackageController;

// MerchantPortalPamPackageControllerCreateData is the typed request payload for MerchantPortalPamPackageController.create.
typedef struct {
  char*consumer_uuid;  // optional
  char*corporate_uuid;  // optional
  char*country;  // optional
  char*description_key;  // optional
  voxgig_value*filter;  // optional
  char*language;
  char*name_key;  // optional
  char*package_status;  // optional
  char*package_uuid;
  voxgig_value*pagination;  // optional
  voxgig_value*sorting;  // optional
} MerchantPortalPamPackageControllerCreateData;

// MerchantPortalPamProductController is the typed data model for the merchant_portal_pam_product_controller entity.
typedef struct {
  char*consumer_uuid;  // optional
  voxgig_value*filter;  // optional
  char*language;  // optional
  char*merchant_id;  // optional
  char*package_order_uuid;
  voxgig_value*pagination;  // optional
  char*product_order_uuid;
  char*product_uuid;
  char*reason_decline;
  voxgig_value*sorting;  // optional
} MerchantPortalPamProductController;

// MerchantPortalPamProductControllerCreateData is the typed request payload for MerchantPortalPamProductController.create.
typedef struct {
  char*consumer_uuid;  // optional
  voxgig_value*filter;  // optional
  char*language;  // optional
  char*merchant_id;  // optional
  char*package_order_uuid;
  voxgig_value*pagination;  // optional
  char*product_order_uuid;
  char*product_uuid;
  char*reason_decline;
  voxgig_value*sorting;  // optional
} MerchantPortalPamProductControllerCreateData;

// OutputAddProduct is the typed data model for the output_add_product entity.
typedef struct {
  char*package_uuid;
  voxgig_value*product_uui_d;
  int64_t response_code;
  char*response_message;
} OutputAddProduct;

// OutputAddProductCreateData is the typed request payload for OutputAddProduct.create.
typedef struct {
  char*package_uuid;
  voxgig_value*product_uui_d;
  int64_t response_code;
  char*response_message;
} OutputAddProductCreateData;

// OutputCreateProduct is the typed data model for the output_create_product entity.
typedef struct {
  char*acquirer_id;  // optional
  bool allow_multiple_order;
  char*app_form_template_name;
  bool contract_needed;
  bool credentials_needed;  // optional
  char*description_key;
  char*name_key;
  bool prescreening_allowed;
  char*product_name;
  int64_t response_code;
  char*response_message;
  char*terminal_template_name;
  char*vendor_name;
  char*xml_template_file;
} OutputCreateProduct;

// OutputCreateProductCreateData is the typed request payload for OutputCreateProduct.create.
typedef struct {
  char*acquirer_id;  // optional
  bool allow_multiple_order;
  char*app_form_template_name;
  bool contract_needed;
  bool credentials_needed;  // optional
  char*description_key;
  char*name_key;
  bool prescreening_allowed;
  char*product_name;
  int64_t response_code;
  char*response_message;
  char*terminal_template_name;
  char*vendor_name;
  char*xml_template_file;
} OutputCreateProductCreateData;

// OutputDetail is the typed data model for the output_detail entity.
typedef struct {
  voxgig_value*detail;  // optional
  int64_t response_code;
  char*response_message;
} OutputDetail;

// OutputDetailLoadMatch is the typed request payload for OutputDetail.load.
typedef struct {
  char*id;
} OutputDetailLoadMatch;

// OutputList is the typed data model for the output_list entity.
typedef struct {
  voxgig_value*item;  // optional
  voxgig_value*pagination;
  int64_t response_code;
  char*response_message;
  voxgig_value*sorting;  // optional
} OutputList;

// OutputListCreateData is the typed request payload for OutputList.create.
typedef struct {
  voxgig_value*item;  // optional
  voxgig_value*pagination;
  int64_t response_code;
  char*response_message;
  voxgig_value*sorting;  // optional
} OutputListCreateData;

// OutputMessage is the typed data model for the output_message entity.
typedef struct {
  int64_t response_code;
  char*response_message;
} OutputMessage;

// OutputMessageLoadMatch is the typed request payload for OutputMessage.load.
typedef struct {
  char*id;
} OutputMessageLoadMatch;

// OutputMoveTid is the typed data model for the output_move_tid entity.
typedef struct {
  voxgig_value*product_order_uui_d;
  int64_t response_code;
  char*response_message;
  char*target_package_order_uuid;
  char*target_product_order_uuid;
} OutputMoveTid;

// OutputMoveTidCreateData is the typed request payload for OutputMoveTid.create.
typedef struct {
  voxgig_value*product_order_uui_d;
  int64_t response_code;
  char*response_message;
  char*target_package_order_uuid;
  char*target_product_order_uuid;
} OutputMoveTidCreateData;

// OutputRemoveProduct is the typed data model for the output_remove_product entity.
typedef struct {
  char*package_uuid;
  voxgig_value*product_uui_d;
  int64_t response_code;
  char*response_message;
} OutputRemoveProduct;

// OutputRemoveProductCreateData is the typed request payload for OutputRemoveProduct.create.
typedef struct {
  char*package_uuid;
  voxgig_value*product_uui_d;
  int64_t response_code;
  char*response_message;
} OutputRemoveProductCreateData;

// OutputStart is the typed data model for the output_start entity.
typedef struct {
  char*id;  // optional
  int64_t response_code;
  char*response_message;
} OutputStart;

// OutputStartCreateData is the typed request payload for OutputStart.create.
typedef struct {
  char*id;  // optional
  int64_t response_code;
  char*response_message;
} OutputStartCreateData;

// OutputStatus is the typed data model for the output_status entity.
typedef struct {
  int64_t percentage;  // optional
  int64_t response_code;
  char*response_message;
  char*status;  // optional
} OutputStatus;

// OutputStatusLoadMatch is the typed request payload for OutputStatus.load.
typedef struct {
  char*id;
} OutputStatusLoadMatch;

// OutputUpdateProduct is the typed data model for the output_update_product entity.
typedef struct {
  bool allow_multiple_order;  // optional
  char*app_form_name;  // optional
  bool contract_needed;  // optional
  bool credentials_needed;  // optional
  char*description_key;  // optional
  char*name_key;  // optional
  bool prescreening_allowed;  // optional
  char*product_name;  // optional
  char*product_status;  // optional
  char*product_uuid;
  int64_t response_code;
  char*response_message;
  char*vendor_name;  // optional
} OutputUpdateProduct;

// OutputUpdateProductCreateData is the typed request payload for OutputUpdateProduct.create.
typedef struct {
  bool allow_multiple_order;  // optional
  char*app_form_name;  // optional
  bool contract_needed;  // optional
  bool credentials_needed;  // optional
  char*description_key;  // optional
  char*name_key;  // optional
  bool prescreening_allowed;  // optional
  char*product_name;  // optional
  char*product_status;  // optional
  char*product_uuid;
  int64_t response_code;
  char*response_message;
  char*vendor_name;  // optional
} OutputUpdateProductCreateData;

#endif // BLUEFINTECSMERCHANTPORTAL_ENTITY_TYPES_H
