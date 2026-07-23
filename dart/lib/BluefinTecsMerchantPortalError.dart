class BluefinTecsMerchantPortalError extends Error {
  final bool isBluefinTecsMerchantPortalError = true;

  final String sdk = 'BluefinTecsMerchantPortal';

  String code;
  String message;
  dynamic ctx;

  // Populated by makeError with the (cleaned) result and spec.
  dynamic result;
  dynamic spec;

  BluefinTecsMerchantPortalError(this.code, this.message, [this.ctx]);

  @override
  String toString() => 'BluefinTecsMerchantPortalError: ' + code + ': ' + message;
}
