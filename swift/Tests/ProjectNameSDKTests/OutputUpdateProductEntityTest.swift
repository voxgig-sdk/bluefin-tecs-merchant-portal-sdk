// output_update_product entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class OutputUpdateProductEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.OutputUpdateProduct()
    XCTAssertEqual(ent.getName(), "output_update_product")
  }
}
