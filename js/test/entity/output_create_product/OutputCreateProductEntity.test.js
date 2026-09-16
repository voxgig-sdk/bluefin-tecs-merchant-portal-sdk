
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


describe('OutputCreateProductEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinTecsMerchantPortalSDK.test()
    const ent = testsdk.OutputCreateProduct()
    assert(null != ent)
  })


  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"acquirerId","req":false,"short":"Unique identifier for the acquirer.","type":"`$STRING`","index$":0},{"active":true,"name":"allowMultipleOrders","req":true,"short":"Indication whether multiple orders are allowed or not.","type":"`$BOOLEAN`","index$":1},{"active":true,"name":"appFormTemplateName","req":true,"short":"Name of the application form template.","type":"`$STRING`","index$":2},{"active":true,"name":"contractNeeded","req":true,"short":"Indication whether contract is needed or not.","type":"`$BOOLEAN`","index$":3},{"active":true,"name":"credentialsNeeded","req":false,"short":"Indication whether credentials are needed or not.","type":"`$BOOLEAN`","index$":4},{"active":true,"name":"descriptionKey","req":true,"short":"Key indicator for product description.","type":"`$STRING`","index$":5},{"active":true,"name":"nameKey","req":true,"short":"Key indicator for product name.","type":"`$STRING`","index$":6},{"active":true,"name":"prescreeningAllowed","req":true,"short":"Indication whether prescreening is allowed or not.","type":"`$BOOLEAN`","index$":7},{"active":true,"name":"productName","req":true,"short":"Name of the product.","type":"`$STRING`","index$":8},{"active":true,"format":"int32","name":"responseCode","req":true,"short":"Response code.","type":"`$INTEGER`","index$":9},{"active":true,"name":"responseMessage","req":true,"short":"Response message.","type":"`$STRING`","index$":10},{"active":true,"name":"terminalTemplateName","req":true,"short":"Name of the terminal template.","type":"`$STRING`","index$":11},{"active":true,"name":"vendorName","req":true,"short":"Name of the vendor.","type":"`$STRING`","index$":12},{"active":true,"name":"xmlTemplateFile","req":true,"short":"A string value containing the XML template file encoded in Base64.","type":"`$STRING`","index$":13}],"name":"output_create_product","op":{"create":{"input":"data","name":"create","points":[{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":true,"type":"`$STRING`"}]},"contract":{"id":"POST /merchantportalws/createNewProduct","json":"{\"operationId\":\"createNewProductUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"acquirerId\":{\"description\":\"Unique identifier for the acquirer. Only numeric values are allowed.\",\"example\":123456789,\"type\":\"string\"},\"allowMultipleOrders\":{\"description\":\"Indication whether multiple orders are allowed or not.\",\"example\":false,\"type\":\"boolean\"},\"appFormTemplateName\":{\"description\":\"Name of the application form template.\",\"example\":\"AppForm_123\",\"type\":\"string\"},\"contractNeeded\":{\"description\":\"Indication whether contract is needed or not.\",\"example\":true,\"type\":\"boolean\"},\"credentialsNeeded\":{\"description\":\"Indication whether credentials are needed or not.\",\"example\":true,\"type\":\"boolean\"},\"descriptionKey\":{\"description\":\"Key indicator for product description.\",\"example\":\"Desc_123\",\"type\":\"string\"},\"nameKey\":{\"description\":\"Key indicator for product name.\",\"example\":\"Key_123\",\"type\":\"string\"},\"prescreeningAllowed\":{\"description\":\"Indication whether prescreening is allowed or not.\",\"example\":true,\"type\":\"boolean\"},\"productName\":{\"description\":\"Name of the product.\",\"example\":\"Product_123\",\"type\":\"string\"},\"terminalTemplateName\":{\"description\":\"Name of the terminal template.\",\"example\":\"TerminalTemplate_123\",\"type\":\"string\"},\"vendorName\":{\"description\":\"Name of the vendor.\",\"example\":\"Vendor_123\",\"type\":\"string\"},\"xmlTemplateFile\":{\"description\":\"A string value containing the XML template file encoded in Base64.\",\"example\":\"PFRlcm1pbmFsVGVtcGxhdGU+PGRlc2NyaXB0aW9uPjxEZXNjcmlwdGlvblRleHQ+VGVybWluYWwgcmVnaXN0cmF0aW9uIHRlbXBsYXRlIFRlc3Q8L0Rlc2NyaXB0aW9uVGV4dD48L2Rlc2NyaXB0aW9uPjwvVGVybWluYWxUZW1wbGF0ZT4=\",\"type\":\"string\"}},\"required\":[\"allowMultipleOrders\",\"appFormTemplateName\",\"contractNeeded\",\"descriptionKey\",\"nameKey\",\"prescreeningAllowed\",\"productName\",\"terminalTemplateName\",\"vendorName\",\"xmlTemplateFile\"],\"title\":\"InputCreateProduct\",\"type\":\"object\"}}},\"description\":\"inputCreateProduct\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputCreateProduct\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/merchantportalws/createNewProduct","segments":[{"lit":"merchantportalws"},{"lit":"createNewProduct"}],"select":{"exist":["authorization"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"output_create_product","name__orig":"output_create_product","Name":"OutputCreateProduct","name_":"output_create_product","name-":"output-create-product","NAME":"OUTPUT_CREATE_PRODUCT","index$":10}, {"active":true,"entity":"output_create_product","key$":"BasicOutputCreateProductFlow","kind":"basic","name":"BasicOutputCreateProductFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"output_create_product_ref01"},"match":{},"op":"create","spec":[],"valid":[],"index$":0}]}, 'OutputCreateProduct')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const output_create_product_ref01_ent = client.OutputCreateProduct()
    let output_create_product_ref01_data = setup.data.new.output_create_product['output_create_product_ref01']

    output_create_product_ref01_data = (await output_create_product_ref01_ent.create(output_create_product_ref01_data)).data()
    assert(null != output_create_product_ref01_data)


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname,
      '../../../../.sdk/test/entity/output_create_product/OutputCreateProductTestData.json')

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
    ['output_create_product01','output_create_product02','output_create_product03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_CREATE_PRODUCT_ENTID': idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_CREATE_PRODUCT_ENTID']

  const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_CREATE_PRODUCT_ENTID']
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
  
