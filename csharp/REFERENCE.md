# BluefinTecsMerchantPortal C# SDK Reference

Complete API reference for the BluefinTecsMerchantPortal C# SDK.


## BluefinTecsMerchantPortalSDK

### Constructor

```csharp
using BluefinTecsMerchantPortalSdk;

var client = new BluefinTecsMerchantPortalSDK(options);
```

Create a new SDK client instance. `options` is a
`Dictionary<string, object?>`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Dictionary` | SDK configuration options. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `Dictionary` | Custom headers for all requests. |
| `options["feature"]` | `Dictionary` | Feature configuration. |
| `options["system"]` | `Dictionary` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinTecsMerchantPortalSDK.TestSDK(testopts = null, sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```csharp
var client = BluefinTecsMerchantPortalSDK.TestSDK(null, null);
```


### Instance Methods

#### `MerchantPortalApiController(entopts = null)`

Create a new `MerchantPortalApiController` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `MerchantPortalCommonController(entopts = null)`

Create a new `MerchantPortalCommonController` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `MerchantPortalPamContractController(entopts = null)`

Create a new `MerchantPortalPamContractController` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `MerchantPortalPamDocumentController(entopts = null)`

Create a new `MerchantPortalPamDocumentController` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `MerchantPortalPamFormController(entopts = null)`

Create a new `MerchantPortalPamFormController` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `MerchantPortalPamMandatorController(entopts = null)`

Create a new `MerchantPortalPamMandatorController` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `MerchantPortalPamMerchantController(entopts = null)`

Create a new `MerchantPortalPamMerchantController` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `MerchantPortalPamPackageController(entopts = null)`

Create a new `MerchantPortalPamPackageController` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `MerchantPortalPamProductController(entopts = null)`

Create a new `MerchantPortalPamProductController` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `OutputAddProduct(entopts = null)`

Create a new `OutputAddProduct` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `OutputCreateProduct(entopts = null)`

Create a new `OutputCreateProduct` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `OutputDetail(entopts = null)`

Create a new `OutputDetail` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `OutputList(entopts = null)`

Create a new `OutputList` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `OutputMessage(entopts = null)`

Create a new `OutputMessage` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `OutputMoveTid(entopts = null)`

Create a new `OutputMoveTid` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `OutputRemoveProduct(entopts = null)`

Create a new `OutputRemoveProduct` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `OutputStart(entopts = null)`

Create a new `OutputStart` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `OutputStatus(entopts = null)`

Create a new `OutputStatus` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `OutputUpdateProduct(entopts = null)`

Create a new `OutputUpdateProduct` entity instance (returns
`BluefinTecsMerchantPortalEntityBase`). Pass `null` for no initial options.

#### `OptionsMap() -> Dictionary`

Return a deep copy of the current SDK options.

#### `GetUtility() -> Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs = null) -> Dictionary`

Make a direct HTTP request to any API endpoint. Returns a result
`Dictionary<string, object?>` with `ok`, `status`, `headers`, and `data`
(or `err` on failure). This escape hatch never raises — branch on
`result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Dictionary` | Path parameter values. |
| `fetchargs["query"]` | `Dictionary` | Query string parameters. |
| `fetchargs["headers"]` | `Dictionary` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `object?` | Request body (dictionaries are JSON-serialized). |

**Returns:** `Dictionary<string, object?>`

#### `Prepare(fetchargs = null) -> Dictionary`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## MerchantPortalApiController

```csharp
var merchantPortalApiController = client.MerchantPortalApiController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `long` | No |  |
| `additional_data` | `Dictionary<string, object?>` | No |  |
| `business_reg_number` | `string` | Yes |  |
| `city` | `string` | Yes |  |
| `corporateuuid` | `string` | No |  |
| `country` | `string` | Yes |  |
| `currency` | `string` | Yes |  |
| `merchant_category_code` | `long` | Yes |  |
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
| `sorting_code` | `long` | No |  |
| `state` | `string` | No |  |
| `street` | `string` | Yes |  |
| `terminal_country_code` | `string` | Yes |  |
| `terminal_language_code` | `string` | Yes |  |
| `terminal_location` | `string` | Yes |  |
| `terminal_serial_number` | `string` | Yes |  |
| `terminalid` | `long` | Yes |  |
| `terminalid_acquirer` | `string` | No |  |
| `user_email` | `string` | No |  |
| `user_phone_number` | `string` | No |  |
| `username` | `string` | No |  |
| `vu_nummer` | `string` | Yes |  |
| `web_shop_url` | `string` | No |  |
| `zipcode` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.MerchantPortalApiController().Create(new Dictionary<string, object?>
{
    ["business_reg_number"] = "example_business_reg_number",  // string
    ["city"] = "example_city",  // string
    ["country"] = "example_country",  // string
    ["currency"] = "example_currency",  // string
    ["merchant_category_code"] = 1L,  // long
    ["merchant_name"] = "example_merchant_name",  // string
    ["packageid"] = "example_packageid",  // string
    ["packageorderuuid"] = "example_packageorderuuid",  // string
    ["reason_deactivation"] = "example_reason_deactivation",  // string
    ["reason_reactivation"] = "example_reason_reactivation",  // string
    ["street"] = "example_street",  // string
    ["terminal_country_code"] = "example_terminal_country_code",  // string
    ["terminal_language_code"] = "example_terminal_language_code",  // string
    ["terminal_location"] = "example_terminal_location",  // string
    ["terminal_serial_number"] = "example_terminal_serial_number",  // string
    ["terminalid"] = 1L,  // long
    ["vu_nummer"] = "example_vu_nummer",  // string
    ["zipcode"] = "example_zipcode",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `MerchantPortalApiController` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## MerchantPortalCommonController

```csharp
var merchantPortalCommonController = client.MerchantPortalCommonController();
```

### Operations

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.MerchantPortalCommonController().Load(null);
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `MerchantPortalCommonController` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## MerchantPortalPamContractController

```csharp
var merchantPortalPamContractController = client.MerchantPortalPamContractController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `string` | Yes |  |
| `product_order_uuid` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.MerchantPortalPamContractController().Create(new Dictionary<string, object?>
{
    ["language"] = "example_language",  // string
    ["product_order_uuid"] = "example_product_order_uuid",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `MerchantPortalPamContractController` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## MerchantPortalPamDocumentController

```csharp
var merchantPortalPamDocumentController = client.MerchantPortalPamDocumentController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_field_desc_uuid` | `string` | Yes |  |
| `package_order_uuid` | `string` | No |  |
| `product_order_uuid` | `string` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.MerchantPortalPamDocumentController().Create(new Dictionary<string, object?>
{
    ["app_form_field_desc_uuid"] = "example_app_form_field_desc_uuid",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `MerchantPortalPamDocumentController` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## MerchantPortalPamFormController

```csharp
var merchantPortalPamFormController = client.MerchantPortalPamFormController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_fields_desc_uuid` | `string` | Yes |  |
| `filter` | `Dictionary<string, object?>` | No |  |
| `language` | `string` | Yes |  |
| `package_order` | `Dictionary<string, object?>` | No |  |
| `package_order_uuid` | `string` | Yes |  |
| `package_uuid` | `string` | No |  |
| `product_order` | `List<object?>` | No |  |
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

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.MerchantPortalPamFormController().Create(new Dictionary<string, object?>
{
    ["app_form_fields_desc_uuid"] = "example_app_form_fields_desc_uuid",  // string
    ["language"] = "example_language",  // string
    ["package_order_uuid"] = "example_package_order_uuid",  // string
    ["reason_of_reopening"] = "example_reason_of_reopening",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `MerchantPortalPamFormController` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## MerchantPortalPamMandatorController

```csharp
var merchantPortalPamMandatorController = client.MerchantPortalPamMandatorController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client_secret` | `string` | No |  |
| `mandator_name` | `string` | Yes |  |
| `notification_email` | `string` | No |  |
| `package_uuid` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.MerchantPortalPamMandatorController().Create(new Dictionary<string, object?>
{
    ["mandator_name"] = "example_mandator_name",  // string
    ["package_uuid"] = "example_package_uuid",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `MerchantPortalPamMandatorController` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## MerchantPortalPamMerchantController

```csharp
var merchantPortalPamMerchantController = client.MerchantPortalPamMerchantController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `Dictionary<string, object?>` | No |  |
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
| `terminal_id` | `List<object?>` | No |  |
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

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.MerchantPortalPamMerchantController().Create(new Dictionary<string, object?>
{
    ["business_registration_number"] = "example_business_registration_number",  // string
    ["company_name"] = "example_company_name",  // string
    ["corporate_uuid"] = "example_corporate_uuid",  // string
    ["currency"] = "example_currency",  // string
    ["email"] = "example_email",  // string
    ["language"] = "example_language",  // string
    ["login"] = "example_login",  // string
    ["mandator"] = "example_mandator",  // string
    ["merchant_contract_number"] = "example_merchant_contract_number",  // string
    ["packageorderuuid"] = "example_packageorderuuid",  // string
    ["phone_number"] = "example_phone_number",  // string
    ["productid_acquirer"] = "example_productid_acquirer",  // string
    ["vu_nummer"] = "example_vu_nummer",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `MerchantPortalPamMerchantController` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## MerchantPortalPamPackageController

```csharp
var merchantPortalPamPackageController = client.MerchantPortalPamPackageController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `string` | No |  |
| `corporate_uuid` | `string` | No |  |
| `country` | `string` | No |  |
| `description_key` | `string` | No |  |
| `filter` | `Dictionary<string, object?>` | No |  |
| `language` | `string` | Yes |  |
| `name_key` | `string` | No |  |
| `package_status` | `string` | No |  |
| `package_uuid` | `string` | Yes |  |
| `pagination` | `Dictionary<string, object?>` | No |  |
| `sorting` | `Dictionary<string, object?>` | No |  |

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

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.MerchantPortalPamPackageController().Create(new Dictionary<string, object?>
{
    ["language"] = "example_language",  // string
    ["package_uuid"] = "example_package_uuid",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `MerchantPortalPamPackageController` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## MerchantPortalPamProductController

```csharp
var merchantPortalPamProductController = client.MerchantPortalPamProductController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `string` | No |  |
| `filter` | `Dictionary<string, object?>` | No |  |
| `language` | `string` | No |  |
| `merchant_id` | `string` | No |  |
| `package_order_uuid` | `string` | Yes |  |
| `pagination` | `Dictionary<string, object?>` | No |  |
| `product_order_uuid` | `string` | Yes |  |
| `product_uuid` | `string` | Yes |  |
| `reason_decline` | `string` | Yes |  |
| `sorting` | `Dictionary<string, object?>` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.MerchantPortalPamProductController().Create(new Dictionary<string, object?>
{
    ["package_order_uuid"] = "example_package_order_uuid",  // string
    ["product_order_uuid"] = "example_product_order_uuid",  // string
    ["product_uuid"] = "example_product_uuid",  // string
    ["reason_decline"] = "example_reason_decline",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `MerchantPortalPamProductController` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## OutputAddProduct

```csharp
var outputAddProduct = client.OutputAddProduct();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `string` | Yes |  |
| `product_uui_d` | `List<object?>` | Yes |  |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.OutputAddProduct().Create(new Dictionary<string, object?>
{
    ["package_uuid"] = "example_package_uuid",  // string
    ["product_uui_d"] = new List<object?>(),  // List<object?>
    ["response_code"] = 1L,  // long
    ["response_message"] = "example_response_message",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `OutputAddProduct` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## OutputCreateProduct

```csharp
var outputCreateProduct = client.OutputCreateProduct();
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
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |
| `terminal_template_name` | `string` | Yes |  |
| `vendor_name` | `string` | Yes |  |
| `xml_template_file` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.OutputCreateProduct().Create(new Dictionary<string, object?>
{
    ["allow_multiple_order"] = true,  // bool
    ["app_form_template_name"] = "example_app_form_template_name",  // string
    ["contract_needed"] = true,  // bool
    ["description_key"] = "example_description_key",  // string
    ["name_key"] = "example_name_key",  // string
    ["prescreening_allowed"] = true,  // bool
    ["product_name"] = "example_product_name",  // string
    ["response_code"] = 1L,  // long
    ["response_message"] = "example_response_message",  // string
    ["terminal_template_name"] = "example_terminal_template_name",  // string
    ["vendor_name"] = "example_vendor_name",  // string
    ["xml_template_file"] = "example_xml_template_file",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `OutputCreateProduct` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## OutputDetail

```csharp
var outputDetail = client.OutputDetail();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `detail` | `Dictionary<string, object?>` | No |  |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.OutputDetail().Load(new Dictionary<string, object?> { ["id"] = "output_detail_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `OutputDetail` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## OutputList

```csharp
var outputList = client.OutputList();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `item` | `List<object?>` | No |  |
| `pagination` | `Dictionary<string, object?>` | Yes |  |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |
| `sorting` | `Dictionary<string, object?>` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.OutputList().Create(new Dictionary<string, object?>
{
    ["pagination"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["response_code"] = 1L,  // long
    ["response_message"] = "example_response_message",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `OutputList` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## OutputMessage

```csharp
var outputMessage = client.OutputMessage();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.OutputMessage().Load(new Dictionary<string, object?> { ["id"] = "output_message_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `OutputMessage` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## OutputMoveTid

```csharp
var outputMoveTid = client.OutputMoveTid();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `product_order_uui_d` | `List<object?>` | Yes |  |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |
| `target_package_order_uuid` | `string` | Yes |  |
| `target_product_order_uuid` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.OutputMoveTid().Create(new Dictionary<string, object?>
{
    ["product_order_uui_d"] = new List<object?>(),  // List<object?>
    ["response_code"] = 1L,  // long
    ["response_message"] = "example_response_message",  // string
    ["target_package_order_uuid"] = "example_target_package_order_uuid",  // string
    ["target_product_order_uuid"] = "example_target_product_order_uuid",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `OutputMoveTid` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## OutputRemoveProduct

```csharp
var outputRemoveProduct = client.OutputRemoveProduct();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `string` | Yes |  |
| `product_uui_d` | `List<object?>` | Yes |  |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.OutputRemoveProduct().Create(new Dictionary<string, object?>
{
    ["package_uuid"] = "example_package_uuid",  // string
    ["product_uui_d"] = new List<object?>(),  // List<object?>
    ["response_code"] = 1L,  // long
    ["response_message"] = "example_response_message",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `OutputRemoveProduct` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## OutputStart

```csharp
var outputStart = client.OutputStart();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No |  |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.OutputStart().Create(new Dictionary<string, object?>
{
    ["response_code"] = 1L,  // long
    ["response_message"] = "example_response_message",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `OutputStart` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## OutputStatus

```csharp
var outputStatus = client.OutputStatus();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `long` | No |  |
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |
| `status` | `string` | No |  |

### Operations

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.OutputStatus().Load(new Dictionary<string, object?> { ["id"] = "output_status_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `OutputStatus` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## OutputUpdateProduct

```csharp
var outputUpdateProduct = client.OutputUpdateProduct();
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
| `response_code` | `long` | Yes |  |
| `response_message` | `string` | Yes |  |
| `vendor_name` | `string` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.OutputUpdateProduct().Create(new Dictionary<string, object?>
{
    ["product_uuid"] = "example_product_uuid",  // string
    ["response_code"] = 1L,  // long
    ["response_message"] = "example_response_message",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `OutputUpdateProduct` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```csharp
var client = new BluefinTecsMerchantPortalSDK(new Dictionary<string, object?>
{
    ["feature"] = new Dictionary<string, object?>
    {
        ["test"] = new Dictionary<string, object?> { ["active"] = true },
    },
});
```

