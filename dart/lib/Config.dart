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
    'name': 'ProjectName',
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
          'active': true,
          'name': 'account_number',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'additional_data',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'business_reg_number',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'city',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'corporateuuid',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'country',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'currency',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'merchant_category_code',
          'req': true,
          'type': '`\$INTEGER`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'merchant_email',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'merchant_name',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'merchant_phone_number',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 10,
        },
        <String, dynamic>{
          'active': true,
          'name': 'packageid',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 11,
        },
        <String, dynamic>{
          'active': true,
          'name': 'packageorderuuid',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 12,
        },
        <String, dynamic>{
          'active': true,
          'name': 'password',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 13,
        },
        <String, dynamic>{
          'active': true,
          'name': 'productid',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 14,
        },
        <String, dynamic>{
          'active': true,
          'name': 'productid_acquirer',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 15,
        },
        <String, dynamic>{
          'active': true,
          'name': 'reason_deactivation',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 16,
        },
        <String, dynamic>{
          'active': true,
          'name': 'reason_reactivation',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 17,
        },
        <String, dynamic>{
          'active': true,
          'name': 'sorting_code',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 18,
        },
        <String, dynamic>{
          'active': true,
          'name': 'state',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 19,
        },
        <String, dynamic>{
          'active': true,
          'name': 'street',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 20,
        },
        <String, dynamic>{
          'active': true,
          'name': 'terminal_country_code',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 21,
        },
        <String, dynamic>{
          'active': true,
          'name': 'terminal_language_code',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 22,
        },
        <String, dynamic>{
          'active': true,
          'name': 'terminal_location',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 23,
        },
        <String, dynamic>{
          'active': true,
          'name': 'terminal_serial_number',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 24,
        },
        <String, dynamic>{
          'active': true,
          'name': 'terminalid',
          'req': true,
          'type': '`\$INTEGER`',
          'index\$': 25,
        },
        <String, dynamic>{
          'active': true,
          'name': 'terminalid_acquirer',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 26,
        },
        <String, dynamic>{
          'active': true,
          'name': 'user_email',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 27,
        },
        <String, dynamic>{
          'active': true,
          'name': 'user_phone_number',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 28,
        },
        <String, dynamic>{
          'active': true,
          'name': 'username',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 29,
        },
        <String, dynamic>{
          'active': true,
          'name': 'vu_nummer',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 30,
        },
        <String, dynamic>{
          'active': true,
          'name': 'web_shop_url',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 31,
        },
        <String, dynamic>{
          'active': true,
          'name': 'zipcode',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 32,
        },
      ],
      'name': 'merchant_portal_api_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 0,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 1,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 2,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 3,
            },
          ],
          'key\$': 'create',
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
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 0,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 1,
            },
          ],
          'key\$': 'load',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'merchant_portal_pam_contract_controller': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'language',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'product_order_uuid',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 1,
        },
      ],
      'name': 'merchant_portal_pam_contract_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 0,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 1,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'merchant_portal_pam_document_controller': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'app_form_field_desc_uuid',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'package_order_uuid',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'product_order_uuid',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
      ],
      'name': 'merchant_portal_pam_document_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 0,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 1,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'merchant_portal_pam_form_controller': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'app_form_fields_desc_uuid',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'filter',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'language',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': false,
              'type': '`\$STRING`',
            },
          },
          'req': true,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'package_order',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'package_order_uuid',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': false,
              'type': '`\$STRING`',
            },
          },
          'req': true,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'package_uuid',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'product_order',
          'req': false,
          'type': '`\$ARRAY`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'product_order_uuid',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': true,
              'type': '`\$STRING`',
            },
          },
          'req': false,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'reason_of_reopening',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 8,
        },
      ],
      'name': 'merchant_portal_pam_form_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 0,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 1,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 2,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 3,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 4,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 5,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'merchant_portal_pam_mandator_controller': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'client_secret',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'mandator_name',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'notification_email',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'package_uuid',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 3,
        },
      ],
      'name': 'merchant_portal_pam_mandator_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 0,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 1,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 2,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'merchant_portal_pam_merchant_controller': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'additional_data',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'business_registration_number',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'city',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'company_name',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'corporate_uuid',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'country',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'currency',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'email',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'language',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'login',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'mandator',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 10,
        },
        <String, dynamic>{
          'active': true,
          'name': 'merchant_category_code',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 11,
        },
        <String, dynamic>{
          'active': true,
          'name': 'merchant_contract_number',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': false,
              'type': '`\$STRING`',
            },
          },
          'req': true,
          'type': '`\$STRING`',
          'index\$': 12,
        },
        <String, dynamic>{
          'active': true,
          'name': 'merchant_name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 13,
        },
        <String, dynamic>{
          'active': true,
          'name': 'package_uuid',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 14,
        },
        <String, dynamic>{
          'active': true,
          'name': 'packageorderuuid',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 15,
        },
        <String, dynamic>{
          'active': true,
          'name': 'phone_number',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 16,
        },
        <String, dynamic>{
          'active': true,
          'name': 'postal_code',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 17,
        },
        <String, dynamic>{
          'active': true,
          'name': 'productid_acquirer',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 18,
        },
        <String, dynamic>{
          'active': true,
          'name': 'region',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 19,
        },
        <String, dynamic>{
          'active': true,
          'name': 'registration_number',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 20,
        },
        <String, dynamic>{
          'active': true,
          'name': 'signature',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 21,
        },
        <String, dynamic>{
          'active': true,
          'name': 'street',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 22,
        },
        <String, dynamic>{
          'active': true,
          'name': 'terminal_id',
          'req': false,
          'type': '`\$ARRAY`',
          'index\$': 23,
        },
        <String, dynamic>{
          'active': true,
          'name': 'terminalid_acquirer',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 24,
        },
        <String, dynamic>{
          'active': true,
          'name': 'vu_nummer',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 25,
        },
      ],
      'name': 'merchant_portal_pam_merchant_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 0,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 1,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 2,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 3,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'merchant_portal_pam_package_controller': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'consumer_uuid',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'corporate_uuid',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'country',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'description_key',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'filter',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'language',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': false,
              'type': '`\$STRING`',
            },
          },
          'req': true,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'name_key',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'package_status',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'package_uuid',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'pagination',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'sorting',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 10,
        },
      ],
      'name': 'merchant_portal_pam_package_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 0,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 1,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 2,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 3,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 4,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'merchant_portal_pam_product_controller': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'consumer_uuid',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'filter',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'language',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'merchant_id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'package_order_uuid',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'pagination',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'product_order_uuid',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'product_uuid',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'reason_decline',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'sorting',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 9,
        },
      ],
      'name': 'merchant_portal_pam_product_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 0,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 1,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 2,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 3,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_add_product': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'package_uuid',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'product_uui_d',
          'req': true,
          'type': '`\$ARRAY`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_code',
          'req': true,
          'type': '`\$INTEGER`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_message',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 3,
        },
      ],
      'name': 'output_add_product',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_create_product': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'acquirer_id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'allow_multiple_order',
          'req': true,
          'type': '`\$BOOLEAN`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'app_form_template_name',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'contract_needed',
          'req': true,
          'type': '`\$BOOLEAN`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'credentials_needed',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'description_key',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'name_key',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'prescreening_allowed',
          'req': true,
          'type': '`\$BOOLEAN`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'product_name',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_code',
          'req': true,
          'type': '`\$INTEGER`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_message',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 10,
        },
        <String, dynamic>{
          'active': true,
          'name': 'terminal_template_name',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 11,
        },
        <String, dynamic>{
          'active': true,
          'name': 'vendor_name',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 12,
        },
        <String, dynamic>{
          'active': true,
          'name': 'xml_template_file',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 13,
        },
      ],
      'name': 'output_create_product',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_detail': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'detail',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_code',
          'req': true,
          'type': '`\$INTEGER`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_message',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 2,
        },
      ],
      'name': 'output_detail',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_list': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'item',
          'req': false,
          'type': '`\$ARRAY`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'pagination',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': false,
              'type': '`\$OBJECT`',
            },
          },
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_code',
          'req': true,
          'type': '`\$INTEGER`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_message',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'sorting',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 4,
        },
      ],
      'name': 'output_list',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_message': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'response_code',
          'req': true,
          'type': '`\$INTEGER`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_message',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 1,
        },
      ],
      'name': 'output_message',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 1,
            },
          ],
          'key\$': 'load',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_move_tid': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'product_order_uui_d',
          'req': true,
          'type': '`\$ARRAY`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_code',
          'req': true,
          'type': '`\$INTEGER`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_message',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'target_package_order_uuid',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'target_product_order_uuid',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 4,
        },
      ],
      'name': 'output_move_tid',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_remove_product': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'package_uuid',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'product_uui_d',
          'req': true,
          'type': '`\$ARRAY`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_code',
          'req': true,
          'type': '`\$INTEGER`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_message',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 3,
        },
      ],
      'name': 'output_remove_product',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_start': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_code',
          'req': true,
          'type': '`\$INTEGER`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_message',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 2,
        },
      ],
      'name': 'output_start',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_status': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'percentage',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_code',
          'req': true,
          'type': '`\$INTEGER`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_message',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'status',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
      ],
      'name': 'output_status',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'output_update_product': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'allow_multiple_order',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'app_form_name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'contract_needed',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'credentials_needed',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'description_key',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'name_key',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'prescreening_allowed',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'product_name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'product_status',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'product_uuid',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_code',
          'req': true,
          'type': '`\$INTEGER`',
          'index\$': 10,
        },
        <String, dynamic>{
          'active': true,
          'name': 'response_message',
          'req': true,
          'type': '`\$STRING`',
          'index\$': 11,
        },
        <String, dynamic>{
          'active': true,
          'name': 'vendor_name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 12,
        },
      ],
      'name': 'output_update_product',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'authorization',
                    'orig': 'authorization',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
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
