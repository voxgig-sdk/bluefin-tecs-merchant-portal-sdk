

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

    const live = 'TRUE' === process.env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE
    for (const op of ['create']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'merchant_portal_pam_document_controller.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"appFormFieldDescUUID","req":true,"type":"`$STRING`","index$":0},{"active":true,"name":"packageOrderUUID","req":false,"short":"UUID of the package order.","type":"`$STRING`","index$":1},{"active":true,"name":"productOrderUUID","req":false,"short":"UUID of the product order.","type":"`$STRING`","index$":2}],"name":"merchant_portal_pam_document_controller","op":{"create":{"input":"data","name":"create","points":[{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":true,"type":"`$STRING`"}]},"contract":{"id":"POST /merchantportalws/documentsList","json":"{\"operationId\":\"documentsListUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"packageOrderUUID\":{\"description\":\"UUID of the package order. NOTE: Either package order UUID or product order UUID has to be present. If none is present error is returned. If both are present error is returned.\",\"type\":\"string\"},\"productOrderUUID\":{\"description\":\"UUID of the product order. NOTE: Either package order UUID or product order UUID has to be present. If none is present error is returned. If both are present error is returned.\",\"type\":\"string\"}},\"title\":\"InputDocumentsList\",\"type\":\"object\"}}},\"description\":\"inputDocumentsList\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"documents\":{\"items\":{\"properties\":{\"content\":{\"description\":\"Data URL value as used for providing inline content in HTML / CSS. Pattern: data:[MEDIA_TYPE];[ENCODING],[DATA]. For example: data:application/pdf;base64,UERGIGRhdGEuLi4=. Currently supported media types are: application/pdf, image/jpeg. If it is not possible to identify one of mentioned types then common media type: application/octet-stream is returned. Currently we support only Base64 encoding.\",\"type\":\"string\"},\"name\":{\"type\":\"string\"}},\"title\":\"OutputDocumentsList_Document\",\"type\":\"object\"},\"type\":\"array\"},\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputDocumentsList\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/merchantportalws/documentsList","segments":[{"lit":"merchantportalws"},{"lit":"documentsList"}],"select":{"exist":["authorization"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0},{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":true,"type":"`$STRING`"}]},"contract":{"id":"POST /merchantportalws/downloadDocument","json":"{\"operationId\":\"downloadDocumentUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"appFormFieldDescUUID\":{\"type\":\"string\"},\"packageOrderUUID\":{\"description\":\"UUID of the package order. NOTE: Either package order UUID or product order UUID has to be present. If none is present error is returned. If both are present error is returned.\",\"type\":\"string\"},\"productOrderUUID\":{\"description\":\"UUID of the product order. NOTE: Either package order UUID or product order UUID has to be present. If none is present error is returned. If both are present error is returned.\",\"type\":\"string\"}},\"required\":[\"appFormFieldDescUUID\"],\"title\":\"InputDownloadDocument\",\"type\":\"object\"}}},\"description\":\"inputDownloadDocument\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"content\":{\"description\":\"Data URL value as used for providing inline content in HTML / CSS. Pattern: data:[MEDIA_TYPE];[ENCODING],[DATA]. For example: data:application/pdf;base64,UERGIGRhdGEuLi4=. Currently supported media types are: application/pdf, image/jpeg. If it is not possible to identify one of mentioned types then common media type: application/octet-stream is returned. Currently we support only Base64 encoding.\",\"type\":\"string\"},\"name\":{\"type\":\"string\"},\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputDownloadDocument\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/merchantportalws/downloadDocument","segments":[{"lit":"merchantportalws"},{"lit":"downloadDocument"}],"select":{"exist":["authorization"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":1}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"merchant_portal_pam_document_controller","name__orig":"merchant_portal_pam_document_controller","Name":"MerchantPortalPamDocumentController","name_":"merchant_portal_pam_document_controller","name-":"merchant-portal-pam-document-controller","NAME":"MERCHANT_PORTAL_PAM_DOCUMENT_CONTROLLER","index$":3}, {"active":true,"entity":"merchant_portal_pam_document_controller","key$":"BasicMerchantPortalPamDocumentControllerFlow","kind":"basic","name":"BasicMerchantPortalPamDocumentControllerFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"merchant_portal_pam_document_controller_ref01"},"match":{},"op":"create","spec":[],"valid":[],"index$":0}]}, 'MerchantPortalPamDocumentController')
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



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

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
  
