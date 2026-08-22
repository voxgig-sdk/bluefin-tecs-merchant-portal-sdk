# BluefinTecsMerchantPortal SDK configuration


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
    return {
        "main": {
            "name": "BluefinTecsMerchantPortal",
            "slug": "bluefin-tecs-merchant-portal",
            "version": "0.1.1",
            "target": "py",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://test.tecs.at",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "merchant_portal_api_controller": {},
                "merchant_portal_common_controller": {},
                "merchant_portal_pam_contract_controller": {},
                "merchant_portal_pam_document_controller": {},
                "merchant_portal_pam_form_controller": {},
                "merchant_portal_pam_mandator_controller": {},
                "merchant_portal_pam_merchant_controller": {},
                "merchant_portal_pam_package_controller": {},
                "merchant_portal_pam_product_controller": {},
                "output_add_product": {},
                "output_create_product": {},
                "output_detail": {},
                "output_list": {},
                "output_message": {},
                "output_move_tid": {},
                "output_remove_product": {},
                "output_start": {},
                "output_status": {},
                "output_update_product": {},
            },
        },
        "entity": {
      "merchant_portal_api_controller": {
        "fields": [
          {
            "name": "account_number",
            "short": "Account number provided by the acquirer.",
            "type": "`$INTEGER`",
          },
          {
            "name": "additional_data",
            "short": "Arbitrary merchant-specific data related to terminal registration.",
            "type": "`$OBJECT`",
          },
          {
            "name": "business_reg_number",
            "req": True,
            "short": "Merchant business registration number as stated in the company registry.",
            "type": "`$STRING`",
          },
          {
            "name": "city",
            "req": True,
            "short": "Merchant's address: city.",
            "type": "`$STRING`",
          },
          {
            "name": "corporateuuid",
            "short": "Unique identifier for the corporate entity (UUID format).",
            "type": "`$STRING`",
          },
          {
            "name": "country",
            "req": True,
            "short": "Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format).",
            "type": "`$STRING`",
          },
          {
            "name": "currency",
            "req": True,
            "short": "Transaction currency (must be in \"ISO 4217\" format).",
            "type": "`$STRING`",
          },
          {
            "name": "merchant_category_code",
            "req": True,
            "short": "Merchant category code as defined by the payment network.",
            "type": "`$INTEGER`",
          },
          {
            "name": "merchant_email",
            "short": "Merchant's email address for receiving notifications.",
            "type": "`$STRING`",
          },
          {
            "name": "merchant_name",
            "req": True,
            "short": "The officially incorporated company name of the merchant.",
            "type": "`$STRING`",
          },
          {
            "name": "merchant_phone_number",
            "short": "Merchant's phone number for notifications.",
            "type": "`$STRING`",
          },
          {
            "name": "packageid",
            "req": True,
            "short": "Identifier of the package in the TECS processing engine provided by TECS.",
            "type": "`$STRING`",
          },
          {
            "name": "packageorderuuid",
            "req": True,
            "short": "Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call.",
            "type": "`$STRING`",
          },
          {
            "name": "password",
            "short": "Merchant password for MPOS.",
            "type": "`$STRING`",
          },
          {
            "name": "productid",
            "short": "Identifier of the product for which terminal registration is to be performed.",
            "type": "`$STRING`",
          },
          {
            "name": "productid_acquirer",
            "short": "Identifier of the product for which acquiring is enabled.",
            "type": "`$STRING`",
          },
          {
            "name": "reason_deactivation",
            "req": True,
            "short": "Reason for terminal deactivation.",
            "type": "`$STRING`",
          },
          {
            "name": "reason_reactivation",
            "req": True,
            "short": "Reason for terminal reactivation.",
            "type": "`$STRING`",
          },
          {
            "name": "sorting_code",
            "short": "Sorting code provided by the acquirer.",
            "type": "`$INTEGER`",
          },
          {
            "name": "state",
            "short": "Merchant's address: state.",
            "type": "`$STRING`",
          },
          {
            "name": "street",
            "req": True,
            "short": "Merchant's address: street and house number.",
            "type": "`$STRING`",
          },
          {
            "name": "terminal_country_code",
            "req": True,
            "short": "Terminal country code (must be in 'ISO-3166 ALPHA-3' format).",
            "type": "`$STRING`",
          },
          {
            "name": "terminal_language_code",
            "req": True,
            "short": "Terminal language code (must be in 'ISO 639-1' format).",
            "type": "`$STRING`",
          },
          {
            "name": "terminal_location",
            "req": True,
            "short": "Physical or logical location of the terminal.",
            "type": "`$STRING`",
          },
          {
            "name": "terminal_serial_number",
            "req": True,
            "short": "Terminal serial number.",
            "type": "`$STRING`",
          },
          {
            "name": "terminalid",
            "req": True,
            "short": "TECS terminalid given by Tecs processing engine.",
            "type": "`$INTEGER`",
          },
          {
            "name": "terminalid_acquirer",
            "short": "Terminal ID as set by the acquirer (optional).",
            "type": "`$STRING`",
          },
          {
            "name": "user_email",
            "short": "Email address of the user acting on behalf of the merchant.",
            "type": "`$STRING`",
          },
          {
            "name": "user_phone_number",
            "short": "Phone number of the user acting on behalf of the merchant.",
            "type": "`$STRING`",
          },
          {
            "name": "username",
            "short": "Merchant username for MPOS.",
            "type": "`$STRING`",
          },
          {
            "name": "vu_nummer",
            "req": True,
            "short": "Merchant contract number with the acquirer.",
            "type": "`$STRING`",
          },
          {
            "name": "web_shop_url",
            "short": "URL of the merchant's web shop.",
            "type": "`$STRING`",
          },
          {
            "name": "zipcode",
            "req": True,
            "short": "Merchant's address: postal code.",
            "type": "`$STRING`",
          },
        ],
        "name": "merchant_portal_api_controller",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/deactivateTerminal",
                "parts": [
                  "merchantportalws",
                  "deactivateTerminal",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/reactivateTerminal",
                "parts": [
                  "merchantportalws",
                  "reactivateTerminal",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/registerAdditionalTerminal",
                "parts": [
                  "merchantportalws",
                  "registerAdditionalTerminal",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/registerNewMerchant",
                "parts": [
                  "merchantportalws",
                  "registerNewMerchant",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "merchant_portal_common_controller": {
        "fields": [],
        "name": "merchant_portal_common_controller",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/merchantportalws/logDeveloperInfo",
                "parts": [
                  "merchantportalws",
                  "logDeveloperInfo",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/merchantportalws/version",
                "parts": [
                  "merchantportalws",
                  "version",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "merchant_portal_pam_contract_controller": {
        "fields": [
          {
            "name": "language",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "productOrderUUID",
            "req": True,
            "type": "`$STRING`",
          },
        ],
        "name": "merchant_portal_pam_contract_controller",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/generateContract",
                "parts": [
                  "merchantportalws",
                  "generateContract",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/uploadContract",
                "parts": [
                  "merchantportalws",
                  "uploadContract",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "merchant_portal_pam_document_controller": {
        "fields": [
          {
            "name": "appFormFieldDescUUID",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "packageOrderUUID",
            "short": "UUID of the package order.",
            "type": "`$STRING`",
          },
          {
            "name": "productOrderUUID",
            "short": "UUID of the product order.",
            "type": "`$STRING`",
          },
        ],
        "name": "merchant_portal_pam_document_controller",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/documentsList",
                "parts": [
                  "merchantportalws",
                  "documentsList",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/downloadDocument",
                "parts": [
                  "merchantportalws",
                  "downloadDocument",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "merchant_portal_pam_form_controller": {
        "fields": [
          {
            "name": "appFormFieldsDescUUID",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "filter",
            "type": "`$OBJECT`",
          },
          {
            "name": "language",
            "op": {
              "create": {
                "type": "`$STRING`",
              },
            },
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "packageOrder",
            "type": "`$OBJECT`",
          },
          {
            "name": "packageOrderUUID",
            "op": {
              "create": {
                "type": "`$STRING`",
              },
            },
            "req": True,
            "short": "UUID of the package order.",
            "type": "`$STRING`",
          },
          {
            "name": "packageUUID",
            "type": "`$STRING`",
          },
          {
            "name": "productOrderUUID",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "UUID of the product order.",
            "type": "`$STRING`",
          },
          {
            "name": "productOrders",
            "type": "`$ARRAY`",
          },
          {
            "name": "reasonOfReopening",
            "req": True,
            "type": "`$STRING`",
          },
        ],
        "name": "merchant_portal_pam_form_controller",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/applicationForm",
                "parts": [
                  "merchantportalws",
                  "applicationForm",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/packageForm",
                "parts": [
                  "merchantportalws",
                  "packageForm",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/reopenForm",
                "parts": [
                  "merchantportalws",
                  "reopenForm",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/secretKey",
                "parts": [
                  "merchantportalws",
                  "secretKey",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/submitForm",
                "parts": [
                  "merchantportalws",
                  "submitForm",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/submitValues",
                "parts": [
                  "merchantportalws",
                  "submitValues",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "merchant_portal_pam_mandator_controller": {
        "fields": [
          {
            "name": "clientSecret",
            "type": "`$STRING`",
          },
          {
            "name": "mandatorName",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "notificationEmail",
            "type": "`$STRING`",
          },
          {
            "name": "packageUUID",
            "req": True,
            "type": "`$STRING`",
          },
        ],
        "name": "merchant_portal_pam_mandator_controller",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/createMandatorConfig",
                "parts": [
                  "merchantportalws",
                  "createMandatorConfig",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/introduceMandatorPackage",
                "parts": [
                  "merchantportalws",
                  "introduceMandatorPackage",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/selfRegistrationLink",
                "parts": [
                  "merchantportalws",
                  "selfRegistrationLink",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "merchant_portal_pam_merchant_controller": {
        "fields": [
          {
            "name": "additional_data",
            "short": "Optional additional merchant-specific data related to enabling acquiring.",
            "type": "`$OBJECT`",
          },
          {
            "name": "businessRegistrationNumber",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "city",
            "short": "City where the merchant is located.",
            "type": "`$STRING`",
          },
          {
            "name": "companyName",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "corporateUUID",
            "req": True,
            "short": "Unique identifier for the corporate entity.",
            "type": "`$STRING`",
          },
          {
            "name": "country",
            "short": "Country where the merchant is located.",
            "type": "`$STRING`",
          },
          {
            "name": "currency",
            "req": True,
            "short": "Transaction currency in ISO 4217 format.",
            "type": "`$STRING`",
          },
          {
            "name": "email",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "language",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "login",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "mandator",
            "req": True,
            "short": "Mandator name assigned by TECS.",
            "type": "`$STRING`",
          },
          {
            "name": "merchantContractNumber",
            "op": {
              "create": {
                "type": "`$STRING`",
              },
            },
            "req": True,
            "short": "Unique identifier for the merchant within a specific system.",
            "type": "`$STRING`",
          },
          {
            "name": "merchantName",
            "short": "Name of the merchant.",
            "type": "`$STRING`",
          },
          {
            "name": "merchant_category_code",
            "short": "Merchant Category Code (MCC) describing the merchant’s type of business.",
            "type": "`$STRING`",
          },
          {
            "name": "packageUUID",
            "short": "UUID of the package.",
            "type": "`$STRING`",
          },
          {
            "name": "packageorderuuid",
            "req": True,
            "short": "Unique identifier for the registered merchant in the TECS system.",
            "type": "`$STRING`",
          },
          {
            "name": "phoneNumber",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "postalCode",
            "short": "Postal or ZIP code of the merchant’s location.",
            "type": "`$STRING`",
          },
          {
            "name": "productid_acquirer",
            "req": True,
            "short": "Identifier of the product for which acquiring is to be enabled.",
            "type": "`$STRING`",
          },
          {
            "name": "region",
            "short": "State or province where the merchant is located.",
            "type": "`$STRING`",
          },
          {
            "name": "registrationNumber",
            "short": "Business registration number.",
            "type": "`$STRING`",
          },
          {
            "name": "signature",
            "short": "Signature value = saltAsHex-hashAsHex.",
            "type": "`$STRING`",
          },
          {
            "name": "street",
            "short": "Street address of the merchant.",
            "type": "`$STRING`",
          },
          {
            "name": "terminalIds",
            "short": "Optional list of terminal IDs for which acquiring should be activated.",
            "type": "`$ARRAY`",
          },
          {
            "name": "terminalid_acquirer",
            "short": "Optional terminal ID provided by the acquirer.",
            "type": "`$STRING`",
          },
          {
            "name": "vu_nummer",
            "req": True,
            "short": "Merchant contract number with the acquirer.",
            "type": "`$STRING`",
          },
        ],
        "name": "merchant_portal_pam_merchant_controller",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/contractNumber",
                "parts": [
                  "merchantportalws",
                  "contractNumber",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/registerAdditionalAcquiring",
                "parts": [
                  "merchantportalws",
                  "registerAdditionalAcquiring",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/updateMerchant",
                "parts": [
                  "merchantportalws",
                  "updateMerchant",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {},
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/registerMerchant",
                "parts": [
                  "merchantportalws",
                  "registerMerchant",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "merchant_portal_pam_package_controller": {
        "fields": [
          {
            "name": "consumerUUID",
            "type": "`$STRING`",
          },
          {
            "name": "corporateUUID",
            "type": "`$STRING`",
          },
          {
            "name": "country",
            "short": "Country associated with the package.",
            "type": "`$STRING`",
          },
          {
            "name": "descriptionKey",
            "short": "Key for the description of the package.",
            "type": "`$STRING`",
          },
          {
            "name": "filter",
            "type": "`$OBJECT`",
          },
          {
            "name": "language",
            "op": {
              "create": {
                "type": "`$STRING`",
              },
            },
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "nameKey",
            "short": "Key for the name of the package.",
            "type": "`$STRING`",
          },
          {
            "name": "packageStatus",
            "short": "Status of the package.",
            "type": "`$STRING`",
          },
          {
            "name": "packageUUID",
            "req": True,
            "short": "Unique identifier for the package.",
            "type": "`$STRING`",
          },
          {
            "name": "pagination",
            "type": "`$OBJECT`",
          },
          {
            "name": "sorting",
            "type": "`$OBJECT`",
          },
        ],
        "name": "merchant_portal_pam_package_controller",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/availablePackages",
                "parts": [
                  "merchantportalws",
                  "availablePackages",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/orderPackage",
                "parts": [
                  "merchantportalws",
                  "orderPackage",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/orderedPackages",
                "parts": [
                  "merchantportalws",
                  "orderedPackages",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/packageTemplates",
                "parts": [
                  "merchantportalws",
                  "packageTemplates",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/updatePackageData",
                "parts": [
                  "merchantportalws",
                  "updatePackageData",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "merchant_portal_pam_product_controller": {
        "fields": [
          {
            "name": "consumerUUID",
            "type": "`$STRING`",
          },
          {
            "name": "filter",
            "type": "`$OBJECT`",
          },
          {
            "name": "language",
            "type": "`$STRING`",
          },
          {
            "name": "merchantID",
            "type": "`$STRING`",
          },
          {
            "name": "packageOrderUUID",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "pagination",
            "type": "`$OBJECT`",
          },
          {
            "name": "productOrderUUID",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "productUUID",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "reason_decline",
            "req": True,
            "short": "Reason for product decline.",
            "type": "`$STRING`",
          },
          {
            "name": "sorting",
            "type": "`$OBJECT`",
          },
        ],
        "name": "merchant_portal_pam_product_controller",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/approveProduct",
                "parts": [
                  "merchantportalws",
                  "approveProduct",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/declineProduct",
                "parts": [
                  "merchantportalws",
                  "declineProduct",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/orderAdditionalProduct",
                "parts": [
                  "merchantportalws",
                  "orderAdditionalProduct",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/productsList",
                "parts": [
                  "merchantportalws",
                  "productsList",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_add_product": {
        "fields": [
          {
            "name": "packageUUID",
            "req": True,
            "short": "Unique identifier for the package.",
            "type": "`$STRING`",
          },
          {
            "name": "productUUIDs",
            "req": True,
            "short": "The list of unique identifiers of the products.",
            "type": "`$ARRAY`",
          },
          {
            "name": "responseCode",
            "req": True,
            "short": "Response code.",
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
            "short": "Response message.",
            "type": "`$STRING`",
          },
        ],
        "name": "output_add_product",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/addProductsToPackage",
                "parts": [
                  "merchantportalws",
                  "addProductsToPackage",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_create_product": {
        "fields": [
          {
            "name": "acquirerId",
            "short": "Unique identifier for the acquirer.",
            "type": "`$STRING`",
          },
          {
            "name": "allowMultipleOrders",
            "req": True,
            "short": "Indication whether multiple orders are allowed or not.",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "appFormTemplateName",
            "req": True,
            "short": "Name of the application form template.",
            "type": "`$STRING`",
          },
          {
            "name": "contractNeeded",
            "req": True,
            "short": "Indication whether contract is needed or not.",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "credentialsNeeded",
            "short": "Indication whether credentials are needed or not.",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "descriptionKey",
            "req": True,
            "short": "Key indicator for product description.",
            "type": "`$STRING`",
          },
          {
            "name": "nameKey",
            "req": True,
            "short": "Key indicator for product name.",
            "type": "`$STRING`",
          },
          {
            "name": "prescreeningAllowed",
            "req": True,
            "short": "Indication whether prescreening is allowed or not.",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "productName",
            "req": True,
            "short": "Name of the product.",
            "type": "`$STRING`",
          },
          {
            "name": "responseCode",
            "req": True,
            "short": "Response code.",
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
            "short": "Response message.",
            "type": "`$STRING`",
          },
          {
            "name": "terminalTemplateName",
            "req": True,
            "short": "Name of the terminal template.",
            "type": "`$STRING`",
          },
          {
            "name": "vendorName",
            "req": True,
            "short": "Name of the vendor.",
            "type": "`$STRING`",
          },
          {
            "name": "xmlTemplateFile",
            "req": True,
            "short": "A string value containing the XML template file encoded in Base64.",
            "type": "`$STRING`",
          },
        ],
        "name": "output_create_product",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/createNewProduct",
                "parts": [
                  "merchantportalws",
                  "createNewProduct",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_detail": {
        "fields": [
          {
            "name": "batch",
            "type": "`$OBJECT`",
          },
          {
            "name": "lines",
            "type": "`$OBJECT`",
          },
          {
            "name": "progress",
            "type": "`$OBJECT`",
          },
        ],
        "name": "output_detail",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                  "params": [
                    {
                      "kind": "param",
                      "name": "id",
                      "orig": "id",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/merchantportalws/batch/registerAdditionalTerminal/details/{id}",
                "parts": [
                  "merchantportalws",
                  "batch",
                  "registerAdditionalTerminal",
                  "details",
                  "{id}",
                ],
                "select": {
                  "exist": [
                    "authorization",
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.details`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_list": {
        "fields": [
          {
            "name": "items",
            "type": "`$ARRAY`",
          },
          {
            "name": "pagination",
            "op": {
              "create": {
                "type": "`$OBJECT`",
              },
            },
            "req": True,
            "type": "`$OBJECT`",
          },
          {
            "name": "responseCode",
            "req": True,
            "short": "Response code.",
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
            "short": "Response message.",
            "type": "`$STRING`",
          },
          {
            "name": "sorting",
            "type": "`$OBJECT`",
          },
        ],
        "name": "output_list",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/batch/registerAdditionalTerminal/list",
                "parts": [
                  "merchantportalws",
                  "batch",
                  "registerAdditionalTerminal",
                  "list",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_message": {
        "fields": [
          {
            "name": "responseCode",
            "req": True,
            "short": "Response code.",
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
            "short": "Response message.",
            "type": "`$STRING`",
          },
        ],
        "name": "output_message",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                  "params": [
                    {
                      "kind": "param",
                      "name": "id",
                      "orig": "id",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/merchantportalws/batch/registerAdditionalTerminal/restart/{id}",
                "parts": [
                  "merchantportalws",
                  "batch",
                  "registerAdditionalTerminal",
                  "restart",
                  "{id}",
                ],
                "select": {
                  "exist": [
                    "authorization",
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                  "params": [
                    {
                      "kind": "param",
                      "name": "id",
                      "orig": "id",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/merchantportalws/batch/registerAdditionalTerminal/stop/{id}",
                "parts": [
                  "merchantportalws",
                  "batch",
                  "registerAdditionalTerminal",
                  "stop",
                  "{id}",
                ],
                "select": {
                  "exist": [
                    "authorization",
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_move_tid": {
        "fields": [
          {
            "name": "productOrderUUIDs",
            "req": True,
            "type": "`$ARRAY`",
          },
          {
            "name": "responseCode",
            "req": True,
            "short": "Response code.",
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
            "short": "Response message.",
            "type": "`$STRING`",
          },
          {
            "name": "targetPackageOrderUUID",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "targetProductOrderUUID",
            "req": True,
            "type": "`$STRING`",
          },
        ],
        "name": "output_move_tid",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/moveTid",
                "parts": [
                  "merchantportalws",
                  "moveTid",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_remove_product": {
        "fields": [
          {
            "name": "packageUUID",
            "req": True,
            "short": "Unique identifier for the package.",
            "type": "`$STRING`",
          },
          {
            "name": "productUUIDs",
            "req": True,
            "short": "List of product unique identifiers.",
            "type": "`$ARRAY`",
          },
          {
            "name": "responseCode",
            "req": True,
            "short": "Response code.",
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
            "short": "Response message.",
            "type": "`$STRING`",
          },
        ],
        "name": "output_remove_product",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/removeProductsFromPackage",
                "parts": [
                  "merchantportalws",
                  "removeProductsFromPackage",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_start": {
        "fields": [
          {
            "name": "id",
            "type": "`$STRING`",
          },
          {
            "name": "responseCode",
            "req": True,
            "short": "Response code.",
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
            "short": "Response message.",
            "type": "`$STRING`",
          },
        ],
        "name": "output_start",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/batch/registerAdditionalTerminal/start",
                "parts": [
                  "merchantportalws",
                  "batch",
                  "registerAdditionalTerminal",
                  "start",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_status": {
        "fields": [
          {
            "name": "percentage",
            "type": "`$INTEGER`",
          },
          {
            "name": "responseCode",
            "req": True,
            "short": "Response code.",
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
            "short": "Response message.",
            "type": "`$STRING`",
          },
          {
            "name": "status",
            "type": "`$STRING`",
          },
        ],
        "name": "output_status",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                  "params": [
                    {
                      "kind": "param",
                      "name": "id",
                      "orig": "id",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/merchantportalws/batch/registerAdditionalTerminal/status/{id}",
                "parts": [
                  "merchantportalws",
                  "batch",
                  "registerAdditionalTerminal",
                  "status",
                  "{id}",
                ],
                "select": {
                  "exist": [
                    "authorization",
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_update_product": {
        "fields": [
          {
            "name": "allowMultipleOrders",
            "short": "An attribute to indicate if multiple orders are allowed",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "appFormName",
            "short": "The name of the application form",
            "type": "`$STRING`",
          },
          {
            "name": "contractNeeded",
            "short": "An attribute to indicate if a contract is needed",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "credentialsNeeded",
            "short": "An attribute to indicate if credentials are needed",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "descriptionKey",
            "short": "The description of the product",
            "type": "`$STRING`",
          },
          {
            "name": "nameKey",
            "short": "The key of the product name",
            "type": "`$STRING`",
          },
          {
            "name": "prescreeningAllowed",
            "short": "An attribute to indicate if prescreening is allowed",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "productName",
            "short": "The name of the product",
            "type": "`$STRING`",
          },
          {
            "name": "productStatus",
            "short": "The status of the product",
            "type": "`$STRING`",
          },
          {
            "name": "productUUID",
            "req": True,
            "short": "The UUID of the product to update",
            "type": "`$STRING`",
          },
          {
            "name": "responseCode",
            "req": True,
            "short": "Response code.",
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
            "short": "Response message.",
            "type": "`$STRING`",
          },
          {
            "name": "vendorName",
            "short": "The name of the vendor",
            "type": "`$STRING`",
          },
        ],
        "name": "output_update_product",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/merchantportalws/updateProduct",
                "parts": [
                  "merchantportalws",
                  "updateProduct",
                ],
                "select": {
                  "exist": [
                    "authorization",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
