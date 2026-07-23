// Typed models for the BluefinTecsMerchantPortal SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

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
	ProductOrderUuid string `json:"product_order_uuid"`
}

// MerchantPortalPamContractControllerCreateData is the typed request payload for MerchantPortalPamContractController.CreateTyped.
type MerchantPortalPamContractControllerCreateData struct {
	Language string `json:"language"`
	ProductOrderUuid string `json:"product_order_uuid"`
}

// MerchantPortalPamDocumentController is the typed data model for the merchant_portal_pam_document_controller entity.
type MerchantPortalPamDocumentController struct {
	AppFormFieldDescUuid string `json:"app_form_field_desc_uuid"`
	PackageOrderUuid *string `json:"package_order_uuid,omitempty"`
	ProductOrderUuid *string `json:"product_order_uuid,omitempty"`
}

// MerchantPortalPamDocumentControllerCreateData is the typed request payload for MerchantPortalPamDocumentController.CreateTyped.
type MerchantPortalPamDocumentControllerCreateData struct {
	AppFormFieldDescUuid string `json:"app_form_field_desc_uuid"`
	PackageOrderUuid *string `json:"package_order_uuid,omitempty"`
	ProductOrderUuid *string `json:"product_order_uuid,omitempty"`
}

// MerchantPortalPamFormController is the typed data model for the merchant_portal_pam_form_controller entity.
type MerchantPortalPamFormController struct {
	AppFormFieldsDescUuid string `json:"app_form_fields_desc_uuid"`
	Filter *map[string]any `json:"filter,omitempty"`
	Language string `json:"language"`
	PackageOrder *map[string]any `json:"package_order,omitempty"`
	PackageOrderUuid string `json:"package_order_uuid"`
	PackageUuid *string `json:"package_uuid,omitempty"`
	ProductOrder *[]any `json:"product_order,omitempty"`
	ProductOrderUuid *string `json:"product_order_uuid,omitempty"`
	ReasonOfReopening string `json:"reason_of_reopening"`
}

// MerchantPortalPamFormControllerCreateData is the typed request payload for MerchantPortalPamFormController.CreateTyped.
type MerchantPortalPamFormControllerCreateData struct {
	AppFormFieldsDescUuid string `json:"app_form_fields_desc_uuid"`
	Filter *map[string]any `json:"filter,omitempty"`
	Language string `json:"language"`
	PackageOrder *map[string]any `json:"package_order,omitempty"`
	PackageOrderUuid string `json:"package_order_uuid"`
	PackageUuid *string `json:"package_uuid,omitempty"`
	ProductOrder *[]any `json:"product_order,omitempty"`
	ProductOrderUuid *string `json:"product_order_uuid,omitempty"`
	ReasonOfReopening string `json:"reason_of_reopening"`
}

// MerchantPortalPamMandatorController is the typed data model for the merchant_portal_pam_mandator_controller entity.
type MerchantPortalPamMandatorController struct {
	ClientSecret *string `json:"client_secret,omitempty"`
	MandatorName string `json:"mandator_name"`
	NotificationEmail *string `json:"notification_email,omitempty"`
	PackageUuid string `json:"package_uuid"`
}

// MerchantPortalPamMandatorControllerCreateData is the typed request payload for MerchantPortalPamMandatorController.CreateTyped.
type MerchantPortalPamMandatorControllerCreateData struct {
	ClientSecret *string `json:"client_secret,omitempty"`
	MandatorName string `json:"mandator_name"`
	NotificationEmail *string `json:"notification_email,omitempty"`
	PackageUuid string `json:"package_uuid"`
}

// MerchantPortalPamMerchantController is the typed data model for the merchant_portal_pam_merchant_controller entity.
type MerchantPortalPamMerchantController struct {
	AdditionalData *map[string]any `json:"additional_data,omitempty"`
	BusinessRegistrationNumber string `json:"business_registration_number"`
	City *string `json:"city,omitempty"`
	CompanyName string `json:"company_name"`
	CorporateUuid string `json:"corporate_uuid"`
	Country *string `json:"country,omitempty"`
	Currency string `json:"currency"`
	Email string `json:"email"`
	Language string `json:"language"`
	Login string `json:"login"`
	Mandator string `json:"mandator"`
	MerchantCategoryCode *string `json:"merchant_category_code,omitempty"`
	MerchantContractNumber string `json:"merchant_contract_number"`
	MerchantName *string `json:"merchant_name,omitempty"`
	PackageUuid *string `json:"package_uuid,omitempty"`
	Packageorderuuid string `json:"packageorderuuid"`
	PhoneNumber string `json:"phone_number"`
	PostalCode *string `json:"postal_code,omitempty"`
	ProductidAcquirer string `json:"productid_acquirer"`
	Region *string `json:"region,omitempty"`
	RegistrationNumber *string `json:"registration_number,omitempty"`
	Signature *string `json:"signature,omitempty"`
	Street *string `json:"street,omitempty"`
	TerminalId *[]any `json:"terminal_id,omitempty"`
	TerminalidAcquirer *string `json:"terminalid_acquirer,omitempty"`
	VuNummer string `json:"vu_nummer"`
}

// MerchantPortalPamMerchantControllerCreateData is the typed request payload for MerchantPortalPamMerchantController.CreateTyped.
type MerchantPortalPamMerchantControllerCreateData struct {
	AdditionalData *map[string]any `json:"additional_data,omitempty"`
	BusinessRegistrationNumber string `json:"business_registration_number"`
	City *string `json:"city,omitempty"`
	CompanyName string `json:"company_name"`
	CorporateUuid string `json:"corporate_uuid"`
	Country *string `json:"country,omitempty"`
	Currency string `json:"currency"`
	Email string `json:"email"`
	Language string `json:"language"`
	Login string `json:"login"`
	Mandator string `json:"mandator"`
	MerchantCategoryCode *string `json:"merchant_category_code,omitempty"`
	MerchantContractNumber string `json:"merchant_contract_number"`
	MerchantName *string `json:"merchant_name,omitempty"`
	PackageUuid *string `json:"package_uuid,omitempty"`
	Packageorderuuid string `json:"packageorderuuid"`
	PhoneNumber string `json:"phone_number"`
	PostalCode *string `json:"postal_code,omitempty"`
	ProductidAcquirer string `json:"productid_acquirer"`
	Region *string `json:"region,omitempty"`
	RegistrationNumber *string `json:"registration_number,omitempty"`
	Signature *string `json:"signature,omitempty"`
	Street *string `json:"street,omitempty"`
	TerminalId *[]any `json:"terminal_id,omitempty"`
	TerminalidAcquirer *string `json:"terminalid_acquirer,omitempty"`
	VuNummer string `json:"vu_nummer"`
}

// MerchantPortalPamPackageController is the typed data model for the merchant_portal_pam_package_controller entity.
type MerchantPortalPamPackageController struct {
	ConsumerUuid *string `json:"consumer_uuid,omitempty"`
	CorporateUuid *string `json:"corporate_uuid,omitempty"`
	Country *string `json:"country,omitempty"`
	DescriptionKey *string `json:"description_key,omitempty"`
	Filter *map[string]any `json:"filter,omitempty"`
	Language string `json:"language"`
	NameKey *string `json:"name_key,omitempty"`
	PackageStatus *string `json:"package_status,omitempty"`
	PackageUuid string `json:"package_uuid"`
	Pagination *map[string]any `json:"pagination,omitempty"`
	Sorting *map[string]any `json:"sorting,omitempty"`
}

// MerchantPortalPamPackageControllerCreateData is the typed request payload for MerchantPortalPamPackageController.CreateTyped.
type MerchantPortalPamPackageControllerCreateData struct {
	ConsumerUuid *string `json:"consumer_uuid,omitempty"`
	CorporateUuid *string `json:"corporate_uuid,omitempty"`
	Country *string `json:"country,omitempty"`
	DescriptionKey *string `json:"description_key,omitempty"`
	Filter *map[string]any `json:"filter,omitempty"`
	Language string `json:"language"`
	NameKey *string `json:"name_key,omitempty"`
	PackageStatus *string `json:"package_status,omitempty"`
	PackageUuid string `json:"package_uuid"`
	Pagination *map[string]any `json:"pagination,omitempty"`
	Sorting *map[string]any `json:"sorting,omitempty"`
}

// MerchantPortalPamProductController is the typed data model for the merchant_portal_pam_product_controller entity.
type MerchantPortalPamProductController struct {
	ConsumerUuid *string `json:"consumer_uuid,omitempty"`
	Filter *map[string]any `json:"filter,omitempty"`
	Language *string `json:"language,omitempty"`
	MerchantId *string `json:"merchant_id,omitempty"`
	PackageOrderUuid string `json:"package_order_uuid"`
	Pagination *map[string]any `json:"pagination,omitempty"`
	ProductOrderUuid string `json:"product_order_uuid"`
	ProductUuid string `json:"product_uuid"`
	ReasonDecline string `json:"reason_decline"`
	Sorting *map[string]any `json:"sorting,omitempty"`
}

// MerchantPortalPamProductControllerCreateData is the typed request payload for MerchantPortalPamProductController.CreateTyped.
type MerchantPortalPamProductControllerCreateData struct {
	ConsumerUuid *string `json:"consumer_uuid,omitempty"`
	Filter *map[string]any `json:"filter,omitempty"`
	Language *string `json:"language,omitempty"`
	MerchantId *string `json:"merchant_id,omitempty"`
	PackageOrderUuid string `json:"package_order_uuid"`
	Pagination *map[string]any `json:"pagination,omitempty"`
	ProductOrderUuid string `json:"product_order_uuid"`
	ProductUuid string `json:"product_uuid"`
	ReasonDecline string `json:"reason_decline"`
	Sorting *map[string]any `json:"sorting,omitempty"`
}

// OutputAddProduct is the typed data model for the output_add_product entity.
type OutputAddProduct struct {
	PackageUuid string `json:"package_uuid"`
	ProductUuiD []any `json:"product_uui_d"`
	ResponseCode int `json:"response_code"`
	ResponseMessage string `json:"response_message"`
}

// OutputAddProductCreateData is the typed request payload for OutputAddProduct.CreateTyped.
type OutputAddProductCreateData struct {
	PackageUuid string `json:"package_uuid"`
	ProductUuiD []any `json:"product_uui_d"`
	ResponseCode int `json:"response_code"`
	ResponseMessage string `json:"response_message"`
}

// OutputCreateProduct is the typed data model for the output_create_product entity.
type OutputCreateProduct struct {
	AcquirerId *string `json:"acquirer_id,omitempty"`
	AllowMultipleOrder bool `json:"allow_multiple_order"`
	AppFormTemplateName string `json:"app_form_template_name"`
	ContractNeeded bool `json:"contract_needed"`
	CredentialsNeeded *bool `json:"credentials_needed,omitempty"`
	DescriptionKey string `json:"description_key"`
	NameKey string `json:"name_key"`
	PrescreeningAllowed bool `json:"prescreening_allowed"`
	ProductName string `json:"product_name"`
	ResponseCode int `json:"response_code"`
	ResponseMessage string `json:"response_message"`
	TerminalTemplateName string `json:"terminal_template_name"`
	VendorName string `json:"vendor_name"`
	XmlTemplateFile string `json:"xml_template_file"`
}

// OutputCreateProductCreateData is the typed request payload for OutputCreateProduct.CreateTyped.
type OutputCreateProductCreateData struct {
	AcquirerId *string `json:"acquirer_id,omitempty"`
	AllowMultipleOrder bool `json:"allow_multiple_order"`
	AppFormTemplateName string `json:"app_form_template_name"`
	ContractNeeded bool `json:"contract_needed"`
	CredentialsNeeded *bool `json:"credentials_needed,omitempty"`
	DescriptionKey string `json:"description_key"`
	NameKey string `json:"name_key"`
	PrescreeningAllowed bool `json:"prescreening_allowed"`
	ProductName string `json:"product_name"`
	ResponseCode int `json:"response_code"`
	ResponseMessage string `json:"response_message"`
	TerminalTemplateName string `json:"terminal_template_name"`
	VendorName string `json:"vendor_name"`
	XmlTemplateFile string `json:"xml_template_file"`
}

// OutputDetail is the typed data model for the output_detail entity.
type OutputDetail struct {
	Detail *map[string]any `json:"detail,omitempty"`
	ResponseCode int `json:"response_code"`
	ResponseMessage string `json:"response_message"`
}

// OutputDetailLoadMatch is the typed request payload for OutputDetail.LoadTyped.
type OutputDetailLoadMatch struct {
	Id string `json:"id"`
}

// OutputList is the typed data model for the output_list entity.
type OutputList struct {
	Item *[]any `json:"item,omitempty"`
	Pagination map[string]any `json:"pagination"`
	ResponseCode int `json:"response_code"`
	ResponseMessage string `json:"response_message"`
	Sorting *map[string]any `json:"sorting,omitempty"`
}

// OutputListCreateData is the typed request payload for OutputList.CreateTyped.
type OutputListCreateData struct {
	Item *[]any `json:"item,omitempty"`
	Pagination map[string]any `json:"pagination"`
	ResponseCode int `json:"response_code"`
	ResponseMessage string `json:"response_message"`
	Sorting *map[string]any `json:"sorting,omitempty"`
}

// OutputMessage is the typed data model for the output_message entity.
type OutputMessage struct {
	ResponseCode int `json:"response_code"`
	ResponseMessage string `json:"response_message"`
}

// OutputMessageLoadMatch is the typed request payload for OutputMessage.LoadTyped.
type OutputMessageLoadMatch struct {
	Id string `json:"id"`
}

// OutputMoveTid is the typed data model for the output_move_tid entity.
type OutputMoveTid struct {
	ProductOrderUuiD []any `json:"product_order_uui_d"`
	ResponseCode int `json:"response_code"`
	ResponseMessage string `json:"response_message"`
	TargetPackageOrderUuid string `json:"target_package_order_uuid"`
	TargetProductOrderUuid string `json:"target_product_order_uuid"`
}

// OutputMoveTidCreateData is the typed request payload for OutputMoveTid.CreateTyped.
type OutputMoveTidCreateData struct {
	ProductOrderUuiD []any `json:"product_order_uui_d"`
	ResponseCode int `json:"response_code"`
	ResponseMessage string `json:"response_message"`
	TargetPackageOrderUuid string `json:"target_package_order_uuid"`
	TargetProductOrderUuid string `json:"target_product_order_uuid"`
}

// OutputRemoveProduct is the typed data model for the output_remove_product entity.
type OutputRemoveProduct struct {
	PackageUuid string `json:"package_uuid"`
	ProductUuiD []any `json:"product_uui_d"`
	ResponseCode int `json:"response_code"`
	ResponseMessage string `json:"response_message"`
}

// OutputRemoveProductCreateData is the typed request payload for OutputRemoveProduct.CreateTyped.
type OutputRemoveProductCreateData struct {
	PackageUuid string `json:"package_uuid"`
	ProductUuiD []any `json:"product_uui_d"`
	ResponseCode int `json:"response_code"`
	ResponseMessage string `json:"response_message"`
}

// OutputStart is the typed data model for the output_start entity.
type OutputStart struct {
	Id *string `json:"id,omitempty"`
	ResponseCode int `json:"response_code"`
	ResponseMessage string `json:"response_message"`
}

// OutputStartCreateData is the typed request payload for OutputStart.CreateTyped.
type OutputStartCreateData struct {
	Id *string `json:"id,omitempty"`
	ResponseCode int `json:"response_code"`
	ResponseMessage string `json:"response_message"`
}

// OutputStatus is the typed data model for the output_status entity.
type OutputStatus struct {
	Percentage *int `json:"percentage,omitempty"`
	ResponseCode int `json:"response_code"`
	ResponseMessage string `json:"response_message"`
	Status *string `json:"status,omitempty"`
}

// OutputStatusLoadMatch is the typed request payload for OutputStatus.LoadTyped.
type OutputStatusLoadMatch struct {
	Id string `json:"id"`
}

// OutputUpdateProduct is the typed data model for the output_update_product entity.
type OutputUpdateProduct struct {
	AllowMultipleOrder *bool `json:"allow_multiple_order,omitempty"`
	AppFormName *string `json:"app_form_name,omitempty"`
	ContractNeeded *bool `json:"contract_needed,omitempty"`
	CredentialsNeeded *bool `json:"credentials_needed,omitempty"`
	DescriptionKey *string `json:"description_key,omitempty"`
	NameKey *string `json:"name_key,omitempty"`
	PrescreeningAllowed *bool `json:"prescreening_allowed,omitempty"`
	ProductName *string `json:"product_name,omitempty"`
	ProductStatus *string `json:"product_status,omitempty"`
	ProductUuid string `json:"product_uuid"`
	ResponseCode int `json:"response_code"`
	ResponseMessage string `json:"response_message"`
	VendorName *string `json:"vendor_name,omitempty"`
}

// OutputUpdateProductCreateData is the typed request payload for OutputUpdateProduct.CreateTyped.
type OutputUpdateProductCreateData struct {
	AllowMultipleOrder *bool `json:"allow_multiple_order,omitempty"`
	AppFormName *string `json:"app_form_name,omitempty"`
	ContractNeeded *bool `json:"contract_needed,omitempty"`
	CredentialsNeeded *bool `json:"credentials_needed,omitempty"`
	DescriptionKey *string `json:"description_key,omitempty"`
	NameKey *string `json:"name_key,omitempty"`
	PrescreeningAllowed *bool `json:"prescreening_allowed,omitempty"`
	ProductName *string `json:"product_name,omitempty"`
	ProductStatus *string `json:"product_status,omitempty"`
	ProductUuid string `json:"product_uuid"`
	ResponseCode int `json:"response_code"`
	ResponseMessage string `json:"response_message"`
	VendorName *string `json:"vendor_name,omitempty"`
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

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
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

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
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
