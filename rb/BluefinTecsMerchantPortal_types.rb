# frozen_string_literal: true

# Typed models for the BluefinTecsMerchantPortal SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# MerchantPortalApiController entity data model.
#
# @!attribute [rw] account_number
#   @return [Integer, nil]
#
# @!attribute [rw] additional_data
#   @return [Hash, nil]
#
# @!attribute [rw] business_reg_number
#   @return [String]
#
# @!attribute [rw] city
#   @return [String]
#
# @!attribute [rw] corporateuuid
#   @return [String, nil]
#
# @!attribute [rw] country
#   @return [String]
#
# @!attribute [rw] currency
#   @return [String]
#
# @!attribute [rw] merchant_category_code
#   @return [Integer]
#
# @!attribute [rw] merchant_email
#   @return [String, nil]
#
# @!attribute [rw] merchant_name
#   @return [String]
#
# @!attribute [rw] merchant_phone_number
#   @return [String, nil]
#
# @!attribute [rw] packageid
#   @return [String]
#
# @!attribute [rw] packageorderuuid
#   @return [String]
#
# @!attribute [rw] password
#   @return [String, nil]
#
# @!attribute [rw] productid
#   @return [String, nil]
#
# @!attribute [rw] productid_acquirer
#   @return [String, nil]
#
# @!attribute [rw] reason_deactivation
#   @return [String]
#
# @!attribute [rw] reason_reactivation
#   @return [String]
#
# @!attribute [rw] sorting_code
#   @return [Integer, nil]
#
# @!attribute [rw] state
#   @return [String, nil]
#
# @!attribute [rw] street
#   @return [String]
#
# @!attribute [rw] terminal_country_code
#   @return [String]
#
# @!attribute [rw] terminal_language_code
#   @return [String]
#
# @!attribute [rw] terminal_location
#   @return [String]
#
# @!attribute [rw] terminal_serial_number
#   @return [String]
#
# @!attribute [rw] terminalid
#   @return [Integer]
#
# @!attribute [rw] terminalid_acquirer
#   @return [String, nil]
#
# @!attribute [rw] user_email
#   @return [String, nil]
#
# @!attribute [rw] user_phone_number
#   @return [String, nil]
#
# @!attribute [rw] username
#   @return [String, nil]
#
# @!attribute [rw] vu_nummer
#   @return [String]
#
# @!attribute [rw] web_shop_url
#   @return [String, nil]
#
# @!attribute [rw] zipcode
#   @return [String]
MerchantPortalApiController = Struct.new(
  :account_number,
  :additional_data,
  :business_reg_number,
  :city,
  :corporateuuid,
  :country,
  :currency,
  :merchant_category_code,
  :merchant_email,
  :merchant_name,
  :merchant_phone_number,
  :packageid,
  :packageorderuuid,
  :password,
  :productid,
  :productid_acquirer,
  :reason_deactivation,
  :reason_reactivation,
  :sorting_code,
  :state,
  :street,
  :terminal_country_code,
  :terminal_language_code,
  :terminal_location,
  :terminal_serial_number,
  :terminalid,
  :terminalid_acquirer,
  :user_email,
  :user_phone_number,
  :username,
  :vu_nummer,
  :web_shop_url,
  :zipcode,
  keyword_init: true
)

# Request payload for MerchantPortalApiController#create.
#
# @!attribute [rw] account_number
#   @return [Integer, nil]
#
# @!attribute [rw] additional_data
#   @return [Hash, nil]
#
# @!attribute [rw] business_reg_number
#   @return [String]
#
# @!attribute [rw] city
#   @return [String]
#
# @!attribute [rw] corporateuuid
#   @return [String, nil]
#
# @!attribute [rw] country
#   @return [String]
#
# @!attribute [rw] currency
#   @return [String]
#
# @!attribute [rw] merchant_category_code
#   @return [Integer]
#
# @!attribute [rw] merchant_email
#   @return [String, nil]
#
# @!attribute [rw] merchant_name
#   @return [String]
#
# @!attribute [rw] merchant_phone_number
#   @return [String, nil]
#
# @!attribute [rw] packageid
#   @return [String]
#
# @!attribute [rw] packageorderuuid
#   @return [String]
#
# @!attribute [rw] password
#   @return [String, nil]
#
# @!attribute [rw] productid
#   @return [String, nil]
#
# @!attribute [rw] productid_acquirer
#   @return [String, nil]
#
# @!attribute [rw] reason_deactivation
#   @return [String]
#
# @!attribute [rw] reason_reactivation
#   @return [String]
#
# @!attribute [rw] sorting_code
#   @return [Integer, nil]
#
# @!attribute [rw] state
#   @return [String, nil]
#
# @!attribute [rw] street
#   @return [String]
#
# @!attribute [rw] terminal_country_code
#   @return [String]
#
# @!attribute [rw] terminal_language_code
#   @return [String]
#
# @!attribute [rw] terminal_location
#   @return [String]
#
# @!attribute [rw] terminal_serial_number
#   @return [String]
#
# @!attribute [rw] terminalid
#   @return [Integer]
#
# @!attribute [rw] terminalid_acquirer
#   @return [String, nil]
#
# @!attribute [rw] user_email
#   @return [String, nil]
#
# @!attribute [rw] user_phone_number
#   @return [String, nil]
#
# @!attribute [rw] username
#   @return [String, nil]
#
# @!attribute [rw] vu_nummer
#   @return [String]
#
# @!attribute [rw] web_shop_url
#   @return [String, nil]
#
# @!attribute [rw] zipcode
#   @return [String]
MerchantPortalApiControllerCreateData = Struct.new(
  :account_number,
  :additional_data,
  :business_reg_number,
  :city,
  :corporateuuid,
  :country,
  :currency,
  :merchant_category_code,
  :merchant_email,
  :merchant_name,
  :merchant_phone_number,
  :packageid,
  :packageorderuuid,
  :password,
  :productid,
  :productid_acquirer,
  :reason_deactivation,
  :reason_reactivation,
  :sorting_code,
  :state,
  :street,
  :terminal_country_code,
  :terminal_language_code,
  :terminal_location,
  :terminal_serial_number,
  :terminalid,
  :terminalid_acquirer,
  :user_email,
  :user_phone_number,
  :username,
  :vu_nummer,
  :web_shop_url,
  :zipcode,
  keyword_init: true
)

# MerchantPortalCommonController entity data model.
class MerchantPortalCommonController
end

# Request payload for MerchantPortalCommonController#load.
class MerchantPortalCommonControllerLoadMatch
end

# MerchantPortalPamContractController entity data model.
#
# @!attribute [rw] language
#   @return [String]
#
# @!attribute [rw] product_order_uuid
#   @return [String]
MerchantPortalPamContractController = Struct.new(
  :language,
  :product_order_uuid,
  keyword_init: true
)

# Request payload for MerchantPortalPamContractController#create.
#
# @!attribute [rw] language
#   @return [String]
#
# @!attribute [rw] product_order_uuid
#   @return [String]
MerchantPortalPamContractControllerCreateData = Struct.new(
  :language,
  :product_order_uuid,
  keyword_init: true
)

# MerchantPortalPamDocumentController entity data model.
#
# @!attribute [rw] app_form_field_desc_uuid
#   @return [String]
#
# @!attribute [rw] package_order_uuid
#   @return [String, nil]
#
# @!attribute [rw] product_order_uuid
#   @return [String, nil]
MerchantPortalPamDocumentController = Struct.new(
  :app_form_field_desc_uuid,
  :package_order_uuid,
  :product_order_uuid,
  keyword_init: true
)

# Request payload for MerchantPortalPamDocumentController#create.
#
# @!attribute [rw] app_form_field_desc_uuid
#   @return [String]
#
# @!attribute [rw] package_order_uuid
#   @return [String, nil]
#
# @!attribute [rw] product_order_uuid
#   @return [String, nil]
MerchantPortalPamDocumentControllerCreateData = Struct.new(
  :app_form_field_desc_uuid,
  :package_order_uuid,
  :product_order_uuid,
  keyword_init: true
)

# MerchantPortalPamFormController entity data model.
#
# @!attribute [rw] app_form_fields_desc_uuid
#   @return [String]
#
# @!attribute [rw] filter
#   @return [Hash, nil]
#
# @!attribute [rw] language
#   @return [String]
#
# @!attribute [rw] package_order
#   @return [Hash, nil]
#
# @!attribute [rw] package_order_uuid
#   @return [String]
#
# @!attribute [rw] package_uuid
#   @return [String, nil]
#
# @!attribute [rw] product_order
#   @return [Array, nil]
#
# @!attribute [rw] product_order_uuid
#   @return [String, nil]
#
# @!attribute [rw] reason_of_reopening
#   @return [String]
MerchantPortalPamFormController = Struct.new(
  :app_form_fields_desc_uuid,
  :filter,
  :language,
  :package_order,
  :package_order_uuid,
  :package_uuid,
  :product_order,
  :product_order_uuid,
  :reason_of_reopening,
  keyword_init: true
)

# Request payload for MerchantPortalPamFormController#create.
#
# @!attribute [rw] app_form_fields_desc_uuid
#   @return [String]
#
# @!attribute [rw] filter
#   @return [Hash, nil]
#
# @!attribute [rw] language
#   @return [String]
#
# @!attribute [rw] package_order
#   @return [Hash, nil]
#
# @!attribute [rw] package_order_uuid
#   @return [String]
#
# @!attribute [rw] package_uuid
#   @return [String, nil]
#
# @!attribute [rw] product_order
#   @return [Array, nil]
#
# @!attribute [rw] product_order_uuid
#   @return [String, nil]
#
# @!attribute [rw] reason_of_reopening
#   @return [String]
MerchantPortalPamFormControllerCreateData = Struct.new(
  :app_form_fields_desc_uuid,
  :filter,
  :language,
  :package_order,
  :package_order_uuid,
  :package_uuid,
  :product_order,
  :product_order_uuid,
  :reason_of_reopening,
  keyword_init: true
)

# MerchantPortalPamMandatorController entity data model.
#
# @!attribute [rw] client_secret
#   @return [String, nil]
#
# @!attribute [rw] mandator_name
#   @return [String]
#
# @!attribute [rw] notification_email
#   @return [String, nil]
#
# @!attribute [rw] package_uuid
#   @return [String]
MerchantPortalPamMandatorController = Struct.new(
  :client_secret,
  :mandator_name,
  :notification_email,
  :package_uuid,
  keyword_init: true
)

# Request payload for MerchantPortalPamMandatorController#create.
#
# @!attribute [rw] client_secret
#   @return [String, nil]
#
# @!attribute [rw] mandator_name
#   @return [String]
#
# @!attribute [rw] notification_email
#   @return [String, nil]
#
# @!attribute [rw] package_uuid
#   @return [String]
MerchantPortalPamMandatorControllerCreateData = Struct.new(
  :client_secret,
  :mandator_name,
  :notification_email,
  :package_uuid,
  keyword_init: true
)

# MerchantPortalPamMerchantController entity data model.
#
# @!attribute [rw] additional_data
#   @return [Hash, nil]
#
# @!attribute [rw] business_registration_number
#   @return [String]
#
# @!attribute [rw] city
#   @return [String, nil]
#
# @!attribute [rw] company_name
#   @return [String]
#
# @!attribute [rw] corporate_uuid
#   @return [String]
#
# @!attribute [rw] country
#   @return [String, nil]
#
# @!attribute [rw] currency
#   @return [String]
#
# @!attribute [rw] email
#   @return [String]
#
# @!attribute [rw] language
#   @return [String]
#
# @!attribute [rw] login
#   @return [String]
#
# @!attribute [rw] mandator
#   @return [String]
#
# @!attribute [rw] merchant_category_code
#   @return [String, nil]
#
# @!attribute [rw] merchant_contract_number
#   @return [String]
#
# @!attribute [rw] merchant_name
#   @return [String, nil]
#
# @!attribute [rw] package_uuid
#   @return [String, nil]
#
# @!attribute [rw] packageorderuuid
#   @return [String]
#
# @!attribute [rw] phone_number
#   @return [String]
#
# @!attribute [rw] postal_code
#   @return [String, nil]
#
# @!attribute [rw] productid_acquirer
#   @return [String]
#
# @!attribute [rw] region
#   @return [String, nil]
#
# @!attribute [rw] registration_number
#   @return [String, nil]
#
# @!attribute [rw] signature
#   @return [String, nil]
#
# @!attribute [rw] street
#   @return [String, nil]
#
# @!attribute [rw] terminal_id
#   @return [Array, nil]
#
# @!attribute [rw] terminalid_acquirer
#   @return [String, nil]
#
# @!attribute [rw] vu_nummer
#   @return [String]
MerchantPortalPamMerchantController = Struct.new(
  :additional_data,
  :business_registration_number,
  :city,
  :company_name,
  :corporate_uuid,
  :country,
  :currency,
  :email,
  :language,
  :login,
  :mandator,
  :merchant_category_code,
  :merchant_contract_number,
  :merchant_name,
  :package_uuid,
  :packageorderuuid,
  :phone_number,
  :postal_code,
  :productid_acquirer,
  :region,
  :registration_number,
  :signature,
  :street,
  :terminal_id,
  :terminalid_acquirer,
  :vu_nummer,
  keyword_init: true
)

# Request payload for MerchantPortalPamMerchantController#create.
#
# @!attribute [rw] additional_data
#   @return [Hash, nil]
#
# @!attribute [rw] business_registration_number
#   @return [String]
#
# @!attribute [rw] city
#   @return [String, nil]
#
# @!attribute [rw] company_name
#   @return [String]
#
# @!attribute [rw] corporate_uuid
#   @return [String]
#
# @!attribute [rw] country
#   @return [String, nil]
#
# @!attribute [rw] currency
#   @return [String]
#
# @!attribute [rw] email
#   @return [String]
#
# @!attribute [rw] language
#   @return [String]
#
# @!attribute [rw] login
#   @return [String]
#
# @!attribute [rw] mandator
#   @return [String]
#
# @!attribute [rw] merchant_category_code
#   @return [String, nil]
#
# @!attribute [rw] merchant_contract_number
#   @return [String]
#
# @!attribute [rw] merchant_name
#   @return [String, nil]
#
# @!attribute [rw] package_uuid
#   @return [String, nil]
#
# @!attribute [rw] packageorderuuid
#   @return [String]
#
# @!attribute [rw] phone_number
#   @return [String]
#
# @!attribute [rw] postal_code
#   @return [String, nil]
#
# @!attribute [rw] productid_acquirer
#   @return [String]
#
# @!attribute [rw] region
#   @return [String, nil]
#
# @!attribute [rw] registration_number
#   @return [String, nil]
#
# @!attribute [rw] signature
#   @return [String, nil]
#
# @!attribute [rw] street
#   @return [String, nil]
#
# @!attribute [rw] terminal_id
#   @return [Array, nil]
#
# @!attribute [rw] terminalid_acquirer
#   @return [String, nil]
#
# @!attribute [rw] vu_nummer
#   @return [String]
MerchantPortalPamMerchantControllerCreateData = Struct.new(
  :additional_data,
  :business_registration_number,
  :city,
  :company_name,
  :corporate_uuid,
  :country,
  :currency,
  :email,
  :language,
  :login,
  :mandator,
  :merchant_category_code,
  :merchant_contract_number,
  :merchant_name,
  :package_uuid,
  :packageorderuuid,
  :phone_number,
  :postal_code,
  :productid_acquirer,
  :region,
  :registration_number,
  :signature,
  :street,
  :terminal_id,
  :terminalid_acquirer,
  :vu_nummer,
  keyword_init: true
)

# MerchantPortalPamPackageController entity data model.
#
# @!attribute [rw] consumer_uuid
#   @return [String, nil]
#
# @!attribute [rw] corporate_uuid
#   @return [String, nil]
#
# @!attribute [rw] country
#   @return [String, nil]
#
# @!attribute [rw] description_key
#   @return [String, nil]
#
# @!attribute [rw] filter
#   @return [Hash, nil]
#
# @!attribute [rw] language
#   @return [String]
#
# @!attribute [rw] name_key
#   @return [String, nil]
#
# @!attribute [rw] package_status
#   @return [String, nil]
#
# @!attribute [rw] package_uuid
#   @return [String]
#
# @!attribute [rw] pagination
#   @return [Hash, nil]
#
# @!attribute [rw] sorting
#   @return [Hash, nil]
MerchantPortalPamPackageController = Struct.new(
  :consumer_uuid,
  :corporate_uuid,
  :country,
  :description_key,
  :filter,
  :language,
  :name_key,
  :package_status,
  :package_uuid,
  :pagination,
  :sorting,
  keyword_init: true
)

# Request payload for MerchantPortalPamPackageController#create.
#
# @!attribute [rw] consumer_uuid
#   @return [String, nil]
#
# @!attribute [rw] corporate_uuid
#   @return [String, nil]
#
# @!attribute [rw] country
#   @return [String, nil]
#
# @!attribute [rw] description_key
#   @return [String, nil]
#
# @!attribute [rw] filter
#   @return [Hash, nil]
#
# @!attribute [rw] language
#   @return [String]
#
# @!attribute [rw] name_key
#   @return [String, nil]
#
# @!attribute [rw] package_status
#   @return [String, nil]
#
# @!attribute [rw] package_uuid
#   @return [String]
#
# @!attribute [rw] pagination
#   @return [Hash, nil]
#
# @!attribute [rw] sorting
#   @return [Hash, nil]
MerchantPortalPamPackageControllerCreateData = Struct.new(
  :consumer_uuid,
  :corporate_uuid,
  :country,
  :description_key,
  :filter,
  :language,
  :name_key,
  :package_status,
  :package_uuid,
  :pagination,
  :sorting,
  keyword_init: true
)

# MerchantPortalPamProductController entity data model.
#
# @!attribute [rw] consumer_uuid
#   @return [String, nil]
#
# @!attribute [rw] filter
#   @return [Hash, nil]
#
# @!attribute [rw] language
#   @return [String, nil]
#
# @!attribute [rw] merchant_id
#   @return [String, nil]
#
# @!attribute [rw] package_order_uuid
#   @return [String]
#
# @!attribute [rw] pagination
#   @return [Hash, nil]
#
# @!attribute [rw] product_order_uuid
#   @return [String]
#
# @!attribute [rw] product_uuid
#   @return [String]
#
# @!attribute [rw] reason_decline
#   @return [String]
#
# @!attribute [rw] sorting
#   @return [Hash, nil]
MerchantPortalPamProductController = Struct.new(
  :consumer_uuid,
  :filter,
  :language,
  :merchant_id,
  :package_order_uuid,
  :pagination,
  :product_order_uuid,
  :product_uuid,
  :reason_decline,
  :sorting,
  keyword_init: true
)

# Request payload for MerchantPortalPamProductController#create.
#
# @!attribute [rw] consumer_uuid
#   @return [String, nil]
#
# @!attribute [rw] filter
#   @return [Hash, nil]
#
# @!attribute [rw] language
#   @return [String, nil]
#
# @!attribute [rw] merchant_id
#   @return [String, nil]
#
# @!attribute [rw] package_order_uuid
#   @return [String]
#
# @!attribute [rw] pagination
#   @return [Hash, nil]
#
# @!attribute [rw] product_order_uuid
#   @return [String]
#
# @!attribute [rw] product_uuid
#   @return [String]
#
# @!attribute [rw] reason_decline
#   @return [String]
#
# @!attribute [rw] sorting
#   @return [Hash, nil]
MerchantPortalPamProductControllerCreateData = Struct.new(
  :consumer_uuid,
  :filter,
  :language,
  :merchant_id,
  :package_order_uuid,
  :pagination,
  :product_order_uuid,
  :product_uuid,
  :reason_decline,
  :sorting,
  keyword_init: true
)

# OutputAddProduct entity data model.
#
# @!attribute [rw] package_uuid
#   @return [String]
#
# @!attribute [rw] product_uui_d
#   @return [Array]
#
# @!attribute [rw] response_code
#   @return [Integer]
#
# @!attribute [rw] response_message
#   @return [String]
OutputAddProduct = Struct.new(
  :package_uuid,
  :product_uui_d,
  :response_code,
  :response_message,
  keyword_init: true
)

# Request payload for OutputAddProduct#create.
#
# @!attribute [rw] package_uuid
#   @return [String]
#
# @!attribute [rw] product_uui_d
#   @return [Array]
#
# @!attribute [rw] response_code
#   @return [Integer]
#
# @!attribute [rw] response_message
#   @return [String]
OutputAddProductCreateData = Struct.new(
  :package_uuid,
  :product_uui_d,
  :response_code,
  :response_message,
  keyword_init: true
)

# OutputCreateProduct entity data model.
#
# @!attribute [rw] acquirer_id
#   @return [String, nil]
#
# @!attribute [rw] allow_multiple_order
#   @return [Boolean]
#
# @!attribute [rw] app_form_template_name
#   @return [String]
#
# @!attribute [rw] contract_needed
#   @return [Boolean]
#
# @!attribute [rw] credentials_needed
#   @return [Boolean, nil]
#
# @!attribute [rw] description_key
#   @return [String]
#
# @!attribute [rw] name_key
#   @return [String]
#
# @!attribute [rw] prescreening_allowed
#   @return [Boolean]
#
# @!attribute [rw] product_name
#   @return [String]
#
# @!attribute [rw] response_code
#   @return [Integer]
#
# @!attribute [rw] response_message
#   @return [String]
#
# @!attribute [rw] terminal_template_name
#   @return [String]
#
# @!attribute [rw] vendor_name
#   @return [String]
#
# @!attribute [rw] xml_template_file
#   @return [String]
OutputCreateProduct = Struct.new(
  :acquirer_id,
  :allow_multiple_order,
  :app_form_template_name,
  :contract_needed,
  :credentials_needed,
  :description_key,
  :name_key,
  :prescreening_allowed,
  :product_name,
  :response_code,
  :response_message,
  :terminal_template_name,
  :vendor_name,
  :xml_template_file,
  keyword_init: true
)

# Request payload for OutputCreateProduct#create.
#
# @!attribute [rw] acquirer_id
#   @return [String, nil]
#
# @!attribute [rw] allow_multiple_order
#   @return [Boolean]
#
# @!attribute [rw] app_form_template_name
#   @return [String]
#
# @!attribute [rw] contract_needed
#   @return [Boolean]
#
# @!attribute [rw] credentials_needed
#   @return [Boolean, nil]
#
# @!attribute [rw] description_key
#   @return [String]
#
# @!attribute [rw] name_key
#   @return [String]
#
# @!attribute [rw] prescreening_allowed
#   @return [Boolean]
#
# @!attribute [rw] product_name
#   @return [String]
#
# @!attribute [rw] response_code
#   @return [Integer]
#
# @!attribute [rw] response_message
#   @return [String]
#
# @!attribute [rw] terminal_template_name
#   @return [String]
#
# @!attribute [rw] vendor_name
#   @return [String]
#
# @!attribute [rw] xml_template_file
#   @return [String]
OutputCreateProductCreateData = Struct.new(
  :acquirer_id,
  :allow_multiple_order,
  :app_form_template_name,
  :contract_needed,
  :credentials_needed,
  :description_key,
  :name_key,
  :prescreening_allowed,
  :product_name,
  :response_code,
  :response_message,
  :terminal_template_name,
  :vendor_name,
  :xml_template_file,
  keyword_init: true
)

# OutputDetail entity data model.
#
# @!attribute [rw] detail
#   @return [Hash, nil]
#
# @!attribute [rw] response_code
#   @return [Integer]
#
# @!attribute [rw] response_message
#   @return [String]
OutputDetail = Struct.new(
  :detail,
  :response_code,
  :response_message,
  keyword_init: true
)

# Request payload for OutputDetail#load.
#
# @!attribute [rw] id
#   @return [String]
OutputDetailLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# OutputList entity data model.
#
# @!attribute [rw] item
#   @return [Array, nil]
#
# @!attribute [rw] pagination
#   @return [Hash]
#
# @!attribute [rw] response_code
#   @return [Integer]
#
# @!attribute [rw] response_message
#   @return [String]
#
# @!attribute [rw] sorting
#   @return [Hash, nil]
OutputList = Struct.new(
  :item,
  :pagination,
  :response_code,
  :response_message,
  :sorting,
  keyword_init: true
)

# Request payload for OutputList#create.
#
# @!attribute [rw] item
#   @return [Array, nil]
#
# @!attribute [rw] pagination
#   @return [Hash]
#
# @!attribute [rw] response_code
#   @return [Integer]
#
# @!attribute [rw] response_message
#   @return [String]
#
# @!attribute [rw] sorting
#   @return [Hash, nil]
OutputListCreateData = Struct.new(
  :item,
  :pagination,
  :response_code,
  :response_message,
  :sorting,
  keyword_init: true
)

# OutputMessage entity data model.
#
# @!attribute [rw] response_code
#   @return [Integer]
#
# @!attribute [rw] response_message
#   @return [String]
OutputMessage = Struct.new(
  :response_code,
  :response_message,
  keyword_init: true
)

# Request payload for OutputMessage#load.
#
# @!attribute [rw] id
#   @return [String]
OutputMessageLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# OutputMoveTid entity data model.
#
# @!attribute [rw] product_order_uui_d
#   @return [Array]
#
# @!attribute [rw] response_code
#   @return [Integer]
#
# @!attribute [rw] response_message
#   @return [String]
#
# @!attribute [rw] target_package_order_uuid
#   @return [String]
#
# @!attribute [rw] target_product_order_uuid
#   @return [String]
OutputMoveTid = Struct.new(
  :product_order_uui_d,
  :response_code,
  :response_message,
  :target_package_order_uuid,
  :target_product_order_uuid,
  keyword_init: true
)

# Request payload for OutputMoveTid#create.
#
# @!attribute [rw] product_order_uui_d
#   @return [Array]
#
# @!attribute [rw] response_code
#   @return [Integer]
#
# @!attribute [rw] response_message
#   @return [String]
#
# @!attribute [rw] target_package_order_uuid
#   @return [String]
#
# @!attribute [rw] target_product_order_uuid
#   @return [String]
OutputMoveTidCreateData = Struct.new(
  :product_order_uui_d,
  :response_code,
  :response_message,
  :target_package_order_uuid,
  :target_product_order_uuid,
  keyword_init: true
)

# OutputRemoveProduct entity data model.
#
# @!attribute [rw] package_uuid
#   @return [String]
#
# @!attribute [rw] product_uui_d
#   @return [Array]
#
# @!attribute [rw] response_code
#   @return [Integer]
#
# @!attribute [rw] response_message
#   @return [String]
OutputRemoveProduct = Struct.new(
  :package_uuid,
  :product_uui_d,
  :response_code,
  :response_message,
  keyword_init: true
)

# Request payload for OutputRemoveProduct#create.
#
# @!attribute [rw] package_uuid
#   @return [String]
#
# @!attribute [rw] product_uui_d
#   @return [Array]
#
# @!attribute [rw] response_code
#   @return [Integer]
#
# @!attribute [rw] response_message
#   @return [String]
OutputRemoveProductCreateData = Struct.new(
  :package_uuid,
  :product_uui_d,
  :response_code,
  :response_message,
  keyword_init: true
)

# OutputStart entity data model.
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] response_code
#   @return [Integer]
#
# @!attribute [rw] response_message
#   @return [String]
OutputStart = Struct.new(
  :id,
  :response_code,
  :response_message,
  keyword_init: true
)

# Request payload for OutputStart#create.
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] response_code
#   @return [Integer]
#
# @!attribute [rw] response_message
#   @return [String]
OutputStartCreateData = Struct.new(
  :id,
  :response_code,
  :response_message,
  keyword_init: true
)

# OutputStatus entity data model.
#
# @!attribute [rw] percentage
#   @return [Integer, nil]
#
# @!attribute [rw] response_code
#   @return [Integer]
#
# @!attribute [rw] response_message
#   @return [String]
#
# @!attribute [rw] status
#   @return [String, nil]
OutputStatus = Struct.new(
  :percentage,
  :response_code,
  :response_message,
  :status,
  keyword_init: true
)

# Request payload for OutputStatus#load.
#
# @!attribute [rw] id
#   @return [String]
OutputStatusLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# OutputUpdateProduct entity data model.
#
# @!attribute [rw] allow_multiple_order
#   @return [Boolean, nil]
#
# @!attribute [rw] app_form_name
#   @return [String, nil]
#
# @!attribute [rw] contract_needed
#   @return [Boolean, nil]
#
# @!attribute [rw] credentials_needed
#   @return [Boolean, nil]
#
# @!attribute [rw] description_key
#   @return [String, nil]
#
# @!attribute [rw] name_key
#   @return [String, nil]
#
# @!attribute [rw] prescreening_allowed
#   @return [Boolean, nil]
#
# @!attribute [rw] product_name
#   @return [String, nil]
#
# @!attribute [rw] product_status
#   @return [String, nil]
#
# @!attribute [rw] product_uuid
#   @return [String]
#
# @!attribute [rw] response_code
#   @return [Integer]
#
# @!attribute [rw] response_message
#   @return [String]
#
# @!attribute [rw] vendor_name
#   @return [String, nil]
OutputUpdateProduct = Struct.new(
  :allow_multiple_order,
  :app_form_name,
  :contract_needed,
  :credentials_needed,
  :description_key,
  :name_key,
  :prescreening_allowed,
  :product_name,
  :product_status,
  :product_uuid,
  :response_code,
  :response_message,
  :vendor_name,
  keyword_init: true
)

# Request payload for OutputUpdateProduct#create.
#
# @!attribute [rw] allow_multiple_order
#   @return [Boolean, nil]
#
# @!attribute [rw] app_form_name
#   @return [String, nil]
#
# @!attribute [rw] contract_needed
#   @return [Boolean, nil]
#
# @!attribute [rw] credentials_needed
#   @return [Boolean, nil]
#
# @!attribute [rw] description_key
#   @return [String, nil]
#
# @!attribute [rw] name_key
#   @return [String, nil]
#
# @!attribute [rw] prescreening_allowed
#   @return [Boolean, nil]
#
# @!attribute [rw] product_name
#   @return [String, nil]
#
# @!attribute [rw] product_status
#   @return [String, nil]
#
# @!attribute [rw] product_uuid
#   @return [String]
#
# @!attribute [rw] response_code
#   @return [Integer]
#
# @!attribute [rw] response_message
#   @return [String]
#
# @!attribute [rw] vendor_name
#   @return [String, nil]
OutputUpdateProductCreateData = Struct.new(
  :allow_multiple_order,
  :app_form_name,
  :contract_needed,
  :credentials_needed,
  :description_key,
  :name_key,
  :prescreening_allowed,
  :product_name,
  :product_status,
  :product_uuid,
  :response_code,
  :response_message,
  :vendor_name,
  keyword_init: true
)

