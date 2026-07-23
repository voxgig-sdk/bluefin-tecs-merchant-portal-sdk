# BluefinTecsMerchantPortal Golang SDK Reference

Complete API reference for the BluefinTecsMerchantPortal Golang SDK.


## BluefinTecsMerchantPortalSDK

### Constructor

```go
func NewBluefinTecsMerchantPortalSDK(options map[string]any) *BluefinTecsMerchantPortalSDK
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `map[string]any` | SDK configuration options. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `Test() *BluefinTecsMerchantPortalSDK`

No-arg convenience constructor for the common no-options test case.

```go
client := sdk.Test()
```

#### `TestSDK(testopts, sdkopts map[string]any) *BluefinTecsMerchantPortalSDK`

Test client with options. Both arguments may be `nil`.

```go
client := sdk.TestSDK(testopts, sdkopts)
```


### Instance Methods

#### `MerchantPortalApiController(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `MerchantPortalApiController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalCommonController(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `MerchantPortalCommonController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamContractController(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `MerchantPortalPamContractController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamDocumentController(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `MerchantPortalPamDocumentController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamFormController(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `MerchantPortalPamFormController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamMandatorController(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `MerchantPortalPamMandatorController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamMerchantController(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `MerchantPortalPamMerchantController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamPackageController(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `MerchantPortalPamPackageController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamProductController(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `MerchantPortalPamProductController` entity instance. Pass `nil` for no initial data.

#### `OutputAddProduct(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `OutputAddProduct` entity instance. Pass `nil` for no initial data.

#### `OutputCreateProduct(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `OutputCreateProduct` entity instance. Pass `nil` for no initial data.

#### `OutputDetail(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `OutputDetail` entity instance. Pass `nil` for no initial data.

#### `OutputList(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `OutputList` entity instance. Pass `nil` for no initial data.

#### `OutputMessage(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `OutputMessage` entity instance. Pass `nil` for no initial data.

#### `OutputMoveTid(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `OutputMoveTid` entity instance. Pass `nil` for no initial data.

#### `OutputRemoveProduct(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `OutputRemoveProduct` entity instance. Pass `nil` for no initial data.

#### `OutputStart(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `OutputStart` entity instance. Pass `nil` for no initial data.

#### `OutputStatus(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `OutputStatus` entity instance. Pass `nil` for no initial data.

#### `OutputUpdateProduct(data map[string]any) BluefinTecsMerchantPortalEntity`

Create a new `OutputUpdateProduct` entity instance. Pass `nil` for no initial data.

#### `OptionsMap() map[string]any`

Return a deep copy of the current SDK options.

#### `GetUtility() *Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs map[string]any) (map[string]any, error)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `map[string]any` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `map[string]any` | Query string parameters. |
| `fetchargs["headers"]` | `map[string]any` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (maps are JSON-serialized). |
| `fetchargs["ctrl"]` | `map[string]any` | Control options (e.g. `map[string]any{"explain": true}`). |

**Returns:** `(map[string]any, error)`

#### `Prepare(fetchargs map[string]any) (map[string]any, error)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `Direct()`.

**Returns:** `(map[string]any, error)`


---

## MerchantPortalApiControllerEntity

```go
merchantPortalApiController := client.MerchantPortalApiController(nil)
fmt.Println(merchantPortalApiController.GetName()) // "merchant_portal_api_controller"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `int` | No |  |
| `additional_data` | `map[string]any` | No |  |
| `business_reg_number` | `string` | Yes |  |
| `city` | `string` | Yes |  |
| `corporateuuid` | `string` | No |  |
| `country` | `string` | Yes |  |
| `currency` | `string` | Yes |  |
| `merchant_category_code` | `int` | Yes |  |
| `merchant_email` | `string` | No |  |
| `merchant_name` | `string` | Yes |  |
| `merchant_phone_number` | `string` | No |  |
| `packageid` | `string` | Yes |  |
| `packageorderuuid` | `string` | Yes |  |
| `password` | `string` | No |  |
| `productid` | `string` | No |  |
| `productid_acquirer` | `string` | No |  |
| `reason_deactivation` | `string` | Yes |  |
| `reason_reactivation` | `string` | Yes |  |
| `sorting_code` | `int` | No |  |
| `state` | `string` | No |  |
| `street` | `string` | Yes |  |
| `terminal_country_code` | `string` | Yes |  |
| `terminal_language_code` | `string` | Yes |  |
| `terminal_location` | `string` | Yes |  |
| `terminal_serial_number` | `string` | Yes |  |
| `terminalid` | `int` | Yes |  |
| `terminalid_acquirer` | `string` | No |  |
| `user_email` | `string` | No |  |
| `user_phone_number` | `string` | No |  |
| `username` | `string` | No |  |
| `vu_nummer` | `string` | Yes |  |
| `web_shop_url` | `string` | No |  |
| `zipcode` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.MerchantPortalApiController(nil).Create(map[string]any{
    "business_reg_number": "example_business_reg_number",
    "city": "example_city",
    "country": "example_country",
    "currency": "example_currency",
    "merchant_category_code": 1,
    "merchant_name": "example_merchant_name",
    "packageid": "example_packageid",
    "packageorderuuid": "example_packageorderuuid",
    "reason_deactivation": "example_reason_deactivation",
    "reason_reactivation": "example_reason_reactivation",
    "street": "example_street",
    "terminal_country_code": "example_terminal_country_code",
    "terminal_language_code": "example_terminal_language_code",
    "terminal_location": "example_terminal_location",
    "terminal_serial_number": "example_terminal_serial_number",
    "terminalid": 1,
    "vu_nummer": "example_vu_nummer",
    "zipcode": "example_zipcode",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `MerchantPortalApiControllerEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## MerchantPortalCommonControllerEntity

```go
merchantPortalCommonController := client.MerchantPortalCommonController(nil)
fmt.Println(merchantPortalCommonController.GetName()) // "merchant_portal_common_controller"
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.MerchantPortalCommonController(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `MerchantPortalCommonControllerEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## MerchantPortalPamContractControllerEntity

```go
merchantPortalPamContractController := client.MerchantPortalPamContractController(nil)
fmt.Println(merchantPortalPamContractController.GetName()) // "merchant_portal_pam_contract_controller"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `string` | Yes |  |
| `product_order_uuid` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.MerchantPortalPamContractController(nil).Create(map[string]any{
    "language": "example_language",
    "product_order_uuid": "example_product_order_uuid",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `MerchantPortalPamContractControllerEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## MerchantPortalPamDocumentControllerEntity

```go
merchantPortalPamDocumentController := client.MerchantPortalPamDocumentController(nil)
fmt.Println(merchantPortalPamDocumentController.GetName()) // "merchant_portal_pam_document_controller"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_field_desc_uuid` | `string` | Yes |  |
| `package_order_uuid` | `string` | No |  |
| `product_order_uuid` | `string` | No |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.MerchantPortalPamDocumentController(nil).Create(map[string]any{
    "app_form_field_desc_uuid": "example_app_form_field_desc_uuid",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `MerchantPortalPamDocumentControllerEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## MerchantPortalPamFormControllerEntity

```go
merchantPortalPamFormController := client.MerchantPortalPamFormController(nil)
fmt.Println(merchantPortalPamFormController.GetName()) // "merchant_portal_pam_form_controller"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_fields_desc_uuid` | `string` | Yes |  |
| `filter` | `map[string]any` | No |  |
| `language` | `string` | Yes |  |
| `package_order` | `map[string]any` | No |  |
| `package_order_uuid` | `string` | Yes |  |
| `package_uuid` | `string` | No |  |
| `product_order` | `[]any` | No |  |
| `product_order_uuid` | `string` | No |  |
| `reason_of_reopening` | `string` | Yes |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `app_form_fields_desc_uuid` | - |
| `filter` | - |
| `language` | Yes |
| `package_order` | - |
| `package_order_uuid` | Yes |
| `package_uuid` | - |
| `product_order` | - |
| `product_order_uuid` | Yes |
| `reason_of_reopening` | - |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.MerchantPortalPamFormController(nil).Create(map[string]any{
    "app_form_fields_desc_uuid": "example_app_form_fields_desc_uuid",
    "language": "example_language",
    "package_order_uuid": "example_package_order_uuid",
    "reason_of_reopening": "example_reason_of_reopening",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `MerchantPortalPamFormControllerEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## MerchantPortalPamMandatorControllerEntity

```go
merchantPortalPamMandatorController := client.MerchantPortalPamMandatorController(nil)
fmt.Println(merchantPortalPamMandatorController.GetName()) // "merchant_portal_pam_mandator_controller"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client_secret` | `string` | No |  |
| `mandator_name` | `string` | Yes |  |
| `notification_email` | `string` | No |  |
| `package_uuid` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.MerchantPortalPamMandatorController(nil).Create(map[string]any{
    "mandator_name": "example_mandator_name",
    "package_uuid": "example_package_uuid",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `MerchantPortalPamMandatorControllerEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## MerchantPortalPamMerchantControllerEntity

```go
merchantPortalPamMerchantController := client.MerchantPortalPamMerchantController(nil)
fmt.Println(merchantPortalPamMerchantController.GetName()) // "merchant_portal_pam_merchant_controller"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `map[string]any` | No |  |
| `business_registration_number` | `string` | Yes |  |
| `city` | `string` | No |  |
| `company_name` | `string` | Yes |  |
| `corporate_uuid` | `string` | Yes |  |
| `country` | `string` | No |  |
| `currency` | `string` | Yes |  |
| `email` | `string` | Yes |  |
| `language` | `string` | Yes |  |
| `login` | `string` | Yes |  |
| `mandator` | `string` | Yes |  |
| `merchant_category_code` | `string` | No |  |
| `merchant_contract_number` | `string` | Yes |  |
| `merchant_name` | `string` | No |  |
| `package_uuid` | `string` | No |  |
| `packageorderuuid` | `string` | Yes |  |
| `phone_number` | `string` | Yes |  |
| `postal_code` | `string` | No |  |
| `productid_acquirer` | `string` | Yes |  |
| `region` | `string` | No |  |
| `registration_number` | `string` | No |  |
| `signature` | `string` | No |  |
| `street` | `string` | No |  |
| `terminal_id` | `[]any` | No |  |
| `terminalid_acquirer` | `string` | No |  |
| `vu_nummer` | `string` | Yes |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `additional_data` | - |
| `business_registration_number` | - |
| `city` | - |
| `company_name` | - |
| `corporate_uuid` | - |
| `country` | - |
| `currency` | - |
| `email` | - |
| `language` | - |
| `login` | - |
| `mandator` | - |
| `merchant_category_code` | - |
| `merchant_contract_number` | Yes |
| `merchant_name` | - |
| `package_uuid` | - |
| `packageorderuuid` | - |
| `phone_number` | - |
| `postal_code` | - |
| `productid_acquirer` | - |
| `region` | - |
| `registration_number` | - |
| `signature` | - |
| `street` | - |
| `terminal_id` | - |
| `terminalid_acquirer` | - |
| `vu_nummer` | - |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.MerchantPortalPamMerchantController(nil).Create(map[string]any{
    "business_registration_number": "example_business_registration_number",
    "company_name": "example_company_name",
    "corporate_uuid": "example_corporate_uuid",
    "currency": "example_currency",
    "email": "example_email",
    "language": "example_language",
    "login": "example_login",
    "mandator": "example_mandator",
    "merchant_contract_number": "example_merchant_contract_number",
    "packageorderuuid": "example_packageorderuuid",
    "phone_number": "example_phone_number",
    "productid_acquirer": "example_productid_acquirer",
    "vu_nummer": "example_vu_nummer",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `MerchantPortalPamMerchantControllerEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## MerchantPortalPamPackageControllerEntity

```go
merchantPortalPamPackageController := client.MerchantPortalPamPackageController(nil)
fmt.Println(merchantPortalPamPackageController.GetName()) // "merchant_portal_pam_package_controller"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `string` | No |  |
| `corporate_uuid` | `string` | No |  |
| `country` | `string` | No |  |
| `description_key` | `string` | No |  |
| `filter` | `map[string]any` | No |  |
| `language` | `string` | Yes |  |
| `name_key` | `string` | No |  |
| `package_status` | `string` | No |  |
| `package_uuid` | `string` | Yes |  |
| `pagination` | `map[string]any` | No |  |
| `sorting` | `map[string]any` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `consumer_uuid` | - |
| `corporate_uuid` | - |
| `country` | - |
| `description_key` | - |
| `filter` | - |
| `language` | Yes |
| `name_key` | - |
| `package_status` | - |
| `package_uuid` | - |
| `pagination` | - |
| `sorting` | - |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.MerchantPortalPamPackageController(nil).Create(map[string]any{
    "language": "example_language",
    "package_uuid": "example_package_uuid",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `MerchantPortalPamPackageControllerEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## MerchantPortalPamProductControllerEntity

```go
merchantPortalPamProductController := client.MerchantPortalPamProductController(nil)
fmt.Println(merchantPortalPamProductController.GetName()) // "merchant_portal_pam_product_controller"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `string` | No |  |
| `filter` | `map[string]any` | No |  |
| `language` | `string` | No |  |
| `merchant_id` | `string` | No |  |
| `package_order_uuid` | `string` | Yes |  |
| `pagination` | `map[string]any` | No |  |
| `product_order_uuid` | `string` | Yes |  |
| `product_uuid` | `string` | Yes |  |
| `reason_decline` | `string` | Yes |  |
| `sorting` | `map[string]any` | No |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.MerchantPortalPamProductController(nil).Create(map[string]any{
    "package_order_uuid": "example_package_order_uuid",
    "product_order_uuid": "example_product_order_uuid",
    "product_uuid": "example_product_uuid",
    "reason_decline": "example_reason_decline",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `MerchantPortalPamProductControllerEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## OutputAddProductEntity

```go
outputAddProduct := client.OutputAddProduct(nil)
fmt.Println(outputAddProduct.GetName()) // "output_add_product"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `string` | Yes |  |
| `product_uui_d` | `[]any` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.OutputAddProduct(nil).Create(map[string]any{
    "package_uuid": "example_package_uuid",
    "product_uui_d": []any{},
    "response_code": 1,
    "response_message": "example_response_message",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `OutputAddProductEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## OutputCreateProductEntity

```go
outputCreateProduct := client.OutputCreateProduct(nil)
fmt.Println(outputCreateProduct.GetName()) // "output_create_product"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acquirer_id` | `string` | No |  |
| `allow_multiple_order` | `bool` | Yes |  |
| `app_form_template_name` | `string` | Yes |  |
| `contract_needed` | `bool` | Yes |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `string` | Yes |  |
| `name_key` | `string` | Yes |  |
| `prescreening_allowed` | `bool` | Yes |  |
| `product_name` | `string` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |
| `terminal_template_name` | `string` | Yes |  |
| `vendor_name` | `string` | Yes |  |
| `xml_template_file` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.OutputCreateProduct(nil).Create(map[string]any{
    "allow_multiple_order": true,
    "app_form_template_name": "example_app_form_template_name",
    "contract_needed": true,
    "description_key": "example_description_key",
    "name_key": "example_name_key",
    "prescreening_allowed": true,
    "product_name": "example_product_name",
    "response_code": 1,
    "response_message": "example_response_message",
    "terminal_template_name": "example_terminal_template_name",
    "vendor_name": "example_vendor_name",
    "xml_template_file": "example_xml_template_file",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `OutputCreateProductEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## OutputDetailEntity

```go
outputDetail := client.OutputDetail(nil)
fmt.Println(outputDetail.GetName()) // "output_detail"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `detail` | `map[string]any` | No |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.OutputDetail(nil).Load(map[string]any{"id": "output_detail_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `OutputDetailEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## OutputListEntity

```go
outputList := client.OutputList(nil)
fmt.Println(outputList.GetName()) // "output_list"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `item` | `[]any` | No |  |
| `pagination` | `map[string]any` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |
| `sorting` | `map[string]any` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.OutputList(nil).Create(map[string]any{
    "pagination": map[string]any{},
    "response_code": 1,
    "response_message": "example_response_message",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `OutputListEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## OutputMessageEntity

```go
outputMessage := client.OutputMessage(nil)
fmt.Println(outputMessage.GetName()) // "output_message"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.OutputMessage(nil).Load(map[string]any{"id": "output_message_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `OutputMessageEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## OutputMoveTidEntity

```go
outputMoveTid := client.OutputMoveTid(nil)
fmt.Println(outputMoveTid.GetName()) // "output_move_tid"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `product_order_uui_d` | `[]any` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |
| `target_package_order_uuid` | `string` | Yes |  |
| `target_product_order_uuid` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.OutputMoveTid(nil).Create(map[string]any{
    "product_order_uui_d": []any{},
    "response_code": 1,
    "response_message": "example_response_message",
    "target_package_order_uuid": "example_target_package_order_uuid",
    "target_product_order_uuid": "example_target_product_order_uuid",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `OutputMoveTidEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## OutputRemoveProductEntity

```go
outputRemoveProduct := client.OutputRemoveProduct(nil)
fmt.Println(outputRemoveProduct.GetName()) // "output_remove_product"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `string` | Yes |  |
| `product_uui_d` | `[]any` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.OutputRemoveProduct(nil).Create(map[string]any{
    "package_uuid": "example_package_uuid",
    "product_uui_d": []any{},
    "response_code": 1,
    "response_message": "example_response_message",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `OutputRemoveProductEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## OutputStartEntity

```go
outputStart := client.OutputStart(nil)
fmt.Println(outputStart.GetName()) // "output_start"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.OutputStart(nil).Create(map[string]any{
    "response_code": 1,
    "response_message": "example_response_message",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `OutputStartEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## OutputStatusEntity

```go
outputStatus := client.OutputStatus(nil)
fmt.Println(outputStatus.GetName()) // "output_status"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `int` | No |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |
| `status` | `string` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.OutputStatus(nil).Load(map[string]any{"id": "output_status_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `OutputStatusEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## OutputUpdateProductEntity

```go
outputUpdateProduct := client.OutputUpdateProduct(nil)
fmt.Println(outputUpdateProduct.GetName()) // "output_update_product"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `allow_multiple_order` | `bool` | No |  |
| `app_form_name` | `string` | No |  |
| `contract_needed` | `bool` | No |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `string` | No |  |
| `name_key` | `string` | No |  |
| `prescreening_allowed` | `bool` | No |  |
| `product_name` | `string` | No |  |
| `product_status` | `string` | No |  |
| `product_uuid` | `string` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `string` | Yes |  |
| `vendor_name` | `string` | No |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.OutputUpdateProduct(nil).Create(map[string]any{
    "product_uuid": "example_product_uuid",
    "response_code": 1,
    "response_message": "example_response_message",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `OutputUpdateProductEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```go
client := sdk.NewBluefinTecsMerchantPortalSDK(map[string]any{
    "feature": map[string]any{
        "test": map[string]any{"active": true},
    },
})
```

