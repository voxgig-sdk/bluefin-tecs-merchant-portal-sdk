# BluefinTecsMerchantPortal SDK feature factory

from feature.base_feature import BluefinTecsMerchantPortalBaseFeature
from feature.test_feature import BluefinTecsMerchantPortalTestFeature


def _make_feature(name):
    features = {
        "base": lambda: BluefinTecsMerchantPortalBaseFeature(),
        "test": lambda: BluefinTecsMerchantPortalTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
