
const envlocal = __dirname + '/../../../.env.local'
require('../../utility').loadEnvLocal(envlocal)

const Path = require('node:path')
const Fs = require('node:fs')

const { test, describe, afterEach } = require('node:test')
const assert = require('node:assert')
const { createLiveTransport } = require('../../live-runner')
const { runLiveEntity } = require('../../live-entity')


const { BluefinTecsMerchantPortalSDK, BaseFeature, stdutil, config } = require('../../..')

const {
  envOverride,
  liveClientOptions,
  liveDelay,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
} = require('../../utility')


describe('MerchantPortalPamDocumentControllerEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinTecsMerchantPortalSDK.test()
    const ent = testsdk.MerchantPortalPamDocumentController()
    assert(null != ent)
  })


  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"appFormFieldDescUUID":{"a":true,"h":"App Form Field Desc Uuid","n":"appFormFieldDescUUID","r":true,"t":"`$STRING`","key$":"appFormFieldDescUUID","index$":0},"packageOrderUUID":{"a":true,"h":"Package Order Uuid","n":"packageOrderUUID","r":false,"sh":"UUID of the package order.","t":"`$STRING`","key$":"packageOrderUUID","index$":1},"productOrderUUID":{"a":true,"h":"Product Order Uuid","n":"productOrderUUID","r":false,"sh":"UUID of the product order.","t":"`$STRING`","key$":"productOrderUUID","index$":2}},"name":"merchant_portal_pam_document_controller","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /merchantportalws/documentsList","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/documentsList","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"documentsList"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0},{"a":true,"co":{"id":"POST /merchantportalws/downloadDocument","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/downloadDocument","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"downloadDocument"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":1}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"merchant_portal_pam_document_controller","name__orig":"merchant_portal_pam_document_controller","Name":"MerchantPortalPamDocumentController","name_":"merchant_portal_pam_document_controller","name-":"merchant-portal-pam-document-controller","NAME":"MERCHANT_PORTAL_PAM_DOCUMENT_CONTROLLER","index$":3}, {"active":true,"entity":"merchant_portal_pam_document_controller","key$":"BasicMerchantPortalPamDocumentControllerFlow","kind":"basic","name":"BasicMerchantPortalPamDocumentControllerFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"merchant_portal_pam_document_controller_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0}]}, 'MerchantPortalPamDocumentController', {"POST /merchantportalws/documentsList":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","properties":{"packageOrderUUID":{"type":"string","description":"UUID of the package order. NOTE: Either package order UUID or product order UUID has to be present. If none is present error is returned. If both are present error is returned.","key$":"packageOrderUUID"},"productOrderUUID":{"type":"string","description":"UUID of the product order. NOTE: Either package order UUID or product order UUID has to be present. If none is present error is returned. If both are present error is returned.","key$":"productOrderUUID"}},"title":"InputDocumentsList","x-ref":"#/components/schemas/InputDocumentsList","index$":1}}},"description":"inputDocumentsList","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]},"POST /merchantportalws/downloadDocument":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["appFormFieldDescUUID"],"properties":{"appFormFieldDescUUID":{"type":"string","key$":"appFormFieldDescUUID"},"packageOrderUUID":{"type":"string","description":"UUID of the package order. NOTE: Either package order UUID or product order UUID has to be present. If none is present error is returned. If both are present error is returned.","key$":"packageOrderUUID"},"productOrderUUID":{"type":"string","description":"UUID of the product order. NOTE: Either package order UUID or product order UUID has to be present. If none is present error is returned. If both are present error is returned.","key$":"productOrderUUID"}},"title":"InputDownloadDocument","x-ref":"#/components/schemas/InputDownloadDocument","index$":1}}},"description":"inputDownloadDocument","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const merchant_portal_pam_document_controller_ref01_ent = client.MerchantPortalPamDocumentController()
    let merchant_portal_pam_document_controller_ref01_data = setup.data.new.merchant_portal_pam_document_controller['merchant_portal_pam_document_controller_ref01']

    merchant_portal_pam_document_controller_ref01_data = (await merchant_portal_pam_document_controller_ref01_ent.create(merchant_portal_pam_document_controller_ref01_data)).data()
    assert(null != merchant_portal_pam_document_controller_ref01_data)


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname,
      '../../../../.sdk/test/entity/merchant_portal_pam_document_controller/MerchantPortalPamDocumentControllerTestData.json')

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
    ['merchant_portal_pam_document_controller01','merchant_portal_pam_document_controller02','merchant_portal_pam_document_controller03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_DOCUMENT_CONTROLLER_ENTID': idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_DOCUMENT_CONTROLLER_ENTID']

  const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_DOCUMENT_CONTROLLER_ENTID']
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
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when
      // the last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey and
      // server values above and handed the SDK undefined.
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
  
