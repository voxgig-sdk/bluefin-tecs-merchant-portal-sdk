// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import '../../harness.dart';
import '../../utility.dart';

import '../../../lib/BluefinTecsMerchantPortalSDK.dart';
import '../../../lib/utility/voxgig_struct.dart' as vs;

void tests() {
  describe('OutputMessageEntity', () {
    test('instance', (t) async {
      final testsdk = BluefinTecsMerchantPortalSDK.test();
      final ent = testsdk.OutputMessage();
      ok(null != ent);
    });



    test('basic', (t) async {

      final live = 'TRUE' == Platform.environment['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'];
      for (final op in ['load']) {
        if (maybeSkipControl(t, 'entityOp', 'output_message.' + op, live)) {
          return;
        }
      }

      final setup = basicSetup();
      // The basic flow consumes synthetic IDs and field values from the
      // fixture (entity TestData.json). Those don't exist on the live API.
      // Skip live runs unless the user provided a real ENTID env override.
      if (true == setup['syntheticOnly']) {
        t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_MESSAGE_ENTID JSON to run live');
        return;
      }
      final client = setup['client'];
      final struct = setup['struct'];

      final isempty = struct.isempty;
      final select = struct.select;

      final output_message_ref01_data =
          (setup['data']['existing']['output_message'] as Map).values.first;

      // LOAD
      final output_message_ref01_ent = client.OutputMessage();
      final output_message_ref01_match_dt0 = <String, dynamic>{};
      output_message_ref01_match_dt0['id'] = output_message_ref01_data['id'];
      final output_message_ref01_data_dt0 = (await output_message_ref01_ent.load(output_message_ref01_match_dt0)).data();
      ok(output_message_ref01_data_dt0['id'] == output_message_ref01_data['id']);


    });
  });
}


Map<String, dynamic> basicSetup([dynamic extra]) {
  final options = <String, dynamic>{};

  final entityDataFile = resolveTestPath(
      '../.sdk/test/entity/output_message/OutputMessageTestData.json');

  final entityDataSource = File(entityDataFile).readAsStringSync();

  final entityData = jsonDecode(entityDataSource);

  options['entity'] = entityData['existing'];

  var client = BluefinTecsMerchantPortalSDK.test(options, extra);
  final struct = client.utility().struct;
  final merge = struct.merge;
  final transform = struct.transform;

  dynamic idmap = transform(
      <dynamic>['output_message01', 'output_message02', 'output_message03'],
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
      Platform.environment['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_MESSAGE_ENTID'];
  final idmapOverridden =
      null != idmapEnvVal && idmapEnvVal.trim().startsWith('{');

  final env = envOverride({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_MESSAGE_ENTID': idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
  });

  idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_MESSAGE_ENTID'];

  final live = 'TRUE' == env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'];

  if (live) {
    client = BluefinTecsMerchantPortalSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      <String, dynamic>{
      },
      // 'extra ?? {}', not a bare 'extra': merge returns null when the last
      // entry is null, and basicSetup is normally called with no argument at
      // all - so a bare 'extra' silently discarded the apikey and server
      // values above and handed the SDK null.
      extra ?? <String, dynamic>{}
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

