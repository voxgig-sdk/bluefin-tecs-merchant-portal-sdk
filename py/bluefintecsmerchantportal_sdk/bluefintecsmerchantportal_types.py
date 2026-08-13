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
    productOrderUUID: str


class MerchantPortalPamContractControllerCreateData(TypedDict):
    language: str
    productOrderUUID: str


class MerchantPortalPamDocumentControllerRequired(TypedDict):
    appFormFieldDescUUID: str


class MerchantPortalPamDocumentController(MerchantPortalPamDocumentControllerRequired, total=False):
    packageOrderUUID: str
    productOrderUUID: str


class MerchantPortalPamDocumentControllerCreateDataRequired(TypedDict):
    appFormFieldDescUUID: str


class MerchantPortalPamDocumentControllerCreateData(MerchantPortalPamDocumentControllerCreateDataRequired, total=False):
    packageOrderUUID: str
    productOrderUUID: str


class MerchantPortalPamFormControllerRequired(TypedDict):
    appFormFieldsDescUUID: str
    language: str
    packageOrderUUID: str
    reasonOfReopening: str


class MerchantPortalPamFormController(MerchantPortalPamFormControllerRequired, total=False):
    filter: dict
    packageOrder: dict
    packageUUID: str
    productOrderUUID: str
    productOrders: list


class MerchantPortalPamFormControllerCreateDataRequired(TypedDict):
    appFormFieldsDescUUID: str
    language: str
    packageOrderUUID: str
    reasonOfReopening: str


class MerchantPortalPamFormControllerCreateData(MerchantPortalPamFormControllerCreateDataRequired, total=False):
    filter: dict
    packageOrder: dict
    packageUUID: str
    productOrderUUID: str
    productOrders: list


class MerchantPortalPamMandatorControllerRequired(TypedDict):
    mandatorName: str
    packageUUID: str


class MerchantPortalPamMandatorController(MerchantPortalPamMandatorControllerRequired, total=False):
    clientSecret: str
    notificationEmail: str


class MerchantPortalPamMandatorControllerCreateDataRequired(TypedDict):
    mandatorName: str
    packageUUID: str


class MerchantPortalPamMandatorControllerCreateData(MerchantPortalPamMandatorControllerCreateDataRequired, total=False):
    clientSecret: str
    notificationEmail: str


class MerchantPortalPamMerchantControllerRequired(TypedDict):
    businessRegistrationNumber: str
    companyName: str
    corporateUUID: str
    currency: str
    email: str
    language: str
    login: str
    mandator: str
    merchantContractNumber: str
    packageorderuuid: str
    phoneNumber: str
    productid_acquirer: str
    vu_nummer: str


class MerchantPortalPamMerchantController(MerchantPortalPamMerchantControllerRequired, total=False):
    additional_data: dict
    city: str
    country: str
    merchantName: str
    merchant_category_code: str
    packageUUID: str
    postalCode: str
    region: str
    registrationNumber: str
    signature: str
    street: str
    terminalIds: list
    terminalid_acquirer: str


class MerchantPortalPamMerchantControllerCreateDataRequired(TypedDict):
    businessRegistrationNumber: str
    companyName: str
    corporateUUID: str
    currency: str
    email: str
    language: str
    login: str
    mandator: str
    merchantContractNumber: str
    packageorderuuid: str
    phoneNumber: str
    productid_acquirer: str
    vu_nummer: str


class MerchantPortalPamMerchantControllerCreateData(MerchantPortalPamMerchantControllerCreateDataRequired, total=False):
    additional_data: dict
    city: str
    country: str
    merchantName: str
    merchant_category_code: str
    packageUUID: str
    postalCode: str
    region: str
    registrationNumber: str
    signature: str
    street: str
    terminalIds: list
    terminalid_acquirer: str


class MerchantPortalPamPackageControllerRequired(TypedDict):
    language: str
    packageUUID: str


class MerchantPortalPamPackageController(MerchantPortalPamPackageControllerRequired, total=False):
    consumerUUID: str
    corporateUUID: str
    country: str
    descriptionKey: str
    filter: dict
    nameKey: str
    packageStatus: str
    pagination: dict
    sorting: dict


class MerchantPortalPamPackageControllerCreateDataRequired(TypedDict):
    language: str
    packageUUID: str


class MerchantPortalPamPackageControllerCreateData(MerchantPortalPamPackageControllerCreateDataRequired, total=False):
    consumerUUID: str
    corporateUUID: str
    country: str
    descriptionKey: str
    filter: dict
    nameKey: str
    packageStatus: str
    pagination: dict
    sorting: dict


class MerchantPortalPamProductControllerRequired(TypedDict):
    packageOrderUUID: str
    productOrderUUID: str
    productUUID: str
    reason_decline: str


class MerchantPortalPamProductController(MerchantPortalPamProductControllerRequired, total=False):
    consumerUUID: str
    filter: dict
    language: str
    merchantID: str
    pagination: dict
    sorting: dict


class MerchantPortalPamProductControllerCreateDataRequired(TypedDict):
    packageOrderUUID: str
    productOrderUUID: str
    productUUID: str
    reason_decline: str


class MerchantPortalPamProductControllerCreateData(MerchantPortalPamProductControllerCreateDataRequired, total=False):
    consumerUUID: str
    filter: dict
    language: str
    merchantID: str
    pagination: dict
    sorting: dict


class OutputAddProduct(TypedDict):
    packageUUID: str
    productUUIDs: list
    responseCode: int
    responseMessage: str


class OutputAddProductCreateData(TypedDict):
    packageUUID: str
    productUUIDs: list
    responseCode: int
    responseMessage: str


class OutputCreateProductRequired(TypedDict):
    allowMultipleOrders: bool
    appFormTemplateName: str
    contractNeeded: bool
    descriptionKey: str
    nameKey: str
    prescreeningAllowed: bool
    productName: str
    responseCode: int
    responseMessage: str
    terminalTemplateName: str
    vendorName: str
    xmlTemplateFile: str


class OutputCreateProduct(OutputCreateProductRequired, total=False):
    acquirerId: str
    credentialsNeeded: bool


class OutputCreateProductCreateDataRequired(TypedDict):
    allowMultipleOrders: bool
    appFormTemplateName: str
    contractNeeded: bool
    descriptionKey: str
    nameKey: str
    prescreeningAllowed: bool
    productName: str
    responseCode: int
    responseMessage: str
    terminalTemplateName: str
    vendorName: str
    xmlTemplateFile: str


class OutputCreateProductCreateData(OutputCreateProductCreateDataRequired, total=False):
    acquirerId: str
    credentialsNeeded: bool


class OutputDetail(TypedDict, total=False):
    batch: dict
    lines: dict
    progress: dict


class OutputDetailLoadMatch(TypedDict):
    id: str


class OutputListRequired(TypedDict):
    pagination: dict
    responseCode: int
    responseMessage: str


class OutputList(OutputListRequired, total=False):
    items: list
    sorting: dict


class OutputListCreateDataRequired(TypedDict):
    pagination: dict
    responseCode: int
    responseMessage: str


class OutputListCreateData(OutputListCreateDataRequired, total=False):
    items: list
    sorting: dict


class OutputMessage(TypedDict):
    responseCode: int
    responseMessage: str


class OutputMessageLoadMatch(TypedDict):
    id: str


class OutputMoveTid(TypedDict):
    productOrderUUIDs: list
    responseCode: int
    responseMessage: str
    targetPackageOrderUUID: str
    targetProductOrderUUID: str


class OutputMoveTidCreateData(TypedDict):
    productOrderUUIDs: list
    responseCode: int
    responseMessage: str
    targetPackageOrderUUID: str
    targetProductOrderUUID: str


class OutputRemoveProduct(TypedDict):
    packageUUID: str
    productUUIDs: list
    responseCode: int
    responseMessage: str


class OutputRemoveProductCreateData(TypedDict):
    packageUUID: str
    productUUIDs: list
    responseCode: int
    responseMessage: str


class OutputStartRequired(TypedDict):
    responseCode: int
    responseMessage: str


class OutputStart(OutputStartRequired, total=False):
    id: str


class OutputStartCreateDataRequired(TypedDict):
    responseCode: int
    responseMessage: str


class OutputStartCreateData(OutputStartCreateDataRequired, total=False):
    id: str


class OutputStatusRequired(TypedDict):
    responseCode: int
    responseMessage: str


class OutputStatus(OutputStatusRequired, total=False):
    percentage: int
    status: str


class OutputStatusLoadMatch(TypedDict):
    id: str


class OutputUpdateProductRequired(TypedDict):
    productUUID: str
    responseCode: int
    responseMessage: str


class OutputUpdateProduct(OutputUpdateProductRequired, total=False):
    allowMultipleOrders: bool
    appFormName: str
    contractNeeded: bool
    credentialsNeeded: bool
    descriptionKey: str
    nameKey: str
    prescreeningAllowed: bool
    productName: str
    productStatus: str
    vendorName: str


class OutputUpdateProductCreateDataRequired(TypedDict):
    productUUID: str
    responseCode: int
    responseMessage: str


class OutputUpdateProductCreateData(OutputUpdateProductCreateDataRequired, total=False):
    allowMultipleOrders: bool
    appFormName: str
    contractNeeded: bool
    credentialsNeeded: bool
    descriptionKey: str
    nameKey: str
    prescreeningAllowed: bool
    productName: str
    productStatus: str
    vendorName: str
