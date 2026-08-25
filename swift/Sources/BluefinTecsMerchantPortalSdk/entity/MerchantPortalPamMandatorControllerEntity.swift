// MerchantPortalPamMandatorController entity client for the BluefinTecsMerchantPortal SDK.

import Foundation

public final class MerchantPortalPamMandatorControllerEntity: BluefinTecsMerchantPortalEntityBase {
  public init(_ client: BluefinTecsMerchantPortalSDK, _ entopts: VMap? = nil) {
    super.init(client, entopts, "merchant_portal_pam_mandator_controller")
  }

  public override func make() -> Entity {
    return MerchantPortalPamMandatorControllerEntity(client, cloneOpts())
  }

  // (load not defined by this API - base class throws unsupportedOp)

  // (list not defined by this API - base class throws unsupportedOp)

  public override func create(_ reqdata: VMap?, _ ctrl: VMap?) throws -> Value {
    var ctxmap: [String: Any?] = ["opname": "create", "match": match, "data": data]
    if let ctrl = ctrl { ctxmap["ctrl"] = ctrl }
    if let reqdata = reqdata { ctxmap["reqdata"] = reqdata }
    let ctx = utility.makeContext(ctxmap, entctx)
  
    return try runOp(ctx) {
      if let result = ctx.result {
        if !isNil(result.resdata) {
          self.data = clone(result.resdata).asMap ?? VMap()
        }
      }
    }
  }

  // (update not defined by this API - base class throws unsupportedOp)

  // (remove not defined by this API - base class throws unsupportedOp)
}
