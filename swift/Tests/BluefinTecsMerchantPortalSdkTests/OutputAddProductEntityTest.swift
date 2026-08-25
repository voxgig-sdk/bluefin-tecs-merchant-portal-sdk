// output_add_product entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class OutputAddProductEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.OutputAddProduct()
    XCTAssertEqual(ent.getName(), "output_add_product")
  }
}
