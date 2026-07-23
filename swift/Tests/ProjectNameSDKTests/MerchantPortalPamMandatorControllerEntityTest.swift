// merchant_portal_pam_mandator_controller entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class MerchantPortalPamMandatorControllerEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.MerchantPortalPamMandatorController()
    XCTAssertEqual(ent.getName(), "merchant_portal_pam_mandator_controller")
  }
}
