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
			"version": "0.1.1",
			"target": "go",
		},
		"feature": map[string]any{
			"audit": map[string]any{
				"options": map[string]any{
					"active": false,
					"actor": "anonymous",
					"max": 1000,
				},
				"transport": "none",
			},
			"clienttrack": map[string]any{
				"options": map[string]any{
					"active": false,
					"clientVersion": "0.0.1",
				},
				"transport": "none",
			},
			"idempotency": map[string]any{
				"options": map[string]any{
					"active": false,
					"header": "Idempotency-Key",
					"methods": []any{
						"POST",
						"PUT",
						"PATCH",
						"DELETE",
					},
					"ops": []any{
						"create",
						"update",
						"remove",
					},
				},
				"transport": "none",
			},
			"log": map[string]any{
				"options": map[string]any{
					"active": true,
				},
				"transport": "none",
			},
			"metrics": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "none",
			},
			"paging": map[string]any{
				"options": map[string]any{
					"active": false,
					"afterVar": "after",
					"cursorParam": "cursor",
					"firstVar": "first",
					"limitParam": "limit",
					"pageParam": "page",
					"startPage": 1,
				},
				"transport": "none",
			},
			"ratelimit": map[string]any{
				"options": map[string]any{
					"active": false,
					"burst": 5,
					"rate": 5,
				},
				"transport": "wrap",
			},
			"retry": map[string]any{
				"options": map[string]any{
					"active": false,
					"factor": 2,
					"maxDelay": 2000,
					"minDelay": 50,
					"retries": 2,
					"statuses": []any{
						408,
						425,
						429,
						500,
						502,
						503,
						504,
					},
				},
				"transport": "wrap",
			},
			"telemetry": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "none",
			},
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "base",
			},
			"timeout": map[string]any{
				"options": map[string]any{
					"active": false,
					"ms": 30000,
				},
				"transport": "wrap",
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
						"format": "int32",
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
						"format": "int32",
						"name": "merchant_category_code",
						"req": true,
						"short": "Merchant category code as defined by the payment network.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"format": "email",
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
						"format": "int32",
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
						"format": "int32",
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
						"format": "email",
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
						"format": "uri",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "deactivateTerminal",
									},
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
								"parts": []any{
									"merchantportalws",
									"deactivateTerminal",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "reactivateTerminal",
									},
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
								"parts": []any{
									"merchantportalws",
									"reactivateTerminal",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "registerAdditionalTerminal",
									},
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
								"parts": []any{
									"merchantportalws",
									"registerAdditionalTerminal",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "registerNewMerchant",
									},
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
								"parts": []any{
									"merchantportalws",
									"registerNewMerchant",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "logDeveloperInfo",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"merchantportalws",
									"logDeveloperInfo",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/merchantportalws/version",
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "version",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"merchantportalws",
									"version",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "generateContract",
									},
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
								"parts": []any{
									"merchantportalws",
									"generateContract",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "uploadContract",
									},
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
								"parts": []any{
									"merchantportalws",
									"uploadContract",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "documentsList",
									},
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
								"parts": []any{
									"merchantportalws",
									"documentsList",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "downloadDocument",
									},
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
								"parts": []any{
									"merchantportalws",
									"downloadDocument",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "applicationForm",
									},
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
								"parts": []any{
									"merchantportalws",
									"applicationForm",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "packageForm",
									},
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
								"parts": []any{
									"merchantportalws",
									"packageForm",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "reopenForm",
									},
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
								"parts": []any{
									"merchantportalws",
									"reopenForm",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "secretKey",
									},
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
								"parts": []any{
									"merchantportalws",
									"secretKey",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "submitForm",
									},
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
								"parts": []any{
									"merchantportalws",
									"submitForm",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "submitValues",
									},
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
								"parts": []any{
									"merchantportalws",
									"submitValues",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "createMandatorConfig",
									},
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
								"parts": []any{
									"merchantportalws",
									"createMandatorConfig",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "introduceMandatorPackage",
									},
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
								"parts": []any{
									"merchantportalws",
									"introduceMandatorPackage",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "selfRegistrationLink",
									},
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
								"parts": []any{
									"merchantportalws",
									"selfRegistrationLink",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "contractNumber",
									},
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
								"parts": []any{
									"merchantportalws",
									"contractNumber",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "registerAdditionalAcquiring",
									},
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
								"parts": []any{
									"merchantportalws",
									"registerAdditionalAcquiring",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "updateMerchant",
									},
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
								"parts": []any{
									"merchantportalws",
									"updateMerchant",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/merchantportalws/registerMerchant",
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "registerMerchant",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"merchantportalws",
									"registerMerchant",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "availablePackages",
									},
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
								"parts": []any{
									"merchantportalws",
									"availablePackages",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "orderPackage",
									},
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
								"parts": []any{
									"merchantportalws",
									"orderPackage",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "orderedPackages",
									},
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
								"parts": []any{
									"merchantportalws",
									"orderedPackages",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "packageTemplates",
									},
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
								"parts": []any{
									"merchantportalws",
									"packageTemplates",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "updatePackageData",
									},
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
								"parts": []any{
									"merchantportalws",
									"updatePackageData",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "approveProduct",
									},
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
								"parts": []any{
									"merchantportalws",
									"approveProduct",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "declineProduct",
									},
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
								"parts": []any{
									"merchantportalws",
									"declineProduct",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "orderAdditionalProduct",
									},
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
								"parts": []any{
									"merchantportalws",
									"orderAdditionalProduct",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "productsList",
									},
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
								"parts": []any{
									"merchantportalws",
									"productsList",
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
						"format": "int32",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "addProductsToPackage",
									},
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
								"parts": []any{
									"merchantportalws",
									"addProductsToPackage",
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
						"format": "int32",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "createNewProduct",
									},
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
								"parts": []any{
									"merchantportalws",
									"createNewProduct",
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
						"name": "id",
						"type": "`$STRING`",
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
				"id": map[string]any{
					"field": "id",
					"name": "id",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "batch",
									},
									map[string]any{
										"lit": "registerAdditionalTerminal",
									},
									map[string]any{
										"lit": "details",
									},
									map[string]any{
										"var": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.details`",
								},
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"details",
									"{id}",
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
						"format": "int32",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "batch",
									},
									map[string]any{
										"lit": "registerAdditionalTerminal",
									},
									map[string]any{
										"lit": "list",
									},
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
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"list",
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
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"format": "int32",
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
				"id": map[string]any{
					"field": "id",
					"name": "id",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "batch",
									},
									map[string]any{
										"lit": "registerAdditionalTerminal",
									},
									map[string]any{
										"lit": "restart",
									},
									map[string]any{
										"var": "id",
									},
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
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"restart",
									"{id}",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "batch",
									},
									map[string]any{
										"lit": "registerAdditionalTerminal",
									},
									map[string]any{
										"lit": "stop",
									},
									map[string]any{
										"var": "id",
									},
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
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"stop",
									"{id}",
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
						"format": "int32",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "moveTid",
									},
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
								"parts": []any{
									"merchantportalws",
									"moveTid",
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
						"format": "int32",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "removeProductsFromPackage",
									},
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
								"parts": []any{
									"merchantportalws",
									"removeProductsFromPackage",
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
						"format": "int32",
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
				"id": map[string]any{
					"field": "id",
					"name": "id",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "batch",
									},
									map[string]any{
										"lit": "registerAdditionalTerminal",
									},
									map[string]any{
										"lit": "start",
									},
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
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"start",
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
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"format": "int32",
						"name": "percentage",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"format": "int32",
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
				"id": map[string]any{
					"field": "id",
					"name": "id",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "batch",
									},
									map[string]any{
										"lit": "registerAdditionalTerminal",
									},
									map[string]any{
										"lit": "status",
									},
									map[string]any{
										"var": "id",
									},
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
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"status",
									"{id}",
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
						"format": "int32",
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
								"segments": []any{
									map[string]any{
										"lit": "merchantportalws",
									},
									map[string]any{
										"lit": "updateProduct",
									},
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
								"parts": []any{
									"merchantportalws",
									"updateProduct",
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

// The plugin definitions the model selected per feature, as []any so a
// feature package can consume them without core naming its types. Empty
// when no active feature declares active plugin groups for this target.
var featurePlugins = map[string][]any{
}

// FeaturePlugins is the definitions list for one feature's chain.
func FeaturePlugins(name string) []any {
	return featurePlugins[name]
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
	case "audit":
		if NewAuditFeatureFunc != nil {
			return NewAuditFeatureFunc()
		}
	case "clienttrack":
		if NewClienttrackFeatureFunc != nil {
			return NewClienttrackFeatureFunc()
		}
	case "idempotency":
		if NewIdempotencyFeatureFunc != nil {
			return NewIdempotencyFeatureFunc()
		}
	case "log":
		if NewLogFeatureFunc != nil {
			return NewLogFeatureFunc()
		}
	case "metrics":
		if NewMetricsFeatureFunc != nil {
			return NewMetricsFeatureFunc()
		}
	case "paging":
		if NewPagingFeatureFunc != nil {
			return NewPagingFeatureFunc()
		}
	case "ratelimit":
		if NewRatelimitFeatureFunc != nil {
			return NewRatelimitFeatureFunc()
		}
	case "retry":
		if NewRetryFeatureFunc != nil {
			return NewRetryFeatureFunc()
		}
	case "telemetry":
		if NewTelemetryFeatureFunc != nil {
			return NewTelemetryFeatureFunc()
		}
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	case "timeout":
		if NewTimeoutFeatureFunc != nil {
			return NewTimeoutFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
