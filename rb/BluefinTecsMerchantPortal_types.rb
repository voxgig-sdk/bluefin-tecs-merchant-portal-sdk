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
# @!attribute [rw] productOrderUUID
#   @return [String]
MerchantPortalPamContractController = Struct.new(
  :language,
  :productOrderUUID,
  keyword_init: true
)

# Request payload for MerchantPortalPamContractController#create.
#
# @!attribute [rw] language
#   @return [String]
#
# @!attribute [rw] productOrderUUID
#   @return [String]
MerchantPortalPamContractControllerCreateData = Struct.new(
  :language,
  :productOrderUUID,
  keyword_init: true
)

# MerchantPortalPamDocumentController entity data model.
#
# @!attribute [rw] appFormFieldDescUUID
#   @return [String]
#
# @!attribute [rw] packageOrderUUID
#   @return [String, nil]
#
# @!attribute [rw] productOrderUUID
#   @return [String, nil]
MerchantPortalPamDocumentController = Struct.new(
  :appFormFieldDescUUID,
  :packageOrderUUID,
  :productOrderUUID,
  keyword_init: true
)

# Request payload for MerchantPortalPamDocumentController#create.
#
# @!attribute [rw] appFormFieldDescUUID
#   @return [String]
#
# @!attribute [rw] packageOrderUUID
#   @return [String, nil]
#
# @!attribute [rw] productOrderUUID
#   @return [String, nil]
MerchantPortalPamDocumentControllerCreateData = Struct.new(
  :appFormFieldDescUUID,
  :packageOrderUUID,
  :productOrderUUID,
  keyword_init: true
)

# MerchantPortalPamFormController entity data model.
#
# @!attribute [rw] appFormFieldsDescUUID
#   @return [String]
#
# @!attribute [rw] filter
#   @return [Hash, nil]
#
# @!attribute [rw] language
#   @return [String]
#
# @!attribute [rw] packageOrder
#   @return [Hash, nil]
#
# @!attribute [rw] packageOrderUUID
#   @return [String]
#
# @!attribute [rw] packageUUID
#   @return [String, nil]
#
# @!attribute [rw] productOrderUUID
#   @return [String, nil]
#
# @!attribute [rw] productOrders
#   @return [Array, nil]
#
# @!attribute [rw] reasonOfReopening
#   @return [String]
MerchantPortalPamFormController = Struct.new(
  :appFormFieldsDescUUID,
  :filter,
  :language,
  :packageOrder,
  :packageOrderUUID,
  :packageUUID,
  :productOrderUUID,
  :productOrders,
  :reasonOfReopening,
  keyword_init: true
)

# Request payload for MerchantPortalPamFormController#create.
#
# @!attribute [rw] appFormFieldsDescUUID
#   @return [String]
#
# @!attribute [rw] filter
#   @return [Hash, nil]
#
# @!attribute [rw] language
#   @return [String]
#
# @!attribute [rw] packageOrder
#   @return [Hash, nil]
#
# @!attribute [rw] packageOrderUUID
#   @return [String]
#
# @!attribute [rw] packageUUID
#   @return [String, nil]
#
# @!attribute [rw] productOrderUUID
#   @return [String, nil]
#
# @!attribute [rw] productOrders
#   @return [Array, nil]
#
# @!attribute [rw] reasonOfReopening
#   @return [String]
MerchantPortalPamFormControllerCreateData = Struct.new(
  :appFormFieldsDescUUID,
  :filter,
  :language,
  :packageOrder,
  :packageOrderUUID,
  :packageUUID,
  :productOrderUUID,
  :productOrders,
  :reasonOfReopening,
  keyword_init: true
)

# MerchantPortalPamMandatorController entity data model.
#
# @!attribute [rw] clientSecret
#   @return [String, nil]
#
# @!attribute [rw] mandatorName
#   @return [String]
#
# @!attribute [rw] notificationEmail
#   @return [String, nil]
#
# @!attribute [rw] packageUUID
#   @return [String]
MerchantPortalPamMandatorController = Struct.new(
  :clientSecret,
  :mandatorName,
  :notificationEmail,
  :packageUUID,
  keyword_init: true
)

# Request payload for MerchantPortalPamMandatorController#create.
#
# @!attribute [rw] clientSecret
#   @return [String, nil]
#
# @!attribute [rw] mandatorName
#   @return [String]
#
# @!attribute [rw] notificationEmail
#   @return [String, nil]
#
# @!attribute [rw] packageUUID
#   @return [String]
MerchantPortalPamMandatorControllerCreateData = Struct.new(
  :clientSecret,
  :mandatorName,
  :notificationEmail,
  :packageUUID,
  keyword_init: true
)

# MerchantPortalPamMerchantController entity data model.
#
# @!attribute [rw] additional_data
#   @return [Hash, nil]
#
# @!attribute [rw] businessRegistrationNumber
#   @return [String]
#
# @!attribute [rw] city
#   @return [String, nil]
#
# @!attribute [rw] companyName
#   @return [String]
#
# @!attribute [rw] corporateUUID
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
# @!attribute [rw] merchantContractNumber
#   @return [String]
#
# @!attribute [rw] merchantName
#   @return [String, nil]
#
# @!attribute [rw] merchant_category_code
#   @return [String, nil]
#
# @!attribute [rw] packageUUID
#   @return [String, nil]
#
# @!attribute [rw] packageorderuuid
#   @return [String]
#
# @!attribute [rw] phoneNumber
#   @return [String]
#
# @!attribute [rw] postalCode
#   @return [String, nil]
#
# @!attribute [rw] productid_acquirer
#   @return [String]
#
# @!attribute [rw] region
#   @return [String, nil]
#
# @!attribute [rw] registrationNumber
#   @return [String, nil]
#
# @!attribute [rw] signature
#   @return [String, nil]
#
# @!attribute [rw] street
#   @return [String, nil]
#
# @!attribute [rw] terminalIds
#   @return [Array, nil]
#
# @!attribute [rw] terminalid_acquirer
#   @return [String, nil]
#
# @!attribute [rw] vu_nummer
#   @return [String]
MerchantPortalPamMerchantController = Struct.new(
  :additional_data,
  :businessRegistrationNumber,
  :city,
  :companyName,
  :corporateUUID,
  :country,
  :currency,
  :email,
  :language,
  :login,
  :mandator,
  :merchantContractNumber,
  :merchantName,
  :merchant_category_code,
  :packageUUID,
  :packageorderuuid,
  :phoneNumber,
  :postalCode,
  :productid_acquirer,
  :region,
  :registrationNumber,
  :signature,
  :street,
  :terminalIds,
  :terminalid_acquirer,
  :vu_nummer,
  keyword_init: true
)

# Request payload for MerchantPortalPamMerchantController#create.
#
# @!attribute [rw] additional_data
#   @return [Hash, nil]
#
# @!attribute [rw] businessRegistrationNumber
#   @return [String]
#
# @!attribute [rw] city
#   @return [String, nil]
#
# @!attribute [rw] companyName
#   @return [String]
#
# @!attribute [rw] corporateUUID
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
# @!attribute [rw] merchantContractNumber
#   @return [String]
#
# @!attribute [rw] merchantName
#   @return [String, nil]
#
# @!attribute [rw] merchant_category_code
#   @return [String, nil]
#
# @!attribute [rw] packageUUID
#   @return [String, nil]
#
# @!attribute [rw] packageorderuuid
#   @return [String]
#
# @!attribute [rw] phoneNumber
#   @return [String]
#
# @!attribute [rw] postalCode
#   @return [String, nil]
#
# @!attribute [rw] productid_acquirer
#   @return [String]
#
# @!attribute [rw] region
#   @return [String, nil]
#
# @!attribute [rw] registrationNumber
#   @return [String, nil]
#
# @!attribute [rw] signature
#   @return [String, nil]
#
# @!attribute [rw] street
#   @return [String, nil]
#
# @!attribute [rw] terminalIds
#   @return [Array, nil]
#
# @!attribute [rw] terminalid_acquirer
#   @return [String, nil]
#
# @!attribute [rw] vu_nummer
#   @return [String]
MerchantPortalPamMerchantControllerCreateData = Struct.new(
  :additional_data,
  :businessRegistrationNumber,
  :city,
  :companyName,
  :corporateUUID,
  :country,
  :currency,
  :email,
  :language,
  :login,
  :mandator,
  :merchantContractNumber,
  :merchantName,
  :merchant_category_code,
  :packageUUID,
  :packageorderuuid,
  :phoneNumber,
  :postalCode,
  :productid_acquirer,
  :region,
  :registrationNumber,
  :signature,
  :street,
  :terminalIds,
  :terminalid_acquirer,
  :vu_nummer,
  keyword_init: true
)

# MerchantPortalPamPackageController entity data model.
#
# @!attribute [rw] consumerUUID
#   @return [String, nil]
#
# @!attribute [rw] corporateUUID
#   @return [String, nil]
#
# @!attribute [rw] country
#   @return [String, nil]
#
# @!attribute [rw] descriptionKey
#   @return [String, nil]
#
# @!attribute [rw] filter
#   @return [Hash, nil]
#
# @!attribute [rw] language
#   @return [String]
#
# @!attribute [rw] nameKey
#   @return [String, nil]
#
# @!attribute [rw] packageStatus
#   @return [String, nil]
#
# @!attribute [rw] packageUUID
#   @return [String]
#
# @!attribute [rw] pagination
#   @return [Hash, nil]
#
# @!attribute [rw] sorting
#   @return [Hash, nil]
MerchantPortalPamPackageController = Struct.new(
  :consumerUUID,
  :corporateUUID,
  :country,
  :descriptionKey,
  :filter,
  :language,
  :nameKey,
  :packageStatus,
  :packageUUID,
  :pagination,
  :sorting,
  keyword_init: true
)

# Request payload for MerchantPortalPamPackageController#create.
#
# @!attribute [rw] consumerUUID
#   @return [String, nil]
#
# @!attribute [rw] corporateUUID
#   @return [String, nil]
#
# @!attribute [rw] country
#   @return [String, nil]
#
# @!attribute [rw] descriptionKey
#   @return [String, nil]
#
# @!attribute [rw] filter
#   @return [Hash, nil]
#
# @!attribute [rw] language
#   @return [String]
#
# @!attribute [rw] nameKey
#   @return [String, nil]
#
# @!attribute [rw] packageStatus
#   @return [String, nil]
#
# @!attribute [rw] packageUUID
#   @return [String]
#
# @!attribute [rw] pagination
#   @return [Hash, nil]
#
# @!attribute [rw] sorting
#   @return [Hash, nil]
MerchantPortalPamPackageControllerCreateData = Struct.new(
  :consumerUUID,
  :corporateUUID,
  :country,
  :descriptionKey,
  :filter,
  :language,
  :nameKey,
  :packageStatus,
  :packageUUID,
  :pagination,
  :sorting,
  keyword_init: true
)

# MerchantPortalPamProductController entity data model.
#
# @!attribute [rw] consumerUUID
#   @return [String, nil]
#
# @!attribute [rw] filter
#   @return [Hash, nil]
#
# @!attribute [rw] language
#   @return [String, nil]
#
# @!attribute [rw] merchantID
#   @return [String, nil]
#
# @!attribute [rw] packageOrderUUID
#   @return [String]
#
# @!attribute [rw] pagination
#   @return [Hash, nil]
#
# @!attribute [rw] productOrderUUID
#   @return [String]
#
# @!attribute [rw] productUUID
#   @return [String]
#
# @!attribute [rw] reason_decline
#   @return [String]
#
# @!attribute [rw] sorting
#   @return [Hash, nil]
MerchantPortalPamProductController = Struct.new(
  :consumerUUID,
  :filter,
  :language,
  :merchantID,
  :packageOrderUUID,
  :pagination,
  :productOrderUUID,
  :productUUID,
  :reason_decline,
  :sorting,
  keyword_init: true
)

# Request payload for MerchantPortalPamProductController#create.
#
# @!attribute [rw] consumerUUID
#   @return [String, nil]
#
# @!attribute [rw] filter
#   @return [Hash, nil]
#
# @!attribute [rw] language
#   @return [String, nil]
#
# @!attribute [rw] merchantID
#   @return [String, nil]
#
# @!attribute [rw] packageOrderUUID
#   @return [String]
#
# @!attribute [rw] pagination
#   @return [Hash, nil]
#
# @!attribute [rw] productOrderUUID
#   @return [String]
#
# @!attribute [rw] productUUID
#   @return [String]
#
# @!attribute [rw] reason_decline
#   @return [String]
#
# @!attribute [rw] sorting
#   @return [Hash, nil]
MerchantPortalPamProductControllerCreateData = Struct.new(
  :consumerUUID,
  :filter,
  :language,
  :merchantID,
  :packageOrderUUID,
  :pagination,
  :productOrderUUID,
  :productUUID,
  :reason_decline,
  :sorting,
  keyword_init: true
)

# OutputAddProduct entity data model.
#
# @!attribute [rw] packageUUID
#   @return [String]
#
# @!attribute [rw] productUUIDs
#   @return [Array]
#
# @!attribute [rw] responseCode
#   @return [Integer]
#
# @!attribute [rw] responseMessage
#   @return [String]
OutputAddProduct = Struct.new(
  :packageUUID,
  :productUUIDs,
  :responseCode,
  :responseMessage,
  keyword_init: true
)

# Request payload for OutputAddProduct#create.
#
# @!attribute [rw] packageUUID
#   @return [String]
#
# @!attribute [rw] productUUIDs
#   @return [Array]
#
# @!attribute [rw] responseCode
#   @return [Integer]
#
# @!attribute [rw] responseMessage
#   @return [String]
OutputAddProductCreateData = Struct.new(
  :packageUUID,
  :productUUIDs,
  :responseCode,
  :responseMessage,
  keyword_init: true
)

# OutputCreateProduct entity data model.
#
# @!attribute [rw] acquirerId
#   @return [String, nil]
#
# @!attribute [rw] allowMultipleOrders
#   @return [Boolean]
#
# @!attribute [rw] appFormTemplateName
#   @return [String]
#
# @!attribute [rw] contractNeeded
#   @return [Boolean]
#
# @!attribute [rw] credentialsNeeded
#   @return [Boolean, nil]
#
# @!attribute [rw] descriptionKey
#   @return [String]
#
# @!attribute [rw] nameKey
#   @return [String]
#
# @!attribute [rw] prescreeningAllowed
#   @return [Boolean]
#
# @!attribute [rw] productName
#   @return [String]
#
# @!attribute [rw] responseCode
#   @return [Integer]
#
# @!attribute [rw] responseMessage
#   @return [String]
#
# @!attribute [rw] terminalTemplateName
#   @return [String]
#
# @!attribute [rw] vendorName
#   @return [String]
#
# @!attribute [rw] xmlTemplateFile
#   @return [String]
OutputCreateProduct = Struct.new(
  :acquirerId,
  :allowMultipleOrders,
  :appFormTemplateName,
  :contractNeeded,
  :credentialsNeeded,
  :descriptionKey,
  :nameKey,
  :prescreeningAllowed,
  :productName,
  :responseCode,
  :responseMessage,
  :terminalTemplateName,
  :vendorName,
  :xmlTemplateFile,
  keyword_init: true
)

# Request payload for OutputCreateProduct#create.
#
# @!attribute [rw] acquirerId
#   @return [String, nil]
#
# @!attribute [rw] allowMultipleOrders
#   @return [Boolean]
#
# @!attribute [rw] appFormTemplateName
#   @return [String]
#
# @!attribute [rw] contractNeeded
#   @return [Boolean]
#
# @!attribute [rw] credentialsNeeded
#   @return [Boolean, nil]
#
# @!attribute [rw] descriptionKey
#   @return [String]
#
# @!attribute [rw] nameKey
#   @return [String]
#
# @!attribute [rw] prescreeningAllowed
#   @return [Boolean]
#
# @!attribute [rw] productName
#   @return [String]
#
# @!attribute [rw] responseCode
#   @return [Integer]
#
# @!attribute [rw] responseMessage
#   @return [String]
#
# @!attribute [rw] terminalTemplateName
#   @return [String]
#
# @!attribute [rw] vendorName
#   @return [String]
#
# @!attribute [rw] xmlTemplateFile
#   @return [String]
OutputCreateProductCreateData = Struct.new(
  :acquirerId,
  :allowMultipleOrders,
  :appFormTemplateName,
  :contractNeeded,
  :credentialsNeeded,
  :descriptionKey,
  :nameKey,
  :prescreeningAllowed,
  :productName,
  :responseCode,
  :responseMessage,
  :terminalTemplateName,
  :vendorName,
  :xmlTemplateFile,
  keyword_init: true
)

# OutputDetail entity data model.
#
# @!attribute [rw] batch
#   @return [Hash, nil]
#
# @!attribute [rw] lines
#   @return [Hash, nil]
#
# @!attribute [rw] progress
#   @return [Hash, nil]
OutputDetail = Struct.new(
  :batch,
  :lines,
  :progress,
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
# @!attribute [rw] items
#   @return [Array, nil]
#
# @!attribute [rw] pagination
#   @return [Hash]
#
# @!attribute [rw] responseCode
#   @return [Integer]
#
# @!attribute [rw] responseMessage
#   @return [String]
#
# @!attribute [rw] sorting
#   @return [Hash, nil]
OutputList = Struct.new(
  :items,
  :pagination,
  :responseCode,
  :responseMessage,
  :sorting,
  keyword_init: true
)

# Request payload for OutputList#create.
#
# @!attribute [rw] items
#   @return [Array, nil]
#
# @!attribute [rw] pagination
#   @return [Hash]
#
# @!attribute [rw] responseCode
#   @return [Integer]
#
# @!attribute [rw] responseMessage
#   @return [String]
#
# @!attribute [rw] sorting
#   @return [Hash, nil]
OutputListCreateData = Struct.new(
  :items,
  :pagination,
  :responseCode,
  :responseMessage,
  :sorting,
  keyword_init: true
)

# OutputMessage entity data model.
#
# @!attribute [rw] responseCode
#   @return [Integer]
#
# @!attribute [rw] responseMessage
#   @return [String]
OutputMessage = Struct.new(
  :responseCode,
  :responseMessage,
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
# @!attribute [rw] productOrderUUIDs
#   @return [Array]
#
# @!attribute [rw] responseCode
#   @return [Integer]
#
# @!attribute [rw] responseMessage
#   @return [String]
#
# @!attribute [rw] targetPackageOrderUUID
#   @return [String]
#
# @!attribute [rw] targetProductOrderUUID
#   @return [String]
OutputMoveTid = Struct.new(
  :productOrderUUIDs,
  :responseCode,
  :responseMessage,
  :targetPackageOrderUUID,
  :targetProductOrderUUID,
  keyword_init: true
)

# Request payload for OutputMoveTid#create.
#
# @!attribute [rw] productOrderUUIDs
#   @return [Array]
#
# @!attribute [rw] responseCode
#   @return [Integer]
#
# @!attribute [rw] responseMessage
#   @return [String]
#
# @!attribute [rw] targetPackageOrderUUID
#   @return [String]
#
# @!attribute [rw] targetProductOrderUUID
#   @return [String]
OutputMoveTidCreateData = Struct.new(
  :productOrderUUIDs,
  :responseCode,
  :responseMessage,
  :targetPackageOrderUUID,
  :targetProductOrderUUID,
  keyword_init: true
)

# OutputRemoveProduct entity data model.
#
# @!attribute [rw] packageUUID
#   @return [String]
#
# @!attribute [rw] productUUIDs
#   @return [Array]
#
# @!attribute [rw] responseCode
#   @return [Integer]
#
# @!attribute [rw] responseMessage
#   @return [String]
OutputRemoveProduct = Struct.new(
  :packageUUID,
  :productUUIDs,
  :responseCode,
  :responseMessage,
  keyword_init: true
)

# Request payload for OutputRemoveProduct#create.
#
# @!attribute [rw] packageUUID
#   @return [String]
#
# @!attribute [rw] productUUIDs
#   @return [Array]
#
# @!attribute [rw] responseCode
#   @return [Integer]
#
# @!attribute [rw] responseMessage
#   @return [String]
OutputRemoveProductCreateData = Struct.new(
  :packageUUID,
  :productUUIDs,
  :responseCode,
  :responseMessage,
  keyword_init: true
)

# OutputStart entity data model.
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] responseCode
#   @return [Integer]
#
# @!attribute [rw] responseMessage
#   @return [String]
OutputStart = Struct.new(
  :id,
  :responseCode,
  :responseMessage,
  keyword_init: true
)

# Request payload for OutputStart#create.
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] responseCode
#   @return [Integer]
#
# @!attribute [rw] responseMessage
#   @return [String]
OutputStartCreateData = Struct.new(
  :id,
  :responseCode,
  :responseMessage,
  keyword_init: true
)

# OutputStatus entity data model.
#
# @!attribute [rw] percentage
#   @return [Integer, nil]
#
# @!attribute [rw] responseCode
#   @return [Integer]
#
# @!attribute [rw] responseMessage
#   @return [String]
#
# @!attribute [rw] status
#   @return [String, nil]
OutputStatus = Struct.new(
  :percentage,
  :responseCode,
  :responseMessage,
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
# @!attribute [rw] allowMultipleOrders
#   @return [Boolean, nil]
#
# @!attribute [rw] appFormName
#   @return [String, nil]
#
# @!attribute [rw] contractNeeded
#   @return [Boolean, nil]
#
# @!attribute [rw] credentialsNeeded
#   @return [Boolean, nil]
#
# @!attribute [rw] descriptionKey
#   @return [String, nil]
#
# @!attribute [rw] nameKey
#   @return [String, nil]
#
# @!attribute [rw] prescreeningAllowed
#   @return [Boolean, nil]
#
# @!attribute [rw] productName
#   @return [String, nil]
#
# @!attribute [rw] productStatus
#   @return [String, nil]
#
# @!attribute [rw] productUUID
#   @return [String]
#
# @!attribute [rw] responseCode
#   @return [Integer]
#
# @!attribute [rw] responseMessage
#   @return [String]
#
# @!attribute [rw] vendorName
#   @return [String, nil]
OutputUpdateProduct = Struct.new(
  :allowMultipleOrders,
  :appFormName,
  :contractNeeded,
  :credentialsNeeded,
  :descriptionKey,
  :nameKey,
  :prescreeningAllowed,
  :productName,
  :productStatus,
  :productUUID,
  :responseCode,
  :responseMessage,
  :vendorName,
  keyword_init: true
)

# Request payload for OutputUpdateProduct#create.
#
# @!attribute [rw] allowMultipleOrders
#   @return [Boolean, nil]
#
# @!attribute [rw] appFormName
#   @return [String, nil]
#
# @!attribute [rw] contractNeeded
#   @return [Boolean, nil]
#
# @!attribute [rw] credentialsNeeded
#   @return [Boolean, nil]
#
# @!attribute [rw] descriptionKey
#   @return [String, nil]
#
# @!attribute [rw] nameKey
#   @return [String, nil]
#
# @!attribute [rw] prescreeningAllowed
#   @return [Boolean, nil]
#
# @!attribute [rw] productName
#   @return [String, nil]
#
# @!attribute [rw] productStatus
#   @return [String, nil]
#
# @!attribute [rw] productUUID
#   @return [String]
#
# @!attribute [rw] responseCode
#   @return [Integer]
#
# @!attribute [rw] responseMessage
#   @return [String]
#
# @!attribute [rw] vendorName
#   @return [String, nil]
OutputUpdateProductCreateData = Struct.new(
  :allowMultipleOrders,
  :appFormName,
  :contractNeeded,
  :credentialsNeeded,
  :descriptionKey,
  :nameKey,
  :prescreeningAllowed,
  :productName,
  :productStatus,
  :productUUID,
  :responseCode,
  :responseMessage,
  :vendorName,
  keyword_init: true
)

