// output_remove_product entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class OutputRemoveProductEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.OutputRemoveProduct()
    XCTAssertEqual(ent.getName(), "output_remove_product")
  }
}
