# ProjectName SDK exists test

import pytest
from bluefintecsmerchantportal_sdk import BluefinTecsMerchantPortalSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = BluefinTecsMerchantPortalSDK.test(None, None)
        assert testsdk is not None
