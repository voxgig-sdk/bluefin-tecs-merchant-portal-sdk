
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


describe('OutputMoveTidEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinTecsMerchantPortalSDK.test()
    const ent = testsdk.OutputMoveTid()
    assert(null != ent)
  })


  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"productOrderUUIDs":{"a":true,"h":"Product Order Uui Ds","n":"productOrderUUIDs","r":true,"t":"`$ARRAY`","key$":"productOrderUUIDs","index$":0},"responseCode":{"a":true,"fo":"int32","h":"Response Code","n":"responseCode","r":true,"sh":"Response code.","t":"`$INTEGER`","key$":"responseCode","index$":1},"responseMessage":{"a":true,"h":"Response Message","n":"responseMessage","r":true,"sh":"Response message.","t":"`$STRING`","key$":"responseMessage","index$":2},"targetPackageOrderUUID":{"a":true,"h":"Target Package Order Uuid","n":"targetPackageOrderUUID","r":true,"t":"`$STRING`","key$":"targetPackageOrderUUID","index$":3},"targetProductOrderUUID":{"a":true,"h":"Target Product Order Uuid","n":"targetProductOrderUUID","r":true,"t":"`$STRING`","key$":"targetProductOrderUUID","index$":4}},"name":"output_move_tid","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /merchantportalws/moveTid","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/moveTid","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"moveTid"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"output_move_tid","name__orig":"output_move_tid","Name":"OutputMoveTid","name_":"output_move_tid","name-":"output-move-tid","NAME":"OUTPUT_MOVE_TID","index$":14}, {"active":true,"entity":"output_move_tid","key$":"BasicOutputMoveTidFlow","kind":"basic","name":"BasicOutputMoveTidFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"output_move_tid_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0}]}, 'OutputMoveTid', {"POST /merchantportalws/moveTid":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["productOrderUUIDs","targetPackageOrderUUID","targetProductOrderUUID"],"properties":{"productOrderUUIDs":{"type":"array","uniqueItems":true,"items":{"type":"string"},"key$":"productOrderUUIDs"},"targetPackageOrderUUID":{"type":"string","key$":"targetPackageOrderUUID"},"targetProductOrderUUID":{"type":"string","key$":"targetProductOrderUUID"}},"title":"InputMoveTid","x-ref":"#/components/schemas/InputMoveTid","index$":1}}},"description":"inputMoveTid","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const output_move_tid_ref01_ent = client.OutputMoveTid()
    let output_move_tid_ref01_data = setup.data.new.output_move_tid['output_move_tid_ref01']

    output_move_tid_ref01_data = (await output_move_tid_ref01_ent.create(output_move_tid_ref01_data)).data()
    assert(null != output_move_tid_ref01_data)


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname,
      '../../../../.sdk/test/entity/output_move_tid/OutputMoveTidTestData.json')

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
    ['output_move_tid01','output_move_tid02','output_move_tid03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_MOVE_TID_ENTID': idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_MOVE_TID_ENTID']

  const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_MOVE_TID_ENTID']
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
  
