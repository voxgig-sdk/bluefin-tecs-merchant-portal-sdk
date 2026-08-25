// merchant_portal_pam_contract_controller entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class MerchantPortalPamContractControllerEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.MerchantPortalPamContractController()
    XCTAssertEqual(ent.getName(), "merchant_portal_pam_contract_controller")
  }
}
