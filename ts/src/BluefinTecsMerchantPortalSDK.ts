// BluefinTecsMerchantPortal Ts SDK

import { MerchantPortalApiControllerEntity } from './entity/MerchantPortalApiControllerEntity'
import { MerchantPortalCommonControllerEntity } from './entity/MerchantPortalCommonControllerEntity'
import { MerchantPortalPamContractControllerEntity } from './entity/MerchantPortalPamContractControllerEntity'
import { MerchantPortalPamDocumentControllerEntity } from './entity/MerchantPortalPamDocumentControllerEntity'
import { MerchantPortalPamFormControllerEntity } from './entity/MerchantPortalPamFormControllerEntity'
import { MerchantPortalPamMandatorControllerEntity } from './entity/MerchantPortalPamMandatorControllerEntity'
import { MerchantPortalPamMerchantControllerEntity } from './entity/MerchantPortalPamMerchantControllerEntity'
import { MerchantPortalPamPackageControllerEntity } from './entity/MerchantPortalPamPackageControllerEntity'
import { MerchantPortalPamProductControllerEntity } from './entity/MerchantPortalPamProductControllerEntity'
import { OutputAddProductEntity } from './entity/OutputAddProductEntity'
import { OutputCreateProductEntity } from './entity/OutputCreateProductEntity'
import { OutputDetailEntity } from './entity/OutputDetailEntity'
import { OutputListEntity } from './entity/OutputListEntity'
import { OutputMessageEntity } from './entity/OutputMessageEntity'
import { OutputMoveTidEntity } from './entity/OutputMoveTidEntity'
import { OutputRemoveProductEntity } from './entity/OutputRemoveProductEntity'
import { OutputStartEntity } from './entity/OutputStartEntity'
import { OutputStatusEntity } from './entity/OutputStatusEntity'
import { OutputUpdateProductEntity } from './entity/OutputUpdateProductEntity'

export type * from './BluefinTecsMerchantPortalTypes'


import { inspect } from 'node:util'

import type { Context, Feature } from './types'

import { config } from './Config'
import { BluefinTecsMerchantPortalEntityBase } from './BluefinTecsMerchantPortalEntityBase'
import { Utility } from './utility/Utility'


import { BaseFeature } from './feature/base/BaseFeature'


const stdutil = new Utility()


class BluefinTecsMerchantPortalSDK {
  _mode: string = 'live'
  _options: any
  _utility = new Utility()
  _features: Feature[]
  _rootctx: Context

  constructor(options?: any) {

    this._rootctx = this._utility.makeContext({
      client: this,
      utility: this._utility,
      config,
      options,
      shared: new WeakMap()
    })

    this._options = this._utility.makeOptions(this._rootctx)

    const struct = this._utility.struct
    const getpath = struct.getpath

    if (true === getpath(this._options.feature, 'test.active')) {
      this._mode = 'test'
    }

    this._rootctx.options = this._options

    this._features = []

    const featureAdd = this._utility.featureAdd
    const featureInit = this._utility.featureInit

    // Add features in the resolved order (makeOptions puts an explicit
    // array order first, else defaults to test-first). Ordering matters:
    // the `test` feature installs the base mock transport and the transport
    // features (retry/cache/netsim/proxy/ratelimit) wrap whatever is current,
    // so `test` must be added before them to sit at the base of the chain.
    const featureorder = getpath(this._options, '__derived__.featureorder') || []
    for (const fname of featureorder) {
      const fopts = this._options.feature[fname] || {}
      if (fopts.active) {
        featureAdd(this._rootctx, this._rootctx.config.makeFeature(fname))
      }
    }

    if (null != this._options.extend) {
      for (let f of this._options.extend) {
        featureAdd(this._rootctx, f)
      }
    }

    for (let f of this._features) {
      featureInit(this._rootctx, f)
    }

    const featureHook = this._utility.featureHook
    featureHook(this._rootctx, 'PostConstruct')
  }


  options() {
    return this._utility.struct.clone(this._options)
  }


  utility() {
    return this._utility.struct.clone(this._utility)
  }


  async prepare(fetchargs?: any) {
    const utility = this._utility
    const struct = utility.struct
    const clone = struct.clone

    const {
      makeContext,
      makeFetchDef,
      prepareHeaders,
      prepareAuth,
    } = utility

    fetchargs = fetchargs || {}

    let ctx: Context = makeContext({
      opname: 'prepare',
      ctrl: fetchargs.ctrl || {},
    }, this._rootctx)

    const options = this._options

    // Build spec directly from SDK options + user-provided fetch args.
    const spec: any = {
      base: options.base,
      prefix: options.prefix,
      suffix: options.suffix,
      path: fetchargs.path || '',
      method: fetchargs.method || 'GET',
      params: fetchargs.params || {},
      query: fetchargs.query || {},
      headers: prepareHeaders(ctx),
      body: fetchargs.body,
      step: 'start',
    }

    ctx.spec = spec

    // Merge user-provided headers over SDK defaults.
    if (fetchargs.headers) {
      const uheaders = fetchargs.headers
      for (let key in uheaders) {
        spec.headers[key] = uheaders[key]
      }
    }

    // Apply SDK auth (apikey, auth prefix, etc.)
    const authResult = prepareAuth(ctx)
    if (authResult instanceof Error) {
      return authResult
    }

    return makeFetchDef(ctx)
  }


  async direct(fetchargs?: any) {
    const utility = this._utility
    const fetcher = utility.fetcher
    const makeContext = utility.makeContext

    const fetchdef = await this.prepare(fetchargs)
    if (fetchdef instanceof Error) {
      return fetchdef
    }

    let ctx: Context = makeContext({
      opname: 'direct',
      ctrl: (fetchargs || {}).ctrl || {},
    }, this._rootctx)

    try {
      const fetched = await fetcher(ctx, fetchdef.url, fetchdef)

      if (null == fetched) {
        return { ok: false, err: ctx.error('direct_no_response', 'response: undefined') }
      }
      else if (fetched instanceof Error) {
        return { ok: false, err: fetched }
      }

      const status = fetched.status

      // No body responses (204 No Content, 304 Not Modified) and explicit
      // zero content-length must skip JSON parsing — fetched.json() would
      // throw `Unexpected end of JSON input` on an empty body.
      const headers = fetched.headers
      const contentLength = headers && 'function' === typeof headers.get
        ? headers.get('content-length')
        : (headers || {})['content-length']
      const noBody = 204 === status || 304 === status || '0' === String(contentLength)

      let json: any = undefined
      if (!noBody) {
        try {
          json = 'function' === typeof fetched.json ? await fetched.json() : fetched.json
        }
        catch (parseErr) {
          // Body wasn't valid JSON — surface the raw response rather than
          // throwing. data stays undefined; callers can inspect status/headers.
          json = undefined
        }
      }

      return {
        ok: status >= 200 && status < 300,
        status,
        headers: fetched.headers,
        data: json,
      }
    }
    catch (err: any) {
      return { ok: false, err }
    }
  }



  // Entity access: `client.MerchantPortalApiController().list()` / `client.MerchantPortalApiController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalApiController(entopts?: Record<string, any>) {
    const self = this
    return new MerchantPortalApiControllerEntity(self, entopts)
  }


  // Entity access: `client.MerchantPortalCommonController().list()` / `client.MerchantPortalCommonController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalCommonController(entopts?: Record<string, any>) {
    const self = this
    return new MerchantPortalCommonControllerEntity(self, entopts)
  }


  // Entity access: `client.MerchantPortalPamContractController().list()` / `client.MerchantPortalPamContractController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalPamContractController(entopts?: Record<string, any>) {
    const self = this
    return new MerchantPortalPamContractControllerEntity(self, entopts)
  }


  // Entity access: `client.MerchantPortalPamDocumentController().list()` / `client.MerchantPortalPamDocumentController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalPamDocumentController(entopts?: Record<string, any>) {
    const self = this
    return new MerchantPortalPamDocumentControllerEntity(self, entopts)
  }


  // Entity access: `client.MerchantPortalPamFormController().list()` / `client.MerchantPortalPamFormController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalPamFormController(entopts?: Record<string, any>) {
    const self = this
    return new MerchantPortalPamFormControllerEntity(self, entopts)
  }


  // Entity access: `client.MerchantPortalPamMandatorController().list()` / `client.MerchantPortalPamMandatorController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalPamMandatorController(entopts?: Record<string, any>) {
    const self = this
    return new MerchantPortalPamMandatorControllerEntity(self, entopts)
  }


  // Entity access: `client.MerchantPortalPamMerchantController().list()` / `client.MerchantPortalPamMerchantController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalPamMerchantController(entopts?: Record<string, any>) {
    const self = this
    return new MerchantPortalPamMerchantControllerEntity(self, entopts)
  }


  // Entity access: `client.MerchantPortalPamPackageController().list()` / `client.MerchantPortalPamPackageController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalPamPackageController(entopts?: Record<string, any>) {
    const self = this
    return new MerchantPortalPamPackageControllerEntity(self, entopts)
  }


  // Entity access: `client.MerchantPortalPamProductController().list()` / `client.MerchantPortalPamProductController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalPamProductController(entopts?: Record<string, any>) {
    const self = this
    return new MerchantPortalPamProductControllerEntity(self, entopts)
  }


  // Entity access: `client.OutputAddProduct().list()` / `client.OutputAddProduct().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputAddProduct(entopts?: Record<string, any>) {
    const self = this
    return new OutputAddProductEntity(self, entopts)
  }


  // Entity access: `client.OutputCreateProduct().list()` / `client.OutputCreateProduct().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputCreateProduct(entopts?: Record<string, any>) {
    const self = this
    return new OutputCreateProductEntity(self, entopts)
  }


  // Entity access: `client.OutputDetail().list()` / `client.OutputDetail().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputDetail(entopts?: Record<string, any>) {
    const self = this
    return new OutputDetailEntity(self, entopts)
  }


  // Entity access: `client.OutputList().list()` / `client.OutputList().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputList(entopts?: Record<string, any>) {
    const self = this
    return new OutputListEntity(self, entopts)
  }


  // Entity access: `client.OutputMessage().list()` / `client.OutputMessage().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputMessage(entopts?: Record<string, any>) {
    const self = this
    return new OutputMessageEntity(self, entopts)
  }


  // Entity access: `client.OutputMoveTid().list()` / `client.OutputMoveTid().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputMoveTid(entopts?: Record<string, any>) {
    const self = this
    return new OutputMoveTidEntity(self, entopts)
  }


  // Entity access: `client.OutputRemoveProduct().list()` / `client.OutputRemoveProduct().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputRemoveProduct(entopts?: Record<string, any>) {
    const self = this
    return new OutputRemoveProductEntity(self, entopts)
  }


  // Entity access: `client.OutputStart().list()` / `client.OutputStart().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputStart(entopts?: Record<string, any>) {
    const self = this
    return new OutputStartEntity(self, entopts)
  }


  // Entity access: `client.OutputStatus().list()` / `client.OutputStatus().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputStatus(entopts?: Record<string, any>) {
    const self = this
    return new OutputStatusEntity(self, entopts)
  }


  // Entity access: `client.OutputUpdateProduct().list()` / `client.OutputUpdateProduct().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputUpdateProduct(entopts?: Record<string, any>) {
    const self = this
    return new OutputUpdateProductEntity(self, entopts)
  }




  static test(testoptsarg?: any, sdkoptsarg?: any) {
    const struct = stdutil.struct
    const setpath = struct.setpath
    const getdef = struct.getdef
    const clone = struct.clone
    const setprop = struct.setprop

    const sdkopts = getdef(clone(sdkoptsarg), {})
    const testopts = getdef(clone(testoptsarg), {})
    setprop(testopts, 'active', true)
    setpath(sdkopts, 'feature.test', testopts)

    const testsdk = new BluefinTecsMerchantPortalSDK(sdkopts)
    testsdk._mode = 'test'

    return testsdk
  }


  tester(testopts?: any, sdkopts?: any) {
    return BluefinTecsMerchantPortalSDK.test(testopts, sdkopts)
  }


  toJSON() {
    return { name: 'BluefinTecsMerchantPortal' }
  }

  toString() {
    return 'BluefinTecsMerchantPortal ' + this._utility.struct.jsonify(this.toJSON())
  }

  [inspect.custom]() {
    return this.toString()
  }

}




const SDK = BluefinTecsMerchantPortalSDK


export {
  stdutil,
  config,

  BaseFeature,
  BluefinTecsMerchantPortalEntityBase,

  BluefinTecsMerchantPortalSDK,
  SDK,
}


