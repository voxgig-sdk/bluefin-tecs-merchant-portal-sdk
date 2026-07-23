# BluefinTecsMerchantPortal SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module BluefinTecsMerchantPortalFeatures
  def self.make_feature(name)
    case name
    when "base"
      BluefinTecsMerchantPortalBaseFeature.new
    when "test"
      BluefinTecsMerchantPortalTestFeature.new
    else
      BluefinTecsMerchantPortalBaseFeature.new
    end
  end
end
