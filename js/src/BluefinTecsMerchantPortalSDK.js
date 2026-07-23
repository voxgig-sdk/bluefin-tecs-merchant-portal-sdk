// BluefinTecsMerchantPortal Js SDK

const { MerchantPortalApiControllerEntity } = require('./entity/MerchantPortalApiControllerEntity')
const { MerchantPortalCommonControllerEntity } = require('./entity/MerchantPortalCommonControllerEntity')
const { MerchantPortalPamContractControllerEntity } = require('./entity/MerchantPortalPamContractControllerEntity')
const { MerchantPortalPamDocumentControllerEntity } = require('./entity/MerchantPortalPamDocumentControllerEntity')
const { MerchantPortalPamFormControllerEntity } = require('./entity/MerchantPortalPamFormControllerEntity')
const { MerchantPortalPamMandatorControllerEntity } = require('./entity/MerchantPortalPamMandatorControllerEntity')
const { MerchantPortalPamMerchantControllerEntity } = require('./entity/MerchantPortalPamMerchantControllerEntity')
const { MerchantPortalPamPackageControllerEntity } = require('./entity/MerchantPortalPamPackageControllerEntity')
const { MerchantPortalPamProductControllerEntity } = require('./entity/MerchantPortalPamProductControllerEntity')
const { OutputAddProductEntity } = require('./entity/OutputAddProductEntity')
const { OutputCreateProductEntity } = require('./entity/OutputCreateProductEntity')
const { OutputDetailEntity } = require('./entity/OutputDetailEntity')
const { OutputListEntity } = require('./entity/OutputListEntity')
const { OutputMessageEntity } = require('./entity/OutputMessageEntity')
const { OutputMoveTidEntity } = require('./entity/OutputMoveTidEntity')
const { OutputRemoveProductEntity } = require('./entity/OutputRemoveProductEntity')
const { OutputStartEntity } = require('./entity/OutputStartEntity')
const { OutputStatusEntity } = require('./entity/OutputStatusEntity')
const { OutputUpdateProductEntity } = require('./entity/OutputUpdateProductEntity')


const { inspect } = require('node:util')

const { config } = require('./Config')
const { Utility } = require('./utility/Utility')
const { BluefinTecsMerchantPortalEntityBase } = require('./BluefinTecsMerchantPortalEntityBase')


const { BaseFeature } = require('./feature/base/BaseFeature')


const stdutil = new Utility()


class BluefinTecsMerchantPortalSDK {
  _mode = 'live'
  _options
  _utility = new Utility()
  _features
  _rootctx

  constructor(options) {

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


  async prepare(fetchargs) {
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

    let ctx = makeContext({
      opname: 'prepare',
      ctrl: fetchargs.ctrl || {},
    }, this._rootctx)

    const options = this._options

    // Build spec directly from SDK options + user-provided fetch args.
    const spec = {
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


  async direct(fetchargs) {
    const utility = this._utility
    const fetcher = utility.fetcher
    const makeContext = utility.makeContext

    const fetchdef = await this.prepare(fetchargs)
    if (fetchdef instanceof Error) {
      return fetchdef
    }

    let ctx = makeContext({
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
      const json = 'function' === typeof fetched.json ? await fetched.json() : fetched.json

      return {
        ok: status >= 200 && status < 300,
        status,
        headers: fetched.headers,
        data: json,
      }
    }
    catch (err) {
      return { ok: false, err }
    }
  }



  // Entity access: `client.MerchantPortalApiController().list()` / `client.MerchantPortalApiController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalApiController(entopts) {
    const self = this
    return new MerchantPortalApiControllerEntity(self, entopts)
  }


  // Entity access: `client.MerchantPortalCommonController().list()` / `client.MerchantPortalCommonController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalCommonController(entopts) {
    const self = this
    return new MerchantPortalCommonControllerEntity(self, entopts)
  }


  // Entity access: `client.MerchantPortalPamContractController().list()` / `client.MerchantPortalPamContractController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalPamContractController(entopts) {
    const self = this
    return new MerchantPortalPamContractControllerEntity(self, entopts)
  }


  // Entity access: `client.MerchantPortalPamDocumentController().list()` / `client.MerchantPortalPamDocumentController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalPamDocumentController(entopts) {
    const self = this
    return new MerchantPortalPamDocumentControllerEntity(self, entopts)
  }


  // Entity access: `client.MerchantPortalPamFormController().list()` / `client.MerchantPortalPamFormController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalPamFormController(entopts) {
    const self = this
    return new MerchantPortalPamFormControllerEntity(self, entopts)
  }


  // Entity access: `client.MerchantPortalPamMandatorController().list()` / `client.MerchantPortalPamMandatorController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalPamMandatorController(entopts) {
    const self = this
    return new MerchantPortalPamMandatorControllerEntity(self, entopts)
  }


  // Entity access: `client.MerchantPortalPamMerchantController().list()` / `client.MerchantPortalPamMerchantController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalPamMerchantController(entopts) {
    const self = this
    return new MerchantPortalPamMerchantControllerEntity(self, entopts)
  }


  // Entity access: `client.MerchantPortalPamPackageController().list()` / `client.MerchantPortalPamPackageController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalPamPackageController(entopts) {
    const self = this
    return new MerchantPortalPamPackageControllerEntity(self, entopts)
  }


  // Entity access: `client.MerchantPortalPamProductController().list()` / `client.MerchantPortalPamProductController().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  MerchantPortalPamProductController(entopts) {
    const self = this
    return new MerchantPortalPamProductControllerEntity(self, entopts)
  }


  // Entity access: `client.OutputAddProduct().list()` / `client.OutputAddProduct().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputAddProduct(entopts) {
    const self = this
    return new OutputAddProductEntity(self, entopts)
  }


  // Entity access: `client.OutputCreateProduct().list()` / `client.OutputCreateProduct().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputCreateProduct(entopts) {
    const self = this
    return new OutputCreateProductEntity(self, entopts)
  }


  // Entity access: `client.OutputDetail().list()` / `client.OutputDetail().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputDetail(entopts) {
    const self = this
    return new OutputDetailEntity(self, entopts)
  }


  // Entity access: `client.OutputList().list()` / `client.OutputList().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputList(entopts) {
    const self = this
    return new OutputListEntity(self, entopts)
  }


  // Entity access: `client.OutputMessage().list()` / `client.OutputMessage().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputMessage(entopts) {
    const self = this
    return new OutputMessageEntity(self, entopts)
  }


  // Entity access: `client.OutputMoveTid().list()` / `client.OutputMoveTid().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputMoveTid(entopts) {
    const self = this
    return new OutputMoveTidEntity(self, entopts)
  }


  // Entity access: `client.OutputRemoveProduct().list()` / `client.OutputRemoveProduct().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputRemoveProduct(entopts) {
    const self = this
    return new OutputRemoveProductEntity(self, entopts)
  }


  // Entity access: `client.OutputStart().list()` / `client.OutputStart().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputStart(entopts) {
    const self = this
    return new OutputStartEntity(self, entopts)
  }


  // Entity access: `client.OutputStatus().list()` / `client.OutputStatus().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputStatus(entopts) {
    const self = this
    return new OutputStatusEntity(self, entopts)
  }


  // Entity access: `client.OutputUpdateProduct().list()` / `client.OutputUpdateProduct().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  OutputUpdateProduct(entopts) {
    const self = this
    return new OutputUpdateProductEntity(self, entopts)
  }




  static test(testoptsarg, sdkoptsarg) {
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


  tester(testopts, sdkopts) {
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


module.exports = {
  stdutil,
  config,

  BaseFeature,
  BluefinTecsMerchantPortalEntityBase,

  BluefinTecsMerchantPortalSDK,
  SDK,
}

