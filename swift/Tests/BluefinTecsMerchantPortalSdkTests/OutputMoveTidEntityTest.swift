// output_move_tid entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class OutputMoveTidEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.OutputMoveTid()
    XCTAssertEqual(ent.getName(), "output_move_tid")
  }
}
