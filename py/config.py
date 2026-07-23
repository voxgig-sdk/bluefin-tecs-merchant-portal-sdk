# BluefinTecsMerchantPortal SDK configuration


def make_config():
    return {
        "main": {
            "name": "BluefinTecsMerchantPortal",
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
            "active": True,
            "name": "account_number",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "additional_data",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "business_reg_number",
            "req": True,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "city",
            "req": True,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "corporateuuid",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "country",
            "req": True,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "currency",
            "req": True,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "merchant_category_code",
            "req": True,
            "type": "`$INTEGER`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "merchant_email",
            "req": False,
            "type": "`$STRING`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "merchant_name",
            "req": True,
            "type": "`$STRING`",
            "index$": 9,
          },
          {
            "active": True,
            "name": "merchant_phone_number",
            "req": False,
            "type": "`$STRING`",
            "index$": 10,
          },
          {
            "active": True,
            "name": "packageid",
            "req": True,
            "type": "`$STRING`",
            "index$": 11,
          },
          {
            "active": True,
            "name": "packageorderuuid",
            "req": True,
            "type": "`$STRING`",
            "index$": 12,
          },
          {
            "active": True,
            "name": "password",
            "req": False,
            "type": "`$STRING`",
            "index$": 13,
          },
          {
            "active": True,
            "name": "productid",
            "req": False,
            "type": "`$STRING`",
            "index$": 14,
          },
          {
            "active": True,
            "name": "productid_acquirer",
            "req": False,
            "type": "`$STRING`",
            "index$": 15,
          },
          {
            "active": True,
            "name": "reason_deactivation",
            "req": True,
            "type": "`$STRING`",
            "index$": 16,
          },
          {
            "active": True,
            "name": "reason_reactivation",
            "req": True,
            "type": "`$STRING`",
            "index$": 17,
          },
          {
            "active": True,
            "name": "sorting_code",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 18,
          },
          {
            "active": True,
            "name": "state",
            "req": False,
            "type": "`$STRING`",
            "index$": 19,
          },
          {
            "active": True,
            "name": "street",
            "req": True,
            "type": "`$STRING`",
            "index$": 20,
          },
          {
            "active": True,
            "name": "terminal_country_code",
            "req": True,
            "type": "`$STRING`",
            "index$": 21,
          },
          {
            "active": True,
            "name": "terminal_language_code",
            "req": True,
            "type": "`$STRING`",
            "index$": 22,
          },
          {
            "active": True,
            "name": "terminal_location",
            "req": True,
            "type": "`$STRING`",
            "index$": 23,
          },
          {
            "active": True,
            "name": "terminal_serial_number",
            "req": True,
            "type": "`$STRING`",
            "index$": 24,
          },
          {
            "active": True,
            "name": "terminalid",
            "req": True,
            "type": "`$INTEGER`",
            "index$": 25,
          },
          {
            "active": True,
            "name": "terminalid_acquirer",
            "req": False,
            "type": "`$STRING`",
            "index$": 26,
          },
          {
            "active": True,
            "name": "user_email",
            "req": False,
            "type": "`$STRING`",
            "index$": 27,
          },
          {
            "active": True,
            "name": "user_phone_number",
            "req": False,
            "type": "`$STRING`",
            "index$": 28,
          },
          {
            "active": True,
            "name": "username",
            "req": False,
            "type": "`$STRING`",
            "index$": 29,
          },
          {
            "active": True,
            "name": "vu_nummer",
            "req": True,
            "type": "`$STRING`",
            "index$": 30,
          },
          {
            "active": True,
            "name": "web_shop_url",
            "req": False,
            "type": "`$STRING`",
            "index$": 31,
          },
          {
            "active": True,
            "name": "zipcode",
            "req": True,
            "type": "`$STRING`",
            "index$": 32,
          },
        ],
        "name": "merchant_portal_api_controller",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 0,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 1,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 2,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 3,
              },
            ],
            "key$": "create",
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
                "active": True,
                "args": {},
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
                "index$": 0,
              },
              {
                "active": True,
                "args": {},
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
                "index$": 1,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "merchant_portal_pam_contract_controller": {
        "fields": [
          {
            "active": True,
            "name": "language",
            "req": True,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "product_order_uuid",
            "req": True,
            "type": "`$STRING`",
            "index$": 1,
          },
        ],
        "name": "merchant_portal_pam_contract_controller",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 0,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 1,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "merchant_portal_pam_document_controller": {
        "fields": [
          {
            "active": True,
            "name": "app_form_field_desc_uuid",
            "req": True,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "package_order_uuid",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "product_order_uuid",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
        ],
        "name": "merchant_portal_pam_document_controller",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 0,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 1,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "merchant_portal_pam_form_controller": {
        "fields": [
          {
            "active": True,
            "name": "app_form_fields_desc_uuid",
            "req": True,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "filter",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "language",
            "op": {
              "create": {
                "req": False,
                "type": "`$STRING`",
              },
            },
            "req": True,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "package_order",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "package_order_uuid",
            "op": {
              "create": {
                "req": False,
                "type": "`$STRING`",
              },
            },
            "req": True,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "package_uuid",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "product_order",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "product_order_uuid",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "req": False,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "reason_of_reopening",
            "req": True,
            "type": "`$STRING`",
            "index$": 8,
          },
        ],
        "name": "merchant_portal_pam_form_controller",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 0,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 1,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 2,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 3,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 4,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 5,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "merchant_portal_pam_mandator_controller": {
        "fields": [
          {
            "active": True,
            "name": "client_secret",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "mandator_name",
            "req": True,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "notification_email",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "package_uuid",
            "req": True,
            "type": "`$STRING`",
            "index$": 3,
          },
        ],
        "name": "merchant_portal_pam_mandator_controller",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 0,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 1,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 2,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "merchant_portal_pam_merchant_controller": {
        "fields": [
          {
            "active": True,
            "name": "additional_data",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "business_registration_number",
            "req": True,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "city",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "company_name",
            "req": True,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "corporate_uuid",
            "req": True,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "country",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "currency",
            "req": True,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "email",
            "req": True,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "language",
            "req": True,
            "type": "`$STRING`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "login",
            "req": True,
            "type": "`$STRING`",
            "index$": 9,
          },
          {
            "active": True,
            "name": "mandator",
            "req": True,
            "type": "`$STRING`",
            "index$": 10,
          },
          {
            "active": True,
            "name": "merchant_category_code",
            "req": False,
            "type": "`$STRING`",
            "index$": 11,
          },
          {
            "active": True,
            "name": "merchant_contract_number",
            "op": {
              "create": {
                "req": False,
                "type": "`$STRING`",
              },
            },
            "req": True,
            "type": "`$STRING`",
            "index$": 12,
          },
          {
            "active": True,
            "name": "merchant_name",
            "req": False,
            "type": "`$STRING`",
            "index$": 13,
          },
          {
            "active": True,
            "name": "package_uuid",
            "req": False,
            "type": "`$STRING`",
            "index$": 14,
          },
          {
            "active": True,
            "name": "packageorderuuid",
            "req": True,
            "type": "`$STRING`",
            "index$": 15,
          },
          {
            "active": True,
            "name": "phone_number",
            "req": True,
            "type": "`$STRING`",
            "index$": 16,
          },
          {
            "active": True,
            "name": "postal_code",
            "req": False,
            "type": "`$STRING`",
            "index$": 17,
          },
          {
            "active": True,
            "name": "productid_acquirer",
            "req": True,
            "type": "`$STRING`",
            "index$": 18,
          },
          {
            "active": True,
            "name": "region",
            "req": False,
            "type": "`$STRING`",
            "index$": 19,
          },
          {
            "active": True,
            "name": "registration_number",
            "req": False,
            "type": "`$STRING`",
            "index$": 20,
          },
          {
            "active": True,
            "name": "signature",
            "req": False,
            "type": "`$STRING`",
            "index$": 21,
          },
          {
            "active": True,
            "name": "street",
            "req": False,
            "type": "`$STRING`",
            "index$": 22,
          },
          {
            "active": True,
            "name": "terminal_id",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 23,
          },
          {
            "active": True,
            "name": "terminalid_acquirer",
            "req": False,
            "type": "`$STRING`",
            "index$": 24,
          },
          {
            "active": True,
            "name": "vu_nummer",
            "req": True,
            "type": "`$STRING`",
            "index$": 25,
          },
        ],
        "name": "merchant_portal_pam_merchant_controller",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 0,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 1,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 2,
              },
              {
                "active": True,
                "args": {},
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
                "index$": 3,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "merchant_portal_pam_package_controller": {
        "fields": [
          {
            "active": True,
            "name": "consumer_uuid",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "corporate_uuid",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "country",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "description_key",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "filter",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "language",
            "op": {
              "create": {
                "req": False,
                "type": "`$STRING`",
              },
            },
            "req": True,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "name_key",
            "req": False,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "package_status",
            "req": False,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "package_uuid",
            "req": True,
            "type": "`$STRING`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "pagination",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 9,
          },
          {
            "active": True,
            "name": "sorting",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 10,
          },
        ],
        "name": "merchant_portal_pam_package_controller",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 0,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 1,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 2,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 3,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": False,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 4,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "merchant_portal_pam_product_controller": {
        "fields": [
          {
            "active": True,
            "name": "consumer_uuid",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "filter",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "language",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "merchant_id",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "package_order_uuid",
            "req": True,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "pagination",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "product_order_uuid",
            "req": True,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "product_uuid",
            "req": True,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "reason_decline",
            "req": True,
            "type": "`$STRING`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "sorting",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 9,
          },
        ],
        "name": "merchant_portal_pam_product_controller",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 0,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 1,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 2,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 3,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_add_product": {
        "fields": [
          {
            "active": True,
            "name": "package_uuid",
            "req": True,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "product_uui_d",
            "req": True,
            "type": "`$ARRAY`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "response_code",
            "req": True,
            "type": "`$INTEGER`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "response_message",
            "req": True,
            "type": "`$STRING`",
            "index$": 3,
          },
        ],
        "name": "output_add_product",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 0,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_create_product": {
        "fields": [
          {
            "active": True,
            "name": "acquirer_id",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "allow_multiple_order",
            "req": True,
            "type": "`$BOOLEAN`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "app_form_template_name",
            "req": True,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "contract_needed",
            "req": True,
            "type": "`$BOOLEAN`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "credentials_needed",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "description_key",
            "req": True,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "name_key",
            "req": True,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "prescreening_allowed",
            "req": True,
            "type": "`$BOOLEAN`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "product_name",
            "req": True,
            "type": "`$STRING`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "response_code",
            "req": True,
            "type": "`$INTEGER`",
            "index$": 9,
          },
          {
            "active": True,
            "name": "response_message",
            "req": True,
            "type": "`$STRING`",
            "index$": 10,
          },
          {
            "active": True,
            "name": "terminal_template_name",
            "req": True,
            "type": "`$STRING`",
            "index$": 11,
          },
          {
            "active": True,
            "name": "vendor_name",
            "req": True,
            "type": "`$STRING`",
            "index$": 12,
          },
          {
            "active": True,
            "name": "xml_template_file",
            "req": True,
            "type": "`$STRING`",
            "index$": 13,
          },
        ],
        "name": "output_create_product",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 0,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_detail": {
        "fields": [
          {
            "active": True,
            "name": "detail",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "response_code",
            "req": True,
            "type": "`$INTEGER`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "response_message",
            "req": True,
            "type": "`$STRING`",
            "index$": 2,
          },
        ],
        "name": "output_detail",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                  "params": [
                    {
                      "active": True,
                      "kind": "param",
                      "name": "id",
                      "orig": "id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
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
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_list": {
        "fields": [
          {
            "active": True,
            "name": "item",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "pagination",
            "op": {
              "create": {
                "req": False,
                "type": "`$OBJECT`",
              },
            },
            "req": True,
            "type": "`$OBJECT`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "response_code",
            "req": True,
            "type": "`$INTEGER`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "response_message",
            "req": True,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "sorting",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 4,
          },
        ],
        "name": "output_list",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 0,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_message": {
        "fields": [
          {
            "active": True,
            "name": "response_code",
            "req": True,
            "type": "`$INTEGER`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "response_message",
            "req": True,
            "type": "`$STRING`",
            "index$": 1,
          },
        ],
        "name": "output_message",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                  "params": [
                    {
                      "active": True,
                      "kind": "param",
                      "name": "id",
                      "orig": "id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
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
                "index$": 0,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                  "params": [
                    {
                      "active": True,
                      "kind": "param",
                      "name": "id",
                      "orig": "id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
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
                "index$": 1,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_move_tid": {
        "fields": [
          {
            "active": True,
            "name": "product_order_uui_d",
            "req": True,
            "type": "`$ARRAY`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "response_code",
            "req": True,
            "type": "`$INTEGER`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "response_message",
            "req": True,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "target_package_order_uuid",
            "req": True,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "target_product_order_uuid",
            "req": True,
            "type": "`$STRING`",
            "index$": 4,
          },
        ],
        "name": "output_move_tid",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 0,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_remove_product": {
        "fields": [
          {
            "active": True,
            "name": "package_uuid",
            "req": True,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "product_uui_d",
            "req": True,
            "type": "`$ARRAY`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "response_code",
            "req": True,
            "type": "`$INTEGER`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "response_message",
            "req": True,
            "type": "`$STRING`",
            "index$": 3,
          },
        ],
        "name": "output_remove_product",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 0,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_start": {
        "fields": [
          {
            "active": True,
            "name": "id",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "response_code",
            "req": True,
            "type": "`$INTEGER`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "response_message",
            "req": True,
            "type": "`$STRING`",
            "index$": 2,
          },
        ],
        "name": "output_start",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 0,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_status": {
        "fields": [
          {
            "active": True,
            "name": "percentage",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "response_code",
            "req": True,
            "type": "`$INTEGER`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "response_message",
            "req": True,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "status",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
        ],
        "name": "output_status",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                  "params": [
                    {
                      "active": True,
                      "kind": "param",
                      "name": "id",
                      "orig": "id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
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
                "index$": 0,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "output_update_product": {
        "fields": [
          {
            "active": True,
            "name": "allow_multiple_order",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "app_form_name",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "contract_needed",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "credentials_needed",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "description_key",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "name_key",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "prescreening_allowed",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "product_name",
            "req": False,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "product_status",
            "req": False,
            "type": "`$STRING`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "product_uuid",
            "req": True,
            "type": "`$STRING`",
            "index$": 9,
          },
          {
            "active": True,
            "name": "response_code",
            "req": True,
            "type": "`$INTEGER`",
            "index$": 10,
          },
          {
            "active": True,
            "name": "response_message",
            "req": True,
            "type": "`$STRING`",
            "index$": 11,
          },
          {
            "active": True,
            "name": "vendor_name",
            "req": False,
            "type": "`$STRING`",
            "index$": 12,
          },
        ],
        "name": "output_update_product",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "authorization",
                      "orig": "authorization",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
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
                "index$": 0,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
