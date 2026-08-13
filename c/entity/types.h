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
  char*productorderuuid;
} MerchantPortalPamContractController;

// MerchantPortalPamContractControllerCreateData is the typed request payload for MerchantPortalPamContractController.create.
typedef struct {
  char*language;
  char*productorderuuid;
} MerchantPortalPamContractControllerCreateData;

// MerchantPortalPamDocumentController is the typed data model for the merchant_portal_pam_document_controller entity.
typedef struct {
  char*appformfielddescuuid;
  char*packageorderuuid;  // optional
  char*productorderuuid;  // optional
} MerchantPortalPamDocumentController;

// MerchantPortalPamDocumentControllerCreateData is the typed request payload for MerchantPortalPamDocumentController.create.
typedef struct {
  char*appformfielddescuuid;
  char*packageorderuuid;  // optional
  char*productorderuuid;  // optional
} MerchantPortalPamDocumentControllerCreateData;

// MerchantPortalPamFormController is the typed data model for the merchant_portal_pam_form_controller entity.
typedef struct {
  char*appformfieldsdescuuid;
  voxgig_value*filter;  // optional
  char*language;
  voxgig_value*packageorder;  // optional
  char*packageorderuuid;
  char*packageuuid;  // optional
  char*productorderuuid;  // optional
  voxgig_value*productorders;  // optional
  char*reasonofreopening;
} MerchantPortalPamFormController;

// MerchantPortalPamFormControllerCreateData is the typed request payload for MerchantPortalPamFormController.create.
typedef struct {
  char*appformfieldsdescuuid;
  voxgig_value*filter;  // optional
  char*language;
  voxgig_value*packageorder;  // optional
  char*packageorderuuid;
  char*packageuuid;  // optional
  char*productorderuuid;  // optional
  voxgig_value*productorders;  // optional
  char*reasonofreopening;
} MerchantPortalPamFormControllerCreateData;

// MerchantPortalPamMandatorController is the typed data model for the merchant_portal_pam_mandator_controller entity.
typedef struct {
  char*clientsecret;  // optional
  char*mandatorname;
  char*notificationemail;  // optional
  char*packageuuid;
} MerchantPortalPamMandatorController;

// MerchantPortalPamMandatorControllerCreateData is the typed request payload for MerchantPortalPamMandatorController.create.
typedef struct {
  char*clientsecret;  // optional
  char*mandatorname;
  char*notificationemail;  // optional
  char*packageuuid;
} MerchantPortalPamMandatorControllerCreateData;

// MerchantPortalPamMerchantController is the typed data model for the merchant_portal_pam_merchant_controller entity.
typedef struct {
  voxgig_value*additional_data;  // optional
  char*businessregistrationnumber;
  char*city;  // optional
  char*companyname;
  char*corporateuuid;
  char*country;  // optional
  char*currency;
  char*email;
  char*language;
  char*login;
  char*mandator;
  char*merchantcontractnumber;
  char*merchantname;  // optional
  char*merchant_category_code;  // optional
  char*packageuuid;  // optional
  char*packageorderuuid;
  char*phonenumber;
  char*postalcode;  // optional
  char*productid_acquirer;
  char*region;  // optional
  char*registrationnumber;  // optional
  char*signature;  // optional
  char*street;  // optional
  voxgig_value*terminalids;  // optional
  char*terminalid_acquirer;  // optional
  char*vu_nummer;
} MerchantPortalPamMerchantController;

// MerchantPortalPamMerchantControllerCreateData is the typed request payload for MerchantPortalPamMerchantController.create.
typedef struct {
  voxgig_value*additional_data;  // optional
  char*businessregistrationnumber;
  char*city;  // optional
  char*companyname;
  char*corporateuuid;
  char*country;  // optional
  char*currency;
  char*email;
  char*language;
  char*login;
  char*mandator;
  char*merchantcontractnumber;
  char*merchantname;  // optional
  char*merchant_category_code;  // optional
  char*packageuuid;  // optional
  char*packageorderuuid;
  char*phonenumber;
  char*postalcode;  // optional
  char*productid_acquirer;
  char*region;  // optional
  char*registrationnumber;  // optional
  char*signature;  // optional
  char*street;  // optional
  voxgig_value*terminalids;  // optional
  char*terminalid_acquirer;  // optional
  char*vu_nummer;
} MerchantPortalPamMerchantControllerCreateData;

// MerchantPortalPamPackageController is the typed data model for the merchant_portal_pam_package_controller entity.
typedef struct {
  char*consumeruuid;  // optional
  char*corporateuuid;  // optional
  char*country;  // optional
  char*descriptionkey;  // optional
  voxgig_value*filter;  // optional
  char*language;
  char*namekey;  // optional
  char*packagestatus;  // optional
  char*packageuuid;
  voxgig_value*pagination;  // optional
  voxgig_value*sorting;  // optional
} MerchantPortalPamPackageController;

// MerchantPortalPamPackageControllerCreateData is the typed request payload for MerchantPortalPamPackageController.create.
typedef struct {
  char*consumeruuid;  // optional
  char*corporateuuid;  // optional
  char*country;  // optional
  char*descriptionkey;  // optional
  voxgig_value*filter;  // optional
  char*language;
  char*namekey;  // optional
  char*packagestatus;  // optional
  char*packageuuid;
  voxgig_value*pagination;  // optional
  voxgig_value*sorting;  // optional
} MerchantPortalPamPackageControllerCreateData;

// MerchantPortalPamProductController is the typed data model for the merchant_portal_pam_product_controller entity.
typedef struct {
  char*consumeruuid;  // optional
  voxgig_value*filter;  // optional
  char*language;  // optional
  char*merchantid;  // optional
  char*packageorderuuid;
  voxgig_value*pagination;  // optional
  char*productorderuuid;
  char*productuuid;
  char*reason_decline;
  voxgig_value*sorting;  // optional
} MerchantPortalPamProductController;

// MerchantPortalPamProductControllerCreateData is the typed request payload for MerchantPortalPamProductController.create.
typedef struct {
  char*consumeruuid;  // optional
  voxgig_value*filter;  // optional
  char*language;  // optional
  char*merchantid;  // optional
  char*packageorderuuid;
  voxgig_value*pagination;  // optional
  char*productorderuuid;
  char*productuuid;
  char*reason_decline;
  voxgig_value*sorting;  // optional
} MerchantPortalPamProductControllerCreateData;

// OutputAddProduct is the typed data model for the output_add_product entity.
typedef struct {
  char*packageuuid;
  voxgig_value*productuuids;
  int64_t responsecode;
  char*responsemessage;
} OutputAddProduct;

// OutputAddProductCreateData is the typed request payload for OutputAddProduct.create.
typedef struct {
  char*packageuuid;
  voxgig_value*productuuids;
  int64_t responsecode;
  char*responsemessage;
} OutputAddProductCreateData;

// OutputCreateProduct is the typed data model for the output_create_product entity.
typedef struct {
  char*acquirerid;  // optional
  bool allowmultipleorders;
  char*appformtemplatename;
  bool contractneeded;
  bool credentialsneeded;  // optional
  char*descriptionkey;
  char*namekey;
  bool prescreeningallowed;
  char*productname;
  int64_t responsecode;
  char*responsemessage;
  char*terminaltemplatename;
  char*vendorname;
  char*xmltemplatefile;
} OutputCreateProduct;

// OutputCreateProductCreateData is the typed request payload for OutputCreateProduct.create.
typedef struct {
  char*acquirerid;  // optional
  bool allowmultipleorders;
  char*appformtemplatename;
  bool contractneeded;
  bool credentialsneeded;  // optional
  char*descriptionkey;
  char*namekey;
  bool prescreeningallowed;
  char*productname;
  int64_t responsecode;
  char*responsemessage;
  char*terminaltemplatename;
  char*vendorname;
  char*xmltemplatefile;
} OutputCreateProductCreateData;

// OutputDetail is the typed data model for the output_detail entity.
typedef struct {
  voxgig_value*batch;  // optional
  voxgig_value*lines;  // optional
  voxgig_value*progress;  // optional
} OutputDetail;

// OutputDetailLoadMatch is the typed request payload for OutputDetail.load.
typedef struct {
  char*id;
} OutputDetailLoadMatch;

// OutputList is the typed data model for the output_list entity.
typedef struct {
  voxgig_value*items;  // optional
  voxgig_value*pagination;
  int64_t responsecode;
  char*responsemessage;
  voxgig_value*sorting;  // optional
} OutputList;

// OutputListCreateData is the typed request payload for OutputList.create.
typedef struct {
  voxgig_value*items;  // optional
  voxgig_value*pagination;
  int64_t responsecode;
  char*responsemessage;
  voxgig_value*sorting;  // optional
} OutputListCreateData;

// OutputMessage is the typed data model for the output_message entity.
typedef struct {
  int64_t responsecode;
  char*responsemessage;
} OutputMessage;

// OutputMessageLoadMatch is the typed request payload for OutputMessage.load.
typedef struct {
  char*id;
} OutputMessageLoadMatch;

// OutputMoveTid is the typed data model for the output_move_tid entity.
typedef struct {
  voxgig_value*productorderuuids;
  int64_t responsecode;
  char*responsemessage;
  char*targetpackageorderuuid;
  char*targetproductorderuuid;
} OutputMoveTid;

// OutputMoveTidCreateData is the typed request payload for OutputMoveTid.create.
typedef struct {
  voxgig_value*productorderuuids;
  int64_t responsecode;
  char*responsemessage;
  char*targetpackageorderuuid;
  char*targetproductorderuuid;
} OutputMoveTidCreateData;

// OutputRemoveProduct is the typed data model for the output_remove_product entity.
typedef struct {
  char*packageuuid;
  voxgig_value*productuuids;
  int64_t responsecode;
  char*responsemessage;
} OutputRemoveProduct;

// OutputRemoveProductCreateData is the typed request payload for OutputRemoveProduct.create.
typedef struct {
  char*packageuuid;
  voxgig_value*productuuids;
  int64_t responsecode;
  char*responsemessage;
} OutputRemoveProductCreateData;

// OutputStart is the typed data model for the output_start entity.
typedef struct {
  char*id;  // optional
  int64_t responsecode;
  char*responsemessage;
} OutputStart;

// OutputStartCreateData is the typed request payload for OutputStart.create.
typedef struct {
  char*id;  // optional
  int64_t responsecode;
  char*responsemessage;
} OutputStartCreateData;

// OutputStatus is the typed data model for the output_status entity.
typedef struct {
  int64_t percentage;  // optional
  int64_t responsecode;
  char*responsemessage;
  char*status;  // optional
} OutputStatus;

// OutputStatusLoadMatch is the typed request payload for OutputStatus.load.
typedef struct {
  char*id;
} OutputStatusLoadMatch;

// OutputUpdateProduct is the typed data model for the output_update_product entity.
typedef struct {
  bool allowmultipleorders;  // optional
  char*appformname;  // optional
  bool contractneeded;  // optional
  bool credentialsneeded;  // optional
  char*descriptionkey;  // optional
  char*namekey;  // optional
  bool prescreeningallowed;  // optional
  char*productname;  // optional
  char*productstatus;  // optional
  char*productuuid;
  int64_t responsecode;
  char*responsemessage;
  char*vendorname;  // optional
} OutputUpdateProduct;

// OutputUpdateProductCreateData is the typed request payload for OutputUpdateProduct.create.
typedef struct {
  bool allowmultipleorders;  // optional
  char*appformname;  // optional
  bool contractneeded;  // optional
  bool credentialsneeded;  // optional
  char*descriptionkey;  // optional
  char*namekey;  // optional
  bool prescreeningallowed;  // optional
  char*productname;  // optional
  char*productstatus;  // optional
  char*productuuid;
  int64_t responsecode;
  char*responsemessage;
  char*vendorname;  // optional
} OutputUpdateProductCreateData;

#endif // BLUEFINTECSMERCHANTPORTAL_ENTITY_TYPES_H
