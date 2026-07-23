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
    public string product_order_uuid { get; init; }
}

public record MerchantPortalPamContractControllerCreateData
{
    public string language { get; init; }
    public string product_order_uuid { get; init; }
}

public record MerchantPortalPamDocumentController
{
    public string app_form_field_desc_uuid { get; init; }
    public string? package_order_uuid { get; init; }
    public string? product_order_uuid { get; init; }
}

public record MerchantPortalPamDocumentControllerCreateData
{
    public string app_form_field_desc_uuid { get; init; }
    public string? package_order_uuid { get; init; }
    public string? product_order_uuid { get; init; }
}

public record MerchantPortalPamFormController
{
    public string app_form_fields_desc_uuid { get; init; }
    public Dictionary<string, object?>? filter { get; init; }
    public string language { get; init; }
    public Dictionary<string, object?>? package_order { get; init; }
    public string package_order_uuid { get; init; }
    public string? package_uuid { get; init; }
    public List<object?>? product_order { get; init; }
    public string? product_order_uuid { get; init; }
    public string reason_of_reopening { get; init; }
}

public record MerchantPortalPamFormControllerCreateData
{
    public string app_form_fields_desc_uuid { get; init; }
    public Dictionary<string, object?>? filter { get; init; }
    public string language { get; init; }
    public Dictionary<string, object?>? package_order { get; init; }
    public string package_order_uuid { get; init; }
    public string? package_uuid { get; init; }
    public List<object?>? product_order { get; init; }
    public string? product_order_uuid { get; init; }
    public string reason_of_reopening { get; init; }
}

public record MerchantPortalPamMandatorController
{
    public string? client_secret { get; init; }
    public string mandator_name { get; init; }
    public string? notification_email { get; init; }
    public string package_uuid { get; init; }
}

public record MerchantPortalPamMandatorControllerCreateData
{
    public string? client_secret { get; init; }
    public string mandator_name { get; init; }
    public string? notification_email { get; init; }
    public string package_uuid { get; init; }
}

public record MerchantPortalPamMerchantController
{
    public Dictionary<string, object?>? additional_data { get; init; }
    public string business_registration_number { get; init; }
    public string? city { get; init; }
    public string company_name { get; init; }
    public string corporate_uuid { get; init; }
    public string? country { get; init; }
    public string currency { get; init; }
    public string email { get; init; }
    public string language { get; init; }
    public string login { get; init; }
    public string mandator { get; init; }
    public string? merchant_category_code { get; init; }
    public string merchant_contract_number { get; init; }
    public string? merchant_name { get; init; }
    public string? package_uuid { get; init; }
    public string packageorderuuid { get; init; }
    public string phone_number { get; init; }
    public string? postal_code { get; init; }
    public string productid_acquirer { get; init; }
    public string? region { get; init; }
    public string? registration_number { get; init; }
    public string? signature { get; init; }
    public string? street { get; init; }
    public List<object?>? terminal_id { get; init; }
    public string? terminalid_acquirer { get; init; }
    public string vu_nummer { get; init; }
}

public record MerchantPortalPamMerchantControllerCreateData
{
    public Dictionary<string, object?>? additional_data { get; init; }
    public string business_registration_number { get; init; }
    public string? city { get; init; }
    public string company_name { get; init; }
    public string corporate_uuid { get; init; }
    public string? country { get; init; }
    public string currency { get; init; }
    public string email { get; init; }
    public string language { get; init; }
    public string login { get; init; }
    public string mandator { get; init; }
    public string? merchant_category_code { get; init; }
    public string merchant_contract_number { get; init; }
    public string? merchant_name { get; init; }
    public string? package_uuid { get; init; }
    public string packageorderuuid { get; init; }
    public string phone_number { get; init; }
    public string? postal_code { get; init; }
    public string productid_acquirer { get; init; }
    public string? region { get; init; }
    public string? registration_number { get; init; }
    public string? signature { get; init; }
    public string? street { get; init; }
    public List<object?>? terminal_id { get; init; }
    public string? terminalid_acquirer { get; init; }
    public string vu_nummer { get; init; }
}

public record MerchantPortalPamPackageController
{
    public string? consumer_uuid { get; init; }
    public string? corporate_uuid { get; init; }
    public string? country { get; init; }
    public string? description_key { get; init; }
    public Dictionary<string, object?>? filter { get; init; }
    public string language { get; init; }
    public string? name_key { get; init; }
    public string? package_status { get; init; }
    public string package_uuid { get; init; }
    public Dictionary<string, object?>? pagination { get; init; }
    public Dictionary<string, object?>? sorting { get; init; }
}

public record MerchantPortalPamPackageControllerCreateData
{
    public string? consumer_uuid { get; init; }
    public string? corporate_uuid { get; init; }
    public string? country { get; init; }
    public string? description_key { get; init; }
    public Dictionary<string, object?>? filter { get; init; }
    public string language { get; init; }
    public string? name_key { get; init; }
    public string? package_status { get; init; }
    public string package_uuid { get; init; }
    public Dictionary<string, object?>? pagination { get; init; }
    public Dictionary<string, object?>? sorting { get; init; }
}

public record MerchantPortalPamProductController
{
    public string? consumer_uuid { get; init; }
    public Dictionary<string, object?>? filter { get; init; }
    public string? language { get; init; }
    public string? merchant_id { get; init; }
    public string package_order_uuid { get; init; }
    public Dictionary<string, object?>? pagination { get; init; }
    public string product_order_uuid { get; init; }
    public string product_uuid { get; init; }
    public string reason_decline { get; init; }
    public Dictionary<string, object?>? sorting { get; init; }
}

public record MerchantPortalPamProductControllerCreateData
{
    public string? consumer_uuid { get; init; }
    public Dictionary<string, object?>? filter { get; init; }
    public string? language { get; init; }
    public string? merchant_id { get; init; }
    public string package_order_uuid { get; init; }
    public Dictionary<string, object?>? pagination { get; init; }
    public string product_order_uuid { get; init; }
    public string product_uuid { get; init; }
    public string reason_decline { get; init; }
    public Dictionary<string, object?>? sorting { get; init; }
}

public record OutputAddProduct
{
    public string package_uuid { get; init; }
    public List<object?> product_uui_d { get; init; }
    public long response_code { get; init; }
    public string response_message { get; init; }
}

public record OutputAddProductCreateData
{
    public string package_uuid { get; init; }
    public List<object?> product_uui_d { get; init; }
    public long response_code { get; init; }
    public string response_message { get; init; }
}

public record OutputCreateProduct
{
    public string? acquirer_id { get; init; }
    public bool allow_multiple_order { get; init; }
    public string app_form_template_name { get; init; }
    public bool contract_needed { get; init; }
    public bool? credentials_needed { get; init; }
    public string description_key { get; init; }
    public string name_key { get; init; }
    public bool prescreening_allowed { get; init; }
    public string product_name { get; init; }
    public long response_code { get; init; }
    public string response_message { get; init; }
    public string terminal_template_name { get; init; }
    public string vendor_name { get; init; }
    public string xml_template_file { get; init; }
}

public record OutputCreateProductCreateData
{
    public string? acquirer_id { get; init; }
    public bool allow_multiple_order { get; init; }
    public string app_form_template_name { get; init; }
    public bool contract_needed { get; init; }
    public bool? credentials_needed { get; init; }
    public string description_key { get; init; }
    public string name_key { get; init; }
    public bool prescreening_allowed { get; init; }
    public string product_name { get; init; }
    public long response_code { get; init; }
    public string response_message { get; init; }
    public string terminal_template_name { get; init; }
    public string vendor_name { get; init; }
    public string xml_template_file { get; init; }
}

public record OutputDetail
{
    public Dictionary<string, object?>? detail { get; init; }
    public long response_code { get; init; }
    public string response_message { get; init; }
}

public record OutputDetailLoadMatch
{
    public string id { get; init; }
}

public record OutputList
{
    public List<object?>? item { get; init; }
    public Dictionary<string, object?> pagination { get; init; }
    public long response_code { get; init; }
    public string response_message { get; init; }
    public Dictionary<string, object?>? sorting { get; init; }
}

public record OutputListCreateData
{
    public List<object?>? item { get; init; }
    public Dictionary<string, object?> pagination { get; init; }
    public long response_code { get; init; }
    public string response_message { get; init; }
    public Dictionary<string, object?>? sorting { get; init; }
}

public record OutputMessage
{
    public long response_code { get; init; }
    public string response_message { get; init; }
}

public record OutputMessageLoadMatch
{
    public string id { get; init; }
}

public record OutputMoveTid
{
    public List<object?> product_order_uui_d { get; init; }
    public long response_code { get; init; }
    public string response_message { get; init; }
    public string target_package_order_uuid { get; init; }
    public string target_product_order_uuid { get; init; }
}

public record OutputMoveTidCreateData
{
    public List<object?> product_order_uui_d { get; init; }
    public long response_code { get; init; }
    public string response_message { get; init; }
    public string target_package_order_uuid { get; init; }
    public string target_product_order_uuid { get; init; }
}

public record OutputRemoveProduct
{
    public string package_uuid { get; init; }
    public List<object?> product_uui_d { get; init; }
    public long response_code { get; init; }
    public string response_message { get; init; }
}

public record OutputRemoveProductCreateData
{
    public string package_uuid { get; init; }
    public List<object?> product_uui_d { get; init; }
    public long response_code { get; init; }
    public string response_message { get; init; }
}

public record OutputStart
{
    public string? id { get; init; }
    public long response_code { get; init; }
    public string response_message { get; init; }
}

public record OutputStartCreateData
{
    public string? id { get; init; }
    public long response_code { get; init; }
    public string response_message { get; init; }
}

public record OutputStatus
{
    public long? percentage { get; init; }
    public long response_code { get; init; }
    public string response_message { get; init; }
    public string? status { get; init; }
}

public record OutputStatusLoadMatch
{
    public string id { get; init; }
}

public record OutputUpdateProduct
{
    public bool? allow_multiple_order { get; init; }
    public string? app_form_name { get; init; }
    public bool? contract_needed { get; init; }
    public bool? credentials_needed { get; init; }
    public string? description_key { get; init; }
    public string? name_key { get; init; }
    public bool? prescreening_allowed { get; init; }
    public string? product_name { get; init; }
    public string? product_status { get; init; }
    public string product_uuid { get; init; }
    public long response_code { get; init; }
    public string response_message { get; init; }
    public string? vendor_name { get; init; }
}

public record OutputUpdateProductCreateData
{
    public bool? allow_multiple_order { get; init; }
    public string? app_form_name { get; init; }
    public bool? contract_needed { get; init; }
    public bool? credentials_needed { get; init; }
    public string? description_key { get; init; }
    public string? name_key { get; init; }
    public bool? prescreening_allowed { get; init; }
    public string? product_name { get; init; }
    public string? product_status { get; init; }
    public string product_uuid { get; init; }
    public long response_code { get; init; }
    public string response_message { get; init; }
    public string? vendor_name { get; init; }
}

