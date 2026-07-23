
const { BaseFeature } = require('./feature/base/BaseFeature')
const { TestFeature } = require('./feature/test/TestFeature')



const FEATURE_CLASS = {
   test: TestFeature,

}


class Config {

  makeFeature(fn) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }


  main = {
    name: 'ProjectName',
  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    },

  }


  options = {
    base: 'https://test.tecs.at',

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      merchant_portal_api_controller: {
      },

      merchant_portal_common_controller: {
      },

      merchant_portal_pam_contract_controller: {
      },

      merchant_portal_pam_document_controller: {
      },

      merchant_portal_pam_form_controller: {
      },

      merchant_portal_pam_mandator_controller: {
      },

      merchant_portal_pam_merchant_controller: {
      },

      merchant_portal_pam_package_controller: {
      },

      merchant_portal_pam_product_controller: {
      },

      output_add_product: {
      },

      output_create_product: {
      },

      output_detail: {
      },

      output_list: {
      },

      output_message: {
      },

      output_move_tid: {
      },

      output_remove_product: {
      },

      output_start: {
      },

      output_status: {
      },

      output_update_product: {
      },

    }
  }


  entity = {
    "merchant_portal_api_controller": {
      "fields": [
        {
          "active": true,
          "name": "account_number",
          "req": false,
          "type": "`$INTEGER`",
          "index$": 0
        },
        {
          "active": true,
          "name": "additional_data",
          "req": false,
          "type": "`$OBJECT`",
          "index$": 1
        },
        {
          "active": true,
          "name": "business_reg_number",
          "req": true,
          "type": "`$STRING`",
          "index$": 2
        },
        {
          "active": true,
          "name": "city",
          "req": true,
          "type": "`$STRING`",
          "index$": 3
        },
        {
          "active": true,
          "name": "corporateuuid",
          "req": false,
          "type": "`$STRING`",
          "index$": 4
        },
        {
          "active": true,
          "name": "country",
          "req": true,
          "type": "`$STRING`",
          "index$": 5
        },
        {
          "active": true,
          "name": "currency",
          "req": true,
          "type": "`$STRING`",
          "index$": 6
        },
        {
          "active": true,
          "name": "merchant_category_code",
          "req": true,
          "type": "`$INTEGER`",
          "index$": 7
        },
        {
          "active": true,
          "name": "merchant_email",
          "req": false,
          "type": "`$STRING`",
          "index$": 8
        },
        {
          "active": true,
          "name": "merchant_name",
          "req": true,
          "type": "`$STRING`",
          "index$": 9
        },
        {
          "active": true,
          "name": "merchant_phone_number",
          "req": false,
          "type": "`$STRING`",
          "index$": 10
        },
        {
          "active": true,
          "name": "packageid",
          "req": true,
          "type": "`$STRING`",
          "index$": 11
        },
        {
          "active": true,
          "name": "packageorderuuid",
          "req": true,
          "type": "`$STRING`",
          "index$": 12
        },
        {
          "active": true,
          "name": "password",
          "req": false,
          "type": "`$STRING`",
          "index$": 13
        },
        {
          "active": true,
          "name": "productid",
          "req": false,
          "type": "`$STRING`",
          "index$": 14
        },
        {
          "active": true,
          "name": "productid_acquirer",
          "req": false,
          "type": "`$STRING`",
          "index$": 15
        },
        {
          "active": true,
          "name": "reason_deactivation",
          "req": true,
          "type": "`$STRING`",
          "index$": 16
        },
        {
          "active": true,
          "name": "reason_reactivation",
          "req": true,
          "type": "`$STRING`",
          "index$": 17
        },
        {
          "active": true,
          "name": "sorting_code",
          "req": false,
          "type": "`$INTEGER`",
          "index$": 18
        },
        {
          "active": true,
          "name": "state",
          "req": false,
          "type": "`$STRING`",
          "index$": 19
        },
        {
          "active": true,
          "name": "street",
          "req": true,
          "type": "`$STRING`",
          "index$": 20
        },
        {
          "active": true,
          "name": "terminal_country_code",
          "req": true,
          "type": "`$STRING`",
          "index$": 21
        },
        {
          "active": true,
          "name": "terminal_language_code",
          "req": true,
          "type": "`$STRING`",
          "index$": 22
        },
        {
          "active": true,
          "name": "terminal_location",
          "req": true,
          "type": "`$STRING`",
          "index$": 23
        },
        {
          "active": true,
          "name": "terminal_serial_number",
          "req": true,
          "type": "`$STRING`",
          "index$": 24
        },
        {
          "active": true,
          "name": "terminalid",
          "req": true,
          "type": "`$INTEGER`",
          "index$": 25
        },
        {
          "active": true,
          "name": "terminalid_acquirer",
          "req": false,
          "type": "`$STRING`",
          "index$": 26
        },
        {
          "active": true,
          "name": "user_email",
          "req": false,
          "type": "`$STRING`",
          "index$": 27
        },
        {
          "active": true,
          "name": "user_phone_number",
          "req": false,
          "type": "`$STRING`",
          "index$": 28
        },
        {
          "active": true,
          "name": "username",
          "req": false,
          "type": "`$STRING`",
          "index$": 29
        },
        {
          "active": true,
          "name": "vu_nummer",
          "req": true,
          "type": "`$STRING`",
          "index$": 30
        },
        {
          "active": true,
          "name": "web_shop_url",
          "req": false,
          "type": "`$STRING`",
          "index$": 31
        },
        {
          "active": true,
          "name": "zipcode",
          "req": true,
          "type": "`$STRING`",
          "index$": 32
        }
      ],
      "name": "merchant_portal_api_controller",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/deactivateTerminal",
              "parts": [
                "merchantportalws",
                "deactivateTerminal"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/reactivateTerminal",
              "parts": [
                "merchantportalws",
                "reactivateTerminal"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 1
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/registerAdditionalTerminal",
              "parts": [
                "merchantportalws",
                "registerAdditionalTerminal"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 2
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/registerNewMerchant",
              "parts": [
                "merchantportalws",
                "registerNewMerchant"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 3
            }
          ],
          "key$": "create"
        }
      },
      "relations": {
        "ancestors": []
      }
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
              "active": true,
              "args": {},
              "method": "GET",
              "orig": "/merchantportalws/logDeveloperInfo",
              "parts": [
                "merchantportalws",
                "logDeveloperInfo"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            },
            {
              "active": true,
              "args": {},
              "method": "GET",
              "orig": "/merchantportalws/version",
              "parts": [
                "merchantportalws",
                "version"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 1
            }
          ],
          "key$": "load"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "merchant_portal_pam_contract_controller": {
      "fields": [
        {
          "active": true,
          "name": "language",
          "req": true,
          "type": "`$STRING`",
          "index$": 0
        },
        {
          "active": true,
          "name": "product_order_uuid",
          "req": true,
          "type": "`$STRING`",
          "index$": 1
        }
      ],
      "name": "merchant_portal_pam_contract_controller",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/generateContract",
              "parts": [
                "merchantportalws",
                "generateContract"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/uploadContract",
              "parts": [
                "merchantportalws",
                "uploadContract"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 1
            }
          ],
          "key$": "create"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "merchant_portal_pam_document_controller": {
      "fields": [
        {
          "active": true,
          "name": "app_form_field_desc_uuid",
          "req": true,
          "type": "`$STRING`",
          "index$": 0
        },
        {
          "active": true,
          "name": "package_order_uuid",
          "req": false,
          "type": "`$STRING`",
          "index$": 1
        },
        {
          "active": true,
          "name": "product_order_uuid",
          "req": false,
          "type": "`$STRING`",
          "index$": 2
        }
      ],
      "name": "merchant_portal_pam_document_controller",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/documentsList",
              "parts": [
                "merchantportalws",
                "documentsList"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/downloadDocument",
              "parts": [
                "merchantportalws",
                "downloadDocument"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 1
            }
          ],
          "key$": "create"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "merchant_portal_pam_form_controller": {
      "fields": [
        {
          "active": true,
          "name": "app_form_fields_desc_uuid",
          "req": true,
          "type": "`$STRING`",
          "index$": 0
        },
        {
          "active": true,
          "name": "filter",
          "req": false,
          "type": "`$OBJECT`",
          "index$": 1
        },
        {
          "active": true,
          "name": "language",
          "op": {
            "create": {
              "req": false,
              "type": "`$STRING`"
            }
          },
          "req": true,
          "type": "`$STRING`",
          "index$": 2
        },
        {
          "active": true,
          "name": "package_order",
          "req": false,
          "type": "`$OBJECT`",
          "index$": 3
        },
        {
          "active": true,
          "name": "package_order_uuid",
          "op": {
            "create": {
              "req": false,
              "type": "`$STRING`"
            }
          },
          "req": true,
          "type": "`$STRING`",
          "index$": 4
        },
        {
          "active": true,
          "name": "package_uuid",
          "req": false,
          "type": "`$STRING`",
          "index$": 5
        },
        {
          "active": true,
          "name": "product_order",
          "req": false,
          "type": "`$ARRAY`",
          "index$": 6
        },
        {
          "active": true,
          "name": "product_order_uuid",
          "op": {
            "create": {
              "req": true,
              "type": "`$STRING`"
            }
          },
          "req": false,
          "type": "`$STRING`",
          "index$": 7
        },
        {
          "active": true,
          "name": "reason_of_reopening",
          "req": true,
          "type": "`$STRING`",
          "index$": 8
        }
      ],
      "name": "merchant_portal_pam_form_controller",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/applicationForm",
              "parts": [
                "merchantportalws",
                "applicationForm"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/packageForm",
              "parts": [
                "merchantportalws",
                "packageForm"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 1
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/reopenForm",
              "parts": [
                "merchantportalws",
                "reopenForm"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 2
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/secretKey",
              "parts": [
                "merchantportalws",
                "secretKey"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 3
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/submitForm",
              "parts": [
                "merchantportalws",
                "submitForm"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 4
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/submitValues",
              "parts": [
                "merchantportalws",
                "submitValues"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 5
            }
          ],
          "key$": "create"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "merchant_portal_pam_mandator_controller": {
      "fields": [
        {
          "active": true,
          "name": "client_secret",
          "req": false,
          "type": "`$STRING`",
          "index$": 0
        },
        {
          "active": true,
          "name": "mandator_name",
          "req": true,
          "type": "`$STRING`",
          "index$": 1
        },
        {
          "active": true,
          "name": "notification_email",
          "req": false,
          "type": "`$STRING`",
          "index$": 2
        },
        {
          "active": true,
          "name": "package_uuid",
          "req": true,
          "type": "`$STRING`",
          "index$": 3
        }
      ],
      "name": "merchant_portal_pam_mandator_controller",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/createMandatorConfig",
              "parts": [
                "merchantportalws",
                "createMandatorConfig"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/introduceMandatorPackage",
              "parts": [
                "merchantportalws",
                "introduceMandatorPackage"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 1
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/selfRegistrationLink",
              "parts": [
                "merchantportalws",
                "selfRegistrationLink"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 2
            }
          ],
          "key$": "create"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "merchant_portal_pam_merchant_controller": {
      "fields": [
        {
          "active": true,
          "name": "additional_data",
          "req": false,
          "type": "`$OBJECT`",
          "index$": 0
        },
        {
          "active": true,
          "name": "business_registration_number",
          "req": true,
          "type": "`$STRING`",
          "index$": 1
        },
        {
          "active": true,
          "name": "city",
          "req": false,
          "type": "`$STRING`",
          "index$": 2
        },
        {
          "active": true,
          "name": "company_name",
          "req": true,
          "type": "`$STRING`",
          "index$": 3
        },
        {
          "active": true,
          "name": "corporate_uuid",
          "req": true,
          "type": "`$STRING`",
          "index$": 4
        },
        {
          "active": true,
          "name": "country",
          "req": false,
          "type": "`$STRING`",
          "index$": 5
        },
        {
          "active": true,
          "name": "currency",
          "req": true,
          "type": "`$STRING`",
          "index$": 6
        },
        {
          "active": true,
          "name": "email",
          "req": true,
          "type": "`$STRING`",
          "index$": 7
        },
        {
          "active": true,
          "name": "language",
          "req": true,
          "type": "`$STRING`",
          "index$": 8
        },
        {
          "active": true,
          "name": "login",
          "req": true,
          "type": "`$STRING`",
          "index$": 9
        },
        {
          "active": true,
          "name": "mandator",
          "req": true,
          "type": "`$STRING`",
          "index$": 10
        },
        {
          "active": true,
          "name": "merchant_category_code",
          "req": false,
          "type": "`$STRING`",
          "index$": 11
        },
        {
          "active": true,
          "name": "merchant_contract_number",
          "op": {
            "create": {
              "req": false,
              "type": "`$STRING`"
            }
          },
          "req": true,
          "type": "`$STRING`",
          "index$": 12
        },
        {
          "active": true,
          "name": "merchant_name",
          "req": false,
          "type": "`$STRING`",
          "index$": 13
        },
        {
          "active": true,
          "name": "package_uuid",
          "req": false,
          "type": "`$STRING`",
          "index$": 14
        },
        {
          "active": true,
          "name": "packageorderuuid",
          "req": true,
          "type": "`$STRING`",
          "index$": 15
        },
        {
          "active": true,
          "name": "phone_number",
          "req": true,
          "type": "`$STRING`",
          "index$": 16
        },
        {
          "active": true,
          "name": "postal_code",
          "req": false,
          "type": "`$STRING`",
          "index$": 17
        },
        {
          "active": true,
          "name": "productid_acquirer",
          "req": true,
          "type": "`$STRING`",
          "index$": 18
        },
        {
          "active": true,
          "name": "region",
          "req": false,
          "type": "`$STRING`",
          "index$": 19
        },
        {
          "active": true,
          "name": "registration_number",
          "req": false,
          "type": "`$STRING`",
          "index$": 20
        },
        {
          "active": true,
          "name": "signature",
          "req": false,
          "type": "`$STRING`",
          "index$": 21
        },
        {
          "active": true,
          "name": "street",
          "req": false,
          "type": "`$STRING`",
          "index$": 22
        },
        {
          "active": true,
          "name": "terminal_id",
          "req": false,
          "type": "`$ARRAY`",
          "index$": 23
        },
        {
          "active": true,
          "name": "terminalid_acquirer",
          "req": false,
          "type": "`$STRING`",
          "index$": 24
        },
        {
          "active": true,
          "name": "vu_nummer",
          "req": true,
          "type": "`$STRING`",
          "index$": 25
        }
      ],
      "name": "merchant_portal_pam_merchant_controller",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/contractNumber",
              "parts": [
                "merchantportalws",
                "contractNumber"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/registerAdditionalAcquiring",
              "parts": [
                "merchantportalws",
                "registerAdditionalAcquiring"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 1
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/updateMerchant",
              "parts": [
                "merchantportalws",
                "updateMerchant"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 2
            },
            {
              "active": true,
              "args": {},
              "method": "POST",
              "orig": "/merchantportalws/registerMerchant",
              "parts": [
                "merchantportalws",
                "registerMerchant"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 3
            }
          ],
          "key$": "create"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "merchant_portal_pam_package_controller": {
      "fields": [
        {
          "active": true,
          "name": "consumer_uuid",
          "req": false,
          "type": "`$STRING`",
          "index$": 0
        },
        {
          "active": true,
          "name": "corporate_uuid",
          "req": false,
          "type": "`$STRING`",
          "index$": 1
        },
        {
          "active": true,
          "name": "country",
          "req": false,
          "type": "`$STRING`",
          "index$": 2
        },
        {
          "active": true,
          "name": "description_key",
          "req": false,
          "type": "`$STRING`",
          "index$": 3
        },
        {
          "active": true,
          "name": "filter",
          "req": false,
          "type": "`$OBJECT`",
          "index$": 4
        },
        {
          "active": true,
          "name": "language",
          "op": {
            "create": {
              "req": false,
              "type": "`$STRING`"
            }
          },
          "req": true,
          "type": "`$STRING`",
          "index$": 5
        },
        {
          "active": true,
          "name": "name_key",
          "req": false,
          "type": "`$STRING`",
          "index$": 6
        },
        {
          "active": true,
          "name": "package_status",
          "req": false,
          "type": "`$STRING`",
          "index$": 7
        },
        {
          "active": true,
          "name": "package_uuid",
          "req": true,
          "type": "`$STRING`",
          "index$": 8
        },
        {
          "active": true,
          "name": "pagination",
          "req": false,
          "type": "`$OBJECT`",
          "index$": 9
        },
        {
          "active": true,
          "name": "sorting",
          "req": false,
          "type": "`$OBJECT`",
          "index$": 10
        }
      ],
      "name": "merchant_portal_pam_package_controller",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/availablePackages",
              "parts": [
                "merchantportalws",
                "availablePackages"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/orderPackage",
              "parts": [
                "merchantportalws",
                "orderPackage"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 1
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/orderedPackages",
              "parts": [
                "merchantportalws",
                "orderedPackages"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 2
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/packageTemplates",
              "parts": [
                "merchantportalws",
                "packageTemplates"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 3
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": false,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/updatePackageData",
              "parts": [
                "merchantportalws",
                "updatePackageData"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 4
            }
          ],
          "key$": "create"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "merchant_portal_pam_product_controller": {
      "fields": [
        {
          "active": true,
          "name": "consumer_uuid",
          "req": false,
          "type": "`$STRING`",
          "index$": 0
        },
        {
          "active": true,
          "name": "filter",
          "req": false,
          "type": "`$OBJECT`",
          "index$": 1
        },
        {
          "active": true,
          "name": "language",
          "req": false,
          "type": "`$STRING`",
          "index$": 2
        },
        {
          "active": true,
          "name": "merchant_id",
          "req": false,
          "type": "`$STRING`",
          "index$": 3
        },
        {
          "active": true,
          "name": "package_order_uuid",
          "req": true,
          "type": "`$STRING`",
          "index$": 4
        },
        {
          "active": true,
          "name": "pagination",
          "req": false,
          "type": "`$OBJECT`",
          "index$": 5
        },
        {
          "active": true,
          "name": "product_order_uuid",
          "req": true,
          "type": "`$STRING`",
          "index$": 6
        },
        {
          "active": true,
          "name": "product_uuid",
          "req": true,
          "type": "`$STRING`",
          "index$": 7
        },
        {
          "active": true,
          "name": "reason_decline",
          "req": true,
          "type": "`$STRING`",
          "index$": 8
        },
        {
          "active": true,
          "name": "sorting",
          "req": false,
          "type": "`$OBJECT`",
          "index$": 9
        }
      ],
      "name": "merchant_portal_pam_product_controller",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/approveProduct",
              "parts": [
                "merchantportalws",
                "approveProduct"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/declineProduct",
              "parts": [
                "merchantportalws",
                "declineProduct"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 1
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/orderAdditionalProduct",
              "parts": [
                "merchantportalws",
                "orderAdditionalProduct"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 2
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/productsList",
              "parts": [
                "merchantportalws",
                "productsList"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 3
            }
          ],
          "key$": "create"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "output_add_product": {
      "fields": [
        {
          "active": true,
          "name": "package_uuid",
          "req": true,
          "type": "`$STRING`",
          "index$": 0
        },
        {
          "active": true,
          "name": "product_uui_d",
          "req": true,
          "type": "`$ARRAY`",
          "index$": 1
        },
        {
          "active": true,
          "name": "response_code",
          "req": true,
          "type": "`$INTEGER`",
          "index$": 2
        },
        {
          "active": true,
          "name": "response_message",
          "req": true,
          "type": "`$STRING`",
          "index$": 3
        }
      ],
      "name": "output_add_product",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/addProductsToPackage",
              "parts": [
                "merchantportalws",
                "addProductsToPackage"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            }
          ],
          "key$": "create"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "output_create_product": {
      "fields": [
        {
          "active": true,
          "name": "acquirer_id",
          "req": false,
          "type": "`$STRING`",
          "index$": 0
        },
        {
          "active": true,
          "name": "allow_multiple_order",
          "req": true,
          "type": "`$BOOLEAN`",
          "index$": 1
        },
        {
          "active": true,
          "name": "app_form_template_name",
          "req": true,
          "type": "`$STRING`",
          "index$": 2
        },
        {
          "active": true,
          "name": "contract_needed",
          "req": true,
          "type": "`$BOOLEAN`",
          "index$": 3
        },
        {
          "active": true,
          "name": "credentials_needed",
          "req": false,
          "type": "`$BOOLEAN`",
          "index$": 4
        },
        {
          "active": true,
          "name": "description_key",
          "req": true,
          "type": "`$STRING`",
          "index$": 5
        },
        {
          "active": true,
          "name": "name_key",
          "req": true,
          "type": "`$STRING`",
          "index$": 6
        },
        {
          "active": true,
          "name": "prescreening_allowed",
          "req": true,
          "type": "`$BOOLEAN`",
          "index$": 7
        },
        {
          "active": true,
          "name": "product_name",
          "req": true,
          "type": "`$STRING`",
          "index$": 8
        },
        {
          "active": true,
          "name": "response_code",
          "req": true,
          "type": "`$INTEGER`",
          "index$": 9
        },
        {
          "active": true,
          "name": "response_message",
          "req": true,
          "type": "`$STRING`",
          "index$": 10
        },
        {
          "active": true,
          "name": "terminal_template_name",
          "req": true,
          "type": "`$STRING`",
          "index$": 11
        },
        {
          "active": true,
          "name": "vendor_name",
          "req": true,
          "type": "`$STRING`",
          "index$": 12
        },
        {
          "active": true,
          "name": "xml_template_file",
          "req": true,
          "type": "`$STRING`",
          "index$": 13
        }
      ],
      "name": "output_create_product",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/createNewProduct",
              "parts": [
                "merchantportalws",
                "createNewProduct"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            }
          ],
          "key$": "create"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "output_detail": {
      "fields": [
        {
          "active": true,
          "name": "detail",
          "req": false,
          "type": "`$OBJECT`",
          "index$": 0
        },
        {
          "active": true,
          "name": "response_code",
          "req": true,
          "type": "`$INTEGER`",
          "index$": 1
        },
        {
          "active": true,
          "name": "response_message",
          "req": true,
          "type": "`$STRING`",
          "index$": 2
        }
      ],
      "name": "output_detail",
      "op": {
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ],
                "params": [
                  {
                    "active": true,
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`",
                    "index$": 0
                  }
                ]
              },
              "method": "GET",
              "orig": "/merchantportalws/batch/registerAdditionalTerminal/details/{id}",
              "parts": [
                "merchantportalws",
                "batch",
                "registerAdditionalTerminal",
                "details",
                "{id}"
              ],
              "select": {
                "exist": [
                  "authorization",
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            }
          ],
          "key$": "load"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "output_list": {
      "fields": [
        {
          "active": true,
          "name": "item",
          "req": false,
          "type": "`$ARRAY`",
          "index$": 0
        },
        {
          "active": true,
          "name": "pagination",
          "op": {
            "create": {
              "req": false,
              "type": "`$OBJECT`"
            }
          },
          "req": true,
          "type": "`$OBJECT`",
          "index$": 1
        },
        {
          "active": true,
          "name": "response_code",
          "req": true,
          "type": "`$INTEGER`",
          "index$": 2
        },
        {
          "active": true,
          "name": "response_message",
          "req": true,
          "type": "`$STRING`",
          "index$": 3
        },
        {
          "active": true,
          "name": "sorting",
          "req": false,
          "type": "`$OBJECT`",
          "index$": 4
        }
      ],
      "name": "output_list",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/batch/registerAdditionalTerminal/list",
              "parts": [
                "merchantportalws",
                "batch",
                "registerAdditionalTerminal",
                "list"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            }
          ],
          "key$": "create"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "output_message": {
      "fields": [
        {
          "active": true,
          "name": "response_code",
          "req": true,
          "type": "`$INTEGER`",
          "index$": 0
        },
        {
          "active": true,
          "name": "response_message",
          "req": true,
          "type": "`$STRING`",
          "index$": 1
        }
      ],
      "name": "output_message",
      "op": {
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ],
                "params": [
                  {
                    "active": true,
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`",
                    "index$": 0
                  }
                ]
              },
              "method": "GET",
              "orig": "/merchantportalws/batch/registerAdditionalTerminal/restart/{id}",
              "parts": [
                "merchantportalws",
                "batch",
                "registerAdditionalTerminal",
                "restart",
                "{id}"
              ],
              "select": {
                "exist": [
                  "authorization",
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ],
                "params": [
                  {
                    "active": true,
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`",
                    "index$": 0
                  }
                ]
              },
              "method": "GET",
              "orig": "/merchantportalws/batch/registerAdditionalTerminal/stop/{id}",
              "parts": [
                "merchantportalws",
                "batch",
                "registerAdditionalTerminal",
                "stop",
                "{id}"
              ],
              "select": {
                "exist": [
                  "authorization",
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 1
            }
          ],
          "key$": "load"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "output_move_tid": {
      "fields": [
        {
          "active": true,
          "name": "product_order_uui_d",
          "req": true,
          "type": "`$ARRAY`",
          "index$": 0
        },
        {
          "active": true,
          "name": "response_code",
          "req": true,
          "type": "`$INTEGER`",
          "index$": 1
        },
        {
          "active": true,
          "name": "response_message",
          "req": true,
          "type": "`$STRING`",
          "index$": 2
        },
        {
          "active": true,
          "name": "target_package_order_uuid",
          "req": true,
          "type": "`$STRING`",
          "index$": 3
        },
        {
          "active": true,
          "name": "target_product_order_uuid",
          "req": true,
          "type": "`$STRING`",
          "index$": 4
        }
      ],
      "name": "output_move_tid",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/moveTid",
              "parts": [
                "merchantportalws",
                "moveTid"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            }
          ],
          "key$": "create"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "output_remove_product": {
      "fields": [
        {
          "active": true,
          "name": "package_uuid",
          "req": true,
          "type": "`$STRING`",
          "index$": 0
        },
        {
          "active": true,
          "name": "product_uui_d",
          "req": true,
          "type": "`$ARRAY`",
          "index$": 1
        },
        {
          "active": true,
          "name": "response_code",
          "req": true,
          "type": "`$INTEGER`",
          "index$": 2
        },
        {
          "active": true,
          "name": "response_message",
          "req": true,
          "type": "`$STRING`",
          "index$": 3
        }
      ],
      "name": "output_remove_product",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/removeProductsFromPackage",
              "parts": [
                "merchantportalws",
                "removeProductsFromPackage"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            }
          ],
          "key$": "create"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "output_start": {
      "fields": [
        {
          "active": true,
          "name": "id",
          "req": false,
          "type": "`$STRING`",
          "index$": 0
        },
        {
          "active": true,
          "name": "response_code",
          "req": true,
          "type": "`$INTEGER`",
          "index$": 1
        },
        {
          "active": true,
          "name": "response_message",
          "req": true,
          "type": "`$STRING`",
          "index$": 2
        }
      ],
      "name": "output_start",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/batch/registerAdditionalTerminal/start",
              "parts": [
                "merchantportalws",
                "batch",
                "registerAdditionalTerminal",
                "start"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            }
          ],
          "key$": "create"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "output_status": {
      "fields": [
        {
          "active": true,
          "name": "percentage",
          "req": false,
          "type": "`$INTEGER`",
          "index$": 0
        },
        {
          "active": true,
          "name": "response_code",
          "req": true,
          "type": "`$INTEGER`",
          "index$": 1
        },
        {
          "active": true,
          "name": "response_message",
          "req": true,
          "type": "`$STRING`",
          "index$": 2
        },
        {
          "active": true,
          "name": "status",
          "req": false,
          "type": "`$STRING`",
          "index$": 3
        }
      ],
      "name": "output_status",
      "op": {
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ],
                "params": [
                  {
                    "active": true,
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`",
                    "index$": 0
                  }
                ]
              },
              "method": "GET",
              "orig": "/merchantportalws/batch/registerAdditionalTerminal/status/{id}",
              "parts": [
                "merchantportalws",
                "batch",
                "registerAdditionalTerminal",
                "status",
                "{id}"
              ],
              "select": {
                "exist": [
                  "authorization",
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            }
          ],
          "key$": "load"
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "output_update_product": {
      "fields": [
        {
          "active": true,
          "name": "allow_multiple_order",
          "req": false,
          "type": "`$BOOLEAN`",
          "index$": 0
        },
        {
          "active": true,
          "name": "app_form_name",
          "req": false,
          "type": "`$STRING`",
          "index$": 1
        },
        {
          "active": true,
          "name": "contract_needed",
          "req": false,
          "type": "`$BOOLEAN`",
          "index$": 2
        },
        {
          "active": true,
          "name": "credentials_needed",
          "req": false,
          "type": "`$BOOLEAN`",
          "index$": 3
        },
        {
          "active": true,
          "name": "description_key",
          "req": false,
          "type": "`$STRING`",
          "index$": 4
        },
        {
          "active": true,
          "name": "name_key",
          "req": false,
          "type": "`$STRING`",
          "index$": 5
        },
        {
          "active": true,
          "name": "prescreening_allowed",
          "req": false,
          "type": "`$BOOLEAN`",
          "index$": 6
        },
        {
          "active": true,
          "name": "product_name",
          "req": false,
          "type": "`$STRING`",
          "index$": 7
        },
        {
          "active": true,
          "name": "product_status",
          "req": false,
          "type": "`$STRING`",
          "index$": 8
        },
        {
          "active": true,
          "name": "product_uuid",
          "req": true,
          "type": "`$STRING`",
          "index$": 9
        },
        {
          "active": true,
          "name": "response_code",
          "req": true,
          "type": "`$INTEGER`",
          "index$": 10
        },
        {
          "active": true,
          "name": "response_message",
          "req": true,
          "type": "`$STRING`",
          "index$": 11
        },
        {
          "active": true,
          "name": "vendor_name",
          "req": false,
          "type": "`$STRING`",
          "index$": 12
        }
      ],
      "name": "output_update_product",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "authorization",
                    "orig": "authorization",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "method": "POST",
              "orig": "/merchantportalws/updateProduct",
              "parts": [
                "merchantportalws",
                "updateProduct"
              ],
              "select": {
                "exist": [
                  "authorization"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "index$": 0
            }
          ],
          "key$": "create"
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

module.exports = {
  config
}

