# Typed models for the BluefinTecsMerchantPortal SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels. The SDK carries data as string-keyed struct value
# nodes, so each alias is an open string-keyed map; the @typedoc member lists
# document the concrete shapes. Do not edit by hand.

defmodule BluefinTecsMerchantPortal.Types do
  @moduledoc """
  Documented shapes for the BluefinTecsMerchantPortal SDK entities and operation payloads.

  Every alias resolves to an open string-keyed map because the SDK carries
  data as string-keyed struct value nodes; consult each type's member list for
  the concrete field/param types.
  """

  @typedoc """
  MerchantPortalApiController entity data model.

  Members:
    * `"account_number"` — integer() (optional)
    * `"additional_data"` — map() (optional)
    * `"business_reg_number"` — String.t() (required)
    * `"city"` — String.t() (required)
    * `"corporateuuid"` — String.t() (optional)
    * `"country"` — String.t() (required)
    * `"currency"` — String.t() (required)
    * `"merchant_category_code"` — integer() (required)
    * `"merchant_email"` — String.t() (optional)
    * `"merchant_name"` — String.t() (required)
    * `"merchant_phone_number"` — String.t() (optional)
    * `"packageid"` — String.t() (required)
    * `"packageorderuuid"` — String.t() (required)
    * `"password"` — String.t() (optional)
    * `"productid"` — String.t() (optional)
    * `"productid_acquirer"` — String.t() (optional)
    * `"reason_deactivation"` — String.t() (required)
    * `"reason_reactivation"` — String.t() (required)
    * `"sorting_code"` — integer() (optional)
    * `"state"` — String.t() (optional)
    * `"street"` — String.t() (required)
    * `"terminal_country_code"` — String.t() (required)
    * `"terminal_language_code"` — String.t() (required)
    * `"terminal_location"` — String.t() (required)
    * `"terminal_serial_number"` — String.t() (required)
    * `"terminalid"` — integer() (required)
    * `"terminalid_acquirer"` — String.t() (optional)
    * `"user_email"` — String.t() (optional)
    * `"user_phone_number"` — String.t() (optional)
    * `"username"` — String.t() (optional)
    * `"vu_nummer"` — String.t() (required)
    * `"web_shop_url"` — String.t() (optional)
    * `"zipcode"` — String.t() (required)
  """
  @type merchant_portal_api_controller :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for MerchantPortalApiController create.

  Members:
    * `"account_number"` — integer() (optional)
    * `"additional_data"` — map() (optional)
    * `"business_reg_number"` — String.t() (required)
    * `"city"` — String.t() (required)
    * `"corporateuuid"` — String.t() (optional)
    * `"country"` — String.t() (required)
    * `"currency"` — String.t() (required)
    * `"merchant_category_code"` — integer() (required)
    * `"merchant_email"` — String.t() (optional)
    * `"merchant_name"` — String.t() (required)
    * `"merchant_phone_number"` — String.t() (optional)
    * `"packageid"` — String.t() (required)
    * `"packageorderuuid"` — String.t() (required)
    * `"password"` — String.t() (optional)
    * `"productid"` — String.t() (optional)
    * `"productid_acquirer"` — String.t() (optional)
    * `"reason_deactivation"` — String.t() (required)
    * `"reason_reactivation"` — String.t() (required)
    * `"sorting_code"` — integer() (optional)
    * `"state"` — String.t() (optional)
    * `"street"` — String.t() (required)
    * `"terminal_country_code"` — String.t() (required)
    * `"terminal_language_code"` — String.t() (required)
    * `"terminal_location"` — String.t() (required)
    * `"terminal_serial_number"` — String.t() (required)
    * `"terminalid"` — integer() (required)
    * `"terminalid_acquirer"` — String.t() (optional)
    * `"user_email"` — String.t() (optional)
    * `"user_phone_number"` — String.t() (optional)
    * `"username"` — String.t() (optional)
    * `"vu_nummer"` — String.t() (required)
    * `"web_shop_url"` — String.t() (optional)
    * `"zipcode"` — String.t() (required)
  """
  @type merchant_portal_api_controller_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  MerchantPortalCommonController entity data model.
  """
  @type merchant_portal_common_controller :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for MerchantPortalCommonController load.
  """
  @type merchant_portal_common_controller_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  MerchantPortalPamContractController entity data model.

  Members:
    * `"language"` — String.t() (required)
    * `"productOrderUUID"` — String.t() (required)
  """
  @type merchant_portal_pam_contract_controller :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for MerchantPortalPamContractController create.

  Members:
    * `"language"` — String.t() (required)
    * `"productOrderUUID"` — String.t() (required)
  """
  @type merchant_portal_pam_contract_controller_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  MerchantPortalPamDocumentController entity data model.

  Members:
    * `"appFormFieldDescUUID"` — String.t() (required)
    * `"packageOrderUUID"` — String.t() (optional)
    * `"productOrderUUID"` — String.t() (optional)
  """
  @type merchant_portal_pam_document_controller :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for MerchantPortalPamDocumentController create.

  Members:
    * `"appFormFieldDescUUID"` — String.t() (required)
    * `"packageOrderUUID"` — String.t() (optional)
    * `"productOrderUUID"` — String.t() (optional)
  """
  @type merchant_portal_pam_document_controller_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  MerchantPortalPamFormController entity data model.

  Members:
    * `"appFormFieldsDescUUID"` — String.t() (required)
    * `"filter"` — map() (optional)
    * `"language"` — String.t() (required)
    * `"packageOrder"` — map() (optional)
    * `"packageOrderUUID"` — String.t() (required)
    * `"packageUUID"` — String.t() (optional)
    * `"productOrderUUID"` — String.t() (optional)
    * `"productOrders"` — list() (optional)
    * `"reasonOfReopening"` — String.t() (required)
  """
  @type merchant_portal_pam_form_controller :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for MerchantPortalPamFormController create.

  Members:
    * `"appFormFieldsDescUUID"` — String.t() (required)
    * `"filter"` — map() (optional)
    * `"language"` — String.t() (required)
    * `"packageOrder"` — map() (optional)
    * `"packageOrderUUID"` — String.t() (required)
    * `"packageUUID"` — String.t() (optional)
    * `"productOrderUUID"` — String.t() (optional)
    * `"productOrders"` — list() (optional)
    * `"reasonOfReopening"` — String.t() (required)
  """
  @type merchant_portal_pam_form_controller_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  MerchantPortalPamMandatorController entity data model.

  Members:
    * `"clientSecret"` — String.t() (optional)
    * `"mandatorName"` — String.t() (required)
    * `"notificationEmail"` — String.t() (optional)
    * `"packageUUID"` — String.t() (required)
  """
  @type merchant_portal_pam_mandator_controller :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for MerchantPortalPamMandatorController create.

  Members:
    * `"clientSecret"` — String.t() (optional)
    * `"mandatorName"` — String.t() (required)
    * `"notificationEmail"` — String.t() (optional)
    * `"packageUUID"` — String.t() (required)
  """
  @type merchant_portal_pam_mandator_controller_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  MerchantPortalPamMerchantController entity data model.

  Members:
    * `"additional_data"` — map() (optional)
    * `"businessRegistrationNumber"` — String.t() (required)
    * `"city"` — String.t() (optional)
    * `"companyName"` — String.t() (required)
    * `"corporateUUID"` — String.t() (required)
    * `"country"` — String.t() (optional)
    * `"currency"` — String.t() (required)
    * `"email"` — String.t() (required)
    * `"language"` — String.t() (required)
    * `"login"` — String.t() (required)
    * `"mandator"` — String.t() (required)
    * `"merchantContractNumber"` — String.t() (required)
    * `"merchantName"` — String.t() (optional)
    * `"merchant_category_code"` — String.t() (optional)
    * `"packageUUID"` — String.t() (optional)
    * `"packageorderuuid"` — String.t() (required)
    * `"phoneNumber"` — String.t() (required)
    * `"postalCode"` — String.t() (optional)
    * `"productid_acquirer"` — String.t() (required)
    * `"region"` — String.t() (optional)
    * `"registrationNumber"` — String.t() (optional)
    * `"signature"` — String.t() (optional)
    * `"street"` — String.t() (optional)
    * `"terminalIds"` — list() (optional)
    * `"terminalid_acquirer"` — String.t() (optional)
    * `"vu_nummer"` — String.t() (required)
  """
  @type merchant_portal_pam_merchant_controller :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for MerchantPortalPamMerchantController create.

  Members:
    * `"additional_data"` — map() (optional)
    * `"businessRegistrationNumber"` — String.t() (required)
    * `"city"` — String.t() (optional)
    * `"companyName"` — String.t() (required)
    * `"corporateUUID"` — String.t() (required)
    * `"country"` — String.t() (optional)
    * `"currency"` — String.t() (required)
    * `"email"` — String.t() (required)
    * `"language"` — String.t() (required)
    * `"login"` — String.t() (required)
    * `"mandator"` — String.t() (required)
    * `"merchantContractNumber"` — String.t() (required)
    * `"merchantName"` — String.t() (optional)
    * `"merchant_category_code"` — String.t() (optional)
    * `"packageUUID"` — String.t() (optional)
    * `"packageorderuuid"` — String.t() (required)
    * `"phoneNumber"` — String.t() (required)
    * `"postalCode"` — String.t() (optional)
    * `"productid_acquirer"` — String.t() (required)
    * `"region"` — String.t() (optional)
    * `"registrationNumber"` — String.t() (optional)
    * `"signature"` — String.t() (optional)
    * `"street"` — String.t() (optional)
    * `"terminalIds"` — list() (optional)
    * `"terminalid_acquirer"` — String.t() (optional)
    * `"vu_nummer"` — String.t() (required)
  """
  @type merchant_portal_pam_merchant_controller_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  MerchantPortalPamPackageController entity data model.

  Members:
    * `"consumerUUID"` — String.t() (optional)
    * `"corporateUUID"` — String.t() (optional)
    * `"country"` — String.t() (optional)
    * `"descriptionKey"` — String.t() (optional)
    * `"filter"` — map() (optional)
    * `"language"` — String.t() (required)
    * `"nameKey"` — String.t() (optional)
    * `"packageStatus"` — String.t() (optional)
    * `"packageUUID"` — String.t() (required)
    * `"pagination"` — map() (optional)
    * `"sorting"` — map() (optional)
  """
  @type merchant_portal_pam_package_controller :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for MerchantPortalPamPackageController create.

  Members:
    * `"consumerUUID"` — String.t() (optional)
    * `"corporateUUID"` — String.t() (optional)
    * `"country"` — String.t() (optional)
    * `"descriptionKey"` — String.t() (optional)
    * `"filter"` — map() (optional)
    * `"language"` — String.t() (required)
    * `"nameKey"` — String.t() (optional)
    * `"packageStatus"` — String.t() (optional)
    * `"packageUUID"` — String.t() (required)
    * `"pagination"` — map() (optional)
    * `"sorting"` — map() (optional)
  """
  @type merchant_portal_pam_package_controller_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  MerchantPortalPamProductController entity data model.

  Members:
    * `"consumerUUID"` — String.t() (optional)
    * `"filter"` — map() (optional)
    * `"language"` — String.t() (optional)
    * `"merchantID"` — String.t() (optional)
    * `"packageOrderUUID"` — String.t() (required)
    * `"pagination"` — map() (optional)
    * `"productOrderUUID"` — String.t() (required)
    * `"productUUID"` — String.t() (required)
    * `"reason_decline"` — String.t() (required)
    * `"sorting"` — map() (optional)
  """
  @type merchant_portal_pam_product_controller :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for MerchantPortalPamProductController create.

  Members:
    * `"consumerUUID"` — String.t() (optional)
    * `"filter"` — map() (optional)
    * `"language"` — String.t() (optional)
    * `"merchantID"` — String.t() (optional)
    * `"packageOrderUUID"` — String.t() (required)
    * `"pagination"` — map() (optional)
    * `"productOrderUUID"` — String.t() (required)
    * `"productUUID"` — String.t() (required)
    * `"reason_decline"` — String.t() (required)
    * `"sorting"` — map() (optional)
  """
  @type merchant_portal_pam_product_controller_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  OutputAddProduct entity data model.

  Members:
    * `"packageUUID"` — String.t() (required)
    * `"productUUIDs"` — list() (required)
    * `"responseCode"` — integer() (required)
    * `"responseMessage"` — String.t() (required)
  """
  @type output_add_product :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for OutputAddProduct create.

  Members:
    * `"packageUUID"` — String.t() (required)
    * `"productUUIDs"` — list() (required)
    * `"responseCode"` — integer() (required)
    * `"responseMessage"` — String.t() (required)
  """
  @type output_add_product_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  OutputCreateProduct entity data model.

  Members:
    * `"acquirerId"` — String.t() (optional)
    * `"allowMultipleOrders"` — boolean() (required)
    * `"appFormTemplateName"` — String.t() (required)
    * `"contractNeeded"` — boolean() (required)
    * `"credentialsNeeded"` — boolean() (optional)
    * `"descriptionKey"` — String.t() (required)
    * `"nameKey"` — String.t() (required)
    * `"prescreeningAllowed"` — boolean() (required)
    * `"productName"` — String.t() (required)
    * `"responseCode"` — integer() (required)
    * `"responseMessage"` — String.t() (required)
    * `"terminalTemplateName"` — String.t() (required)
    * `"vendorName"` — String.t() (required)
    * `"xmlTemplateFile"` — String.t() (required)
  """
  @type output_create_product :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for OutputCreateProduct create.

  Members:
    * `"acquirerId"` — String.t() (optional)
    * `"allowMultipleOrders"` — boolean() (required)
    * `"appFormTemplateName"` — String.t() (required)
    * `"contractNeeded"` — boolean() (required)
    * `"credentialsNeeded"` — boolean() (optional)
    * `"descriptionKey"` — String.t() (required)
    * `"nameKey"` — String.t() (required)
    * `"prescreeningAllowed"` — boolean() (required)
    * `"productName"` — String.t() (required)
    * `"responseCode"` — integer() (required)
    * `"responseMessage"` — String.t() (required)
    * `"terminalTemplateName"` — String.t() (required)
    * `"vendorName"` — String.t() (required)
    * `"xmlTemplateFile"` — String.t() (required)
  """
  @type output_create_product_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  OutputDetail entity data model.

  Members:
    * `"batch"` — map() (optional)
    * `"lines"` — map() (optional)
    * `"progress"` — map() (optional)
  """
  @type output_detail :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for OutputDetail load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type output_detail_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  OutputList entity data model.

  Members:
    * `"items"` — list() (optional)
    * `"pagination"` — map() (required)
    * `"responseCode"` — integer() (required)
    * `"responseMessage"` — String.t() (required)
    * `"sorting"` — map() (optional)
  """
  @type output_list :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for OutputList create.

  Members:
    * `"items"` — list() (optional)
    * `"pagination"` — map() (required)
    * `"responseCode"` — integer() (required)
    * `"responseMessage"` — String.t() (required)
    * `"sorting"` — map() (optional)
  """
  @type output_list_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  OutputMessage entity data model.

  Members:
    * `"responseCode"` — integer() (required)
    * `"responseMessage"` — String.t() (required)
  """
  @type output_message :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for OutputMessage load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type output_message_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  OutputMoveTid entity data model.

  Members:
    * `"productOrderUUIDs"` — list() (required)
    * `"responseCode"` — integer() (required)
    * `"responseMessage"` — String.t() (required)
    * `"targetPackageOrderUUID"` — String.t() (required)
    * `"targetProductOrderUUID"` — String.t() (required)
  """
  @type output_move_tid :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for OutputMoveTid create.

  Members:
    * `"productOrderUUIDs"` — list() (required)
    * `"responseCode"` — integer() (required)
    * `"responseMessage"` — String.t() (required)
    * `"targetPackageOrderUUID"` — String.t() (required)
    * `"targetProductOrderUUID"` — String.t() (required)
  """
  @type output_move_tid_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  OutputRemoveProduct entity data model.

  Members:
    * `"packageUUID"` — String.t() (required)
    * `"productUUIDs"` — list() (required)
    * `"responseCode"` — integer() (required)
    * `"responseMessage"` — String.t() (required)
  """
  @type output_remove_product :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for OutputRemoveProduct create.

  Members:
    * `"packageUUID"` — String.t() (required)
    * `"productUUIDs"` — list() (required)
    * `"responseCode"` — integer() (required)
    * `"responseMessage"` — String.t() (required)
  """
  @type output_remove_product_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  OutputStart entity data model.

  Members:
    * `"id"` — String.t() (optional)
    * `"responseCode"` — integer() (required)
    * `"responseMessage"` — String.t() (required)
  """
  @type output_start :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for OutputStart create.

  Members:
    * `"id"` — String.t() (optional)
    * `"responseCode"` — integer() (required)
    * `"responseMessage"` — String.t() (required)
  """
  @type output_start_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  OutputStatus entity data model.

  Members:
    * `"percentage"` — integer() (optional)
    * `"responseCode"` — integer() (required)
    * `"responseMessage"` — String.t() (required)
    * `"status"` — String.t() (optional)
  """
  @type output_status :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for OutputStatus load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type output_status_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  OutputUpdateProduct entity data model.

  Members:
    * `"allowMultipleOrders"` — boolean() (optional)
    * `"appFormName"` — String.t() (optional)
    * `"contractNeeded"` — boolean() (optional)
    * `"credentialsNeeded"` — boolean() (optional)
    * `"descriptionKey"` — String.t() (optional)
    * `"nameKey"` — String.t() (optional)
    * `"prescreeningAllowed"` — boolean() (optional)
    * `"productName"` — String.t() (optional)
    * `"productStatus"` — String.t() (optional)
    * `"productUUID"` — String.t() (required)
    * `"responseCode"` — integer() (required)
    * `"responseMessage"` — String.t() (required)
    * `"vendorName"` — String.t() (optional)
  """
  @type output_update_product :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for OutputUpdateProduct create.

  Members:
    * `"allowMultipleOrders"` — boolean() (optional)
    * `"appFormName"` — String.t() (optional)
    * `"contractNeeded"` — boolean() (optional)
    * `"credentialsNeeded"` — boolean() (optional)
    * `"descriptionKey"` — String.t() (optional)
    * `"nameKey"` — String.t() (optional)
    * `"prescreeningAllowed"` — boolean() (optional)
    * `"productName"` — String.t() (optional)
    * `"productStatus"` — String.t() (optional)
    * `"productUUID"` — String.t() (required)
    * `"responseCode"` — integer() (required)
    * `"responseMessage"` — String.t() (required)
    * `"vendorName"` — String.t() (optional)
  """
  @type output_update_product_create_data :: %{optional(String.t()) => any()}

end
