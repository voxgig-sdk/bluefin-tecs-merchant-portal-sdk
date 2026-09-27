// BluefinTecsMerchantPortal SDK - generated model configuration and feature
// factory. GENERATED from the API model - do not edit by hand.

namespace BluefinTecsMerchantPortalSdk;

public static class SdkConfig
{
    public static Dictionary<string, object?> MakeConfig()
    {
        return new Dictionary<string, object?>
        {
            ["main"] = new Dictionary<string, object?>
            {
                ["name"] = "BluefinTecsMerchantPortal",
                ["slug"] = "bluefin-tecs-merchant-portal",
                ["version"] = "0.1.1",
                ["target"] = "csharp",
            },
            ["feature"] = new Dictionary<string, object?>
            {
                ["audit"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["actor"] = "anonymous",
                        ["max"] = 1000,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["now"] = "`$FUNCTION`",
                        ["sink"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["clienttrack"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["clientVersion"] = "0.0.1",
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["clientName"] = "`$STRING`",
                        ["clientVersion"] = "`$STRING`",
                        ["headers"] = "`$MAP`",
                        ["idgen"] = "`$FUNCTION`",
                        ["sessionId"] = "`$STRING`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["debug"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["max"] = 100,
                        ["redact"] = new List<object?>
                        {
                            "authorization",
                            "cookie",
                            "set-cookie",
                            "api-key",
                            "apikey",
                            "x-api-key",
                            "idempotency-key",
                        },
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["now"] = "`$FUNCTION`",
                        ["onEntry"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["idempotency"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["header"] = "Idempotency-Key",
                        ["methods"] = new List<object?>
                        {
                            "POST",
                            "PUT",
                            "PATCH",
                            "DELETE",
                        },
                        ["ops"] = new List<object?>
                        {
                            "create",
                            "update",
                            "remove",
                        },
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["keygen"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["log"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = true,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["level"] = "`$STRING`",
                        ["logger"] = "`$ANY`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["metrics"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["now"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["paging"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["afterVar"] = "after",
                        ["cursorParam"] = "cursor",
                        ["firstVar"] = "first",
                        ["limitParam"] = "limit",
                        ["pageParam"] = "page",
                        ["startPage"] = 1,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["limit"] = "`$NUMBER`",
                        ["ops"] = "`$LIST`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["ratelimit"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["burst"] = 5,
                        ["rate"] = 5,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["now"] = "`$FUNCTION`",
                        ["sleep"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "wrap",
                },
                ["retry"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["factor"] = 2,
                        ["maxDelay"] = 2000,
                        ["minDelay"] = 50,
                        ["retries"] = 2,
                        ["statuses"] = new List<object?>
                        {
                            408,
                            425,
                            429,
                            500,
                            502,
                            503,
                            504,
                        },
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["jitter"] = "`$BOOLEAN`",
                        ["sleep"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "wrap",
                },
                ["telemetry"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["exporter"] = "`$FUNCTION`",
                        ["headers"] = "`$MAP`",
                        ["idgen"] = "`$FUNCTION`",
                        ["now"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "none",
                },
                ["test"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["entity"] = "`$MAP`",
                        ["net"] = "`$MAP`",
                    },
                    ["strict"] = false,
                    ["transport"] = "base",
                },
                ["timeout"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                        ["ms"] = 30000,
                    },
                    ["optspec"] = new Dictionary<string, object?>
                    {
                        ["clearTimer"] = "`$FUNCTION`",
                        ["setTimer"] = "`$FUNCTION`",
                    },
                    ["strict"] = false,
                    ["transport"] = "wrap",
                },
            },
            ["options"] = new Dictionary<string, object?>
            {
                ["base"] = "https://test.tecs.at",
                ["headers"] = new Dictionary<string, object?>
                {
                    ["content-type"] = "application/json",
                },
                ["entity"] = new Dictionary<string, object?>
                {
                    ["merchant_portal_api_controller"] = new Dictionary<string, object?>(),
                    ["merchant_portal_common_controller"] = new Dictionary<string, object?>(),
                    ["merchant_portal_pam_contract_controller"] = new Dictionary<string, object?>(),
                    ["merchant_portal_pam_document_controller"] = new Dictionary<string, object?>(),
                    ["merchant_portal_pam_form_controller"] = new Dictionary<string, object?>(),
                    ["merchant_portal_pam_mandator_controller"] = new Dictionary<string, object?>(),
                    ["merchant_portal_pam_merchant_controller"] = new Dictionary<string, object?>(),
                    ["merchant_portal_pam_package_controller"] = new Dictionary<string, object?>(),
                    ["merchant_portal_pam_product_controller"] = new Dictionary<string, object?>(),
                    ["output_add_product"] = new Dictionary<string, object?>(),
                    ["output_create_product"] = new Dictionary<string, object?>(),
                    ["output_detail"] = new Dictionary<string, object?>(),
                    ["output_list"] = new Dictionary<string, object?>(),
                    ["output_message"] = new Dictionary<string, object?>(),
                    ["output_move_tid"] = new Dictionary<string, object?>(),
                    ["output_remove_product"] = new Dictionary<string, object?>(),
                    ["output_start"] = new Dictionary<string, object?>(),
                    ["output_status"] = new Dictionary<string, object?>(),
                    ["output_update_product"] = new Dictionary<string, object?>(),
                },
            },
            ["entity"] = new Dictionary<string, object?>
            {
                ["merchant_portal_api_controller"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "account_number",
                            ["title"] = "Account Number",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "Account number provided by the acquirer.",
                            ["format"] = "int32",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "additional_data",
                            ["title"] = "Additional Data",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Arbitrary merchant-specific data related to terminal registration.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "business_reg_number",
                            ["title"] = "Business Reg Number",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Merchant business registration number as stated in the company registry.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "city",
                            ["title"] = "City",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Merchant's address: city.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "corporateuuid",
                            ["title"] = "Corporateuuid",
                            ["type"] = "`$STRING`",
                            ["short"] = "Unique identifier for the corporate entity (UUID format).",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "country",
                            ["title"] = "Country",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format).",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "currency",
                            ["title"] = "Currency",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Transaction currency (must be in \"ISO 4217\" format).",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "merchant_category_code",
                            ["title"] = "Merchant Category Code",
                            ["type"] = "`$INTEGER`",
                            ["req"] = true,
                            ["short"] = "Merchant category code as defined by the payment network.",
                            ["format"] = "int32",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "merchant_email",
                            ["title"] = "Merchant Email",
                            ["type"] = "`$STRING`",
                            ["short"] = "Merchant's email address for receiving notifications.",
                            ["format"] = "email",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "merchant_name",
                            ["title"] = "Merchant Name",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "The officially incorporated company name of the merchant.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "merchant_phone_number",
                            ["title"] = "Merchant Phone Number",
                            ["type"] = "`$STRING`",
                            ["short"] = "Merchant's phone number for notifications.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "packageid",
                            ["title"] = "Packageid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Identifier of the package in the TECS processing engine provided by TECS.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "packageorderuuid",
                            ["title"] = "Packageorderuuid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "password",
                            ["title"] = "Password",
                            ["type"] = "`$STRING`",
                            ["short"] = "Merchant password for MPOS.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productid",
                            ["title"] = "Productid",
                            ["type"] = "`$STRING`",
                            ["short"] = "Identifier of the product for which terminal registration is to be performed.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productid_acquirer",
                            ["title"] = "Productid Acquirer",
                            ["type"] = "`$STRING`",
                            ["short"] = "Identifier of the product for which acquiring is enabled.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "reason_deactivation",
                            ["title"] = "Reason Deactivation",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Reason for terminal deactivation.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "reason_reactivation",
                            ["title"] = "Reason Reactivation",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Reason for terminal reactivation.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "sorting_code",
                            ["title"] = "Sorting Code",
                            ["type"] = "`$INTEGER`",
                            ["short"] = "Sorting code provided by the acquirer.",
                            ["format"] = "int32",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "state",
                            ["title"] = "State",
                            ["type"] = "`$STRING`",
                            ["short"] = "Merchant's address: state.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "street",
                            ["title"] = "Street",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Merchant's address: street and house number.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "terminal_country_code",
                            ["title"] = "Terminal Country Code",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Terminal country code (must be in 'ISO-3166 ALPHA-3' format).",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "terminal_language_code",
                            ["title"] = "Terminal Language Code",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Terminal language code (must be in 'ISO 639-1' format).",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "terminal_location",
                            ["title"] = "Terminal Location",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Physical or logical location of the terminal.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "terminal_serial_number",
                            ["title"] = "Terminal Serial Number",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Terminal serial number.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "terminalid",
                            ["title"] = "Terminalid",
                            ["type"] = "`$INTEGER`",
                            ["req"] = true,
                            ["short"] = "TECS terminalid given by Tecs processing engine.",
                            ["format"] = "int32",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "terminalid_acquirer",
                            ["title"] = "Terminalid Acquirer",
                            ["type"] = "`$STRING`",
                            ["short"] = "Terminal ID as set by the acquirer (optional).",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "user_email",
                            ["title"] = "User Email",
                            ["type"] = "`$STRING`",
                            ["short"] = "Email address of the user acting on behalf of the merchant.",
                            ["format"] = "email",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "user_phone_number",
                            ["title"] = "User Phone Number",
                            ["type"] = "`$STRING`",
                            ["short"] = "Phone number of the user acting on behalf of the merchant.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "username",
                            ["title"] = "Username",
                            ["type"] = "`$STRING`",
                            ["short"] = "Merchant username for MPOS.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "vu_nummer",
                            ["title"] = "Vu Nummer",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Merchant contract number with the acquirer.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "web_shop_url",
                            ["title"] = "Web Shop Url",
                            ["type"] = "`$STRING`",
                            ["short"] = "URL of the merchant's web shop.",
                            ["format"] = "uri",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "zipcode",
                            ["title"] = "Zipcode",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Merchant's address: postal code.",
                        },
                    },
                    ["name"] = "merchant_portal_api_controller",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/deactivateTerminal",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "deactivateTerminal",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "deactivateTerminal",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/reactivateTerminal",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "reactivateTerminal",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "reactivateTerminal",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/registerAdditionalTerminal",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "registerAdditionalTerminal",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "registerAdditionalTerminal",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/registerNewMerchant",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "registerNewMerchant",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "registerNewMerchant",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["merchant_portal_common_controller"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>(),
                    ["name"] = "merchant_portal_common_controller",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/merchantportalws/logDeveloperInfo",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "logDeveloperInfo",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "logDeveloperInfo",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/merchantportalws/version",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "version",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "version",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["merchant_portal_pam_contract_controller"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "language",
                            ["title"] = "Language",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productOrderUUID",
                            ["title"] = "Product Order Uuid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                    },
                    ["name"] = "merchant_portal_pam_contract_controller",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/generateContract",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "generateContract",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "generateContract",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/uploadContract",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "uploadContract",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "uploadContract",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["merchant_portal_pam_document_controller"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "appFormFieldDescUUID",
                            ["title"] = "App Form Field Desc Uuid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "packageOrderUUID",
                            ["title"] = "Package Order Uuid",
                            ["type"] = "`$STRING`",
                            ["short"] = "UUID of the package order.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productOrderUUID",
                            ["title"] = "Product Order Uuid",
                            ["type"] = "`$STRING`",
                            ["short"] = "UUID of the product order.",
                        },
                    },
                    ["name"] = "merchant_portal_pam_document_controller",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/documentsList",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "documentsList",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "documentsList",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/downloadDocument",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "downloadDocument",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "downloadDocument",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["merchant_portal_pam_form_controller"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "appFormFieldsDescUUID",
                            ["title"] = "App Form Fields Desc Uuid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "filter",
                            ["title"] = "Filter",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "language",
                            ["title"] = "Language",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["type"] = "`$STRING`",
                                },
                            },
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "packageOrder",
                            ["title"] = "Package Order",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "packageOrderUUID",
                            ["title"] = "Package Order Uuid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["short"] = "UUID of the package order.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "packageUUID",
                            ["title"] = "Package Uuid",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productOrderUUID",
                            ["title"] = "Product Order Uuid",
                            ["type"] = "`$STRING`",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["short"] = "UUID of the product order.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productOrders",
                            ["title"] = "Product Orders",
                            ["type"] = "`$ARRAY`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "reasonOfReopening",
                            ["title"] = "Reason Of Reopening",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                    },
                    ["name"] = "merchant_portal_pam_form_controller",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/applicationForm",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "applicationForm",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "applicationForm",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/packageForm",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "packageForm",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "packageForm",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/reopenForm",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "reopenForm",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "reopenForm",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/secretKey",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "secretKey",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "secretKey",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/submitForm",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "submitForm",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "submitForm",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/submitValues",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "submitValues",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "submitValues",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["merchant_portal_pam_mandator_controller"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "clientSecret",
                            ["title"] = "Client Secret",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mandatorName",
                            ["title"] = "Mandator Name",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "notificationEmail",
                            ["title"] = "Notification Email",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "packageUUID",
                            ["title"] = "Package Uuid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                    },
                    ["name"] = "merchant_portal_pam_mandator_controller",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/createMandatorConfig",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "createMandatorConfig",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "createMandatorConfig",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/introduceMandatorPackage",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "introduceMandatorPackage",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "introduceMandatorPackage",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/selfRegistrationLink",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "selfRegistrationLink",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "selfRegistrationLink",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["merchant_portal_pam_merchant_controller"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "additional_data",
                            ["title"] = "Additional Data",
                            ["type"] = "`$OBJECT`",
                            ["short"] = "Optional additional merchant-specific data related to enabling acquiring.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "businessRegistrationNumber",
                            ["title"] = "Business Registration Number",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "city",
                            ["title"] = "City",
                            ["type"] = "`$STRING`",
                            ["short"] = "City where the merchant is located.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "companyName",
                            ["title"] = "Company Name",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "corporateUUID",
                            ["title"] = "Corporate Uuid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Unique identifier for the corporate entity.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "country",
                            ["title"] = "Country",
                            ["type"] = "`$STRING`",
                            ["short"] = "Country where the merchant is located.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "currency",
                            ["title"] = "Currency",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Transaction currency in ISO 4217 format.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "email",
                            ["title"] = "Email",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "language",
                            ["title"] = "Language",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "login",
                            ["title"] = "Login",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "mandator",
                            ["title"] = "Mandator",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Mandator name assigned by TECS.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "merchantContractNumber",
                            ["title"] = "Merchant Contract Number",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["short"] = "Unique identifier for the merchant within a specific system.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "merchantName",
                            ["title"] = "Merchant Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "Name of the merchant.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "merchant_category_code",
                            ["title"] = "Merchant Category Code",
                            ["type"] = "`$STRING`",
                            ["short"] = "Merchant Category Code (MCC) describing the merchant’s type of business.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "packageUUID",
                            ["title"] = "Package Uuid",
                            ["type"] = "`$STRING`",
                            ["short"] = "UUID of the package.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "packageorderuuid",
                            ["title"] = "Packageorderuuid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Unique identifier for the registered merchant in the TECS system.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "phoneNumber",
                            ["title"] = "Phone Number",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "postalCode",
                            ["title"] = "Postal Code",
                            ["type"] = "`$STRING`",
                            ["short"] = "Postal or ZIP code of the merchant’s location.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productid_acquirer",
                            ["title"] = "Productid Acquirer",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Identifier of the product for which acquiring is to be enabled.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "region",
                            ["title"] = "Region",
                            ["type"] = "`$STRING`",
                            ["short"] = "State or province where the merchant is located.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "registrationNumber",
                            ["title"] = "Registration Number",
                            ["type"] = "`$STRING`",
                            ["short"] = "Business registration number.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "signature",
                            ["title"] = "Signature",
                            ["type"] = "`$STRING`",
                            ["short"] = "Signature value = saltAsHex-hashAsHex.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "street",
                            ["title"] = "Street",
                            ["type"] = "`$STRING`",
                            ["short"] = "Street address of the merchant.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "terminalIds",
                            ["title"] = "Terminal Ids",
                            ["type"] = "`$ARRAY`",
                            ["short"] = "Optional list of terminal IDs for which acquiring should be activated.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "terminalid_acquirer",
                            ["title"] = "Terminalid Acquirer",
                            ["type"] = "`$STRING`",
                            ["short"] = "Optional terminal ID provided by the acquirer.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "vu_nummer",
                            ["title"] = "Vu Nummer",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Merchant contract number with the acquirer.",
                        },
                    },
                    ["name"] = "merchant_portal_pam_merchant_controller",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/contractNumber",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "contractNumber",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "contractNumber",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/registerAdditionalAcquiring",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "registerAdditionalAcquiring",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "registerAdditionalAcquiring",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/updateMerchant",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "updateMerchant",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "updateMerchant",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/registerMerchant",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "registerMerchant",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "registerMerchant",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["select"] = new Dictionary<string, object?>(),
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["merchant_portal_pam_package_controller"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "consumerUUID",
                            ["title"] = "Consumer Uuid",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "corporateUUID",
                            ["title"] = "Corporate Uuid",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "country",
                            ["title"] = "Country",
                            ["type"] = "`$STRING`",
                            ["short"] = "Country associated with the package.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "descriptionKey",
                            ["title"] = "Description Key",
                            ["type"] = "`$STRING`",
                            ["short"] = "Key for the description of the package.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "filter",
                            ["title"] = "Filter",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "language",
                            ["title"] = "Language",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["type"] = "`$STRING`",
                                },
                            },
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "nameKey",
                            ["title"] = "Name Key",
                            ["type"] = "`$STRING`",
                            ["short"] = "Key for the name of the package.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "packageStatus",
                            ["title"] = "Package Status",
                            ["type"] = "`$STRING`",
                            ["short"] = "Status of the package.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "packageUUID",
                            ["title"] = "Package Uuid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Unique identifier for the package.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "pagination",
                            ["title"] = "Pagination",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "sorting",
                            ["title"] = "Sorting",
                            ["type"] = "`$OBJECT`",
                        },
                    },
                    ["name"] = "merchant_portal_pam_package_controller",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/availablePackages",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "availablePackages",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "availablePackages",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/orderPackage",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "orderPackage",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "orderPackage",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/orderedPackages",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "orderedPackages",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "orderedPackages",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/packageTemplates",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "packageTemplates",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "packageTemplates",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/updatePackageData",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "updatePackageData",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "updatePackageData",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["merchant_portal_pam_product_controller"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "consumerUUID",
                            ["title"] = "Consumer Uuid",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "filter",
                            ["title"] = "Filter",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "language",
                            ["title"] = "Language",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "merchantID",
                            ["title"] = "Merchant Id",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "packageOrderUUID",
                            ["title"] = "Package Order Uuid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "pagination",
                            ["title"] = "Pagination",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productOrderUUID",
                            ["title"] = "Product Order Uuid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productUUID",
                            ["title"] = "Product Uuid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "reason_decline",
                            ["title"] = "Reason Decline",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Reason for product decline.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "sorting",
                            ["title"] = "Sorting",
                            ["type"] = "`$OBJECT`",
                        },
                    },
                    ["name"] = "merchant_portal_pam_product_controller",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/approveProduct",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "approveProduct",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "approveProduct",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/declineProduct",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "declineProduct",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "declineProduct",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/orderAdditionalProduct",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "orderAdditionalProduct",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "orderAdditionalProduct",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/productsList",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "productsList",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "productsList",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["output_add_product"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "packageUUID",
                            ["title"] = "Package Uuid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Unique identifier for the package.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productUUIDs",
                            ["title"] = "Product Uui Ds",
                            ["type"] = "`$ARRAY`",
                            ["req"] = true,
                            ["short"] = "The list of unique identifiers of the products.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseCode",
                            ["title"] = "Response Code",
                            ["type"] = "`$INTEGER`",
                            ["req"] = true,
                            ["short"] = "Response code.",
                            ["format"] = "int32",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseMessage",
                            ["title"] = "Response Message",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Response message.",
                        },
                    },
                    ["name"] = "output_add_product",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/addProductsToPackage",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "addProductsToPackage",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "addProductsToPackage",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["output_create_product"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "acquirerId",
                            ["title"] = "Acquirer Id",
                            ["type"] = "`$STRING`",
                            ["short"] = "Unique identifier for the acquirer.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "allowMultipleOrders",
                            ["title"] = "Allow Multiple Orders",
                            ["type"] = "`$BOOLEAN`",
                            ["req"] = true,
                            ["short"] = "Indication whether multiple orders are allowed or not.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "appFormTemplateName",
                            ["title"] = "App Form Template Name",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Name of the application form template.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "contractNeeded",
                            ["title"] = "Contract Needed",
                            ["type"] = "`$BOOLEAN`",
                            ["req"] = true,
                            ["short"] = "Indication whether contract is needed or not.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "credentialsNeeded",
                            ["title"] = "Credentials Needed",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "Indication whether credentials are needed or not.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "descriptionKey",
                            ["title"] = "Description Key",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Key indicator for product description.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "nameKey",
                            ["title"] = "Name Key",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Key indicator for product name.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "prescreeningAllowed",
                            ["title"] = "Prescreening Allowed",
                            ["type"] = "`$BOOLEAN`",
                            ["req"] = true,
                            ["short"] = "Indication whether prescreening is allowed or not.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productName",
                            ["title"] = "Product Name",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Name of the product.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseCode",
                            ["title"] = "Response Code",
                            ["type"] = "`$INTEGER`",
                            ["req"] = true,
                            ["short"] = "Response code.",
                            ["format"] = "int32",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseMessage",
                            ["title"] = "Response Message",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Response message.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "terminalTemplateName",
                            ["title"] = "Terminal Template Name",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Name of the terminal template.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "vendorName",
                            ["title"] = "Vendor Name",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Name of the vendor.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "xmlTemplateFile",
                            ["title"] = "Xml Template File",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "A string value containing the XML template file encoded in Base64.",
                        },
                    },
                    ["name"] = "output_create_product",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/createNewProduct",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "createNewProduct",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "createNewProduct",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["output_detail"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "batch",
                            ["title"] = "Batch",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "lines",
                            ["title"] = "Lines",
                            ["type"] = "`$OBJECT`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "progress",
                            ["title"] = "Progress",
                            ["type"] = "`$OBJECT`",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "output_detail",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/merchantportalws/batch/registerAdditionalTerminal/details/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "batch",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "registerAdditionalTerminal",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "details",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "batch",
                                        "registerAdditionalTerminal",
                                        "details",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body.details`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["output_list"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "items",
                            ["title"] = "Items",
                            ["type"] = "`$ARRAY`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "pagination",
                            ["title"] = "Pagination",
                            ["type"] = "`$OBJECT`",
                            ["req"] = true,
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseCode",
                            ["title"] = "Response Code",
                            ["type"] = "`$INTEGER`",
                            ["req"] = true,
                            ["short"] = "Response code.",
                            ["format"] = "int32",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseMessage",
                            ["title"] = "Response Message",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Response message.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "sorting",
                            ["title"] = "Sorting",
                            ["type"] = "`$OBJECT`",
                        },
                    },
                    ["name"] = "output_list",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/batch/registerAdditionalTerminal/list",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "batch",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "registerAdditionalTerminal",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "list",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "batch",
                                        "registerAdditionalTerminal",
                                        "list",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["output_message"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseCode",
                            ["title"] = "Response Code",
                            ["type"] = "`$INTEGER`",
                            ["req"] = true,
                            ["short"] = "Response code.",
                            ["format"] = "int32",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseMessage",
                            ["title"] = "Response Message",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Response message.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "output_message",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/merchantportalws/batch/registerAdditionalTerminal/restart/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "batch",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "registerAdditionalTerminal",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "restart",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "batch",
                                        "registerAdditionalTerminal",
                                        "restart",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                            "id",
                                        },
                                    },
                                },
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/merchantportalws/batch/registerAdditionalTerminal/stop/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "batch",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "registerAdditionalTerminal",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "stop",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "batch",
                                        "registerAdditionalTerminal",
                                        "stop",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["output_move_tid"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productOrderUUIDs",
                            ["title"] = "Product Order Uui Ds",
                            ["type"] = "`$ARRAY`",
                            ["req"] = true,
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseCode",
                            ["title"] = "Response Code",
                            ["type"] = "`$INTEGER`",
                            ["req"] = true,
                            ["short"] = "Response code.",
                            ["format"] = "int32",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseMessage",
                            ["title"] = "Response Message",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Response message.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "targetPackageOrderUUID",
                            ["title"] = "Target Package Order Uuid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "targetProductOrderUUID",
                            ["title"] = "Target Product Order Uuid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                        },
                    },
                    ["name"] = "output_move_tid",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/moveTid",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "moveTid",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "moveTid",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["output_remove_product"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "packageUUID",
                            ["title"] = "Package Uuid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Unique identifier for the package.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productUUIDs",
                            ["title"] = "Product Uui Ds",
                            ["type"] = "`$ARRAY`",
                            ["req"] = true,
                            ["short"] = "List of product unique identifiers.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseCode",
                            ["title"] = "Response Code",
                            ["type"] = "`$INTEGER`",
                            ["req"] = true,
                            ["short"] = "Response code.",
                            ["format"] = "int32",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseMessage",
                            ["title"] = "Response Message",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Response message.",
                        },
                    },
                    ["name"] = "output_remove_product",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/removeProductsFromPackage",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "removeProductsFromPackage",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "removeProductsFromPackage",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["output_start"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseCode",
                            ["title"] = "Response Code",
                            ["type"] = "`$INTEGER`",
                            ["req"] = true,
                            ["short"] = "Response code.",
                            ["format"] = "int32",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseMessage",
                            ["title"] = "Response Message",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Response message.",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "output_start",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/batch/registerAdditionalTerminal/start",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "batch",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "registerAdditionalTerminal",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "start",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "batch",
                                        "registerAdditionalTerminal",
                                        "start",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["output_status"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "id",
                            ["title"] = "Id",
                            ["type"] = "`$STRING`",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "percentage",
                            ["title"] = "Percentage",
                            ["type"] = "`$INTEGER`",
                            ["format"] = "int32",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseCode",
                            ["title"] = "Response Code",
                            ["type"] = "`$INTEGER`",
                            ["req"] = true,
                            ["short"] = "Response code.",
                            ["format"] = "int32",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseMessage",
                            ["title"] = "Response Message",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Response message.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "status",
                            ["title"] = "Status",
                            ["type"] = "`$STRING`",
                        },
                    },
                    ["id"] = new Dictionary<string, object?>
                    {
                        ["field"] = "id",
                        ["name"] = "id",
                    },
                    ["name"] = "output_status",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["load"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "load",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "GET",
                                    ["orig"] = "/merchantportalws/batch/registerAdditionalTerminal/status/{id}",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "batch",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "registerAdditionalTerminal",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "status",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["var"] = "id",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "batch",
                                        "registerAdditionalTerminal",
                                        "status",
                                        "{id}",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "param",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                            "id",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
                ["output_update_product"] = new Dictionary<string, object?>
                {
                    ["fields"] = new List<object?>
                    {
                        new Dictionary<string, object?>
                        {
                            ["name"] = "allowMultipleOrders",
                            ["title"] = "Allow Multiple Orders",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "An attribute to indicate if multiple orders are allowed",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "appFormName",
                            ["title"] = "App Form Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The name of the application form",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "contractNeeded",
                            ["title"] = "Contract Needed",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "An attribute to indicate if a contract is needed",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "credentialsNeeded",
                            ["title"] = "Credentials Needed",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "An attribute to indicate if credentials are needed",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "descriptionKey",
                            ["title"] = "Description Key",
                            ["type"] = "`$STRING`",
                            ["short"] = "The description of the product",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "nameKey",
                            ["title"] = "Name Key",
                            ["type"] = "`$STRING`",
                            ["short"] = "The key of the product name",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "prescreeningAllowed",
                            ["title"] = "Prescreening Allowed",
                            ["type"] = "`$BOOLEAN`",
                            ["short"] = "An attribute to indicate if prescreening is allowed",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productName",
                            ["title"] = "Product Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The name of the product",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productStatus",
                            ["title"] = "Product Status",
                            ["type"] = "`$STRING`",
                            ["short"] = "The status of the product",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "productUUID",
                            ["title"] = "Product Uuid",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "The UUID of the product to update",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseCode",
                            ["title"] = "Response Code",
                            ["type"] = "`$INTEGER`",
                            ["req"] = true,
                            ["short"] = "Response code.",
                            ["format"] = "int32",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "responseMessage",
                            ["title"] = "Response Message",
                            ["type"] = "`$STRING`",
                            ["req"] = true,
                            ["short"] = "Response message.",
                        },
                        new Dictionary<string, object?>
                        {
                            ["name"] = "vendorName",
                            ["title"] = "Vendor Name",
                            ["type"] = "`$STRING`",
                            ["short"] = "The name of the vendor",
                        },
                    },
                    ["name"] = "output_update_product",
                    ["op"] = new Dictionary<string, object?>
                    {
                        ["create"] = new Dictionary<string, object?>
                        {
                            ["input"] = "data",
                            ["name"] = "create",
                            ["points"] = new List<object?>
                            {
                                new Dictionary<string, object?>
                                {
                                    ["kind"] = "http",
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/updateProduct",
                                    ["segments"] = new List<object?>
                                    {
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "merchantportalws",
                                        },
                                        new Dictionary<string, object?>
                                        {
                                            ["lit"] = "updateProduct",
                                        },
                                    },
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "updateProduct",
                                    },
                                    ["rename"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["type"] = "`$STRING`",
                                                ["kind"] = "header",
                                                ["reqd"] = true,
                                            },
                                        },
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                },
                            },
                        },
                    },
                    ["relations"] = new Dictionary<string, object?>
                    {
                        ["ancestors"] = new List<object?>(),
                    },
                },
            },
        };
    }

    private static readonly Lazy<Dictionary<string, object?>> SharedConfigVal =
        new(MakeConfig);

    // The process-wide config, built once on first use.
    //
    // The returned dictionary is SHARED: treat it as read-only. Callers that
    // need to mutate should use MakeConfig, which always returns a fresh copy.
    public static Dictionary<string, object?> SharedConfig()
    {
        return SharedConfigVal.Value;
    }

    public static List<object?> FeaturePlugins(string name)
    {
        switch (name)
        {
            default:
                return new List<object?>();
        }
    }

    public static Feature.BaseFeature MakeFeature(string name)
    {
        switch (name)
        {
            case "audit":
                return new Feature.AuditFeature();
            case "clienttrack":
                return new Feature.ClienttrackFeature();
            case "debug":
                return new Feature.DebugFeature();
            case "idempotency":
                return new Feature.IdempotencyFeature();
            case "log":
                return new Feature.LogFeature();
            case "metrics":
                return new Feature.MetricsFeature();
            case "paging":
                return new Feature.PagingFeature();
            case "ratelimit":
                return new Feature.RatelimitFeature();
            case "retry":
                return new Feature.RetryFeature();
            case "telemetry":
                return new Feature.TelemetryFeature();
            case "test":
                return new Feature.TestFeature();
            case "timeout":
                return new Feature.TimeoutFeature();
            default:
                return new Feature.BaseFeature();
        }
    }
}
