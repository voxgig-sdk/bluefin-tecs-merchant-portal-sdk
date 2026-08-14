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

  final Map<String, dynamic> main = <String, dynamic>{
    'name': 'BluefinTecsMerchantPortal',
  };

  final Map<String, dynamic> feature = <String, dynamic>{
        'test': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
    },

  };

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

    }
  };

  final Map<String, dynamic> entity = <String, dynamic>{
    'merchant_portal_api_controller': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'account_number',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'additional_data',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'business_reg_number',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'city',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'corporateuuid',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'country',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'currency',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'merchant_category_code',
          'req': true,
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'merchant_email',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'merchant_name',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'merchant_phone_number',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageid',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageorderuuid',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'password',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productid',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productid_acquirer',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'reason_deactivation',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'reason_reactivation',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'sorting_code',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'state',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'street',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'terminal_country_code',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'terminal_language_code',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'terminal_location',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'terminal_serial_number',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'terminalid',
          'req': true,
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'terminalid_acquirer',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'user_email',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'user_phone_number',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'username',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'vu_nummer',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'web_shop_url',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'zipcode',
          'req': true,
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productOrderUUID',
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
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'businessRegistrationNumber',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'city',
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'country',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'currency',
          'req': true,
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'merchantName',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'merchant_category_code',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageUUID',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageorderuuid',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'phoneNumber',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'postalCode',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productid_acquirer',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'region',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'registrationNumber',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'signature',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'street',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'terminalIds',
          'type': '`\$ARRAY`',
        },
        <String, dynamic>{
          'name': 'terminalid_acquirer',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'vu_nummer',
          'req': true,
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'descriptionKey',
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageStatus',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageUUID',
          'req': true,
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productUUIDs',
          'req': true,
          'type': '`\$ARRAY`',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'req': true,
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'allowMultipleOrders',
          'req': true,
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'appFormTemplateName',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'contractNeeded',
          'req': true,
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'credentialsNeeded',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'descriptionKey',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'nameKey',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'prescreeningAllowed',
          'req': true,
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'productName',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'req': true,
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'terminalTemplateName',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'vendorName',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'xmlTemplateFile',
          'req': true,
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
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
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
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
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
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productUUIDs',
          'req': true,
          'type': '`\$ARRAY`',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'req': true,
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
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
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
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
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
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
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'appFormName',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'contractNeeded',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'credentialsNeeded',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'descriptionKey',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'nameKey',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'prescreeningAllowed',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'productName',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productStatus',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productUUID',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'req': true,
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'req': true,
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'vendorName',
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
