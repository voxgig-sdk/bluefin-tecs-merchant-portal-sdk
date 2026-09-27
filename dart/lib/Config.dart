import 'feature/base/BaseFeature.dart';
import 'feature/audit/AuditFeature.dart';
import 'feature/clienttrack/ClienttrackFeature.dart';
import 'feature/debug/DebugFeature.dart';
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
  'debug': () => DebugFeature(),
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
      'optspec': <String, dynamic>{
        'now': '`\$FUNCTION`',
        'sink': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'clienttrack': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'clientVersion': '0.0.1',
      },
      'optspec': <String, dynamic>{
        'clientName': '`\$STRING`',
        'clientVersion': '`\$STRING`',
        'headers': '`\$MAP`',
        'idgen': '`\$FUNCTION`',
        'sessionId': '`\$STRING`',
      },
      'strict': false,
      'transport': 'none',
    },
    'debug': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'max': 100,
        'redact': <dynamic>[
          'authorization',
          'cookie',
          'set-cookie',
          'api-key',
          'apikey',
          'x-api-key',
          'idempotency-key',
        ],
      },
      'optspec': <String, dynamic>{
        'now': '`\$FUNCTION`',
        'onEntry': '`\$FUNCTION`',
      },
      'strict': false,
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
      'optspec': <String, dynamic>{
        'keygen': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'log': <String, dynamic>{
      'options': <String, dynamic>{
        'active': true,
      },
      'optspec': <String, dynamic>{
        'level': '`\$STRING`',
        'logger': '`\$ANY`',
      },
      'strict': false,
      'transport': 'none',
    },
    'metrics': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'optspec': <String, dynamic>{
        'now': '`\$FUNCTION`',
      },
      'strict': false,
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
      'optspec': <String, dynamic>{
        'limit': '`\$NUMBER`',
        'ops': '`\$LIST`',
      },
      'strict': false,
      'transport': 'none',
    },
    'ratelimit': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'burst': 5,
        'rate': 5,
      },
      'optspec': <String, dynamic>{
        'now': '`\$FUNCTION`',
        'sleep': '`\$FUNCTION`',
      },
      'strict': false,
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
      'optspec': <String, dynamic>{
        'jitter': '`\$BOOLEAN`',
        'sleep': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'wrap',
    },
    'telemetry': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'optspec': <String, dynamic>{
        'exporter': '`\$FUNCTION`',
        'headers': '`\$MAP`',
        'idgen': '`\$FUNCTION`',
        'now': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'test': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'optspec': <String, dynamic>{
        'entity': '`\$MAP`',
        'net': '`\$MAP`',
      },
      'strict': false,
      'transport': 'base',
    },
    'timeout': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'ms': 30000,
      },
      'optspec': <String, dynamic>{
        'clearTimer': '`\$FUNCTION`',
        'setTimer': '`\$FUNCTION`',
      },
      'strict': false,
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
          'name': 'account_number',
          'title': 'Account Number',
          'type': '`\$INTEGER`',
          'short': 'Account number provided by the acquirer.',
          'format': 'int32',
        },
        <String, dynamic>{
          'name': 'additional_data',
          'title': 'Additional Data',
          'type': '`\$OBJECT`',
          'short': 'Arbitrary merchant-specific data related to terminal registration.',
        },
        <String, dynamic>{
          'name': 'business_reg_number',
          'title': 'Business Reg Number',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Merchant business registration number as stated in the company registry.',
        },
        <String, dynamic>{
          'name': 'city',
          'title': 'City',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Merchant\'s address: city.',
        },
        <String, dynamic>{
          'name': 'corporateuuid',
          'title': 'Corporateuuid',
          'type': '`\$STRING`',
          'short': 'Unique identifier for the corporate entity (UUID format).',
        },
        <String, dynamic>{
          'name': 'country',
          'title': 'Country',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Merchant\'s address: country (must be in \'ISO-3166 ALPHA-3\' format).',
        },
        <String, dynamic>{
          'name': 'currency',
          'title': 'Currency',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Transaction currency (must be in "ISO 4217" format).',
        },
        <String, dynamic>{
          'name': 'merchant_category_code',
          'title': 'Merchant Category Code',
          'type': '`\$INTEGER`',
          'req': true,
          'short': 'Merchant category code as defined by the payment network.',
          'format': 'int32',
        },
        <String, dynamic>{
          'name': 'merchant_email',
          'title': 'Merchant Email',
          'type': '`\$STRING`',
          'short': 'Merchant\'s email address for receiving notifications.',
          'format': 'email',
        },
        <String, dynamic>{
          'name': 'merchant_name',
          'title': 'Merchant Name',
          'type': '`\$STRING`',
          'req': true,
          'short': 'The officially incorporated company name of the merchant.',
        },
        <String, dynamic>{
          'name': 'merchant_phone_number',
          'title': 'Merchant Phone Number',
          'type': '`\$STRING`',
          'short': 'Merchant\'s phone number for notifications.',
        },
        <String, dynamic>{
          'name': 'packageid',
          'title': 'Packageid',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Identifier of the package in the TECS processing engine provided by TECS.',
        },
        <String, dynamic>{
          'name': 'packageorderuuid',
          'title': 'Packageorderuuid',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call.',
        },
        <String, dynamic>{
          'name': 'password',
          'title': 'Password',
          'type': '`\$STRING`',
          'short': 'Merchant password for MPOS.',
        },
        <String, dynamic>{
          'name': 'productid',
          'title': 'Productid',
          'type': '`\$STRING`',
          'short': 'Identifier of the product for which terminal registration is to be performed.',
        },
        <String, dynamic>{
          'name': 'productid_acquirer',
          'title': 'Productid Acquirer',
          'type': '`\$STRING`',
          'short': 'Identifier of the product for which acquiring is enabled.',
        },
        <String, dynamic>{
          'name': 'reason_deactivation',
          'title': 'Reason Deactivation',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Reason for terminal deactivation.',
        },
        <String, dynamic>{
          'name': 'reason_reactivation',
          'title': 'Reason Reactivation',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Reason for terminal reactivation.',
        },
        <String, dynamic>{
          'name': 'sorting_code',
          'title': 'Sorting Code',
          'type': '`\$INTEGER`',
          'short': 'Sorting code provided by the acquirer.',
          'format': 'int32',
        },
        <String, dynamic>{
          'name': 'state',
          'title': 'State',
          'type': '`\$STRING`',
          'short': 'Merchant\'s address: state.',
        },
        <String, dynamic>{
          'name': 'street',
          'title': 'Street',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Merchant\'s address: street and house number.',
        },
        <String, dynamic>{
          'name': 'terminal_country_code',
          'title': 'Terminal Country Code',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Terminal country code (must be in \'ISO-3166 ALPHA-3\' format).',
        },
        <String, dynamic>{
          'name': 'terminal_language_code',
          'title': 'Terminal Language Code',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Terminal language code (must be in \'ISO 639-1\' format).',
        },
        <String, dynamic>{
          'name': 'terminal_location',
          'title': 'Terminal Location',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Physical or logical location of the terminal.',
        },
        <String, dynamic>{
          'name': 'terminal_serial_number',
          'title': 'Terminal Serial Number',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Terminal serial number.',
        },
        <String, dynamic>{
          'name': 'terminalid',
          'title': 'Terminalid',
          'type': '`\$INTEGER`',
          'req': true,
          'short': 'TECS terminalid given by Tecs processing engine.',
          'format': 'int32',
        },
        <String, dynamic>{
          'name': 'terminalid_acquirer',
          'title': 'Terminalid Acquirer',
          'type': '`\$STRING`',
          'short': 'Terminal ID as set by the acquirer (optional).',
        },
        <String, dynamic>{
          'name': 'user_email',
          'title': 'User Email',
          'type': '`\$STRING`',
          'short': 'Email address of the user acting on behalf of the merchant.',
          'format': 'email',
        },
        <String, dynamic>{
          'name': 'user_phone_number',
          'title': 'User Phone Number',
          'type': '`\$STRING`',
          'short': 'Phone number of the user acting on behalf of the merchant.',
        },
        <String, dynamic>{
          'name': 'username',
          'title': 'Username',
          'type': '`\$STRING`',
          'short': 'Merchant username for MPOS.',
        },
        <String, dynamic>{
          'name': 'vu_nummer',
          'title': 'Vu Nummer',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Merchant contract number with the acquirer.',
        },
        <String, dynamic>{
          'name': 'web_shop_url',
          'title': 'Web Shop Url',
          'type': '`\$STRING`',
          'short': 'URL of the merchant\'s web shop.',
          'format': 'uri',
        },
        <String, dynamic>{
          'name': 'zipcode',
          'title': 'Zipcode',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Merchant\'s address: postal code.',
        },
      ],
      'name': 'merchant_portal_api_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'deactivateTerminal',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'reactivateTerminal',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'registerAdditionalTerminal',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'registerNewMerchant',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
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
              'parts': <dynamic>[
                'merchantportalws',
                'logDeveloperInfo',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'version',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
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
          'title': 'Language',
          'type': '`\$STRING`',
          'req': true,
        },
        <String, dynamic>{
          'name': 'productOrderUUID',
          'title': 'Product Order Uuid',
          'type': '`\$STRING`',
          'req': true,
        },
      ],
      'name': 'merchant_portal_pam_contract_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'generateContract',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'uploadContract',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
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
          'title': 'App Form Field Desc Uuid',
          'type': '`\$STRING`',
          'req': true,
        },
        <String, dynamic>{
          'name': 'packageOrderUUID',
          'title': 'Package Order Uuid',
          'type': '`\$STRING`',
          'short': 'UUID of the package order.',
        },
        <String, dynamic>{
          'name': 'productOrderUUID',
          'title': 'Product Order Uuid',
          'type': '`\$STRING`',
          'short': 'UUID of the product order.',
        },
      ],
      'name': 'merchant_portal_pam_document_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'documentsList',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'downloadDocument',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
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
          'title': 'App Form Fields Desc Uuid',
          'type': '`\$STRING`',
          'req': true,
        },
        <String, dynamic>{
          'name': 'filter',
          'title': 'Filter',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'language',
          'title': 'Language',
          'type': '`\$STRING`',
          'req': true,
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
        },
        <String, dynamic>{
          'name': 'packageOrder',
          'title': 'Package Order',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'packageOrderUUID',
          'title': 'Package Order Uuid',
          'type': '`\$STRING`',
          'req': true,
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
          'short': 'UUID of the package order.',
        },
        <String, dynamic>{
          'name': 'packageUUID',
          'title': 'Package Uuid',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productOrderUUID',
          'title': 'Product Order Uuid',
          'type': '`\$STRING`',
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'req': true,
              'type': '`\$STRING`',
            },
          },
          'short': 'UUID of the product order.',
        },
        <String, dynamic>{
          'name': 'productOrders',
          'title': 'Product Orders',
          'type': '`\$ARRAY`',
        },
        <String, dynamic>{
          'name': 'reasonOfReopening',
          'title': 'Reason Of Reopening',
          'type': '`\$STRING`',
          'req': true,
        },
      ],
      'name': 'merchant_portal_pam_form_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'applicationForm',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'packageForm',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'reopenForm',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'secretKey',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'submitForm',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'submitValues',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
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
          'title': 'Client Secret',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'mandatorName',
          'title': 'Mandator Name',
          'type': '`\$STRING`',
          'req': true,
        },
        <String, dynamic>{
          'name': 'notificationEmail',
          'title': 'Notification Email',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageUUID',
          'title': 'Package Uuid',
          'type': '`\$STRING`',
          'req': true,
        },
      ],
      'name': 'merchant_portal_pam_mandator_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'createMandatorConfig',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'introduceMandatorPackage',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'selfRegistrationLink',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
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
          'title': 'Additional Data',
          'type': '`\$OBJECT`',
          'short': 'Optional additional merchant-specific data related to enabling acquiring.',
        },
        <String, dynamic>{
          'name': 'businessRegistrationNumber',
          'title': 'Business Registration Number',
          'type': '`\$STRING`',
          'req': true,
        },
        <String, dynamic>{
          'name': 'city',
          'title': 'City',
          'type': '`\$STRING`',
          'short': 'City where the merchant is located.',
        },
        <String, dynamic>{
          'name': 'companyName',
          'title': 'Company Name',
          'type': '`\$STRING`',
          'req': true,
        },
        <String, dynamic>{
          'name': 'corporateUUID',
          'title': 'Corporate Uuid',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Unique identifier for the corporate entity.',
        },
        <String, dynamic>{
          'name': 'country',
          'title': 'Country',
          'type': '`\$STRING`',
          'short': 'Country where the merchant is located.',
        },
        <String, dynamic>{
          'name': 'currency',
          'title': 'Currency',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Transaction currency in ISO 4217 format.',
        },
        <String, dynamic>{
          'name': 'email',
          'title': 'Email',
          'type': '`\$STRING`',
          'req': true,
        },
        <String, dynamic>{
          'name': 'language',
          'title': 'Language',
          'type': '`\$STRING`',
          'req': true,
        },
        <String, dynamic>{
          'name': 'login',
          'title': 'Login',
          'type': '`\$STRING`',
          'req': true,
        },
        <String, dynamic>{
          'name': 'mandator',
          'title': 'Mandator',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Mandator name assigned by TECS.',
        },
        <String, dynamic>{
          'name': 'merchantContractNumber',
          'title': 'Merchant Contract Number',
          'type': '`\$STRING`',
          'req': true,
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
          'short': 'Unique identifier for the merchant within a specific system.',
        },
        <String, dynamic>{
          'name': 'merchantName',
          'title': 'Merchant Name',
          'type': '`\$STRING`',
          'short': 'Name of the merchant.',
        },
        <String, dynamic>{
          'name': 'merchant_category_code',
          'title': 'Merchant Category Code',
          'type': '`\$STRING`',
          'short': 'Merchant Category Code (MCC) describing the merchant’s type of business.',
        },
        <String, dynamic>{
          'name': 'packageUUID',
          'title': 'Package Uuid',
          'type': '`\$STRING`',
          'short': 'UUID of the package.',
        },
        <String, dynamic>{
          'name': 'packageorderuuid',
          'title': 'Packageorderuuid',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Unique identifier for the registered merchant in the TECS system.',
        },
        <String, dynamic>{
          'name': 'phoneNumber',
          'title': 'Phone Number',
          'type': '`\$STRING`',
          'req': true,
        },
        <String, dynamic>{
          'name': 'postalCode',
          'title': 'Postal Code',
          'type': '`\$STRING`',
          'short': 'Postal or ZIP code of the merchant’s location.',
        },
        <String, dynamic>{
          'name': 'productid_acquirer',
          'title': 'Productid Acquirer',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Identifier of the product for which acquiring is to be enabled.',
        },
        <String, dynamic>{
          'name': 'region',
          'title': 'Region',
          'type': '`\$STRING`',
          'short': 'State or province where the merchant is located.',
        },
        <String, dynamic>{
          'name': 'registrationNumber',
          'title': 'Registration Number',
          'type': '`\$STRING`',
          'short': 'Business registration number.',
        },
        <String, dynamic>{
          'name': 'signature',
          'title': 'Signature',
          'type': '`\$STRING`',
          'short': 'Signature value = saltAsHex-hashAsHex.',
        },
        <String, dynamic>{
          'name': 'street',
          'title': 'Street',
          'type': '`\$STRING`',
          'short': 'Street address of the merchant.',
        },
        <String, dynamic>{
          'name': 'terminalIds',
          'title': 'Terminal Ids',
          'type': '`\$ARRAY`',
          'short': 'Optional list of terminal IDs for which acquiring should be activated.',
        },
        <String, dynamic>{
          'name': 'terminalid_acquirer',
          'title': 'Terminalid Acquirer',
          'type': '`\$STRING`',
          'short': 'Optional terminal ID provided by the acquirer.',
        },
        <String, dynamic>{
          'name': 'vu_nummer',
          'title': 'Vu Nummer',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Merchant contract number with the acquirer.',
        },
      ],
      'name': 'merchant_portal_pam_merchant_controller',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'contractNumber',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'registerAdditionalAcquiring',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'updateMerchant',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'registerMerchant',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
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
          'title': 'Consumer Uuid',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'corporateUUID',
          'title': 'Corporate Uuid',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'country',
          'title': 'Country',
          'type': '`\$STRING`',
          'short': 'Country associated with the package.',
        },
        <String, dynamic>{
          'name': 'descriptionKey',
          'title': 'Description Key',
          'type': '`\$STRING`',
          'short': 'Key for the description of the package.',
        },
        <String, dynamic>{
          'name': 'filter',
          'title': 'Filter',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'language',
          'title': 'Language',
          'type': '`\$STRING`',
          'req': true,
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'type': '`\$STRING`',
            },
          },
        },
        <String, dynamic>{
          'name': 'nameKey',
          'title': 'Name Key',
          'type': '`\$STRING`',
          'short': 'Key for the name of the package.',
        },
        <String, dynamic>{
          'name': 'packageStatus',
          'title': 'Package Status',
          'type': '`\$STRING`',
          'short': 'Status of the package.',
        },
        <String, dynamic>{
          'name': 'packageUUID',
          'title': 'Package Uuid',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Unique identifier for the package.',
        },
        <String, dynamic>{
          'name': 'pagination',
          'title': 'Pagination',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'sorting',
          'title': 'Sorting',
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
              'parts': <dynamic>[
                'merchantportalws',
                'availablePackages',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'orderPackage',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'orderedPackages',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'packageTemplates',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'updatePackageData',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
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
          'title': 'Consumer Uuid',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'filter',
          'title': 'Filter',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'language',
          'title': 'Language',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'merchantID',
          'title': 'Merchant Id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'packageOrderUUID',
          'title': 'Package Order Uuid',
          'type': '`\$STRING`',
          'req': true,
        },
        <String, dynamic>{
          'name': 'pagination',
          'title': 'Pagination',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'productOrderUUID',
          'title': 'Product Order Uuid',
          'type': '`\$STRING`',
          'req': true,
        },
        <String, dynamic>{
          'name': 'productUUID',
          'title': 'Product Uuid',
          'type': '`\$STRING`',
          'req': true,
        },
        <String, dynamic>{
          'name': 'reason_decline',
          'title': 'Reason Decline',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Reason for product decline.',
        },
        <String, dynamic>{
          'name': 'sorting',
          'title': 'Sorting',
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
              'parts': <dynamic>[
                'merchantportalws',
                'approveProduct',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'declineProduct',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'orderAdditionalProduct',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'productsList',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
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
          'title': 'Package Uuid',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Unique identifier for the package.',
        },
        <String, dynamic>{
          'name': 'productUUIDs',
          'title': 'Product Uui Ds',
          'type': '`\$ARRAY`',
          'req': true,
          'short': 'The list of unique identifiers of the products.',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'title': 'Response Code',
          'type': '`\$INTEGER`',
          'req': true,
          'short': 'Response code.',
          'format': 'int32',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'title': 'Response Message',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Response message.',
        },
      ],
      'name': 'output_add_product',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'addProductsToPackage',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
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
          'title': 'Acquirer Id',
          'type': '`\$STRING`',
          'short': 'Unique identifier for the acquirer.',
        },
        <String, dynamic>{
          'name': 'allowMultipleOrders',
          'title': 'Allow Multiple Orders',
          'type': '`\$BOOLEAN`',
          'req': true,
          'short': 'Indication whether multiple orders are allowed or not.',
        },
        <String, dynamic>{
          'name': 'appFormTemplateName',
          'title': 'App Form Template Name',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Name of the application form template.',
        },
        <String, dynamic>{
          'name': 'contractNeeded',
          'title': 'Contract Needed',
          'type': '`\$BOOLEAN`',
          'req': true,
          'short': 'Indication whether contract is needed or not.',
        },
        <String, dynamic>{
          'name': 'credentialsNeeded',
          'title': 'Credentials Needed',
          'type': '`\$BOOLEAN`',
          'short': 'Indication whether credentials are needed or not.',
        },
        <String, dynamic>{
          'name': 'descriptionKey',
          'title': 'Description Key',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Key indicator for product description.',
        },
        <String, dynamic>{
          'name': 'nameKey',
          'title': 'Name Key',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Key indicator for product name.',
        },
        <String, dynamic>{
          'name': 'prescreeningAllowed',
          'title': 'Prescreening Allowed',
          'type': '`\$BOOLEAN`',
          'req': true,
          'short': 'Indication whether prescreening is allowed or not.',
        },
        <String, dynamic>{
          'name': 'productName',
          'title': 'Product Name',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Name of the product.',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'title': 'Response Code',
          'type': '`\$INTEGER`',
          'req': true,
          'short': 'Response code.',
          'format': 'int32',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'title': 'Response Message',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Response message.',
        },
        <String, dynamic>{
          'name': 'terminalTemplateName',
          'title': 'Terminal Template Name',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Name of the terminal template.',
        },
        <String, dynamic>{
          'name': 'vendorName',
          'title': 'Vendor Name',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Name of the vendor.',
        },
        <String, dynamic>{
          'name': 'xmlTemplateFile',
          'title': 'Xml Template File',
          'type': '`\$STRING`',
          'req': true,
          'short': 'A string value containing the XML template file encoded in Base64.',
        },
      ],
      'name': 'output_create_product',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'createNewProduct',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
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
          'title': 'Batch',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'lines',
          'title': 'Lines',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'progress',
          'title': 'Progress',
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
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'details',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.details`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                  'id',
                ],
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
          'title': 'Items',
          'type': '`\$ARRAY`',
        },
        <String, dynamic>{
          'name': 'pagination',
          'title': 'Pagination',
          'type': '`\$OBJECT`',
          'req': true,
          'op': <String, dynamic>{
            'create': <String, dynamic>{
              'type': '`\$OBJECT`',
            },
          },
        },
        <String, dynamic>{
          'name': 'responseCode',
          'title': 'Response Code',
          'type': '`\$INTEGER`',
          'req': true,
          'short': 'Response code.',
          'format': 'int32',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'title': 'Response Message',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Response message.',
        },
        <String, dynamic>{
          'name': 'sorting',
          'title': 'Sorting',
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
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'list',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
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
          'name': 'id',
          'title': 'Id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'title': 'Response Code',
          'type': '`\$INTEGER`',
          'req': true,
          'short': 'Response code.',
          'format': 'int32',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'title': 'Response Message',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Response message.',
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
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'restart',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                  'id',
                ],
              },
            },
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'stop',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                  'id',
                ],
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
          'title': 'Product Order Uui Ds',
          'type': '`\$ARRAY`',
          'req': true,
        },
        <String, dynamic>{
          'name': 'responseCode',
          'title': 'Response Code',
          'type': '`\$INTEGER`',
          'req': true,
          'short': 'Response code.',
          'format': 'int32',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'title': 'Response Message',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Response message.',
        },
        <String, dynamic>{
          'name': 'targetPackageOrderUUID',
          'title': 'Target Package Order Uuid',
          'type': '`\$STRING`',
          'req': true,
        },
        <String, dynamic>{
          'name': 'targetProductOrderUUID',
          'title': 'Target Product Order Uuid',
          'type': '`\$STRING`',
          'req': true,
        },
      ],
      'name': 'output_move_tid',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'moveTid',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
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
          'title': 'Package Uuid',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Unique identifier for the package.',
        },
        <String, dynamic>{
          'name': 'productUUIDs',
          'title': 'Product Uui Ds',
          'type': '`\$ARRAY`',
          'req': true,
          'short': 'List of product unique identifiers.',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'title': 'Response Code',
          'type': '`\$INTEGER`',
          'req': true,
          'short': 'Response code.',
          'format': 'int32',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'title': 'Response Message',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Response message.',
        },
      ],
      'name': 'output_remove_product',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'removeProductsFromPackage',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
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
          'title': 'Id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'title': 'Response Code',
          'type': '`\$INTEGER`',
          'req': true,
          'short': 'Response code.',
          'format': 'int32',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'title': 'Response Message',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Response message.',
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
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'start',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
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
          'name': 'id',
          'title': 'Id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'percentage',
          'title': 'Percentage',
          'type': '`\$INTEGER`',
          'format': 'int32',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'title': 'Response Code',
          'type': '`\$INTEGER`',
          'req': true,
          'short': 'Response code.',
          'format': 'int32',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'title': 'Response Message',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Response message.',
        },
        <String, dynamic>{
          'name': 'status',
          'title': 'Status',
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
              'parts': <dynamic>[
                'merchantportalws',
                'batch',
                'registerAdditionalTerminal',
                'status',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                  'id',
                ],
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
          'title': 'Allow Multiple Orders',
          'type': '`\$BOOLEAN`',
          'short': 'An attribute to indicate if multiple orders are allowed',
        },
        <String, dynamic>{
          'name': 'appFormName',
          'title': 'App Form Name',
          'type': '`\$STRING`',
          'short': 'The name of the application form',
        },
        <String, dynamic>{
          'name': 'contractNeeded',
          'title': 'Contract Needed',
          'type': '`\$BOOLEAN`',
          'short': 'An attribute to indicate if a contract is needed',
        },
        <String, dynamic>{
          'name': 'credentialsNeeded',
          'title': 'Credentials Needed',
          'type': '`\$BOOLEAN`',
          'short': 'An attribute to indicate if credentials are needed',
        },
        <String, dynamic>{
          'name': 'descriptionKey',
          'title': 'Description Key',
          'type': '`\$STRING`',
          'short': 'The description of the product',
        },
        <String, dynamic>{
          'name': 'nameKey',
          'title': 'Name Key',
          'type': '`\$STRING`',
          'short': 'The key of the product name',
        },
        <String, dynamic>{
          'name': 'prescreeningAllowed',
          'title': 'Prescreening Allowed',
          'type': '`\$BOOLEAN`',
          'short': 'An attribute to indicate if prescreening is allowed',
        },
        <String, dynamic>{
          'name': 'productName',
          'title': 'Product Name',
          'type': '`\$STRING`',
          'short': 'The name of the product',
        },
        <String, dynamic>{
          'name': 'productStatus',
          'title': 'Product Status',
          'type': '`\$STRING`',
          'short': 'The status of the product',
        },
        <String, dynamic>{
          'name': 'productUUID',
          'title': 'Product Uuid',
          'type': '`\$STRING`',
          'req': true,
          'short': 'The UUID of the product to update',
        },
        <String, dynamic>{
          'name': 'responseCode',
          'title': 'Response Code',
          'type': '`\$INTEGER`',
          'req': true,
          'short': 'Response code.',
          'format': 'int32',
        },
        <String, dynamic>{
          'name': 'responseMessage',
          'title': 'Response Message',
          'type': '`\$STRING`',
          'req': true,
          'short': 'Response message.',
        },
        <String, dynamic>{
          'name': 'vendorName',
          'title': 'Vendor Name',
          'type': '`\$STRING`',
          'short': 'The name of the vendor',
        },
      ],
      'name': 'output_update_product',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
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
              'parts': <dynamic>[
                'merchantportalws',
                'updateProduct',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'authorization',
                    'orig': 'authorization',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'authorization',
                ],
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
