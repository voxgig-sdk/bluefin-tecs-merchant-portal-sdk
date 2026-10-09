// output_create_product entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class OutputCreateProductEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.OutputCreateProduct()
    XCTAssertEqual(ent.getName(), "output_create_product")
  }

  // An invalid request fails with validate's own error, before it is sent.
  func testValidate() throws {
    try XCTSkipUnless(OutputCreateProductEntityTest.hasFeature("validate"), "feature not present in this SDK: validate")
    let client = BluefinTecsMerchantPortalSDK.testSDK(nil, vm(("feature", .map(vm(("validate", .map(vm(("active", .bool(true))))))))))
    var err: Error? = nil
    do { _ = try client.OutputCreateProduct().create(vm(("acquirerId", .int(1)), ("allowMultipleOrders", .bool(true)), ("appFormTemplateName", .string("x")), ("contractNeeded", .bool(true)), ("descriptionKey", .string("x")), ("nameKey", .string("x")), ("prescreeningAllowed", .bool(true)), ("productName", .string("x")), ("responseCode", .int(1)), ("responseMessage", .string("x")), ("terminalTemplateName", .string("x")), ("vendorName", .string("x")), ("xmlTemplateFile", .string("x"))), nil) } catch { err = error }
    XCTAssertEqual((err as? BluefinTecsMerchantPortalError)?.code, "validate_failed",
      "expected validate_failed, got \(String(describing: err))")
  }

  // True when this SDK was generated with the named feature.
  static func hasFeature(_ name: String) -> Bool {
    gp(SdkConfig.makeConfig(), "feature").asMap?.entries[name] != nil
  }
}
