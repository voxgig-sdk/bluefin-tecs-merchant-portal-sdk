
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


describe('MerchantPortalPamMandatorControllerEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinTecsMerchantPortalSDK.test()
    const ent = testsdk.MerchantPortalPamMandatorController()
    assert(null != ent)
  })


  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"clientSecret":{"a":true,"h":"Client Secret","n":"clientSecret","r":false,"t":"`$STRING`","key$":"clientSecret","index$":0},"mandatorName":{"a":true,"h":"Mandator Name","n":"mandatorName","r":true,"t":"`$STRING`","key$":"mandatorName","index$":1},"notificationEmail":{"a":true,"h":"Notification Email","n":"notificationEmail","r":false,"t":"`$STRING`","key$":"notificationEmail","index$":2},"packageUUID":{"a":true,"h":"Package Uuid","n":"packageUUID","r":true,"t":"`$STRING`","key$":"packageUUID","index$":3}},"name":"merchant_portal_pam_mandator_controller","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /merchantportalws/createMandatorConfig","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/createMandatorConfig","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"createMandatorConfig"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0},{"a":true,"co":{"id":"POST /merchantportalws/introduceMandatorPackage","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/introduceMandatorPackage","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"introduceMandatorPackage"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":1},{"a":true,"co":{"id":"POST /merchantportalws/selfRegistrationLink","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/selfRegistrationLink","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"selfRegistrationLink"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":2}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"merchant_portal_pam_mandator_controller","name__orig":"merchant_portal_pam_mandator_controller","Name":"MerchantPortalPamMandatorController","name_":"merchant_portal_pam_mandator_controller","name-":"merchant-portal-pam-mandator-controller","NAME":"MERCHANT_PORTAL_PAM_MANDATOR_CONTROLLER","index$":5}, {"active":true,"entity":"merchant_portal_pam_mandator_controller","key$":"BasicMerchantPortalPamMandatorControllerFlow","kind":"basic","name":"BasicMerchantPortalPamMandatorControllerFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"merchant_portal_pam_mandator_controller_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0}]}, 'MerchantPortalPamMandatorController', {"POST /merchantportalws/createMandatorConfig":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["mandatorName"],"properties":{"clientSecret":{"type":"string","key$":"clientSecret"},"mandatorName":{"type":"string","key$":"mandatorName"},"notificationEmail":{"type":"string","key$":"notificationEmail"}},"title":"InputCreateMandatorConfig","x-ref":"#/components/schemas/InputCreateMandatorConfig","index$":1}}},"description":"inputCreateMandatorConfig","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]},"POST /merchantportalws/introduceMandatorPackage":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["packageUUID"],"properties":{"packageUUID":{"type":"string","key$":"packageUUID"}},"title":"InputIntroduceMandatorPackage","x-ref":"#/components/schemas/InputIntroduceMandatorPackage","index$":1}}},"description":"inputIntroduceMandatorPackage","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]},"POST /merchantportalws/selfRegistrationLink":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["packageUUID"],"properties":{"packageUUID":{"type":"string","key$":"packageUUID"}},"title":"InputSelfRegistrationLink","x-ref":"#/components/schemas/InputSelfRegistrationLink","index$":1}}},"description":"inputSelfRegistrationLink","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const merchant_portal_pam_mandator_controller_ref01_ent = client.MerchantPortalPamMandatorController()
    let merchant_portal_pam_mandator_controller_ref01_data = setup.data.new.merchant_portal_pam_mandator_controller['merchant_portal_pam_mandator_controller_ref01']

    merchant_portal_pam_mandator_controller_ref01_data = (await merchant_portal_pam_mandator_controller_ref01_ent.create(merchant_portal_pam_mandator_controller_ref01_data)).data()
    assert(null != merchant_portal_pam_mandator_controller_ref01_data)


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname,
      '../../../../.sdk/test/entity/merchant_portal_pam_mandator_controller/MerchantPortalPamMandatorControllerTestData.json')

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
    ['merchant_portal_pam_mandator_controller01','merchant_portal_pam_mandator_controller02','merchant_portal_pam_mandator_controller03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_MANDATOR_CONTROLLER_ENTID': idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_MANDATOR_CONTROLLER_ENTID']

  const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_MANDATOR_CONTROLLER_ENTID']
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
  
