"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.BluefinTecsMerchantPortalError = void 0;
class BluefinTecsMerchantPortalError extends Error {
    isBluefinTecsMerchantPortalError = true;
    sdk = 'BluefinTecsMerchantPortal';
    code;
    ctx;
    status = -1;
    // `err.notFound` rather than a magic number at every call site.
    get notFound() { return 404 === this.status; }
    constructor(code, msg, ctx) {
        super(msg);
        this.code = code;
        this.ctx = ctx;
    }
}
exports.BluefinTecsMerchantPortalError = BluefinTecsMerchantPortalError;
//# sourceMappingURL=BluefinTecsMerchantPortalError.js.map