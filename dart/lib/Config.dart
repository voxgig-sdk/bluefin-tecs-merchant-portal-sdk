import 'feature/base/BaseFeature.dart';
import 'feature/test/TestFeature.dart';


// ignore: non_constant_identifier_names
final Map<String, BaseFeature Function()> FEATURE_CLASS = {
    'test': () => TestFeature(),

};

class Config {
  BaseFeature makeFeature(String fn) {
    final fc = FEATURE_CLASS[fn];
    if (null == fc) {
      // TODO: errors etc
      throw StateError('Unknown feature: ' + fn);
    }
    return fc();
  }

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  bool hasFeature(String fn) => null != FEATURE_CLASS[fn];

  final Map<String, dynamic> main = <String, dynamic>{
    'name': 'BluefinTecsMerchantPortal',
        'slug': 'bluefin-tecs-merchant-portal',
    'version': '0.1.1',
    'target': 'dart',

  };

  final Map<String, dynamic> feature = <String, dynamic>{
        'test': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
    },

  };

  // Rendered whole from the canonical config definition rather than assembled
  // slot by slot. Assembling it here meant `options.server` - the OpenAPI
  // server-variable defaults - was simply absent from this branch, so a
  // templated server URL produced a different config either side of the
  // threshold.
  final Map<String, dynamic> options = <String, dynamic>{
    'base': 'https://test.tecs.at',
    'headers': <String, dynamic>{
      'content-type': 'application/json',
    },
    'entity': <String, dynamic>{
      'merchant_portal_api_controller': <String, dynamic>{},
      'merchant_portal_common_controller': <String, dynamic>{},
      'merchant_portal_pam_contract_controller': <String, dynamic>{},
      'merchant_portal_pam_document_controller': <String, dynamic>{},
      'merchant_portal_pam_form_controller': <String, dynamic>{},
      'merchant_portal_pam_mandator_controller': <String, dynamic>{},
      'merchant_portal_pam_merchant_controller': <String, dynamic>{},
      'merchant_portal_pam_package_controller': <String, dynamic>{},
      'merchant_portal_pam_product_controller': <String, dynamic>{},
      'output_add_product': <String, dynamic>{},
      'output_create_product': <String, dynamic>{},
      'output_detail': <String, dynamic>{},
      'output_list': <String, dynamic>{},
      'output_message': <String, dynamic>{},
      'output_move_tid': <String, dynamic>{},
      'output_remove_product': <String, dynamic>{},
      'output_start': <String, dynamic>{},
      'output_status': <String, dynamic>{},
      'output_update_product': <String, dynamic>{},
    },
  };

  final Map<String, dynamic> entity = <String, dynamic>{
    'merchant_portal_api_controller': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'account_number',
          'short': 'Account number provided by the acquirer.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'additional_data',
          'short': 'Arbitrary merchant-specific data related to terminal registration.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'business_reg_number',
          'req': true,
          'short': 'Merchant business registration number as stated in the company registry.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'city',
          'req': true,
          'short': 'Merchant\'s address: city.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'corporateuuid',
          'short': 'Unique identifier for the corporate entity (UUID format).',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'country',
          'req': true,
          'short': 'Merchant\'s address: country (must be in \'ISO-3166 ALPHA-3\' format).',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'currency',
          'req': true,
          'short': 'Transaction currency (must be in "ISO 4217" format).',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'merchant_category_code',
          'req': true,
          'short': 'Merchant category code as defined by the payment network.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'merchant_email',
          'short': 'Merchant\'s email address for receiving notifications.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'merchant_name',
          'req': true,
          'short': 'The officially incorporated company name of the merchant.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'merchant_phone_number',
          'short': 'Merchant\'s phone number for notifications.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageid',
          'req': true,
          'short': 'Identifier of the package in the TECS processing engine provided by TECS.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageorderuuid',
          'req': true,
          'short': 'Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'password',
          'short': 'Merchant password for MPOS.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productid',
          'short': 'Identifier of the product for which terminal registration is to be performed.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productid_acquirer',
          'short': 'Identifier of the product for which acquiring is enabled.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'reason_deactivation',
          'req': true,
          'short': 'Reason for terminal deactivation.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'reason_reactivation',
          'req': true,
          'short': 'Reason for terminal reactivation.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'sorting_code',
          'short': 'Sorting code provided by the acquirer.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'state',
          'short': 'Merchant\'s address: state.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'street',
          'req': true,
          'short': 'Merchant\'s address: street and house number.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'terminal_country_code',
          'req': true,
          'short': 'Terminal country code (must be in \'ISO-3166 ALPHA-3\' format).',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'terminal_language_code',
          'req': true,
          'short': 'Terminal language code (must be in \'ISO 639-1\' format).',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'terminal_location',
          'req': true,
          'short': 'Physical or logical location of the terminal.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'terminal_serial_number',
          'req': true,
          'short': 'Terminal serial number.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'terminalid',
          'req': true,
          'short': 'TECS terminalid given by Tecs processing engine.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'terminalid_acquirer',
          'short': 'Terminal ID as set by the acquirer (optional).',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'user_email',
          'short': 'Email address of the user acting on behalf of the merchant.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'user_phone_number',
          'short': 'Phone number of the user acting on behalf of the merchant.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'username',
          'short': 'Merchant username for MPOS.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'vu_nummer',
          'req': true,
          'short': 'Merchant contract number with the acquirer.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'web_shop_url',
          'short': 'URL of the merchant\'s web shop.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'zipcode',
          'req': true,
          'short': 'Merchant\'s address: postal code.',
          'type': '`\$STRING`',
        },
      ],
      'name': 'merchant_portal_api_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/deactivateTerminal',
              'parts': <dynamic>[
                'merchantportalws',
                'deactivateTerminal',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/reactivateTerminal',
              'parts': <dynamic>[
                'merchantportalws',
                'reactivateTerminal',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/registerAdditionalTerminal',
              'parts': <dynamic>[
                'merchantportalws',
                'registerAdditionalTerminal',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/registerNewMerchant',
              'parts': <dynamic>[
                'merchantportalws',
                'registerNewMerchant',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'merchant_portal_common_controller': <String, dynamic>{
      'fields': <dynamic>[],
      'name': 'merchant_portal_common_controller',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'GET',
              'orig': '/merchantportalws/logDeveloperInfo',
              'parts': <dynamic>[
                'merchantportalws',
                'logDeveloperInfo',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'GET',
              'orig': '/merchantportalws/version',
              'parts': <dynamic>[
                'merchantportalws',
                'version',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'merchant_portal_pam_contract_controller': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'language',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productOrderUUID',
          'req': true,
          'type': '`\$STRING`',
        },
      ],
      'name': 'merchant_portal_pam_contract_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/generateContract',
              'parts': <dynamic>[
                'merchantportalws',
                'generateContract',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/uploadContract',
              'parts': <dynamic>[
                'merchantportalws',
                'uploadContract',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'merchant_portal_pam_document_controller': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'appFormFieldDescUUID',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageOrderUUID',
          'short': 'UUID of the package order.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productOrderUUID',
          'short': 'UUID of the product order.',
          'type': '`\$STRING`',
        },
      ],
      'name': 'merchant_portal_pam_document_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/documentsList',
              'parts': <dynamic>[
                'merchantportalws',
                'documentsList',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/downloadDocument',
              'parts': <dynamic>[
                'merchantportalws',
                'downloadDocument',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'merchant_portal_pam_form_controller': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'appFormFieldsDescUUID',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'filter',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'language',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageOrder',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'packageOrderUUID',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
          'req': true,
          'short': 'UUID of the package order.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageUUID',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productOrderUUID',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': true,
              'type': '`\$STRING`',
            },
          },
          'short': 'UUID of the product order.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productOrders',
          'type': '`\$ARRAY`',
        },
        <String, dynamic>{
          'name': 'reasonOfReopening',
          'req': true,
          'type': '`\$STRING`',
        },
      ],
      'name': 'merchant_portal_pam_form_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/applicationForm',
              'parts': <dynamic>[
                'merchantportalws',
                'applicationForm',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/packageForm',
              'parts': <dynamic>[
                'merchantportalws',
                'packageForm',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/reopenForm',
              'parts': <dynamic>[
                'merchantportalws',
                'reopenForm',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/secretKey',
              'parts': <dynamic>[
                'merchantportalws',
                'secretKey',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/submitForm',
              'parts': <dynamic>[
                'merchantportalws',
                'submitForm',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/submitValues',
              'parts': <dynamic>[
                'merchantportalws',
                'submitValues',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'merchant_portal_pam_mandator_controller': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'clientSecret',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'mandatorName',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'notificationEmail',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageUUID',
          'req': true,
          'type': '`\$STRING`',
        },
      ],
      'name': 'merchant_portal_pam_mandator_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/createMandatorConfig',
              'parts': <dynamic>[
                'merchantportalws',
                'createMandatorConfig',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/introduceMandatorPackage',
              'parts': <dynamic>[
                'merchantportalws',
                'introduceMandatorPackage',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/selfRegistrationLink',
              'parts': <dynamic>[
                'merchantportalws',
                'selfRegistrationLink',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'merchant_portal_pam_merchant_controller': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'additional_data',
          'short': 'Optional additional merchant-specific data related to enabling acquiring.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'businessRegistrationNumber',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'city',
          'short': 'City where the merchant is located.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'companyName',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'corporateUUID',
          'req': true,
          'short': 'Unique identifier for the corporate entity.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'country',
          'short': 'Country where the merchant is located.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'currency',
          'req': true,
          'short': 'Transaction currency in ISO 4217 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'email',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'language',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'login',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'mandator',
          'req': true,
          'short': 'Mandator name assigned by TECS.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'merchantContractNumber',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
          'req': true,
          'short': 'Unique identifier for the merchant within a specific system.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'merchantName',
          'short': 'Name of the merchant.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'merchant_category_code',
          'short': 'Merchant Category Code (MCC) describing the merchant’s type of business.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageUUID',
          'short': 'UUID of the package.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageorderuuid',
          'req': true,
          'short': 'Unique identifier for the registered merchant in the TECS system.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'phoneNumber',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'postalCode',
          'short': 'Postal or ZIP code of the merchant’s location.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productid_acquirer',
          'req': true,
          'short': 'Identifier of the product for which acquiring is to be enabled.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'region',
          'short': 'State or province where the merchant is located.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'registrationNumber',
          'short': 'Business registration number.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'signature',
          'short': 'Signature value = saltAsHex-hashAsHex.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'street',
          'short': 'Street address of the merchant.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'terminalIds',
          'short': 'Optional list of terminal IDs for which acquiring should be activated.',
          'type': '`\$ARRAY`',
        },
        <String, dynamic>{
          'name': 'terminalid_acquirer',
          'short': 'Optional terminal ID provided by the acquirer.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'vu_nummer',
          'req': true,
          'short': 'Merchant contract number with the acquirer.',
          'type': '`\$STRING`',
        },
      ],
      'name': 'merchant_portal_pam_merchant_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/contractNumber',
              'parts': <dynamic>[
                'merchantportalws',
                'contractNumber',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/registerAdditionalAcquiring',
              'parts': <dynamic>[
                'merchantportalws',
                'registerAdditionalAcquiring',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/updateMerchant',
              'parts': <dynamic>[
                'merchantportalws',
                'updateMerchant',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/registerMerchant',
              'parts': <dynamic>[
                'merchantportalws',
                'registerMerchant',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'merchant_portal_pam_package_controller': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'consumerUUID',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'corporateUUID',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'country',
          'short': 'Country associated with the package.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'descriptionKey',
          'short': 'Key for the description of the package.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'filter',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'language',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'nameKey',
          'short': 'Key for the name of the package.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageStatus',
          'short': 'Status of the package.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageUUID',
          'req': true,
          'short': 'Unique identifier for the package.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'pagination',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'sorting',
          'type': '`\$OBJECT`',
        },
      ],
      'name': 'merchant_portal_pam_package_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/availablePackages',
              'parts': <dynamic>[
                'merchantportalws',
                'availablePackages',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/orderPackage',
              'parts': <dynamic>[
                'merchantportalws',
                'orderPackage',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/orderedPackages',
              'parts': <dynamic>[
                'merchantportalws',
                'orderedPackages',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/packageTemplates',
              'parts': <dynamic>[
                'merchantportalws',
                'packageTemplates',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/updatePackageData',
              'parts': <dynamic>[
                'merchantportalws',
                'updatePackageData',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'merchant_portal_pam_product_controller': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'consumerUUID',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'filter',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'language',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'merchantID',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageOrderUUID',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'pagination',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'productOrderUUID',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productUUID',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'reason_decline',
          'req': true,
          'short': 'Reason for product decline.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'sorting',
          'type': '`\$OBJECT`',
        },
      ],
      'name': 'merchant_portal_pam_product_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/approveProduct',
              'parts': <dynamic>[
                'merchantportalws',
                'approveProduct',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/declineProduct',
              'parts': <dynamic>[
                'merchantportalws',
                'declineProduct',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/orderAdditionalProduct',
              'parts': <dynamic>[
                'merchantportalws',
                'orderAdditionalProduct',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/productsList',
              'parts': <dynamic>[
                'merchantportalws',
                'productsList',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_add_product': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'packageUUID',
          'req': true,
          'short': 'Unique identifier for the package.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productUUIDs',
          'req': true,
          'short': 'The list of unique identifiers of the products.',
          'type': '`\$ARRAY`',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'req': true,
          'short': 'Response code.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
          'short': 'Response message.',
          'type': '`\$STRING`',
        },
      ],
      'name': 'output_add_product',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/addProductsToPackage',
              'parts': <dynamic>[
                'merchantportalws',
                'addProductsToPackage',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_create_product': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'acquirerId',
          'short': 'Unique identifier for the acquirer.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'allowMultipleOrders',
          'req': true,
          'short': 'Indication whether multiple orders are allowed or not.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'appFormTemplateName',
          'req': true,
          'short': 'Name of the application form template.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'contractNeeded',
          'req': true,
          'short': 'Indication whether contract is needed or not.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'credentialsNeeded',
          'short': 'Indication whether credentials are needed or not.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'descriptionKey',
          'req': true,
          'short': 'Key indicator for product description.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'nameKey',
          'req': true,
          'short': 'Key indicator for product name.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'prescreeningAllowed',
          'req': true,
          'short': 'Indication whether prescreening is allowed or not.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'productName',
          'req': true,
          'short': 'Name of the product.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'req': true,
          'short': 'Response code.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
          'short': 'Response message.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'terminalTemplateName',
          'req': true,
          'short': 'Name of the terminal template.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'vendorName',
          'req': true,
          'short': 'Name of the vendor.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'xmlTemplateFile',
          'req': true,
          'short': 'A string value containing the XML template file encoded in Base64.',
          'type': '`\$STRING`',
        },
      ],
      'name': 'output_create_product',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/createNewProduct',
              'parts': <dynamic>[
                'merchantportalws',
                'createNewProduct',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_detail': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'batch',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'lines',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'progress',
          'type': '`\$OBJECT`',
        },
      ],
      'name': 'output_detail',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/merchantportalws/batch/registerAdditionalTerminal/details/{id}',
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'details',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.details`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_list': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'items',
          'type': '`\$ARRAY`',
        },
        <String, dynamic>{
          'name': 'pagination',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'type': '`\$OBJECT`',
            },
          },
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'req': true,
          'short': 'Response code.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
          'short': 'Response message.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'sorting',
          'type': '`\$OBJECT`',
        },
      ],
      'name': 'output_list',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/batch/registerAdditionalTerminal/list',
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'list',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_message': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'responseCode',
          'req': true,
          'short': 'Response code.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
          'short': 'Response message.',
          'type': '`\$STRING`',
        },
      ],
      'name': 'output_message',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/merchantportalws/batch/registerAdditionalTerminal/restart/{id}',
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'restart',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/merchantportalws/batch/registerAdditionalTerminal/stop/{id}',
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'stop',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_move_tid': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'productOrderUUIDs',
          'req': true,
          'type': '`\$ARRAY`',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'req': true,
          'short': 'Response code.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
          'short': 'Response message.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'targetPackageOrderUUID',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'targetProductOrderUUID',
          'req': true,
          'type': '`\$STRING`',
        },
      ],
      'name': 'output_move_tid',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/moveTid',
              'parts': <dynamic>[
                'merchantportalws',
                'moveTid',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_remove_product': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'packageUUID',
          'req': true,
          'short': 'Unique identifier for the package.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productUUIDs',
          'req': true,
          'short': 'List of product unique identifiers.',
          'type': '`\$ARRAY`',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'req': true,
          'short': 'Response code.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
          'short': 'Response message.',
          'type': '`\$STRING`',
        },
      ],
      'name': 'output_remove_product',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/removeProductsFromPackage',
              'parts': <dynamic>[
                'merchantportalws',
                'removeProductsFromPackage',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_start': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'req': true,
          'short': 'Response code.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
          'short': 'Response message.',
          'type': '`\$STRING`',
        },
      ],
      'name': 'output_start',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/batch/registerAdditionalTerminal/start',
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'start',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_status': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'percentage',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'req': true,
          'short': 'Response code.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
          'short': 'Response message.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'status',
          'type': '`\$STRING`',
        },
      ],
      'name': 'output_status',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/merchantportalws/batch/registerAdditionalTerminal/status/{id}',
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'status',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_update_product': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'allowMultipleOrders',
          'short': 'An attribute to indicate if multiple orders are allowed',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'appFormName',
          'short': 'The name of the application form',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'contractNeeded',
          'short': 'An attribute to indicate if a contract is needed',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'credentialsNeeded',
          'short': 'An attribute to indicate if credentials are needed',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'descriptionKey',
          'short': 'The description of the product',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'nameKey',
          'short': 'The key of the product name',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'prescreeningAllowed',
          'short': 'An attribute to indicate if prescreening is allowed',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'productName',
          'short': 'The name of the product',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productStatus',
          'short': 'The status of the product',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productUUID',
          'req': true,
          'short': 'The UUID of the product to update',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'req': true,
          'short': 'Response code.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
          'short': 'Response message.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'vendorName',
          'short': 'The name of the vendor',
          'type': '`\$STRING`',
        },
      ],
      'name': 'output_update_product',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/updateProduct',
              'parts': <dynamic>[
                'merchantportalws',
                'updateProduct',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
  };

  // The pipeline context carries the config as a plain map.
  Map<String, dynamic> toMap() => <String, dynamic>{
        'main': main,
        'feature': feature,
        'options': options,
        'entity': entity,
      };
}

final config = Config();
