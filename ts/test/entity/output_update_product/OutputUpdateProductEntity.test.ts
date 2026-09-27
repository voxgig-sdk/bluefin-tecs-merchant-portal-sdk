

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
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"allowMultipleOrders":{"a":true,"h":"Allow Multiple Orders","n":"allowMultipleOrders","r":false,"sh":"An attribute to indicate if multiple orders are allowed","t":"`$BOOLEAN`","key$":"allowMultipleOrders","index$":0},"appFormName":{"a":true,"h":"App Form Name","n":"appFormName","r":false,"sh":"The name of the application form","t":"`$STRING`","key$":"appFormName","index$":1},"contractNeeded":{"a":true,"h":"Contract Needed","n":"contractNeeded","r":false,"sh":"An attribute to indicate if a contract is needed","t":"`$BOOLEAN`","key$":"contractNeeded","index$":2},"credentialsNeeded":{"a":true,"h":"Credentials Needed","n":"credentialsNeeded","r":false,"sh":"An attribute to indicate if credentials are needed","t":"`$BOOLEAN`","key$":"credentialsNeeded","index$":3},"descriptionKey":{"a":true,"h":"Description Key","n":"descriptionKey","r":false,"sh":"The description of the product","t":"`$STRING`","key$":"descriptionKey","index$":4},"nameKey":{"a":true,"h":"Name Key","n":"nameKey","r":false,"sh":"The key of the product name","t":"`$STRING`","key$":"nameKey","index$":5},"prescreeningAllowed":{"a":true,"h":"Prescreening Allowed","n":"prescreeningAllowed","r":false,"sh":"An attribute to indicate if prescreening is allowed","t":"`$BOOLEAN`","key$":"prescreeningAllowed","index$":6},"productName":{"a":true,"h":"Product Name","n":"productName","r":false,"sh":"The name of the product","t":"`$STRING`","key$":"productName","index$":7},"productStatus":{"a":true,"h":"Product Status","n":"productStatus","r":false,"sh":"The status of the product","t":"`$STRING`","key$":"productStatus","index$":8},"productUUID":{"a":true,"h":"Product Uuid","n":"productUUID","r":true,"sh":"The UUID of the product to update","t":"`$STRING`","key$":"productUUID","index$":9},"responseCode":{"a":true,"fo":"int32","h":"Response Code","n":"responseCode","r":true,"sh":"Response code.","t":"`$INTEGER`","key$":"responseCode","index$":10},"responseMessage":{"a":true,"h":"Response Message","n":"responseMessage","r":true,"sh":"Response message.","t":"`$STRING`","key$":"responseMessage","index$":11},"vendorName":{"a":true,"h":"Vendor Name","n":"vendorName","r":false,"sh":"The name of the vendor","t":"`$STRING`","key$":"vendorName","index$":12}},"name":"output_update_product","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /merchantportalws/updateProduct","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/updateProduct","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"updateProduct"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"output_update_product","name__orig":"output_update_product","Name":"OutputUpdateProduct","name_":"output_update_product","name-":"output-update-product","NAME":"OUTPUT_UPDATE_PRODUCT","index$":18}, {"active":true,"entity":"output_update_product","key$":"BasicOutputUpdateProductFlow","kind":"basic","name":"BasicOutputUpdateProductFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"output_update_product_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0}]}, 'OutputUpdateProduct', {"POST /merchantportalws/updateProduct":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["productUUID"],"properties":{"allowMultipleOrders":{"type":"boolean","example":true,"description":"An attribute to indicate if multiple orders are allowed","key$":"allowMultipleOrders"},"appFormName":{"type":"string","example":"My Application Form Name","description":"The name of the application form","key$":"appFormName"},"contractNeeded":{"type":"boolean","example":true,"description":"An attribute to indicate if a contract is needed","key$":"contractNeeded"},"credentialsNeeded":{"type":"boolean","example":true,"description":"An attribute to indicate if credentials are needed","key$":"credentialsNeeded"},"descriptionKey":{"type":"string","example":"My Product Description","description":"The description of the product","key$":"descriptionKey"},"nameKey":{"type":"string","example":"My Product Name Key","description":"The key of the product name","key$":"nameKey"},"prescreeningAllowed":{"type":"boolean","example":true,"description":"An attribute to indicate if prescreening is allowed","key$":"prescreeningAllowed"},"productName":{"type":"string","example":"My Product Name","description":"The name of the product","key$":"productName"},"productStatus":{"type":"string","example":"ACTIVE","description":"The status of the product","key$":"productStatus"},"productUUID":{"type":"string","example":"123e4567-e89b-12d3-a456-426614174000","description":"The UUID of the product to update","key$":"productUUID"},"vendorName":{"type":"string","example":"My Vendor Name","description":"The name of the vendor","key$":"vendorName"}},"title":"InputUpdateProduct","x-ref":"#/components/schemas/InputUpdateProduct","index$":1}}},"description":"inputUpdateProduct","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]}})
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
  
