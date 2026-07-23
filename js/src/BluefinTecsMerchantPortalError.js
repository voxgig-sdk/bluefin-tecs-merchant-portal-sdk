

class BluefinTecsMerchantPortalError extends Error {

  isBluefinTecsMerchantPortalError = true

  sdk = 'BluefinTecsMerchantPortal'

  constructor(code, msg, ctx) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

module.exports = {
  BluefinTecsMerchantPortalError
}

