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
				"optspec": map[string]any{
					"now": "`$FUNCTION`",
					"sink": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "none",
			},
			"clienttrack": map[string]any{
				"options": map[string]any{
					"active": false,
					"clientVersion": "0.0.1",
				},
				"optspec": map[string]any{
					"clientName": "`$STRING`",
					"clientVersion": "`$STRING`",
					"headers": "`$MAP`",
					"idgen": "`$FUNCTION`",
					"sessionId": "`$STRING`",
				},
				"strict": false,
				"transport": "none",
			},
			"debug": map[string]any{
				"options": map[string]any{
					"active": false,
					"max": 100,
					"redact": []any{
						"authorization",
						"cookie",
						"set-cookie",
						"api-key",
						"apikey",
						"x-api-key",
						"idempotency-key",
					},
				},
				"optspec": map[string]any{
					"now": "`$FUNCTION`",
					"onEntry": "`$FUNCTION`",
				},
				"strict": false,
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
				"optspec": map[string]any{
					"keygen": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "none",
			},
			"log": map[string]any{
				"options": map[string]any{
					"active": true,
				},
				"optspec": map[string]any{
					"level": "`$STRING`",
					"logger": "`$ANY`",
				},
				"strict": false,
				"transport": "none",
			},
			"metrics": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"optspec": map[string]any{
					"now": "`$FUNCTION`",
				},
				"strict": false,
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
				"optspec": map[string]any{
					"limit": "`$NUMBER`",
					"ops": "`$LIST`",
				},
				"strict": false,
				"transport": "none",
			},
			"ratelimit": map[string]any{
				"options": map[string]any{
					"active": false,
					"burst": 5,
					"rate": 5,
				},
				"optspec": map[string]any{
					"now": "`$FUNCTION`",
					"sleep": "`$FUNCTION`",
				},
				"strict": false,
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
				"optspec": map[string]any{
					"jitter": "`$BOOLEAN`",
					"sleep": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
			"telemetry": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"optspec": map[string]any{
					"exporter": "`$FUNCTION`",
					"headers": "`$MAP`",
					"idgen": "`$FUNCTION`",
					"now": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "none",
			},
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"optspec": map[string]any{
					"entity": "`$MAP`",
					"net": "`$MAP`",
				},
				"strict": false,
				"transport": "base",
			},
			"timeout": map[string]any{
				"options": map[string]any{
					"active": false,
					"ms": 30000,
				},
				"optspec": map[string]any{
					"clearTimer": "`$FUNCTION`",
					"setTimer": "`$FUNCTION`",
				},
				"strict": false,
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
						"name": "account_number",
						"title": "Account Number",
						"type": "`$INTEGER`",
						"short": "Account number provided by the acquirer.",
						"format": "int32",
					},
					map[string]any{
						"name": "additional_data",
						"title": "Additional Data",
						"type": "`$OBJECT`",
						"short": "Arbitrary merchant-specific data related to terminal registration.",
					},
					map[string]any{
						"name": "business_reg_number",
						"title": "Business Reg Number",
						"type": "`$STRING`",
						"req": true,
						"short": "Merchant business registration number as stated in the company registry.",
					},
					map[string]any{
						"name": "city",
						"title": "City",
						"type": "`$STRING`",
						"req": true,
						"short": "Merchant's address: city.",
					},
					map[string]any{
						"name": "corporateuuid",
						"title": "Corporateuuid",
						"type": "`$STRING`",
						"short": "Unique identifier for the corporate entity (UUID format).",
					},
					map[string]any{
						"name": "country",
						"title": "Country",
						"type": "`$STRING`",
						"req": true,
						"short": "Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format).",
					},
					map[string]any{
						"name": "currency",
						"title": "Currency",
						"type": "`$STRING`",
						"req": true,
						"short": "Transaction currency (must be in \"ISO 4217\" format).",
					},
					map[string]any{
						"name": "merchant_category_code",
						"title": "Merchant Category Code",
						"type": "`$INTEGER`",
						"req": true,
						"short": "Merchant category code as defined by the payment network.",
						"format": "int32",
					},
					map[string]any{
						"name": "merchant_email",
						"title": "Merchant Email",
						"type": "`$STRING`",
						"short": "Merchant's email address for receiving notifications.",
						"format": "email",
					},
					map[string]any{
						"name": "merchant_name",
						"title": "Merchant Name",
						"type": "`$STRING`",
						"req": true,
						"short": "The officially incorporated company name of the merchant.",
					},
					map[string]any{
						"name": "merchant_phone_number",
						"title": "Merchant Phone Number",
						"type": "`$STRING`",
						"short": "Merchant's phone number for notifications.",
					},
					map[string]any{
						"name": "packageid",
						"title": "Packageid",
						"type": "`$STRING`",
						"req": true,
						"short": "Identifier of the package in the TECS processing engine provided by TECS.",
					},
					map[string]any{
						"name": "packageorderuuid",
						"title": "Packageorderuuid",
						"type": "`$STRING`",
						"req": true,
						"short": "Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call.",
					},
					map[string]any{
						"name": "password",
						"title": "Password",
						"type": "`$STRING`",
						"short": "Merchant password for MPOS.",
					},
					map[string]any{
						"name": "productid",
						"title": "Productid",
						"type": "`$STRING`",
						"short": "Identifier of the product for which terminal registration is to be performed.",
					},
					map[string]any{
						"name": "productid_acquirer",
						"title": "Productid Acquirer",
						"type": "`$STRING`",
						"short": "Identifier of the product for which acquiring is enabled.",
					},
					map[string]any{
						"name": "reason_deactivation",
						"title": "Reason Deactivation",
						"type": "`$STRING`",
						"req": true,
						"short": "Reason for terminal deactivation.",
					},
					map[string]any{
						"name": "reason_reactivation",
						"title": "Reason Reactivation",
						"type": "`$STRING`",
						"req": true,
						"short": "Reason for terminal reactivation.",
					},
					map[string]any{
						"name": "sorting_code",
						"title": "Sorting Code",
						"type": "`$INTEGER`",
						"short": "Sorting code provided by the acquirer.",
						"format": "int32",
					},
					map[string]any{
						"name": "state",
						"title": "State",
						"type": "`$STRING`",
						"short": "Merchant's address: state.",
					},
					map[string]any{
						"name": "street",
						"title": "Street",
						"type": "`$STRING`",
						"req": true,
						"short": "Merchant's address: street and house number.",
					},
					map[string]any{
						"name": "terminal_country_code",
						"title": "Terminal Country Code",
						"type": "`$STRING`",
						"req": true,
						"short": "Terminal country code (must be in 'ISO-3166 ALPHA-3' format).",
					},
					map[string]any{
						"name": "terminal_language_code",
						"title": "Terminal Language Code",
						"type": "`$STRING`",
						"req": true,
						"short": "Terminal language code (must be in 'ISO 639-1' format).",
					},
					map[string]any{
						"name": "terminal_location",
						"title": "Terminal Location",
						"type": "`$STRING`",
						"req": true,
						"short": "Physical or logical location of the terminal.",
					},
					map[string]any{
						"name": "terminal_serial_number",
						"title": "Terminal Serial Number",
						"type": "`$STRING`",
						"req": true,
						"short": "Terminal serial number.",
					},
					map[string]any{
						"name": "terminalid",
						"title": "Terminalid",
						"type": "`$INTEGER`",
						"req": true,
						"short": "TECS terminalid given by Tecs processing engine.",
						"format": "int32",
					},
					map[string]any{
						"name": "terminalid_acquirer",
						"title": "Terminalid Acquirer",
						"type": "`$STRING`",
						"short": "Terminal ID as set by the acquirer (optional).",
					},
					map[string]any{
						"name": "user_email",
						"title": "User Email",
						"type": "`$STRING`",
						"short": "Email address of the user acting on behalf of the merchant.",
						"format": "email",
					},
					map[string]any{
						"name": "user_phone_number",
						"title": "User Phone Number",
						"type": "`$STRING`",
						"short": "Phone number of the user acting on behalf of the merchant.",
					},
					map[string]any{
						"name": "username",
						"title": "Username",
						"type": "`$STRING`",
						"short": "Merchant username for MPOS.",
					},
					map[string]any{
						"name": "vu_nummer",
						"title": "Vu Nummer",
						"type": "`$STRING`",
						"req": true,
						"short": "Merchant contract number with the acquirer.",
					},
					map[string]any{
						"name": "web_shop_url",
						"title": "Web Shop Url",
						"type": "`$STRING`",
						"short": "URL of the merchant's web shop.",
						"format": "uri",
					},
					map[string]any{
						"name": "zipcode",
						"title": "Zipcode",
						"type": "`$STRING`",
						"req": true,
						"short": "Merchant's address: postal code.",
					},
				},
				"name": "merchant_portal_api_controller",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"deactivateTerminal",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"reactivateTerminal",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"registerAdditionalTerminal",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"registerNewMerchant",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
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
								"parts": []any{
									"merchantportalws",
									"logDeveloperInfo",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"version",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
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
						"title": "Language",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "productOrderUUID",
						"title": "Product Order Uuid",
						"type": "`$STRING`",
						"req": true,
					},
				},
				"name": "merchant_portal_pam_contract_controller",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"generateContract",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"uploadContract",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
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
						"title": "App Form Field Desc Uuid",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "packageOrderUUID",
						"title": "Package Order Uuid",
						"type": "`$STRING`",
						"short": "UUID of the package order.",
					},
					map[string]any{
						"name": "productOrderUUID",
						"title": "Product Order Uuid",
						"type": "`$STRING`",
						"short": "UUID of the product order.",
					},
				},
				"name": "merchant_portal_pam_document_controller",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"documentsList",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"downloadDocument",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
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
						"title": "App Form Fields Desc Uuid",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "filter",
						"title": "Filter",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "language",
						"title": "Language",
						"type": "`$STRING`",
						"req": true,
						"op": map[string]any{
							"create": map[string]any{
								"type": "`$STRING`",
							},
						},
					},
					map[string]any{
						"name": "packageOrder",
						"title": "Package Order",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "packageOrderUUID",
						"title": "Package Order Uuid",
						"type": "`$STRING`",
						"req": true,
						"op": map[string]any{
							"create": map[string]any{
								"type": "`$STRING`",
							},
						},
						"short": "UUID of the package order.",
					},
					map[string]any{
						"name": "packageUUID",
						"title": "Package Uuid",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productOrderUUID",
						"title": "Product Order Uuid",
						"type": "`$STRING`",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$STRING`",
							},
						},
						"short": "UUID of the product order.",
					},
					map[string]any{
						"name": "productOrders",
						"title": "Product Orders",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "reasonOfReopening",
						"title": "Reason Of Reopening",
						"type": "`$STRING`",
						"req": true,
					},
				},
				"name": "merchant_portal_pam_form_controller",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"applicationForm",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"packageForm",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"reopenForm",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"secretKey",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"submitForm",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"submitValues",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
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
						"title": "Client Secret",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mandatorName",
						"title": "Mandator Name",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "notificationEmail",
						"title": "Notification Email",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageUUID",
						"title": "Package Uuid",
						"type": "`$STRING`",
						"req": true,
					},
				},
				"name": "merchant_portal_pam_mandator_controller",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"createMandatorConfig",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"introduceMandatorPackage",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"selfRegistrationLink",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
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
						"title": "Additional Data",
						"type": "`$OBJECT`",
						"short": "Optional additional merchant-specific data related to enabling acquiring.",
					},
					map[string]any{
						"name": "businessRegistrationNumber",
						"title": "Business Registration Number",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "city",
						"title": "City",
						"type": "`$STRING`",
						"short": "City where the merchant is located.",
					},
					map[string]any{
						"name": "companyName",
						"title": "Company Name",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "corporateUUID",
						"title": "Corporate Uuid",
						"type": "`$STRING`",
						"req": true,
						"short": "Unique identifier for the corporate entity.",
					},
					map[string]any{
						"name": "country",
						"title": "Country",
						"type": "`$STRING`",
						"short": "Country where the merchant is located.",
					},
					map[string]any{
						"name": "currency",
						"title": "Currency",
						"type": "`$STRING`",
						"req": true,
						"short": "Transaction currency in ISO 4217 format.",
					},
					map[string]any{
						"name": "email",
						"title": "Email",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "language",
						"title": "Language",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "login",
						"title": "Login",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "mandator",
						"title": "Mandator",
						"type": "`$STRING`",
						"req": true,
						"short": "Mandator name assigned by TECS.",
					},
					map[string]any{
						"name": "merchantContractNumber",
						"title": "Merchant Contract Number",
						"type": "`$STRING`",
						"req": true,
						"op": map[string]any{
							"create": map[string]any{
								"type": "`$STRING`",
							},
						},
						"short": "Unique identifier for the merchant within a specific system.",
					},
					map[string]any{
						"name": "merchantName",
						"title": "Merchant Name",
						"type": "`$STRING`",
						"short": "Name of the merchant.",
					},
					map[string]any{
						"name": "merchant_category_code",
						"title": "Merchant Category Code",
						"type": "`$STRING`",
						"short": "Merchant Category Code (MCC) describing the merchant’s type of business.",
					},
					map[string]any{
						"name": "packageUUID",
						"title": "Package Uuid",
						"type": "`$STRING`",
						"short": "UUID of the package.",
					},
					map[string]any{
						"name": "packageorderuuid",
						"title": "Packageorderuuid",
						"type": "`$STRING`",
						"req": true,
						"short": "Unique identifier for the registered merchant in the TECS system.",
					},
					map[string]any{
						"name": "phoneNumber",
						"title": "Phone Number",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "postalCode",
						"title": "Postal Code",
						"type": "`$STRING`",
						"short": "Postal or ZIP code of the merchant’s location.",
					},
					map[string]any{
						"name": "productid_acquirer",
						"title": "Productid Acquirer",
						"type": "`$STRING`",
						"req": true,
						"short": "Identifier of the product for which acquiring is to be enabled.",
					},
					map[string]any{
						"name": "region",
						"title": "Region",
						"type": "`$STRING`",
						"short": "State or province where the merchant is located.",
					},
					map[string]any{
						"name": "registrationNumber",
						"title": "Registration Number",
						"type": "`$STRING`",
						"short": "Business registration number.",
					},
					map[string]any{
						"name": "signature",
						"title": "Signature",
						"type": "`$STRING`",
						"short": "Signature value = saltAsHex-hashAsHex.",
					},
					map[string]any{
						"name": "street",
						"title": "Street",
						"type": "`$STRING`",
						"short": "Street address of the merchant.",
					},
					map[string]any{
						"name": "terminalIds",
						"title": "Terminal Ids",
						"type": "`$ARRAY`",
						"short": "Optional list of terminal IDs for which acquiring should be activated.",
					},
					map[string]any{
						"name": "terminalid_acquirer",
						"title": "Terminalid Acquirer",
						"type": "`$STRING`",
						"short": "Optional terminal ID provided by the acquirer.",
					},
					map[string]any{
						"name": "vu_nummer",
						"title": "Vu Nummer",
						"type": "`$STRING`",
						"req": true,
						"short": "Merchant contract number with the acquirer.",
					},
				},
				"name": "merchant_portal_pam_merchant_controller",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"contractNumber",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"registerAdditionalAcquiring",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"updateMerchant",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"registerMerchant",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
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
						"title": "Consumer Uuid",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "corporateUUID",
						"title": "Corporate Uuid",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "country",
						"title": "Country",
						"type": "`$STRING`",
						"short": "Country associated with the package.",
					},
					map[string]any{
						"name": "descriptionKey",
						"title": "Description Key",
						"type": "`$STRING`",
						"short": "Key for the description of the package.",
					},
					map[string]any{
						"name": "filter",
						"title": "Filter",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "language",
						"title": "Language",
						"type": "`$STRING`",
						"req": true,
						"op": map[string]any{
							"create": map[string]any{
								"type": "`$STRING`",
							},
						},
					},
					map[string]any{
						"name": "nameKey",
						"title": "Name Key",
						"type": "`$STRING`",
						"short": "Key for the name of the package.",
					},
					map[string]any{
						"name": "packageStatus",
						"title": "Package Status",
						"type": "`$STRING`",
						"short": "Status of the package.",
					},
					map[string]any{
						"name": "packageUUID",
						"title": "Package Uuid",
						"type": "`$STRING`",
						"req": true,
						"short": "Unique identifier for the package.",
					},
					map[string]any{
						"name": "pagination",
						"title": "Pagination",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "sorting",
						"title": "Sorting",
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
								"parts": []any{
									"merchantportalws",
									"availablePackages",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"orderPackage",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"orderedPackages",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"packageTemplates",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"updatePackageData",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
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
						"title": "Consumer Uuid",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "filter",
						"title": "Filter",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "language",
						"title": "Language",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "merchantID",
						"title": "Merchant Id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageOrderUUID",
						"title": "Package Order Uuid",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "pagination",
						"title": "Pagination",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "productOrderUUID",
						"title": "Product Order Uuid",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "productUUID",
						"title": "Product Uuid",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "reason_decline",
						"title": "Reason Decline",
						"type": "`$STRING`",
						"req": true,
						"short": "Reason for product decline.",
					},
					map[string]any{
						"name": "sorting",
						"title": "Sorting",
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
								"parts": []any{
									"merchantportalws",
									"approveProduct",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"declineProduct",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"orderAdditionalProduct",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"productsList",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
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
						"title": "Package Uuid",
						"type": "`$STRING`",
						"req": true,
						"short": "Unique identifier for the package.",
					},
					map[string]any{
						"name": "productUUIDs",
						"title": "Product Uui Ds",
						"type": "`$ARRAY`",
						"req": true,
						"short": "The list of unique identifiers of the products.",
					},
					map[string]any{
						"name": "responseCode",
						"title": "Response Code",
						"type": "`$INTEGER`",
						"req": true,
						"short": "Response code.",
						"format": "int32",
					},
					map[string]any{
						"name": "responseMessage",
						"title": "Response Message",
						"type": "`$STRING`",
						"req": true,
						"short": "Response message.",
					},
				},
				"name": "output_add_product",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"addProductsToPackage",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
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
						"title": "Acquirer Id",
						"type": "`$STRING`",
						"short": "Unique identifier for the acquirer.",
					},
					map[string]any{
						"name": "allowMultipleOrders",
						"title": "Allow Multiple Orders",
						"type": "`$BOOLEAN`",
						"req": true,
						"short": "Indication whether multiple orders are allowed or not.",
					},
					map[string]any{
						"name": "appFormTemplateName",
						"title": "App Form Template Name",
						"type": "`$STRING`",
						"req": true,
						"short": "Name of the application form template.",
					},
					map[string]any{
						"name": "contractNeeded",
						"title": "Contract Needed",
						"type": "`$BOOLEAN`",
						"req": true,
						"short": "Indication whether contract is needed or not.",
					},
					map[string]any{
						"name": "credentialsNeeded",
						"title": "Credentials Needed",
						"type": "`$BOOLEAN`",
						"short": "Indication whether credentials are needed or not.",
					},
					map[string]any{
						"name": "descriptionKey",
						"title": "Description Key",
						"type": "`$STRING`",
						"req": true,
						"short": "Key indicator for product description.",
					},
					map[string]any{
						"name": "nameKey",
						"title": "Name Key",
						"type": "`$STRING`",
						"req": true,
						"short": "Key indicator for product name.",
					},
					map[string]any{
						"name": "prescreeningAllowed",
						"title": "Prescreening Allowed",
						"type": "`$BOOLEAN`",
						"req": true,
						"short": "Indication whether prescreening is allowed or not.",
					},
					map[string]any{
						"name": "productName",
						"title": "Product Name",
						"type": "`$STRING`",
						"req": true,
						"short": "Name of the product.",
					},
					map[string]any{
						"name": "responseCode",
						"title": "Response Code",
						"type": "`$INTEGER`",
						"req": true,
						"short": "Response code.",
						"format": "int32",
					},
					map[string]any{
						"name": "responseMessage",
						"title": "Response Message",
						"type": "`$STRING`",
						"req": true,
						"short": "Response message.",
					},
					map[string]any{
						"name": "terminalTemplateName",
						"title": "Terminal Template Name",
						"type": "`$STRING`",
						"req": true,
						"short": "Name of the terminal template.",
					},
					map[string]any{
						"name": "vendorName",
						"title": "Vendor Name",
						"type": "`$STRING`",
						"req": true,
						"short": "Name of the vendor.",
					},
					map[string]any{
						"name": "xmlTemplateFile",
						"title": "Xml Template File",
						"type": "`$STRING`",
						"req": true,
						"short": "A string value containing the XML template file encoded in Base64.",
					},
				},
				"name": "output_create_product",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"createNewProduct",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
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
						"title": "Batch",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "lines",
						"title": "Lines",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "progress",
						"title": "Progress",
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
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"details",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.details`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
										"id",
									},
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
						"title": "Items",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "pagination",
						"title": "Pagination",
						"type": "`$OBJECT`",
						"req": true,
						"op": map[string]any{
							"create": map[string]any{
								"type": "`$OBJECT`",
							},
						},
					},
					map[string]any{
						"name": "responseCode",
						"title": "Response Code",
						"type": "`$INTEGER`",
						"req": true,
						"short": "Response code.",
						"format": "int32",
					},
					map[string]any{
						"name": "responseMessage",
						"title": "Response Message",
						"type": "`$STRING`",
						"req": true,
						"short": "Response message.",
					},
					map[string]any{
						"name": "sorting",
						"title": "Sorting",
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
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"list",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
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
						"title": "Id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "responseCode",
						"title": "Response Code",
						"type": "`$INTEGER`",
						"req": true,
						"short": "Response code.",
						"format": "int32",
					},
					map[string]any{
						"name": "responseMessage",
						"title": "Response Message",
						"type": "`$STRING`",
						"req": true,
						"short": "Response message.",
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
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"restart",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
										"id",
									},
								},
							},
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"stop",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
										"id",
									},
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
						"title": "Product Order Uui Ds",
						"type": "`$ARRAY`",
						"req": true,
					},
					map[string]any{
						"name": "responseCode",
						"title": "Response Code",
						"type": "`$INTEGER`",
						"req": true,
						"short": "Response code.",
						"format": "int32",
					},
					map[string]any{
						"name": "responseMessage",
						"title": "Response Message",
						"type": "`$STRING`",
						"req": true,
						"short": "Response message.",
					},
					map[string]any{
						"name": "targetPackageOrderUUID",
						"title": "Target Package Order Uuid",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "targetProductOrderUUID",
						"title": "Target Product Order Uuid",
						"type": "`$STRING`",
						"req": true,
					},
				},
				"name": "output_move_tid",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"moveTid",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
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
						"title": "Package Uuid",
						"type": "`$STRING`",
						"req": true,
						"short": "Unique identifier for the package.",
					},
					map[string]any{
						"name": "productUUIDs",
						"title": "Product Uui Ds",
						"type": "`$ARRAY`",
						"req": true,
						"short": "List of product unique identifiers.",
					},
					map[string]any{
						"name": "responseCode",
						"title": "Response Code",
						"type": "`$INTEGER`",
						"req": true,
						"short": "Response code.",
						"format": "int32",
					},
					map[string]any{
						"name": "responseMessage",
						"title": "Response Message",
						"type": "`$STRING`",
						"req": true,
						"short": "Response message.",
					},
				},
				"name": "output_remove_product",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"removeProductsFromPackage",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
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
						"title": "Id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "responseCode",
						"title": "Response Code",
						"type": "`$INTEGER`",
						"req": true,
						"short": "Response code.",
						"format": "int32",
					},
					map[string]any{
						"name": "responseMessage",
						"title": "Response Message",
						"type": "`$STRING`",
						"req": true,
						"short": "Response message.",
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
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"start",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
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
						"title": "Id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "percentage",
						"title": "Percentage",
						"type": "`$INTEGER`",
						"format": "int32",
					},
					map[string]any{
						"name": "responseCode",
						"title": "Response Code",
						"type": "`$INTEGER`",
						"req": true,
						"short": "Response code.",
						"format": "int32",
					},
					map[string]any{
						"name": "responseMessage",
						"title": "Response Message",
						"type": "`$STRING`",
						"req": true,
						"short": "Response message.",
					},
					map[string]any{
						"name": "status",
						"title": "Status",
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
								"parts": []any{
									"merchantportalws",
									"batch",
									"registerAdditionalTerminal",
									"status",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
										"id",
									},
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
						"title": "Allow Multiple Orders",
						"type": "`$BOOLEAN`",
						"short": "An attribute to indicate if multiple orders are allowed",
					},
					map[string]any{
						"name": "appFormName",
						"title": "App Form Name",
						"type": "`$STRING`",
						"short": "The name of the application form",
					},
					map[string]any{
						"name": "contractNeeded",
						"title": "Contract Needed",
						"type": "`$BOOLEAN`",
						"short": "An attribute to indicate if a contract is needed",
					},
					map[string]any{
						"name": "credentialsNeeded",
						"title": "Credentials Needed",
						"type": "`$BOOLEAN`",
						"short": "An attribute to indicate if credentials are needed",
					},
					map[string]any{
						"name": "descriptionKey",
						"title": "Description Key",
						"type": "`$STRING`",
						"short": "The description of the product",
					},
					map[string]any{
						"name": "nameKey",
						"title": "Name Key",
						"type": "`$STRING`",
						"short": "The key of the product name",
					},
					map[string]any{
						"name": "prescreeningAllowed",
						"title": "Prescreening Allowed",
						"type": "`$BOOLEAN`",
						"short": "An attribute to indicate if prescreening is allowed",
					},
					map[string]any{
						"name": "productName",
						"title": "Product Name",
						"type": "`$STRING`",
						"short": "The name of the product",
					},
					map[string]any{
						"name": "productStatus",
						"title": "Product Status",
						"type": "`$STRING`",
						"short": "The status of the product",
					},
					map[string]any{
						"name": "productUUID",
						"title": "Product Uuid",
						"type": "`$STRING`",
						"req": true,
						"short": "The UUID of the product to update",
					},
					map[string]any{
						"name": "responseCode",
						"title": "Response Code",
						"type": "`$INTEGER`",
						"req": true,
						"short": "Response code.",
						"format": "int32",
					},
					map[string]any{
						"name": "responseMessage",
						"title": "Response Message",
						"type": "`$STRING`",
						"req": true,
						"short": "Response message.",
					},
					map[string]any{
						"name": "vendorName",
						"title": "Vendor Name",
						"type": "`$STRING`",
						"short": "The name of the vendor",
					},
				},
				"name": "output_update_product",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
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
								"parts": []any{
									"merchantportalws",
									"updateProduct",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"name": "authorization",
											"orig": "authorization",
											"type": "`$STRING`",
											"kind": "header",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"authorization",
									},
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
	case "debug":
		if NewDebugFeatureFunc != nil {
			return NewDebugFeatureFunc()
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
