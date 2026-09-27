

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


describe('MerchantPortalPamPackageControllerEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinTecsMerchantPortalSDK.test()
    const ent = testsdk.MerchantPortalPamPackageController()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE
    for (const op of ['create']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'merchant_portal_pam_package_controller.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"consumerUUID":{"a":true,"h":"Consumer Uuid","n":"consumerUUID","r":false,"t":"`$STRING`","key$":"consumerUUID","index$":0},"corporateUUID":{"a":true,"h":"Corporate Uuid","n":"corporateUUID","r":false,"t":"`$STRING`","key$":"corporateUUID","index$":1},"country":{"a":true,"h":"Country","n":"country","r":false,"sh":"Country associated with the package.","t":"`$STRING`","key$":"country","index$":2},"descriptionKey":{"a":true,"h":"Description Key","n":"descriptionKey","r":false,"sh":"Key for the description of the package.","t":"`$STRING`","key$":"descriptionKey","index$":3},"filter":{"a":true,"h":"Filter","n":"filter","r":false,"t":"`$OBJECT`","key$":"filter","index$":4},"language":{"a":true,"h":"Language","n":"language","op":{"create":{"req":false,"type":"`$STRING`"}},"r":true,"t":"`$STRING`","key$":"language","index$":5},"nameKey":{"a":true,"h":"Name Key","n":"nameKey","r":false,"sh":"Key for the name of the package.","t":"`$STRING`","key$":"nameKey","index$":6},"packageStatus":{"a":true,"h":"Package Status","n":"packageStatus","r":false,"sh":"Status of the package.","t":"`$STRING`","key$":"packageStatus","index$":7},"packageUUID":{"a":true,"h":"Package Uuid","n":"packageUUID","r":true,"sh":"Unique identifier for the package.","t":"`$STRING`","key$":"packageUUID","index$":8},"pagination":{"a":true,"h":"Pagination","n":"pagination","r":false,"t":"`$OBJECT`","key$":"pagination","index$":9},"sorting":{"a":true,"h":"Sorting","n":"sorting","r":false,"t":"`$OBJECT`","key$":"sorting","index$":10}},"name":"merchant_portal_pam_package_controller","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /merchantportalws/availablePackages","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/availablePackages","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"availablePackages"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0},{"a":true,"co":{"id":"POST /merchantportalws/orderPackage","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/orderPackage","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"orderPackage"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":1},{"a":true,"co":{"id":"POST /merchantportalws/orderedPackages","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/orderedPackages","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"orderedPackages"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":2},{"a":true,"co":{"id":"POST /merchantportalws/packageTemplates","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/packageTemplates","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"packageTemplates"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":3},{"a":true,"co":{"id":"POST /merchantportalws/updatePackageData","source":"openapi3","version":2},"g":{"header":[{"a":true,"k":"header","n":"authorization","or":"authorization","r":false,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/merchantportalws/updatePackageData","q":{"exist":["authorization"]},"r":{},"s":[{"lit":"merchantportalws"},{"lit":"updatePackageData"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":4}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"merchant_portal_pam_package_controller","name__orig":"merchant_portal_pam_package_controller","Name":"MerchantPortalPamPackageController","name_":"merchant_portal_pam_package_controller","name-":"merchant-portal-pam-package-controller","NAME":"MERCHANT_PORTAL_PAM_PACKAGE_CONTROLLER","index$":7}, {"active":true,"entity":"merchant_portal_pam_package_controller","key$":"BasicMerchantPortalPamPackageControllerFlow","kind":"basic","name":"BasicMerchantPortalPamPackageControllerFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"merchant_portal_pam_package_controller_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0}]}, 'MerchantPortalPamPackageController', {"POST /merchantportalws/availablePackages":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["language"],"properties":{"filter":{"type":"object","properties":{"packageStatus":{"type":"string","example":"Active","description":"Name of the package status"},"packageUUID":{"type":"string"},"productType":{"type":"string","example":"MERCHANT_CONTRACT","description":"Name of the product type"}},"title":"InputAvailablePackages_Filter","x-ref":"#/components/schemas/InputAvailablePackages_Filter","key$":"filter"},"language":{"type":"string","key$":"language"},"pagination":{"type":"object","properties":{"page":{"type":"integer","format":"int32","example":1,"description":"Number of the page to display."},"size":{"type":"integer","format":"int32","example":10,"description":"Number of elements per page to display."}},"title":"Pagination","x-ref":"#/components/schemas/Pagination","key$":"pagination"},"sorting":{"type":"object","properties":{"name":{"type":"string","example":"requestorID","description":"Sort attribute name."},"type":{"type":"string","example":"ASC","description":"Sort type ASC / DESC."}},"title":"Sorting","x-ref":"#/components/schemas/Sorting","key$":"sorting"}},"title":"InputAvailablePackages","x-ref":"#/components/schemas/InputAvailablePackages","index$":1}}},"description":"inputAvailablePackages","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]},"POST /merchantportalws/orderPackage":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["packageUUID"],"properties":{"consumerUUID":{"type":"string","key$":"consumerUUID"},"corporateUUID":{"type":"string","key$":"corporateUUID"},"language":{"type":"string","key$":"language"},"packageUUID":{"type":"string","key$":"packageUUID"}},"title":"InputOrderPackage","x-ref":"#/components/schemas/InputOrderPackage","index$":1}}},"description":"inputOrderPackage","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]},"POST /merchantportalws/orderedPackages":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["language"],"properties":{"filter":{"type":"object","properties":{"consumerUUID":{"type":"string"},"corporateUUID":{"type":"string"},"dateFrom":{"type":"string","format":"date-time"},"dateTo":{"type":"string","format":"date-time"},"packageOrderStatus":{"type":"string","example":"New","description":"Name of the package order status"},"packageOrderUUID":{"type":"string"},"packageStatus":{"type":"string","example":"Active","description":"Name of the package status"},"packageUUID":{"type":"string"},"productOrderStatus":{"type":"string","example":"New","description":"Name of the product order status"},"productOrderUUID":{"type":"string"},"productUUID":{"type":"string"}},"title":"InputOrderedPackages_Filter","x-ref":"#/components/schemas/InputOrderedPackages_Filter","key$":"filter"},"language":{"type":"string","key$":"language"},"pagination":{"type":"object","properties":{"page":{"type":"integer","format":"int32","example":1,"description":"Number of the page to display."},"size":{"type":"integer","format":"int32","example":10,"description":"Number of elements per page to display."}},"title":"Pagination","x-ref":"#/components/schemas/Pagination","key$":"pagination"},"sorting":{"type":"object","properties":{"name":{"type":"string","example":"requestorID","description":"Sort attribute name."},"type":{"type":"string","example":"ASC","description":"Sort type ASC / DESC."}},"title":"Sorting","x-ref":"#/components/schemas/Sorting","key$":"sorting"}},"title":"InputOrderedPackages","x-ref":"#/components/schemas/InputOrderedPackages","index$":1}}},"description":"inputOrderedPackages","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]},"POST /merchantportalws/packageTemplates":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","properties":{"filter":{"type":"object","properties":{"descriptionKey":{"type":"string"}},"title":"InputPackageTemplates_Filter","x-ref":"#/components/schemas/InputPackageTemplates_Filter","key$":"filter"},"pagination":{"type":"object","properties":{"page":{"type":"integer","format":"int32","example":1,"description":"Number of the page to display."},"size":{"type":"integer","format":"int32","example":10,"description":"Number of elements per page to display."}},"title":"Pagination","x-ref":"#/components/schemas/Pagination","key$":"pagination"},"sorting":{"type":"object","properties":{"name":{"type":"string","example":"requestorID","description":"Sort attribute name."},"type":{"type":"string","example":"ASC","description":"Sort type ASC / DESC."}},"title":"Sorting","x-ref":"#/components/schemas/Sorting","key$":"sorting"}},"title":"InputPackageTemplates","x-ref":"#/components/schemas/InputPackageTemplates","index$":1}}},"description":"inputPackageTemplates","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":true,"schema":{"type":"string"},"index$":0}]},"POST /merchantportalws/updatePackageData":{"protocol":"http","requestBody":{"content":{"application/json":{"schema":{"type":"object","required":["packageUUID"],"properties":{"country":{"type":"string","example":"AT","description":"Country associated with the package.","key$":"country"},"descriptionKey":{"type":"string","example":"package_description_key","description":"Key for the description of the package.","key$":"descriptionKey"},"nameKey":{"type":"string","example":"package_name_key","description":"Key for the name of the package.","key$":"nameKey"},"packageStatus":{"type":"string","example":"Active","description":"Status of the package. Possible values: Active/Inactive","key$":"packageStatus"},"packageUUID":{"type":"string","example":"123e4567-e89b-12d3-a456-426655440000","description":"Unique identifier for the package.","key$":"packageUUID"}},"title":"InputUpdatePackageData","x-ref":"#/components/schemas/InputUpdatePackageData","index$":1}}},"description":"inputUpdatePackageData","required":true},"parameters":[{"name":"Authorization","in":"header","description":"Authorization","required":false,"schema":{"type":"string"},"index$":0}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const merchant_portal_pam_package_controller_ref01_ent = client.MerchantPortalPamPackageController()
    let merchant_portal_pam_package_controller_ref01_data = setup.data.new.merchant_portal_pam_package_controller['merchant_portal_pam_package_controller_ref01']

    merchant_portal_pam_package_controller_ref01_data = (await merchant_portal_pam_package_controller_ref01_ent.create(merchant_portal_pam_package_controller_ref01_data)).data()
    assert(null != merchant_portal_pam_package_controller_ref01_data)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/merchant_portal_pam_package_controller/MerchantPortalPamPackageControllerTestData.json')

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
    ['merchant_portal_pam_package_controller01','merchant_portal_pam_package_controller02','merchant_portal_pam_package_controller03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_PACKAGE_CONTROLLER_ENTID': idmap,
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
    'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_PACKAGE_CONTROLLER_ENTID']

  const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_PACKAGE_CONTROLLER_ENTID']
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
  
