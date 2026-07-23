package core

import (
	"fmt"

	vs "github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/go/utility/struct"
)

type BluefinTecsMerchantPortalSDK struct {
	Mode     string
	options  map[string]any
	utility  *Utility
	Features []Feature
	rootctx  *Context
}

func NewBluefinTecsMerchantPortalSDK(options map[string]any) *BluefinTecsMerchantPortalSDK {
	sdk := &BluefinTecsMerchantPortalSDK{
		Mode:     "live",
		Features: []Feature{},
	}

	sdk.utility = NewUtility()

	config := MakeConfig()

	sdk.rootctx = sdk.utility.MakeContext(map[string]any{
		"client":  sdk,
		"utility": sdk.utility,
		"config":  config,
		"options": options,
		"shared":  map[string]any{},
	}, nil)

	sdk.options = sdk.utility.MakeOptions(sdk.rootctx)

	if vs.GetPath([]any{"feature", "test", "active"}, sdk.options) == true {
		sdk.Mode = "test"
	}

	sdk.rootctx.Options = sdk.options

	// Add features in the resolved order (MakeOptions puts an explicit array
	// order first, else defaults to test-first). Ordering matters: the `test`
	// feature installs the base mock transport and the transport features
	// (retry/cache/netsim/proxy/ratelimit) wrap whatever is current, so `test`
	// must be added before them to sit at the base of the chain.
	featureOpts := ToMapAny(vs.GetProp(sdk.options, "feature"))
	if featureOpts != nil {
		if fo, ok := vs.GetPath([]any{"__derived__", "featureorder"}, sdk.options).([]any); ok {
			for _, n := range fo {
				fname, _ := n.(string)
				fopts := ToMapAny(featureOpts[fname])
				if fopts != nil {
					if active, ok := fopts["active"]; ok {
						if ab, ok := active.(bool); ok && ab {
							sdk.utility.FeatureAdd(sdk.rootctx, makeFeature(fname))
						}
					}
				}
			}
		}
	}

	// Add extension features.
	if extend := vs.GetProp(sdk.options, "extend"); extend != nil {
		if extList, ok := extend.([]any); ok {
			for _, f := range extList {
				if feat, ok := f.(Feature); ok {
					sdk.utility.FeatureAdd(sdk.rootctx, feat)
				}
			}
		}
	}

	// Initialize features.
	for _, f := range sdk.Features {
		sdk.utility.FeatureInit(sdk.rootctx, f)
	}

	sdk.utility.FeatureHook(sdk.rootctx, "PostConstruct")

	return sdk
}

func (sdk *BluefinTecsMerchantPortalSDK) OptionsMap() map[string]any {
	out := vs.Clone(sdk.options)
	if om, ok := out.(map[string]any); ok {
		return om
	}
	return map[string]any{}
}

func (sdk *BluefinTecsMerchantPortalSDK) GetUtility() *Utility {
	return CopyUtility(sdk.utility)
}

func (sdk *BluefinTecsMerchantPortalSDK) GetRootCtx() *Context {
	return sdk.rootctx
}

func (sdk *BluefinTecsMerchantPortalSDK) Prepare(fetchargs map[string]any) (map[string]any, error) {
	utility := sdk.utility

	if fetchargs == nil {
		fetchargs = map[string]any{}
	}

	var ctrl map[string]any
	if c := vs.GetProp(fetchargs, "ctrl"); c != nil {
		if cm, ok := c.(map[string]any); ok {
			ctrl = cm
		}
	}
	if ctrl == nil {
		ctrl = map[string]any{}
	}

	ctx := utility.MakeContext(map[string]any{
		"opname": "prepare",
		"ctrl":   ctrl,
	}, sdk.rootctx)

	options := sdk.options

	path, _ := vs.GetProp(fetchargs, "path").(string)
	method, _ := vs.GetProp(fetchargs, "method").(string)
	if method == "" {
		method = "GET"
	}

	params := ToMapAny(vs.GetProp(fetchargs, "params"))
	if params == nil {
		params = map[string]any{}
	}
	query := ToMapAny(vs.GetProp(fetchargs, "query"))
	if query == nil {
		query = map[string]any{}
	}

	headers := utility.PrepareHeaders(ctx)

	base, _ := vs.GetProp(options, "base").(string)
	prefix, _ := vs.GetProp(options, "prefix").(string)
	suffix, _ := vs.GetProp(options, "suffix").(string)

	ctx.Spec = NewSpec(map[string]any{
		"base":    base,
		"prefix":  prefix,
		"suffix":  suffix,
		"path":    path,
		"method":  method,
		"params":  params,
		"query":   query,
		"headers": headers,
		"body":    vs.GetProp(fetchargs, "body"),
		"step":    "start",
	})

	// Merge user-provided headers.
	if uh := vs.GetProp(fetchargs, "headers"); uh != nil {
		if uhm, ok := uh.(map[string]any); ok {
			for k, v := range uhm {
				ctx.Spec.Headers[k] = v
			}
		}
	}

	_, err := utility.PrepareAuth(ctx)
	if err != nil {
		return nil, err
	}

	return utility.MakeFetchDef(ctx)
}

func (sdk *BluefinTecsMerchantPortalSDK) Direct(fetchargs map[string]any) (map[string]any, error) {
	utility := sdk.utility

	fetchdef, err := sdk.Prepare(fetchargs)
	if err != nil {
		return map[string]any{"ok": false, "err": err}, nil
	}

	if fetchargs == nil {
		fetchargs = map[string]any{}
	}

	var ctrl map[string]any
	if c := vs.GetProp(fetchargs, "ctrl"); c != nil {
		if cm, ok := c.(map[string]any); ok {
			ctrl = cm
		}
	}
	if ctrl == nil {
		ctrl = map[string]any{}
	}

	ctx := utility.MakeContext(map[string]any{
		"opname": "direct",
		"ctrl":   ctrl,
	}, sdk.rootctx)

	url, _ := fetchdef["url"].(string)
	fetched, fetchErr := utility.Fetcher(ctx, url, fetchdef)

	if fetchErr != nil {
		return map[string]any{"ok": false, "err": fetchErr}, nil
	}

	if fetched == nil {
		return map[string]any{
			"ok":  false,
			"err": ctx.MakeError("direct_no_response", "response: undefined"),
		}, nil
	}

	if fm, ok := fetched.(map[string]any); ok {
		status := ToInt(vs.GetProp(fm, "status"))
		headers := vs.GetProp(fm, "headers")

		// No-body responses (204, 304) and explicit zero content-length
		// must skip JSON parsing — calling json() on an empty body errors.
		var contentLength string
		if hm, ok := headers.(map[string]any); ok {
			if cl, ok := hm["content-length"]; ok {
				contentLength = fmt.Sprintf("%v", cl)
			}
		}
		noBody := status == 204 || status == 304 || contentLength == "0"

		var jsonData any
		if !noBody {
			if jf := vs.GetProp(fm, "json"); jf != nil {
				if f, ok := jf.(func() any); ok {
					// f() returns nil on parse error in our fetcher.
					jsonData = f()
				}
			}
		}

		return map[string]any{
			"ok":      status >= 200 && status < 300,
			"status":  status,
			"headers": headers,
			"data":    jsonData,
		}, nil
	}

	return map[string]any{"ok": false, "err": ctx.MakeError("direct_invalid", "invalid response type")}, nil
}


// MerchantPortalApiController returns a MerchantPortalApiController entity bound to this client.
// Idiomatic usage: client.MerchantPortalApiController(nil).List(nil, nil) or
// client.MerchantPortalApiController(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) MerchantPortalApiController(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewMerchantPortalApiControllerEntityFunc(sdk, data)
}


// MerchantPortalCommonController returns a MerchantPortalCommonController entity bound to this client.
// Idiomatic usage: client.MerchantPortalCommonController(nil).List(nil, nil) or
// client.MerchantPortalCommonController(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) MerchantPortalCommonController(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewMerchantPortalCommonControllerEntityFunc(sdk, data)
}


// MerchantPortalPamContractController returns a MerchantPortalPamContractController entity bound to this client.
// Idiomatic usage: client.MerchantPortalPamContractController(nil).List(nil, nil) or
// client.MerchantPortalPamContractController(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) MerchantPortalPamContractController(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewMerchantPortalPamContractControllerEntityFunc(sdk, data)
}


// MerchantPortalPamDocumentController returns a MerchantPortalPamDocumentController entity bound to this client.
// Idiomatic usage: client.MerchantPortalPamDocumentController(nil).List(nil, nil) or
// client.MerchantPortalPamDocumentController(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) MerchantPortalPamDocumentController(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewMerchantPortalPamDocumentControllerEntityFunc(sdk, data)
}


// MerchantPortalPamFormController returns a MerchantPortalPamFormController entity bound to this client.
// Idiomatic usage: client.MerchantPortalPamFormController(nil).List(nil, nil) or
// client.MerchantPortalPamFormController(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) MerchantPortalPamFormController(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewMerchantPortalPamFormControllerEntityFunc(sdk, data)
}


// MerchantPortalPamMandatorController returns a MerchantPortalPamMandatorController entity bound to this client.
// Idiomatic usage: client.MerchantPortalPamMandatorController(nil).List(nil, nil) or
// client.MerchantPortalPamMandatorController(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) MerchantPortalPamMandatorController(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewMerchantPortalPamMandatorControllerEntityFunc(sdk, data)
}


// MerchantPortalPamMerchantController returns a MerchantPortalPamMerchantController entity bound to this client.
// Idiomatic usage: client.MerchantPortalPamMerchantController(nil).List(nil, nil) or
// client.MerchantPortalPamMerchantController(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) MerchantPortalPamMerchantController(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewMerchantPortalPamMerchantControllerEntityFunc(sdk, data)
}


// MerchantPortalPamPackageController returns a MerchantPortalPamPackageController entity bound to this client.
// Idiomatic usage: client.MerchantPortalPamPackageController(nil).List(nil, nil) or
// client.MerchantPortalPamPackageController(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) MerchantPortalPamPackageController(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewMerchantPortalPamPackageControllerEntityFunc(sdk, data)
}


// MerchantPortalPamProductController returns a MerchantPortalPamProductController entity bound to this client.
// Idiomatic usage: client.MerchantPortalPamProductController(nil).List(nil, nil) or
// client.MerchantPortalPamProductController(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) MerchantPortalPamProductController(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewMerchantPortalPamProductControllerEntityFunc(sdk, data)
}


// OutputAddProduct returns a OutputAddProduct entity bound to this client.
// Idiomatic usage: client.OutputAddProduct(nil).List(nil, nil) or
// client.OutputAddProduct(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) OutputAddProduct(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewOutputAddProductEntityFunc(sdk, data)
}


// OutputCreateProduct returns a OutputCreateProduct entity bound to this client.
// Idiomatic usage: client.OutputCreateProduct(nil).List(nil, nil) or
// client.OutputCreateProduct(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) OutputCreateProduct(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewOutputCreateProductEntityFunc(sdk, data)
}


// OutputDetail returns a OutputDetail entity bound to this client.
// Idiomatic usage: client.OutputDetail(nil).List(nil, nil) or
// client.OutputDetail(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) OutputDetail(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewOutputDetailEntityFunc(sdk, data)
}


// OutputList returns a OutputList entity bound to this client.
// Idiomatic usage: client.OutputList(nil).List(nil, nil) or
// client.OutputList(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) OutputList(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewOutputListEntityFunc(sdk, data)
}


// OutputMessage returns a OutputMessage entity bound to this client.
// Idiomatic usage: client.OutputMessage(nil).List(nil, nil) or
// client.OutputMessage(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) OutputMessage(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewOutputMessageEntityFunc(sdk, data)
}


// OutputMoveTid returns a OutputMoveTid entity bound to this client.
// Idiomatic usage: client.OutputMoveTid(nil).List(nil, nil) or
// client.OutputMoveTid(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) OutputMoveTid(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewOutputMoveTidEntityFunc(sdk, data)
}


// OutputRemoveProduct returns a OutputRemoveProduct entity bound to this client.
// Idiomatic usage: client.OutputRemoveProduct(nil).List(nil, nil) or
// client.OutputRemoveProduct(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) OutputRemoveProduct(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewOutputRemoveProductEntityFunc(sdk, data)
}


// OutputStart returns a OutputStart entity bound to this client.
// Idiomatic usage: client.OutputStart(nil).List(nil, nil) or
// client.OutputStart(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) OutputStart(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewOutputStartEntityFunc(sdk, data)
}


// OutputStatus returns a OutputStatus entity bound to this client.
// Idiomatic usage: client.OutputStatus(nil).List(nil, nil) or
// client.OutputStatus(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) OutputStatus(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewOutputStatusEntityFunc(sdk, data)
}


// OutputUpdateProduct returns a OutputUpdateProduct entity bound to this client.
// Idiomatic usage: client.OutputUpdateProduct(nil).List(nil, nil) or
// client.OutputUpdateProduct(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *BluefinTecsMerchantPortalSDK) OutputUpdateProduct(data map[string]any) BluefinTecsMerchantPortalEntity {
	return NewOutputUpdateProductEntityFunc(sdk, data)
}



func TestSDK(testopts map[string]any, sdkopts map[string]any) *BluefinTecsMerchantPortalSDK {
	if sdkopts == nil {
		sdkopts = map[string]any{}
	}
	sdkopts = vs.Clone(sdkopts).(map[string]any)

	if testopts == nil {
		testopts = map[string]any{}
	}
	testopts = vs.Clone(testopts).(map[string]any)
	testopts["active"] = true

	vs.SetPath(sdkopts, []any{"feature", "test"}, testopts)

	sdk := NewBluefinTecsMerchantPortalSDK(sdkopts)
	sdk.Mode = "test"

	return sdk
}
