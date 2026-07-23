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

  final case class MerchantPortalPamContractController(language: String, product_order_uuid: String)

  final case class MerchantPortalPamContractControllerCreateData(language: String, product_order_uuid: String)

  final case class MerchantPortalPamDocumentController(app_form_field_desc_uuid: String, package_order_uuid: String, product_order_uuid: String)

  final case class MerchantPortalPamDocumentControllerCreateData(app_form_field_desc_uuid: String, package_order_uuid: String, product_order_uuid: String)

  final case class MerchantPortalPamFormController(app_form_fields_desc_uuid: String, filter: java.util.Map[String, Object], language: String, package_order: java.util.Map[String, Object], package_order_uuid: String, package_uuid: String, product_order: java.util.List[Object], product_order_uuid: String, reason_of_reopening: String)

  final case class MerchantPortalPamFormControllerCreateData(app_form_fields_desc_uuid: String, filter: java.util.Map[String, Object], language: String, package_order: java.util.Map[String, Object], package_order_uuid: String, package_uuid: String, product_order: java.util.List[Object], product_order_uuid: String, reason_of_reopening: String)

  final case class MerchantPortalPamMandatorController(client_secret: String, mandator_name: String, notification_email: String, package_uuid: String)

  final case class MerchantPortalPamMandatorControllerCreateData(client_secret: String, mandator_name: String, notification_email: String, package_uuid: String)

  final case class MerchantPortalPamMerchantController(additional_data: java.util.Map[String, Object], business_registration_number: String, city: String, company_name: String, corporate_uuid: String, country: String, currency: String, email: String, language: String, login: String, mandator: String, merchant_category_code: String, merchant_contract_number: String, merchant_name: String, package_uuid: String, packageorderuuid: String, phone_number: String, postal_code: String, productid_acquirer: String, region: String, registration_number: String, signature: String, street: String, terminal_id: java.util.List[Object], terminalid_acquirer: String, vu_nummer: String)

  final case class MerchantPortalPamMerchantControllerCreateData(additional_data: java.util.Map[String, Object], business_registration_number: String, city: String, company_name: String, corporate_uuid: String, country: String, currency: String, email: String, language: String, login: String, mandator: String, merchant_category_code: String, merchant_contract_number: String, merchant_name: String, package_uuid: String, packageorderuuid: String, phone_number: String, postal_code: String, productid_acquirer: String, region: String, registration_number: String, signature: String, street: String, terminal_id: java.util.List[Object], terminalid_acquirer: String, vu_nummer: String)

  final case class MerchantPortalPamPackageController(consumer_uuid: String, corporate_uuid: String, country: String, description_key: String, filter: java.util.Map[String, Object], language: String, name_key: String, package_status: String, package_uuid: String, pagination: java.util.Map[String, Object], sorting: java.util.Map[String, Object])

  final case class MerchantPortalPamPackageControllerCreateData(consumer_uuid: String, corporate_uuid: String, country: String, description_key: String, filter: java.util.Map[String, Object], language: String, name_key: String, package_status: String, package_uuid: String, pagination: java.util.Map[String, Object], sorting: java.util.Map[String, Object])

  final case class MerchantPortalPamProductController(consumer_uuid: String, filter: java.util.Map[String, Object], language: String, merchant_id: String, package_order_uuid: String, pagination: java.util.Map[String, Object], product_order_uuid: String, product_uuid: String, reason_decline: String, sorting: java.util.Map[String, Object])

  final case class MerchantPortalPamProductControllerCreateData(consumer_uuid: String, filter: java.util.Map[String, Object], language: String, merchant_id: String, package_order_uuid: String, pagination: java.util.Map[String, Object], product_order_uuid: String, product_uuid: String, reason_decline: String, sorting: java.util.Map[String, Object])

  final case class OutputAddProduct(package_uuid: String, product_uui_d: java.util.List[Object], response_code: java.lang.Long, response_message: String)

  final case class OutputAddProductCreateData(package_uuid: String, product_uui_d: java.util.List[Object], response_code: java.lang.Long, response_message: String)

  final case class OutputCreateProduct(acquirer_id: String, allow_multiple_order: java.lang.Boolean, app_form_template_name: String, contract_needed: java.lang.Boolean, credentials_needed: java.lang.Boolean, description_key: String, name_key: String, prescreening_allowed: java.lang.Boolean, product_name: String, response_code: java.lang.Long, response_message: String, terminal_template_name: String, vendor_name: String, xml_template_file: String)

  final case class OutputCreateProductCreateData(acquirer_id: String, allow_multiple_order: java.lang.Boolean, app_form_template_name: String, contract_needed: java.lang.Boolean, credentials_needed: java.lang.Boolean, description_key: String, name_key: String, prescreening_allowed: java.lang.Boolean, product_name: String, response_code: java.lang.Long, response_message: String, terminal_template_name: String, vendor_name: String, xml_template_file: String)

  final case class OutputDetail(detail: java.util.Map[String, Object], response_code: java.lang.Long, response_message: String)

  final case class OutputDetailLoadMatch(id: String)

  final case class OutputList(item: java.util.List[Object], pagination: java.util.Map[String, Object], response_code: java.lang.Long, response_message: String, sorting: java.util.Map[String, Object])

  final case class OutputListCreateData(item: java.util.List[Object], pagination: java.util.Map[String, Object], response_code: java.lang.Long, response_message: String, sorting: java.util.Map[String, Object])

  final case class OutputMessage(response_code: java.lang.Long, response_message: String)

  final case class OutputMessageLoadMatch(id: String)

  final case class OutputMoveTid(product_order_uui_d: java.util.List[Object], response_code: java.lang.Long, response_message: String, target_package_order_uuid: String, target_product_order_uuid: String)

  final case class OutputMoveTidCreateData(product_order_uui_d: java.util.List[Object], response_code: java.lang.Long, response_message: String, target_package_order_uuid: String, target_product_order_uuid: String)

  final case class OutputRemoveProduct(package_uuid: String, product_uui_d: java.util.List[Object], response_code: java.lang.Long, response_message: String)

  final case class OutputRemoveProductCreateData(package_uuid: String, product_uui_d: java.util.List[Object], response_code: java.lang.Long, response_message: String)

  final case class OutputStart(id: String, response_code: java.lang.Long, response_message: String)

  final case class OutputStartCreateData(id: String, response_code: java.lang.Long, response_message: String)

  final case class OutputStatus(percentage: java.lang.Long, response_code: java.lang.Long, response_message: String, status: String)

  final case class OutputStatusLoadMatch(id: String)

  final case class OutputUpdateProduct(allow_multiple_order: java.lang.Boolean, app_form_name: String, contract_needed: java.lang.Boolean, credentials_needed: java.lang.Boolean, description_key: String, name_key: String, prescreening_allowed: java.lang.Boolean, product_name: String, product_status: String, product_uuid: String, response_code: java.lang.Long, response_message: String, vendor_name: String)

  final case class OutputUpdateProductCreateData(allow_multiple_order: java.lang.Boolean, app_form_name: String, contract_needed: java.lang.Boolean, credentials_needed: java.lang.Boolean, description_key: String, name_key: String, prescreening_allowed: java.lang.Boolean, product_name: String, product_status: String, product_uuid: String, response_code: java.lang.Long, response_message: String, vendor_name: String)

}
