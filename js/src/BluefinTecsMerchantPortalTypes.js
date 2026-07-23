// Typed models for the BluefinTecsMerchantPortal SDK (JSDoc typedefs).
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
// edit by hand.

/**
 * @typedef {Object} MerchantPortalApiController
 * @property {number} [account_number]
 * @property {Object} [additional_data]
 * @property {string} business_reg_number
 * @property {string} city
 * @property {string} [corporateuuid]
 * @property {string} country
 * @property {string} currency
 * @property {number} merchant_category_code
 * @property {string} [merchant_email]
 * @property {string} merchant_name
 * @property {string} [merchant_phone_number]
 * @property {string} packageid
 * @property {string} packageorderuuid
 * @property {string} [password]
 * @property {string} [productid]
 * @property {string} [productid_acquirer]
 * @property {string} reason_deactivation
 * @property {string} reason_reactivation
 * @property {number} [sorting_code]
 * @property {string} [state]
 * @property {string} street
 * @property {string} terminal_country_code
 * @property {string} terminal_language_code
 * @property {string} terminal_location
 * @property {string} terminal_serial_number
 * @property {number} terminalid
 * @property {string} [terminalid_acquirer]
 * @property {string} [user_email]
 * @property {string} [user_phone_number]
 * @property {string} [username]
 * @property {string} vu_nummer
 * @property {string} [web_shop_url]
 * @property {string} zipcode
 */

/**
 * @typedef {Object} MerchantPortalApiControllerCreateData
 * @property {number} [account_number]
 * @property {Object} [additional_data]
 * @property {string} business_reg_number
 * @property {string} city
 * @property {string} [corporateuuid]
 * @property {string} country
 * @property {string} currency
 * @property {number} merchant_category_code
 * @property {string} [merchant_email]
 * @property {string} merchant_name
 * @property {string} [merchant_phone_number]
 * @property {string} packageid
 * @property {string} packageorderuuid
 * @property {string} [password]
 * @property {string} [productid]
 * @property {string} [productid_acquirer]
 * @property {string} reason_deactivation
 * @property {string} reason_reactivation
 * @property {number} [sorting_code]
 * @property {string} [state]
 * @property {string} street
 * @property {string} terminal_country_code
 * @property {string} terminal_language_code
 * @property {string} terminal_location
 * @property {string} terminal_serial_number
 * @property {number} terminalid
 * @property {string} [terminalid_acquirer]
 * @property {string} [user_email]
 * @property {string} [user_phone_number]
 * @property {string} [username]
 * @property {string} vu_nummer
 * @property {string} [web_shop_url]
 * @property {string} zipcode
 */

/**
 * @typedef {Object} MerchantPortalCommonController
 */

/**
 * @typedef {Object} MerchantPortalCommonControllerLoadMatch
 */

/**
 * @typedef {Object} MerchantPortalPamContractController
 * @property {string} language
 * @property {string} product_order_uuid
 */

/**
 * @typedef {Object} MerchantPortalPamContractControllerCreateData
 * @property {string} language
 * @property {string} product_order_uuid
 */

/**
 * @typedef {Object} MerchantPortalPamDocumentController
 * @property {string} app_form_field_desc_uuid
 * @property {string} [package_order_uuid]
 * @property {string} [product_order_uuid]
 */

/**
 * @typedef {Object} MerchantPortalPamDocumentControllerCreateData
 * @property {string} app_form_field_desc_uuid
 * @property {string} [package_order_uuid]
 * @property {string} [product_order_uuid]
 */

/**
 * @typedef {Object} MerchantPortalPamFormController
 * @property {string} app_form_fields_desc_uuid
 * @property {Object} [filter]
 * @property {string} language
 * @property {Object} [package_order]
 * @property {string} package_order_uuid
 * @property {string} [package_uuid]
 * @property {Array} [product_order]
 * @property {string} [product_order_uuid]
 * @property {string} reason_of_reopening
 */

/**
 * @typedef {Object} MerchantPortalPamFormControllerCreateData
 * @property {string} app_form_fields_desc_uuid
 * @property {Object} [filter]
 * @property {string} language
 * @property {Object} [package_order]
 * @property {string} package_order_uuid
 * @property {string} [package_uuid]
 * @property {Array} [product_order]
 * @property {string} [product_order_uuid]
 * @property {string} reason_of_reopening
 */

/**
 * @typedef {Object} MerchantPortalPamMandatorController
 * @property {string} [client_secret]
 * @property {string} mandator_name
 * @property {string} [notification_email]
 * @property {string} package_uuid
 */

/**
 * @typedef {Object} MerchantPortalPamMandatorControllerCreateData
 * @property {string} [client_secret]
 * @property {string} mandator_name
 * @property {string} [notification_email]
 * @property {string} package_uuid
 */

/**
 * @typedef {Object} MerchantPortalPamMerchantController
 * @property {Object} [additional_data]
 * @property {string} business_registration_number
 * @property {string} [city]
 * @property {string} company_name
 * @property {string} corporate_uuid
 * @property {string} [country]
 * @property {string} currency
 * @property {string} email
 * @property {string} language
 * @property {string} login
 * @property {string} mandator
 * @property {string} [merchant_category_code]
 * @property {string} merchant_contract_number
 * @property {string} [merchant_name]
 * @property {string} [package_uuid]
 * @property {string} packageorderuuid
 * @property {string} phone_number
 * @property {string} [postal_code]
 * @property {string} productid_acquirer
 * @property {string} [region]
 * @property {string} [registration_number]
 * @property {string} [signature]
 * @property {string} [street]
 * @property {Array} [terminal_id]
 * @property {string} [terminalid_acquirer]
 * @property {string} vu_nummer
 */

/**
 * @typedef {Object} MerchantPortalPamMerchantControllerCreateData
 * @property {Object} [additional_data]
 * @property {string} business_registration_number
 * @property {string} [city]
 * @property {string} company_name
 * @property {string} corporate_uuid
 * @property {string} [country]
 * @property {string} currency
 * @property {string} email
 * @property {string} language
 * @property {string} login
 * @property {string} mandator
 * @property {string} [merchant_category_code]
 * @property {string} merchant_contract_number
 * @property {string} [merchant_name]
 * @property {string} [package_uuid]
 * @property {string} packageorderuuid
 * @property {string} phone_number
 * @property {string} [postal_code]
 * @property {string} productid_acquirer
 * @property {string} [region]
 * @property {string} [registration_number]
 * @property {string} [signature]
 * @property {string} [street]
 * @property {Array} [terminal_id]
 * @property {string} [terminalid_acquirer]
 * @property {string} vu_nummer
 */

/**
 * @typedef {Object} MerchantPortalPamPackageController
 * @property {string} [consumer_uuid]
 * @property {string} [corporate_uuid]
 * @property {string} [country]
 * @property {string} [description_key]
 * @property {Object} [filter]
 * @property {string} language
 * @property {string} [name_key]
 * @property {string} [package_status]
 * @property {string} package_uuid
 * @property {Object} [pagination]
 * @property {Object} [sorting]
 */

/**
 * @typedef {Object} MerchantPortalPamPackageControllerCreateData
 * @property {string} [consumer_uuid]
 * @property {string} [corporate_uuid]
 * @property {string} [country]
 * @property {string} [description_key]
 * @property {Object} [filter]
 * @property {string} language
 * @property {string} [name_key]
 * @property {string} [package_status]
 * @property {string} package_uuid
 * @property {Object} [pagination]
 * @property {Object} [sorting]
 */

/**
 * @typedef {Object} MerchantPortalPamProductController
 * @property {string} [consumer_uuid]
 * @property {Object} [filter]
 * @property {string} [language]
 * @property {string} [merchant_id]
 * @property {string} package_order_uuid
 * @property {Object} [pagination]
 * @property {string} product_order_uuid
 * @property {string} product_uuid
 * @property {string} reason_decline
 * @property {Object} [sorting]
 */

/**
 * @typedef {Object} MerchantPortalPamProductControllerCreateData
 * @property {string} [consumer_uuid]
 * @property {Object} [filter]
 * @property {string} [language]
 * @property {string} [merchant_id]
 * @property {string} package_order_uuid
 * @property {Object} [pagination]
 * @property {string} product_order_uuid
 * @property {string} product_uuid
 * @property {string} reason_decline
 * @property {Object} [sorting]
 */

/**
 * @typedef {Object} OutputAddProduct
 * @property {string} package_uuid
 * @property {Array} product_uui_d
 * @property {number} response_code
 * @property {string} response_message
 */

/**
 * @typedef {Object} OutputAddProductCreateData
 * @property {string} package_uuid
 * @property {Array} product_uui_d
 * @property {number} response_code
 * @property {string} response_message
 */

/**
 * @typedef {Object} OutputCreateProduct
 * @property {string} [acquirer_id]
 * @property {boolean} allow_multiple_order
 * @property {string} app_form_template_name
 * @property {boolean} contract_needed
 * @property {boolean} [credentials_needed]
 * @property {string} description_key
 * @property {string} name_key
 * @property {boolean} prescreening_allowed
 * @property {string} product_name
 * @property {number} response_code
 * @property {string} response_message
 * @property {string} terminal_template_name
 * @property {string} vendor_name
 * @property {string} xml_template_file
 */

/**
 * @typedef {Object} OutputCreateProductCreateData
 * @property {string} [acquirer_id]
 * @property {boolean} allow_multiple_order
 * @property {string} app_form_template_name
 * @property {boolean} contract_needed
 * @property {boolean} [credentials_needed]
 * @property {string} description_key
 * @property {string} name_key
 * @property {boolean} prescreening_allowed
 * @property {string} product_name
 * @property {number} response_code
 * @property {string} response_message
 * @property {string} terminal_template_name
 * @property {string} vendor_name
 * @property {string} xml_template_file
 */

/**
 * @typedef {Object} OutputDetail
 * @property {Object} [detail]
 * @property {number} response_code
 * @property {string} response_message
 */

/**
 * @typedef {Object} OutputDetailLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} OutputList
 * @property {Array} [item]
 * @property {Object} pagination
 * @property {number} response_code
 * @property {string} response_message
 * @property {Object} [sorting]
 */

/**
 * @typedef {Object} OutputListCreateData
 * @property {Array} [item]
 * @property {Object} pagination
 * @property {number} response_code
 * @property {string} response_message
 * @property {Object} [sorting]
 */

/**
 * @typedef {Object} OutputMessage
 * @property {number} response_code
 * @property {string} response_message
 */

/**
 * @typedef {Object} OutputMessageLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} OutputMoveTid
 * @property {Array} product_order_uui_d
 * @property {number} response_code
 * @property {string} response_message
 * @property {string} target_package_order_uuid
 * @property {string} target_product_order_uuid
 */

/**
 * @typedef {Object} OutputMoveTidCreateData
 * @property {Array} product_order_uui_d
 * @property {number} response_code
 * @property {string} response_message
 * @property {string} target_package_order_uuid
 * @property {string} target_product_order_uuid
 */

/**
 * @typedef {Object} OutputRemoveProduct
 * @property {string} package_uuid
 * @property {Array} product_uui_d
 * @property {number} response_code
 * @property {string} response_message
 */

/**
 * @typedef {Object} OutputRemoveProductCreateData
 * @property {string} package_uuid
 * @property {Array} product_uui_d
 * @property {number} response_code
 * @property {string} response_message
 */

/**
 * @typedef {Object} OutputStart
 * @property {string} [id]
 * @property {number} response_code
 * @property {string} response_message
 */

/**
 * @typedef {Object} OutputStartCreateData
 * @property {string} [id]
 * @property {number} response_code
 * @property {string} response_message
 */

/**
 * @typedef {Object} OutputStatus
 * @property {number} [percentage]
 * @property {number} response_code
 * @property {string} response_message
 * @property {string} [status]
 */

/**
 * @typedef {Object} OutputStatusLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} OutputUpdateProduct
 * @property {boolean} [allow_multiple_order]
 * @property {string} [app_form_name]
 * @property {boolean} [contract_needed]
 * @property {boolean} [credentials_needed]
 * @property {string} [description_key]
 * @property {string} [name_key]
 * @property {boolean} [prescreening_allowed]
 * @property {string} [product_name]
 * @property {string} [product_status]
 * @property {string} product_uuid
 * @property {number} response_code
 * @property {string} response_message
 * @property {string} [vendor_name]
 */

/**
 * @typedef {Object} OutputUpdateProductCreateData
 * @property {boolean} [allow_multiple_order]
 * @property {string} [app_form_name]
 * @property {boolean} [contract_needed]
 * @property {boolean} [credentials_needed]
 * @property {string} [description_key]
 * @property {string} [name_key]
 * @property {boolean} [prescreening_allowed]
 * @property {string} [product_name]
 * @property {string} [product_status]
 * @property {string} product_uuid
 * @property {number} response_code
 * @property {string} response_message
 * @property {string} [vendor_name]
 */

