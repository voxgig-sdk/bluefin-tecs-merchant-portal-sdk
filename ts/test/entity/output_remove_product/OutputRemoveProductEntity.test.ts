

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


describe('OutputRemoveProductEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinTecsMerchantPortalSDK.test()
    const ent = testsdk.OutputRemoveProduct()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE
    for (const op of ['create']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'output_remove_product.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"packageUUID":{"a":true,"h":"Package Uuid","n":"packageUUID","r":true,"sh":"Unique identifier for the package.","t":"`$STRING`","key$":"packageUUID","index$":0},"productUUIDs":{"a":true,"h":"Product Uui Ds","n":"productUUIDs","r":true,"sh":"List of product unique identifiers.","t":"`$ARRAY`","key$":"productUUIDs","index$":1},"responseCode":{"a":true,"fo":"int32","h":"Response Code","n":"responseCode","r":true,"sh":"Response code.","t":"`$INTEGER`","key$":"responseCode","index$":2},"responseMessage":{"a":true,"h":"Response Message","n":"responseMessage","r":true,"sh":"Response message.","t":"`$STRING`","key$":"responseMessage","index$":3}},"name":"output_remove_product","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /merchantportalws/removeProductsFromPackage","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/removeProductsFromPackage","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"removeProductsFromPackage"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"output_remove_product","name__orig":"output_remove_product","Name":"OutputRemoveProduct","name_":"output_remove_product","name-":"output-remove-product","NAME":"OUTPUT_REMOVE_PRODUCT","index$":15}, {"active":true,"entity":"output_remove_product","key$":"BasicOutputRemoveProductFlow","kind":"basic","name":"BasicOutputRemoveProductFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"output_remove_product_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0}]}, 'OutputRemoveProduct', {"POST /merchantportalws/removeProductsFromPackage":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["packageUUID","productUUIDs"],"properties":{"packageUUID":{"type":"string","example":"654e3217-e98b-21d3-a456-426614174999","description":"Unique identifier for the package.","key$":"packageUUID"},"productUUIDs":{"type":"array","example":["567e4345-e84b-34d2-b356-125614243567","678f4543-f34c-23d1-c345-234615453451"],"description":"List of product unique identifiers.","uniqueItems":true,"items":{"type":"string"},"key$":"productUUIDs"}},"title":"InputRemoveProducts","x-ref":"#/components/schemas/InputRemoveProducts","index$":1}}},"description":"inputRemoveProducts","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const output_remove_product_ref01_ent = client.OutputRemoveProduct()
    let output_remove_product_ref01_data = setup.data.new.output_remove_product['output_remove_product_ref01']

    output_remove_product_ref01_data = (await output_remove_product_ref01_ent.create(output_remove_product_ref01_data)).data()
    assert(null != output_remove_product_ref01_data)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/output_remove_product/OutputRemoveProductTestData.json')

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
    ['output_remove_product01','output_remove_product02','output_remove_product03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_REMOVE_PRODUCT_ENTID': idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_REMOVE_PRODUCT_ENTID']

  const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_REMOVE_PRODUCT_ENTID']
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
  
