// merchant_portal_common_controller entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class MerchantPortalCommonControllerEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.MerchantPortalCommonController()
    XCTAssertEqual(ent.getName(), "merchant_portal_common_controller")
  }
}
