package voxgigbluefintecsmerchantportalsdk

import (
	"github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/go/core"
	"github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/go/entity"
	"github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/go/feature"
	_ "github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/go/utility"
)

// Type aliases preserve external API.
type BluefinTecsMerchantPortalSDK = core.BluefinTecsMerchantPortalSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type BluefinTecsMerchantPortalEntity = core.BluefinTecsMerchantPortalEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type BluefinTecsMerchantPortalError = core.BluefinTecsMerchantPortalError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewAuditFeatureFunc = func() core.Feature {
		return feature.NewAuditFeature()
	}
	core.NewClienttrackFeatureFunc = func() core.Feature {
		return feature.NewClienttrackFeature()
	}
	core.NewDebugFeatureFunc = func() core.Feature {
		return feature.NewDebugFeature()
	}
	core.NewIdempotencyFeatureFunc = func() core.Feature {
		return feature.NewIdempotencyFeature()
	}
	core.NewLogFeatureFunc = func() core.Feature {
		return feature.NewLogFeature()
	}
	core.NewMetricsFeatureFunc = func() core.Feature {
		return feature.NewMetricsFeature()
	}
	core.NewPagingFeatureFunc = func() core.Feature {
		return feature.NewPagingFeature()
	}
	core.NewRatelimitFeatureFunc = func() core.Feature {
		return feature.NewRatelimitFeature()
	}
	core.NewRetryFeatureFunc = func() core.Feature {
		return feature.NewRetryFeature()
	}
	core.NewTelemetryFeatureFunc = func() core.Feature {
		return feature.NewTelemetryFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewTimeoutFeatureFunc = func() core.Feature {
		return feature.NewTimeoutFeature()
	}
	core.NewMerchantPortalApiControllerEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewMerchantPortalApiControllerEntity(client, entopts)
	}
	core.NewMerchantPortalCommonControllerEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewMerchantPortalCommonControllerEntity(client, entopts)
	}
	core.NewMerchantPortalPamContractControllerEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewMerchantPortalPamContractControllerEntity(client, entopts)
	}
	core.NewMerchantPortalPamDocumentControllerEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewMerchantPortalPamDocumentControllerEntity(client, entopts)
	}
	core.NewMerchantPortalPamFormControllerEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewMerchantPortalPamFormControllerEntity(client, entopts)
	}
	core.NewMerchantPortalPamMandatorControllerEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewMerchantPortalPamMandatorControllerEntity(client, entopts)
	}
	core.NewMerchantPortalPamMerchantControllerEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewMerchantPortalPamMerchantControllerEntity(client, entopts)
	}
	core.NewMerchantPortalPamPackageControllerEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewMerchantPortalPamPackageControllerEntity(client, entopts)
	}
	core.NewMerchantPortalPamProductControllerEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewMerchantPortalPamProductControllerEntity(client, entopts)
	}
	core.NewOutputAddProductEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewOutputAddProductEntity(client, entopts)
	}
	core.NewOutputCreateProductEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewOutputCreateProductEntity(client, entopts)
	}
	core.NewOutputDetailEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewOutputDetailEntity(client, entopts)
	}
	core.NewOutputListEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewOutputListEntity(client, entopts)
	}
	core.NewOutputMessageEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewOutputMessageEntity(client, entopts)
	}
	core.NewOutputMoveTidEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewOutputMoveTidEntity(client, entopts)
	}
	core.NewOutputRemoveProductEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewOutputRemoveProductEntity(client, entopts)
	}
	core.NewOutputStartEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewOutputStartEntity(client, entopts)
	}
	core.NewOutputStatusEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewOutputStatusEntity(client, entopts)
	}
	core.NewOutputUpdateProductEntityFunc = func(client *core.BluefinTecsMerchantPortalSDK, entopts map[string]any) core.BluefinTecsMerchantPortalEntity {
		return entity.NewOutputUpdateProductEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewBluefinTecsMerchantPortalSDK = core.NewBluefinTecsMerchantPortalSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var SharedConfig = core.SharedConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewBluefinTecsMerchantPortalSDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *BluefinTecsMerchantPortalSDK  { return NewBluefinTecsMerchantPortalSDK(nil) }
func Test() *BluefinTecsMerchantPortalSDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewAuditFeature = feature.NewAuditFeature
var NewClienttrackFeature = feature.NewClienttrackFeature
var NewDebugFeature = feature.NewDebugFeature
var NewIdempotencyFeature = feature.NewIdempotencyFeature
var NewLogFeature = feature.NewLogFeature
var NewMetricsFeature = feature.NewMetricsFeature
var NewPagingFeature = feature.NewPagingFeature
var NewRatelimitFeature = feature.NewRatelimitFeature
var NewRetryFeature = feature.NewRetryFeature
var NewTelemetryFeature = feature.NewTelemetryFeature
var NewTestFeature = feature.NewTestFeature
var NewTimeoutFeature = feature.NewTimeoutFeature
