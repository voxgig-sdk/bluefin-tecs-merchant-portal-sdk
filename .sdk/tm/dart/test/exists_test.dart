import 'harness.dart';

import '../lib/BluefinTecsMerchantPortalSDK.dart';

void tests() {
  describe('exists', () {
    test('test-mode', (t) async {
      final testsdk = BluefinTecsMerchantPortalSDK.test();
      equal(true, null != testsdk);
    });
  });
}
