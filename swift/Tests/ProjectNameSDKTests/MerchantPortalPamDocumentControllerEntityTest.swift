// merchant_portal_pam_document_controller entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class MerchantPortalPamDocumentControllerEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.MerchantPortalPamDocumentController()
    XCTAssertEqual(ent.getName(), "merchant_portal_pam_document_controller")
  }
}
