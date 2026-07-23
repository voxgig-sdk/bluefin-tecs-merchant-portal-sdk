
const { test, describe } = require('node:test')
const { equal } = require('node:assert')


const { BluefinTecsMerchantPortalSDK } = require('..')


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await BluefinTecsMerchantPortalSDK.test()
    equal(null !== testsdk, true)
  })

})
