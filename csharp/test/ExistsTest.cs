// BluefinTecsMerchantPortal SDK exists test.

using Xunit;

using BluefinTecsMerchantPortalSdk;

namespace BluefinTecsMerchantPortalSdk.Test;

public class ExistsTest
{
    [Fact]
    public void TestMode()
    {
        var testsdk = BluefinTecsMerchantPortalSDK.TestSDK(null, null);
        Assert.NotNull(testsdk);
    }
}
