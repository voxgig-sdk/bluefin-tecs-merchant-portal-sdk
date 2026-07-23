package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewMerchantPortalApiControllerEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewMerchantPortalCommonControllerEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewMerchantPortalPamContractControllerEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewMerchantPortalPamDocumentControllerEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewMerchantPortalPamFormControllerEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewMerchantPortalPamMandatorControllerEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewMerchantPortalPamMerchantControllerEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewMerchantPortalPamPackageControllerEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewMerchantPortalPamProductControllerEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewOutputAddProductEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewOutputCreateProductEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewOutputDetailEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewOutputListEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewOutputMessageEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewOutputMoveTidEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewOutputRemoveProductEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewOutputStartEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewOutputStatusEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

var NewOutputUpdateProductEntityFunc func(client *BluefinTecsMerchantPortalSDK, entopts map[string]any) BluefinTecsMerchantPortalEntity

