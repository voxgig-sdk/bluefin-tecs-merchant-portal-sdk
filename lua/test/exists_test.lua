-- BluefinTecsMerchantPortal SDK exists test

local sdk = require("bluefin-tecs-merchant-portal_sdk")

describe("BluefinTecsMerchantPortalSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
