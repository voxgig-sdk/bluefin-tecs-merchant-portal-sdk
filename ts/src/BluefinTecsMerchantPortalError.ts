
import { Context } from './Context'


class BluefinTecsMerchantPortalError extends Error {

  isBluefinTecsMerchantPortalError = true

  sdk = 'BluefinTecsMerchantPortal'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  BluefinTecsMerchantPortalError
}

