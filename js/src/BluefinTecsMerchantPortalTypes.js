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
 * @property {string} productOrderUUID
 */

/**
 * @typedef {Object} MerchantPortalPamContractControllerCreateData
 * @property {string} language
 * @property {string} productOrderUUID
 */

/**
 * @typedef {Object} MerchantPortalPamDocumentController
 * @property {string} appFormFieldDescUUID
 * @property {string} [packageOrderUUID]
 * @property {string} [productOrderUUID]
 */

/**
 * @typedef {Object} MerchantPortalPamDocumentControllerCreateData
 * @property {string} appFormFieldDescUUID
 * @property {string} [packageOrderUUID]
 * @property {string} [productOrderUUID]
 */

/**
 * @typedef {Object} MerchantPortalPamFormController
 * @property {string} appFormFieldsDescUUID
 * @property {Object} [filter]
 * @property {string} language
 * @property {Object} [packageOrder]
 * @property {string} packageOrderUUID
 * @property {string} [packageUUID]
 * @property {string} [productOrderUUID]
 * @property {Array} [productOrders]
 * @property {string} reasonOfReopening
 */

/**
 * @typedef {Object} MerchantPortalPamFormControllerCreateData
 * @property {string} appFormFieldsDescUUID
 * @property {Object} [filter]
 * @property {string} language
 * @property {Object} [packageOrder]
 * @property {string} packageOrderUUID
 * @property {string} [packageUUID]
 * @property {string} [productOrderUUID]
 * @property {Array} [productOrders]
 * @property {string} reasonOfReopening
 */

/**
 * @typedef {Object} MerchantPortalPamMandatorController
 * @property {string} [clientSecret]
 * @property {string} mandatorName
 * @property {string} [notificationEmail]
 * @property {string} packageUUID
 */

/**
 * @typedef {Object} MerchantPortalPamMandatorControllerCreateData
 * @property {string} [clientSecret]
 * @property {string} mandatorName
 * @property {string} [notificationEmail]
 * @property {string} packageUUID
 */

/**
 * @typedef {Object} MerchantPortalPamMerchantController
 * @property {Object} [additional_data]
 * @property {string} businessRegistrationNumber
 * @property {string} [city]
 * @property {string} companyName
 * @property {string} corporateUUID
 * @property {string} [country]
 * @property {string} currency
 * @property {string} email
 * @property {string} language
 * @property {string} login
 * @property {string} mandator
 * @property {string} merchantContractNumber
 * @property {string} [merchantName]
 * @property {string} [merchant_category_code]
 * @property {string} [packageUUID]
 * @property {string} packageorderuuid
 * @property {string} phoneNumber
 * @property {string} [postalCode]
 * @property {string} productid_acquirer
 * @property {string} [region]
 * @property {string} [registrationNumber]
 * @property {string} [signature]
 * @property {string} [street]
 * @property {Array} [terminalIds]
 * @property {string} [terminalid_acquirer]
 * @property {string} vu_nummer
 */

/**
 * @typedef {Object} MerchantPortalPamMerchantControllerCreateData
 * @property {Object} [additional_data]
 * @property {string} businessRegistrationNumber
 * @property {string} [city]
 * @property {string} companyName
 * @property {string} corporateUUID
 * @property {string} [country]
 * @property {string} currency
 * @property {string} email
 * @property {string} language
 * @property {string} login
 * @property {string} mandator
 * @property {string} merchantContractNumber
 * @property {string} [merchantName]
 * @property {string} [merchant_category_code]
 * @property {string} [packageUUID]
 * @property {string} packageorderuuid
 * @property {string} phoneNumber
 * @property {string} [postalCode]
 * @property {string} productid_acquirer
 * @property {string} [region]
 * @property {string} [registrationNumber]
 * @property {string} [signature]
 * @property {string} [street]
 * @property {Array} [terminalIds]
 * @property {string} [terminalid_acquirer]
 * @property {string} vu_nummer
 */

/**
 * @typedef {Object} MerchantPortalPamPackageController
 * @property {string} [consumerUUID]
 * @property {string} [corporateUUID]
 * @property {string} [country]
 * @property {string} [descriptionKey]
 * @property {Object} [filter]
 * @property {string} language
 * @property {string} [nameKey]
 * @property {string} [packageStatus]
 * @property {string} packageUUID
 * @property {Object} [pagination]
 * @property {Object} [sorting]
 */

/**
 * @typedef {Object} MerchantPortalPamPackageControllerCreateData
 * @property {string} [consumerUUID]
 * @property {string} [corporateUUID]
 * @property {string} [country]
 * @property {string} [descriptionKey]
 * @property {Object} [filter]
 * @property {string} language
 * @property {string} [nameKey]
 * @property {string} [packageStatus]
 * @property {string} packageUUID
 * @property {Object} [pagination]
 * @property {Object} [sorting]
 */

/**
 * @typedef {Object} MerchantPortalPamProductController
 * @property {string} [consumerUUID]
 * @property {Object} [filter]
 * @property {string} [language]
 * @property {string} [merchantID]
 * @property {string} packageOrderUUID
 * @property {Object} [pagination]
 * @property {string} productOrderUUID
 * @property {string} productUUID
 * @property {string} reason_decline
 * @property {Object} [sorting]
 */

/**
 * @typedef {Object} MerchantPortalPamProductControllerCreateData
 * @property {string} [consumerUUID]
 * @property {Object} [filter]
 * @property {string} [language]
 * @property {string} [merchantID]
 * @property {string} packageOrderUUID
 * @property {Object} [pagination]
 * @property {string} productOrderUUID
 * @property {string} productUUID
 * @property {string} reason_decline
 * @property {Object} [sorting]
 */

/**
 * @typedef {Object} OutputAddProduct
 * @property {string} packageUUID
 * @property {Array} productUUIDs
 * @property {number} responseCode
 * @property {string} responseMessage
 */

/**
 * @typedef {Object} OutputAddProductCreateData
 * @property {string} packageUUID
 * @property {Array} productUUIDs
 * @property {number} responseCode
 * @property {string} responseMessage
 */

/**
 * @typedef {Object} OutputCreateProduct
 * @property {string} [acquirerId]
 * @property {boolean} allowMultipleOrders
 * @property {string} appFormTemplateName
 * @property {boolean} contractNeeded
 * @property {boolean} [credentialsNeeded]
 * @property {string} descriptionKey
 * @property {string} nameKey
 * @property {boolean} prescreeningAllowed
 * @property {string} productName
 * @property {number} responseCode
 * @property {string} responseMessage
 * @property {string} terminalTemplateName
 * @property {string} vendorName
 * @property {string} xmlTemplateFile
 */

/**
 * @typedef {Object} OutputCreateProductCreateData
 * @property {string} [acquirerId]
 * @property {boolean} allowMultipleOrders
 * @property {string} appFormTemplateName
 * @property {boolean} contractNeeded
 * @property {boolean} [credentialsNeeded]
 * @property {string} descriptionKey
 * @property {string} nameKey
 * @property {boolean} prescreeningAllowed
 * @property {string} productName
 * @property {number} responseCode
 * @property {string} responseMessage
 * @property {string} terminalTemplateName
 * @property {string} vendorName
 * @property {string} xmlTemplateFile
 */

/**
 * @typedef {Object} OutputDetail
 * @property {Object} [batch]
 * @property {Object} [lines]
 * @property {Object} [progress]
 */

/**
 * @typedef {Object} OutputDetailLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} OutputList
 * @property {Array} [items]
 * @property {Object} pagination
 * @property {number} responseCode
 * @property {string} responseMessage
 * @property {Object} [sorting]
 */

/**
 * @typedef {Object} OutputListCreateData
 * @property {Array} [items]
 * @property {Object} pagination
 * @property {number} responseCode
 * @property {string} responseMessage
 * @property {Object} [sorting]
 */

/**
 * @typedef {Object} OutputMessage
 * @property {number} responseCode
 * @property {string} responseMessage
 */

/**
 * @typedef {Object} OutputMessageLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} OutputMoveTid
 * @property {Array} productOrderUUIDs
 * @property {number} responseCode
 * @property {string} responseMessage
 * @property {string} targetPackageOrderUUID
 * @property {string} targetProductOrderUUID
 */

/**
 * @typedef {Object} OutputMoveTidCreateData
 * @property {Array} productOrderUUIDs
 * @property {number} responseCode
 * @property {string} responseMessage
 * @property {string} targetPackageOrderUUID
 * @property {string} targetProductOrderUUID
 */

/**
 * @typedef {Object} OutputRemoveProduct
 * @property {string} packageUUID
 * @property {Array} productUUIDs
 * @property {number} responseCode
 * @property {string} responseMessage
 */

/**
 * @typedef {Object} OutputRemoveProductCreateData
 * @property {string} packageUUID
 * @property {Array} productUUIDs
 * @property {number} responseCode
 * @property {string} responseMessage
 */

/**
 * @typedef {Object} OutputStart
 * @property {string} [id]
 * @property {number} responseCode
 * @property {string} responseMessage
 */

/**
 * @typedef {Object} OutputStartCreateData
 * @property {string} [id]
 * @property {number} responseCode
 * @property {string} responseMessage
 */

/**
 * @typedef {Object} OutputStatus
 * @property {number} [percentage]
 * @property {number} responseCode
 * @property {string} responseMessage
 * @property {string} [status]
 */

/**
 * @typedef {Object} OutputStatusLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} OutputUpdateProduct
 * @property {boolean} [allowMultipleOrders]
 * @property {string} [appFormName]
 * @property {boolean} [contractNeeded]
 * @property {boolean} [credentialsNeeded]
 * @property {string} [descriptionKey]
 * @property {string} [nameKey]
 * @property {boolean} [prescreeningAllowed]
 * @property {string} [productName]
 * @property {string} [productStatus]
 * @property {string} productUUID
 * @property {number} responseCode
 * @property {string} responseMessage
 * @property {string} [vendorName]
 */

/**
 * @typedef {Object} OutputUpdateProductCreateData
 * @property {boolean} [allowMultipleOrders]
 * @property {string} [appFormName]
 * @property {boolean} [contractNeeded]
 * @property {boolean} [credentialsNeeded]
 * @property {string} [descriptionKey]
 * @property {string} [nameKey]
 * @property {boolean} [prescreeningAllowed]
 * @property {string} [productName]
 * @property {string} [productStatus]
 * @property {string} productUUID
 * @property {number} responseCode
 * @property {string} responseMessage
 * @property {string} [vendorName]
 */

