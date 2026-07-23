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

  data class MerchantPortalPamContractController(val language: String?, val product_order_uuid: String?)

  data class MerchantPortalPamContractControllerCreateData(val language: String?, val product_order_uuid: String?)

  data class MerchantPortalPamDocumentController(val app_form_field_desc_uuid: String?, val package_order_uuid: String?, val product_order_uuid: String?)

  data class MerchantPortalPamDocumentControllerCreateData(val app_form_field_desc_uuid: String?, val package_order_uuid: String?, val product_order_uuid: String?)

  data class MerchantPortalPamFormController(val app_form_fields_desc_uuid: String?, val filter: Map<String, Any?>?, val language: String?, val package_order: Map<String, Any?>?, val package_order_uuid: String?, val package_uuid: String?, val product_order: List<Any?>?, val product_order_uuid: String?, val reason_of_reopening: String?)

  data class MerchantPortalPamFormControllerCreateData(val app_form_fields_desc_uuid: String?, val filter: Map<String, Any?>?, val language: String?, val package_order: Map<String, Any?>?, val package_order_uuid: String?, val package_uuid: String?, val product_order: List<Any?>?, val product_order_uuid: String?, val reason_of_reopening: String?)

  data class MerchantPortalPamMandatorController(val client_secret: String?, val mandator_name: String?, val notification_email: String?, val package_uuid: String?)

  data class MerchantPortalPamMandatorControllerCreateData(val client_secret: String?, val mandator_name: String?, val notification_email: String?, val package_uuid: String?)

  data class MerchantPortalPamMerchantController(val additional_data: Map<String, Any?>?, val business_registration_number: String?, val city: String?, val company_name: String?, val corporate_uuid: String?, val country: String?, val currency: String?, val email: String?, val language: String?, val login: String?, val mandator: String?, val merchant_category_code: String?, val merchant_contract_number: String?, val merchant_name: String?, val package_uuid: String?, val packageorderuuid: String?, val phone_number: String?, val postal_code: String?, val productid_acquirer: String?, val region: String?, val registration_number: String?, val signature: String?, val street: String?, val terminal_id: List<Any?>?, val terminalid_acquirer: String?, val vu_nummer: String?)

  data class MerchantPortalPamMerchantControllerCreateData(val additional_data: Map<String, Any?>?, val business_registration_number: String?, val city: String?, val company_name: String?, val corporate_uuid: String?, val country: String?, val currency: String?, val email: String?, val language: String?, val login: String?, val mandator: String?, val merchant_category_code: String?, val merchant_contract_number: String?, val merchant_name: String?, val package_uuid: String?, val packageorderuuid: String?, val phone_number: String?, val postal_code: String?, val productid_acquirer: String?, val region: String?, val registration_number: String?, val signature: String?, val street: String?, val terminal_id: List<Any?>?, val terminalid_acquirer: String?, val vu_nummer: String?)

  data class MerchantPortalPamPackageController(val consumer_uuid: String?, val corporate_uuid: String?, val country: String?, val description_key: String?, val filter: Map<String, Any?>?, val language: String?, val name_key: String?, val package_status: String?, val package_uuid: String?, val pagination: Map<String, Any?>?, val sorting: Map<String, Any?>?)

  data class MerchantPortalPamPackageControllerCreateData(val consumer_uuid: String?, val corporate_uuid: String?, val country: String?, val description_key: String?, val filter: Map<String, Any?>?, val language: String?, val name_key: String?, val package_status: String?, val package_uuid: String?, val pagination: Map<String, Any?>?, val sorting: Map<String, Any?>?)

  data class MerchantPortalPamProductController(val consumer_uuid: String?, val filter: Map<String, Any?>?, val language: String?, val merchant_id: String?, val package_order_uuid: String?, val pagination: Map<String, Any?>?, val product_order_uuid: String?, val product_uuid: String?, val reason_decline: String?, val sorting: Map<String, Any?>?)

  data class MerchantPortalPamProductControllerCreateData(val consumer_uuid: String?, val filter: Map<String, Any?>?, val language: String?, val merchant_id: String?, val package_order_uuid: String?, val pagination: Map<String, Any?>?, val product_order_uuid: String?, val product_uuid: String?, val reason_decline: String?, val sorting: Map<String, Any?>?)

  data class OutputAddProduct(val package_uuid: String?, val product_uui_d: List<Any?>?, val response_code: Long?, val response_message: String?)

  data class OutputAddProductCreateData(val package_uuid: String?, val product_uui_d: List<Any?>?, val response_code: Long?, val response_message: String?)

  data class OutputCreateProduct(val acquirer_id: String?, val allow_multiple_order: Boolean?, val app_form_template_name: String?, val contract_needed: Boolean?, val credentials_needed: Boolean?, val description_key: String?, val name_key: String?, val prescreening_allowed: Boolean?, val product_name: String?, val response_code: Long?, val response_message: String?, val terminal_template_name: String?, val vendor_name: String?, val xml_template_file: String?)

  data class OutputCreateProductCreateData(val acquirer_id: String?, val allow_multiple_order: Boolean?, val app_form_template_name: String?, val contract_needed: Boolean?, val credentials_needed: Boolean?, val description_key: String?, val name_key: String?, val prescreening_allowed: Boolean?, val product_name: String?, val response_code: Long?, val response_message: String?, val terminal_template_name: String?, val vendor_name: String?, val xml_template_file: String?)

  data class OutputDetail(val detail: Map<String, Any?>?, val response_code: Long?, val response_message: String?)

  data class OutputDetailLoadMatch(val id: String?)

  data class OutputList(val item: List<Any?>?, val pagination: Map<String, Any?>?, val response_code: Long?, val response_message: String?, val sorting: Map<String, Any?>?)

  data class OutputListCreateData(val item: List<Any?>?, val pagination: Map<String, Any?>?, val response_code: Long?, val response_message: String?, val sorting: Map<String, Any?>?)

  data class OutputMessage(val response_code: Long?, val response_message: String?)

  data class OutputMessageLoadMatch(val id: String?)

  data class OutputMoveTid(val product_order_uui_d: List<Any?>?, val response_code: Long?, val response_message: String?, val target_package_order_uuid: String?, val target_product_order_uuid: String?)

  data class OutputMoveTidCreateData(val product_order_uui_d: List<Any?>?, val response_code: Long?, val response_message: String?, val target_package_order_uuid: String?, val target_product_order_uuid: String?)

  data class OutputRemoveProduct(val package_uuid: String?, val product_uui_d: List<Any?>?, val response_code: Long?, val response_message: String?)

  data class OutputRemoveProductCreateData(val package_uuid: String?, val product_uui_d: List<Any?>?, val response_code: Long?, val response_message: String?)

  data class OutputStart(val id: String?, val response_code: Long?, val response_message: String?)

  data class OutputStartCreateData(val id: String?, val response_code: Long?, val response_message: String?)

  data class OutputStatus(val percentage: Long?, val response_code: Long?, val response_message: String?, val status: String?)

  data class OutputStatusLoadMatch(val id: String?)

  data class OutputUpdateProduct(val allow_multiple_order: Boolean?, val app_form_name: String?, val contract_needed: Boolean?, val credentials_needed: Boolean?, val description_key: String?, val name_key: String?, val prescreening_allowed: Boolean?, val product_name: String?, val product_status: String?, val product_uuid: String?, val response_code: Long?, val response_message: String?, val vendor_name: String?)

  data class OutputUpdateProductCreateData(val allow_multiple_order: Boolean?, val app_form_name: String?, val contract_needed: Boolean?, val credentials_needed: Boolean?, val description_key: String?, val name_key: String?, val prescreening_allowed: Boolean?, val product_name: String?, val product_status: String?, val product_uuid: String?, val response_code: Long?, val response_message: String?, val vendor_name: String?)

}
