# Typed models for the BluefinTecsMerchantPortal SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class MerchantPortalApiControllerRequired(TypedDict):
    business_reg_number: str
    city: str
    country: str
    currency: str
    merchant_category_code: int
    merchant_name: str
    packageid: str
    packageorderuuid: str
    reason_deactivation: str
    reason_reactivation: str
    street: str
    terminal_country_code: str
    terminal_language_code: str
    terminal_location: str
    terminal_serial_number: str
    terminalid: int
    vu_nummer: str
    zipcode: str


class MerchantPortalApiController(MerchantPortalApiControllerRequired, total=False):
    account_number: int
    additional_data: dict
    corporateuuid: str
    merchant_email: str
    merchant_phone_number: str
    password: str
    productid: str
    productid_acquirer: str
    sorting_code: int
    state: str
    terminalid_acquirer: str
    user_email: str
    user_phone_number: str
    username: str
    web_shop_url: str


class MerchantPortalApiControllerCreateDataRequired(TypedDict):
    business_reg_number: str
    city: str
    country: str
    currency: str
    merchant_category_code: int
    merchant_name: str
    packageid: str
    packageorderuuid: str
    reason_deactivation: str
    reason_reactivation: str
    street: str
    terminal_country_code: str
    terminal_language_code: str
    terminal_location: str
    terminal_serial_number: str
    terminalid: int
    vu_nummer: str
    zipcode: str


class MerchantPortalApiControllerCreateData(MerchantPortalApiControllerCreateDataRequired, total=False):
    account_number: int
    additional_data: dict
    corporateuuid: str
    merchant_email: str
    merchant_phone_number: str
    password: str
    productid: str
    productid_acquirer: str
    sorting_code: int
    state: str
    terminalid_acquirer: str
    user_email: str
    user_phone_number: str
    username: str
    web_shop_url: str


class MerchantPortalCommonController(TypedDict):
    pass


class MerchantPortalCommonControllerLoadMatch(TypedDict):
    pass


class MerchantPortalPamContractController(TypedDict):
    language: str
    product_order_uuid: str


class MerchantPortalPamContractControllerCreateData(TypedDict):
    language: str
    product_order_uuid: str


class MerchantPortalPamDocumentControllerRequired(TypedDict):
    app_form_field_desc_uuid: str


class MerchantPortalPamDocumentController(MerchantPortalPamDocumentControllerRequired, total=False):
    package_order_uuid: str
    product_order_uuid: str


class MerchantPortalPamDocumentControllerCreateDataRequired(TypedDict):
    app_form_field_desc_uuid: str


class MerchantPortalPamDocumentControllerCreateData(MerchantPortalPamDocumentControllerCreateDataRequired, total=False):
    package_order_uuid: str
    product_order_uuid: str


class MerchantPortalPamFormControllerRequired(TypedDict):
    app_form_fields_desc_uuid: str
    language: str
    package_order_uuid: str
    reason_of_reopening: str


class MerchantPortalPamFormController(MerchantPortalPamFormControllerRequired, total=False):
    filter: dict
    package_order: dict
    package_uuid: str
    product_order: list
    product_order_uuid: str


class MerchantPortalPamFormControllerCreateDataRequired(TypedDict):
    app_form_fields_desc_uuid: str
    language: str
    package_order_uuid: str
    reason_of_reopening: str


class MerchantPortalPamFormControllerCreateData(MerchantPortalPamFormControllerCreateDataRequired, total=False):
    filter: dict
    package_order: dict
    package_uuid: str
    product_order: list
    product_order_uuid: str


class MerchantPortalPamMandatorControllerRequired(TypedDict):
    mandator_name: str
    package_uuid: str


class MerchantPortalPamMandatorController(MerchantPortalPamMandatorControllerRequired, total=False):
    client_secret: str
    notification_email: str


class MerchantPortalPamMandatorControllerCreateDataRequired(TypedDict):
    mandator_name: str
    package_uuid: str


class MerchantPortalPamMandatorControllerCreateData(MerchantPortalPamMandatorControllerCreateDataRequired, total=False):
    client_secret: str
    notification_email: str


class MerchantPortalPamMerchantControllerRequired(TypedDict):
    business_registration_number: str
    company_name: str
    corporate_uuid: str
    currency: str
    email: str
    language: str
    login: str
    mandator: str
    merchant_contract_number: str
    packageorderuuid: str
    phone_number: str
    productid_acquirer: str
    vu_nummer: str


class MerchantPortalPamMerchantController(MerchantPortalPamMerchantControllerRequired, total=False):
    additional_data: dict
    city: str
    country: str
    merchant_category_code: str
    merchant_name: str
    package_uuid: str
    postal_code: str
    region: str
    registration_number: str
    signature: str
    street: str
    terminal_id: list
    terminalid_acquirer: str


class MerchantPortalPamMerchantControllerCreateDataRequired(TypedDict):
    business_registration_number: str
    company_name: str
    corporate_uuid: str
    currency: str
    email: str
    language: str
    login: str
    mandator: str
    merchant_contract_number: str
    packageorderuuid: str
    phone_number: str
    productid_acquirer: str
    vu_nummer: str


class MerchantPortalPamMerchantControllerCreateData(MerchantPortalPamMerchantControllerCreateDataRequired, total=False):
    additional_data: dict
    city: str
    country: str
    merchant_category_code: str
    merchant_name: str
    package_uuid: str
    postal_code: str
    region: str
    registration_number: str
    signature: str
    street: str
    terminal_id: list
    terminalid_acquirer: str


class MerchantPortalPamPackageControllerRequired(TypedDict):
    language: str
    package_uuid: str


class MerchantPortalPamPackageController(MerchantPortalPamPackageControllerRequired, total=False):
    consumer_uuid: str
    corporate_uuid: str
    country: str
    description_key: str
    filter: dict
    name_key: str
    package_status: str
    pagination: dict
    sorting: dict


class MerchantPortalPamPackageControllerCreateDataRequired(TypedDict):
    language: str
    package_uuid: str


class MerchantPortalPamPackageControllerCreateData(MerchantPortalPamPackageControllerCreateDataRequired, total=False):
    consumer_uuid: str
    corporate_uuid: str
    country: str
    description_key: str
    filter: dict
    name_key: str
    package_status: str
    pagination: dict
    sorting: dict


class MerchantPortalPamProductControllerRequired(TypedDict):
    package_order_uuid: str
    product_order_uuid: str
    product_uuid: str
    reason_decline: str


class MerchantPortalPamProductController(MerchantPortalPamProductControllerRequired, total=False):
    consumer_uuid: str
    filter: dict
    language: str
    merchant_id: str
    pagination: dict
    sorting: dict


class MerchantPortalPamProductControllerCreateDataRequired(TypedDict):
    package_order_uuid: str
    product_order_uuid: str
    product_uuid: str
    reason_decline: str


class MerchantPortalPamProductControllerCreateData(MerchantPortalPamProductControllerCreateDataRequired, total=False):
    consumer_uuid: str
    filter: dict
    language: str
    merchant_id: str
    pagination: dict
    sorting: dict


class OutputAddProduct(TypedDict):
    package_uuid: str
    product_uui_d: list
    response_code: int
    response_message: str


class OutputAddProductCreateData(TypedDict):
    package_uuid: str
    product_uui_d: list
    response_code: int
    response_message: str


class OutputCreateProductRequired(TypedDict):
    allow_multiple_order: bool
    app_form_template_name: str
    contract_needed: bool
    description_key: str
    name_key: str
    prescreening_allowed: bool
    product_name: str
    response_code: int
    response_message: str
    terminal_template_name: str
    vendor_name: str
    xml_template_file: str


class OutputCreateProduct(OutputCreateProductRequired, total=False):
    acquirer_id: str
    credentials_needed: bool


class OutputCreateProductCreateDataRequired(TypedDict):
    allow_multiple_order: bool
    app_form_template_name: str
    contract_needed: bool
    description_key: str
    name_key: str
    prescreening_allowed: bool
    product_name: str
    response_code: int
    response_message: str
    terminal_template_name: str
    vendor_name: str
    xml_template_file: str


class OutputCreateProductCreateData(OutputCreateProductCreateDataRequired, total=False):
    acquirer_id: str
    credentials_needed: bool


class OutputDetailRequired(TypedDict):
    response_code: int
    response_message: str


class OutputDetail(OutputDetailRequired, total=False):
    detail: dict


class OutputDetailLoadMatch(TypedDict):
    id: str


class OutputListRequired(TypedDict):
    pagination: dict
    response_code: int
    response_message: str


class OutputList(OutputListRequired, total=False):
    item: list
    sorting: dict


class OutputListCreateDataRequired(TypedDict):
    pagination: dict
    response_code: int
    response_message: str


class OutputListCreateData(OutputListCreateDataRequired, total=False):
    item: list
    sorting: dict


class OutputMessage(TypedDict):
    response_code: int
    response_message: str


class OutputMessageLoadMatch(TypedDict):
    id: str


class OutputMoveTid(TypedDict):
    product_order_uui_d: list
    response_code: int
    response_message: str
    target_package_order_uuid: str
    target_product_order_uuid: str


class OutputMoveTidCreateData(TypedDict):
    product_order_uui_d: list
    response_code: int
    response_message: str
    target_package_order_uuid: str
    target_product_order_uuid: str


class OutputRemoveProduct(TypedDict):
    package_uuid: str
    product_uui_d: list
    response_code: int
    response_message: str


class OutputRemoveProductCreateData(TypedDict):
    package_uuid: str
    product_uui_d: list
    response_code: int
    response_message: str


class OutputStartRequired(TypedDict):
    response_code: int
    response_message: str


class OutputStart(OutputStartRequired, total=False):
    id: str


class OutputStartCreateDataRequired(TypedDict):
    response_code: int
    response_message: str


class OutputStartCreateData(OutputStartCreateDataRequired, total=False):
    id: str


class OutputStatusRequired(TypedDict):
    response_code: int
    response_message: str


class OutputStatus(OutputStatusRequired, total=False):
    percentage: int
    status: str


class OutputStatusLoadMatch(TypedDict):
    id: str


class OutputUpdateProductRequired(TypedDict):
    product_uuid: str
    response_code: int
    response_message: str


class OutputUpdateProduct(OutputUpdateProductRequired, total=False):
    allow_multiple_order: bool
    app_form_name: str
    contract_needed: bool
    credentials_needed: bool
    description_key: str
    name_key: str
    prescreening_allowed: bool
    product_name: str
    product_status: str
    vendor_name: str


class OutputUpdateProductCreateDataRequired(TypedDict):
    product_uuid: str
    response_code: int
    response_message: str


class OutputUpdateProductCreateData(OutputUpdateProductCreateDataRequired, total=False):
    allow_multiple_order: bool
    app_form_name: str
    contract_needed: bool
    credentials_needed: bool
    description_key: str
    name_key: str
    prescreening_allowed: bool
    product_name: str
    product_status: str
    vendor_name: str
