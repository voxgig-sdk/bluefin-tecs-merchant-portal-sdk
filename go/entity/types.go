// Typed models for the BluefinTecsMerchantPortal SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import (
	"encoding/json"

	"github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/go/core"
)

// MerchantPortalApiController is the typed data model for the merchant_portal_api_controller entity.
type MerchantPortalApiController struct {
	AccountNumber *int `json:"account_number,omitempty"`
	AdditionalData *map[string]any `json:"additional_data,omitempty"`
	BusinessRegNumber string `json:"business_reg_number"`
	City string `json:"city"`
	Corporateuuid *string `json:"corporateuuid,omitempty"`
	Country string `json:"country"`
	Currency string `json:"currency"`
	MerchantCategoryCode int `json:"merchant_category_code"`
	MerchantEmail *string `json:"merchant_email,omitempty"`
	MerchantName string `json:"merchant_name"`
	MerchantPhoneNumber *string `json:"merchant_phone_number,omitempty"`
	Packageid string `json:"packageid"`
	Packageorderuuid string `json:"packageorderuuid"`
	Password *string `json:"password,omitempty"`
	Productid *string `json:"productid,omitempty"`
	ProductidAcquirer *string `json:"productid_acquirer,omitempty"`
	ReasonDeactivation string `json:"reason_deactivation"`
	ReasonReactivation string `json:"reason_reactivation"`
	SortingCode *int `json:"sorting_code,omitempty"`
	State *string `json:"state,omitempty"`
	Street string `json:"street"`
	TerminalCountryCode string `json:"terminal_country_code"`
	TerminalLanguageCode string `json:"terminal_language_code"`
	TerminalLocation string `json:"terminal_location"`
	TerminalSerialNumber string `json:"terminal_serial_number"`
	Terminalid int `json:"terminalid"`
	TerminalidAcquirer *string `json:"terminalid_acquirer,omitempty"`
	UserEmail *string `json:"user_email,omitempty"`
	UserPhoneNumber *string `json:"user_phone_number,omitempty"`
	Username *string `json:"username,omitempty"`
	VuNummer string `json:"vu_nummer"`
	WebShopUrl *string `json:"web_shop_url,omitempty"`
	Zipcode string `json:"zipcode"`
}

// MerchantPortalApiControllerCreateData is the typed request payload for MerchantPortalApiController.CreateTyped.
type MerchantPortalApiControllerCreateData struct {
	AccountNumber *int `json:"account_number,omitempty"`
	AdditionalData *map[string]any `json:"additional_data,omitempty"`
	BusinessRegNumber string `json:"business_reg_number"`
	City string `json:"city"`
	Corporateuuid *string `json:"corporateuuid,omitempty"`
	Country string `json:"country"`
	Currency string `json:"currency"`
	MerchantCategoryCode int `json:"merchant_category_code"`
	MerchantEmail *string `json:"merchant_email,omitempty"`
	MerchantName string `json:"merchant_name"`
	MerchantPhoneNumber *string `json:"merchant_phone_number,omitempty"`
	Packageid string `json:"packageid"`
	Packageorderuuid string `json:"packageorderuuid"`
	Password *string `json:"password,omitempty"`
	Productid *string `json:"productid,omitempty"`
	ProductidAcquirer *string `json:"productid_acquirer,omitempty"`
	ReasonDeactivation string `json:"reason_deactivation"`
	ReasonReactivation string `json:"reason_reactivation"`
	SortingCode *int `json:"sorting_code,omitempty"`
	State *string `json:"state,omitempty"`
	Street string `json:"street"`
	TerminalCountryCode string `json:"terminal_country_code"`
	TerminalLanguageCode string `json:"terminal_language_code"`
	TerminalLocation string `json:"terminal_location"`
	TerminalSerialNumber string `json:"terminal_serial_number"`
	Terminalid int `json:"terminalid"`
	TerminalidAcquirer *string `json:"terminalid_acquirer,omitempty"`
	UserEmail *string `json:"user_email,omitempty"`
	UserPhoneNumber *string `json:"user_phone_number,omitempty"`
	Username *string `json:"username,omitempty"`
	VuNummer string `json:"vu_nummer"`
	WebShopUrl *string `json:"web_shop_url,omitempty"`
	Zipcode string `json:"zipcode"`
}

// MerchantPortalCommonController is the typed data model for the merchant_portal_common_controller entity.
type MerchantPortalCommonController struct {
}

// MerchantPortalCommonControllerLoadMatch is the typed request payload for MerchantPortalCommonController.LoadTyped.
type MerchantPortalCommonControllerLoadMatch struct {
}

// MerchantPortalPamContractController is the typed data model for the merchant_portal_pam_contract_controller entity.
type MerchantPortalPamContractController struct {
	Language string `json:"language"`
	ProductOrderUUID string `json:"productOrderUUID"`
}

// MerchantPortalPamContractControllerCreateData is the typed request payload for MerchantPortalPamContractController.CreateTyped.
type MerchantPortalPamContractControllerCreateData struct {
	Language string `json:"language"`
	ProductOrderUUID string `json:"productOrderUUID"`
}

// MerchantPortalPamDocumentController is the typed data model for the merchant_portal_pam_document_controller entity.
type MerchantPortalPamDocumentController struct {
	AppFormFieldDescUUID string `json:"appFormFieldDescUUID"`
	PackageOrderUUID *string `json:"packageOrderUUID,omitempty"`
	ProductOrderUUID *string `json:"productOrderUUID,omitempty"`
}

// MerchantPortalPamDocumentControllerCreateData is the typed request payload for MerchantPortalPamDocumentController.CreateTyped.
type MerchantPortalPamDocumentControllerCreateData struct {
	AppFormFieldDescUUID string `json:"appFormFieldDescUUID"`
	PackageOrderUUID *string `json:"packageOrderUUID,omitempty"`
	ProductOrderUUID *string `json:"productOrderUUID,omitempty"`
}

// MerchantPortalPamFormController is the typed data model for the merchant_portal_pam_form_controller entity.
type MerchantPortalPamFormController struct {
	AppFormFieldsDescUUID string `json:"appFormFieldsDescUUID"`
	Filter *map[string]any `json:"filter,omitempty"`
	Language string `json:"language"`
	PackageOrder *map[string]any `json:"packageOrder,omitempty"`
	PackageOrderUUID string `json:"packageOrderUUID"`
	PackageUUID *string `json:"packageUUID,omitempty"`
	ProductOrderUUID *string `json:"productOrderUUID,omitempty"`
	ProductOrders *[]any `json:"productOrders,omitempty"`
	ReasonOfReopening string `json:"reasonOfReopening"`
}

// MerchantPortalPamFormControllerCreateData is the typed request payload for MerchantPortalPamFormController.CreateTyped.
type MerchantPortalPamFormControllerCreateData struct {
	AppFormFieldsDescUUID string `json:"appFormFieldsDescUUID"`
	Filter *map[string]any `json:"filter,omitempty"`
	Language string `json:"language"`
	PackageOrder *map[string]any `json:"packageOrder,omitempty"`
	PackageOrderUUID string `json:"packageOrderUUID"`
	PackageUUID *string `json:"packageUUID,omitempty"`
	ProductOrderUUID *string `json:"productOrderUUID,omitempty"`
	ProductOrders *[]any `json:"productOrders,omitempty"`
	ReasonOfReopening string `json:"reasonOfReopening"`
}

// MerchantPortalPamMandatorController is the typed data model for the merchant_portal_pam_mandator_controller entity.
type MerchantPortalPamMandatorController struct {
	ClientSecret *string `json:"clientSecret,omitempty"`
	MandatorName string `json:"mandatorName"`
	NotificationEmail *string `json:"notificationEmail,omitempty"`
	PackageUUID string `json:"packageUUID"`
}

// MerchantPortalPamMandatorControllerCreateData is the typed request payload for MerchantPortalPamMandatorController.CreateTyped.
type MerchantPortalPamMandatorControllerCreateData struct {
	ClientSecret *string `json:"clientSecret,omitempty"`
	MandatorName string `json:"mandatorName"`
	NotificationEmail *string `json:"notificationEmail,omitempty"`
	PackageUUID string `json:"packageUUID"`
}

// MerchantPortalPamMerchantController is the typed data model for the merchant_portal_pam_merchant_controller entity.
type MerchantPortalPamMerchantController struct {
	AdditionalData *map[string]any `json:"additional_data,omitempty"`
	BusinessRegistrationNumber string `json:"businessRegistrationNumber"`
	City *string `json:"city,omitempty"`
	CompanyName string `json:"companyName"`
	CorporateUUID string `json:"corporateUUID"`
	Country *string `json:"country,omitempty"`
	Currency string `json:"currency"`
	Email string `json:"email"`
	Language string `json:"language"`
	Login string `json:"login"`
	Mandator string `json:"mandator"`
	MerchantContractNumber string `json:"merchantContractNumber"`
	MerchantName *string `json:"merchantName,omitempty"`
	MerchantCategoryCode *string `json:"merchant_category_code,omitempty"`
	PackageUUID *string `json:"packageUUID,omitempty"`
	Packageorderuuid string `json:"packageorderuuid"`
	PhoneNumber string `json:"phoneNumber"`
	PostalCode *string `json:"postalCode,omitempty"`
	ProductidAcquirer string `json:"productid_acquirer"`
	Region *string `json:"region,omitempty"`
	RegistrationNumber *string `json:"registrationNumber,omitempty"`
	Signature *string `json:"signature,omitempty"`
	Street *string `json:"street,omitempty"`
	TerminalIds *[]any `json:"terminalIds,omitempty"`
	TerminalidAcquirer *string `json:"terminalid_acquirer,omitempty"`
	VuNummer string `json:"vu_nummer"`
}

// MerchantPortalPamMerchantControllerCreateData is the typed request payload for MerchantPortalPamMerchantController.CreateTyped.
type MerchantPortalPamMerchantControllerCreateData struct {
	AdditionalData *map[string]any `json:"additional_data,omitempty"`
	BusinessRegistrationNumber string `json:"businessRegistrationNumber"`
	City *string `json:"city,omitempty"`
	CompanyName string `json:"companyName"`
	CorporateUUID string `json:"corporateUUID"`
	Country *string `json:"country,omitempty"`
	Currency string `json:"currency"`
	Email string `json:"email"`
	Language string `json:"language"`
	Login string `json:"login"`
	Mandator string `json:"mandator"`
	MerchantContractNumber string `json:"merchantContractNumber"`
	MerchantName *string `json:"merchantName,omitempty"`
	MerchantCategoryCode *string `json:"merchant_category_code,omitempty"`
	PackageUUID *string `json:"packageUUID,omitempty"`
	Packageorderuuid string `json:"packageorderuuid"`
	PhoneNumber string `json:"phoneNumber"`
	PostalCode *string `json:"postalCode,omitempty"`
	ProductidAcquirer string `json:"productid_acquirer"`
	Region *string `json:"region,omitempty"`
	RegistrationNumber *string `json:"registrationNumber,omitempty"`
	Signature *string `json:"signature,omitempty"`
	Street *string `json:"street,omitempty"`
	TerminalIds *[]any `json:"terminalIds,omitempty"`
	TerminalidAcquirer *string `json:"terminalid_acquirer,omitempty"`
	VuNummer string `json:"vu_nummer"`
}

// MerchantPortalPamPackageController is the typed data model for the merchant_portal_pam_package_controller entity.
type MerchantPortalPamPackageController struct {
	ConsumerUUID *string `json:"consumerUUID,omitempty"`
	CorporateUUID *string `json:"corporateUUID,omitempty"`
	Country *string `json:"country,omitempty"`
	DescriptionKey *string `json:"descriptionKey,omitempty"`
	Filter *map[string]any `json:"filter,omitempty"`
	Language string `json:"language"`
	NameKey *string `json:"nameKey,omitempty"`
	PackageStatus *string `json:"packageStatus,omitempty"`
	PackageUUID string `json:"packageUUID"`
	Pagination *map[string]any `json:"pagination,omitempty"`
	Sorting *map[string]any `json:"sorting,omitempty"`
}

// MerchantPortalPamPackageControllerCreateData is the typed request payload for MerchantPortalPamPackageController.CreateTyped.
type MerchantPortalPamPackageControllerCreateData struct {
	ConsumerUUID *string `json:"consumerUUID,omitempty"`
	CorporateUUID *string `json:"corporateUUID,omitempty"`
	Country *string `json:"country,omitempty"`
	DescriptionKey *string `json:"descriptionKey,omitempty"`
	Filter *map[string]any `json:"filter,omitempty"`
	Language string `json:"language"`
	NameKey *string `json:"nameKey,omitempty"`
	PackageStatus *string `json:"packageStatus,omitempty"`
	PackageUUID string `json:"packageUUID"`
	Pagination *map[string]any `json:"pagination,omitempty"`
	Sorting *map[string]any `json:"sorting,omitempty"`
}

// MerchantPortalPamProductController is the typed data model for the merchant_portal_pam_product_controller entity.
type MerchantPortalPamProductController struct {
	ConsumerUUID *string `json:"consumerUUID,omitempty"`
	Filter *map[string]any `json:"filter,omitempty"`
	Language *string `json:"language,omitempty"`
	MerchantID *string `json:"merchantID,omitempty"`
	PackageOrderUUID string `json:"packageOrderUUID"`
	Pagination *map[string]any `json:"pagination,omitempty"`
	ProductOrderUUID string `json:"productOrderUUID"`
	ProductUUID string `json:"productUUID"`
	ReasonDecline string `json:"reason_decline"`
	Sorting *map[string]any `json:"sorting,omitempty"`
}

// MerchantPortalPamProductControllerCreateData is the typed request payload for MerchantPortalPamProductController.CreateTyped.
type MerchantPortalPamProductControllerCreateData struct {
	ConsumerUUID *string `json:"consumerUUID,omitempty"`
	Filter *map[string]any `json:"filter,omitempty"`
	Language *string `json:"language,omitempty"`
	MerchantID *string `json:"merchantID,omitempty"`
	PackageOrderUUID string `json:"packageOrderUUID"`
	Pagination *map[string]any `json:"pagination,omitempty"`
	ProductOrderUUID string `json:"productOrderUUID"`
	ProductUUID string `json:"productUUID"`
	ReasonDecline string `json:"reason_decline"`
	Sorting *map[string]any `json:"sorting,omitempty"`
}

// OutputAddProduct is the typed data model for the output_add_product entity.
type OutputAddProduct struct {
	PackageUUID string `json:"packageUUID"`
	ProductUUIDs []any `json:"productUUIDs"`
	ResponseCode int `json:"responseCode"`
	ResponseMessage string `json:"responseMessage"`
}

// OutputAddProductCreateData is the typed request payload for OutputAddProduct.CreateTyped.
type OutputAddProductCreateData struct {
	PackageUUID string `json:"packageUUID"`
	ProductUUIDs []any `json:"productUUIDs"`
	ResponseCode int `json:"responseCode"`
	ResponseMessage string `json:"responseMessage"`
}

// OutputCreateProduct is the typed data model for the output_create_product entity.
type OutputCreateProduct struct {
	AcquirerId *string `json:"acquirerId,omitempty"`
	AllowMultipleOrders bool `json:"allowMultipleOrders"`
	AppFormTemplateName string `json:"appFormTemplateName"`
	ContractNeeded bool `json:"contractNeeded"`
	CredentialsNeeded *bool `json:"credentialsNeeded,omitempty"`
	DescriptionKey string `json:"descriptionKey"`
	NameKey string `json:"nameKey"`
	PrescreeningAllowed bool `json:"prescreeningAllowed"`
	ProductName string `json:"productName"`
	ResponseCode int `json:"responseCode"`
	ResponseMessage string `json:"responseMessage"`
	TerminalTemplateName string `json:"terminalTemplateName"`
	VendorName string `json:"vendorName"`
	XmlTemplateFile string `json:"xmlTemplateFile"`
}

// OutputCreateProductCreateData is the typed request payload for OutputCreateProduct.CreateTyped.
type OutputCreateProductCreateData struct {
	AcquirerId *string `json:"acquirerId,omitempty"`
	AllowMultipleOrders bool `json:"allowMultipleOrders"`
	AppFormTemplateName string `json:"appFormTemplateName"`
	ContractNeeded bool `json:"contractNeeded"`
	CredentialsNeeded *bool `json:"credentialsNeeded,omitempty"`
	DescriptionKey string `json:"descriptionKey"`
	NameKey string `json:"nameKey"`
	PrescreeningAllowed bool `json:"prescreeningAllowed"`
	ProductName string `json:"productName"`
	ResponseCode int `json:"responseCode"`
	ResponseMessage string `json:"responseMessage"`
	TerminalTemplateName string `json:"terminalTemplateName"`
	VendorName string `json:"vendorName"`
	XmlTemplateFile string `json:"xmlTemplateFile"`
}

// OutputDetail is the typed data model for the output_detail entity.
type OutputDetail struct {
	Batch *map[string]any `json:"batch,omitempty"`
	Lines *map[string]any `json:"lines,omitempty"`
	Progress *map[string]any `json:"progress,omitempty"`
}

// OutputDetailLoadMatch is the typed request payload for OutputDetail.LoadTyped.
type OutputDetailLoadMatch struct {
	Id string `json:"id"`
}

// OutputList is the typed data model for the output_list entity.
type OutputList struct {
	Items *[]any `json:"items,omitempty"`
	Pagination map[string]any `json:"pagination"`
	ResponseCode int `json:"responseCode"`
	ResponseMessage string `json:"responseMessage"`
	Sorting *map[string]any `json:"sorting,omitempty"`
}

// OutputListCreateData is the typed request payload for OutputList.CreateTyped.
type OutputListCreateData struct {
	Items *[]any `json:"items,omitempty"`
	Pagination map[string]any `json:"pagination"`
	ResponseCode int `json:"responseCode"`
	ResponseMessage string `json:"responseMessage"`
	Sorting *map[string]any `json:"sorting,omitempty"`
}

// OutputMessage is the typed data model for the output_message entity.
type OutputMessage struct {
	ResponseCode int `json:"responseCode"`
	ResponseMessage string `json:"responseMessage"`
}

// OutputMessageLoadMatch is the typed request payload for OutputMessage.LoadTyped.
type OutputMessageLoadMatch struct {
	Id string `json:"id"`
}

// OutputMoveTid is the typed data model for the output_move_tid entity.
type OutputMoveTid struct {
	ProductOrderUUIDs []any `json:"productOrderUUIDs"`
	ResponseCode int `json:"responseCode"`
	ResponseMessage string `json:"responseMessage"`
	TargetPackageOrderUUID string `json:"targetPackageOrderUUID"`
	TargetProductOrderUUID string `json:"targetProductOrderUUID"`
}

// OutputMoveTidCreateData is the typed request payload for OutputMoveTid.CreateTyped.
type OutputMoveTidCreateData struct {
	ProductOrderUUIDs []any `json:"productOrderUUIDs"`
	ResponseCode int `json:"responseCode"`
	ResponseMessage string `json:"responseMessage"`
	TargetPackageOrderUUID string `json:"targetPackageOrderUUID"`
	TargetProductOrderUUID string `json:"targetProductOrderUUID"`
}

// OutputRemoveProduct is the typed data model for the output_remove_product entity.
type OutputRemoveProduct struct {
	PackageUUID string `json:"packageUUID"`
	ProductUUIDs []any `json:"productUUIDs"`
	ResponseCode int `json:"responseCode"`
	ResponseMessage string `json:"responseMessage"`
}

// OutputRemoveProductCreateData is the typed request payload for OutputRemoveProduct.CreateTyped.
type OutputRemoveProductCreateData struct {
	PackageUUID string `json:"packageUUID"`
	ProductUUIDs []any `json:"productUUIDs"`
	ResponseCode int `json:"responseCode"`
	ResponseMessage string `json:"responseMessage"`
}

// OutputStart is the typed data model for the output_start entity.
type OutputStart struct {
	Id *string `json:"id,omitempty"`
	ResponseCode int `json:"responseCode"`
	ResponseMessage string `json:"responseMessage"`
}

// OutputStartCreateData is the typed request payload for OutputStart.CreateTyped.
type OutputStartCreateData struct {
	Id *string `json:"id,omitempty"`
	ResponseCode int `json:"responseCode"`
	ResponseMessage string `json:"responseMessage"`
}

// OutputStatus is the typed data model for the output_status entity.
type OutputStatus struct {
	Percentage *int `json:"percentage,omitempty"`
	ResponseCode int `json:"responseCode"`
	ResponseMessage string `json:"responseMessage"`
	Status *string `json:"status,omitempty"`
}

// OutputStatusLoadMatch is the typed request payload for OutputStatus.LoadTyped.
type OutputStatusLoadMatch struct {
	Id string `json:"id"`
}

// OutputUpdateProduct is the typed data model for the output_update_product entity.
type OutputUpdateProduct struct {
	AllowMultipleOrders *bool `json:"allowMultipleOrders,omitempty"`
	AppFormName *string `json:"appFormName,omitempty"`
	ContractNeeded *bool `json:"contractNeeded,omitempty"`
	CredentialsNeeded *bool `json:"credentialsNeeded,omitempty"`
	DescriptionKey *string `json:"descriptionKey,omitempty"`
	NameKey *string `json:"nameKey,omitempty"`
	PrescreeningAllowed *bool `json:"prescreeningAllowed,omitempty"`
	ProductName *string `json:"productName,omitempty"`
	ProductStatus *string `json:"productStatus,omitempty"`
	ProductUUID string `json:"productUUID"`
	ResponseCode int `json:"responseCode"`
	ResponseMessage string `json:"responseMessage"`
	VendorName *string `json:"vendorName,omitempty"`
}

// OutputUpdateProductCreateData is the typed request payload for OutputUpdateProduct.CreateTyped.
type OutputUpdateProductCreateData struct {
	AllowMultipleOrders *bool `json:"allowMultipleOrders,omitempty"`
	AppFormName *string `json:"appFormName,omitempty"`
	ContractNeeded *bool `json:"contractNeeded,omitempty"`
	CredentialsNeeded *bool `json:"credentialsNeeded,omitempty"`
	DescriptionKey *string `json:"descriptionKey,omitempty"`
	NameKey *string `json:"nameKey,omitempty"`
	PrescreeningAllowed *bool `json:"prescreeningAllowed,omitempty"`
	ProductName *string `json:"productName,omitempty"`
	ProductStatus *string `json:"productStatus,omitempty"`
	ProductUUID string `json:"productUUID"`
	ResponseCode int `json:"responseCode"`
	ResponseMessage string `json:"responseMessage"`
	VendorName *string `json:"vendorName,omitempty"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// entityData unwraps an entity to its data map.
//
// Operations resolve to the ENTITY, not the raw data (see AGENTS.md), and an
// entity's fields are UNEXPORTED — marshalling one directly yields `{}`, so
// every typed accessor would silently hand back a zero-valued struct. The
// typed boundary therefore takes the data hop first.
func entityData(v any) any {
	if ent, ok := v.(core.Entity); ok {
		return ent.Data()
	}
	return v
}

// typedFrom decodes a runtime value (an entity, or the map[string]any the op
// pipeline produced) into a typed model T via a JSON round-trip. On any error
// it returns the zero value of T; the op's own (value, error) tuple carries
// the real error.
func typedFrom[T any](v any) T {
	var out T
	v = entityData(v)
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value into a typed slice []T via a
// JSON round-trip, for list ops. `list` resolves to a slice of ENTITY
// instances, so each element takes the data hop.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	if list, ok := v.([]any); ok {
		unwrapped := make([]any, 0, len(list))
		for _, item := range list {
			unwrapped = append(unwrapped, entityData(item))
		}
		v = unwrapped
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
