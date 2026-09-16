

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


describe('MerchantPortalPamMerchantControllerEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinTecsMerchantPortalSDK.test()
    const ent = testsdk.MerchantPortalPamMerchantController()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE
    for (const op of ['create']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'merchant_portal_pam_merchant_controller.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"additional_data","req":false,"short":"Optional additional merchant-specific data related to enabling acquiring.","type":"`$OBJECT`","index$":0},{"active":true,"name":"businessRegistrationNumber","req":true,"type":"`$STRING`","index$":1},{"active":true,"name":"city","req":false,"short":"City where the merchant is located.","type":"`$STRING`","index$":2},{"active":true,"name":"companyName","req":true,"type":"`$STRING`","index$":3},{"active":true,"name":"corporateUUID","req":true,"short":"Unique identifier for the corporate entity.","type":"`$STRING`","index$":4},{"active":true,"name":"country","req":false,"short":"Country where the merchant is located.","type":"`$STRING`","index$":5},{"active":true,"name":"currency","req":true,"short":"Transaction currency in ISO 4217 format.","type":"`$STRING`","index$":6},{"active":true,"name":"email","req":true,"type":"`$STRING`","index$":7},{"active":true,"name":"language","req":true,"type":"`$STRING`","index$":8},{"active":true,"name":"login","req":true,"type":"`$STRING`","index$":9},{"active":true,"name":"mandator","req":true,"short":"Mandator name assigned by TECS.","type":"`$STRING`","index$":10},{"active":true,"name":"merchantContractNumber","op":{"create":{"req":false,"type":"`$STRING`"}},"req":true,"short":"Unique identifier for the merchant within a specific system.","type":"`$STRING`","index$":11},{"active":true,"name":"merchantName","req":false,"short":"Name of the merchant.","type":"`$STRING`","index$":12},{"active":true,"name":"merchant_category_code","req":false,"short":"Merchant Category Code (MCC) describing the merchant’s type of business.","type":"`$STRING`","index$":13},{"active":true,"name":"packageUUID","req":false,"short":"UUID of the package.","type":"`$STRING`","index$":14},{"active":true,"name":"packageorderuuid","req":true,"short":"Unique identifier for the registered merchant in the TECS system.","type":"`$STRING`","index$":15},{"active":true,"name":"phoneNumber","req":true,"type":"`$STRING`","index$":16},{"active":true,"name":"postalCode","req":false,"short":"Postal or ZIP code of the merchant’s location.","type":"`$STRING`","index$":17},{"active":true,"name":"productid_acquirer","req":true,"short":"Identifier of the product for which acquiring is to be enabled.","type":"`$STRING`","index$":18},{"active":true,"name":"region","req":false,"short":"State or province where the merchant is located.","type":"`$STRING`","index$":19},{"active":true,"name":"registrationNumber","req":false,"short":"Business registration number.","type":"`$STRING`","index$":20},{"active":true,"name":"signature","req":false,"short":"Signature value = saltAsHex-hashAsHex.","type":"`$STRING`","index$":21},{"active":true,"name":"street","req":false,"short":"Street address of the merchant.","type":"`$STRING`","index$":22},{"active":true,"name":"terminalIds","req":false,"short":"Optional list of terminal IDs for which acquiring should be activated.","type":"`$ARRAY`","index$":23},{"active":true,"name":"terminalid_acquirer","req":false,"short":"Optional terminal ID provided by the acquirer.","type":"`$STRING`","index$":24},{"active":true,"name":"vu_nummer","req":true,"short":"Merchant contract number with the acquirer.","type":"`$STRING`","index$":25}],"name":"merchant_portal_pam_merchant_controller","op":{"create":{"input":"data","name":"create","points":[{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":true,"type":"`$STRING`"}]},"contract":{"id":"POST /merchantportalws/contractNumber","json":"{\"operationId\":\"contractNumberUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"merchantContractNumber\":{\"type\":\"string\"}},\"required\":[\"merchantContractNumber\"],\"title\":\"InputContractNumber\",\"type\":\"object\"}}},\"description\":\"inputContractNumber\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputContractNumber\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/merchantportalws/contractNumber","segments":[{"lit":"merchantportalws"},{"lit":"contractNumber"}],"select":{"exist":["authorization"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0},{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":true,"type":"`$STRING`"}]},"contract":{"id":"POST /merchantportalws/registerAdditionalAcquiring","json":"{\"operationId\":\"registerAdditionalAcquiringUsingPOST\",\"parameters\":[{\"description\":\"Authorization header containing valid credentials. Example: \\\"Bearer AT-2359-DFYpOWfDFSls4DeKDmGOXDyynx0a8Trwk\\\"\\n\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"additional_data\":{\"additionalProperties\":{\"type\":\"string\"},\"description\":\"Optional additional merchant-specific data related to enabling acquiring.\\nThis may include custom key-value pairs that provide further context.\\n\",\"example\":{\"firstname\":\"John\",\"surname\":\"Doe\",\"type\":\"tx-300\",\"version\":\"v1.2.3\"},\"type\":\"object\"},\"currency\":{\"description\":\"Transaction currency in ISO 4217 format.\",\"example\":\"EUR\",\"maxLength\":3,\"minLength\":3,\"type\":\"string\"},\"packageorderuuid\":{\"description\":\"Unique identifier for the registered merchant in the TECS system. This value is provided by TECS during the initial merchant registration and must be used for subsequent terminal or acquirer registrations.\\n\",\"example\":\"16acb5a4-e573-423c-a024-fae90ea45d70\",\"type\":\"string\"},\"productid_acquirer\":{\"description\":\"Identifier of the product for which acquiring is to be enabled. If not provided, the default product as defined in the package may be used.\\n\",\"example\":\"874d84a8-a6f4-47fa-b594-944593fc394b\",\"type\":\"string\"},\"terminalIds\":{\"description\":\"Optional list of terminal IDs for which acquiring should be activated. If omitted, acquiring will be enabled for all terminals associated with the merchant.\\n\",\"example\":[77000001,77000002,77000003],\"items\":{\"format\":\"int32\",\"type\":\"integer\"},\"type\":\"array\"},\"terminalid_acquirer\":{\"description\":\"Optional terminal ID provided by the acquirer.\",\"example\":\"66000001\",\"type\":\"string\"},\"vu_nummer\":{\"description\":\"Merchant contract number with the acquirer.\",\"example\":\"VU-20230501-00123\",\"type\":\"string\"}},\"required\":[\"currency\",\"packageorderuuid\",\"productid_acquirer\",\"vu_nummer\"],\"title\":\"InputRegisterAdditionalAcquiring\",\"type\":\"object\"}}},\"description\":\"JSON payload containing details for registering additional acquiring. This includes the package order UUID, transaction currency, acquirer product identifier, merchant contract number, and optional terminal IDs.\\n\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputRegisterAdditionalAcquiring\",\"type\":\"object\"}}},\"description\":\"Successful registration of additional acquiring.\"},\"400\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"response_code\":{\"description\":\"Response code: 0 indicates success, any non-zero value indicates an error.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"response_message\":{\"description\":\"A human-readable error message.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"response_code\",\"response_message\"],\"type\":\"object\"}}},\"description\":\"Bad Request – Missing or invalid parameters.\"},\"401\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"response_code\":{\"description\":\"Response code: 0 indicates success, any non-zero value indicates an error.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"response_message\":{\"description\":\"A human-readable error message.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"response_code\",\"response_message\"],\"type\":\"object\"}}},\"description\":\"Unauthorized – Invalid authentication credentials provided.\"},\"403\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"response_code\":{\"description\":\"Response code: 0 indicates success, any non-zero value indicates an error.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"response_message\":{\"description\":\"A human-readable error message.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"response_code\",\"response_message\"],\"type\":\"object\"}}},\"description\":\"Forbidden – The caller does not have sufficient permissions.\"},\"500\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"response_code\":{\"description\":\"Response code: 0 indicates success, any non-zero value indicates an error.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"response_message\":{\"description\":\"A human-readable error message.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"response_code\",\"response_message\"],\"type\":\"object\"}}},\"description\":\"Internal Server Error – An unexpected error occurred on the server.\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/merchantportalws/registerAdditionalAcquiring","segments":[{"lit":"merchantportalws"},{"lit":"registerAdditionalAcquiring"}],"select":{"exist":["authorization"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":1},{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":true,"type":"`$STRING`"}]},"contract":{"id":"POST /merchantportalws/updateMerchant","json":"{\"operationId\":\"updateMerchantUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"city\":{\"description\":\"City where the merchant is located.\",\"example\":\"Vienna\",\"type\":\"string\"},\"corporateUUID\":{\"description\":\"Unique identifier for the corporate entity.\",\"example\":\"123e4567-e89b-12d3-a456-426614174000\",\"type\":\"string\"},\"country\":{\"description\":\"Country where the merchant is located.\",\"example\":\"Austria\",\"type\":\"string\"},\"merchantContractNumber\":{\"description\":\"Unique identifier for the merchant within a specific system.\",\"example\":987654321,\"type\":\"string\"},\"merchantName\":{\"description\":\"Name of the merchant.\",\"example\":\"Acme Corporation\",\"type\":\"string\"},\"merchant_category_code\":{\"description\":\"Merchant Category Code (MCC) describing the merchant’s type of business.\",\"example\":1234,\"type\":\"string\"},\"postalCode\":{\"description\":\"Postal or ZIP code of the merchant’s location.\",\"example\":1010,\"type\":\"string\"},\"region\":{\"description\":\"State or province where the merchant is located.\",\"example\":\"Vienna\",\"type\":\"string\"},\"registrationNumber\":{\"description\":\"Business registration number.\",\"example\":1234567890,\"type\":\"string\"},\"street\":{\"description\":\"Street address of the merchant.\",\"example\":\"Main Street 123\",\"type\":\"string\"}},\"required\":[\"corporateUUID\"],\"title\":\"InputUpdateMerchant\",\"type\":\"object\"}}},\"description\":\"inputUpdateMerchant\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputUpdateMerchant\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/merchantportalws/updateMerchant","segments":[{"lit":"merchantportalws"},{"lit":"updateMerchant"}],"select":{"exist":["authorization"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":2},{"active":true,"args":{},"contract":{"id":"POST /merchantportalws/registerMerchant","json":"{\"operationId\":\"registerMerchantUsingPOST\",\"parameters\":[],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"businessRegistrationNumber\":{\"type\":\"string\"},\"companyName\":{\"type\":\"string\"},\"email\":{\"type\":\"string\"},\"language\":{\"type\":\"string\"},\"login\":{\"type\":\"string\"},\"mandator\":{\"description\":\"Mandator name assigned by TECS.\",\"example\":\"MY_MANDATOR\",\"type\":\"string\"},\"packageUUID\":{\"description\":\"UUID of the package.\",\"example\":\"aabdf175-3035-435e-b982-4fd82ed9f763\",\"type\":\"string\"},\"phoneNumber\":{\"type\":\"string\"},\"signature\":{\"description\":\"Signature value = saltAsHex-hashAsHex. Salt as hex value = Hex.encodeHexString(saltAsByte). Hash as hex value = DigestUtils.sha256Hex(packageUUID + \\\"|\\\" + mandator + \\\"|\\\" + clientSecret + \\\"|\\\" + saltAsString).\",\"example\":\"If packageUUID is: aabdf175-3035-435e-b982-4fd82ed9f763, mandator is: MY_MANDATOR, client secret is: MY_CLIENT_SECRET, salt is: MY_SALT then signature will be 4d595f53414c54-1ec8296e5e95f99cf0495a3ad99546ad63f942e36c72de936396f881bd6ddddd\",\"type\":\"string\"}},\"required\":[\"businessRegistrationNumber\",\"companyName\",\"email\",\"language\",\"login\",\"mandator\",\"phoneNumber\"],\"title\":\"InputRegisterMerchant\",\"type\":\"object\"}}},\"description\":\"inputRegisterMerchant\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputRegisterMerchant\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/merchantportalws/registerMerchant","segments":[{"lit":"merchantportalws"},{"lit":"registerMerchant"}],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":3}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"merchant_portal_pam_merchant_controller","name__orig":"merchant_portal_pam_merchant_controller","Name":"MerchantPortalPamMerchantController","name_":"merchant_portal_pam_merchant_controller","name-":"merchant-portal-pam-merchant-controller","NAME":"MERCHANT_PORTAL_PAM_MERCHANT_CONTROLLER","index$":6}, {"active":true,"entity":"merchant_portal_pam_merchant_controller","key$":"BasicMerchantPortalPamMerchantControllerFlow","kind":"basic","name":"BasicMerchantPortalPamMerchantControllerFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"merchant_portal_pam_merchant_controller_ref01"},"match":{},"op":"create","spec":[],"valid":[],"index$":0}]}, 'MerchantPortalPamMerchantController')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const merchant_portal_pam_merchant_controller_ref01_ent = client.MerchantPortalPamMerchantController()
    let merchant_portal_pam_merchant_controller_ref01_data = setup.data.new.merchant_portal_pam_merchant_controller['merchant_portal_pam_merchant_controller_ref01']

    merchant_portal_pam_merchant_controller_ref01_data = (await merchant_portal_pam_merchant_controller_ref01_ent.create(merchant_portal_pam_merchant_controller_ref01_data)).data()
    assert(null != merchant_portal_pam_merchant_controller_ref01_data)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/merchant_portal_pam_merchant_controller/MerchantPortalPamMerchantControllerTestData.json')

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
    ['merchant_portal_pam_merchant_controller01','merchant_portal_pam_merchant_controller02','merchant_portal_pam_merchant_controller03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_MERCHANT_CONTROLLER_ENTID': idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_MERCHANT_CONTROLLER_ENTID']

  const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_MERCHANT_CONTROLLER_ENTID']
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
  
