// Typed reference models for the BluefinTecsMerchantPortal SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These records are documentation/DX reference shapes ONLY. The SDK ops take
// and return the loose object model (Dictionary<string, object?> / object?) at
// runtime, so these types are not wired into the op signatures — use them to
// describe a payload before converting it to a dictionary. Optional (req:false)
// keys are modelled as nullable properties.

namespace BluefinTecsMerchantPortalSdk.Types;

public record MerchantPortalApiController
{
    public long? account_number { get; init; }
    public Dictionary<string, object?>? additional_data { get; init; }
    public string business_reg_number { get; init; }
    public string city { get; init; }
    public string? corporateuuid { get; init; }
    public string country { get; init; }
    public string currency { get; init; }
    public long merchant_category_code { get; init; }
    public string? merchant_email { get; init; }
    public string merchant_name { get; init; }
    public string? merchant_phone_number { get; init; }
    public string packageid { get; init; }
    public string packageorderuuid { get; init; }
    public string? password { get; init; }
    public string? productid { get; init; }
    public string? productid_acquirer { get; init; }
    public string reason_deactivation { get; init; }
    public string reason_reactivation { get; init; }
    public long? sorting_code { get; init; }
    public string? state { get; init; }
    public string street { get; init; }
    public string terminal_country_code { get; init; }
    public string terminal_language_code { get; init; }
    public string terminal_location { get; init; }
    public string terminal_serial_number { get; init; }
    public long terminalid { get; init; }
    public string? terminalid_acquirer { get; init; }
    public string? user_email { get; init; }
    public string? user_phone_number { get; init; }
    public string? username { get; init; }
    public string vu_nummer { get; init; }
    public string? web_shop_url { get; init; }
    public string zipcode { get; init; }
}

public record MerchantPortalApiControllerCreateData
{
    public long? account_number { get; init; }
    public Dictionary<string, object?>? additional_data { get; init; }
    public string business_reg_number { get; init; }
    public string city { get; init; }
    public string? corporateuuid { get; init; }
    public string country { get; init; }
    public string currency { get; init; }
    public long merchant_category_code { get; init; }
    public string? merchant_email { get; init; }
    public string merchant_name { get; init; }
    public string? merchant_phone_number { get; init; }
    public string packageid { get; init; }
    public string packageorderuuid { get; init; }
    public string? password { get; init; }
    public string? productid { get; init; }
    public string? productid_acquirer { get; init; }
    public string reason_deactivation { get; init; }
    public string reason_reactivation { get; init; }
    public long? sorting_code { get; init; }
    public string? state { get; init; }
    public string street { get; init; }
    public string terminal_country_code { get; init; }
    public string terminal_language_code { get; init; }
    public string terminal_location { get; init; }
    public string terminal_serial_number { get; init; }
    public long terminalid { get; init; }
    public string? terminalid_acquirer { get; init; }
    public string? user_email { get; init; }
    public string? user_phone_number { get; init; }
    public string? username { get; init; }
    public string vu_nummer { get; init; }
    public string? web_shop_url { get; init; }
    public string zipcode { get; init; }
}

public record MerchantPortalCommonController();

public record MerchantPortalCommonControllerLoadMatch();

public record MerchantPortalPamContractController
{
    public string language { get; init; }
    public string productOrderUUID { get; init; }
}

public record MerchantPortalPamContractControllerCreateData
{
    public string language { get; init; }
    public string productOrderUUID { get; init; }
}

public record MerchantPortalPamDocumentController
{
    public string appFormFieldDescUUID { get; init; }
    public string? packageOrderUUID { get; init; }
    public string? productOrderUUID { get; init; }
}

public record MerchantPortalPamDocumentControllerCreateData
{
    public string appFormFieldDescUUID { get; init; }
    public string? packageOrderUUID { get; init; }
    public string? productOrderUUID { get; init; }
}

public record MerchantPortalPamFormController
{
    public string appFormFieldsDescUUID { get; init; }
    public Dictionary<string, object?>? filter { get; init; }
    public string language { get; init; }
    public Dictionary<string, object?>? packageOrder { get; init; }
    public string packageOrderUUID { get; init; }
    public string? packageUUID { get; init; }
    public string? productOrderUUID { get; init; }
    public List<object?>? productOrders { get; init; }
    public string reasonOfReopening { get; init; }
}

public record MerchantPortalPamFormControllerCreateData
{
    public string appFormFieldsDescUUID { get; init; }
    public Dictionary<string, object?>? filter { get; init; }
    public string language { get; init; }
    public Dictionary<string, object?>? packageOrder { get; init; }
    public string packageOrderUUID { get; init; }
    public string? packageUUID { get; init; }
    public string? productOrderUUID { get; init; }
    public List<object?>? productOrders { get; init; }
    public string reasonOfReopening { get; init; }
}

public record MerchantPortalPamMandatorController
{
    public string? clientSecret { get; init; }
    public string mandatorName { get; init; }
    public string? notificationEmail { get; init; }
    public string packageUUID { get; init; }
}

public record MerchantPortalPamMandatorControllerCreateData
{
    public string? clientSecret { get; init; }
    public string mandatorName { get; init; }
    public string? notificationEmail { get; init; }
    public string packageUUID { get; init; }
}

public record MerchantPortalPamMerchantController
{
    public Dictionary<string, object?>? additional_data { get; init; }
    public string businessRegistrationNumber { get; init; }
    public string? city { get; init; }
    public string companyName { get; init; }
    public string corporateUUID { get; init; }
    public string? country { get; init; }
    public string currency { get; init; }
    public string email { get; init; }
    public string language { get; init; }
    public string login { get; init; }
    public string mandator { get; init; }
    public string merchantContractNumber { get; init; }
    public string? merchantName { get; init; }
    public string? merchant_category_code { get; init; }
    public string? packageUUID { get; init; }
    public string packageorderuuid { get; init; }
    public string phoneNumber { get; init; }
    public string? postalCode { get; init; }
    public string productid_acquirer { get; init; }
    public string? region { get; init; }
    public string? registrationNumber { get; init; }
    public string? signature { get; init; }
    public string? street { get; init; }
    public List<object?>? terminalIds { get; init; }
    public string? terminalid_acquirer { get; init; }
    public string vu_nummer { get; init; }
}

public record MerchantPortalPamMerchantControllerCreateData
{
    public Dictionary<string, object?>? additional_data { get; init; }
    public string businessRegistrationNumber { get; init; }
    public string? city { get; init; }
    public string companyName { get; init; }
    public string corporateUUID { get; init; }
    public string? country { get; init; }
    public string currency { get; init; }
    public string email { get; init; }
    public string language { get; init; }
    public string login { get; init; }
    public string mandator { get; init; }
    public string merchantContractNumber { get; init; }
    public string? merchantName { get; init; }
    public string? merchant_category_code { get; init; }
    public string? packageUUID { get; init; }
    public string packageorderuuid { get; init; }
    public string phoneNumber { get; init; }
    public string? postalCode { get; init; }
    public string productid_acquirer { get; init; }
    public string? region { get; init; }
    public string? registrationNumber { get; init; }
    public string? signature { get; init; }
    public string? street { get; init; }
    public List<object?>? terminalIds { get; init; }
    public string? terminalid_acquirer { get; init; }
    public string vu_nummer { get; init; }
}

public record MerchantPortalPamPackageController
{
    public string? consumerUUID { get; init; }
    public string? corporateUUID { get; init; }
    public string? country { get; init; }
    public string? descriptionKey { get; init; }
    public Dictionary<string, object?>? filter { get; init; }
    public string language { get; init; }
    public string? nameKey { get; init; }
    public string? packageStatus { get; init; }
    public string packageUUID { get; init; }
    public Dictionary<string, object?>? pagination { get; init; }
    public Dictionary<string, object?>? sorting { get; init; }
}

public record MerchantPortalPamPackageControllerCreateData
{
    public string? consumerUUID { get; init; }
    public string? corporateUUID { get; init; }
    public string? country { get; init; }
    public string? descriptionKey { get; init; }
    public Dictionary<string, object?>? filter { get; init; }
    public string language { get; init; }
    public string? nameKey { get; init; }
    public string? packageStatus { get; init; }
    public string packageUUID { get; init; }
    public Dictionary<string, object?>? pagination { get; init; }
    public Dictionary<string, object?>? sorting { get; init; }
}

public record MerchantPortalPamProductController
{
    public string? consumerUUID { get; init; }
    public Dictionary<string, object?>? filter { get; init; }
    public string? language { get; init; }
    public string? merchantID { get; init; }
    public string packageOrderUUID { get; init; }
    public Dictionary<string, object?>? pagination { get; init; }
    public string productOrderUUID { get; init; }
    public string productUUID { get; init; }
    public string reason_decline { get; init; }
    public Dictionary<string, object?>? sorting { get; init; }
}

public record MerchantPortalPamProductControllerCreateData
{
    public string? consumerUUID { get; init; }
    public Dictionary<string, object?>? filter { get; init; }
    public string? language { get; init; }
    public string? merchantID { get; init; }
    public string packageOrderUUID { get; init; }
    public Dictionary<string, object?>? pagination { get; init; }
    public string productOrderUUID { get; init; }
    public string productUUID { get; init; }
    public string reason_decline { get; init; }
    public Dictionary<string, object?>? sorting { get; init; }
}

public record OutputAddProduct
{
    public string packageUUID { get; init; }
    public List<object?> productUUIDs { get; init; }
    public long responseCode { get; init; }
    public string responseMessage { get; init; }
}

public record OutputAddProductCreateData
{
    public string packageUUID { get; init; }
    public List<object?> productUUIDs { get; init; }
    public long responseCode { get; init; }
    public string responseMessage { get; init; }
}

public record OutputCreateProduct
{
    public string? acquirerId { get; init; }
    public bool allowMultipleOrders { get; init; }
    public string appFormTemplateName { get; init; }
    public bool contractNeeded { get; init; }
    public bool? credentialsNeeded { get; init; }
    public string descriptionKey { get; init; }
    public string nameKey { get; init; }
    public bool prescreeningAllowed { get; init; }
    public string productName { get; init; }
    public long responseCode { get; init; }
    public string responseMessage { get; init; }
    public string terminalTemplateName { get; init; }
    public string vendorName { get; init; }
    public string xmlTemplateFile { get; init; }
}

public record OutputCreateProductCreateData
{
    public string? acquirerId { get; init; }
    public bool allowMultipleOrders { get; init; }
    public string appFormTemplateName { get; init; }
    public bool contractNeeded { get; init; }
    public bool? credentialsNeeded { get; init; }
    public string descriptionKey { get; init; }
    public string nameKey { get; init; }
    public bool prescreeningAllowed { get; init; }
    public string productName { get; init; }
    public long responseCode { get; init; }
    public string responseMessage { get; init; }
    public string terminalTemplateName { get; init; }
    public string vendorName { get; init; }
    public string xmlTemplateFile { get; init; }
}

public record OutputDetail
{
    public Dictionary<string, object?>? batch { get; init; }
    public Dictionary<string, object?>? lines { get; init; }
    public Dictionary<string, object?>? progress { get; init; }
}

public record OutputDetailLoadMatch
{
    public string id { get; init; }
}

public record OutputList
{
    public List<object?>? items { get; init; }
    public Dictionary<string, object?> pagination { get; init; }
    public long responseCode { get; init; }
    public string responseMessage { get; init; }
    public Dictionary<string, object?>? sorting { get; init; }
}

public record OutputListCreateData
{
    public List<object?>? items { get; init; }
    public Dictionary<string, object?> pagination { get; init; }
    public long responseCode { get; init; }
    public string responseMessage { get; init; }
    public Dictionary<string, object?>? sorting { get; init; }
}

public record OutputMessage
{
    public long responseCode { get; init; }
    public string responseMessage { get; init; }
}

public record OutputMessageLoadMatch
{
    public string id { get; init; }
}

public record OutputMoveTid
{
    public List<object?> productOrderUUIDs { get; init; }
    public long responseCode { get; init; }
    public string responseMessage { get; init; }
    public string targetPackageOrderUUID { get; init; }
    public string targetProductOrderUUID { get; init; }
}

public record OutputMoveTidCreateData
{
    public List<object?> productOrderUUIDs { get; init; }
    public long responseCode { get; init; }
    public string responseMessage { get; init; }
    public string targetPackageOrderUUID { get; init; }
    public string targetProductOrderUUID { get; init; }
}

public record OutputRemoveProduct
{
    public string packageUUID { get; init; }
    public List<object?> productUUIDs { get; init; }
    public long responseCode { get; init; }
    public string responseMessage { get; init; }
}

public record OutputRemoveProductCreateData
{
    public string packageUUID { get; init; }
    public List<object?> productUUIDs { get; init; }
    public long responseCode { get; init; }
    public string responseMessage { get; init; }
}

public record OutputStart
{
    public string? id { get; init; }
    public long responseCode { get; init; }
    public string responseMessage { get; init; }
}

public record OutputStartCreateData
{
    public string? id { get; init; }
    public long responseCode { get; init; }
    public string responseMessage { get; init; }
}

public record OutputStatus
{
    public long? percentage { get; init; }
    public long responseCode { get; init; }
    public string responseMessage { get; init; }
    public string? status { get; init; }
}

public record OutputStatusLoadMatch
{
    public string id { get; init; }
}

public record OutputUpdateProduct
{
    public bool? allowMultipleOrders { get; init; }
    public string? appFormName { get; init; }
    public bool? contractNeeded { get; init; }
    public bool? credentialsNeeded { get; init; }
    public string? descriptionKey { get; init; }
    public string? nameKey { get; init; }
    public bool? prescreeningAllowed { get; init; }
    public string? productName { get; init; }
    public string? productStatus { get; init; }
    public string productUUID { get; init; }
    public long responseCode { get; init; }
    public string responseMessage { get; init; }
    public string? vendorName { get; init; }
}

public record OutputUpdateProductCreateData
{
    public bool? allowMultipleOrders { get; init; }
    public string? appFormName { get; init; }
    public bool? contractNeeded { get; init; }
    public bool? credentialsNeeded { get; init; }
    public string? descriptionKey { get; init; }
    public string? nameKey { get; init; }
    public bool? prescreeningAllowed { get; init; }
    public string? productName { get; init; }
    public string? productStatus { get; init; }
    public string productUUID { get; init; }
    public long responseCode { get; init; }
    public string responseMessage { get; init; }
    public string? vendorName { get; init; }
}

