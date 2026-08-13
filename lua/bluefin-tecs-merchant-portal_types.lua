-- Typed models for the BluefinTecsMerchantPortal SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class MerchantPortalApiController
---@field account_number? number
---@field additional_data? table
---@field business_reg_number string
---@field city string
---@field corporateuuid? string
---@field country string
---@field currency string
---@field merchant_category_code number
---@field merchant_email? string
---@field merchant_name string
---@field merchant_phone_number? string
---@field packageid string
---@field packageorderuuid string
---@field password? string
---@field productid? string
---@field productid_acquirer? string
---@field reason_deactivation string
---@field reason_reactivation string
---@field sorting_code? number
---@field state? string
---@field street string
---@field terminal_country_code string
---@field terminal_language_code string
---@field terminal_location string
---@field terminal_serial_number string
---@field terminalid number
---@field terminalid_acquirer? string
---@field user_email? string
---@field user_phone_number? string
---@field username? string
---@field vu_nummer string
---@field web_shop_url? string
---@field zipcode string

---@class MerchantPortalApiControllerCreateData
---@field account_number? number
---@field additional_data? table
---@field business_reg_number string
---@field city string
---@field corporateuuid? string
---@field country string
---@field currency string
---@field merchant_category_code number
---@field merchant_email? string
---@field merchant_name string
---@field merchant_phone_number? string
---@field packageid string
---@field packageorderuuid string
---@field password? string
---@field productid? string
---@field productid_acquirer? string
---@field reason_deactivation string
---@field reason_reactivation string
---@field sorting_code? number
---@field state? string
---@field street string
---@field terminal_country_code string
---@field terminal_language_code string
---@field terminal_location string
---@field terminal_serial_number string
---@field terminalid number
---@field terminalid_acquirer? string
---@field user_email? string
---@field user_phone_number? string
---@field username? string
---@field vu_nummer string
---@field web_shop_url? string
---@field zipcode string

---@class MerchantPortalCommonController

---@class MerchantPortalCommonControllerLoadMatch

---@class MerchantPortalPamContractController
---@field language string
---@field productOrderUUID string

---@class MerchantPortalPamContractControllerCreateData
---@field language string
---@field productOrderUUID string

---@class MerchantPortalPamDocumentController
---@field appFormFieldDescUUID string
---@field packageOrderUUID? string
---@field productOrderUUID? string

---@class MerchantPortalPamDocumentControllerCreateData
---@field appFormFieldDescUUID string
---@field packageOrderUUID? string
---@field productOrderUUID? string

---@class MerchantPortalPamFormController
---@field appFormFieldsDescUUID string
---@field filter? table
---@field language string
---@field packageOrder? table
---@field packageOrderUUID string
---@field packageUUID? string
---@field productOrderUUID? string
---@field productOrders? table
---@field reasonOfReopening string

---@class MerchantPortalPamFormControllerCreateData
---@field appFormFieldsDescUUID string
---@field filter? table
---@field language string
---@field packageOrder? table
---@field packageOrderUUID string
---@field packageUUID? string
---@field productOrderUUID? string
---@field productOrders? table
---@field reasonOfReopening string

---@class MerchantPortalPamMandatorController
---@field clientSecret? string
---@field mandatorName string
---@field notificationEmail? string
---@field packageUUID string

---@class MerchantPortalPamMandatorControllerCreateData
---@field clientSecret? string
---@field mandatorName string
---@field notificationEmail? string
---@field packageUUID string

---@class MerchantPortalPamMerchantController
---@field additional_data? table
---@field businessRegistrationNumber string
---@field city? string
---@field companyName string
---@field corporateUUID string
---@field country? string
---@field currency string
---@field email string
---@field language string
---@field login string
---@field mandator string
---@field merchantContractNumber string
---@field merchantName? string
---@field merchant_category_code? string
---@field packageUUID? string
---@field packageorderuuid string
---@field phoneNumber string
---@field postalCode? string
---@field productid_acquirer string
---@field region? string
---@field registrationNumber? string
---@field signature? string
---@field street? string
---@field terminalIds? table
---@field terminalid_acquirer? string
---@field vu_nummer string

---@class MerchantPortalPamMerchantControllerCreateData
---@field additional_data? table
---@field businessRegistrationNumber string
---@field city? string
---@field companyName string
---@field corporateUUID string
---@field country? string
---@field currency string
---@field email string
---@field language string
---@field login string
---@field mandator string
---@field merchantContractNumber string
---@field merchantName? string
---@field merchant_category_code? string
---@field packageUUID? string
---@field packageorderuuid string
---@field phoneNumber string
---@field postalCode? string
---@field productid_acquirer string
---@field region? string
---@field registrationNumber? string
---@field signature? string
---@field street? string
---@field terminalIds? table
---@field terminalid_acquirer? string
---@field vu_nummer string

---@class MerchantPortalPamPackageController
---@field consumerUUID? string
---@field corporateUUID? string
---@field country? string
---@field descriptionKey? string
---@field filter? table
---@field language string
---@field nameKey? string
---@field packageStatus? string
---@field packageUUID string
---@field pagination? table
---@field sorting? table

---@class MerchantPortalPamPackageControllerCreateData
---@field consumerUUID? string
---@field corporateUUID? string
---@field country? string
---@field descriptionKey? string
---@field filter? table
---@field language string
---@field nameKey? string
---@field packageStatus? string
---@field packageUUID string
---@field pagination? table
---@field sorting? table

---@class MerchantPortalPamProductController
---@field consumerUUID? string
---@field filter? table
---@field language? string
---@field merchantID? string
---@field packageOrderUUID string
---@field pagination? table
---@field productOrderUUID string
---@field productUUID string
---@field reason_decline string
---@field sorting? table

---@class MerchantPortalPamProductControllerCreateData
---@field consumerUUID? string
---@field filter? table
---@field language? string
---@field merchantID? string
---@field packageOrderUUID string
---@field pagination? table
---@field productOrderUUID string
---@field productUUID string
---@field reason_decline string
---@field sorting? table

---@class OutputAddProduct
---@field packageUUID string
---@field productUUIDs table
---@field responseCode number
---@field responseMessage string

---@class OutputAddProductCreateData
---@field packageUUID string
---@field productUUIDs table
---@field responseCode number
---@field responseMessage string

---@class OutputCreateProduct
---@field acquirerId? string
---@field allowMultipleOrders boolean
---@field appFormTemplateName string
---@field contractNeeded boolean
---@field credentialsNeeded? boolean
---@field descriptionKey string
---@field nameKey string
---@field prescreeningAllowed boolean
---@field productName string
---@field responseCode number
---@field responseMessage string
---@field terminalTemplateName string
---@field vendorName string
---@field xmlTemplateFile string

---@class OutputCreateProductCreateData
---@field acquirerId? string
---@field allowMultipleOrders boolean
---@field appFormTemplateName string
---@field contractNeeded boolean
---@field credentialsNeeded? boolean
---@field descriptionKey string
---@field nameKey string
---@field prescreeningAllowed boolean
---@field productName string
---@field responseCode number
---@field responseMessage string
---@field terminalTemplateName string
---@field vendorName string
---@field xmlTemplateFile string

---@class OutputDetail
---@field batch? table
---@field lines? table
---@field progress? table

---@class OutputDetailLoadMatch
---@field id string

---@class OutputList
---@field items? table
---@field pagination table
---@field responseCode number
---@field responseMessage string
---@field sorting? table

---@class OutputListCreateData
---@field items? table
---@field pagination table
---@field responseCode number
---@field responseMessage string
---@field sorting? table

---@class OutputMessage
---@field responseCode number
---@field responseMessage string

---@class OutputMessageLoadMatch
---@field id string

---@class OutputMoveTid
---@field productOrderUUIDs table
---@field responseCode number
---@field responseMessage string
---@field targetPackageOrderUUID string
---@field targetProductOrderUUID string

---@class OutputMoveTidCreateData
---@field productOrderUUIDs table
---@field responseCode number
---@field responseMessage string
---@field targetPackageOrderUUID string
---@field targetProductOrderUUID string

---@class OutputRemoveProduct
---@field packageUUID string
---@field productUUIDs table
---@field responseCode number
---@field responseMessage string

---@class OutputRemoveProductCreateData
---@field packageUUID string
---@field productUUIDs table
---@field responseCode number
---@field responseMessage string

---@class OutputStart
---@field id? string
---@field responseCode number
---@field responseMessage string

---@class OutputStartCreateData
---@field id? string
---@field responseCode number
---@field responseMessage string

---@class OutputStatus
---@field percentage? number
---@field responseCode number
---@field responseMessage string
---@field status? string

---@class OutputStatusLoadMatch
---@field id string

---@class OutputUpdateProduct
---@field allowMultipleOrders? boolean
---@field appFormName? string
---@field contractNeeded? boolean
---@field credentialsNeeded? boolean
---@field descriptionKey? string
---@field nameKey? string
---@field prescreeningAllowed? boolean
---@field productName? string
---@field productStatus? string
---@field productUUID string
---@field responseCode number
---@field responseMessage string
---@field vendorName? string

---@class OutputUpdateProductCreateData
---@field allowMultipleOrders? boolean
---@field appFormName? string
---@field contractNeeded? boolean
---@field credentialsNeeded? boolean
---@field descriptionKey? string
---@field nameKey? string
---@field prescreeningAllowed? boolean
---@field productName? string
---@field productStatus? string
---@field productUUID string
---@field responseCode number
---@field responseMessage string
---@field vendorName? string

local M = {}

return M
