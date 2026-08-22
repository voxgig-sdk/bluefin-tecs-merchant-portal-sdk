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
| `account_number` | `long` | No | Account number provided by the acquirer. |
| `additional_data` | `Dictionary<string, object?>` | No | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `string` | Yes | Merchant business registration number as stated in the company registry. |
| `city` | `string` | Yes | Merchant's address: city. |
| `corporateuuid` | `string` | No | Unique identifier for the corporate entity (UUID format). |
| `country` | `string` | Yes | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `string` | Yes | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `long` | Yes | Merchant category code as defined by the payment network. |
| `merchant_email` | `string` | No | Merchant's email address for receiving notifications. |
| `merchant_name` | `string` | Yes | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | `string` | No | Merchant's phone number for notifications. |
| `packageid` | `string` | Yes | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | `string` | Yes | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | `string` | No | Merchant password for MPOS. |
| `productid` | `string` | No | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | `string` | No | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | `string` | Yes | Reason for terminal deactivation. |
| `reason_reactivation` | `string` | Yes | Reason for terminal reactivation. |
| `sorting_code` | `long` | No | Sorting code provided by the acquirer. |
| `state` | `string` | No | Merchant's address: state. |
| `street` | `string` | Yes | Merchant's address: street and house number. |
| `terminal_country_code` | `string` | Yes | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `string` | Yes | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `string` | Yes | Physical or logical location of the terminal. |
| `terminal_serial_number` | `string` | Yes | Terminal serial number. |
| `terminalid` | `long` | Yes | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `string` | No | Terminal ID as set by the acquirer (optional). |
| `user_email` | `string` | No | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `string` | No | Phone number of the user acting on behalf of the merchant. |
| `username` | `string` | No | Merchant username for MPOS. |
| `vu_nummer` | `string` | Yes | Merchant contract number with the acquirer. |
| `web_shop_url` | `string` | No | URL of the merchant's web shop. |
| `zipcode` | `string` | Yes | Merchant's address: postal code. |

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
| `productOrderUUID` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.MerchantPortalPamContractController().Create(new Dictionary<string, object?>
{
    ["language"] = "example_language",  // string
    ["productOrderUUID"] = "example_productOrderUUID",  // string
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
| `appFormFieldDescUUID` | `string` | Yes |  |
| `packageOrderUUID` | `string` | No | UUID of the package order. |
| `productOrderUUID` | `string` | No | UUID of the product order. |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.MerchantPortalPamDocumentController().Create(new Dictionary<string, object?>
{
    ["appFormFieldDescUUID"] = "example_appFormFieldDescUUID",  // string
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
| `appFormFieldsDescUUID` | `string` | Yes |  |
| `filter` | `Dictionary<string, object?>` | No |  |
| `language` | `string` | Yes |  |
| `packageOrder` | `Dictionary<string, object?>` | No |  |
| `packageOrderUUID` | `string` | Yes | UUID of the package order. |
| `packageUUID` | `string` | No |  |
| `productOrderUUID` | `string` | No | UUID of the product order. |
| `productOrders` | `List<object?>` | No |  |
| `reasonOfReopening` | `string` | Yes |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `appFormFieldsDescUUID` | - |
| `filter` | - |
| `language` | Yes |
| `packageOrder` | - |
| `packageOrderUUID` | Yes |
| `packageUUID` | - |
| `productOrderUUID` | Yes |
| `productOrders` | - |
| `reasonOfReopening` | - |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.MerchantPortalPamFormController().Create(new Dictionary<string, object?>
{
    ["appFormFieldsDescUUID"] = "example_appFormFieldsDescUUID",  // string
    ["language"] = "example_language",  // string
    ["packageOrderUUID"] = "example_packageOrderUUID",  // string
    ["reasonOfReopening"] = "example_reasonOfReopening",  // string
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
| `clientSecret` | `string` | No |  |
| `mandatorName` | `string` | Yes |  |
| `notificationEmail` | `string` | No |  |
| `packageUUID` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.MerchantPortalPamMandatorController().Create(new Dictionary<string, object?>
{
    ["mandatorName"] = "example_mandatorName",  // string
    ["packageUUID"] = "example_packageUUID",  // string
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
| `additional_data` | `Dictionary<string, object?>` | No | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` | `string` | Yes |  |
| `city` | `string` | No | City where the merchant is located. |
| `companyName` | `string` | Yes |  |
| `corporateUUID` | `string` | Yes | Unique identifier for the corporate entity. |
| `country` | `string` | No | Country where the merchant is located. |
| `currency` | `string` | Yes | Transaction currency in ISO 4217 format. |
| `email` | `string` | Yes |  |
| `language` | `string` | Yes |  |
| `login` | `string` | Yes |  |
| `mandator` | `string` | Yes | Mandator name assigned by TECS. |
| `merchantContractNumber` | `string` | Yes | Unique identifier for the merchant within a specific system. |
| `merchantName` | `string` | No | Name of the merchant. |
| `merchant_category_code` | `string` | No | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | `string` | No | UUID of the package. |
| `packageorderuuid` | `string` | Yes | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` | `string` | Yes |  |
| `postalCode` | `string` | No | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | `string` | Yes | Identifier of the product for which acquiring is to be enabled. |
| `region` | `string` | No | State or province where the merchant is located. |
| `registrationNumber` | `string` | No | Business registration number. |
| `signature` | `string` | No | Signature value = saltAsHex-hashAsHex. |
| `street` | `string` | No | Street address of the merchant. |
| `terminalIds` | `List<object?>` | No | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `string` | No | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `string` | Yes | Merchant contract number with the acquirer. |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `additional_data` | - |
| `businessRegistrationNumber` | - |
| `city` | - |
| `companyName` | - |
| `corporateUUID` | - |
| `country` | - |
| `currency` | - |
| `email` | - |
| `language` | - |
| `login` | - |
| `mandator` | - |
| `merchantContractNumber` | Yes |
| `merchantName` | - |
| `merchant_category_code` | - |
| `packageUUID` | - |
| `packageorderuuid` | - |
| `phoneNumber` | - |
| `postalCode` | - |
| `productid_acquirer` | - |
| `region` | - |
| `registrationNumber` | - |
| `signature` | - |
| `street` | - |
| `terminalIds` | - |
| `terminalid_acquirer` | - |
| `vu_nummer` | - |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.MerchantPortalPamMerchantController().Create(new Dictionary<string, object?>
{
    ["businessRegistrationNumber"] = "example_businessRegistrationNumber",  // string
    ["companyName"] = "example_companyName",  // string
    ["corporateUUID"] = "example_corporateUUID",  // string
    ["currency"] = "example_currency",  // string
    ["email"] = "example_email",  // string
    ["language"] = "example_language",  // string
    ["login"] = "example_login",  // string
    ["mandator"] = "example_mandator",  // string
    ["merchantContractNumber"] = "example_merchantContractNumber",  // string
    ["packageorderuuid"] = "example_packageorderuuid",  // string
    ["phoneNumber"] = "example_phoneNumber",  // string
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
| `consumerUUID` | `string` | No |  |
| `corporateUUID` | `string` | No |  |
| `country` | `string` | No | Country associated with the package. |
| `descriptionKey` | `string` | No | Key for the description of the package. |
| `filter` | `Dictionary<string, object?>` | No |  |
| `language` | `string` | Yes |  |
| `nameKey` | `string` | No | Key for the name of the package. |
| `packageStatus` | `string` | No | Status of the package. |
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `pagination` | `Dictionary<string, object?>` | No |  |
| `sorting` | `Dictionary<string, object?>` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `consumerUUID` | - |
| `corporateUUID` | - |
| `country` | - |
| `descriptionKey` | - |
| `filter` | - |
| `language` | Yes |
| `nameKey` | - |
| `packageStatus` | - |
| `packageUUID` | - |
| `pagination` | - |
| `sorting` | - |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.MerchantPortalPamPackageController().Create(new Dictionary<string, object?>
{
    ["language"] = "example_language",  // string
    ["packageUUID"] = "example_packageUUID",  // string
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
| `consumerUUID` | `string` | No |  |
| `filter` | `Dictionary<string, object?>` | No |  |
| `language` | `string` | No |  |
| `merchantID` | `string` | No |  |
| `packageOrderUUID` | `string` | Yes |  |
| `pagination` | `Dictionary<string, object?>` | No |  |
| `productOrderUUID` | `string` | Yes |  |
| `productUUID` | `string` | Yes |  |
| `reason_decline` | `string` | Yes | Reason for product decline. |
| `sorting` | `Dictionary<string, object?>` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.MerchantPortalPamProductController().Create(new Dictionary<string, object?>
{
    ["packageOrderUUID"] = "example_packageOrderUUID",  // string
    ["productOrderUUID"] = "example_productOrderUUID",  // string
    ["productUUID"] = "example_productUUID",  // string
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
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `productUUIDs` | `List<object?>` | Yes | The list of unique identifiers of the products. |
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.OutputAddProduct().Create(new Dictionary<string, object?>
{
    ["packageUUID"] = "example_packageUUID",  // string
    ["productUUIDs"] = new List<object?>(),  // List<object?>
    ["responseCode"] = 1L,  // long
    ["responseMessage"] = "example_responseMessage",  // string
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
| `acquirerId` | `string` | No | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `bool` | Yes | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `string` | Yes | Name of the application form template. |
| `contractNeeded` | `bool` | Yes | Indication whether contract is needed or not. |
| `credentialsNeeded` | `bool` | No | Indication whether credentials are needed or not. |
| `descriptionKey` | `string` | Yes | Key indicator for product description. |
| `nameKey` | `string` | Yes | Key indicator for product name. |
| `prescreeningAllowed` | `bool` | Yes | Indication whether prescreening is allowed or not. |
| `productName` | `string` | Yes | Name of the product. |
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `terminalTemplateName` | `string` | Yes | Name of the terminal template. |
| `vendorName` | `string` | Yes | Name of the vendor. |
| `xmlTemplateFile` | `string` | Yes | A string value containing the XML template file encoded in Base64. |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.OutputCreateProduct().Create(new Dictionary<string, object?>
{
    ["allowMultipleOrders"] = true,  // bool
    ["appFormTemplateName"] = "example_appFormTemplateName",  // string
    ["contractNeeded"] = true,  // bool
    ["descriptionKey"] = "example_descriptionKey",  // string
    ["nameKey"] = "example_nameKey",  // string
    ["prescreeningAllowed"] = true,  // bool
    ["productName"] = "example_productName",  // string
    ["responseCode"] = 1L,  // long
    ["responseMessage"] = "example_responseMessage",  // string
    ["terminalTemplateName"] = "example_terminalTemplateName",  // string
    ["vendorName"] = "example_vendorName",  // string
    ["xmlTemplateFile"] = "example_xmlTemplateFile",  // string
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
| `batch` | `Dictionary<string, object?>` | No |  |
| `lines` | `Dictionary<string, object?>` | No |  |
| `progress` | `Dictionary<string, object?>` | No |  |

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
| `items` | `List<object?>` | No |  |
| `pagination` | `Dictionary<string, object?>` | Yes |  |
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `sorting` | `Dictionary<string, object?>` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `items` | - |
| `pagination` | Yes |
| `responseCode` | - |
| `responseMessage` | - |
| `sorting` | - |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.OutputList().Create(new Dictionary<string, object?>
{
    ["pagination"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["responseCode"] = 1L,  // long
    ["responseMessage"] = "example_responseMessage",  // string
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
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

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
| `productOrderUUIDs` | `List<object?>` | Yes |  |
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `targetPackageOrderUUID` | `string` | Yes |  |
| `targetProductOrderUUID` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.OutputMoveTid().Create(new Dictionary<string, object?>
{
    ["productOrderUUIDs"] = new List<object?>(),  // List<object?>
    ["responseCode"] = 1L,  // long
    ["responseMessage"] = "example_responseMessage",  // string
    ["targetPackageOrderUUID"] = "example_targetPackageOrderUUID",  // string
    ["targetProductOrderUUID"] = "example_targetProductOrderUUID",  // string
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
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `productUUIDs` | `List<object?>` | Yes | List of product unique identifiers. |
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.OutputRemoveProduct().Create(new Dictionary<string, object?>
{
    ["packageUUID"] = "example_packageUUID",  // string
    ["productUUIDs"] = new List<object?>(),  // List<object?>
    ["responseCode"] = 1L,  // long
    ["responseMessage"] = "example_responseMessage",  // string
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
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.OutputStart().Create(new Dictionary<string, object?>
{
    ["responseCode"] = 1L,  // long
    ["responseMessage"] = "example_responseMessage",  // string
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
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
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
| `allowMultipleOrders` | `bool` | No | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `string` | No | The name of the application form |
| `contractNeeded` | `bool` | No | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `bool` | No | An attribute to indicate if credentials are needed |
| `descriptionKey` | `string` | No | The description of the product |
| `nameKey` | `string` | No | The key of the product name |
| `prescreeningAllowed` | `bool` | No | An attribute to indicate if prescreening is allowed |
| `productName` | `string` | No | The name of the product |
| `productStatus` | `string` | No | The status of the product |
| `productUUID` | `string` | Yes | The UUID of the product to update |
| `responseCode` | `long` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `vendorName` | `string` | No | The name of the vendor |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.OutputUpdateProduct().Create(new Dictionary<string, object?>
{
    ["productUUID"] = "example_productUUID",  // string
    ["responseCode"] = 1L,  // long
    ["responseMessage"] = "example_responseMessage",  // string
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

