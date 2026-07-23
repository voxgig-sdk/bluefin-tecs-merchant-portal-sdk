package JAVAPACKAGE.sdktest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;

import JAVAPACKAGE.core.BluefinTecsMerchantPortalSDK;

public class ExistsTest {

  @Test
  public void testMode() {
    BluefinTecsMerchantPortalSDK testsdk = BluefinTecsMerchantPortalSDK.testSDK();
    assertNotNull(testsdk, "expected non-nil SDK");
  }
}
