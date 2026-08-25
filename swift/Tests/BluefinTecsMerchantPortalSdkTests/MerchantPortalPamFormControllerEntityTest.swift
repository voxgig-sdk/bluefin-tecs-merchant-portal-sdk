// merchant_portal_pam_form_controller entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class MerchantPortalPamFormControllerEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.MerchantPortalPamFormController()
    XCTAssertEqual(ent.getName(), "merchant_portal_pam_form_controller")
  }
}
