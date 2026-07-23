// merchant_portal_pam_package_controller entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class MerchantPortalPamPackageControllerEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.MerchantPortalPamPackageController()
    XCTAssertEqual(ent.getName(), "merchant_portal_pam_package_controller")
  }
}
