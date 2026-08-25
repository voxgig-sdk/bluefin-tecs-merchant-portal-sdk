// output_message entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class OutputMessageEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.OutputMessage()
    XCTAssertEqual(ent.getName(), "output_message")
  }
}
