// BluefinTecsMerchantPortal SDK client.
//
// SDK TYPES ARE MODULE-QUALIFIED IN THIS FILE (`BluefinTecsMerchantPortalSdk.VMap`, not
// `VMap`), and only in this file. MainEntity_swift emits one accessor PER
// ENTITY into this class body, named after the entity - `Utility()`,
// `Spec()`, `Value()` for an API with entities of those names - and inside
// a class body a METHOD of that name shadows the TYPE for every unqualified
// use: `utility = Utility()` then reads as a call to the accessor, and
// `-> Utility` as a return type that does not exist. The entity TYPE is
// already renamed on such a collision (swiftSafeTypeName), but the accessor
// keeps the entity's own name, which is the public API. Qualifying by
// module - the generated module is <Name>Sdk, so `BluefinTecsMerchantPortalSdk.` lands as
// `<Name>Sdk.` - is the one spelling a method cannot shadow. The shared
// fixture's `utility` entity is what found this; every other swift file is
// outside this class and unaffected.

import Foundation

public final class BluefinTecsMerchantPortalSDK {
  public var mode = "live"
  private var options: BluefinTecsMerchantPortalSdk.VMap = BluefinTecsMerchantPortalSdk.VMap()
  private let utility: BluefinTecsMerchantPortalSdk.Utility
  public var features: [BaseFeature] = []
  private var rootctx: BluefinTecsMerchantPortalSdk.Context!

  public init(_ optionsIn: BluefinTecsMerchantPortalSdk.VMap? = nil) {
    utility = BluefinTecsMerchantPortalSdk.Utility()

    // The process-wide config (sdkgen rung L2): read-only on the request path,
    // so every client shares one rather than rebuilding it.
    let config = SdkConfig.sharedConfig()

    var ctxmap: [String: Any?] = [
      "client": self,
      "utility": utility,
      "config": config,
      "shared": BluefinTecsMerchantPortalSdk.VMap(),
    ]
    if let o = optionsIn { ctxmap["options"] = o }

    rootctx = utility.makeContext(ctxmap, nil)

    options = utility.makeOptions(rootctx)

    if gpath(options, "feature", "test", "active") == .bool(true) {
      mode = "test"
    }

    rootctx.options = options

    // Add features in the resolved order (makeOptions puts an explicit list
    // order first, else defaults to test-first). Ordering matters: the `test`
    // feature installs the base mock transport and the transport features
    // (retry/cache/netsim/proxy/ratelimit) wrap whatever is current, so `test`
    // must be added before them to sit at the base of the chain.
    let featureOpts = gp(options, "feature").asMap ?? BluefinTecsMerchantPortalSdk.VMap()
    if let featureOrder = gpath(options, "__derived__", "featureorder").asList {
      for fnameVal in featureOrder.items {
        let fname = fnameVal.asString ?? ""
        if fname != "", let fopts = gp(featureOpts, fname).asMap,
          fopts.entries["active"]?.asBool == true {
          utility.featureAdd(rootctx, SdkConfig.makeFeature(fname))
        }
      }
    }

    // Add extension features.
    if let extList = gp(options, "extend").asList {
      for f in extList.items {
        if let feat = f.asNative as? BaseFeature {
          utility.featureAdd(rootctx, feat)
        }
      }
    }

    // Initialize features.
    for f in features {
      utility.featureInit(rootctx, f)
    }

    utility.featureHook(rootctx, "PostConstruct")
  }

  public func optionsMap() -> BluefinTecsMerchantPortalSdk.VMap {
    return clone(.map(options)).asMap ?? BluefinTecsMerchantPortalSdk.VMap()
  }

  public func getUtility() -> BluefinTecsMerchantPortalSdk.Utility {
    return BluefinTecsMerchantPortalSdk.Utility.copy(utility)
  }

  public func getRootCtx() -> BluefinTecsMerchantPortalSdk.Context {
    return rootctx
  }

  public func prepare(_ fetchargsIn: BluefinTecsMerchantPortalSdk.VMap?) throws -> BluefinTecsMerchantPortalSdk.VMap {
    let utility = self.utility

    let fetchargs = fetchargsIn ?? BluefinTecsMerchantPortalSdk.VMap()

    let ctrl = gp(fetchargs, "ctrl").asMap ?? BluefinTecsMerchantPortalSdk.VMap()

    let ctx = utility.makeContext(["opname": "prepare", "ctrl": ctrl], rootctx)

    let options = self.options

    let path = gp(fetchargs, "path").asString ?? ""
    var method = gp(fetchargs, "method").asString ?? ""
    if method == "" { method = "GET" }

    let pathParams = gp(fetchargs, "params").asMap ?? BluefinTecsMerchantPortalSdk.VMap()
    let query = gp(fetchargs, "query").asMap ?? BluefinTecsMerchantPortalSdk.VMap()

    let headers = utility.prepareHeaders(ctx)

    let basev = gp(options, "base").asString ?? ""
    let prefix = gp(options, "prefix").asString ?? ""
    let suffix = gp(options, "suffix").asString ?? ""

    let specmap = BluefinTecsMerchantPortalSdk.VMap()
    specmap.entries["base"] = .string(basev)
    specmap.entries["prefix"] = .string(prefix)
    specmap.entries["suffix"] = .string(suffix)
    specmap.entries["path"] = .string(path)
    specmap.entries["method"] = .string(method)
    specmap.entries["params"] = .map(pathParams)
    specmap.entries["query"] = .map(query)
    specmap.entries["headers"] = .map(headers)
    specmap.entries["body"] = gp(fetchargs, "body")
    specmap.entries["step"] = .string("start")
    ctx.spec = BluefinTecsMerchantPortalSdk.Spec(specmap)

    // Merge user-provided headers.
    if let uhm = gp(fetchargs, "headers").asMap {
      for (k, v) in uhm.entries {
        ctx.spec!.headers.entries[k] = v
      }
    }

    _ = try utility.prepareAuth(ctx)

    return try utility.makeFetchDef(ctx)
  }

  // Raw endpoint access is operator-controllable, like every entity op.
  // Blocking it means denying BOTH the 'direct' and 'graphql' tokens, since
  // either one reaches the same endpoint.
  public func direct(_ fetchargsIn: BluefinTecsMerchantPortalSdk.VMap?) -> BluefinTecsMerchantPortalSdk.VMap {
    if !opAllowed("direct") {
      return opDenied("direct")
    }

    return rawRequest(fetchargsIn)
  }

  // Is this raw-access op permitted by the SDK's allow.op option?
  private func opAllowed(_ op: String) -> Bool {
    guard let allow = gpath(options, "allow", "op").asString else { return false }
    return allow.contains(op)
  }

  private func opDenied(_ op: String) -> BluefinTecsMerchantPortalSdk.VMap {
    let allow = gpath(options, "allow", "op").asString ?? ""
    let r = BluefinTecsMerchantPortalSdk.VMap()
    r.entries["ok"] = .bool(false)
    r.entries["err"] = .nat(BluefinTecsMerchantPortalError(
      op + "_allow",
      "BluefinTecsMerchantPortalSDK: \(op): operation not allowed by SDK option "
        + "allow.op value: \"\(allow)\"", nil))
    return r
  }

  // Ungated request path shared by direct and graphql, each of which checks
  // its own allow.op token first. Private, rather than a flag on fetchargs:
  // a caller-supplied marker would let anyone opt straight back out of the
  // gate by passing it.
  private func rawRequest(_ fetchargsIn: BluefinTecsMerchantPortalSdk.VMap?) -> BluefinTecsMerchantPortalSdk.VMap {
    let utility = self.utility

    let fetchdef: BluefinTecsMerchantPortalSdk.VMap
    do {
      fetchdef = try prepare(fetchargsIn)
    } catch {
      let r = BluefinTecsMerchantPortalSdk.VMap()
      r.entries["ok"] = .bool(false)
      r.entries["err"] = .nat(error)
      return r
    }

    let fetchargs = fetchargsIn ?? BluefinTecsMerchantPortalSdk.VMap()
    let ctrl = gp(fetchargs, "ctrl").asMap ?? BluefinTecsMerchantPortalSdk.VMap()

    let ctx = utility.makeContext(["opname": "direct", "ctrl": ctrl], rootctx)

    let url = gp(fetchdef, "url").asString ?? ""

    let fetched: BluefinTecsMerchantPortalSdk.Value
    do {
      fetched = try utility.fetcher(ctx, url, fetchdef)
    } catch {
      let r = BluefinTecsMerchantPortalSdk.VMap()
      r.entries["ok"] = .bool(false)
      r.entries["err"] = .nat(error)
      return r
    }

    if isNil(fetched) {
      let r = BluefinTecsMerchantPortalSdk.VMap()
      r.entries["ok"] = .bool(false)
      r.entries["err"] = .nat(ctx.makeError("direct_no_response", "response: undefined"))
      return r
    }

    if let fm = fetched.asMap {
      let status = toInt(gp(fm, "status"))
      let headers = gp(fm, "headers")

      // No-body responses (204, 304) and explicit zero content-length must
      // skip JSON parsing.
      var contentLength = ""
      if let hm = headers.asMap, let cl = hm.entries["content-length"], !isNil(cl) {
        contentLength = stringify(cl)
      }
      let noBody = status == 204 || status == 304 || contentLength == "0"

      var jsonData: BluefinTecsMerchantPortalSdk.Value = .noval
      if !noBody, let jf = gp(fm, "json").asNative as? BluefinTecsMerchantPortalSdk.NativeCall0 {
        jsonData = jf()
      }

      let r = BluefinTecsMerchantPortalSdk.VMap()
      r.entries["ok"] = .bool(status >= 200 && status < 300)
      r.entries["status"] = .int(Int64(status))
      r.entries["headers"] = headers
      r.entries["data"] = jsonData
      return r
    }

    let r = BluefinTecsMerchantPortalSdk.VMap()
    r.entries["ok"] = .bool(false)
    r.entries["err"] = .nat(ctx.makeError("direct_invalid", "invalid response type"))
    return r
  }

  // Raw GraphQL access: the pressure valve that makes the generated surface's
  // deliberate omissions (per-call selection sets, typed filter builders,
  // batching, subscriptions) livable — the whole schema stays reachable.
  //
  // Thin wrapper over the same prepare/fetch path direct uses, with the one
  // thing raw direct cannot do for GraphQL: a GraphQL failure rides HTTP 200
  // as a top-level `errors` array, so status alone would report a failed
  // query as ok.
  //
  // NOTE: like direct, this bypasses the feature pipeline — no retry,
  // ratelimit or paging features apply.
  public func graphql(
    _ query: String, _ variables: BluefinTecsMerchantPortalSdk.VMap? = nil, _ ctrl: BluefinTecsMerchantPortalSdk.VMap? = nil
  ) -> BluefinTecsMerchantPortalSdk.VMap {
    if !opAllowed("graphql") {
      return opDenied("graphql")
    }

    let headers = BluefinTecsMerchantPortalSdk.VMap()
    headers.entries["content-type"] = .string("application/json")

    let body = BluefinTecsMerchantPortalSdk.VMap()
    body.entries["query"] = .string(query)
    body.entries["variables"] = .map(variables ?? BluefinTecsMerchantPortalSdk.VMap())

    let fetchargs = BluefinTecsMerchantPortalSdk.VMap()
    fetchargs.entries["method"] = .string("POST")
    fetchargs.entries["headers"] = .map(headers)
    fetchargs.entries["body"] = .map(body)
    fetchargs.entries["ctrl"] = .map(ctrl ?? BluefinTecsMerchantPortalSdk.VMap())

    let res = rawRequest(fetchargs)

    // Errors are read BEFORE any status check: a GraphQL parse or validation
    // failure comes back as HTTP 400 carrying the standard { errors: [...] }
    // body, and the raw path represents a non-2xx as ok:false with no err —
    // so returning early on status would discard the server's own
    // diagnostics, which are the only useful part of that response.
    guard let errors = gp(gp(.map(res), "data"), "errors").asList,
          !errors.items.isEmpty else {
      return res
    }

    var msg = gp(errors.items[0], "message").asString ?? ""
    if msg.isEmpty { msg = "graphql error" }

    res.entries["ok"] = .bool(false)
    res.entries["err"] = .nat(BluefinTecsMerchantPortalError(
      "graphql_error", "BluefinTecsMerchantPortalSDK: graphql: " + msg, nil))
    res.entries["graphql"] = .list(errors)

    return res
  }


  // MerchantPortalApiController returns a MerchantPortalApiController entity bound to this client.
  // Idiomatic usage: try client.MerchantPortalApiController().list(nil) or
  // try client.MerchantPortalApiController().load(vm(("id", .string("..."))), nil).
  public func MerchantPortalApiController(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return MerchantPortalApiControllerEntity(self, entopts)
  }

  // MerchantPortalCommonController returns a MerchantPortalCommonController entity bound to this client.
  // Idiomatic usage: try client.MerchantPortalCommonController().list(nil) or
  // try client.MerchantPortalCommonController().load(vm(("id", .string("..."))), nil).
  public func MerchantPortalCommonController(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return MerchantPortalCommonControllerEntity(self, entopts)
  }

  // MerchantPortalPamContractController returns a MerchantPortalPamContractController entity bound to this client.
  // Idiomatic usage: try client.MerchantPortalPamContractController().list(nil) or
  // try client.MerchantPortalPamContractController().load(vm(("id", .string("..."))), nil).
  public func MerchantPortalPamContractController(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return MerchantPortalPamContractControllerEntity(self, entopts)
  }

  // MerchantPortalPamDocumentController returns a MerchantPortalPamDocumentController entity bound to this client.
  // Idiomatic usage: try client.MerchantPortalPamDocumentController().list(nil) or
  // try client.MerchantPortalPamDocumentController().load(vm(("id", .string("..."))), nil).
  public func MerchantPortalPamDocumentController(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return MerchantPortalPamDocumentControllerEntity(self, entopts)
  }

  // MerchantPortalPamFormController returns a MerchantPortalPamFormController entity bound to this client.
  // Idiomatic usage: try client.MerchantPortalPamFormController().list(nil) or
  // try client.MerchantPortalPamFormController().load(vm(("id", .string("..."))), nil).
  public func MerchantPortalPamFormController(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return MerchantPortalPamFormControllerEntity(self, entopts)
  }

  // MerchantPortalPamMandatorController returns a MerchantPortalPamMandatorController entity bound to this client.
  // Idiomatic usage: try client.MerchantPortalPamMandatorController().list(nil) or
  // try client.MerchantPortalPamMandatorController().load(vm(("id", .string("..."))), nil).
  public func MerchantPortalPamMandatorController(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return MerchantPortalPamMandatorControllerEntity(self, entopts)
  }

  // MerchantPortalPamMerchantController returns a MerchantPortalPamMerchantController entity bound to this client.
  // Idiomatic usage: try client.MerchantPortalPamMerchantController().list(nil) or
  // try client.MerchantPortalPamMerchantController().load(vm(("id", .string("..."))), nil).
  public func MerchantPortalPamMerchantController(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return MerchantPortalPamMerchantControllerEntity(self, entopts)
  }

  // MerchantPortalPamPackageController returns a MerchantPortalPamPackageController entity bound to this client.
  // Idiomatic usage: try client.MerchantPortalPamPackageController().list(nil) or
  // try client.MerchantPortalPamPackageController().load(vm(("id", .string("..."))), nil).
  public func MerchantPortalPamPackageController(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return MerchantPortalPamPackageControllerEntity(self, entopts)
  }

  // MerchantPortalPamProductController returns a MerchantPortalPamProductController entity bound to this client.
  // Idiomatic usage: try client.MerchantPortalPamProductController().list(nil) or
  // try client.MerchantPortalPamProductController().load(vm(("id", .string("..."))), nil).
  public func MerchantPortalPamProductController(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return MerchantPortalPamProductControllerEntity(self, entopts)
  }

  // OutputAddProduct returns a OutputAddProduct entity bound to this client.
  // Idiomatic usage: try client.OutputAddProduct().list(nil) or
  // try client.OutputAddProduct().load(vm(("id", .string("..."))), nil).
  public func OutputAddProduct(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return OutputAddProductEntity(self, entopts)
  }

  // OutputCreateProduct returns a OutputCreateProduct entity bound to this client.
  // Idiomatic usage: try client.OutputCreateProduct().list(nil) or
  // try client.OutputCreateProduct().load(vm(("id", .string("..."))), nil).
  public func OutputCreateProduct(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return OutputCreateProductEntity(self, entopts)
  }

  // OutputDetail returns a OutputDetail entity bound to this client.
  // Idiomatic usage: try client.OutputDetail().list(nil) or
  // try client.OutputDetail().load(vm(("id", .string("..."))), nil).
  public func OutputDetail(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return OutputDetailEntity(self, entopts)
  }

  // OutputList returns a OutputList entity bound to this client.
  // Idiomatic usage: try client.OutputList().list(nil) or
  // try client.OutputList().load(vm(("id", .string("..."))), nil).
  public func OutputList(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return OutputListEntity(self, entopts)
  }

  // OutputMessage returns a OutputMessage entity bound to this client.
  // Idiomatic usage: try client.OutputMessage().list(nil) or
  // try client.OutputMessage().load(vm(("id", .string("..."))), nil).
  public func OutputMessage(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return OutputMessageEntity(self, entopts)
  }

  // OutputMoveTid returns a OutputMoveTid entity bound to this client.
  // Idiomatic usage: try client.OutputMoveTid().list(nil) or
  // try client.OutputMoveTid().load(vm(("id", .string("..."))), nil).
  public func OutputMoveTid(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return OutputMoveTidEntity(self, entopts)
  }

  // OutputRemoveProduct returns a OutputRemoveProduct entity bound to this client.
  // Idiomatic usage: try client.OutputRemoveProduct().list(nil) or
  // try client.OutputRemoveProduct().load(vm(("id", .string("..."))), nil).
  public func OutputRemoveProduct(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return OutputRemoveProductEntity(self, entopts)
  }

  // OutputStart returns a OutputStart entity bound to this client.
  // Idiomatic usage: try client.OutputStart().list(nil) or
  // try client.OutputStart().load(vm(("id", .string("..."))), nil).
  public func OutputStart(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return OutputStartEntity(self, entopts)
  }

  // OutputStatus returns a OutputStatus entity bound to this client.
  // Idiomatic usage: try client.OutputStatus().list(nil) or
  // try client.OutputStatus().load(vm(("id", .string("..."))), nil).
  public func OutputStatus(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return OutputStatusEntity(self, entopts)
  }

  // OutputUpdateProduct returns a OutputUpdateProduct entity bound to this client.
  // Idiomatic usage: try client.OutputUpdateProduct().list(nil) or
  // try client.OutputUpdateProduct().load(vm(("id", .string("..."))), nil).
  public func OutputUpdateProduct(_ entopts: VMap? = nil) -> BluefinTecsMerchantPortalEntityBase {
    return OutputUpdateProductEntity(self, entopts)
  }


  public static func testSDK(_ testoptsIn: BluefinTecsMerchantPortalSdk.VMap?, _ sdkoptsIn: BluefinTecsMerchantPortalSdk.VMap?) -> BluefinTecsMerchantPortalSDK {
    let sdkopts = clone(.map(sdkoptsIn ?? BluefinTecsMerchantPortalSdk.VMap())).asMap ?? BluefinTecsMerchantPortalSdk.VMap()

    let testopts = clone(.map(testoptsIn ?? BluefinTecsMerchantPortalSdk.VMap())).asMap ?? BluefinTecsMerchantPortalSdk.VMap()
    testopts.entries["active"] = .bool(true)

    _ = setpath(.map(sdkopts), jtp("feature", "test"), .map(testopts))

    let sdk = BluefinTecsMerchantPortalSDK(sdkopts)
    sdk.mode = "test"
    return sdk
  }
}
