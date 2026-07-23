# BluefinTecsMerchantPortal SDK utility: make_context
require_relative '../core/context'
module BluefinTecsMerchantPortalUtilities
  MakeContext = ->(ctxmap, basectx) {
    BluefinTecsMerchantPortalContext.new(ctxmap, basectx)
  }
end
