# BluefinTecsMerchantPortal SDK configuration

module BluefinTecsMerchantPortalConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "BluefinTecsMerchantPortal",
        "slug" => "bluefin-tecs-merchant-portal",
        "version" => "0.1.1",
        "target" => "rb",
      },
      "feature" => {
        "audit" => {
          "options" => {
            "active" => false,
            "actor" => "anonymous",
            "max" => 1000,
          },
          "optspec" => {
            "now" => "`$FUNCTION`",
            "sink" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "none",
        },
        "clienttrack" => {
          "options" => {
            "active" => false,
            "clientVersion" => "0.0.1",
          },
          "optspec" => {
            "clientName" => "`$STRING`",
            "clientVersion" => "`$STRING`",
            "headers" => "`$MAP`",
            "idgen" => "`$FUNCTION`",
            "sessionId" => "`$STRING`",
          },
          "strict" => false,
          "transport" => "none",
        },
        "debug" => {
          "options" => {
            "active" => false,
            "max" => 100,
            "redact" => [
              "authorization",
              "cookie",
              "set-cookie",
              "api-key",
              "apikey",
              "x-api-key",
              "idempotency-key",
            ],
          },
          "optspec" => {
            "now" => "`$FUNCTION`",
            "onEntry" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "none",
        },
        "idempotency" => {
          "options" => {
            "active" => false,
            "header" => "Idempotency-Key",
            "methods" => [
              "POST",
              "PUT",
              "PATCH",
              "DELETE",
            ],
            "ops" => [
              "create",
              "update",
              "remove",
            ],
          },
          "optspec" => {
            "keygen" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "none",
        },
        "log" => {
          "options" => {
            "active" => true,
          },
          "optspec" => {
            "level" => "`$STRING`",
            "logger" => "`$ANY`",
          },
          "strict" => false,
          "transport" => "none",
        },
        "metrics" => {
          "options" => {
            "active" => false,
          },
          "optspec" => {
            "now" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "none",
        },
        "paging" => {
          "options" => {
            "active" => false,
            "afterVar" => "after",
            "cursorParam" => "cursor",
            "firstVar" => "first",
            "limitParam" => "limit",
            "pageParam" => "page",
            "startPage" => 1,
          },
          "optspec" => {
            "limit" => "`$NUMBER`",
            "ops" => "`$LIST`",
          },
          "strict" => false,
          "transport" => "none",
        },
        "ratelimit" => {
          "options" => {
            "active" => false,
            "burst" => 5,
            "rate" => 5,
          },
          "optspec" => {
            "now" => "`$FUNCTION`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "retry" => {
          "options" => {
            "active" => false,
            "factor" => 2,
            "maxDelay" => 2000,
            "minDelay" => 50,
            "retries" => 2,
            "statuses" => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          },
          "optspec" => {
            "jitter" => "`$BOOLEAN`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "telemetry" => {
          "options" => {
            "active" => false,
          },
          "optspec" => {
            "exporter" => "`$FUNCTION`",
            "headers" => "`$MAP`",
            "idgen" => "`$FUNCTION`",
            "now" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "none",
        },
        "test" => {
          "options" => {
            "active" => false,
          },
          "optspec" => {
            "entity" => "`$MAP`",
            "net" => "`$MAP`",
          },
          "strict" => false,
          "transport" => "base",
        },
        "timeout" => {
          "options" => {
            "active" => false,
            "ms" => 30000,
          },
          "optspec" => {
            "clearTimer" => "`$FUNCTION`",
            "setTimer" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
      },
      "options" => {
        "base" => "https://test.tecs.at",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "merchant_portal_api_controller" => {},
          "merchant_portal_common_controller" => {},
          "merchant_portal_pam_contract_controller" => {},
          "merchant_portal_pam_document_controller" => {},
          "merchant_portal_pam_form_controller" => {},
          "merchant_portal_pam_mandator_controller" => {},
          "merchant_portal_pam_merchant_controller" => {},
          "merchant_portal_pam_package_controller" => {},
          "merchant_portal_pam_product_controller" => {},
          "output_add_product" => {},
          "output_create_product" => {},
          "output_detail" => {},
          "output_list" => {},
          "output_message" => {},
          "output_move_tid" => {},
          "output_remove_product" => {},
          "output_start" => {},
          "output_status" => {},
          "output_update_product" => {},
        },
      },
      "entity" => {
        "merchant_portal_api_controller" => {
          "fields" => [
            {
              "format" => "int32",
              "name" => "account_number",
              "short" => "Account number provided by the acquirer.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "additional_data",
              "short" => "Arbitrary merchant-specific data related to terminal registration.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "business_reg_number",
              "req" => true,
              "short" => "Merchant business registration number as stated in the company registry.",
              "type" => "`$STRING`",
            },
            {
              "name" => "city",
              "req" => true,
              "short" => "Merchant's address: city.",
              "type" => "`$STRING`",
            },
            {
              "name" => "corporateuuid",
              "short" => "Unique identifier for the corporate entity (UUID format).",
              "type" => "`$STRING`",
            },
            {
              "name" => "country",
              "req" => true,
              "short" => "Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format).",
              "type" => "`$STRING`",
            },
            {
              "name" => "currency",
              "req" => true,
              "short" => "Transaction currency (must be in \"ISO 4217\" format).",
              "type" => "`$STRING`",
            },
            {
              "format" => "int32",
              "name" => "merchant_category_code",
              "req" => true,
              "short" => "Merchant category code as defined by the payment network.",
              "type" => "`$INTEGER`",
            },
            {
              "format" => "email",
              "name" => "merchant_email",
              "short" => "Merchant's email address for receiving notifications.",
              "type" => "`$STRING`",
            },
            {
              "name" => "merchant_name",
              "req" => true,
              "short" => "The officially incorporated company name of the merchant.",
              "type" => "`$STRING`",
            },
            {
              "name" => "merchant_phone_number",
              "short" => "Merchant's phone number for notifications.",
              "type" => "`$STRING`",
            },
            {
              "name" => "packageid",
              "req" => true,
              "short" => "Identifier of the package in the TECS processing engine provided by TECS.",
              "type" => "`$STRING`",
            },
            {
              "name" => "packageorderuuid",
              "req" => true,
              "short" => "Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call.",
              "type" => "`$STRING`",
            },
            {
              "name" => "password",
              "short" => "Merchant password for MPOS.",
              "type" => "`$STRING`",
            },
            {
              "name" => "productid",
              "short" => "Identifier of the product for which terminal registration is to be performed.",
              "type" => "`$STRING`",
            },
            {
              "name" => "productid_acquirer",
              "short" => "Identifier of the product for which acquiring is enabled.",
              "type" => "`$STRING`",
            },
            {
              "name" => "reason_deactivation",
              "req" => true,
              "short" => "Reason for terminal deactivation.",
              "type" => "`$STRING`",
            },
            {
              "name" => "reason_reactivation",
              "req" => true,
              "short" => "Reason for terminal reactivation.",
              "type" => "`$STRING`",
            },
            {
              "format" => "int32",
              "name" => "sorting_code",
              "short" => "Sorting code provided by the acquirer.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "state",
              "short" => "Merchant's address: state.",
              "type" => "`$STRING`",
            },
            {
              "name" => "street",
              "req" => true,
              "short" => "Merchant's address: street and house number.",
              "type" => "`$STRING`",
            },
            {
              "name" => "terminal_country_code",
              "req" => true,
              "short" => "Terminal country code (must be in 'ISO-3166 ALPHA-3' format).",
              "type" => "`$STRING`",
            },
            {
              "name" => "terminal_language_code",
              "req" => true,
              "short" => "Terminal language code (must be in 'ISO 639-1' format).",
              "type" => "`$STRING`",
            },
            {
              "name" => "terminal_location",
              "req" => true,
              "short" => "Physical or logical location of the terminal.",
              "type" => "`$STRING`",
            },
            {
              "name" => "terminal_serial_number",
              "req" => true,
              "short" => "Terminal serial number.",
              "type" => "`$STRING`",
            },
            {
              "format" => "int32",
              "name" => "terminalid",
              "req" => true,
              "short" => "TECS terminalid given by Tecs processing engine.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "terminalid_acquirer",
              "short" => "Terminal ID as set by the acquirer (optional).",
              "type" => "`$STRING`",
            },
            {
              "format" => "email",
              "name" => "user_email",
              "short" => "Email address of the user acting on behalf of the merchant.",
              "type" => "`$STRING`",
            },
            {
              "name" => "user_phone_number",
              "short" => "Phone number of the user acting on behalf of the merchant.",
              "type" => "`$STRING`",
            },
            {
              "name" => "username",
              "short" => "Merchant username for MPOS.",
              "type" => "`$STRING`",
            },
            {
              "name" => "vu_nummer",
              "req" => true,
              "short" => "Merchant contract number with the acquirer.",
              "type" => "`$STRING`",
            },
            {
              "format" => "uri",
              "name" => "web_shop_url",
              "short" => "URL of the merchant's web shop.",
              "type" => "`$STRING`",
            },
            {
              "name" => "zipcode",
              "req" => true,
              "short" => "Merchant's address: postal code.",
              "type" => "`$STRING`",
            },
          ],
          "name" => "merchant_portal_api_controller",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/deactivateTerminal",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "deactivateTerminal",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "deactivateTerminal",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/reactivateTerminal",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "reactivateTerminal",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "reactivateTerminal",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/registerAdditionalTerminal",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "registerAdditionalTerminal",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "registerAdditionalTerminal",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/registerNewMerchant",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "registerNewMerchant",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "registerNewMerchant",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "merchant_portal_common_controller" => {
          "fields" => [],
          "name" => "merchant_portal_common_controller",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/merchantportalws/logDeveloperInfo",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "logDeveloperInfo",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "logDeveloperInfo",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/merchantportalws/version",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "version",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "version",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "merchant_portal_pam_contract_controller" => {
          "fields" => [
            {
              "name" => "language",
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "productOrderUUID",
              "req" => true,
              "type" => "`$STRING`",
            },
          ],
          "name" => "merchant_portal_pam_contract_controller",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/generateContract",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "generateContract",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "generateContract",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/uploadContract",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "uploadContract",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "uploadContract",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "merchant_portal_pam_document_controller" => {
          "fields" => [
            {
              "name" => "appFormFieldDescUUID",
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "packageOrderUUID",
              "short" => "UUID of the package order.",
              "type" => "`$STRING`",
            },
            {
              "name" => "productOrderUUID",
              "short" => "UUID of the product order.",
              "type" => "`$STRING`",
            },
          ],
          "name" => "merchant_portal_pam_document_controller",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/documentsList",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "documentsList",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "documentsList",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/downloadDocument",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "downloadDocument",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "downloadDocument",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "merchant_portal_pam_form_controller" => {
          "fields" => [
            {
              "name" => "appFormFieldsDescUUID",
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "filter",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "language",
              "op" => {
                "create" => {
                  "type" => "`$STRING`",
                },
              },
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "packageOrder",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "packageOrderUUID",
              "op" => {
                "create" => {
                  "type" => "`$STRING`",
                },
              },
              "req" => true,
              "short" => "UUID of the package order.",
              "type" => "`$STRING`",
            },
            {
              "name" => "packageUUID",
              "type" => "`$STRING`",
            },
            {
              "name" => "productOrderUUID",
              "op" => {
                "create" => {
                  "req" => true,
                  "type" => "`$STRING`",
                },
              },
              "short" => "UUID of the product order.",
              "type" => "`$STRING`",
            },
            {
              "name" => "productOrders",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "reasonOfReopening",
              "req" => true,
              "type" => "`$STRING`",
            },
          ],
          "name" => "merchant_portal_pam_form_controller",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/applicationForm",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "applicationForm",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "applicationForm",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/packageForm",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "packageForm",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "packageForm",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/reopenForm",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "reopenForm",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "reopenForm",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/secretKey",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "secretKey",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "secretKey",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/submitForm",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "submitForm",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "submitForm",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/submitValues",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "submitValues",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "submitValues",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "merchant_portal_pam_mandator_controller" => {
          "fields" => [
            {
              "name" => "clientSecret",
              "type" => "`$STRING`",
            },
            {
              "name" => "mandatorName",
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "notificationEmail",
              "type" => "`$STRING`",
            },
            {
              "name" => "packageUUID",
              "req" => true,
              "type" => "`$STRING`",
            },
          ],
          "name" => "merchant_portal_pam_mandator_controller",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/createMandatorConfig",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "createMandatorConfig",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "createMandatorConfig",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/introduceMandatorPackage",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "introduceMandatorPackage",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "introduceMandatorPackage",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/selfRegistrationLink",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "selfRegistrationLink",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "selfRegistrationLink",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "merchant_portal_pam_merchant_controller" => {
          "fields" => [
            {
              "name" => "additional_data",
              "short" => "Optional additional merchant-specific data related to enabling acquiring.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "businessRegistrationNumber",
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "city",
              "short" => "City where the merchant is located.",
              "type" => "`$STRING`",
            },
            {
              "name" => "companyName",
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "corporateUUID",
              "req" => true,
              "short" => "Unique identifier for the corporate entity.",
              "type" => "`$STRING`",
            },
            {
              "name" => "country",
              "short" => "Country where the merchant is located.",
              "type" => "`$STRING`",
            },
            {
              "name" => "currency",
              "req" => true,
              "short" => "Transaction currency in ISO 4217 format.",
              "type" => "`$STRING`",
            },
            {
              "name" => "email",
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "language",
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "login",
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "mandator",
              "req" => true,
              "short" => "Mandator name assigned by TECS.",
              "type" => "`$STRING`",
            },
            {
              "name" => "merchantContractNumber",
              "op" => {
                "create" => {
                  "type" => "`$STRING`",
                },
              },
              "req" => true,
              "short" => "Unique identifier for the merchant within a specific system.",
              "type" => "`$STRING`",
            },
            {
              "name" => "merchantName",
              "short" => "Name of the merchant.",
              "type" => "`$STRING`",
            },
            {
              "name" => "merchant_category_code",
              "short" => "Merchant Category Code (MCC) describing the merchant’s type of business.",
              "type" => "`$STRING`",
            },
            {
              "name" => "packageUUID",
              "short" => "UUID of the package.",
              "type" => "`$STRING`",
            },
            {
              "name" => "packageorderuuid",
              "req" => true,
              "short" => "Unique identifier for the registered merchant in the TECS system.",
              "type" => "`$STRING`",
            },
            {
              "name" => "phoneNumber",
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "postalCode",
              "short" => "Postal or ZIP code of the merchant’s location.",
              "type" => "`$STRING`",
            },
            {
              "name" => "productid_acquirer",
              "req" => true,
              "short" => "Identifier of the product for which acquiring is to be enabled.",
              "type" => "`$STRING`",
            },
            {
              "name" => "region",
              "short" => "State or province where the merchant is located.",
              "type" => "`$STRING`",
            },
            {
              "name" => "registrationNumber",
              "short" => "Business registration number.",
              "type" => "`$STRING`",
            },
            {
              "name" => "signature",
              "short" => "Signature value = saltAsHex-hashAsHex.",
              "type" => "`$STRING`",
            },
            {
              "name" => "street",
              "short" => "Street address of the merchant.",
              "type" => "`$STRING`",
            },
            {
              "name" => "terminalIds",
              "short" => "Optional list of terminal IDs for which acquiring should be activated.",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "terminalid_acquirer",
              "short" => "Optional terminal ID provided by the acquirer.",
              "type" => "`$STRING`",
            },
            {
              "name" => "vu_nummer",
              "req" => true,
              "short" => "Merchant contract number with the acquirer.",
              "type" => "`$STRING`",
            },
          ],
          "name" => "merchant_portal_pam_merchant_controller",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/contractNumber",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "contractNumber",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "contractNumber",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/registerAdditionalAcquiring",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "registerAdditionalAcquiring",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "registerAdditionalAcquiring",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/updateMerchant",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "updateMerchant",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "updateMerchant",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/registerMerchant",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "registerMerchant",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "registerMerchant",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "merchant_portal_pam_package_controller" => {
          "fields" => [
            {
              "name" => "consumerUUID",
              "type" => "`$STRING`",
            },
            {
              "name" => "corporateUUID",
              "type" => "`$STRING`",
            },
            {
              "name" => "country",
              "short" => "Country associated with the package.",
              "type" => "`$STRING`",
            },
            {
              "name" => "descriptionKey",
              "short" => "Key for the description of the package.",
              "type" => "`$STRING`",
            },
            {
              "name" => "filter",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "language",
              "op" => {
                "create" => {
                  "type" => "`$STRING`",
                },
              },
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "nameKey",
              "short" => "Key for the name of the package.",
              "type" => "`$STRING`",
            },
            {
              "name" => "packageStatus",
              "short" => "Status of the package.",
              "type" => "`$STRING`",
            },
            {
              "name" => "packageUUID",
              "req" => true,
              "short" => "Unique identifier for the package.",
              "type" => "`$STRING`",
            },
            {
              "name" => "pagination",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "sorting",
              "type" => "`$OBJECT`",
            },
          ],
          "name" => "merchant_portal_pam_package_controller",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/availablePackages",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "availablePackages",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "availablePackages",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/orderPackage",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "orderPackage",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "orderPackage",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/orderedPackages",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "orderedPackages",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "orderedPackages",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/packageTemplates",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "packageTemplates",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "packageTemplates",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/updatePackageData",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "updatePackageData",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "updatePackageData",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "merchant_portal_pam_product_controller" => {
          "fields" => [
            {
              "name" => "consumerUUID",
              "type" => "`$STRING`",
            },
            {
              "name" => "filter",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "language",
              "type" => "`$STRING`",
            },
            {
              "name" => "merchantID",
              "type" => "`$STRING`",
            },
            {
              "name" => "packageOrderUUID",
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "pagination",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "productOrderUUID",
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "productUUID",
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "reason_decline",
              "req" => true,
              "short" => "Reason for product decline.",
              "type" => "`$STRING`",
            },
            {
              "name" => "sorting",
              "type" => "`$OBJECT`",
            },
          ],
          "name" => "merchant_portal_pam_product_controller",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/approveProduct",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "approveProduct",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "approveProduct",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/declineProduct",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "declineProduct",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "declineProduct",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/orderAdditionalProduct",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "orderAdditionalProduct",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "orderAdditionalProduct",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/productsList",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "productsList",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "productsList",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "output_add_product" => {
          "fields" => [
            {
              "name" => "packageUUID",
              "req" => true,
              "short" => "Unique identifier for the package.",
              "type" => "`$STRING`",
            },
            {
              "name" => "productUUIDs",
              "req" => true,
              "short" => "The list of unique identifiers of the products.",
              "type" => "`$ARRAY`",
            },
            {
              "format" => "int32",
              "name" => "responseCode",
              "req" => true,
              "short" => "Response code.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "responseMessage",
              "req" => true,
              "short" => "Response message.",
              "type" => "`$STRING`",
            },
          ],
          "name" => "output_add_product",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/addProductsToPackage",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "addProductsToPackage",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "addProductsToPackage",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "output_create_product" => {
          "fields" => [
            {
              "name" => "acquirerId",
              "short" => "Unique identifier for the acquirer.",
              "type" => "`$STRING`",
            },
            {
              "name" => "allowMultipleOrders",
              "req" => true,
              "short" => "Indication whether multiple orders are allowed or not.",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "appFormTemplateName",
              "req" => true,
              "short" => "Name of the application form template.",
              "type" => "`$STRING`",
            },
            {
              "name" => "contractNeeded",
              "req" => true,
              "short" => "Indication whether contract is needed or not.",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "credentialsNeeded",
              "short" => "Indication whether credentials are needed or not.",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "descriptionKey",
              "req" => true,
              "short" => "Key indicator for product description.",
              "type" => "`$STRING`",
            },
            {
              "name" => "nameKey",
              "req" => true,
              "short" => "Key indicator for product name.",
              "type" => "`$STRING`",
            },
            {
              "name" => "prescreeningAllowed",
              "req" => true,
              "short" => "Indication whether prescreening is allowed or not.",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "productName",
              "req" => true,
              "short" => "Name of the product.",
              "type" => "`$STRING`",
            },
            {
              "format" => "int32",
              "name" => "responseCode",
              "req" => true,
              "short" => "Response code.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "responseMessage",
              "req" => true,
              "short" => "Response message.",
              "type" => "`$STRING`",
            },
            {
              "name" => "terminalTemplateName",
              "req" => true,
              "short" => "Name of the terminal template.",
              "type" => "`$STRING`",
            },
            {
              "name" => "vendorName",
              "req" => true,
              "short" => "Name of the vendor.",
              "type" => "`$STRING`",
            },
            {
              "name" => "xmlTemplateFile",
              "req" => true,
              "short" => "A string value containing the XML template file encoded in Base64.",
              "type" => "`$STRING`",
            },
          ],
          "name" => "output_create_product",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/createNewProduct",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "createNewProduct",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "createNewProduct",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "output_detail" => {
          "fields" => [
            {
              "name" => "batch",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "name" => "lines",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "progress",
              "type" => "`$OBJECT`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
          "name" => "output_detail",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/merchantportalws/batch/registerAdditionalTerminal/details/{id}",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "batch",
                    },
                    {
                      "lit" => "registerAdditionalTerminal",
                    },
                    {
                      "lit" => "details",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.details`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "batch",
                    "registerAdditionalTerminal",
                    "details",
                    "{id}",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "output_list" => {
          "fields" => [
            {
              "name" => "items",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "pagination",
              "op" => {
                "create" => {
                  "type" => "`$OBJECT`",
                },
              },
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "format" => "int32",
              "name" => "responseCode",
              "req" => true,
              "short" => "Response code.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "responseMessage",
              "req" => true,
              "short" => "Response message.",
              "type" => "`$STRING`",
            },
            {
              "name" => "sorting",
              "type" => "`$OBJECT`",
            },
          ],
          "name" => "output_list",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/batch/registerAdditionalTerminal/list",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "batch",
                    },
                    {
                      "lit" => "registerAdditionalTerminal",
                    },
                    {
                      "lit" => "list",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "batch",
                    "registerAdditionalTerminal",
                    "list",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "output_message" => {
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "format" => "int32",
              "name" => "responseCode",
              "req" => true,
              "short" => "Response code.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "responseMessage",
              "req" => true,
              "short" => "Response message.",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
          "name" => "output_message",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/merchantportalws/batch/registerAdditionalTerminal/restart/{id}",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "batch",
                    },
                    {
                      "lit" => "registerAdditionalTerminal",
                    },
                    {
                      "lit" => "restart",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "batch",
                    "registerAdditionalTerminal",
                    "restart",
                    "{id}",
                  ],
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/merchantportalws/batch/registerAdditionalTerminal/stop/{id}",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "batch",
                    },
                    {
                      "lit" => "registerAdditionalTerminal",
                    },
                    {
                      "lit" => "stop",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "batch",
                    "registerAdditionalTerminal",
                    "stop",
                    "{id}",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "output_move_tid" => {
          "fields" => [
            {
              "name" => "productOrderUUIDs",
              "req" => true,
              "type" => "`$ARRAY`",
            },
            {
              "format" => "int32",
              "name" => "responseCode",
              "req" => true,
              "short" => "Response code.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "responseMessage",
              "req" => true,
              "short" => "Response message.",
              "type" => "`$STRING`",
            },
            {
              "name" => "targetPackageOrderUUID",
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "targetProductOrderUUID",
              "req" => true,
              "type" => "`$STRING`",
            },
          ],
          "name" => "output_move_tid",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/moveTid",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "moveTid",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "moveTid",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "output_remove_product" => {
          "fields" => [
            {
              "name" => "packageUUID",
              "req" => true,
              "short" => "Unique identifier for the package.",
              "type" => "`$STRING`",
            },
            {
              "name" => "productUUIDs",
              "req" => true,
              "short" => "List of product unique identifiers.",
              "type" => "`$ARRAY`",
            },
            {
              "format" => "int32",
              "name" => "responseCode",
              "req" => true,
              "short" => "Response code.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "responseMessage",
              "req" => true,
              "short" => "Response message.",
              "type" => "`$STRING`",
            },
          ],
          "name" => "output_remove_product",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/removeProductsFromPackage",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "removeProductsFromPackage",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "removeProductsFromPackage",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "output_start" => {
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "format" => "int32",
              "name" => "responseCode",
              "req" => true,
              "short" => "Response code.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "responseMessage",
              "req" => true,
              "short" => "Response message.",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
          "name" => "output_start",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/batch/registerAdditionalTerminal/start",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "batch",
                    },
                    {
                      "lit" => "registerAdditionalTerminal",
                    },
                    {
                      "lit" => "start",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "batch",
                    "registerAdditionalTerminal",
                    "start",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "output_status" => {
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "format" => "int32",
              "name" => "percentage",
              "type" => "`$INTEGER`",
            },
            {
              "format" => "int32",
              "name" => "responseCode",
              "req" => true,
              "short" => "Response code.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "responseMessage",
              "req" => true,
              "short" => "Response message.",
              "type" => "`$STRING`",
            },
            {
              "name" => "status",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
          "name" => "output_status",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/merchantportalws/batch/registerAdditionalTerminal/status/{id}",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "batch",
                    },
                    {
                      "lit" => "registerAdditionalTerminal",
                    },
                    {
                      "lit" => "status",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "batch",
                    "registerAdditionalTerminal",
                    "status",
                    "{id}",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "output_update_product" => {
          "fields" => [
            {
              "name" => "allowMultipleOrders",
              "short" => "An attribute to indicate if multiple orders are allowed",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "appFormName",
              "short" => "The name of the application form",
              "type" => "`$STRING`",
            },
            {
              "name" => "contractNeeded",
              "short" => "An attribute to indicate if a contract is needed",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "credentialsNeeded",
              "short" => "An attribute to indicate if credentials are needed",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "descriptionKey",
              "short" => "The description of the product",
              "type" => "`$STRING`",
            },
            {
              "name" => "nameKey",
              "short" => "The key of the product name",
              "type" => "`$STRING`",
            },
            {
              "name" => "prescreeningAllowed",
              "short" => "An attribute to indicate if prescreening is allowed",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "productName",
              "short" => "The name of the product",
              "type" => "`$STRING`",
            },
            {
              "name" => "productStatus",
              "short" => "The status of the product",
              "type" => "`$STRING`",
            },
            {
              "name" => "productUUID",
              "req" => true,
              "short" => "The UUID of the product to update",
              "type" => "`$STRING`",
            },
            {
              "format" => "int32",
              "name" => "responseCode",
              "req" => true,
              "short" => "Response code.",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "responseMessage",
              "req" => true,
              "short" => "Response message.",
              "type" => "`$STRING`",
            },
            {
              "name" => "vendorName",
              "short" => "The name of the vendor",
              "type" => "`$STRING`",
            },
          ],
          "name" => "output_update_product",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "authorization",
                        "orig" => "authorization",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/merchantportalws/updateProduct",
                  "segments" => [
                    {
                      "lit" => "merchantportalws",
                    },
                    {
                      "lit" => "updateProduct",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "authorization",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "merchantportalws",
                    "updateProduct",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    BluefinTecsMerchantPortalFeatures.make_feature(name)
  end
end
