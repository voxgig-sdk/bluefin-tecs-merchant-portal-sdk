// BluefinTecsMerchantPortalError: the SDK error type (mirrors go core/error.go). The
// pipeline error discipline is Result<T, BluefinTecsMerchantPortalError> throughout.

use crate::utility::voxgigstruct::Value;

#[derive(Clone, Debug)]
pub struct BluefinTecsMerchantPortalError {
    pub sdk: String,
    pub code: String,
    pub msg: String,
    // Cleaned snapshots attached by makeError (Noval until then).
    pub result: Value,
    pub spec: Value,
}

impl BluefinTecsMerchantPortalError {
    pub fn new(code: &str, msg: &str) -> BluefinTecsMerchantPortalError {
        BluefinTecsMerchantPortalError {
            sdk: "BluefinTecsMerchantPortal".to_string(),
            code: code.to_string(),
            msg: msg.to_string(),
            result: Value::Noval,
            spec: Value::Noval,
        }
    }
}

impl std::fmt::Display for BluefinTecsMerchantPortalError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.write_str(&self.msg)
    }
}

impl std::error::Error for BluefinTecsMerchantPortalError {}
