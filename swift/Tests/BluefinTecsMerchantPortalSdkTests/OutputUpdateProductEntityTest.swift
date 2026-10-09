// output_update_product entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class OutputUpdateProductEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.OutputUpdateProduct()
    XCTAssertEqual(ent.getName(), "output_update_product")
  }

  // An invalid request fails with validate's own error, before it is sent.
  func testValidate() throws {
    try XCTSkipUnless(OutputUpdateProductEntityTest.hasFeature("validate"), "feature not present in this SDK: validate")
    let client = BluefinTecsMerchantPortalSDK.testSDK(nil, vm(("feature", .map(vm(("validate", .map(vm(("active", .bool(true))))))))))
    var err: Error? = nil
    do { _ = try client.OutputUpdateProduct().create(vm(("allowMultipleOrders", .string("x")), ("productUUID", .string("x")), ("responseCode", .int(1)), ("responseMessage", .string("x"))), nil) } catch { err = error }
    XCTAssertEqual((err as? BluefinTecsMerchantPortalError)?.code, "validate_failed",
      "expected validate_failed, got \(String(describing: err))")
  }

  // True when this SDK was generated with the named feature.
  static func hasFeature(_ name: String) -> Bool {
    gp(SdkConfig.makeConfig(), "feature").asMap?.entries[name] != nil
  }
}
