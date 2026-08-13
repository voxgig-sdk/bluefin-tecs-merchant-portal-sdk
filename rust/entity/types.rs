// Typed models for the BluefinTecsMerchantPortal SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types are mapped
// from the canonical type sentinels. Do not edit by hand.
//
// These are DOCUMENTARY: the SDK runtime is dynamic (ops take/return the
// `Value` enum), so nothing consumes these structs yet — they mirror the
// entity/op shapes for reference and IDE support.
#![allow(dead_code, non_snake_case, unused_imports)]

use crate::utility::voxgigstruct::Value;

/// MerchantPortalApiController is the typed data model for the merchant_portal_api_controller entity.
#[derive(Debug, Clone)]
pub struct MerchantPortalApiController {
    pub account_number: Option<i64>,
    pub additional_data: Option<std::collections::HashMap<String, Value>>,
    pub business_reg_number: String,
    pub city: String,
    pub corporateuuid: Option<String>,
    pub country: String,
    pub currency: String,
    pub merchant_category_code: i64,
    pub merchant_email: Option<String>,
    pub merchant_name: String,
    pub merchant_phone_number: Option<String>,
    pub packageid: String,
    pub packageorderuuid: String,
    pub password: Option<String>,
    pub productid: Option<String>,
    pub productid_acquirer: Option<String>,
    pub reason_deactivation: String,
    pub reason_reactivation: String,
    pub sorting_code: Option<i64>,
    pub state: Option<String>,
    pub street: String,
    pub terminal_country_code: String,
    pub terminal_language_code: String,
    pub terminal_location: String,
    pub terminal_serial_number: String,
    pub terminalid: i64,
    pub terminalid_acquirer: Option<String>,
    pub user_email: Option<String>,
    pub user_phone_number: Option<String>,
    pub username: Option<String>,
    pub vu_nummer: String,
    pub web_shop_url: Option<String>,
    pub zipcode: String,
}

/// MerchantPortalApiControllerCreateData is the typed request payload for MerchantPortalApiController.create.
#[derive(Debug, Clone)]
pub struct MerchantPortalApiControllerCreateData {
    pub account_number: Option<i64>,
    pub additional_data: Option<std::collections::HashMap<String, Value>>,
    pub business_reg_number: String,
    pub city: String,
    pub corporateuuid: Option<String>,
    pub country: String,
    pub currency: String,
    pub merchant_category_code: i64,
    pub merchant_email: Option<String>,
    pub merchant_name: String,
    pub merchant_phone_number: Option<String>,
    pub packageid: String,
    pub packageorderuuid: String,
    pub password: Option<String>,
    pub productid: Option<String>,
    pub productid_acquirer: Option<String>,
    pub reason_deactivation: String,
    pub reason_reactivation: String,
    pub sorting_code: Option<i64>,
    pub state: Option<String>,
    pub street: String,
    pub terminal_country_code: String,
    pub terminal_language_code: String,
    pub terminal_location: String,
    pub terminal_serial_number: String,
    pub terminalid: i64,
    pub terminalid_acquirer: Option<String>,
    pub user_email: Option<String>,
    pub user_phone_number: Option<String>,
    pub username: Option<String>,
    pub vu_nummer: String,
    pub web_shop_url: Option<String>,
    pub zipcode: String,
}

/// MerchantPortalCommonController is the typed data model for the merchant_portal_common_controller entity.
#[derive(Debug, Clone)]
pub struct MerchantPortalCommonController {
}

/// MerchantPortalCommonControllerLoadMatch is the typed request payload for MerchantPortalCommonController.load.
#[derive(Debug, Clone)]
pub struct MerchantPortalCommonControllerLoadMatch {
}

/// MerchantPortalPamContractController is the typed data model for the merchant_portal_pam_contract_controller entity.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamContractController {
    pub language: String,
    pub productorderuuid: String,
}

/// MerchantPortalPamContractControllerCreateData is the typed request payload for MerchantPortalPamContractController.create.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamContractControllerCreateData {
    pub language: String,
    pub productorderuuid: String,
}

/// MerchantPortalPamDocumentController is the typed data model for the merchant_portal_pam_document_controller entity.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamDocumentController {
    pub appformfielddescuuid: String,
    pub packageorderuuid: Option<String>,
    pub productorderuuid: Option<String>,
}

/// MerchantPortalPamDocumentControllerCreateData is the typed request payload for MerchantPortalPamDocumentController.create.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamDocumentControllerCreateData {
    pub appformfielddescuuid: String,
    pub packageorderuuid: Option<String>,
    pub productorderuuid: Option<String>,
}

/// MerchantPortalPamFormController is the typed data model for the merchant_portal_pam_form_controller entity.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamFormController {
    pub appformfieldsdescuuid: String,
    pub filter: Option<std::collections::HashMap<String, Value>>,
    pub language: String,
    pub packageorder: Option<std::collections::HashMap<String, Value>>,
    pub packageorderuuid: String,
    pub packageuuid: Option<String>,
    pub productorderuuid: Option<String>,
    pub productorders: Option<Vec<Value>>,
    pub reasonofreopening: String,
}

/// MerchantPortalPamFormControllerCreateData is the typed request payload for MerchantPortalPamFormController.create.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamFormControllerCreateData {
    pub appformfieldsdescuuid: String,
    pub filter: Option<std::collections::HashMap<String, Value>>,
    pub language: String,
    pub packageorder: Option<std::collections::HashMap<String, Value>>,
    pub packageorderuuid: String,
    pub packageuuid: Option<String>,
    pub productorderuuid: Option<String>,
    pub productorders: Option<Vec<Value>>,
    pub reasonofreopening: String,
}

/// MerchantPortalPamMandatorController is the typed data model for the merchant_portal_pam_mandator_controller entity.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamMandatorController {
    pub clientsecret: Option<String>,
    pub mandatorname: String,
    pub notificationemail: Option<String>,
    pub packageuuid: String,
}

/// MerchantPortalPamMandatorControllerCreateData is the typed request payload for MerchantPortalPamMandatorController.create.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamMandatorControllerCreateData {
    pub clientsecret: Option<String>,
    pub mandatorname: String,
    pub notificationemail: Option<String>,
    pub packageuuid: String,
}

/// MerchantPortalPamMerchantController is the typed data model for the merchant_portal_pam_merchant_controller entity.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamMerchantController {
    pub additional_data: Option<std::collections::HashMap<String, Value>>,
    pub businessregistrationnumber: String,
    pub city: Option<String>,
    pub companyname: String,
    pub corporateuuid: String,
    pub country: Option<String>,
    pub currency: String,
    pub email: String,
    pub language: String,
    pub login: String,
    pub mandator: String,
    pub merchantcontractnumber: String,
    pub merchantname: Option<String>,
    pub merchant_category_code: Option<String>,
    pub packageuuid: Option<String>,
    pub packageorderuuid: String,
    pub phonenumber: String,
    pub postalcode: Option<String>,
    pub productid_acquirer: String,
    pub region: Option<String>,
    pub registrationnumber: Option<String>,
    pub signature: Option<String>,
    pub street: Option<String>,
    pub terminalids: Option<Vec<Value>>,
    pub terminalid_acquirer: Option<String>,
    pub vu_nummer: String,
}

/// MerchantPortalPamMerchantControllerCreateData is the typed request payload for MerchantPortalPamMerchantController.create.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamMerchantControllerCreateData {
    pub additional_data: Option<std::collections::HashMap<String, Value>>,
    pub businessregistrationnumber: String,
    pub city: Option<String>,
    pub companyname: String,
    pub corporateuuid: String,
    pub country: Option<String>,
    pub currency: String,
    pub email: String,
    pub language: String,
    pub login: String,
    pub mandator: String,
    pub merchantcontractnumber: String,
    pub merchantname: Option<String>,
    pub merchant_category_code: Option<String>,
    pub packageuuid: Option<String>,
    pub packageorderuuid: String,
    pub phonenumber: String,
    pub postalcode: Option<String>,
    pub productid_acquirer: String,
    pub region: Option<String>,
    pub registrationnumber: Option<String>,
    pub signature: Option<String>,
    pub street: Option<String>,
    pub terminalids: Option<Vec<Value>>,
    pub terminalid_acquirer: Option<String>,
    pub vu_nummer: String,
}

/// MerchantPortalPamPackageController is the typed data model for the merchant_portal_pam_package_controller entity.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamPackageController {
    pub consumeruuid: Option<String>,
    pub corporateuuid: Option<String>,
    pub country: Option<String>,
    pub descriptionkey: Option<String>,
    pub filter: Option<std::collections::HashMap<String, Value>>,
    pub language: String,
    pub namekey: Option<String>,
    pub packagestatus: Option<String>,
    pub packageuuid: String,
    pub pagination: Option<std::collections::HashMap<String, Value>>,
    pub sorting: Option<std::collections::HashMap<String, Value>>,
}

/// MerchantPortalPamPackageControllerCreateData is the typed request payload for MerchantPortalPamPackageController.create.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamPackageControllerCreateData {
    pub consumeruuid: Option<String>,
    pub corporateuuid: Option<String>,
    pub country: Option<String>,
    pub descriptionkey: Option<String>,
    pub filter: Option<std::collections::HashMap<String, Value>>,
    pub language: String,
    pub namekey: Option<String>,
    pub packagestatus: Option<String>,
    pub packageuuid: String,
    pub pagination: Option<std::collections::HashMap<String, Value>>,
    pub sorting: Option<std::collections::HashMap<String, Value>>,
}

/// MerchantPortalPamProductController is the typed data model for the merchant_portal_pam_product_controller entity.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamProductController {
    pub consumeruuid: Option<String>,
    pub filter: Option<std::collections::HashMap<String, Value>>,
    pub language: Option<String>,
    pub merchantid: Option<String>,
    pub packageorderuuid: String,
    pub pagination: Option<std::collections::HashMap<String, Value>>,
    pub productorderuuid: String,
    pub productuuid: String,
    pub reason_decline: String,
    pub sorting: Option<std::collections::HashMap<String, Value>>,
}

/// MerchantPortalPamProductControllerCreateData is the typed request payload for MerchantPortalPamProductController.create.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamProductControllerCreateData {
    pub consumeruuid: Option<String>,
    pub filter: Option<std::collections::HashMap<String, Value>>,
    pub language: Option<String>,
    pub merchantid: Option<String>,
    pub packageorderuuid: String,
    pub pagination: Option<std::collections::HashMap<String, Value>>,
    pub productorderuuid: String,
    pub productuuid: String,
    pub reason_decline: String,
    pub sorting: Option<std::collections::HashMap<String, Value>>,
}

/// OutputAddProduct is the typed data model for the output_add_product entity.
#[derive(Debug, Clone)]
pub struct OutputAddProduct {
    pub packageuuid: String,
    pub productuuids: Vec<Value>,
    pub responsecode: i64,
    pub responsemessage: String,
}

/// OutputAddProductCreateData is the typed request payload for OutputAddProduct.create.
#[derive(Debug, Clone)]
pub struct OutputAddProductCreateData {
    pub packageuuid: String,
    pub productuuids: Vec<Value>,
    pub responsecode: i64,
    pub responsemessage: String,
}

/// OutputCreateProduct is the typed data model for the output_create_product entity.
#[derive(Debug, Clone)]
pub struct OutputCreateProduct {
    pub acquirerid: Option<String>,
    pub allowmultipleorders: bool,
    pub appformtemplatename: String,
    pub contractneeded: bool,
    pub credentialsneeded: Option<bool>,
    pub descriptionkey: String,
    pub namekey: String,
    pub prescreeningallowed: bool,
    pub productname: String,
    pub responsecode: i64,
    pub responsemessage: String,
    pub terminaltemplatename: String,
    pub vendorname: String,
    pub xmltemplatefile: String,
}

/// OutputCreateProductCreateData is the typed request payload for OutputCreateProduct.create.
#[derive(Debug, Clone)]
pub struct OutputCreateProductCreateData {
    pub acquirerid: Option<String>,
    pub allowmultipleorders: bool,
    pub appformtemplatename: String,
    pub contractneeded: bool,
    pub credentialsneeded: Option<bool>,
    pub descriptionkey: String,
    pub namekey: String,
    pub prescreeningallowed: bool,
    pub productname: String,
    pub responsecode: i64,
    pub responsemessage: String,
    pub terminaltemplatename: String,
    pub vendorname: String,
    pub xmltemplatefile: String,
}

/// OutputDetail is the typed data model for the output_detail entity.
#[derive(Debug, Clone)]
pub struct OutputDetail {
    pub batch: Option<std::collections::HashMap<String, Value>>,
    pub lines: Option<std::collections::HashMap<String, Value>>,
    pub progress: Option<std::collections::HashMap<String, Value>>,
}

/// OutputDetailLoadMatch is the typed request payload for OutputDetail.load.
#[derive(Debug, Clone)]
pub struct OutputDetailLoadMatch {
    pub id: String,
}

/// OutputList is the typed data model for the output_list entity.
#[derive(Debug, Clone)]
pub struct OutputList {
    pub items: Option<Vec<Value>>,
    pub pagination: std::collections::HashMap<String, Value>,
    pub responsecode: i64,
    pub responsemessage: String,
    pub sorting: Option<std::collections::HashMap<String, Value>>,
}

/// OutputListCreateData is the typed request payload for OutputList.create.
#[derive(Debug, Clone)]
pub struct OutputListCreateData {
    pub items: Option<Vec<Value>>,
    pub pagination: std::collections::HashMap<String, Value>,
    pub responsecode: i64,
    pub responsemessage: String,
    pub sorting: Option<std::collections::HashMap<String, Value>>,
}

/// OutputMessage is the typed data model for the output_message entity.
#[derive(Debug, Clone)]
pub struct OutputMessage {
    pub responsecode: i64,
    pub responsemessage: String,
}

/// OutputMessageLoadMatch is the typed request payload for OutputMessage.load.
#[derive(Debug, Clone)]
pub struct OutputMessageLoadMatch {
    pub id: String,
}

/// OutputMoveTid is the typed data model for the output_move_tid entity.
#[derive(Debug, Clone)]
pub struct OutputMoveTid {
    pub productorderuuids: Vec<Value>,
    pub responsecode: i64,
    pub responsemessage: String,
    pub targetpackageorderuuid: String,
    pub targetproductorderuuid: String,
}

/// OutputMoveTidCreateData is the typed request payload for OutputMoveTid.create.
#[derive(Debug, Clone)]
pub struct OutputMoveTidCreateData {
    pub productorderuuids: Vec<Value>,
    pub responsecode: i64,
    pub responsemessage: String,
    pub targetpackageorderuuid: String,
    pub targetproductorderuuid: String,
}

/// OutputRemoveProduct is the typed data model for the output_remove_product entity.
#[derive(Debug, Clone)]
pub struct OutputRemoveProduct {
    pub packageuuid: String,
    pub productuuids: Vec<Value>,
    pub responsecode: i64,
    pub responsemessage: String,
}

/// OutputRemoveProductCreateData is the typed request payload for OutputRemoveProduct.create.
#[derive(Debug, Clone)]
pub struct OutputRemoveProductCreateData {
    pub packageuuid: String,
    pub productuuids: Vec<Value>,
    pub responsecode: i64,
    pub responsemessage: String,
}

/// OutputStart is the typed data model for the output_start entity.
#[derive(Debug, Clone)]
pub struct OutputStart {
    pub id: Option<String>,
    pub responsecode: i64,
    pub responsemessage: String,
}

/// OutputStartCreateData is the typed request payload for OutputStart.create.
#[derive(Debug, Clone)]
pub struct OutputStartCreateData {
    pub id: Option<String>,
    pub responsecode: i64,
    pub responsemessage: String,
}

/// OutputStatus is the typed data model for the output_status entity.
#[derive(Debug, Clone)]
pub struct OutputStatus {
    pub percentage: Option<i64>,
    pub responsecode: i64,
    pub responsemessage: String,
    pub status: Option<String>,
}

/// OutputStatusLoadMatch is the typed request payload for OutputStatus.load.
#[derive(Debug, Clone)]
pub struct OutputStatusLoadMatch {
    pub id: String,
}

/// OutputUpdateProduct is the typed data model for the output_update_product entity.
#[derive(Debug, Clone)]
pub struct OutputUpdateProduct {
    pub allowmultipleorders: Option<bool>,
    pub appformname: Option<String>,
    pub contractneeded: Option<bool>,
    pub credentialsneeded: Option<bool>,
    pub descriptionkey: Option<String>,
    pub namekey: Option<String>,
    pub prescreeningallowed: Option<bool>,
    pub productname: Option<String>,
    pub productstatus: Option<String>,
    pub productuuid: String,
    pub responsecode: i64,
    pub responsemessage: String,
    pub vendorname: Option<String>,
}

/// OutputUpdateProductCreateData is the typed request payload for OutputUpdateProduct.create.
#[derive(Debug, Clone)]
pub struct OutputUpdateProductCreateData {
    pub allowmultipleorders: Option<bool>,
    pub appformname: Option<String>,
    pub contractneeded: Option<bool>,
    pub credentialsneeded: Option<bool>,
    pub descriptionkey: Option<String>,
    pub namekey: Option<String>,
    pub prescreeningallowed: Option<bool>,
    pub productname: Option<String>,
    pub productstatus: Option<String>,
    pub productuuid: String,
    pub responsecode: i64,
    pub responsemessage: String,
    pub vendorname: Option<String>,
}

