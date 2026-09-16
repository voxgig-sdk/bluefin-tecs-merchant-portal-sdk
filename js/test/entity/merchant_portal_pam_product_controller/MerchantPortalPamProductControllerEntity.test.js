
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

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"consumerUUID","req":false,"type":"`$STRING`","index$":0},{"active":true,"name":"filter","req":false,"type":"`$OBJECT`","index$":1},{"active":true,"name":"language","req":false,"type":"`$STRING`","index$":2},{"active":true,"name":"merchantID","req":false,"type":"`$STRING`","index$":3},{"active":true,"name":"packageOrderUUID","req":true,"type":"`$STRING`","index$":4},{"active":true,"name":"pagination","req":false,"type":"`$OBJECT`","index$":5},{"active":true,"name":"productOrderUUID","req":true,"type":"`$STRING`","index$":6},{"active":true,"name":"productUUID","req":true,"type":"`$STRING`","index$":7},{"active":true,"name":"reason_decline","req":true,"short":"Reason for product decline.","type":"`$STRING`","index$":8},{"active":true,"name":"sorting","req":false,"type":"`$OBJECT`","index$":9}],"name":"merchant_portal_pam_product_controller","op":{"create":{"input":"data","name":"create","points":[{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":true,"type":"`$STRING`"}]},"contract":{"id":"POST /merchantportalws/approveProduct","json":"{\"operationId\":\"approveProductUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"merchantID\":{\"type\":\"string\"},\"productOrderUUID\":{\"type\":\"string\"}},\"required\":[\"productOrderUUID\"],\"title\":\"InputApproveProduct\",\"type\":\"object\"}}},\"description\":\"inputApproveProduct\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputApproveProduct\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/merchantportalws/approveProduct","segments":[{"lit":"merchantportalws"},{"lit":"approveProduct"}],"select":{"exist":["authorization"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0},{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":true,"type":"`$STRING`"}]},"contract":{"id":"POST /merchantportalws/declineProduct","json":"{\"operationId\":\"declineProductUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"productOrderUUID\":{\"type\":\"string\"},\"reason_decline\":{\"description\":\"Reason for product decline.\",\"example\":\"Switch to new product\",\"type\":\"string\"}},\"required\":[\"productOrderUUID\",\"reason_decline\"],\"title\":\"InputDeclineProduct\",\"type\":\"object\"}}},\"description\":\"inputDeclineProduct\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputDeclineProduct\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/merchantportalws/declineProduct","segments":[{"lit":"merchantportalws"},{"lit":"declineProduct"}],"select":{"exist":["authorization"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":1},{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":true,"type":"`$STRING`"}]},"contract":{"id":"POST /merchantportalws/orderAdditionalProduct","json":"{\"operationId\":\"orderAdditionalProductUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"consumerUUID\":{\"type\":\"string\"},\"language\":{\"type\":\"string\"},\"packageOrderUUID\":{\"type\":\"string\"},\"productUUID\":{\"type\":\"string\"}},\"required\":[\"packageOrderUUID\",\"productUUID\"],\"title\":\"InputOrderAdditionalProduct\",\"type\":\"object\"}}},\"description\":\"inputOrderAdditionalProduct\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"productOrderUUID\":{\"type\":\"string\"},\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputOrderAdditionalProduct\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/merchantportalws/orderAdditionalProduct","segments":[{"lit":"merchantportalws"},{"lit":"orderAdditionalProduct"}],"select":{"exist":["authorization"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":2},{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":true,"type":"`$STRING`"}]},"contract":{"id":"POST /merchantportalws/productsList","json":"{\"operationId\":\"productsListUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"filter\":{\"properties\":{\"productUUID\":{\"description\":\"UUID of the product.\",\"example\":\"d0a0b0c0-d0a0-b0c0-d0a0-b0c0d0a0b0c0\",\"type\":\"string\"}},\"title\":\"InputProductsList_Filter\",\"type\":\"object\"},\"pagination\":{\"properties\":{\"page\":{\"description\":\"Number of the page to display.\",\"example\":1,\"format\":\"int32\",\"type\":\"integer\"},\"size\":{\"description\":\"Number of elements per page to display.\",\"example\":10,\"format\":\"int32\",\"type\":\"integer\"}},\"title\":\"Pagination\",\"type\":\"object\"},\"sorting\":{\"properties\":{\"name\":{\"description\":\"Sort attribute name.\",\"example\":\"requestorID\",\"type\":\"string\"},\"type\":{\"description\":\"Sort type ASC / DESC.\",\"example\":\"ASC\",\"type\":\"string\"}},\"title\":\"Sorting\",\"type\":\"object\"}},\"title\":\"InputProductsList\",\"type\":\"object\"}}},\"description\":\"inputProductsList\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"pagination\":{\"properties\":{\"page\":{\"description\":\"Number of the page to display.\",\"example\":1,\"format\":\"int32\",\"type\":\"integer\"},\"size\":{\"description\":\"Number of elements per page to display.\",\"example\":10,\"format\":\"int32\",\"type\":\"integer\"},\"totalElements\":{\"description\":\"Number of total elements available.\",\"example\":1587,\"format\":\"int64\",\"type\":\"integer\"},\"totalPages\":{\"description\":\"Number of total pages available.\",\"example\":10,\"format\":\"int32\",\"type\":\"integer\"}},\"required\":[\"totalElements\",\"totalPages\"],\"title\":\"OutputPagination\",\"type\":\"object\"},\"products\":{\"items\":{\"properties\":{\"productDescriptionKey\":{\"description\":\"Key of the product description.\",\"example\":\"MPI software component of the 3D Secure version 1.0.2\",\"type\":\"string\"},\"productName\":{\"description\":\"Name of the product.\",\"example\":\"3D Secure version 1.0.2\",\"type\":\"string\"},\"productUUID\":{\"description\":\"UUID of the product.\",\"example\":\"d0a0b0c0-d0a0-b0c0-d0a0-b0c0d0a0b0c0\",\"type\":\"string\"},\"terminalTemplateDescription\":{\"description\":\"Description of the terminal template.\",\"example\":\"Template for the terminal configuration N9100\",\"type\":\"string\"},\"vendorName\":{\"description\":\"Name of the vendor.\",\"example\":\"TECS telecommunication & e-commerce solutions GmbH\",\"type\":\"string\"}},\"title\":\"OutputProductsList_Product\",\"type\":\"object\"},\"type\":\"array\"},\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"pagination\",\"responseCode\",\"responseMessage\"],\"title\":\"OutputProductsList\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/merchantportalws/productsList","segments":[{"lit":"merchantportalws"},{"lit":"productsList"}],"select":{"exist":["authorization"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":3}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"merchant_portal_pam_product_controller","name__orig":"merchant_portal_pam_product_controller","Name":"MerchantPortalPamProductController","name_":"merchant_portal_pam_product_controller","name-":"merchant-portal-pam-product-controller","NAME":"MERCHANT_PORTAL_PAM_PRODUCT_CONTROLLER","index$":8}, {"active":true,"entity":"merchant_portal_pam_product_controller","key$":"BasicMerchantPortalPamProductControllerFlow","kind":"basic","name":"BasicMerchantPortalPamProductControllerFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"merchant_portal_pam_product_controller_ref01"},"match":{},"op":"create","spec":[],"valid":[],"index$":0}]}, 'MerchantPortalPamProductController')
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



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

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
  
