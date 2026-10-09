// merchant_portal_pam_merchant_controller entity test (generated from the API model).

import XCTest

@testable import BluefinTecsMerchantPortalSdk

final class MerchantPortalPamMerchantControllerEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinTecsMerchantPortalSDK.testSDK(nil, nil)
    let ent = sdk.MerchantPortalPamMerchantController()
    XCTAssertEqual(ent.getName(), "merchant_portal_pam_merchant_controller")
  }

  // An invalid request fails with validate's own error, before it is sent.
  func testValidate() throws {
    try XCTSkipUnless(MerchantPortalPamMerchantControllerEntityTest.hasFeature("validate"), "feature not present in this SDK: validate")
    let client = BluefinTecsMerchantPortalSDK.testSDK(nil, vm(("feature", .map(vm(("validate", .map(vm(("active", .bool(true))))))))))
    var err: Error? = nil
    do { _ = try client.MerchantPortalPamMerchantController().create(vm(("businessRegistrationNumber", .int(1)), ("companyName", .string("x")), ("corporateUUID", .string("x")), ("currency", .string("x")), ("email", .string("x")), ("language", .string("x")), ("login", .string("x")), ("mandator", .string("x")), ("merchantContractNumber", .string("x")), ("packageorderuuid", .string("x")), ("phoneNumber", .string("x")), ("productid_acquirer", .string("x")), ("vu_nummer", .string("x"))), nil) } catch { err = error }
    XCTAssertEqual((err as? BluefinTecsMerchantPortalError)?.code, "validate_failed",
      "expected validate_failed, got \(String(describing: err))")
  }

  // True when this SDK was generated with the named feature.
  static func hasFeature(_ name: String) -> Bool {
    gp(SdkConfig.makeConfig(), "feature").asMap?.entries[name] != nil
  }
}
