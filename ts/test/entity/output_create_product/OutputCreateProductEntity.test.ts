

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

    const live = 'TRUE' === process.env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE
    for (const op of ['create']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'output_create_product.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"acquirerId":{"a":true,"h":"Acquirer Id","n":"acquirerId","r":false,"sh":"Unique identifier for the acquirer.","t":"`$STRING`","key$":"acquirerId","index$":0},"allowMultipleOrders":{"a":true,"h":"Allow Multiple Orders","n":"allowMultipleOrders","r":true,"sh":"Indication whether multiple orders are allowed or not.","t":"`$BOOLEAN`","key$":"allowMultipleOrders","index$":1},"appFormTemplateName":{"a":true,"h":"App Form Template Name","n":"appFormTemplateName","r":true,"sh":"Name of the application form template.","t":"`$STRING`","key$":"appFormTemplateName","index$":2},"contractNeeded":{"a":true,"h":"Contract Needed","n":"contractNeeded","r":true,"sh":"Indication whether contract is needed or not.","t":"`$BOOLEAN`","key$":"contractNeeded","index$":3},"credentialsNeeded":{"a":true,"h":"Credentials Needed","n":"credentialsNeeded","r":false,"sh":"Indication whether credentials are needed or not.","t":"`$BOOLEAN`","key$":"credentialsNeeded","index$":4},"descriptionKey":{"a":true,"h":"Description Key","n":"descriptionKey","r":true,"sh":"Key indicator for product description.","t":"`$STRING`","key$":"descriptionKey","index$":5},"nameKey":{"a":true,"h":"Name Key","n":"nameKey","r":true,"sh":"Key indicator for product name.","t":"`$STRING`","key$":"nameKey","index$":6},"prescreeningAllowed":{"a":true,"h":"Prescreening Allowed","n":"prescreeningAllowed","r":true,"sh":"Indication whether prescreening is allowed or not.","t":"`$BOOLEAN`","key$":"prescreeningAllowed","index$":7},"productName":{"a":true,"h":"Product Name","n":"productName","r":true,"sh":"Name of the product.","t":"`$STRING`","key$":"productName","index$":8},"responseCode":{"a":true,"fo":"int32","h":"Response Code","n":"responseCode","r":true,"sh":"Response code.","t":"`$INTEGER`","key$":"responseCode","index$":9},"responseMessage":{"a":true,"h":"Response Message","n":"responseMessage","r":true,"sh":"Response message.","t":"`$STRING`","key$":"responseMessage","index$":10},"terminalTemplateName":{"a":true,"h":"Terminal Template Name","n":"terminalTemplateName","r":true,"sh":"Name of the terminal template.","t":"`$STRING`","key$":"terminalTemplateName","index$":11},"vendorName":{"a":true,"h":"Vendor Name","n":"vendorName","r":true,"sh":"Name of the vendor.","t":"`$STRING`","key$":"vendorName","index$":12},"xmlTemplateFile":{"a":true,"h":"Xml Template File","n":"xmlTemplateFile","r":true,"sh":"A string value containing the XML template file encoded in Base64.","t":"`$STRING`","key$":"xmlTemplateFile","index$":13}},"name":"output_create_product","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /merchantportalws/createNewProduct","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/createNewProduct","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"createNewProduct"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"output_create_product","name__orig":"output_create_product","Name":"OutputCreateProduct","name_":"output_create_product","name-":"output-create-product","NAME":"OUTPUT_CREATE_PRODUCT","index$":10}, {"active":true,"entity":"output_create_product","key$":"BasicOutputCreateProductFlow","kind":"basic","name":"BasicOutputCreateProductFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"output_create_product_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0}]}, 'OutputCreateProduct', {"POST /merchantportalws/createNewProduct":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["allowMultipleOrders","appFormTemplateName","contractNeeded","descriptionKey","nameKey","prescreeningAllowed","productName","terminalTemplateName","vendorName","xmlTemplateFile"],"properties":{"acquirerId":{"type":"string","example":123456789,"description":"Unique identifier for the acquirer. Only numeric values are allowed.","key$":"acquirerId"},"allowMultipleOrders":{"type":"boolean","example":false,"description":"Indication whether multiple orders are allowed or not.","key$":"allowMultipleOrders"},"appFormTemplateName":{"type":"string","example":"AppForm_123","description":"Name of the application form template.","key$":"appFormTemplateName"},"contractNeeded":{"type":"boolean","example":true,"description":"Indication whether contract is needed or not.","key$":"contractNeeded"},"credentialsNeeded":{"type":"boolean","example":true,"description":"Indication whether credentials are needed or not.","key$":"credentialsNeeded"},"descriptionKey":{"type":"string","example":"Desc_123","description":"Key indicator for product description.","key$":"descriptionKey"},"nameKey":{"type":"string","example":"Key_123","description":"Key indicator for product name.","key$":"nameKey"},"prescreeningAllowed":{"type":"boolean","example":true,"description":"Indication whether prescreening is allowed or not.","key$":"prescreeningAllowed"},"productName":{"type":"string","example":"Product_123","description":"Name of the product.","key$":"productName"},"terminalTemplateName":{"type":"string","example":"TerminalTemplate_123","description":"Name of the terminal template.","key$":"terminalTemplateName"},"vendorName":{"type":"string","example":"Vendor_123","description":"Name of the vendor.","key$":"vendorName"},"xmlTemplateFile":{"type":"string","example":"PFRlcm1pbmFsVGVtcGxhdGU+PGRlc2NyaXB0aW9uPjxEZXNjcmlwdGlvblRleHQ+VGVybWluYWwgcmVnaXN0cmF0aW9uIHRlbXBsYXRlIFRlc3Q8L0Rlc2NyaXB0aW9uVGV4dD48L2Rlc2NyaXB0aW9uPjwvVGVybWluYWxUZW1wbGF0ZT4=","description":"A string value containing the XML template file encoded in Base64.","key$":"xmlTemplateFile"}},"title":"InputCreateProduct","x-ref":"#/components/schemas/InputCreateProduct","index$":1}}},"description":"inputCreateProduct","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]}})
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



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

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
  
