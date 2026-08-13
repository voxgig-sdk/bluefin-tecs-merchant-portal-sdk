package voxgig.bluefintecsmerchantportalsdk.core

// Typed reference models for the BluefinTecsMerchantPortal SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These case classes are documentation/DX reference shapes ONLY. The SDK ops
// take and return the loose object model (java.util.Map[String, Object] /
// Object) at runtime, so these types are not wired into the op signatures —
// use them to describe a payload before converting it to a map. Every
// component is a boxed (nullable) type, so an optional (req:false) key needs
// no distinct rendering.

object BluefinTecsMerchantPortalTypes {

  final case class MerchantPortalApiController(account_number: java.lang.Long, additional_data: java.util.Map[String, Object], business_reg_number: String, city: String, corporateuuid: String, country: String, currency: String, merchant_category_code: java.lang.Long, merchant_email: String, merchant_name: String, merchant_phone_number: String, packageid: String, packageorderuuid: String, password: String, productid: String, productid_acquirer: String, reason_deactivation: String, reason_reactivation: String, sorting_code: java.lang.Long, state: String, street: String, terminal_country_code: String, terminal_language_code: String, terminal_location: String, terminal_serial_number: String, terminalid: java.lang.Long, terminalid_acquirer: String, user_email: String, user_phone_number: String, username: String, vu_nummer: String, web_shop_url: String, zipcode: String)

  final case class MerchantPortalApiControllerCreateData(account_number: java.lang.Long, additional_data: java.util.Map[String, Object], business_reg_number: String, city: String, corporateuuid: String, country: String, currency: String, merchant_category_code: java.lang.Long, merchant_email: String, merchant_name: String, merchant_phone_number: String, packageid: String, packageorderuuid: String, password: String, productid: String, productid_acquirer: String, reason_deactivation: String, reason_reactivation: String, sorting_code: java.lang.Long, state: String, street: String, terminal_country_code: String, terminal_language_code: String, terminal_location: String, terminal_serial_number: String, terminalid: java.lang.Long, terminalid_acquirer: String, user_email: String, user_phone_number: String, username: String, vu_nummer: String, web_shop_url: String, zipcode: String)

  final case class MerchantPortalCommonController()

  final case class MerchantPortalCommonControllerLoadMatch()

  final case class MerchantPortalPamContractController(language: String, productOrderUUID: String)

  final case class MerchantPortalPamContractControllerCreateData(language: String, productOrderUUID: String)

  final case class MerchantPortalPamDocumentController(appFormFieldDescUUID: String, packageOrderUUID: String, productOrderUUID: String)

  final case class MerchantPortalPamDocumentControllerCreateData(appFormFieldDescUUID: String, packageOrderUUID: String, productOrderUUID: String)

  final case class MerchantPortalPamFormController(appFormFieldsDescUUID: String, filter: java.util.Map[String, Object], language: String, packageOrder: java.util.Map[String, Object], packageOrderUUID: String, packageUUID: String, productOrderUUID: String, productOrders: java.util.List[Object], reasonOfReopening: String)

  final case class MerchantPortalPamFormControllerCreateData(appFormFieldsDescUUID: String, filter: java.util.Map[String, Object], language: String, packageOrder: java.util.Map[String, Object], packageOrderUUID: String, packageUUID: String, productOrderUUID: String, productOrders: java.util.List[Object], reasonOfReopening: String)

  final case class MerchantPortalPamMandatorController(clientSecret: String, mandatorName: String, notificationEmail: String, packageUUID: String)

  final case class MerchantPortalPamMandatorControllerCreateData(clientSecret: String, mandatorName: String, notificationEmail: String, packageUUID: String)

  final case class MerchantPortalPamMerchantController(additional_data: java.util.Map[String, Object], businessRegistrationNumber: String, city: String, companyName: String, corporateUUID: String, country: String, currency: String, email: String, language: String, login: String, mandator: String, merchantContractNumber: String, merchantName: String, merchant_category_code: String, packageUUID: String, packageorderuuid: String, phoneNumber: String, postalCode: String, productid_acquirer: String, region: String, registrationNumber: String, signature: String, street: String, terminalIds: java.util.List[Object], terminalid_acquirer: String, vu_nummer: String)

  final case class MerchantPortalPamMerchantControllerCreateData(additional_data: java.util.Map[String, Object], businessRegistrationNumber: String, city: String, companyName: String, corporateUUID: String, country: String, currency: String, email: String, language: String, login: String, mandator: String, merchantContractNumber: String, merchantName: String, merchant_category_code: String, packageUUID: String, packageorderuuid: String, phoneNumber: String, postalCode: String, productid_acquirer: String, region: String, registrationNumber: String, signature: String, street: String, terminalIds: java.util.List[Object], terminalid_acquirer: String, vu_nummer: String)

  final case class MerchantPortalPamPackageController(consumerUUID: String, corporateUUID: String, country: String, descriptionKey: String, filter: java.util.Map[String, Object], language: String, nameKey: String, packageStatus: String, packageUUID: String, pagination: java.util.Map[String, Object], sorting: java.util.Map[String, Object])

  final case class MerchantPortalPamPackageControllerCreateData(consumerUUID: String, corporateUUID: String, country: String, descriptionKey: String, filter: java.util.Map[String, Object], language: String, nameKey: String, packageStatus: String, packageUUID: String, pagination: java.util.Map[String, Object], sorting: java.util.Map[String, Object])

  final case class MerchantPortalPamProductController(consumerUUID: String, filter: java.util.Map[String, Object], language: String, merchantID: String, packageOrderUUID: String, pagination: java.util.Map[String, Object], productOrderUUID: String, productUUID: String, reason_decline: String, sorting: java.util.Map[String, Object])

  final case class MerchantPortalPamProductControllerCreateData(consumerUUID: String, filter: java.util.Map[String, Object], language: String, merchantID: String, packageOrderUUID: String, pagination: java.util.Map[String, Object], productOrderUUID: String, productUUID: String, reason_decline: String, sorting: java.util.Map[String, Object])

  final case class OutputAddProduct(packageUUID: String, productUUIDs: java.util.List[Object], responseCode: java.lang.Long, responseMessage: String)

  final case class OutputAddProductCreateData(packageUUID: String, productUUIDs: java.util.List[Object], responseCode: java.lang.Long, responseMessage: String)

  final case class OutputCreateProduct(acquirerId: String, allowMultipleOrders: java.lang.Boolean, appFormTemplateName: String, contractNeeded: java.lang.Boolean, credentialsNeeded: java.lang.Boolean, descriptionKey: String, nameKey: String, prescreeningAllowed: java.lang.Boolean, productName: String, responseCode: java.lang.Long, responseMessage: String, terminalTemplateName: String, vendorName: String, xmlTemplateFile: String)

  final case class OutputCreateProductCreateData(acquirerId: String, allowMultipleOrders: java.lang.Boolean, appFormTemplateName: String, contractNeeded: java.lang.Boolean, credentialsNeeded: java.lang.Boolean, descriptionKey: String, nameKey: String, prescreeningAllowed: java.lang.Boolean, productName: String, responseCode: java.lang.Long, responseMessage: String, terminalTemplateName: String, vendorName: String, xmlTemplateFile: String)

  final case class OutputDetail(batch: java.util.Map[String, Object], lines: java.util.Map[String, Object], progress: java.util.Map[String, Object])

  final case class OutputDetailLoadMatch(id: String)

  final case class OutputList(items: java.util.List[Object], pagination: java.util.Map[String, Object], responseCode: java.lang.Long, responseMessage: String, sorting: java.util.Map[String, Object])

  final case class OutputListCreateData(items: java.util.List[Object], pagination: java.util.Map[String, Object], responseCode: java.lang.Long, responseMessage: String, sorting: java.util.Map[String, Object])

  final case class OutputMessage(responseCode: java.lang.Long, responseMessage: String)

  final case class OutputMessageLoadMatch(id: String)

  final case class OutputMoveTid(productOrderUUIDs: java.util.List[Object], responseCode: java.lang.Long, responseMessage: String, targetPackageOrderUUID: String, targetProductOrderUUID: String)

  final case class OutputMoveTidCreateData(productOrderUUIDs: java.util.List[Object], responseCode: java.lang.Long, responseMessage: String, targetPackageOrderUUID: String, targetProductOrderUUID: String)

  final case class OutputRemoveProduct(packageUUID: String, productUUIDs: java.util.List[Object], responseCode: java.lang.Long, responseMessage: String)

  final case class OutputRemoveProductCreateData(packageUUID: String, productUUIDs: java.util.List[Object], responseCode: java.lang.Long, responseMessage: String)

  final case class OutputStart(id: String, responseCode: java.lang.Long, responseMessage: String)

  final case class OutputStartCreateData(id: String, responseCode: java.lang.Long, responseMessage: String)

  final case class OutputStatus(percentage: java.lang.Long, responseCode: java.lang.Long, responseMessage: String, status: String)

  final case class OutputStatusLoadMatch(id: String)

  final case class OutputUpdateProduct(allowMultipleOrders: java.lang.Boolean, appFormName: String, contractNeeded: java.lang.Boolean, credentialsNeeded: java.lang.Boolean, descriptionKey: String, nameKey: String, prescreeningAllowed: java.lang.Boolean, productName: String, productStatus: String, productUUID: String, responseCode: java.lang.Long, responseMessage: String, vendorName: String)

  final case class OutputUpdateProductCreateData(allowMultipleOrders: java.lang.Boolean, appFormName: String, contractNeeded: java.lang.Boolean, credentialsNeeded: java.lang.Boolean, descriptionKey: String, nameKey: String, prescreeningAllowed: java.lang.Boolean, productName: String, productStatus: String, productUUID: String, responseCode: java.lang.Long, responseMessage: String, vendorName: String)

}
