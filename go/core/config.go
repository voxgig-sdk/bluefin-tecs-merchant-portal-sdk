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
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "additional_data",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "business_reg_number",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "city",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "corporateuuid",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "country",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "currency",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "merchant_category_code",
						"req": true,
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "merchant_email",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "merchant_name",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "merchant_phone_number",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageid",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageorderuuid",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "password",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productid",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productid_acquirer",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "reason_deactivation",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "reason_reactivation",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "sorting_code",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "state",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "street",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "terminal_country_code",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "terminal_language_code",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "terminal_location",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "terminal_serial_number",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "terminalid",
						"req": true,
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "terminalid_acquirer",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "user_email",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "user_phone_number",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "username",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "vu_nummer",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "web_shop_url",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "zipcode",
						"req": true,
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
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productOrderUUID",
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
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "businessRegistrationNumber",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "city",
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
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "country",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "currency",
						"req": true,
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
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "merchantName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "merchant_category_code",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageUUID",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageorderuuid",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "phoneNumber",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "postalCode",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productid_acquirer",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "region",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "registrationNumber",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "signature",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "street",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "terminalIds",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "terminalid_acquirer",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "vu_nummer",
						"req": true,
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
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "descriptionKey",
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
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageStatus",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageUUID",
						"req": true,
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
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productUUIDs",
						"req": true,
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "responseCode",
						"req": true,
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
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
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "allowMultipleOrders",
						"req": true,
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "appFormTemplateName",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "contractNeeded",
						"req": true,
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "credentialsNeeded",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "descriptionKey",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "nameKey",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "prescreeningAllowed",
						"req": true,
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "productName",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "responseCode",
						"req": true,
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "terminalTemplateName",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "vendorName",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "xmlTemplateFile",
						"req": true,
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
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
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
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
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
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
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
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productUUIDs",
						"req": true,
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "responseCode",
						"req": true,
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
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
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
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
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
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
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "appFormName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "contractNeeded",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "credentialsNeeded",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "descriptionKey",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "nameKey",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "prescreeningAllowed",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "productName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productStatus",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "productUUID",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "responseCode",
						"req": true,
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "responseMessage",
						"req": true,
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "vendorName",
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
