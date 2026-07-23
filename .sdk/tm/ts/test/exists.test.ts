
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { BluefinTecsMerchantPortalSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await BluefinTecsMerchantPortalSDK.test()
    equal(null !== testsdk, true)
  })

})
