// BluefinTecsMerchantPortal SDK exists test.

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class ExistsTest: XCTestCase {
  func testMode() {
    let testsdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    XCTAssertEqual(testsdk.mode, "test")
  }
}
