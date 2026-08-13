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
  productOrderUUID: string
}

export interface MerchantPortalPamContractControllerCreateData {
  language: string
  productOrderUUID: string
}

export interface MerchantPortalPamDocumentController {
  appFormFieldDescUUID: string
  packageOrderUUID?: string
  productOrderUUID?: string
}

export interface MerchantPortalPamDocumentControllerCreateData {
  appFormFieldDescUUID: string
  packageOrderUUID?: string
  productOrderUUID?: string
}

export interface MerchantPortalPamFormController {
  appFormFieldsDescUUID: string
  filter?: Record<string, any>
  language: string
  packageOrder?: Record<string, any>
  packageOrderUUID: string
  packageUUID?: string
  productOrderUUID?: string
  productOrders?: any[]
  reasonOfReopening: string
}

export interface MerchantPortalPamFormControllerCreateData {
  appFormFieldsDescUUID: string
  filter?: Record<string, any>
  language: string
  packageOrder?: Record<string, any>
  packageOrderUUID: string
  packageUUID?: string
  productOrderUUID?: string
  productOrders?: any[]
  reasonOfReopening: string
}

export interface MerchantPortalPamMandatorController {
  clientSecret?: string
  mandatorName: string
  notificationEmail?: string
  packageUUID: string
}

export interface MerchantPortalPamMandatorControllerCreateData {
  clientSecret?: string
  mandatorName: string
  notificationEmail?: string
  packageUUID: string
}

export interface MerchantPortalPamMerchantController {
  additional_data?: Record<string, any>
  businessRegistrationNumber: string
  city?: string
  companyName: string
  corporateUUID: string
  country?: string
  currency: string
  email: string
  language: string
  login: string
  mandator: string
  merchantContractNumber: string
  merchantName?: string
  merchant_category_code?: string
  packageUUID?: string
  packageorderuuid: string
  phoneNumber: string
  postalCode?: string
  productid_acquirer: string
  region?: string
  registrationNumber?: string
  signature?: string
  street?: string
  terminalIds?: any[]
  terminalid_acquirer?: string
  vu_nummer: string
}

export interface MerchantPortalPamMerchantControllerCreateData {
  additional_data?: Record<string, any>
  businessRegistrationNumber: string
  city?: string
  companyName: string
  corporateUUID: string
  country?: string
  currency: string
  email: string
  language: string
  login: string
  mandator: string
  merchantContractNumber: string
  merchantName?: string
  merchant_category_code?: string
  packageUUID?: string
  packageorderuuid: string
  phoneNumber: string
  postalCode?: string
  productid_acquirer: string
  region?: string
  registrationNumber?: string
  signature?: string
  street?: string
  terminalIds?: any[]
  terminalid_acquirer?: string
  vu_nummer: string
}

export interface MerchantPortalPamPackageController {
  consumerUUID?: string
  corporateUUID?: string
  country?: string
  descriptionKey?: string
  filter?: Record<string, any>
  language: string
  nameKey?: string
  packageStatus?: string
  packageUUID: string
  pagination?: Record<string, any>
  sorting?: Record<string, any>
}

export interface MerchantPortalPamPackageControllerCreateData {
  consumerUUID?: string
  corporateUUID?: string
  country?: string
  descriptionKey?: string
  filter?: Record<string, any>
  language: string
  nameKey?: string
  packageStatus?: string
  packageUUID: string
  pagination?: Record<string, any>
  sorting?: Record<string, any>
}

export interface MerchantPortalPamProductController {
  consumerUUID?: string
  filter?: Record<string, any>
  language?: string
  merchantID?: string
  packageOrderUUID: string
  pagination?: Record<string, any>
  productOrderUUID: string
  productUUID: string
  reason_decline: string
  sorting?: Record<string, any>
}

export interface MerchantPortalPamProductControllerCreateData {
  consumerUUID?: string
  filter?: Record<string, any>
  language?: string
  merchantID?: string
  packageOrderUUID: string
  pagination?: Record<string, any>
  productOrderUUID: string
  productUUID: string
  reason_decline: string
  sorting?: Record<string, any>
}

export interface OutputAddProduct {
  packageUUID: string
  productUUIDs: any[]
  responseCode: number
  responseMessage: string
}

export interface OutputAddProductCreateData {
  packageUUID: string
  productUUIDs: any[]
  responseCode: number
  responseMessage: string
}

export interface OutputCreateProduct {
  acquirerId?: string
  allowMultipleOrders: boolean
  appFormTemplateName: string
  contractNeeded: boolean
  credentialsNeeded?: boolean
  descriptionKey: string
  nameKey: string
  prescreeningAllowed: boolean
  productName: string
  responseCode: number
  responseMessage: string
  terminalTemplateName: string
  vendorName: string
  xmlTemplateFile: string
}

export interface OutputCreateProductCreateData {
  acquirerId?: string
  allowMultipleOrders: boolean
  appFormTemplateName: string
  contractNeeded: boolean
  credentialsNeeded?: boolean
  descriptionKey: string
  nameKey: string
  prescreeningAllowed: boolean
  productName: string
  responseCode: number
  responseMessage: string
  terminalTemplateName: string
  vendorName: string
  xmlTemplateFile: string
}

export interface OutputDetail {
  batch?: Record<string, any>
  lines?: Record<string, any>
  progress?: Record<string, any>
}

export interface OutputDetailLoadMatch {
  id: string
}

export interface OutputList {
  items?: any[]
  pagination: Record<string, any>
  responseCode: number
  responseMessage: string
  sorting?: Record<string, any>
}

export interface OutputListCreateData {
  items?: any[]
  pagination: Record<string, any>
  responseCode: number
  responseMessage: string
  sorting?: Record<string, any>
}

export interface OutputMessage {
  responseCode: number
  responseMessage: string
}

export interface OutputMessageLoadMatch {
  id: string
}

export interface OutputMoveTid {
  productOrderUUIDs: any[]
  responseCode: number
  responseMessage: string
  targetPackageOrderUUID: string
  targetProductOrderUUID: string
}

export interface OutputMoveTidCreateData {
  productOrderUUIDs: any[]
  responseCode: number
  responseMessage: string
  targetPackageOrderUUID: string
  targetProductOrderUUID: string
}

export interface OutputRemoveProduct {
  packageUUID: string
  productUUIDs: any[]
  responseCode: number
  responseMessage: string
}

export interface OutputRemoveProductCreateData {
  packageUUID: string
  productUUIDs: any[]
  responseCode: number
  responseMessage: string
}

export interface OutputStart {
  id?: string
  responseCode: number
  responseMessage: string
}

export interface OutputStartCreateData {
  id?: string
  responseCode: number
  responseMessage: string
}

export interface OutputStatus {
  percentage?: number
  responseCode: number
  responseMessage: string
  status?: string
}

export interface OutputStatusLoadMatch {
  id: string
}

export interface OutputUpdateProduct {
  allowMultipleOrders?: boolean
  appFormName?: string
  contractNeeded?: boolean
  credentialsNeeded?: boolean
  descriptionKey?: string
  nameKey?: string
  prescreeningAllowed?: boolean
  productName?: string
  productStatus?: string
  productUUID: string
  responseCode: number
  responseMessage: string
  vendorName?: string
}

export interface OutputUpdateProductCreateData {
  allowMultipleOrders?: boolean
  appFormName?: string
  contractNeeded?: boolean
  credentialsNeeded?: boolean
  descriptionKey?: string
  nameKey?: string
  prescreeningAllowed?: boolean
  productName?: string
  productStatus?: string
  productUUID: string
  responseCode: number
  responseMessage: string
  vendorName?: string
}

