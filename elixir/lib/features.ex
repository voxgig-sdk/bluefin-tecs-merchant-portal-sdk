# BluefinTecsMerchantPortal SDK feature factory

defmodule BluefinTecsMerchantPortal.Features do
  def make_feature(name) do
    case name do
      "test" -> BluefinTecsMerchantPortal.Feature.Test.new()
      _ -> BluefinTecsMerchantPortal.Feature.new()
    end
  end
end
