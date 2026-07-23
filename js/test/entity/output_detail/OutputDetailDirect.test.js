
const envlocal = __dirname + '/../../../.env.local'
require('dotenv').config({ quiet: true, path: [envlocal] })

const { test, describe } = require('node:test')
const assert = require('node:assert')


const { BluefinTecsMerchantPortalSDK } = require('../../..')

const {
  envOverride,
} = require('../../utility')


describe('OutputDetailDirect', async () => {

  test('direct-exists', async () => {
    const sdk = new BluefinTecsMerchantPortalSDK({
      system: { fetch: async () => ({}) }
    })
    assert('function' === typeof sdk.direct)
    assert('function' === typeof sdk.prepare)
  })


  test('direct-load-output_detail', async () => {
    const setup = directSetup({ id: 'direct01' })
    const { client, calls } = setup

    const params = {}
    if (!setup.live) {
      params.id = 'direct01'
    }

    const result = await client.direct({
      path: 'merchantportalws/batch/registerAdditionalTerminal/details/{id}',
      method: 'GET',
      params,
    })

    assert(result.ok === true)
    assert(result.status === 200)
    assert(null != result.data)

    if (!setup.live) {
      assert(result.data.id === 'direct01')
      assert(calls.length === 1)
      assert(calls[0].init.method === 'GET')
      assert(calls[0].url.includes('direct01'))
    }
  })

})



function directSetup(mockres) {
  const calls = []

  const env = envOverride({
    'BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_DETAIL_ENTID': {},
    'BLUEFINTECSMERCHANTPORTAL_TEST_LIVE': 'FALSE',
  })

  const live = 'TRUE' === env.BLUEFINTECSMERCHANTPORTAL_TEST_LIVE

  if (live) {
    const client = new BluefinTecsMerchantPortalSDK({
    })

    let idmap = env['BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_DETAIL_ENTID']
    if ('string' === typeof idmap && idmap.startsWith('{')) {
      idmap = JSON.parse(idmap)
    }

    return { client, calls, live, idmap }
  }

  const mockFetch = async (url, init) => {
    calls.push({ url, init })
    return {
      status: 200,
      statusText: 'OK',
      headers: {},
      json: async () => (null != mockres ? mockres : { id: 'direct01' }),
    }
  }

  const client = new BluefinTecsMerchantPortalSDK({
    base: 'http://localhost:8080',
    system: { fetch: mockFetch },
  })

  return { client, calls, live, idmap: {} }
}
  
