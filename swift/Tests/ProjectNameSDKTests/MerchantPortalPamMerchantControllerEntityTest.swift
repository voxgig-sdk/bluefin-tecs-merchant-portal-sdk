// merchant_portal_pam_merchant_controller entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class MerchantPortalPamMerchantControllerEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.MerchantPortalPamMerchantController()
    XCTAssertEqual(ent.getName(), "merchant_portal_pam_merchant_controller")
  }
}
