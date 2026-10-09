# BluefinTecsMerchantPortal SDK utility: prepare_body
require_relative 'media'
module BluefinTecsMerchantPortalUtilities
  PrepareBody = ->(ctx) {
    return nil unless ctx.op.input == "data"
    return BluefinTecsMerchantPortalUtilities.raw_body(ctx.reqdata) if BluefinTecsMerchantPortalUtilities.raw_request?(ctx.point)
    ctx.utility.transform_request.call(ctx)
  }
end
