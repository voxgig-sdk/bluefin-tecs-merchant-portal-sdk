// merchant_portal_pam_product_controller entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class MerchantPortalPamProductControllerEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.MerchantPortalPamProductController()
    XCTAssertEqual(ent.getName(), "merchant_portal_pam_product_controller")
  }
}
