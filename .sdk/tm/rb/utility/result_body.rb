# BluefinTecsMerchantPortal SDK utility: result_body
module BluefinTecsMerchantPortalUtilities
  ResultBody = ->(ctx) {
    response = ctx.response
    result = ctx.result
    if result && response && response.json_func && response.body
      result.body = response.json_func.call
    end
    result
  }
end
