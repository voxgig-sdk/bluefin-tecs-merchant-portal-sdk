

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


describe('MerchantPortalPamFormControllerEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinTecsMerchantPortalSDK.test()
    const ent = testsdk.MerchantPortalPamFormController()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE
    for (const op of ['create']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'merchant_portal_pam_form_controller.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"appFormFieldsDescUUID":{"a":true,"h":"App Form Fields Desc Uuid","n":"appFormFieldsDescUUID","r":true,"t":"`$STRING`","key$":"appFormFieldsDescUUID","index$":0},"filter":{"a":true,"h":"Filter","n":"filter","r":false,"t":"`$OBJECT`","key$":"filter","index$":1},"language":{"a":true,"h":"Language","n":"language","op":{"create":{"req":false,"type":"`$STRING`"}},"r":true,"t":"`$STRING`","key$":"language","index$":2},"packageOrder":{"a":true,"h":"Package Order","n":"packageOrder","r":false,"t":"`$OBJECT`","key$":"packageOrder","index$":3},"packageOrderUUID":{"a":true,"h":"Package Order Uuid","n":"packageOrderUUID","op":{"create":{"req":false,"type":"`$STRING`"}},"r":true,"sh":"UUID of the package order.","t":"`$STRING`","key$":"packageOrderUUID","index$":4},"packageUUID":{"a":true,"h":"Package Uuid","n":"packageUUID","r":false,"t":"`$STRING`","key$":"packageUUID","index$":5},"productOrderUUID":{"a":true,"h":"Product Order Uuid","n":"productOrderUUID","op":{"create":{"req":true,"type":"`$STRING`"}},"r":false,"sh":"UUID of the product order.","t":"`$STRING`","key$":"productOrderUUID","index$":6},"productOrders":{"a":true,"h":"Product Orders","n":"productOrders","r":false,"t":"`$ARRAY`","key$":"productOrders","index$":7},"reasonOfReopening":{"a":true,"h":"Reason Of Reopening","n":"reasonOfReopening","r":true,"t":"`$STRING`","key$":"reasonOfReopening","index$":8}},"name":"merchant_portal_pam_form_controller","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /merchantportalws/applicationForm","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/applicationForm","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"applicationForm"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0},{"a":true,"co":{"id":"POST /merchantportalws/packageForm","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/packageForm","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"packageForm"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":1},{"a":true,"co":{"id":"POST /merchantportalws/reopenForm","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/reopenForm","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"reopenForm"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":2},{"a":true,"co":{"id":"POST /merchantportalws/secretKey","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/secretKey","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"secretKey"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":3},{"a":true,"co":{"id":"POST /merchantportalws/submitForm","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/submitForm","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"submitForm"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":4},{"a":true,"co":{"id":"POST /merchantportalws/submitValues","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/submitValues","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"submitValues"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":5}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"merchant_portal_pam_form_controller","name__orig":"merchant_portal_pam_form_controller","Name":"MerchantPortalPamFormController","name_":"merchant_portal_pam_form_controller","name-":"merchant-portal-pam-form-controller","NAME":"MERCHANT_PORTAL_PAM_FORM_CONTROLLER","index$":4}, {"active":true,"entity":"merchant_portal_pam_form_controller","key$":"BasicMerchantPortalPamFormControllerFlow","kind":"basic","name":"BasicMerchantPortalPamFormControllerFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"merchant_portal_pam_form_controller_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0}]}, 'MerchantPortalPamFormController', {"POST /merchantportalws/applicationForm":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["language","packageOrderUUID"],"properties":{"filter":{"type":"object","properties":{"page":{"type":"integer","format":"int32"},"productOrderUUID":{"type":"string"}},"title":"InputApplicationForm_Filter","x-ref":"#/components/schemas/InputApplicationForm_Filter","key$":"filter"},"language":{"type":"string","key$":"language"},"packageOrderUUID":{"type":"string","key$":"packageOrderUUID"}},"title":"InputApplicationForm","x-ref":"#/components/schemas/InputApplicationForm","index$":1}}},"description":"inputApplicationForm","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]},"POST /merchantportalws/packageForm":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","properties":{"filter":{"type":"object","properties":{"productType":{"type":"string","example":"MERCHANT_CONTRACT","description":"Name of the product type"},"productUUID":{"type":"string"}},"title":"InputMerchantForm_Filter","x-ref":"#/components/schemas/InputMerchantForm_Filter","key$":"filter"},"language":{"type":"string","key$":"language"},"packageUUID":{"type":"string","key$":"packageUUID"}},"title":"InputMerchantForm","x-ref":"#/components/schemas/InputMerchantForm","index$":1}}},"description":"inputMerchantForm","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]},"POST /merchantportalws/reopenForm":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["appFormFieldsDescUUID","reasonOfReopening"],"properties":{"appFormFieldsDescUUID":{"type":"string","key$":"appFormFieldsDescUUID"},"packageOrderUUID":{"type":"string","description":"UUID of the package order. NOTE: Either package order UUID or product order UUID has to be present. If none is present error is returned. If both are present error is returned.","key$":"packageOrderUUID"},"productOrderUUID":{"type":"string","description":"UUID of the product order. NOTE: Either package order UUID or product order UUID has to be present. If none is present error is returned. If both are present error is returned.","key$":"productOrderUUID"},"reasonOfReopening":{"type":"string","key$":"reasonOfReopening"}},"title":"InputReopenForm","x-ref":"#/components/schemas/InputReopenForm","index$":1}}},"description":"inputReopenForm","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]},"POST /merchantportalws/secretKey":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["productOrderUUID"],"properties":{"productOrderUUID":{"type":"string","key$":"productOrderUUID"}},"title":"InputSecretKey","x-ref":"#/components/schemas/InputSecretKey","index$":1}}},"description":"inputSecretKey","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]},"POST /merchantportalws/submitForm":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["productOrderUUID"],"properties":{"productOrderUUID":{"type":"string","key$":"productOrderUUID"}},"title":"InputSubmitForm","x-ref":"#/components/schemas/InputSubmitForm","index$":1}}},"description":"inputSubmitForm","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]},"POST /merchantportalws/submitValues":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","properties":{"packageOrder":{"type":"object","properties":{"applicationForms":{"type":"array","items":{"type":"object","required":[],"properties":{},"title":"InputSubmitValues_ApplicationForm","x-ref":"#/components/schemas/InputSubmitValues_ApplicationForm"}},"uuid":{"type":"string"}},"title":"InputSubmitValues_PackageOrder","x-ref":"#/components/schemas/InputSubmitValues_PackageOrder","key$":"packageOrder"},"productOrders":{"type":"array","items":{"type":"object","properties":{"applicationForms":{"type":"array","items":{}},"uuid":{"type":"string"}},"title":"InputSubmitValues_ProductOrder","x-ref":"#/components/schemas/InputSubmitValues_ProductOrder"},"key$":"productOrders"}},"title":"InputSubmitValues","x-ref":"#/components/schemas/InputSubmitValues","index$":1}}},"description":"inputSubmitValues","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const merchant_portal_pam_form_controller_ref01_ent = client.MerchantPortalPamFormController()
    let merchant_portal_pam_form_controller_ref01_data = setup.data.new.merchant_portal_pam_form_controller['merchant_portal_pam_form_controller_ref01']

    merchant_portal_pam_form_controller_ref01_data = (await merchant_portal_pam_form_controller_ref01_ent.create(merchant_portal_pam_form_controller_ref01_data)).data()
    assert(null != merchant_portal_pam_form_controller_ref01_data)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/merchant_portal_pam_form_controller/MerchantPortalPamFormControllerTestData.json')

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
    ['merchant_portal_pam_form_controller01','merchant_portal_pam_form_controller02','merchant_portal_pam_form_controller03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_FORM_CONTROLLER_ENTID': idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_FORM_CONTROLLER_ENTID']

  const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_FORM_CONTROLLER_ENTID']
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
  
