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
---@field product_order_uuid string

---@class MerchantPortalPamContractControllerCreateData
---@field language string
---@field product_order_uuid string

---@class MerchantPortalPamDocumentController
---@field app_form_field_desc_uuid string
---@field package_order_uuid? string
---@field product_order_uuid? string

---@class MerchantPortalPamDocumentControllerCreateData
---@field app_form_field_desc_uuid string
---@field package_order_uuid? string
---@field product_order_uuid? string

---@class MerchantPortalPamFormController
---@field app_form_fields_desc_uuid string
---@field filter? table
---@field language string
---@field package_order? table
---@field package_order_uuid string
---@field package_uuid? string
---@field product_order? table
---@field product_order_uuid? string
---@field reason_of_reopening string

---@class MerchantPortalPamFormControllerCreateData
---@field app_form_fields_desc_uuid string
---@field filter? table
---@field language string
---@field package_order? table
---@field package_order_uuid string
---@field package_uuid? string
---@field product_order? table
---@field product_order_uuid? string
---@field reason_of_reopening string

---@class MerchantPortalPamMandatorController
---@field client_secret? string
---@field mandator_name string
---@field notification_email? string
---@field package_uuid string

---@class MerchantPortalPamMandatorControllerCreateData
---@field client_secret? string
---@field mandator_name string
---@field notification_email? string
---@field package_uuid string

---@class MerchantPortalPamMerchantController
---@field additional_data? table
---@field business_registration_number string
---@field city? string
---@field company_name string
---@field corporate_uuid string
---@field country? string
---@field currency string
---@field email string
---@field language string
---@field login string
---@field mandator string
---@field merchant_category_code? string
---@field merchant_contract_number string
---@field merchant_name? string
---@field package_uuid? string
---@field packageorderuuid string
---@field phone_number string
---@field postal_code? string
---@field productid_acquirer string
---@field region? string
---@field registration_number? string
---@field signature? string
---@field street? string
---@field terminal_id? table
---@field terminalid_acquirer? string
---@field vu_nummer string

---@class MerchantPortalPamMerchantControllerCreateData
---@field additional_data? table
---@field business_registration_number string
---@field city? string
---@field company_name string
---@field corporate_uuid string
---@field country? string
---@field currency string
---@field email string
---@field language string
---@field login string
---@field mandator string
---@field merchant_category_code? string
---@field merchant_contract_number string
---@field merchant_name? string
---@field package_uuid? string
---@field packageorderuuid string
---@field phone_number string
---@field postal_code? string
---@field productid_acquirer string
---@field region? string
---@field registration_number? string
---@field signature? string
---@field street? string
---@field terminal_id? table
---@field terminalid_acquirer? string
---@field vu_nummer string

---@class MerchantPortalPamPackageController
---@field consumer_uuid? string
---@field corporate_uuid? string
---@field country? string
---@field description_key? string
---@field filter? table
---@field language string
---@field name_key? string
---@field package_status? string
---@field package_uuid string
---@field pagination? table
---@field sorting? table

---@class MerchantPortalPamPackageControllerCreateData
---@field consumer_uuid? string
---@field corporate_uuid? string
---@field country? string
---@field description_key? string
---@field filter? table
---@field language string
---@field name_key? string
---@field package_status? string
---@field package_uuid string
---@field pagination? table
---@field sorting? table

---@class MerchantPortalPamProductController
---@field consumer_uuid? string
---@field filter? table
---@field language? string
---@field merchant_id? string
---@field package_order_uuid string
---@field pagination? table
---@field product_order_uuid string
---@field product_uuid string
---@field reason_decline string
---@field sorting? table

---@class MerchantPortalPamProductControllerCreateData
---@field consumer_uuid? string
---@field filter? table
---@field language? string
---@field merchant_id? string
---@field package_order_uuid string
---@field pagination? table
---@field product_order_uuid string
---@field product_uuid string
---@field reason_decline string
---@field sorting? table

---@class OutputAddProduct
---@field package_uuid string
---@field product_uui_d table
---@field response_code number
---@field response_message string

---@class OutputAddProductCreateData
---@field package_uuid string
---@field product_uui_d table
---@field response_code number
---@field response_message string

---@class OutputCreateProduct
---@field acquirer_id? string
---@field allow_multiple_order boolean
---@field app_form_template_name string
---@field contract_needed boolean
---@field credentials_needed? boolean
---@field description_key string
---@field name_key string
---@field prescreening_allowed boolean
---@field product_name string
---@field response_code number
---@field response_message string
---@field terminal_template_name string
---@field vendor_name string
---@field xml_template_file string

---@class OutputCreateProductCreateData
---@field acquirer_id? string
---@field allow_multiple_order boolean
---@field app_form_template_name string
---@field contract_needed boolean
---@field credentials_needed? boolean
---@field description_key string
---@field name_key string
---@field prescreening_allowed boolean
---@field product_name string
---@field response_code number
---@field response_message string
---@field terminal_template_name string
---@field vendor_name string
---@field xml_template_file string

---@class OutputDetail
---@field detail? table
---@field response_code number
---@field response_message string

---@class OutputDetailLoadMatch
---@field id string

---@class OutputList
---@field item? table
---@field pagination table
---@field response_code number
---@field response_message string
---@field sorting? table

---@class OutputListCreateData
---@field item? table
---@field pagination table
---@field response_code number
---@field response_message string
---@field sorting? table

---@class OutputMessage
---@field response_code number
---@field response_message string

---@class OutputMessageLoadMatch
---@field id string

---@class OutputMoveTid
---@field product_order_uui_d table
---@field response_code number
---@field response_message string
---@field target_package_order_uuid string
---@field target_product_order_uuid string

---@class OutputMoveTidCreateData
---@field product_order_uui_d table
---@field response_code number
---@field response_message string
---@field target_package_order_uuid string
---@field target_product_order_uuid string

---@class OutputRemoveProduct
---@field package_uuid string
---@field product_uui_d table
---@field response_code number
---@field response_message string

---@class OutputRemoveProductCreateData
---@field package_uuid string
---@field product_uui_d table
---@field response_code number
---@field response_message string

---@class OutputStart
---@field id? string
---@field response_code number
---@field response_message string

---@class OutputStartCreateData
---@field id? string
---@field response_code number
---@field response_message string

---@class OutputStatus
---@field percentage? number
---@field response_code number
---@field response_message string
---@field status? string

---@class OutputStatusLoadMatch
---@field id string

---@class OutputUpdateProduct
---@field allow_multiple_order? boolean
---@field app_form_name? string
---@field contract_needed? boolean
---@field credentials_needed? boolean
---@field description_key? string
---@field name_key? string
---@field prescreening_allowed? boolean
---@field product_name? string
---@field product_status? string
---@field product_uuid string
---@field response_code number
---@field response_message string
---@field vendor_name? string

---@class OutputUpdateProductCreateData
---@field allow_multiple_order? boolean
---@field app_form_name? string
---@field contract_needed? boolean
---@field credentials_needed? boolean
---@field description_key? string
---@field name_key? string
---@field prescreening_allowed? boolean
---@field product_name? string
---@field product_status? string
---@field product_uuid string
---@field response_code number
---@field response_message string
---@field vendor_name? string

local M = {}

return M
