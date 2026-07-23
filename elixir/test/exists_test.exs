defmodule BluefinTecsMerchantPortal.ExistsTest do
  use ExUnit.Case

  test "should create test sdk" do
    testsdk = BluefinTecsMerchantPortal.test()
    assert testsdk != nil
  end
end
