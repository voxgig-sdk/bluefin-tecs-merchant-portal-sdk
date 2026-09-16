

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { BluefinTecsMerchantPortalSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('OutputUpdateProductEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinTecsMerchantPortalSDK.test()
    const ent = testsdk.OutputUpdateProduct()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE
    for (const op of ['create']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'output_update_product.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"allowMultipleOrders","req":false,"short":"An attribute to indicate if multiple orders are allowed","type":"`$BOOLEAN`","index$":0},{"active":true,"name":"appFormName","req":false,"short":"The name of the application form","type":"`$STRING`","index$":1},{"active":true,"name":"contractNeeded","req":false,"short":"An attribute to indicate if a contract is needed","type":"`$BOOLEAN`","index$":2},{"active":true,"name":"credentialsNeeded","req":false,"short":"An attribute to indicate if credentials are needed","type":"`$BOOLEAN`","index$":3},{"active":true,"name":"descriptionKey","req":false,"short":"The description of the product","type":"`$STRING`","index$":4},{"active":true,"name":"nameKey","req":false,"short":"The key of the product name","type":"`$STRING`","index$":5},{"active":true,"name":"prescreeningAllowed","req":false,"short":"An attribute to indicate if prescreening is allowed","type":"`$BOOLEAN`","index$":6},{"active":true,"name":"productName","req":false,"short":"The name of the product","type":"`$STRING`","index$":7},{"active":true,"name":"productStatus","req":false,"short":"The status of the product","type":"`$STRING`","index$":8},{"active":true,"name":"productUUID","req":true,"short":"The UUID of the product to update","type":"`$STRING`","index$":9},{"active":true,"format":"int32","name":"responseCode","req":true,"short":"Response code.","type":"`$INTEGER`","index$":10},{"active":true,"name":"responseMessage","req":true,"short":"Response message.","type":"`$STRING`","index$":11},{"active":true,"name":"vendorName","req":false,"short":"The name of the vendor","type":"`$STRING`","index$":12}],"name":"output_update_product","op":{"create":{"input":"data","name":"create","points":[{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":true,"type":"`$STRING`"}]},"contract":{"id":"POST /merchantportalws/updateProduct","json":"{\"operationId\":\"updateProductUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"allowMultipleOrders\":{\"description\":\"An attribute to indicate if multiple orders are allowed\",\"example\":true,\"type\":\"boolean\"},\"appFormName\":{\"description\":\"The name of the application form\",\"example\":\"My Application Form Name\",\"type\":\"string\"},\"contractNeeded\":{\"description\":\"An attribute to indicate if a contract is needed\",\"example\":true,\"type\":\"boolean\"},\"credentialsNeeded\":{\"description\":\"An attribute to indicate if credentials are needed\",\"example\":true,\"type\":\"boolean\"},\"descriptionKey\":{\"description\":\"The description of the product\",\"example\":\"My Product Description\",\"type\":\"string\"},\"nameKey\":{\"description\":\"The key of the product name\",\"example\":\"My Product Name Key\",\"type\":\"string\"},\"prescreeningAllowed\":{\"description\":\"An attribute to indicate if prescreening is allowed\",\"example\":true,\"type\":\"boolean\"},\"productName\":{\"description\":\"The name of the product\",\"example\":\"My Product Name\",\"type\":\"string\"},\"productStatus\":{\"description\":\"The status of the product\",\"example\":\"ACTIVE\",\"type\":\"string\"},\"productUUID\":{\"description\":\"The UUID of the product to update\",\"example\":\"123e4567-e89b-12d3-a456-426614174000\",\"type\":\"string\"},\"vendorName\":{\"description\":\"The name of the vendor\",\"example\":\"My Vendor Name\",\"type\":\"string\"}},\"required\":[\"productUUID\"],\"title\":\"InputUpdateProduct\",\"type\":\"object\"}}},\"description\":\"inputUpdateProduct\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputUpdateProduct\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/merchantportalws/updateProduct","segments":[{"lit":"merchantportalws"},{"lit":"updateProduct"}],"select":{"exist":["authorization"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"output_update_product","name__orig":"output_update_product","Name":"OutputUpdateProduct","name_":"output_update_product","name-":"output-update-product","NAME":"OUTPUT_UPDATE_PRODUCT","index$":18}, {"active":true,"entity":"output_update_product","key$":"BasicOutputUpdateProductFlow","kind":"basic","name":"BasicOutputUpdateProductFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"output_update_product_ref01"},"match":{},"op":"create","spec":[],"valid":[],"index$":0}]}, 'OutputUpdateProduct')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const output_update_product_ref01_ent = client.OutputUpdateProduct()
    let output_update_product_ref01_data = setup.data.new.output_update_product['output_update_product_ref01']

    output_update_product_ref01_data = (await output_update_product_ref01_ent.create(output_update_product_ref01_data)).data()
    assert(null != output_update_product_ref01_data)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/output_update_product/OutputUpdateProductTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = BluefinTecsMerchantPortalSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['output_update_product01','output_update_product02','output_update_product03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_UPDATE_PRODUCT_ENTID': idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_UPDATE_PRODUCT_ENTID']

  const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_UPDATE_PRODUCT_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new BluefinTecsMerchantPortalSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
