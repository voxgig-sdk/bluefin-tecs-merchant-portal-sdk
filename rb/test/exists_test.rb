# BluefinTecsMerchantPortal SDK exists test

require "minitest/autorun"
require_relative "../BluefinTecsMerchantPortal_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = BluefinTecsMerchantPortalSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
