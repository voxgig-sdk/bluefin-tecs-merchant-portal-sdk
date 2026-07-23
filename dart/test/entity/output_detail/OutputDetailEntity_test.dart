// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import '../../harness.dart';
import '../../utility.dart';

import '../../../lib/BluefinTecsMerchantPortalSDK.dart';
import '../../../lib/utility/voxgig_struct.dart' as vs;

void tests() {
  describe('OutputDetailEntity', () {
    test('instance', (t) async {
      final testsdk = BluefinTecsMerchantPortalSDK.test();
      final ent = testsdk.OutputDetail();
      ok(null != ent);
    });



    test('basic', (t) async {

      final live = 'TRUE' == Platform.environment['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'];
      for (final op in ['load']) {
        if (maybeSkipControl(t, 'entityOp', 'output_detail.' + op, live)) {
          return;
        }
      }

      final setup = basicSetup();
      // The basic flow consumes synthetic IDs and field values from the
      // fixture (entity TestData.json). Those don't exist on the live API.
      // Skip live runs unless the user provided a real ENTID env override.
      if (true == setup['syntheticOnly']) {
        t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_DETAIL_ENTID JSON to run live');
        return;
      }
      final client = setup['client'];
      final struct = setup['struct'];

      final isempty = struct.isempty;
      final select = struct.select;

      final output_detail_ref01_data =
          (setup['data']['existing']['output_detail'] as Map).values.first;

      // LOAD: skipped — no entity id field and load requires path params.
      // Entity-var is declared here so later flow steps still compile.
      final output_detail_ref01_ent = client.OutputDetail();


    });
  });
}


Map<String, dynamic> basicSetup([dynamic extra]) {
  final options = <String, dynamic>{};

  final entityDataFile = resolveTestPath(
      '../.sdk/test/entity/output_detail/OutputDetailTestData.json');

  final entityDataSource = File(entityDataFile).readAsStringSync();

  final entityData = jsonDecode(entityDataSource);

  options['entity'] = entityData['existing'];

  var client = BluefinTecsMerchantPortalSDK.test(options, extra);
  final struct = client.utility().struct;
  final merge = struct.merge;
  final transform = struct.transform;

  dynamic idmap = transform(
      <dynamic>['output_detail01', 'output_detail02', 'output_detail03'],
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
      Platform.environment['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_DETAIL_ENTID'];
  final idmapOverridden =
      null != idmapEnvVal && idmapEnvVal.trim().startsWith('{');

  final env = envOverride({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_DETAIL_ENTID': idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
  });

  idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_DETAIL_ENTID'];

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

