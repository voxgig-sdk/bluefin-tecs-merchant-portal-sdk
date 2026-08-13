package voxgig.bluefintecsmerchantportalsdk.core

// Typed reference models for the BluefinTecsMerchantPortal SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These types are documentation/DX reference shapes ONLY. The SDK ops take and
// return the loose object model (MutableMap<String, Any?> / Any?) at runtime,
// so these types are not wired into the op signatures — use them to describe a
// payload before converting it to a map. Every component is a nullable type, so
// an optional (req:false) key needs no distinct rendering.

@Suppress("unused")
object BluefinTecsMerchantPortalTypes {

  data class MerchantPortalApiController(val account_number: Long?, val additional_data: Map<String, Any?>?, val business_reg_number: String?, val city: String?, val corporateuuid: String?, val country: String?, val currency: String?, val merchant_category_code: Long?, val merchant_email: String?, val merchant_name: String?, val merchant_phone_number: String?, val packageid: String?, val packageorderuuid: String?, val password: String?, val productid: String?, val productid_acquirer: String?, val reason_deactivation: String?, val reason_reactivation: String?, val sorting_code: Long?, val state: String?, val street: String?, val terminal_country_code: String?, val terminal_language_code: String?, val terminal_location: String?, val terminal_serial_number: String?, val terminalid: Long?, val terminalid_acquirer: String?, val user_email: String?, val user_phone_number: String?, val username: String?, val vu_nummer: String?, val web_shop_url: String?, val zipcode: String?)

  data class MerchantPortalApiControllerCreateData(val account_number: Long?, val additional_data: Map<String, Any?>?, val business_reg_number: String?, val city: String?, val corporateuuid: String?, val country: String?, val currency: String?, val merchant_category_code: Long?, val merchant_email: String?, val merchant_name: String?, val merchant_phone_number: String?, val packageid: String?, val packageorderuuid: String?, val password: String?, val productid: String?, val productid_acquirer: String?, val reason_deactivation: String?, val reason_reactivation: String?, val sorting_code: Long?, val state: String?, val street: String?, val terminal_country_code: String?, val terminal_language_code: String?, val terminal_location: String?, val terminal_serial_number: String?, val terminalid: Long?, val terminalid_acquirer: String?, val user_email: String?, val user_phone_number: String?, val username: String?, val vu_nummer: String?, val web_shop_url: String?, val zipcode: String?)

  class MerchantPortalCommonController

  class MerchantPortalCommonControllerLoadMatch

  data class MerchantPortalPamContractController(val language: String?, val productOrderUUID: String?)

  data class MerchantPortalPamContractControllerCreateData(val language: String?, val productOrderUUID: String?)

  data class MerchantPortalPamDocumentController(val appFormFieldDescUUID: String?, val packageOrderUUID: String?, val productOrderUUID: String?)

  data class MerchantPortalPamDocumentControllerCreateData(val appFormFieldDescUUID: String?, val packageOrderUUID: String?, val productOrderUUID: String?)

  data class MerchantPortalPamFormController(val appFormFieldsDescUUID: String?, val filter: Map<String, Any?>?, val language: String?, val packageOrder: Map<String, Any?>?, val packageOrderUUID: String?, val packageUUID: String?, val productOrderUUID: String?, val productOrders: List<Any?>?, val reasonOfReopening: String?)

  data class MerchantPortalPamFormControllerCreateData(val appFormFieldsDescUUID: String?, val filter: Map<String, Any?>?, val language: String?, val packageOrder: Map<String, Any?>?, val packageOrderUUID: String?, val packageUUID: String?, val productOrderUUID: String?, val productOrders: List<Any?>?, val reasonOfReopening: String?)

  data class MerchantPortalPamMandatorController(val clientSecret: String?, val mandatorName: String?, val notificationEmail: String?, val packageUUID: String?)

  data class MerchantPortalPamMandatorControllerCreateData(val clientSecret: String?, val mandatorName: String?, val notificationEmail: String?, val packageUUID: String?)

  data class MerchantPortalPamMerchantController(val additional_data: Map<String, Any?>?, val businessRegistrationNumber: String?, val city: String?, val companyName: String?, val corporateUUID: String?, val country: String?, val currency: String?, val email: String?, val language: String?, val login: String?, val mandator: String?, val merchantContractNumber: String?, val merchantName: String?, val merchant_category_code: String?, val packageUUID: String?, val packageorderuuid: String?, val phoneNumber: String?, val postalCode: String?, val productid_acquirer: String?, val region: String?, val registrationNumber: String?, val signature: String?, val street: String?, val terminalIds: List<Any?>?, val terminalid_acquirer: String?, val vu_nummer: String?)

  data class MerchantPortalPamMerchantControllerCreateData(val additional_data: Map<String, Any?>?, val businessRegistrationNumber: String?, val city: String?, val companyName: String?, val corporateUUID: String?, val country: String?, val currency: String?, val email: String?, val language: String?, val login: String?, val mandator: String?, val merchantContractNumber: String?, val merchantName: String?, val merchant_category_code: String?, val packageUUID: String?, val packageorderuuid: String?, val phoneNumber: String?, val postalCode: String?, val productid_acquirer: String?, val region: String?, val registrationNumber: String?, val signature: String?, val street: String?, val terminalIds: List<Any?>?, val terminalid_acquirer: String?, val vu_nummer: String?)

  data class MerchantPortalPamPackageController(val consumerUUID: String?, val corporateUUID: String?, val country: String?, val descriptionKey: String?, val filter: Map<String, Any?>?, val language: String?, val nameKey: String?, val packageStatus: String?, val packageUUID: String?, val pagination: Map<String, Any?>?, val sorting: Map<String, Any?>?)

  data class MerchantPortalPamPackageControllerCreateData(val consumerUUID: String?, val corporateUUID: String?, val country: String?, val descriptionKey: String?, val filter: Map<String, Any?>?, val language: String?, val nameKey: String?, val packageStatus: String?, val packageUUID: String?, val pagination: Map<String, Any?>?, val sorting: Map<String, Any?>?)

  data class MerchantPortalPamProductController(val consumerUUID: String?, val filter: Map<String, Any?>?, val language: String?, val merchantID: String?, val packageOrderUUID: String?, val pagination: Map<String, Any?>?, val productOrderUUID: String?, val productUUID: String?, val reason_decline: String?, val sorting: Map<String, Any?>?)

  data class MerchantPortalPamProductControllerCreateData(val consumerUUID: String?, val filter: Map<String, Any?>?, val language: String?, val merchantID: String?, val packageOrderUUID: String?, val pagination: Map<String, Any?>?, val productOrderUUID: String?, val productUUID: String?, val reason_decline: String?, val sorting: Map<String, Any?>?)

  data class OutputAddProduct(val packageUUID: String?, val productUUIDs: List<Any?>?, val responseCode: Long?, val responseMessage: String?)

  data class OutputAddProductCreateData(val packageUUID: String?, val productUUIDs: List<Any?>?, val responseCode: Long?, val responseMessage: String?)

  data class OutputCreateProduct(val acquirerId: String?, val allowMultipleOrders: Boolean?, val appFormTemplateName: String?, val contractNeeded: Boolean?, val credentialsNeeded: Boolean?, val descriptionKey: String?, val nameKey: String?, val prescreeningAllowed: Boolean?, val productName: String?, val responseCode: Long?, val responseMessage: String?, val terminalTemplateName: String?, val vendorName: String?, val xmlTemplateFile: String?)

  data class OutputCreateProductCreateData(val acquirerId: String?, val allowMultipleOrders: Boolean?, val appFormTemplateName: String?, val contractNeeded: Boolean?, val credentialsNeeded: Boolean?, val descriptionKey: String?, val nameKey: String?, val prescreeningAllowed: Boolean?, val productName: String?, val responseCode: Long?, val responseMessage: String?, val terminalTemplateName: String?, val vendorName: String?, val xmlTemplateFile: String?)

  data class OutputDetail(val batch: Map<String, Any?>?, val lines: Map<String, Any?>?, val progress: Map<String, Any?>?)

  data class OutputDetailLoadMatch(val id: String?)

  data class OutputList(val items: List<Any?>?, val pagination: Map<String, Any?>?, val responseCode: Long?, val responseMessage: String?, val sorting: Map<String, Any?>?)

  data class OutputListCreateData(val items: List<Any?>?, val pagination: Map<String, Any?>?, val responseCode: Long?, val responseMessage: String?, val sorting: Map<String, Any?>?)

  data class OutputMessage(val responseCode: Long?, val responseMessage: String?)

  data class OutputMessageLoadMatch(val id: String?)

  data class OutputMoveTid(val productOrderUUIDs: List<Any?>?, val responseCode: Long?, val responseMessage: String?, val targetPackageOrderUUID: String?, val targetProductOrderUUID: String?)

  data class OutputMoveTidCreateData(val productOrderUUIDs: List<Any?>?, val responseCode: Long?, val responseMessage: String?, val targetPackageOrderUUID: String?, val targetProductOrderUUID: String?)

  data class OutputRemoveProduct(val packageUUID: String?, val productUUIDs: List<Any?>?, val responseCode: Long?, val responseMessage: String?)

  data class OutputRemoveProductCreateData(val packageUUID: String?, val productUUIDs: List<Any?>?, val responseCode: Long?, val responseMessage: String?)

  data class OutputStart(val id: String?, val responseCode: Long?, val responseMessage: String?)

  data class OutputStartCreateData(val id: String?, val responseCode: Long?, val responseMessage: String?)

  data class OutputStatus(val percentage: Long?, val responseCode: Long?, val responseMessage: String?, val status: String?)

  data class OutputStatusLoadMatch(val id: String?)

  data class OutputUpdateProduct(val allowMultipleOrders: Boolean?, val appFormName: String?, val contractNeeded: Boolean?, val credentialsNeeded: Boolean?, val descriptionKey: String?, val nameKey: String?, val prescreeningAllowed: Boolean?, val productName: String?, val productStatus: String?, val productUUID: String?, val responseCode: Long?, val responseMessage: String?, val vendorName: String?)

  data class OutputUpdateProductCreateData(val allowMultipleOrders: Boolean?, val appFormName: String?, val contractNeeded: Boolean?, val credentialsNeeded: Boolean?, val descriptionKey: String?, val nameKey: String?, val prescreeningAllowed: Boolean?, val productName: String?, val productStatus: String?, val productUUID: String?, val responseCode: Long?, val responseMessage: String?, val vendorName: String?)

}
