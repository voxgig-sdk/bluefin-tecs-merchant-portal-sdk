
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { BluefinTecsMerchantPortalSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = BluefinTecsMerchantPortalSDK.test()
    equal(testsdk instanceof BluefinTecsMerchantPortalSDK, true,
      'BluefinTecsMerchantPortalSDK.test() must return a client synchronously')
  })

})
