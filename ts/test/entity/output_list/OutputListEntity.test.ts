

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


describe('OutputListEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinTecsMerchantPortalSDK.test()
    const ent = testsdk.OutputList()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE
    for (const op of ['create']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'output_list.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"items","req":false,"type":"`$ARRAY`","index$":0},{"active":true,"name":"pagination","op":{"create":{"req":false,"type":"`$OBJECT`"}},"req":true,"type":"`$OBJECT`","index$":1},{"active":true,"format":"int32","name":"responseCode","req":true,"short":"Response code.","type":"`$INTEGER`","index$":2},{"active":true,"name":"responseMessage","req":true,"short":"Response message.","type":"`$STRING`","index$":3},{"active":true,"name":"sorting","req":false,"type":"`$OBJECT`","index$":4}],"name":"output_list","op":{"create":{"input":"data","name":"create","points":[{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":true,"type":"`$STRING`"}]},"contract":{"id":"POST /merchantportalws/batch/registerAdditionalTerminal/list","json":"{\"operationId\":\"listUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"pagination\":{\"properties\":{\"page\":{\"description\":\"Number of the page to display.\",\"example\":1,\"format\":\"int32\",\"type\":\"integer\"},\"size\":{\"description\":\"Number of elements per page to display.\",\"example\":10,\"format\":\"int32\",\"type\":\"integer\"}},\"title\":\"Pagination\",\"type\":\"object\"},\"sorting\":{\"properties\":{\"name\":{\"description\":\"Sort attribute name.\",\"example\":\"requestorID\",\"type\":\"string\"},\"type\":{\"description\":\"Sort type ASC / DESC.\",\"example\":\"ASC\",\"type\":\"string\"}},\"title\":\"Sorting\",\"type\":\"object\"}},\"title\":\"InputList\",\"type\":\"object\"}}},\"description\":\"inputList\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"items\":{\"items\":{\"properties\":{\"id\":{\"type\":\"string\"},\"name\":{\"type\":\"string\"},\"owner\":{\"type\":\"string\"},\"status\":{\"enum\":[\"COMPLETED_SUCCESSFULLY\",\"COMPLETED_WITH_ERRORS\",\"RUNNING\",\"STOPPED\"],\"type\":\"string\"},\"timestamp\":{\"type\":\"string\"}},\"title\":\"Batch\",\"type\":\"object\"},\"type\":\"array\"},\"pagination\":{\"properties\":{\"page\":{\"description\":\"Number of the page to display.\",\"example\":1,\"format\":\"int32\",\"type\":\"integer\"},\"size\":{\"description\":\"Number of elements per page to display.\",\"example\":10,\"format\":\"int32\",\"type\":\"integer\"},\"totalElements\":{\"description\":\"Number of total elements available.\",\"example\":1587,\"format\":\"int64\",\"type\":\"integer\"},\"totalPages\":{\"description\":\"Number of total pages available.\",\"example\":10,\"format\":\"int32\",\"type\":\"integer\"}},\"required\":[\"totalElements\",\"totalPages\"],\"title\":\"OutputPagination\",\"type\":\"object\"},\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"pagination\",\"responseCode\",\"responseMessage\"],\"title\":\"OutputList\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/merchantportalws/batch/registerAdditionalTerminal/list","segments":[{"lit":"merchantportalws"},{"lit":"batch"},{"lit":"registerAdditionalTerminal"},{"lit":"list"}],"select":{"exist":["authorization"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"output_list","name__orig":"output_list","Name":"OutputList","name_":"output_list","name-":"output-list","NAME":"OUTPUT_LIST","index$":12}, {"active":true,"entity":"output_list","key$":"BasicOutputListFlow","kind":"basic","name":"BasicOutputListFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"output_list_ref01"},"match":{},"op":"create","spec":[],"valid":[],"index$":0}]}, 'OutputList')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const output_list_ref01_ent = client.OutputList()
    let output_list_ref01_data = setup.data.new.output_list['output_list_ref01']

    output_list_ref01_data = (await output_list_ref01_ent.create(output_list_ref01_data)).data()
    assert(null != output_list_ref01_data)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/output_list/OutputListTestData.json')

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
    ['output_list01','output_list02','output_list03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_LIST_ENTID': idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_LIST_ENTID']

  const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_LIST_ENTID']
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
  
