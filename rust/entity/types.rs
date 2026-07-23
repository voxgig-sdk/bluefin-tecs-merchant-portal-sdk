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
    pub product_order_uuid: String,
}

/// MerchantPortalPamContractControllerCreateData is the typed request payload for MerchantPortalPamContractController.create.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamContractControllerCreateData {
    pub language: String,
    pub product_order_uuid: String,
}

/// MerchantPortalPamDocumentController is the typed data model for the merchant_portal_pam_document_controller entity.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamDocumentController {
    pub app_form_field_desc_uuid: String,
    pub package_order_uuid: Option<String>,
    pub product_order_uuid: Option<String>,
}

/// MerchantPortalPamDocumentControllerCreateData is the typed request payload for MerchantPortalPamDocumentController.create.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamDocumentControllerCreateData {
    pub app_form_field_desc_uuid: String,
    pub package_order_uuid: Option<String>,
    pub product_order_uuid: Option<String>,
}

/// MerchantPortalPamFormController is the typed data model for the merchant_portal_pam_form_controller entity.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamFormController {
    pub app_form_fields_desc_uuid: String,
    pub filter: Option<std::collections::HashMap<String, Value>>,
    pub language: String,
    pub package_order: Option<std::collections::HashMap<String, Value>>,
    pub package_order_uuid: String,
    pub package_uuid: Option<String>,
    pub product_order: Option<Vec<Value>>,
    pub product_order_uuid: Option<String>,
    pub reason_of_reopening: String,
}

/// MerchantPortalPamFormControllerCreateData is the typed request payload for MerchantPortalPamFormController.create.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamFormControllerCreateData {
    pub app_form_fields_desc_uuid: String,
    pub filter: Option<std::collections::HashMap<String, Value>>,
    pub language: String,
    pub package_order: Option<std::collections::HashMap<String, Value>>,
    pub package_order_uuid: String,
    pub package_uuid: Option<String>,
    pub product_order: Option<Vec<Value>>,
    pub product_order_uuid: Option<String>,
    pub reason_of_reopening: String,
}

/// MerchantPortalPamMandatorController is the typed data model for the merchant_portal_pam_mandator_controller entity.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamMandatorController {
    pub client_secret: Option<String>,
    pub mandator_name: String,
    pub notification_email: Option<String>,
    pub package_uuid: String,
}

/// MerchantPortalPamMandatorControllerCreateData is the typed request payload for MerchantPortalPamMandatorController.create.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamMandatorControllerCreateData {
    pub client_secret: Option<String>,
    pub mandator_name: String,
    pub notification_email: Option<String>,
    pub package_uuid: String,
}

/// MerchantPortalPamMerchantController is the typed data model for the merchant_portal_pam_merchant_controller entity.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamMerchantController {
    pub additional_data: Option<std::collections::HashMap<String, Value>>,
    pub business_registration_number: String,
    pub city: Option<String>,
    pub company_name: String,
    pub corporate_uuid: String,
    pub country: Option<String>,
    pub currency: String,
    pub email: String,
    pub language: String,
    pub login: String,
    pub mandator: String,
    pub merchant_category_code: Option<String>,
    pub merchant_contract_number: String,
    pub merchant_name: Option<String>,
    pub package_uuid: Option<String>,
    pub packageorderuuid: String,
    pub phone_number: String,
    pub postal_code: Option<String>,
    pub productid_acquirer: String,
    pub region: Option<String>,
    pub registration_number: Option<String>,
    pub signature: Option<String>,
    pub street: Option<String>,
    pub terminal_id: Option<Vec<Value>>,
    pub terminalid_acquirer: Option<String>,
    pub vu_nummer: String,
}

/// MerchantPortalPamMerchantControllerCreateData is the typed request payload for MerchantPortalPamMerchantController.create.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamMerchantControllerCreateData {
    pub additional_data: Option<std::collections::HashMap<String, Value>>,
    pub business_registration_number: String,
    pub city: Option<String>,
    pub company_name: String,
    pub corporate_uuid: String,
    pub country: Option<String>,
    pub currency: String,
    pub email: String,
    pub language: String,
    pub login: String,
    pub mandator: String,
    pub merchant_category_code: Option<String>,
    pub merchant_contract_number: String,
    pub merchant_name: Option<String>,
    pub package_uuid: Option<String>,
    pub packageorderuuid: String,
    pub phone_number: String,
    pub postal_code: Option<String>,
    pub productid_acquirer: String,
    pub region: Option<String>,
    pub registration_number: Option<String>,
    pub signature: Option<String>,
    pub street: Option<String>,
    pub terminal_id: Option<Vec<Value>>,
    pub terminalid_acquirer: Option<String>,
    pub vu_nummer: String,
}

/// MerchantPortalPamPackageController is the typed data model for the merchant_portal_pam_package_controller entity.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamPackageController {
    pub consumer_uuid: Option<String>,
    pub corporate_uuid: Option<String>,
    pub country: Option<String>,
    pub description_key: Option<String>,
    pub filter: Option<std::collections::HashMap<String, Value>>,
    pub language: String,
    pub name_key: Option<String>,
    pub package_status: Option<String>,
    pub package_uuid: String,
    pub pagination: Option<std::collections::HashMap<String, Value>>,
    pub sorting: Option<std::collections::HashMap<String, Value>>,
}

/// MerchantPortalPamPackageControllerCreateData is the typed request payload for MerchantPortalPamPackageController.create.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamPackageControllerCreateData {
    pub consumer_uuid: Option<String>,
    pub corporate_uuid: Option<String>,
    pub country: Option<String>,
    pub description_key: Option<String>,
    pub filter: Option<std::collections::HashMap<String, Value>>,
    pub language: String,
    pub name_key: Option<String>,
    pub package_status: Option<String>,
    pub package_uuid: String,
    pub pagination: Option<std::collections::HashMap<String, Value>>,
    pub sorting: Option<std::collections::HashMap<String, Value>>,
}

/// MerchantPortalPamProductController is the typed data model for the merchant_portal_pam_product_controller entity.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamProductController {
    pub consumer_uuid: Option<String>,
    pub filter: Option<std::collections::HashMap<String, Value>>,
    pub language: Option<String>,
    pub merchant_id: Option<String>,
    pub package_order_uuid: String,
    pub pagination: Option<std::collections::HashMap<String, Value>>,
    pub product_order_uuid: String,
    pub product_uuid: String,
    pub reason_decline: String,
    pub sorting: Option<std::collections::HashMap<String, Value>>,
}

/// MerchantPortalPamProductControllerCreateData is the typed request payload for MerchantPortalPamProductController.create.
#[derive(Debug, Clone)]
pub struct MerchantPortalPamProductControllerCreateData {
    pub consumer_uuid: Option<String>,
    pub filter: Option<std::collections::HashMap<String, Value>>,
    pub language: Option<String>,
    pub merchant_id: Option<String>,
    pub package_order_uuid: String,
    pub pagination: Option<std::collections::HashMap<String, Value>>,
    pub product_order_uuid: String,
    pub product_uuid: String,
    pub reason_decline: String,
    pub sorting: Option<std::collections::HashMap<String, Value>>,
}

/// OutputAddProduct is the typed data model for the output_add_product entity.
#[derive(Debug, Clone)]
pub struct OutputAddProduct {
    pub package_uuid: String,
    pub product_uui_d: Vec<Value>,
    pub response_code: i64,
    pub response_message: String,
}

/// OutputAddProductCreateData is the typed request payload for OutputAddProduct.create.
#[derive(Debug, Clone)]
pub struct OutputAddProductCreateData {
    pub package_uuid: String,
    pub product_uui_d: Vec<Value>,
    pub response_code: i64,
    pub response_message: String,
}

/// OutputCreateProduct is the typed data model for the output_create_product entity.
#[derive(Debug, Clone)]
pub struct OutputCreateProduct {
    pub acquirer_id: Option<String>,
    pub allow_multiple_order: bool,
    pub app_form_template_name: String,
    pub contract_needed: bool,
    pub credentials_needed: Option<bool>,
    pub description_key: String,
    pub name_key: String,
    pub prescreening_allowed: bool,
    pub product_name: String,
    pub response_code: i64,
    pub response_message: String,
    pub terminal_template_name: String,
    pub vendor_name: String,
    pub xml_template_file: String,
}

/// OutputCreateProductCreateData is the typed request payload for OutputCreateProduct.create.
#[derive(Debug, Clone)]
pub struct OutputCreateProductCreateData {
    pub acquirer_id: Option<String>,
    pub allow_multiple_order: bool,
    pub app_form_template_name: String,
    pub contract_needed: bool,
    pub credentials_needed: Option<bool>,
    pub description_key: String,
    pub name_key: String,
    pub prescreening_allowed: bool,
    pub product_name: String,
    pub response_code: i64,
    pub response_message: String,
    pub terminal_template_name: String,
    pub vendor_name: String,
    pub xml_template_file: String,
}

/// OutputDetail is the typed data model for the output_detail entity.
#[derive(Debug, Clone)]
pub struct OutputDetail {
    pub detail: Option<std::collections::HashMap<String, Value>>,
    pub response_code: i64,
    pub response_message: String,
}

/// OutputDetailLoadMatch is the typed request payload for OutputDetail.load.
#[derive(Debug, Clone)]
pub struct OutputDetailLoadMatch {
    pub id: String,
}

/// OutputList is the typed data model for the output_list entity.
#[derive(Debug, Clone)]
pub struct OutputList {
    pub item: Option<Vec<Value>>,
    pub pagination: std::collections::HashMap<String, Value>,
    pub response_code: i64,
    pub response_message: String,
    pub sorting: Option<std::collections::HashMap<String, Value>>,
}

/// OutputListCreateData is the typed request payload for OutputList.create.
#[derive(Debug, Clone)]
pub struct OutputListCreateData {
    pub item: Option<Vec<Value>>,
    pub pagination: std::collections::HashMap<String, Value>,
    pub response_code: i64,
    pub response_message: String,
    pub sorting: Option<std::collections::HashMap<String, Value>>,
}

/// OutputMessage is the typed data model for the output_message entity.
#[derive(Debug, Clone)]
pub struct OutputMessage {
    pub response_code: i64,
    pub response_message: String,
}

/// OutputMessageLoadMatch is the typed request payload for OutputMessage.load.
#[derive(Debug, Clone)]
pub struct OutputMessageLoadMatch {
    pub id: String,
}

/// OutputMoveTid is the typed data model for the output_move_tid entity.
#[derive(Debug, Clone)]
pub struct OutputMoveTid {
    pub product_order_uui_d: Vec<Value>,
    pub response_code: i64,
    pub response_message: String,
    pub target_package_order_uuid: String,
    pub target_product_order_uuid: String,
}

/// OutputMoveTidCreateData is the typed request payload for OutputMoveTid.create.
#[derive(Debug, Clone)]
pub struct OutputMoveTidCreateData {
    pub product_order_uui_d: Vec<Value>,
    pub response_code: i64,
    pub response_message: String,
    pub target_package_order_uuid: String,
    pub target_product_order_uuid: String,
}

/// OutputRemoveProduct is the typed data model for the output_remove_product entity.
#[derive(Debug, Clone)]
pub struct OutputRemoveProduct {
    pub package_uuid: String,
    pub product_uui_d: Vec<Value>,
    pub response_code: i64,
    pub response_message: String,
}

/// OutputRemoveProductCreateData is the typed request payload for OutputRemoveProduct.create.
#[derive(Debug, Clone)]
pub struct OutputRemoveProductCreateData {
    pub package_uuid: String,
    pub product_uui_d: Vec<Value>,
    pub response_code: i64,
    pub response_message: String,
}

/// OutputStart is the typed data model for the output_start entity.
#[derive(Debug, Clone)]
pub struct OutputStart {
    pub id: Option<String>,
    pub response_code: i64,
    pub response_message: String,
}

/// OutputStartCreateData is the typed request payload for OutputStart.create.
#[derive(Debug, Clone)]
pub struct OutputStartCreateData {
    pub id: Option<String>,
    pub response_code: i64,
    pub response_message: String,
}

/// OutputStatus is the typed data model for the output_status entity.
#[derive(Debug, Clone)]
pub struct OutputStatus {
    pub percentage: Option<i64>,
    pub response_code: i64,
    pub response_message: String,
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
    pub allow_multiple_order: Option<bool>,
    pub app_form_name: Option<String>,
    pub contract_needed: Option<bool>,
    pub credentials_needed: Option<bool>,
    pub description_key: Option<String>,
    pub name_key: Option<String>,
    pub prescreening_allowed: Option<bool>,
    pub product_name: Option<String>,
    pub product_status: Option<String>,
    pub product_uuid: String,
    pub response_code: i64,
    pub response_message: String,
    pub vendor_name: Option<String>,
}

/// OutputUpdateProductCreateData is the typed request payload for OutputUpdateProduct.create.
#[derive(Debug, Clone)]
pub struct OutputUpdateProductCreateData {
    pub allow_multiple_order: Option<bool>,
    pub app_form_name: Option<String>,
    pub contract_needed: Option<bool>,
    pub credentials_needed: Option<bool>,
    pub description_key: Option<String>,
    pub name_key: Option<String>,
    pub prescreening_allowed: Option<bool>,
    pub product_name: Option<String>,
    pub product_status: Option<String>,
    pub product_uuid: String,
    pub response_code: i64,
    pub response_message: String,
    pub vendor_name: Option<String>,
}

