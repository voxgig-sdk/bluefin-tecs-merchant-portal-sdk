// Typed models for the BluefinTecsMerchantPortal SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types are mapped
// from the canonical type sentinels. Do not edit by hand.
//
// These are DOCUMENTARY: the SDK runtime is dynamic (ops take/return the
// `Value` enum), so nothing consumes these structs yet — they mirror the
// entity/op shapes for reference and IDE support.

import Foundation

/// MerchantPortalApiController is the typed data model for the merchant_portal_api_controller entity.
public struct MerchantPortalApiController {
  public var accountNumber: Int?
  public var additionalData: VMap?
  public var businessRegNumber: String
  public var city: String
  public var corporateuuid: String?
  public var country: String
  public var currency: String
  public var merchantCategoryCode: Int
  public var merchantEmail: String?
  public var merchantName: String
  public var merchantPhoneNumber: String?
  public var packageid: String
  public var packageorderuuid: String
  public var password: String?
  public var productid: String?
  public var productidAcquirer: String?
  public var reasonDeactivation: String
  public var reasonReactivation: String
  public var sortingCode: Int?
  public var state: String?
  public var street: String
  public var terminalCountryCode: String
  public var terminalLanguageCode: String
  public var terminalLocation: String
  public var terminalSerialNumber: String
  public var terminalid: Int
  public var terminalidAcquirer: String?
  public var userEmail: String?
  public var userPhoneNumber: String?
  public var username: String?
  public var vuNummer: String
  public var webShopUrl: String?
  public var zipcode: String
}

/// MerchantPortalApiControllerCreateData is the typed request payload for MerchantPortalApiController.create.
public struct MerchantPortalApiControllerCreateData {
  public var accountNumber: Int?
  public var additionalData: VMap?
  public var businessRegNumber: String
  public var city: String
  public var corporateuuid: String?
  public var country: String
  public var currency: String
  public var merchantCategoryCode: Int
  public var merchantEmail: String?
  public var merchantName: String
  public var merchantPhoneNumber: String?
  public var packageid: String
  public var packageorderuuid: String
  public var password: String?
  public var productid: String?
  public var productidAcquirer: String?
  public var reasonDeactivation: String
  public var reasonReactivation: String
  public var sortingCode: Int?
  public var state: String?
  public var street: String
  public var terminalCountryCode: String
  public var terminalLanguageCode: String
  public var terminalLocation: String
  public var terminalSerialNumber: String
  public var terminalid: Int
  public var terminalidAcquirer: String?
  public var userEmail: String?
  public var userPhoneNumber: String?
  public var username: String?
  public var vuNummer: String
  public var webShopUrl: String?
  public var zipcode: String
}

/// MerchantPortalCommonController is the typed data model for the merchant_portal_common_controller entity.
public struct MerchantPortalCommonController {
}

/// MerchantPortalCommonControllerLoadMatch is the typed request payload for MerchantPortalCommonController.load.
public struct MerchantPortalCommonControllerLoadMatch {
}

/// MerchantPortalPamContractController is the typed data model for the merchant_portal_pam_contract_controller entity.
public struct MerchantPortalPamContractController {
  public var language: String
  public var productOrderUuid: String
}

/// MerchantPortalPamContractControllerCreateData is the typed request payload for MerchantPortalPamContractController.create.
public struct MerchantPortalPamContractControllerCreateData {
  public var language: String
  public var productOrderUuid: String
}

/// MerchantPortalPamDocumentController is the typed data model for the merchant_portal_pam_document_controller entity.
public struct MerchantPortalPamDocumentController {
  public var appFormFieldDescUuid: String
  public var packageOrderUuid: String?
  public var productOrderUuid: String?
}

/// MerchantPortalPamDocumentControllerCreateData is the typed request payload for MerchantPortalPamDocumentController.create.
public struct MerchantPortalPamDocumentControllerCreateData {
  public var appFormFieldDescUuid: String
  public var packageOrderUuid: String?
  public var productOrderUuid: String?
}

/// MerchantPortalPamFormController is the typed data model for the merchant_portal_pam_form_controller entity.
public struct MerchantPortalPamFormController {
  public var appFormFieldsDescUuid: String
  public var filter: VMap?
  public var language: String
  public var packageOrder: VMap?
  public var packageOrderUuid: String
  public var packageUuid: String?
  public var productOrder: [Value]?
  public var productOrderUuid: String?
  public var reasonOfReopening: String
}

/// MerchantPortalPamFormControllerCreateData is the typed request payload for MerchantPortalPamFormController.create.
public struct MerchantPortalPamFormControllerCreateData {
  public var appFormFieldsDescUuid: String
  public var filter: VMap?
  public var language: String
  public var packageOrder: VMap?
  public var packageOrderUuid: String
  public var packageUuid: String?
  public var productOrder: [Value]?
  public var productOrderUuid: String?
  public var reasonOfReopening: String
}

/// MerchantPortalPamMandatorController is the typed data model for the merchant_portal_pam_mandator_controller entity.
public struct MerchantPortalPamMandatorController {
  public var clientSecret: String?
  public var mandatorName: String
  public var notificationEmail: String?
  public var packageUuid: String
}

/// MerchantPortalPamMandatorControllerCreateData is the typed request payload for MerchantPortalPamMandatorController.create.
public struct MerchantPortalPamMandatorControllerCreateData {
  public var clientSecret: String?
  public var mandatorName: String
  public var notificationEmail: String?
  public var packageUuid: String
}

/// MerchantPortalPamMerchantController is the typed data model for the merchant_portal_pam_merchant_controller entity.
public struct MerchantPortalPamMerchantController {
  public var additionalData: VMap?
  public var businessRegistrationNumber: String
  public var city: String?
  public var companyName: String
  public var corporateUuid: String
  public var country: String?
  public var currency: String
  public var email: String
  public var language: String
  public var login: String
  public var mandator: String
  public var merchantCategoryCode: String?
  public var merchantContractNumber: String
  public var merchantName: String?
  public var packageUuid: String?
  public var packageorderuuid: String
  public var phoneNumber: String
  public var postalCode: String?
  public var productidAcquirer: String
  public var region: String?
  public var registrationNumber: String?
  public var signature: String?
  public var street: String?
  public var terminalId: [Value]?
  public var terminalidAcquirer: String?
  public var vuNummer: String
}

/// MerchantPortalPamMerchantControllerCreateData is the typed request payload for MerchantPortalPamMerchantController.create.
public struct MerchantPortalPamMerchantControllerCreateData {
  public var additionalData: VMap?
  public var businessRegistrationNumber: String
  public var city: String?
  public var companyName: String
  public var corporateUuid: String
  public var country: String?
  public var currency: String
  public var email: String
  public var language: String
  public var login: String
  public var mandator: String
  public var merchantCategoryCode: String?
  public var merchantContractNumber: String
  public var merchantName: String?
  public var packageUuid: String?
  public var packageorderuuid: String
  public var phoneNumber: String
  public var postalCode: String?
  public var productidAcquirer: String
  public var region: String?
  public var registrationNumber: String?
  public var signature: String?
  public var street: String?
  public var terminalId: [Value]?
  public var terminalidAcquirer: String?
  public var vuNummer: String
}

/// MerchantPortalPamPackageController is the typed data model for the merchant_portal_pam_package_controller entity.
public struct MerchantPortalPamPackageController {
  public var consumerUuid: String?
  public var corporateUuid: String?
  public var country: String?
  public var descriptionKey: String?
  public var filter: VMap?
  public var language: String
  public var nameKey: String?
  public var packageStatus: String?
  public var packageUuid: String
  public var pagination: VMap?
  public var sorting: VMap?
}

/// MerchantPortalPamPackageControllerCreateData is the typed request payload for MerchantPortalPamPackageController.create.
public struct MerchantPortalPamPackageControllerCreateData {
  public var consumerUuid: String?
  public var corporateUuid: String?
  public var country: String?
  public var descriptionKey: String?
  public var filter: VMap?
  public var language: String
  public var nameKey: String?
  public var packageStatus: String?
  public var packageUuid: String
  public var pagination: VMap?
  public var sorting: VMap?
}

/// MerchantPortalPamProductController is the typed data model for the merchant_portal_pam_product_controller entity.
public struct MerchantPortalPamProductController {
  public var consumerUuid: String?
  public var filter: VMap?
  public var language: String?
  public var merchantId: String?
  public var packageOrderUuid: String
  public var pagination: VMap?
  public var productOrderUuid: String
  public var productUuid: String
  public var reasonDecline: String
  public var sorting: VMap?
}

/// MerchantPortalPamProductControllerCreateData is the typed request payload for MerchantPortalPamProductController.create.
public struct MerchantPortalPamProductControllerCreateData {
  public var consumerUuid: String?
  public var filter: VMap?
  public var language: String?
  public var merchantId: String?
  public var packageOrderUuid: String
  public var pagination: VMap?
  public var productOrderUuid: String
  public var productUuid: String
  public var reasonDecline: String
  public var sorting: VMap?
}

/// OutputAddProduct is the typed data model for the output_add_product entity.
public struct OutputAddProduct {
  public var packageUuid: String
  public var productUuiD: [Value]
  public var responseCode: Int
  public var responseMessage: String
}

/// OutputAddProductCreateData is the typed request payload for OutputAddProduct.create.
public struct OutputAddProductCreateData {
  public var packageUuid: String
  public var productUuiD: [Value]
  public var responseCode: Int
  public var responseMessage: String
}

/// OutputCreateProduct is the typed data model for the output_create_product entity.
public struct OutputCreateProduct {
  public var acquirerId: String?
  public var allowMultipleOrder: Bool
  public var appFormTemplateName: String
  public var contractNeeded: Bool
  public var credentialsNeeded: Bool?
  public var descriptionKey: String
  public var nameKey: String
  public var prescreeningAllowed: Bool
  public var productName: String
  public var responseCode: Int
  public var responseMessage: String
  public var terminalTemplateName: String
  public var vendorName: String
  public var xmlTemplateFile: String
}

/// OutputCreateProductCreateData is the typed request payload for OutputCreateProduct.create.
public struct OutputCreateProductCreateData {
  public var acquirerId: String?
  public var allowMultipleOrder: Bool
  public var appFormTemplateName: String
  public var contractNeeded: Bool
  public var credentialsNeeded: Bool?
  public var descriptionKey: String
  public var nameKey: String
  public var prescreeningAllowed: Bool
  public var productName: String
  public var responseCode: Int
  public var responseMessage: String
  public var terminalTemplateName: String
  public var vendorName: String
  public var xmlTemplateFile: String
}

/// OutputDetail is the typed data model for the output_detail entity.
public struct OutputDetail {
  public var detail: VMap?
  public var responseCode: Int
  public var responseMessage: String
}

/// OutputDetailLoadMatch is the typed request payload for OutputDetail.load.
public struct OutputDetailLoadMatch {
  public var id: String
}

/// OutputList is the typed data model for the output_list entity.
public struct OutputList {
  public var item: [Value]?
  public var pagination: VMap
  public var responseCode: Int
  public var responseMessage: String
  public var sorting: VMap?
}

/// OutputListCreateData is the typed request payload for OutputList.create.
public struct OutputListCreateData {
  public var item: [Value]?
  public var pagination: VMap
  public var responseCode: Int
  public var responseMessage: String
  public var sorting: VMap?
}

/// OutputMessage is the typed data model for the output_message entity.
public struct OutputMessage {
  public var responseCode: Int
  public var responseMessage: String
}

/// OutputMessageLoadMatch is the typed request payload for OutputMessage.load.
public struct OutputMessageLoadMatch {
  public var id: String
}

/// OutputMoveTid is the typed data model for the output_move_tid entity.
public struct OutputMoveTid {
  public var productOrderUuiD: [Value]
  public var responseCode: Int
  public var responseMessage: String
  public var targetPackageOrderUuid: String
  public var targetProductOrderUuid: String
}

/// OutputMoveTidCreateData is the typed request payload for OutputMoveTid.create.
public struct OutputMoveTidCreateData {
  public var productOrderUuiD: [Value]
  public var responseCode: Int
  public var responseMessage: String
  public var targetPackageOrderUuid: String
  public var targetProductOrderUuid: String
}

/// OutputRemoveProduct is the typed data model for the output_remove_product entity.
public struct OutputRemoveProduct {
  public var packageUuid: String
  public var productUuiD: [Value]
  public var responseCode: Int
  public var responseMessage: String
}

/// OutputRemoveProductCreateData is the typed request payload for OutputRemoveProduct.create.
public struct OutputRemoveProductCreateData {
  public var packageUuid: String
  public var productUuiD: [Value]
  public var responseCode: Int
  public var responseMessage: String
}

/// OutputStart is the typed data model for the output_start entity.
public struct OutputStart {
  public var id: String?
  public var responseCode: Int
  public var responseMessage: String
}

/// OutputStartCreateData is the typed request payload for OutputStart.create.
public struct OutputStartCreateData {
  public var id: String?
  public var responseCode: Int
  public var responseMessage: String
}

/// OutputStatus is the typed data model for the output_status entity.
public struct OutputStatus {
  public var percentage: Int?
  public var responseCode: Int
  public var responseMessage: String
  public var status: String?
}

/// OutputStatusLoadMatch is the typed request payload for OutputStatus.load.
public struct OutputStatusLoadMatch {
  public var id: String
}

/// OutputUpdateProduct is the typed data model for the output_update_product entity.
public struct OutputUpdateProduct {
  public var allowMultipleOrder: Bool?
  public var appFormName: String?
  public var contractNeeded: Bool?
  public var credentialsNeeded: Bool?
  public var descriptionKey: String?
  public var nameKey: String?
  public var prescreeningAllowed: Bool?
  public var productName: String?
  public var productStatus: String?
  public var productUuid: String
  public var responseCode: Int
  public var responseMessage: String
  public var vendorName: String?
}

/// OutputUpdateProductCreateData is the typed request payload for OutputUpdateProduct.create.
public struct OutputUpdateProductCreateData {
  public var allowMultipleOrder: Bool?
  public var appFormName: String?
  public var contractNeeded: Bool?
  public var credentialsNeeded: Bool?
  public var descriptionKey: String?
  public var nameKey: String?
  public var prescreeningAllowed: Bool?
  public var productName: String?
  public var productStatus: String?
  public var productUuid: String
  public var responseCode: Int
  public var responseMessage: String
  public var vendorName: String?
}

