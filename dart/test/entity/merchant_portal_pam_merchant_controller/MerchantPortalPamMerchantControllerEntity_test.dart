// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import '../../harness.dart';
import '../../utility.dart';

import '../../../lib/BluefinTecsMerchantPortalSDK.dart';
import '../../../lib/utility/voxgig_struct.dart' as vs;

void tests() {
  describe('MerchantPortalPamMerchantControllerEntity', () {
    test('instance', (t) async {
      final testsdk = BluefinTecsMerchantPortalSDK.test();
      final ent = testsdk.MerchantPortalPamMerchantController();
      ok(null != ent);
    });



    test('basic', (t) async {

      final live = 'TRUE' == Platform.environment['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'];
      for (final op in ['create']) {
        if (maybeSkipControl(t, 'entityOp', 'merchant_portal_pam_merchant_controller.' + op, live)) {
          return;
        }
      }

      final setup = basicSetup();
      // The basic flow consumes synthetic IDs and field values from the
      // fixture (entity TestData.json). Those don't exist on the live API.
      // Skip live runs unless the user provided a real ENTID env override.
      if (true == setup['syntheticOnly']) {
        t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_MERCHANT_CONTROLLER_ENTID JSON to run live');
        return;
      }
      final client = setup['client'];
      final struct = setup['struct'];

      final isempty = struct.isempty;
      final select = struct.select;


      // CREATE
      final merchant_portal_pam_merchant_controller_ref01_ent = client.MerchantPortalPamMerchantController();
      dynamic merchant_portal_pam_merchant_controller_ref01_data = setup['data']['new']['merchant_portal_pam_merchant_controller']['merchant_portal_pam_merchant_controller_ref01'];

      merchant_portal_pam_merchant_controller_ref01_data = await merchant_portal_pam_merchant_controller_ref01_ent.create(merchant_portal_pam_merchant_controller_ref01_data);
      ok(null != merchant_portal_pam_merchant_controller_ref01_data);


    });
  });
}


Map<String, dynamic> basicSetup([dynamic extra]) {
  final options = <String, dynamic>{};

  final entityDataFile = resolveTestPath(
      '../.sdk/test/entity/merchant_portal_pam_merchant_controller/MerchantPortalPamMerchantControllerTestData.json');

  final entityDataSource = File(entityDataFile).readAsStringSync();

  final entityData = jsonDecode(entityDataSource);

  options['entity'] = entityData['existing'];

  var client = BluefinTecsMerchantPortalSDK.test(options, extra);
  final struct = client.utility().struct;
  final merge = struct.merge;
  final transform = struct.transform;

  dynamic idmap = transform(
      <dynamic>['merchant_portal_pam_merchant_controller01', 'merchant_portal_pam_merchant_controller02', 'merchant_portal_pam_merchant_controller03'],
      <String, dynamic>{
        '`\$PACK`': <dynamic>[
          '',
          <String, dynamic>{
            '`\$KEY`': '`\$COPY`',
            '`\$VAL`': <dynamic>['`\$FORMAT`', 'upper', '`\$COPY`'],
          }
        ]
      });

  // Detect whether the user provided a real ENTID JSON via env var. The
  // basic flow consumes synthetic IDs from the fixture file; without an
  // override those synthetic IDs reach the live API and 4xx. Surface this
  // to the test so it can skip rather than fail.
  final idmapEnvVal =
      Platform.environment['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_MERCHANT_CONTROLLER_ENTID'];
  final idmapOverridden =
      null != idmapEnvVal && idmapEnvVal.trim().startsWith('{');

  final env = envOverride({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_MERCHANT_CONTROLLER_ENTID': idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
  });

  idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_MERCHANT_CONTROLLER_ENTID'];

  final live = 'TRUE' == env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'];

  if (live) {
    client = BluefinTecsMerchantPortalSDK(merge([
      <String, dynamic>{
      },
      extra
    ]));
  }

  final setup = <String, dynamic>{
    'idmap': idmap,
    'env': env,
    'options': options,
    'client': client,
    'struct': struct,
    'data': entityData,
    'explain': 'TRUE' == env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN'],
    'live': live,
    'syntheticOnly': live && !idmapOverridden,
    'now': DateTime.now().millisecondsSinceEpoch,
  };

  return setup;
}

