

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


loadEnvLocal(__dirname + '/../../../.env.local')


describe('OutputAddProductEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinTecsMerchantPortalSDK.test()
    const ent = testsdk.OutputAddProduct()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE
    for (const op of ['create']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'output_add_product.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"packageUUID":{"a":true,"h":"Package Uuid","n":"packageUUID","r":true,"sh":"Unique identifier for the package.","t":"`$STRING`","key$":"packageUUID","index$":0},"productUUIDs":{"a":true,"h":"Product Uui Ds","n":"productUUIDs","r":true,"sh":"The list of unique identifiers of the products.","t":"`$ARRAY`","key$":"productUUIDs","index$":1},"responseCode":{"a":true,"fo":"int32","h":"Response Code","n":"responseCode","r":true,"sh":"Response code.","t":"`$INTEGER`","key$":"responseCode","index$":2},"responseMessage":{"a":true,"h":"Response Message","n":"responseMessage","r":true,"sh":"Response message.","t":"`$STRING`","key$":"responseMessage","index$":3}},"name":"output_add_product","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /merchantportalws/addProductsToPackage","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/addProductsToPackage","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"addProductsToPackage"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"output_add_product","name__orig":"output_add_product","Name":"OutputAddProduct","name_":"output_add_product","name-":"output-add-product","NAME":"OUTPUT_ADD_PRODUCT","index$":9}, {"active":true,"entity":"output_add_product","key$":"BasicOutputAddProductFlow","kind":"basic","name":"BasicOutputAddProductFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"output_add_product_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0}]}, 'OutputAddProduct', {"POST /merchantportalws/addProductsToPackage":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["packageUUID","productUUIDs"],"properties":{"packageUUID":{"type":"string","example":"123e4567-e89b-12d3-a456-426614174000","description":"Unique identifier for the package.","key$":"packageUUID"},"productUUIDs":{"type":"array","example":["123e4567-e89b-12d3-a456-426614174000","123e4567-e89b-12d3-a456-426614174001"],"description":"The list of unique identifiers of the products.","uniqueItems":true,"items":{"type":"string"},"key$":"productUUIDs"}},"title":"InputAddProducts","x-ref":"#/components/schemas/InputAddProducts","index$":1}}},"description":"inputAddProducts","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const output_add_product_ref01_ent = client.OutputAddProduct()
    let output_add_product_ref01_data = setup.data.new.output_add_product['output_add_product_ref01']

    output_add_product_ref01_data = (await output_add_product_ref01_ent.create(output_add_product_ref01_data)).data()
    assert(null != output_add_product_ref01_data)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/output_add_product/OutputAddProductTestData.json')

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
    ['output_add_product01','output_add_product02','output_add_product03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_ADD_PRODUCT_ENTID': idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_ADD_PRODUCT_ENTID']

  const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_ADD_PRODUCT_ENTID']
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
  
