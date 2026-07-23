-- BluefinTecsMerchantPortal SDK error

local BluefinTecsMerchantPortalError = {}
BluefinTecsMerchantPortalError.__index = BluefinTecsMerchantPortalError


function BluefinTecsMerchantPortalError.new(code, msg, ctx)
  local self = setmetatable({}, BluefinTecsMerchantPortalError)
  self.is_sdk_error = true
  self.sdk = "BluefinTecsMerchantPortal"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function BluefinTecsMerchantPortalError:error()
  return self.msg
end


function BluefinTecsMerchantPortalError:__tostring()
  return self.msg
end


return BluefinTecsMerchantPortalError
