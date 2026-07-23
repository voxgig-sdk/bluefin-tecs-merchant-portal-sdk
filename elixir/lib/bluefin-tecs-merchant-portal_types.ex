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
    * `"product_order_uuid"` — String.t() (required)
  """
  @type merchant_portal_pam_contract_controller :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for MerchantPortalPamContractController create.

  Members:
    * `"language"` — String.t() (required)
    * `"product_order_uuid"` — String.t() (required)
  """
  @type merchant_portal_pam_contract_controller_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  MerchantPortalPamDocumentController entity data model.

  Members:
    * `"app_form_field_desc_uuid"` — String.t() (required)
    * `"package_order_uuid"` — String.t() (optional)
    * `"product_order_uuid"` — String.t() (optional)
  """
  @type merchant_portal_pam_document_controller :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for MerchantPortalPamDocumentController create.

  Members:
    * `"app_form_field_desc_uuid"` — String.t() (required)
    * `"package_order_uuid"` — String.t() (optional)
    * `"product_order_uuid"` — String.t() (optional)
  """
  @type merchant_portal_pam_document_controller_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  MerchantPortalPamFormController entity data model.

  Members:
    * `"app_form_fields_desc_uuid"` — String.t() (required)
    * `"filter"` — map() (optional)
    * `"language"` — String.t() (required)
    * `"package_order"` — map() (optional)
    * `"package_order_uuid"` — String.t() (required)
    * `"package_uuid"` — String.t() (optional)
    * `"product_order"` — list() (optional)
    * `"product_order_uuid"` — String.t() (optional)
    * `"reason_of_reopening"` — String.t() (required)
  """
  @type merchant_portal_pam_form_controller :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for MerchantPortalPamFormController create.

  Members:
    * `"app_form_fields_desc_uuid"` — String.t() (required)
    * `"filter"` — map() (optional)
    * `"language"` — String.t() (required)
    * `"package_order"` — map() (optional)
    * `"package_order_uuid"` — String.t() (required)
    * `"package_uuid"` — String.t() (optional)
    * `"product_order"` — list() (optional)
    * `"product_order_uuid"` — String.t() (optional)
    * `"reason_of_reopening"` — String.t() (required)
  """
  @type merchant_portal_pam_form_controller_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  MerchantPortalPamMandatorController entity data model.

  Members:
    * `"client_secret"` — String.t() (optional)
    * `"mandator_name"` — String.t() (required)
    * `"notification_email"` — String.t() (optional)
    * `"package_uuid"` — String.t() (required)
  """
  @type merchant_portal_pam_mandator_controller :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for MerchantPortalPamMandatorController create.

  Members:
    * `"client_secret"` — String.t() (optional)
    * `"mandator_name"` — String.t() (required)
    * `"notification_email"` — String.t() (optional)
    * `"package_uuid"` — String.t() (required)
  """
  @type merchant_portal_pam_mandator_controller_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  MerchantPortalPamMerchantController entity data model.

  Members:
    * `"additional_data"` — map() (optional)
    * `"business_registration_number"` — String.t() (required)
    * `"city"` — String.t() (optional)
    * `"company_name"` — String.t() (required)
    * `"corporate_uuid"` — String.t() (required)
    * `"country"` — String.t() (optional)
    * `"currency"` — String.t() (required)
    * `"email"` — String.t() (required)
    * `"language"` — String.t() (required)
    * `"login"` — String.t() (required)
    * `"mandator"` — String.t() (required)
    * `"merchant_category_code"` — String.t() (optional)
    * `"merchant_contract_number"` — String.t() (required)
    * `"merchant_name"` — String.t() (optional)
    * `"package_uuid"` — String.t() (optional)
    * `"packageorderuuid"` — String.t() (required)
    * `"phone_number"` — String.t() (required)
    * `"postal_code"` — String.t() (optional)
    * `"productid_acquirer"` — String.t() (required)
    * `"region"` — String.t() (optional)
    * `"registration_number"` — String.t() (optional)
    * `"signature"` — String.t() (optional)
    * `"street"` — String.t() (optional)
    * `"terminal_id"` — list() (optional)
    * `"terminalid_acquirer"` — String.t() (optional)
    * `"vu_nummer"` — String.t() (required)
  """
  @type merchant_portal_pam_merchant_controller :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for MerchantPortalPamMerchantController create.

  Members:
    * `"additional_data"` — map() (optional)
    * `"business_registration_number"` — String.t() (required)
    * `"city"` — String.t() (optional)
    * `"company_name"` — String.t() (required)
    * `"corporate_uuid"` — String.t() (required)
    * `"country"` — String.t() (optional)
    * `"currency"` — String.t() (required)
    * `"email"` — String.t() (required)
    * `"language"` — String.t() (required)
    * `"login"` — String.t() (required)
    * `"mandator"` — String.t() (required)
    * `"merchant_category_code"` — String.t() (optional)
    * `"merchant_contract_number"` — String.t() (required)
    * `"merchant_name"` — String.t() (optional)
    * `"package_uuid"` — String.t() (optional)
    * `"packageorderuuid"` — String.t() (required)
    * `"phone_number"` — String.t() (required)
    * `"postal_code"` — String.t() (optional)
    * `"productid_acquirer"` — String.t() (required)
    * `"region"` — String.t() (optional)
    * `"registration_number"` — String.t() (optional)
    * `"signature"` — String.t() (optional)
    * `"street"` — String.t() (optional)
    * `"terminal_id"` — list() (optional)
    * `"terminalid_acquirer"` — String.t() (optional)
    * `"vu_nummer"` — String.t() (required)
  """
  @type merchant_portal_pam_merchant_controller_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  MerchantPortalPamPackageController entity data model.

  Members:
    * `"consumer_uuid"` — String.t() (optional)
    * `"corporate_uuid"` — String.t() (optional)
    * `"country"` — String.t() (optional)
    * `"description_key"` — String.t() (optional)
    * `"filter"` — map() (optional)
    * `"language"` — String.t() (required)
    * `"name_key"` — String.t() (optional)
    * `"package_status"` — String.t() (optional)
    * `"package_uuid"` — String.t() (required)
    * `"pagination"` — map() (optional)
    * `"sorting"` — map() (optional)
  """
  @type merchant_portal_pam_package_controller :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for MerchantPortalPamPackageController create.

  Members:
    * `"consumer_uuid"` — String.t() (optional)
    * `"corporate_uuid"` — String.t() (optional)
    * `"country"` — String.t() (optional)
    * `"description_key"` — String.t() (optional)
    * `"filter"` — map() (optional)
    * `"language"` — String.t() (required)
    * `"name_key"` — String.t() (optional)
    * `"package_status"` — String.t() (optional)
    * `"package_uuid"` — String.t() (required)
    * `"pagination"` — map() (optional)
    * `"sorting"` — map() (optional)
  """
  @type merchant_portal_pam_package_controller_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  MerchantPortalPamProductController entity data model.

  Members:
    * `"consumer_uuid"` — String.t() (optional)
    * `"filter"` — map() (optional)
    * `"language"` — String.t() (optional)
    * `"merchant_id"` — String.t() (optional)
    * `"package_order_uuid"` — String.t() (required)
    * `"pagination"` — map() (optional)
    * `"product_order_uuid"` — String.t() (required)
    * `"product_uuid"` — String.t() (required)
    * `"reason_decline"` — String.t() (required)
    * `"sorting"` — map() (optional)
  """
  @type merchant_portal_pam_product_controller :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for MerchantPortalPamProductController create.

  Members:
    * `"consumer_uuid"` — String.t() (optional)
    * `"filter"` — map() (optional)
    * `"language"` — String.t() (optional)
    * `"merchant_id"` — String.t() (optional)
    * `"package_order_uuid"` — String.t() (required)
    * `"pagination"` — map() (optional)
    * `"product_order_uuid"` — String.t() (required)
    * `"product_uuid"` — String.t() (required)
    * `"reason_decline"` — String.t() (required)
    * `"sorting"` — map() (optional)
  """
  @type merchant_portal_pam_product_controller_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  OutputAddProduct entity data model.

  Members:
    * `"package_uuid"` — String.t() (required)
    * `"product_uui_d"` — list() (required)
    * `"response_code"` — integer() (required)
    * `"response_message"` — String.t() (required)
  """
  @type output_add_product :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for OutputAddProduct create.

  Members:
    * `"package_uuid"` — String.t() (required)
    * `"product_uui_d"` — list() (required)
    * `"response_code"` — integer() (required)
    * `"response_message"` — String.t() (required)
  """
  @type output_add_product_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  OutputCreateProduct entity data model.

  Members:
    * `"acquirer_id"` — String.t() (optional)
    * `"allow_multiple_order"` — boolean() (required)
    * `"app_form_template_name"` — String.t() (required)
    * `"contract_needed"` — boolean() (required)
    * `"credentials_needed"` — boolean() (optional)
    * `"description_key"` — String.t() (required)
    * `"name_key"` — String.t() (required)
    * `"prescreening_allowed"` — boolean() (required)
    * `"product_name"` — String.t() (required)
    * `"response_code"` — integer() (required)
    * `"response_message"` — String.t() (required)
    * `"terminal_template_name"` — String.t() (required)
    * `"vendor_name"` — String.t() (required)
    * `"xml_template_file"` — String.t() (required)
  """
  @type output_create_product :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for OutputCreateProduct create.

  Members:
    * `"acquirer_id"` — String.t() (optional)
    * `"allow_multiple_order"` — boolean() (required)
    * `"app_form_template_name"` — String.t() (required)
    * `"contract_needed"` — boolean() (required)
    * `"credentials_needed"` — boolean() (optional)
    * `"description_key"` — String.t() (required)
    * `"name_key"` — String.t() (required)
    * `"prescreening_allowed"` — boolean() (required)
    * `"product_name"` — String.t() (required)
    * `"response_code"` — integer() (required)
    * `"response_message"` — String.t() (required)
    * `"terminal_template_name"` — String.t() (required)
    * `"vendor_name"` — String.t() (required)
    * `"xml_template_file"` — String.t() (required)
  """
  @type output_create_product_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  OutputDetail entity data model.

  Members:
    * `"detail"` — map() (optional)
    * `"response_code"` — integer() (required)
    * `"response_message"` — String.t() (required)
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
    * `"item"` — list() (optional)
    * `"pagination"` — map() (required)
    * `"response_code"` — integer() (required)
    * `"response_message"` — String.t() (required)
    * `"sorting"` — map() (optional)
  """
  @type output_list :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for OutputList create.

  Members:
    * `"item"` — list() (optional)
    * `"pagination"` — map() (required)
    * `"response_code"` — integer() (required)
    * `"response_message"` — String.t() (required)
    * `"sorting"` — map() (optional)
  """
  @type output_list_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  OutputMessage entity data model.

  Members:
    * `"response_code"` — integer() (required)
    * `"response_message"` — String.t() (required)
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
    * `"product_order_uui_d"` — list() (required)
    * `"response_code"` — integer() (required)
    * `"response_message"` — String.t() (required)
    * `"target_package_order_uuid"` — String.t() (required)
    * `"target_product_order_uuid"` — String.t() (required)
  """
  @type output_move_tid :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for OutputMoveTid create.

  Members:
    * `"product_order_uui_d"` — list() (required)
    * `"response_code"` — integer() (required)
    * `"response_message"` — String.t() (required)
    * `"target_package_order_uuid"` — String.t() (required)
    * `"target_product_order_uuid"` — String.t() (required)
  """
  @type output_move_tid_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  OutputRemoveProduct entity data model.

  Members:
    * `"package_uuid"` — String.t() (required)
    * `"product_uui_d"` — list() (required)
    * `"response_code"` — integer() (required)
    * `"response_message"` — String.t() (required)
  """
  @type output_remove_product :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for OutputRemoveProduct create.

  Members:
    * `"package_uuid"` — String.t() (required)
    * `"product_uui_d"` — list() (required)
    * `"response_code"` — integer() (required)
    * `"response_message"` — String.t() (required)
  """
  @type output_remove_product_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  OutputStart entity data model.

  Members:
    * `"id"` — String.t() (optional)
    * `"response_code"` — integer() (required)
    * `"response_message"` — String.t() (required)
  """
  @type output_start :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for OutputStart create.

  Members:
    * `"id"` — String.t() (optional)
    * `"response_code"` — integer() (required)
    * `"response_message"` — String.t() (required)
  """
  @type output_start_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  OutputStatus entity data model.

  Members:
    * `"percentage"` — integer() (optional)
    * `"response_code"` — integer() (required)
    * `"response_message"` — String.t() (required)
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
    * `"allow_multiple_order"` — boolean() (optional)
    * `"app_form_name"` — String.t() (optional)
    * `"contract_needed"` — boolean() (optional)
    * `"credentials_needed"` — boolean() (optional)
    * `"description_key"` — String.t() (optional)
    * `"name_key"` — String.t() (optional)
    * `"prescreening_allowed"` — boolean() (optional)
    * `"product_name"` — String.t() (optional)
    * `"product_status"` — String.t() (optional)
    * `"product_uuid"` — String.t() (required)
    * `"response_code"` — integer() (required)
    * `"response_message"` — String.t() (required)
    * `"vendor_name"` — String.t() (optional)
  """
  @type output_update_product :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for OutputUpdateProduct create.

  Members:
    * `"allow_multiple_order"` — boolean() (optional)
    * `"app_form_name"` — String.t() (optional)
    * `"contract_needed"` — boolean() (optional)
    * `"credentials_needed"` — boolean() (optional)
    * `"description_key"` — String.t() (optional)
    * `"name_key"` — String.t() (optional)
    * `"prescreening_allowed"` — boolean() (optional)
    * `"product_name"` — String.t() (optional)
    * `"product_status"` — String.t() (optional)
    * `"product_uuid"` — String.t() (required)
    * `"response_code"` — integer() (required)
    * `"response_message"` — String.t() (required)
    * `"vendor_name"` — String.t() (optional)
  """
  @type output_update_product_create_data :: %{optional(String.t()) => any()}

end
