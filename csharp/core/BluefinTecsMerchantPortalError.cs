// BluefinTecsMerchantPortalError - the SDK error type. Carries the pipeline error code,
// the originating context and cleaned result/spec snapshots.

namespace BluefinTecsMerchantPortalSdk;

public class BluefinTecsMerchantPortalError : Exception
{
    public bool IsBluefinTecsMerchantPortalError = true;
    public string Sdk = "BluefinTecsMerchantPortal";
    public string Code;
    public Context? Ctx;
    public object? ResultVal;
    public object? SpecVal;

    public BluefinTecsMerchantPortalError(string code, string msg, Context? ctx)
        : base(msg)
    {
        Code = code;
        Ctx = ctx;
    }
}
