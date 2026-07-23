// output_create_product entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class OutputCreateProductEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.OutputCreateProduct()
    XCTAssertEqual(ent.getName(), "output_create_product")
  }
}
