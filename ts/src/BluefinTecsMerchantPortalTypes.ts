// Typed models for the BluefinTecsMerchantPortal SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface MerchantPortalApiController {
  account_number?: number
  additional_data?: Record<string, any>
  business_reg_number: string
  city: string
  corporateuuid?: string
  country: string
  currency: string
  merchant_category_code: number
  merchant_email?: string
  merchant_name: string
  merchant_phone_number?: string
  packageid: string
  packageorderuuid: string
  password?: string
  productid?: string
  productid_acquirer?: string
  reason_deactivation: string
  reason_reactivation: string
  sorting_code?: number
  state?: string
  street: string
  terminal_country_code: string
  terminal_language_code: string
  terminal_location: string
  terminal_serial_number: string
  terminalid: number
  terminalid_acquirer?: string
  user_email?: string
  user_phone_number?: string
  username?: string
  vu_nummer: string
  web_shop_url?: string
  zipcode: string
}

export interface MerchantPortalApiControllerCreateData {
  account_number?: number
  additional_data?: Record<string, any>
  business_reg_number: string
  city: string
  corporateuuid?: string
  country: string
  currency: string
  merchant_category_code: number
  merchant_email?: string
  merchant_name: string
  merchant_phone_number?: string
  packageid: string
  packageorderuuid: string
  password?: string
  productid?: string
  productid_acquirer?: string
  reason_deactivation: string
  reason_reactivation: string
  sorting_code?: number
  state?: string
  street: string
  terminal_country_code: string
  terminal_language_code: string
  terminal_location: string
  terminal_serial_number: string
  terminalid: number
  terminalid_acquirer?: string
  user_email?: string
  user_phone_number?: string
  username?: string
  vu_nummer: string
  web_shop_url?: string
  zipcode: string
}

export interface MerchantPortalCommonController {
}

export interface MerchantPortalCommonControllerLoadMatch {
}

export interface MerchantPortalPamContractController {
  language: string
  product_order_uuid: string
}

export interface MerchantPortalPamContractControllerCreateData {
  language: string
  product_order_uuid: string
}

export interface MerchantPortalPamDocumentController {
  app_form_field_desc_uuid: string
  package_order_uuid?: string
  product_order_uuid?: string
}

export interface MerchantPortalPamDocumentControllerCreateData {
  app_form_field_desc_uuid: string
  package_order_uuid?: string
  product_order_uuid?: string
}

export interface MerchantPortalPamFormController {
  app_form_fields_desc_uuid: string
  filter?: Record<string, any>
  language: string
  package_order?: Record<string, any>
  package_order_uuid: string
  package_uuid?: string
  product_order?: any[]
  product_order_uuid?: string
  reason_of_reopening: string
}

export interface MerchantPortalPamFormControllerCreateData {
  app_form_fields_desc_uuid: string
  filter?: Record<string, any>
  language: string
  package_order?: Record<string, any>
  package_order_uuid: string
  package_uuid?: string
  product_order?: any[]
  product_order_uuid?: string
  reason_of_reopening: string
}

export interface MerchantPortalPamMandatorController {
  client_secret?: string
  mandator_name: string
  notification_email?: string
  package_uuid: string
}

export interface MerchantPortalPamMandatorControllerCreateData {
  client_secret?: string
  mandator_name: string
  notification_email?: string
  package_uuid: string
}

export interface MerchantPortalPamMerchantController {
  additional_data?: Record<string, any>
  business_registration_number: string
  city?: string
  company_name: string
  corporate_uuid: string
  country?: string
  currency: string
  email: string
  language: string
  login: string
  mandator: string
  merchant_category_code?: string
  merchant_contract_number: string
  merchant_name?: string
  package_uuid?: string
  packageorderuuid: string
  phone_number: string
  postal_code?: string
  productid_acquirer: string
  region?: string
  registration_number?: string
  signature?: string
  street?: string
  terminal_id?: any[]
  terminalid_acquirer?: string
  vu_nummer: string
}

export interface MerchantPortalPamMerchantControllerCreateData {
  additional_data?: Record<string, any>
  business_registration_number: string
  city?: string
  company_name: string
  corporate_uuid: string
  country?: string
  currency: string
  email: string
  language: string
  login: string
  mandator: string
  merchant_category_code?: string
  merchant_contract_number: string
  merchant_name?: string
  package_uuid?: string
  packageorderuuid: string
  phone_number: string
  postal_code?: string
  productid_acquirer: string
  region?: string
  registration_number?: string
  signature?: string
  street?: string
  terminal_id?: any[]
  terminalid_acquirer?: string
  vu_nummer: string
}

export interface MerchantPortalPamPackageController {
  consumer_uuid?: string
  corporate_uuid?: string
  country?: string
  description_key?: string
  filter?: Record<string, any>
  language: string
  name_key?: string
  package_status?: string
  package_uuid: string
  pagination?: Record<string, any>
  sorting?: Record<string, any>
}

export interface MerchantPortalPamPackageControllerCreateData {
  consumer_uuid?: string
  corporate_uuid?: string
  country?: string
  description_key?: string
  filter?: Record<string, any>
  language: string
  name_key?: string
  package_status?: string
  package_uuid: string
  pagination?: Record<string, any>
  sorting?: Record<string, any>
}

export interface MerchantPortalPamProductController {
  consumer_uuid?: string
  filter?: Record<string, any>
  language?: string
  merchant_id?: string
  package_order_uuid: string
  pagination?: Record<string, any>
  product_order_uuid: string
  product_uuid: string
  reason_decline: string
  sorting?: Record<string, any>
}

export interface MerchantPortalPamProductControllerCreateData {
  consumer_uuid?: string
  filter?: Record<string, any>
  language?: string
  merchant_id?: string
  package_order_uuid: string
  pagination?: Record<string, any>
  product_order_uuid: string
  product_uuid: string
  reason_decline: string
  sorting?: Record<string, any>
}

export interface OutputAddProduct {
  package_uuid: string
  product_uui_d: any[]
  response_code: number
  response_message: string
}

export interface OutputAddProductCreateData {
  package_uuid: string
  product_uui_d: any[]
  response_code: number
  response_message: string
}

export interface OutputCreateProduct {
  acquirer_id?: string
  allow_multiple_order: boolean
  app_form_template_name: string
  contract_needed: boolean
  credentials_needed?: boolean
  description_key: string
  name_key: string
  prescreening_allowed: boolean
  product_name: string
  response_code: number
  response_message: string
  terminal_template_name: string
  vendor_name: string
  xml_template_file: string
}

export interface OutputCreateProductCreateData {
  acquirer_id?: string
  allow_multiple_order: boolean
  app_form_template_name: string
  contract_needed: boolean
  credentials_needed?: boolean
  description_key: string
  name_key: string
  prescreening_allowed: boolean
  product_name: string
  response_code: number
  response_message: string
  terminal_template_name: string
  vendor_name: string
  xml_template_file: string
}

export interface OutputDetail {
  detail?: Record<string, any>
  response_code: number
  response_message: string
}

export interface OutputDetailLoadMatch {
  id: string
}

export interface OutputList {
  item?: any[]
  pagination: Record<string, any>
  response_code: number
  response_message: string
  sorting?: Record<string, any>
}

export interface OutputListCreateData {
  item?: any[]
  pagination: Record<string, any>
  response_code: number
  response_message: string
  sorting?: Record<string, any>
}

export interface OutputMessage {
  response_code: number
  response_message: string
}

export interface OutputMessageLoadMatch {
  id: string
}

export interface OutputMoveTid {
  product_order_uui_d: any[]
  response_code: number
  response_message: string
  target_package_order_uuid: string
  target_product_order_uuid: string
}

export interface OutputMoveTidCreateData {
  product_order_uui_d: any[]
  response_code: number
  response_message: string
  target_package_order_uuid: string
  target_product_order_uuid: string
}

export interface OutputRemoveProduct {
  package_uuid: string
  product_uui_d: any[]
  response_code: number
  response_message: string
}

export interface OutputRemoveProductCreateData {
  package_uuid: string
  product_uui_d: any[]
  response_code: number
  response_message: string
}

export interface OutputStart {
  id?: string
  response_code: number
  response_message: string
}

export interface OutputStartCreateData {
  id?: string
  response_code: number
  response_message: string
}

export interface OutputStatus {
  percentage?: number
  response_code: number
  response_message: string
  status?: string
}

export interface OutputStatusLoadMatch {
  id: string
}

export interface OutputUpdateProduct {
  allow_multiple_order?: boolean
  app_form_name?: string
  contract_needed?: boolean
  credentials_needed?: boolean
  description_key?: string
  name_key?: string
  prescreening_allowed?: boolean
  product_name?: string
  product_status?: string
  product_uuid: string
  response_code: number
  response_message: string
  vendor_name?: string
}

export interface OutputUpdateProductCreateData {
  allow_multiple_order?: boolean
  app_form_name?: string
  contract_needed?: boolean
  credentials_needed?: boolean
  description_key?: string
  name_key?: string
  prescreening_allowed?: boolean
  product_name?: string
  product_status?: string
  product_uuid: string
  response_code: number
  response_message: string
  vendor_name?: string
}

