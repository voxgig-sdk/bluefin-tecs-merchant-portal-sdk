package voxgig.bluefintecsmerchantportalsdk.sdktest

import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Test

import voxgig.bluefintecsmerchantportalsdk.core.BluefinTecsMerchantPortalSDK

class ExistsTest {

  @Test
  fun testMode() {
    val testsdk = BluefinTecsMerchantPortalSDK.testSDK()
    assertNotNull(testsdk, "expected non-nil SDK")
  }
}
