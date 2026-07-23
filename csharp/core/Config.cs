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
            },
            ["feature"] = new Dictionary<string, object?>
            {
                ["test"] = new Dictionary<string, object?>
                {
                    ["options"] = new Dictionary<string, object?>
                    {
                        ["active"] = false,
                    },
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
                            ["active"] = true,
                            ["name"] = "account_number",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "additional_data",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "business_reg_number",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "city",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "corporateuuid",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "country",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "currency",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "merchant_category_code",
                            ["req"] = true,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "merchant_email",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "merchant_name",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "merchant_phone_number",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "packageid",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 11,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "packageorderuuid",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 12,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "password",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 13,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "productid",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 14,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "productid_acquirer",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 15,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "reason_deactivation",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 16,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "reason_reactivation",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 17,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "sorting_code",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 18,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "state",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 19,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "street",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 20,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "terminal_country_code",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 21,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "terminal_language_code",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 22,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "terminal_location",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 23,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "terminal_serial_number",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 24,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "terminalid",
                            ["req"] = true,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 25,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "terminalid_acquirer",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 26,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "user_email",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 27,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "user_phone_number",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 28,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "username",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 29,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "vu_nummer",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 30,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "web_shop_url",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 31,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "zipcode",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 32,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/deactivateTerminal",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "deactivateTerminal",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/reactivateTerminal",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "reactivateTerminal",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 1,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/registerAdditionalTerminal",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "registerAdditionalTerminal",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 2,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/registerNewMerchant",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "registerNewMerchant",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 3,
                                },
                            },
                            ["key$"] = "create",
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "GET",
                                    ["orig"] = "/merchantportalws/logDeveloperInfo",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "logDeveloperInfo",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "GET",
                                    ["orig"] = "/merchantportalws/version",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "version",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 1,
                                },
                            },
                            ["key$"] = "load",
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
                            ["active"] = true,
                            ["name"] = "language",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "product_order_uuid",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/generateContract",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "generateContract",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/uploadContract",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "uploadContract",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 1,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "app_form_field_desc_uuid",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "package_order_uuid",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "product_order_uuid",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/documentsList",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "documentsList",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/downloadDocument",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "downloadDocument",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 1,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "app_form_fields_desc_uuid",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "filter",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "language",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "package_order",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "package_order_uuid",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "package_uuid",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "product_order",
                            ["req"] = false,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "product_order_uuid",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = true,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "reason_of_reopening",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/applicationForm",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "applicationForm",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/packageForm",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "packageForm",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 1,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/reopenForm",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "reopenForm",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 2,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/secretKey",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "secretKey",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 3,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/submitForm",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "submitForm",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 4,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/submitValues",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "submitValues",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 5,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "client_secret",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "mandator_name",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "notification_email",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "package_uuid",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/createMandatorConfig",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "createMandatorConfig",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/introduceMandatorPackage",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "introduceMandatorPackage",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 1,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/selfRegistrationLink",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "selfRegistrationLink",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 2,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "additional_data",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "business_registration_number",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "city",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "company_name",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "corporate_uuid",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "country",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "currency",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "email",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "language",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "login",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "mandator",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "merchant_category_code",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 11,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "merchant_contract_number",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 12,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "merchant_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 13,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "package_uuid",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 14,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "packageorderuuid",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 15,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "phone_number",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 16,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "postal_code",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 17,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "productid_acquirer",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 18,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "region",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 19,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "registration_number",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 20,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "signature",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 21,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "street",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 22,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "terminal_id",
                            ["req"] = false,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 23,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "terminalid_acquirer",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 24,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "vu_nummer",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 25,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/contractNumber",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "contractNumber",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/registerAdditionalAcquiring",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "registerAdditionalAcquiring",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 1,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/updateMerchant",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "updateMerchant",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 2,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>(),
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/registerMerchant",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "registerMerchant",
                                    },
                                    ["select"] = new Dictionary<string, object?>(),
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 3,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "consumer_uuid",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "corporate_uuid",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "country",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "description_key",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "filter",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "language",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$STRING`",
                                },
                            },
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name_key",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "package_status",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "package_uuid",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "pagination",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "sorting",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 10,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/availablePackages",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "availablePackages",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/orderPackage",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "orderPackage",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 1,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/orderedPackages",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "orderedPackages",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 2,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/packageTemplates",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "packageTemplates",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 3,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = false,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/updatePackageData",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "updatePackageData",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 4,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "consumer_uuid",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "filter",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "language",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "merchant_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "package_order_uuid",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "pagination",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "product_order_uuid",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "product_uuid",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "reason_decline",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "sorting",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 9,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/approveProduct",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "approveProduct",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/declineProduct",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "declineProduct",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 1,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/orderAdditionalProduct",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "orderAdditionalProduct",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 2,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/productsList",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "productsList",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 3,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "package_uuid",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "product_uui_d",
                            ["req"] = true,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_code",
                            ["req"] = true,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_message",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/addProductsToPackage",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "addProductsToPackage",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "acquirer_id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "allow_multiple_order",
                            ["req"] = true,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "app_form_template_name",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "contract_needed",
                            ["req"] = true,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "credentials_needed",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "description_key",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name_key",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "prescreening_allowed",
                            ["req"] = true,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "product_name",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_code",
                            ["req"] = true,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_message",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "terminal_template_name",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 11,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "vendor_name",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 12,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "xml_template_file",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 13,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/createNewProduct",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "createNewProduct",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "detail",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_code",
                            ["req"] = true,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_message",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/merchantportalws/batch/registerAdditionalTerminal/details/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "batch",
                                        "registerAdditionalTerminal",
                                        "details",
                                        "{id}",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
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
                            ["active"] = true,
                            ["name"] = "item",
                            ["req"] = false,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "pagination",
                            ["op"] = new Dictionary<string, object?>
                            {
                                ["create"] = new Dictionary<string, object?>
                                {
                                    ["req"] = false,
                                    ["type"] = "`$OBJECT`",
                                },
                            },
                            ["req"] = true,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_code",
                            ["req"] = true,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_message",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "sorting",
                            ["req"] = false,
                            ["type"] = "`$OBJECT`",
                            ["index$"] = 4,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/batch/registerAdditionalTerminal/list",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "batch",
                                        "registerAdditionalTerminal",
                                        "list",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "response_code",
                            ["req"] = true,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_message",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/merchantportalws/batch/registerAdditionalTerminal/restart/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "batch",
                                        "registerAdditionalTerminal",
                                        "restart",
                                        "{id}",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                                new Dictionary<string, object?>
                                {
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/merchantportalws/batch/registerAdditionalTerminal/stop/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "batch",
                                        "registerAdditionalTerminal",
                                        "stop",
                                        "{id}",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 1,
                                },
                            },
                            ["key$"] = "load",
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
                            ["active"] = true,
                            ["name"] = "product_order_uui_d",
                            ["req"] = true,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_code",
                            ["req"] = true,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_message",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "target_package_order_uuid",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "target_product_order_uuid",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/moveTid",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "moveTid",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "package_uuid",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "product_uui_d",
                            ["req"] = true,
                            ["type"] = "`$ARRAY`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_code",
                            ["req"] = true,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_message",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/removeProductsFromPackage",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "removeProductsFromPackage",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "id",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_code",
                            ["req"] = true,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_message",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/batch/registerAdditionalTerminal/start",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "batch",
                                        "registerAdditionalTerminal",
                                        "start",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
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
                            ["active"] = true,
                            ["name"] = "percentage",
                            ["req"] = false,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_code",
                            ["req"] = true,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_message",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "status",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 3,
                        },
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                        ["params"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "param",
                                                ["name"] = "id",
                                                ["orig"] = "id",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                                ["index$"] = 0,
                                            },
                                        },
                                    },
                                    ["method"] = "GET",
                                    ["orig"] = "/merchantportalws/batch/registerAdditionalTerminal/status/{id}",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "batch",
                                        "registerAdditionalTerminal",
                                        "status",
                                        "{id}",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                            "id",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "load",
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
                            ["active"] = true,
                            ["name"] = "allow_multiple_order",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 0,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "app_form_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 1,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "contract_needed",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 2,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "credentials_needed",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 3,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "description_key",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 4,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "name_key",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 5,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "prescreening_allowed",
                            ["req"] = false,
                            ["type"] = "`$BOOLEAN`",
                            ["index$"] = 6,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "product_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 7,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "product_status",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 8,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "product_uuid",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 9,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_code",
                            ["req"] = true,
                            ["type"] = "`$INTEGER`",
                            ["index$"] = 10,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "response_message",
                            ["req"] = true,
                            ["type"] = "`$STRING`",
                            ["index$"] = 11,
                        },
                        new Dictionary<string, object?>
                        {
                            ["active"] = true,
                            ["name"] = "vendor_name",
                            ["req"] = false,
                            ["type"] = "`$STRING`",
                            ["index$"] = 12,
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
                                    ["active"] = true,
                                    ["args"] = new Dictionary<string, object?>
                                    {
                                        ["header"] = new List<object?>
                                        {
                                            new Dictionary<string, object?>
                                            {
                                                ["active"] = true,
                                                ["kind"] = "header",
                                                ["name"] = "authorization",
                                                ["orig"] = "authorization",
                                                ["reqd"] = true,
                                                ["type"] = "`$STRING`",
                                            },
                                        },
                                    },
                                    ["method"] = "POST",
                                    ["orig"] = "/merchantportalws/updateProduct",
                                    ["parts"] = new List<object?>
                                    {
                                        "merchantportalws",
                                        "updateProduct",
                                    },
                                    ["select"] = new Dictionary<string, object?>
                                    {
                                        ["exist"] = new List<object?>
                                        {
                                            "authorization",
                                        },
                                    },
                                    ["transform"] = new Dictionary<string, object?>
                                    {
                                        ["req"] = "`reqdata`",
                                        ["res"] = "`body`",
                                    },
                                    ["index$"] = 0,
                                },
                            },
                            ["key$"] = "create",
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

    public static Feature.BaseFeature MakeFeature(string name)
    {
        switch (name)
        {
            case "test":
                return new Feature.TestFeature();
            default:
                return new Feature.BaseFeature();
        }
    }
}
