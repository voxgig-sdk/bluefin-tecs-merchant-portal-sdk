// merchant_portal_api_controller entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class MerchantPortalApiControllerEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.MerchantPortalApiController()
    XCTAssertEqual(ent.getName(), "merchant_portal_api_controller")
  }

  // An invalid request fails with validate's own error, before it is sent.
  func testValidate() throws {
    try XCTSkipUnless(MerchantPortalApiControllerEntityTest.hasFeature("validate"), "feature not present in this SDK: validate")
    let client = BluefinTecsMerchantPortalSDK.testSDK(nil, vm(("feature", .map(vm(("validate", .map(vm(("active", .bool(true))))))))))
    var err: Error? = nil
    do { _ = try client.MerchantPortalApiController().create(vm(("account_number", .string("x")), ("business_reg_number", .string("x")), ("city", .string("x")), ("country", .string("x")), ("currency", .string("x")), ("merchant_category_code", .int(1)), ("merchant_name", .string("x")), ("packageid", .string("x")), ("packageorderuuid", .string("x")), ("reason_deactivation", .string("x")), ("reason_reactivation", .string("x")), ("street", .string("x")), ("terminal_country_code", .string("x")), ("terminal_language_code", .string("x")), ("terminal_location", .string("x")), ("terminal_serial_number", .string("x")), ("terminalid", .int(1)), ("vu_nummer", .string("x")), ("zipcode", .string("x"))), nil) } catch { err = error }
    XCTAssertEqual((err as? BluefinTecsMerchantPortalError)?.code, "validate_failed",
      "expected validate_failed, got \(String(describing: err))")
  }

  // True when this SDK was generated with the named feature.
  static func hasFeature(_ name: String) -> Bool {
    gp(SdkConfig.makeConfig(), "feature").asMap?.entries[name] != nil
  }
}
