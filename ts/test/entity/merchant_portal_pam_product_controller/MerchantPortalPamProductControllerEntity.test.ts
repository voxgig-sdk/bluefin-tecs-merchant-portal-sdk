

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


describe('MerchantPortalPamProductControllerEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinTecsMerchantPortalSDK.test()
    const ent = testsdk.MerchantPortalPamProductController()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE
    for (const op of ['create']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'merchant_portal_pam_product_controller.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"consumerUUID":{"a":true,"h":"Consumer Uuid","n":"consumerUUID","r":false,"t":"`$STRING`","key$":"consumerUUID","index$":0},"filter":{"a":true,"h":"Filter","n":"filter","r":false,"t":"`$OBJECT`","key$":"filter","index$":1},"language":{"a":true,"h":"Language","n":"language","r":false,"t":"`$STRING`","key$":"language","index$":2},"merchantID":{"a":true,"h":"Merchant Id","n":"merchantID","r":false,"t":"`$STRING`","key$":"merchantID","index$":3},"packageOrderUUID":{"a":true,"h":"Package Order Uuid","n":"packageOrderUUID","r":true,"t":"`$STRING`","key$":"packageOrderUUID","index$":4},"pagination":{"a":true,"h":"Pagination","n":"pagination","r":false,"t":"`$OBJECT`","key$":"pagination","index$":5},"productOrderUUID":{"a":true,"h":"Product Order Uuid","n":"productOrderUUID","r":true,"t":"`$STRING`","key$":"productOrderUUID","index$":6},"productUUID":{"a":true,"h":"Product Uuid","n":"productUUID","r":true,"t":"`$STRING`","key$":"productUUID","index$":7},"reason_decline":{"a":true,"h":"Reason Decline","n":"reason_decline","r":true,"sh":"Reason for product decline.","t":"`$STRING`","key$":"reason_decline","index$":8},"sorting":{"a":true,"h":"Sorting","n":"sorting","r":false,"t":"`$OBJECT`","key$":"sorting","index$":9}},"name":"merchant_portal_pam_product_controller","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /merchantportalws/approveProduct","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/approveProduct","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"approveProduct"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0},{"a":true,"co":{"id":"POST /merchantportalws/declineProduct","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/declineProduct","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"declineProduct"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":1},{"a":true,"co":{"id":"POST /merchantportalws/orderAdditionalProduct","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/orderAdditionalProduct","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"orderAdditionalProduct"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":2},{"a":true,"co":{"id":"POST /merchantportalws/productsList","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/productsList","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"productsList"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":3}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"merchant_portal_pam_product_controller","name__orig":"merchant_portal_pam_product_controller","Name":"MerchantPortalPamProductController","name_":"merchant_portal_pam_product_controller","name-":"merchant-portal-pam-product-controller","NAME":"MERCHANT_PORTAL_PAM_PRODUCT_CONTROLLER","index$":8}, {"active":true,"entity":"merchant_portal_pam_product_controller","key$":"BasicMerchantPortalPamProductControllerFlow","kind":"basic","name":"BasicMerchantPortalPamProductControllerFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"merchant_portal_pam_product_controller_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0}]}, 'MerchantPortalPamProductController', {"POST /merchantportalws/approveProduct":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["productOrderUUID"],"properties":{"merchantID":{"type":"string","key$":"merchantID"},"productOrderUUID":{"type":"string","key$":"productOrderUUID"}},"title":"InputApproveProduct","x-ref":"#/components/schemas/InputApproveProduct","index$":1}}},"description":"inputApproveProduct","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]},"POST /merchantportalws/declineProduct":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["productOrderUUID","reason_decline"],"properties":{"productOrderUUID":{"type":"string","key$":"productOrderUUID"},"reason_decline":{"type":"string","example":"Switch to new product","description":"Reason for product decline.","key$":"reason_decline"}},"title":"InputDeclineProduct","x-ref":"#/components/schemas/InputDeclineProduct","index$":1}}},"description":"inputDeclineProduct","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]},"POST /merchantportalws/orderAdditionalProduct":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["packageOrderUUID","productUUID"],"properties":{"consumerUUID":{"type":"string","key$":"consumerUUID"},"language":{"type":"string","key$":"language"},"packageOrderUUID":{"type":"string","key$":"packageOrderUUID"},"productUUID":{"type":"string","key$":"productUUID"}},"title":"InputOrderAdditionalProduct","x-ref":"#/components/schemas/InputOrderAdditionalProduct","index$":1}}},"description":"inputOrderAdditionalProduct","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]},"POST /merchantportalws/productsList":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","properties":{"filter":{"type":"object","properties":{"productUUID":{"type":"string","example":"d0a0b0c0-d0a0-b0c0-d0a0-b0c0d0a0b0c0","description":"UUID of the product."}},"title":"InputProductsList_Filter","x-ref":"#/components/schemas/InputProductsList_Filter","key$":"filter"},"pagination":{"type":"object","properties":{"page":{"type":"integer","format":"int32","example":1,"description":"Number of the page to display."},"size":{"type":"integer","format":"int32","example":10,"description":"Number of elements per page to display."}},"title":"Pagination","x-ref":"#/components/schemas/Pagination","key$":"pagination"},"sorting":{"type":"object","properties":{"name":{"type":"string","example":"requestorID","description":"Sort attribute name."},"type":{"type":"string","example":"ASC","description":"Sort type ASC / DESC."}},"title":"Sorting","x-ref":"#/components/schemas/Sorting","key$":"sorting"}},"title":"InputProductsList","x-ref":"#/components/schemas/InputProductsList","index$":1}}},"description":"inputProductsList","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const merchant_portal_pam_product_controller_ref01_ent = client.MerchantPortalPamProductController()
    let merchant_portal_pam_product_controller_ref01_data = setup.data.new.merchant_portal_pam_product_controller['merchant_portal_pam_product_controller_ref01']

    merchant_portal_pam_product_controller_ref01_data = (await merchant_portal_pam_product_controller_ref01_ent.create(merchant_portal_pam_product_controller_ref01_data)).data()
    assert(null != merchant_portal_pam_product_controller_ref01_data)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/merchant_portal_pam_product_controller/MerchantPortalPamProductControllerTestData.json')

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
    ['merchant_portal_pam_product_controller01','merchant_portal_pam_product_controller02','merchant_portal_pam_product_controller03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_PRODUCT_CONTROLLER_ENTID': idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_PRODUCT_CONTROLLER_ENTID']

  const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_PRODUCT_CONTROLLER_ENTID']
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
  
