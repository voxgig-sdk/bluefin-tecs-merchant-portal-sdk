package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "BluefinTecsMerchantPortal",
			"slug": "bluefin-tecs-merchant-portal",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
			},
		},
		"options": map[string]any{
			"base": "https://test.tecs.at",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"merchant_portal_api_controller": map[string]any{},
				"merchant_portal_common_controller": map[string]any{},
				"merchant_portal_pam_contract_controller": map[string]any{},
				"merchant_portal_pam_document_controller": map[string]any{},
				"merchant_portal_pam_form_controller": map[string]any{},
				"merchant_portal_pam_mandator_controller": map[string]any{},
				"merchant_portal_pam_merchant_controller": map[string]any{},
				"merchant_portal_pam_package_controller": map[string]any{},
				"merchant_portal_pam_product_controller": map[string]any{},
				"output_add_product": map[string]any{},
				"output_create_product": map[string]any{},
				"output_detail": map[string]any{},
				"output_list": map[string]any{},
				"output_message": map[string]any{},
				"output_move_tid": map[string]any{},
				"output_remove_product": map[string]any{},
				"output_start": map[string]any{},
				"output_status": map[string]any{},
				"output_update_product": map[string]any{},
			},
		},
		"entity": map[string]any{
			"merchant_portal_api_controller": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "account_number",
						"short": "Account number provided by the acquirer.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "additional_data",
						"short": "Arbitrary merchant-specific data related to terminal registration.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "business_reg_number",
						"req": true,
						"short": "Merchant business registration number as stated in the company registry.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "city",
						"req": true,
						"short": "Merchant's address: city.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "corporateuuid",
						"short": "Unique identifier for the corporate entity (UUID format).",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "country",
						"req": true,
						"short": "Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format).",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "currency",
						"req": true,
						"short": "Transaction currency (must be in \"ISO 4217\" format).",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "merchant_category_code",
						"req": true,
						"short": "Merchant category code as defined by the payment network.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "merchant_email",
						"short": "Merchant's email address for receiving notifications.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "merchant_name",
						"req": true,
						"short": "The officially incorporated company name of the merchant.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "merchant_phone_number",
						"short": "Merchant's phone number for notifications.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageid",
						"req": true,
						"short": "Identifier of the package in the TECS processing engine provided by TECS.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageorderuuid",
						"req": true,
						"short": "Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "password",
						"short": "Merchant password for MPOS.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productid",
						"short": "Identifier of the product for which terminal registration is to be performed.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productid_acquirer",
						"short": "Identifier of the product for which acquiring is enabled.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "reason_deactivation",
						"req": true,
						"short": "Reason for terminal deactivation.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "reason_reactivation",
						"req": true,
						"short": "Reason for terminal reactivation.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "sorting_code",
						"short": "Sorting code provided by the acquirer.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "state",
						"short": "Merchant's address: state.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "street",
						"req": true,
						"short": "Merchant's address: street and house number.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "terminal_country_code",
						"req": true,
						"short": "Terminal country code (must be in 'ISO-3166 ALPHA-3' format).",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "terminal_language_code",
						"req": true,
						"short": "Terminal language code (must be in 'ISO 639-1' format).",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "terminal_location",
						"req": true,
						"short": "Physical or logical location of the terminal.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "terminal_serial_number",
						"req": true,
						"short": "Terminal serial number.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "terminalid",
						"req": true,
						"short": "TECS terminalid given by Tecs processing engine.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "terminalid_acquirer",
						"short": "Terminal ID as set by the acquirer (optional).",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "user_email",
						"short": "Email address of the user acting on behalf of the merchant.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "user_phone_number",
						"short": "Phone number of the user acting on behalf of the merchant.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "username",
						"short": "Merchant username for MPOS.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "vu_nummer",
						"req": true,
						"short": "Merchant contract number with the acquirer.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "web_shop_url",
						"short": "URL of the merchant's web shop.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "zipcode",
						"req": true,
						"short": "Merchant's address: postal code.",
						"type": "`$STRING`",
					},
				},
				"name": "merchant_portal_api_controller",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/deactivateTerminal",
								"parts": []any{
									"merchantportalws",
									"deactivateTerminal",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/reactivateTerminal",
								"parts": []any{
									"merchantportalws",
									"reactivateTerminal",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/registerAdditionalTerminal",
								"parts": []any{
									"merchantportalws",
									"registerAdditionalTerminal",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/registerNewMerchant",
								"parts": []any{
									"merchantportalws",
									"registerNewMerchant",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"merchant_portal_common_controller": map[string]any{
				"fields": []any{},
				"name": "merchant_portal_common_controller",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/merchantportalws/logDeveloperInfo",
								"parts": []any{
									"merchantportalws",
									"logDeveloperInfo",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/merchantportalws/version",
								"parts": []any{
									"merchantportalws",
									"version",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"merchant_portal_pam_contract_controller": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "language",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productOrderUUID",
						"req": true,
						"type": "`$STRING`",
					},
				},
				"name": "merchant_portal_pam_contract_controller",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/generateContract",
								"parts": []any{
									"merchantportalws",
									"generateContract",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/uploadContract",
								"parts": []any{
									"merchantportalws",
									"uploadContract",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"merchant_portal_pam_document_controller": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "appFormFieldDescUUID",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageOrderUUID",
						"short": "UUID of the package order.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productOrderUUID",
						"short": "UUID of the product order.",
						"type": "`$STRING`",
					},
				},
				"name": "merchant_portal_pam_document_controller",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/documentsList",
								"parts": []any{
									"merchantportalws",
									"documentsList",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/downloadDocument",
								"parts": []any{
									"merchantportalws",
									"downloadDocument",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"merchant_portal_pam_form_controller": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "appFormFieldsDescUUID",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "filter",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "language",
						"op": map[string]any{
							"create": map[string]any{
								"type": "`$STRING`",
							},
						},
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageOrder",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "packageOrderUUID",
						"op": map[string]any{
							"create": map[string]any{
								"type": "`$STRING`",
							},
						},
						"req": true,
						"short": "UUID of the package order.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageUUID",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productOrderUUID",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$STRING`",
							},
						},
						"short": "UUID of the product order.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productOrders",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "reasonOfReopening",
						"req": true,
						"type": "`$STRING`",
					},
				},
				"name": "merchant_portal_pam_form_controller",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/applicationForm",
								"parts": []any{
									"merchantportalws",
									"applicationForm",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/packageForm",
								"parts": []any{
									"merchantportalws",
									"packageForm",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/reopenForm",
								"parts": []any{
									"merchantportalws",
									"reopenForm",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/secretKey",
								"parts": []any{
									"merchantportalws",
									"secretKey",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/submitForm",
								"parts": []any{
									"merchantportalws",
									"submitForm",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/submitValues",
								"parts": []any{
									"merchantportalws",
									"submitValues",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"merchant_portal_pam_mandator_controller": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "clientSecret",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mandatorName",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "notificationEmail",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageUUID",
						"req": true,
						"type": "`$STRING`",
					},
				},
				"name": "merchant_portal_pam_mandator_controller",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/createMandatorConfig",
								"parts": []any{
									"merchantportalws",
									"createMandatorConfig",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/introduceMandatorPackage",
								"parts": []any{
									"merchantportalws",
									"introduceMandatorPackage",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/selfRegistrationLink",
								"parts": []any{
									"merchantportalws",
									"selfRegistrationLink",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"merchant_portal_pam_merchant_controller": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "additional_data",
						"short": "Optional additional merchant-specific data related to enabling acquiring.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "businessRegistrationNumber",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "city",
						"short": "City where the merchant is located.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "companyName",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "corporateUUID",
						"req": true,
						"short": "Unique identifier for the corporate entity.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "country",
						"short": "Country where the merchant is located.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "currency",
						"req": true,
						"short": "Transaction currency in ISO 4217 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "email",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "language",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "login",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mandator",
						"req": true,
						"short": "Mandator name assigned by TECS.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "merchantContractNumber",
						"op": map[string]any{
							"create": map[string]any{
								"type": "`$STRING`",
							},
						},
						"req": true,
						"short": "Unique identifier for the merchant within a specific system.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "merchantName",
						"short": "Name of the merchant.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "merchant_category_code",
						"short": "Merchant Category Code (MCC) describing the merchant’s type of business.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageUUID",
						"short": "UUID of the package.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageorderuuid",
						"req": true,
						"short": "Unique identifier for the registered merchant in the TECS system.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "phoneNumber",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "postalCode",
						"short": "Postal or ZIP code of the merchant’s location.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productid_acquirer",
						"req": true,
						"short": "Identifier of the product for which acquiring is to be enabled.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "region",
						"short": "State or province where the merchant is located.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "registrationNumber",
						"short": "Business registration number.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "signature",
						"short": "Signature value = saltAsHex-hashAsHex.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "street",
						"short": "Street address of the merchant.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "terminalIds",
						"short": "Optional list of terminal IDs for which acquiring should be activated.",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "terminalid_acquirer",
						"short": "Optional terminal ID provided by the acquirer.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "vu_nummer",
						"req": true,
						"short": "Merchant contract number with the acquirer.",
						"type": "`$STRING`",
					},
				},
				"name": "merchant_portal_pam_merchant_controller",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/contractNumber",
								"parts": []any{
									"merchantportalws",
									"contractNumber",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/registerAdditionalAcquiring",
								"parts": []any{
									"merchantportalws",
									"registerAdditionalAcquiring",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/updateMerchant",
								"parts": []any{
									"merchantportalws",
									"updateMerchant",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/registerMerchant",
								"parts": []any{
									"merchantportalws",
									"registerMerchant",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"merchant_portal_pam_package_controller": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "consumerUUID",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "corporateUUID",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "country",
						"short": "Country associated with the package.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "descriptionKey",
						"short": "Key for the description of the package.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "filter",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "language",
						"op": map[string]any{
							"create": map[string]any{
								"type": "`$STRING`",
							},
						},
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "nameKey",
						"short": "Key for the name of the package.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageStatus",
						"short": "Status of the package.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageUUID",
						"req": true,
						"short": "Unique identifier for the package.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "pagination",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "sorting",
						"type": "`$OBJECT`",
					},
				},
				"name": "merchant_portal_pam_package_controller",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/availablePackages",
								"parts": []any{
									"merchantportalws",
									"availablePackages",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/orderPackage",
								"parts": []any{
									"merchantportalws",
									"orderPackage",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/orderedPackages",
								"parts": []any{
									"merchantportalws",
									"orderedPackages",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/packageTemplates",
								"parts": []any{
									"merchantportalws",
									"packageTemplates",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/updatePackageData",
								"parts": []any{
									"merchantportalws",
									"updatePackageData",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"merchant_portal_pam_product_controller": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "consumerUUID",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "filter",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "language",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "merchantID",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageOrderUUID",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "pagination",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "productOrderUUID",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productUUID",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "reason_decline",
						"req": true,
						"short": "Reason for product decline.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "sorting",
						"type": "`$OBJECT`",
					},
				},
				"name": "merchant_portal_pam_product_controller",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/approveProduct",
								"parts": []any{
									"merchantportalws",
									"approveProduct",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/declineProduct",
								"parts": []any{
									"merchantportalws",
									"declineProduct",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/orderAdditionalProduct",
								"parts": []any{
									"merchantportalws",
									"orderAdditionalProduct",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/productsList",
								"parts": []any{
									"merchantportalws",
									"productsList",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"output_add_product": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "packageUUID",
						"req": true,
						"short": "Unique identifier for the package.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productUUIDs",
						"req": true,
						"short": "The list of unique identifiers of the products.",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "responseCode",
						"req": true,
						"short": "Response code.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
						"short": "Response message.",
						"type": "`$STRING`",
					},
				},
				"name": "output_add_product",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/addProductsToPackage",
								"parts": []any{
									"merchantportalws",
									"addProductsToPackage",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"output_create_product": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "acquirerId",
						"short": "Unique identifier for the acquirer.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "allowMultipleOrders",
						"req": true,
						"short": "Indication whether multiple orders are allowed or not.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "appFormTemplateName",
						"req": true,
						"short": "Name of the application form template.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "contractNeeded",
						"req": true,
						"short": "Indication whether contract is needed or not.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "credentialsNeeded",
						"short": "Indication whether credentials are needed or not.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "descriptionKey",
						"req": true,
						"short": "Key indicator for product description.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "nameKey",
						"req": true,
						"short": "Key indicator for product name.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "prescreeningAllowed",
						"req": true,
						"short": "Indication whether prescreening is allowed or not.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "productName",
						"req": true,
						"short": "Name of the product.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "responseCode",
						"req": true,
						"short": "Response code.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
						"short": "Response message.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "terminalTemplateName",
						"req": true,
						"short": "Name of the terminal template.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "vendorName",
						"req": true,
						"short": "Name of the vendor.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "xmlTemplateFile",
						"req": true,
						"short": "A string value containing the XML template file encoded in Base64.",
						"type": "`$STRING`",
					},
				},
				"name": "output_create_product",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/createNewProduct",
								"parts": []any{
									"merchantportalws",
									"createNewProduct",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"output_detail": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "batch",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "lines",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "progress",
						"type": "`$OBJECT`",
					},
				},
				"name": "output_detail",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/merchantportalws/batch/registerAdditionalTerminal/details/{id}",
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"details",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"output_list": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "items",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "pagination",
						"op": map[string]any{
							"create": map[string]any{
								"type": "`$OBJECT`",
							},
						},
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "responseCode",
						"req": true,
						"short": "Response code.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
						"short": "Response message.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "sorting",
						"type": "`$OBJECT`",
					},
				},
				"name": "output_list",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/batch/registerAdditionalTerminal/list",
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"list",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"output_message": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "responseCode",
						"req": true,
						"short": "Response code.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
						"short": "Response message.",
						"type": "`$STRING`",
					},
				},
				"name": "output_message",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/merchantportalws/batch/registerAdditionalTerminal/restart/{id}",
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"restart",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/merchantportalws/batch/registerAdditionalTerminal/stop/{id}",
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"stop",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"output_move_tid": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "productOrderUUIDs",
						"req": true,
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "responseCode",
						"req": true,
						"short": "Response code.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
						"short": "Response message.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "targetPackageOrderUUID",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "targetProductOrderUUID",
						"req": true,
						"type": "`$STRING`",
					},
				},
				"name": "output_move_tid",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/moveTid",
								"parts": []any{
									"merchantportalws",
									"moveTid",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"output_remove_product": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "packageUUID",
						"req": true,
						"short": "Unique identifier for the package.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productUUIDs",
						"req": true,
						"short": "List of product unique identifiers.",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "responseCode",
						"req": true,
						"short": "Response code.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
						"short": "Response message.",
						"type": "`$STRING`",
					},
				},
				"name": "output_remove_product",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/removeProductsFromPackage",
								"parts": []any{
									"merchantportalws",
									"removeProductsFromPackage",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"output_start": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "responseCode",
						"req": true,
						"short": "Response code.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
						"short": "Response message.",
						"type": "`$STRING`",
					},
				},
				"name": "output_start",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/batch/registerAdditionalTerminal/start",
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"start",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"output_status": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "percentage",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseCode",
						"req": true,
						"short": "Response code.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
						"short": "Response message.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "status",
						"type": "`$STRING`",
					},
				},
				"name": "output_status",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/merchantportalws/batch/registerAdditionalTerminal/status/{id}",
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"status",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"output_update_product": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "allowMultipleOrders",
						"short": "An attribute to indicate if multiple orders are allowed",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "appFormName",
						"short": "The name of the application form",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "contractNeeded",
						"short": "An attribute to indicate if a contract is needed",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "credentialsNeeded",
						"short": "An attribute to indicate if credentials are needed",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "descriptionKey",
						"short": "The description of the product",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "nameKey",
						"short": "The key of the product name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "prescreeningAllowed",
						"short": "An attribute to indicate if prescreening is allowed",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "productName",
						"short": "The name of the product",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productStatus",
						"short": "The status of the product",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productUUID",
						"req": true,
						"short": "The UUID of the product to update",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "responseCode",
						"req": true,
						"short": "Response code.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
						"short": "Response message.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "vendorName",
						"short": "The name of the vendor",
						"type": "`$STRING`",
					},
				},
				"name": "output_update_product",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "authorization",
											"orig": "authorization",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/updateProduct",
								"parts": []any{
									"merchantportalws",
									"updateProduct",
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
