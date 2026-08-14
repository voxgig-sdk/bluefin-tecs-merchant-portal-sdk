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
            "type": "`$INTEGER`",
          },
          {
            "name": "additional_data",
            "type": "`$OBJECT`",
          },
          {
            "name": "business_reg_number",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "city",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "corporateuuid",
            "type": "`$STRING`",
          },
          {
            "name": "country",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "currency",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "merchant_category_code",
            "req": True,
            "type": "`$INTEGER`",
          },
          {
            "name": "merchant_email",
            "type": "`$STRING`",
          },
          {
            "name": "merchant_name",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "merchant_phone_number",
            "type": "`$STRING`",
          },
          {
            "name": "packageid",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "packageorderuuid",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "password",
            "type": "`$STRING`",
          },
          {
            "name": "productid",
            "type": "`$STRING`",
          },
          {
            "name": "productid_acquirer",
            "type": "`$STRING`",
          },
          {
            "name": "reason_deactivation",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "reason_reactivation",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "sorting_code",
            "type": "`$INTEGER`",
          },
          {
            "name": "state",
            "type": "`$STRING`",
          },
          {
            "name": "street",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "terminal_country_code",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "terminal_language_code",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "terminal_location",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "terminal_serial_number",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "terminalid",
            "req": True,
            "type": "`$INTEGER`",
          },
          {
            "name": "terminalid_acquirer",
            "type": "`$STRING`",
          },
          {
            "name": "user_email",
            "type": "`$STRING`",
          },
          {
            "name": "user_phone_number",
            "type": "`$STRING`",
          },
          {
            "name": "username",
            "type": "`$STRING`",
          },
          {
            "name": "vu_nummer",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "web_shop_url",
            "type": "`$STRING`",
          },
          {
            "name": "zipcode",
            "req": True,
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
            "type": "`$STRING`",
          },
          {
            "name": "productOrderUUID",
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
            "type": "`$OBJECT`",
          },
          {
            "name": "businessRegistrationNumber",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "city",
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
            "type": "`$STRING`",
          },
          {
            "name": "country",
            "type": "`$STRING`",
          },
          {
            "name": "currency",
            "req": True,
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
            "type": "`$STRING`",
          },
          {
            "name": "merchantName",
            "type": "`$STRING`",
          },
          {
            "name": "merchant_category_code",
            "type": "`$STRING`",
          },
          {
            "name": "packageUUID",
            "type": "`$STRING`",
          },
          {
            "name": "packageorderuuid",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "phoneNumber",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "postalCode",
            "type": "`$STRING`",
          },
          {
            "name": "productid_acquirer",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "region",
            "type": "`$STRING`",
          },
          {
            "name": "registrationNumber",
            "type": "`$STRING`",
          },
          {
            "name": "signature",
            "type": "`$STRING`",
          },
          {
            "name": "street",
            "type": "`$STRING`",
          },
          {
            "name": "terminalIds",
            "type": "`$ARRAY`",
          },
          {
            "name": "terminalid_acquirer",
            "type": "`$STRING`",
          },
          {
            "name": "vu_nummer",
            "req": True,
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
            "type": "`$STRING`",
          },
          {
            "name": "descriptionKey",
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
            "type": "`$STRING`",
          },
          {
            "name": "packageStatus",
            "type": "`$STRING`",
          },
          {
            "name": "packageUUID",
            "req": True,
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
            "type": "`$STRING`",
          },
          {
            "name": "productUUIDs",
            "req": True,
            "type": "`$ARRAY`",
          },
          {
            "name": "responseCode",
            "req": True,
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
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
            "type": "`$STRING`",
          },
          {
            "name": "allowMultipleOrders",
            "req": True,
            "type": "`$BOOLEAN`",
          },
          {
            "name": "appFormTemplateName",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "contractNeeded",
            "req": True,
            "type": "`$BOOLEAN`",
          },
          {
            "name": "credentialsNeeded",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "descriptionKey",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "nameKey",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "prescreeningAllowed",
            "req": True,
            "type": "`$BOOLEAN`",
          },
          {
            "name": "productName",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "responseCode",
            "req": True,
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "terminalTemplateName",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "vendorName",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "xmlTemplateFile",
            "req": True,
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
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
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
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
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
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
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
            "type": "`$STRING`",
          },
          {
            "name": "productUUIDs",
            "req": True,
            "type": "`$ARRAY`",
          },
          {
            "name": "responseCode",
            "req": True,
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
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
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
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
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
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
            "type": "`$BOOLEAN`",
          },
          {
            "name": "appFormName",
            "type": "`$STRING`",
          },
          {
            "name": "contractNeeded",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "credentialsNeeded",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "descriptionKey",
            "type": "`$STRING`",
          },
          {
            "name": "nameKey",
            "type": "`$STRING`",
          },
          {
            "name": "prescreeningAllowed",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "productName",
            "type": "`$STRING`",
          },
          {
            "name": "productStatus",
            "type": "`$STRING`",
          },
          {
            "name": "productUUID",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "responseCode",
            "req": True,
            "type": "`$INTEGER`",
          },
          {
            "name": "responseMessage",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "vendorName",
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
