package voxgig.bluefintecsmerchantportalsdk.sdktest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;

import voxgig.bluefintecsmerchantportalsdk.core.BluefinTecsMerchantPortalSDK;

public class ExistsTest {

  @Test
  public void testMode() {
    BluefinTecsMerchantPortalSDK testsdk = BluefinTecsMerchantPortalSDK.testSDK();
    assertNotNull(testsdk, "expected non-nil SDK");
  }
}
