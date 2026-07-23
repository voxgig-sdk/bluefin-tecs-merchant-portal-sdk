# BluefinTecsMerchantPortal SDK utility: make_context

from core.context import BluefinTecsMerchantPortalContext


def make_context_util(ctxmap, basectx):
    return BluefinTecsMerchantPortalContext(ctxmap, basectx)
