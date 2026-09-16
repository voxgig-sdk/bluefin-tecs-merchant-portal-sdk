
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


describe('MerchantPortalPamContractControllerEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinTecsMerchantPortalSDK.test()
    const ent = testsdk.MerchantPortalPamContractController()
    assert(null != ent)
  })


  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"language","req":true,"type":"`$STRING`","index$":0},{"active":true,"name":"productOrderUUID","req":true,"type":"`$STRING`","index$":1}],"name":"merchant_portal_pam_contract_controller","op":{"create":{"input":"data","name":"create","points":[{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":true,"type":"`$STRING`"}]},"contract":{"id":"POST /merchantportalws/generateContract","json":"{\"operationId\":\"generateContractUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"language\":{\"type\":\"string\"},\"productOrderUUID\":{\"type\":\"string\"}},\"required\":[\"language\",\"productOrderUUID\"],\"title\":\"InputGenerateContract\",\"type\":\"object\"}}},\"description\":\"inputGenerateContract\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"description\":{\"type\":\"string\"},\"file\":{\"format\":\"binary\",\"type\":\"string\"},\"filename\":{\"type\":\"string\"},\"inputStream\":{\"title\":\"InputStream\",\"type\":\"object\"},\"open\":{\"type\":\"boolean\"},\"readable\":{\"type\":\"boolean\"},\"uri\":{\"format\":\"uri\",\"type\":\"string\"},\"url\":{\"format\":\"url\",\"type\":\"string\"}},\"title\":\"Resource\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/merchantportalws/generateContract","segments":[{"lit":"merchantportalws"},{"lit":"generateContract"}],"select":{"exist":["authorization"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0},{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":true,"type":"`$STRING`"}]},"contract":{"id":"POST /merchantportalws/uploadContract","json":"{\"operationId\":\"uploadContractUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"multipart/form-data\":{\"schema\":{\"properties\":{\"inputMessage\":{\"type\":\"string\"},\"pdfFile\":{\"description\":\"Binary multipart file in PDF format\",\"format\":\"binary\",\"type\":\"string\"}},\"required\":[\"pdfFile\"],\"type\":\"object\"}}}},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputUploadContract\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/merchantportalws/uploadContract","segments":[{"lit":"merchantportalws"},{"lit":"uploadContract"}],"select":{"exist":["authorization"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":1}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"merchant_portal_pam_contract_controller","name__orig":"merchant_portal_pam_contract_controller","Name":"MerchantPortalPamContractController","name_":"merchant_portal_pam_contract_controller","name-":"merchant-portal-pam-contract-controller","NAME":"MERCHANT_PORTAL_PAM_CONTRACT_CONTROLLER","index$":2}, {"active":true,"entity":"merchant_portal_pam_contract_controller","key$":"BasicMerchantPortalPamContractControllerFlow","kind":"basic","name":"BasicMerchantPortalPamContractControllerFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"merchant_portal_pam_contract_controller_ref01"},"match":{},"op":"create","spec":[],"valid":[],"index$":0}]}, 'MerchantPortalPamContractController')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const merchant_portal_pam_contract_controller_ref01_ent = client.MerchantPortalPamContractController()
    let merchant_portal_pam_contract_controller_ref01_data = setup.data.new.merchant_portal_pam_contract_controller['merchant_portal_pam_contract_controller_ref01']

    merchant_portal_pam_contract_controller_ref01_data = (await merchant_portal_pam_contract_controller_ref01_ent.create(merchant_portal_pam_contract_controller_ref01_data)).data()
    assert(null != merchant_portal_pam_contract_controller_ref01_data)


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname,
      '../../../../.sdk/test/entity/merchant_portal_pam_contract_controller/MerchantPortalPamContractControllerTestData.json')

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
    ['merchant_portal_pam_contract_controller01','merchant_portal_pam_contract_controller02','merchant_portal_pam_contract_controller03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_CONTRACT_CONTROLLER_ENTID': idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_CONTRACT_CONTROLLER_ENTID']

  const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_CONTRACT_CONTROLLER_ENTID']
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
  
