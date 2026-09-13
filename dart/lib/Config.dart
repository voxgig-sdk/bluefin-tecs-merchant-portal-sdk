import 'feature/base/BaseFeature.dart';
import 'feature/audit/AuditFeature.dart';
import 'feature/clienttrack/ClienttrackFeature.dart';
import 'feature/idempotency/IdempotencyFeature.dart';
import 'feature/log/LogFeature.dart';
import 'feature/metrics/MetricsFeature.dart';
import 'feature/paging/PagingFeature.dart';
import 'feature/ratelimit/RatelimitFeature.dart';
import 'feature/retry/RetryFeature.dart';
import 'feature/telemetry/TelemetryFeature.dart';
import 'feature/test/TestFeature.dart';
import 'feature/timeout/TimeoutFeature.dart';



// ignore: non_constant_identifier_names
final Map<String, BaseFeature Function()> FEATURE_CLASS = {
    'audit': () => AuditFeature(),
  'clienttrack': () => ClienttrackFeature(),
  'idempotency': () => IdempotencyFeature(),
  'log': () => LogFeature(),
  'metrics': () => MetricsFeature(),
  'paging': () => PagingFeature(),
  'ratelimit': () => RatelimitFeature(),
  'retry': () => RetryFeature(),
  'telemetry': () => TelemetryFeature(),
  'test': () => TestFeature(),
  'timeout': () => TimeoutFeature(),

};

// Per-feature plugin DEFINITIONS (voxgig/plugin `Definition` values), from
// the model's active plugin groups. A feature that takes a `plugins` option
// (secrets over sekreto) reads its own entry; a feature with no plugins has
// none. The named `show` imports above make each definition statically
// reachable, so an SDK carries exactly the plugin libraries its model
// selects - the same leanness the old side-effect registry bought, without
// a registry.
//
// Emitted UNCONDITIONALLY, empty when no group is active: SecretsFeature
// imports this name, and the feature source can be present in a tree whose
// model selects no plugin group at all. An emission conditional on the map
// having entries would make that tree fail `dart analyze`.
//
// ignore: non_constant_identifier_names
final Map<String, List<dynamic>> FEATURE_PLUGINS = <String, List<dynamic>>{
  
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
        'audit': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'actor': 'anonymous',
        'max': 1000,
      },
      'transport': 'none',
    },
    'clienttrack': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'clientVersion': '0.0.1',
      },
      'transport': 'none',
    },
    'idempotency': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'header': 'Idempotency-Key',
        'methods': <dynamic>[
          'POST',
          'PUT',
          'PATCH',
          'DELETE',
        ],
        'ops': <dynamic>[
          'create',
          'update',
          'remove',
        ],
      },
      'transport': 'none',
    },
    'log': <String, dynamic>{
      'options': <String, dynamic>{
        'active': true,
      },
      'transport': 'none',
    },
    'metrics': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'transport': 'none',
    },
    'paging': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'afterVar': 'after',
        'cursorParam': 'cursor',
        'firstVar': 'first',
        'limitParam': 'limit',
        'pageParam': 'page',
        'startPage': 1,
      },
      'transport': 'none',
    },
    'ratelimit': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'burst': 5,
        'rate': 5,
      },
      'transport': 'wrap',
    },
    'retry': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'factor': 2,
        'maxDelay': 2000,
        'minDelay': 50,
        'retries': 2,
        'statuses': <dynamic>[
          408,
          425,
          429,
          500,
          502,
          503,
          504,
        ],
      },
      'transport': 'wrap',
    },
    'telemetry': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'transport': 'none',
    },
    'test': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'transport': 'base',
    },
    'timeout': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'ms': 30000,
      },
      'transport': 'wrap',
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
          'format': 'int32',
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
          'format': 'int32',
          'name': 'merchant_category_code',
          'req': true,
          'short': 'Merchant category code as defined by the payment network.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'format': 'email',
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
          'format': 'int32',
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
          'format': 'int32',
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
          'format': 'email',
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
          'format': 'uri',
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'deactivateTerminal',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'deactivateTerminal',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'reactivateTerminal',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'reactivateTerminal',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'registerAdditionalTerminal',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'registerAdditionalTerminal',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'registerNewMerchant',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'registerNewMerchant',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'logDeveloperInfo',
                },
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'merchantportalws',
                'logDeveloperInfo',
              ],
            },
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'GET',
              'orig': '/merchantportalws/version',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'version',
                },
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'merchantportalws',
                'version',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'generateContract',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'generateContract',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'uploadContract',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'uploadContract',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'documentsList',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'documentsList',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'downloadDocument',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'downloadDocument',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'applicationForm',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'applicationForm',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'packageForm',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'packageForm',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'reopenForm',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'reopenForm',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'secretKey',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'secretKey',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'submitForm',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'submitForm',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'submitValues',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'submitValues',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'createMandatorConfig',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'createMandatorConfig',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'introduceMandatorPackage',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'introduceMandatorPackage',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'selfRegistrationLink',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'selfRegistrationLink',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'contractNumber',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'contractNumber',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'registerAdditionalAcquiring',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'registerAdditionalAcquiring',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'updateMerchant',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'updateMerchant',
              ],
            },
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'POST',
              'orig': '/merchantportalws/registerMerchant',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'registerMerchant',
                },
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'merchantportalws',
                'registerMerchant',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'availablePackages',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'availablePackages',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'orderPackage',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'orderPackage',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'orderedPackages',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'orderedPackages',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'packageTemplates',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'packageTemplates',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'updatePackageData',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'updatePackageData',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'approveProduct',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'approveProduct',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'declineProduct',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'declineProduct',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'orderAdditionalProduct',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'orderAdditionalProduct',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'productsList',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'productsList',
              ],
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
          'format': 'int32',
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'addProductsToPackage',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'addProductsToPackage',
              ],
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
          'format': 'int32',
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'createNewProduct',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'createNewProduct',
              ],
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
          'name': 'id',
          'type': '`\$STRING`',
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
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'batch',
                },
                <String, dynamic>{
                  'lit': 'registerAdditionalTerminal',
                },
                <String, dynamic>{
                  'lit': 'details',
                },
                <String, dynamic>{
                  'var': 'id',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'details',
                '{id}',
              ],
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
          'format': 'int32',
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'batch',
                },
                <String, dynamic>{
                  'lit': 'registerAdditionalTerminal',
                },
                <String, dynamic>{
                  'lit': 'list',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'list',
              ],
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
          'name': 'id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'format': 'int32',
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
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'batch',
                },
                <String, dynamic>{
                  'lit': 'registerAdditionalTerminal',
                },
                <String, dynamic>{
                  'lit': 'restart',
                },
                <String, dynamic>{
                  'var': 'id',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'restart',
                '{id}',
              ],
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'batch',
                },
                <String, dynamic>{
                  'lit': 'registerAdditionalTerminal',
                },
                <String, dynamic>{
                  'lit': 'stop',
                },
                <String, dynamic>{
                  'var': 'id',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'stop',
                '{id}',
              ],
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
          'format': 'int32',
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'moveTid',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'moveTid',
              ],
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
          'format': 'int32',
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'removeProductsFromPackage',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'removeProductsFromPackage',
              ],
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
          'format': 'int32',
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
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'batch',
                },
                <String, dynamic>{
                  'lit': 'registerAdditionalTerminal',
                },
                <String, dynamic>{
                  'lit': 'start',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'start',
              ],
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
          'name': 'id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'format': 'int32',
          'name': 'percentage',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'format': 'int32',
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
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'batch',
                },
                <String, dynamic>{
                  'lit': 'registerAdditionalTerminal',
                },
                <String, dynamic>{
                  'lit': 'status',
                },
                <String, dynamic>{
                  'var': 'id',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'status',
                '{id}',
              ],
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
          'format': 'int32',
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
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'merchantportalws',
                },
                <String, dynamic>{
                  'lit': 'updateProduct',
                },
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
              'parts': <dynamic>[
                'merchantportalws',
                'updateProduct',
              ],
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
