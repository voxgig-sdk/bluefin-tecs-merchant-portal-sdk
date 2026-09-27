

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
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"items":{"a":true,"h":"Items","n":"items","r":false,"t":"`$ARRAY`","key$":"items","index$":0},"pagination":{"a":true,"h":"Pagination","n":"pagination","op":{"create":{"req":false,"type":"`$OBJECT`"}},"r":true,"t":"`$OBJECT`","key$":"pagination","index$":1},"responseCode":{"a":true,"fo":"int32","h":"Response Code","n":"responseCode","r":true,"sh":"Response code.","t":"`$INTEGER`","key$":"responseCode","index$":2},"responseMessage":{"a":true,"h":"Response Message","n":"responseMessage","r":true,"sh":"Response message.","t":"`$STRING`","key$":"responseMessage","index$":3},"sorting":{"a":true,"h":"Sorting","n":"sorting","r":false,"t":"`$OBJECT`","key$":"sorting","index$":4}},"name":"output_list","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /merchantportalws/batch/registerAdditionalTerminal/list","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/batch/registerAdditionalTerminal/list","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"batch"},{"lit":"registerAdditionalTerminal"},{"lit":"list"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"output_list","name__orig":"output_list","Name":"OutputList","name_":"output_list","name-":"output-list","NAME":"OUTPUT_LIST","index$":12}, {"active":true,"entity":"output_list","key$":"BasicOutputListFlow","kind":"basic","name":"BasicOutputListFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"output_list_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0}]}, 'OutputList', {"POST /merchantportalws/batch/registerAdditionalTerminal/list":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","properties":{"pagination":{"type":"object","properties":{"page":{"type":"integer","format":"int32","example":1,"description":"Number of the page to display."},"size":{"type":"integer","format":"int32","example":10,"description":"Number of elements per page to display."}},"title":"Pagination","x-ref":"#/components/schemas/Pagination","key$":"pagination"},"sorting":{"type":"object","properties":{"name":{"type":"string","example":"requestorID","description":"Sort attribute name."},"type":{"type":"string","example":"ASC","description":"Sort type ASC / DESC."}},"title":"Sorting","x-ref":"#/components/schemas/Sorting","key$":"sorting"}},"title":"InputList","x-ref":"#/components/schemas/InputList","index$":1}}},"description":"inputList","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]}})
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
  
