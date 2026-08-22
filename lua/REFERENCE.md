# BluefinTecsMerchantPortal Lua SDK Reference

Complete API reference for the BluefinTecsMerchantPortal Lua SDK.


## BluefinTecsMerchantPortalSDK

### Constructor

```lua
local sdk = require("bluefin-tecs-merchant-portal_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts?, sdkopts?)`

Create a test client with mock features active. Both arguments are optional.

```lua
local client = sdk.test()
```


### Instance Methods

#### `MerchantPortalApiController(data)`

Create a new `MerchantPortalApiController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalCommonController(data)`

Create a new `MerchantPortalCommonController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamContractController(data)`

Create a new `MerchantPortalPamContractController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamDocumentController(data)`

Create a new `MerchantPortalPamDocumentController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamFormController(data)`

Create a new `MerchantPortalPamFormController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamMandatorController(data)`

Create a new `MerchantPortalPamMandatorController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamMerchantController(data)`

Create a new `MerchantPortalPamMerchantController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamPackageController(data)`

Create a new `MerchantPortalPamPackageController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamProductController(data)`

Create a new `MerchantPortalPamProductController` entity instance. Pass `nil` for no initial data.

#### `OutputAddProduct(data)`

Create a new `OutputAddProduct` entity instance. Pass `nil` for no initial data.

#### `OutputCreateProduct(data)`

Create a new `OutputCreateProduct` entity instance. Pass `nil` for no initial data.

#### `OutputDetail(data)`

Create a new `OutputDetail` entity instance. Pass `nil` for no initial data.

#### `OutputList(data)`

Create a new `OutputList` entity instance. Pass `nil` for no initial data.

#### `OutputMessage(data)`

Create a new `OutputMessage` entity instance. Pass `nil` for no initial data.

#### `OutputMoveTid(data)`

Create a new `OutputMoveTid` entity instance. Pass `nil` for no initial data.

#### `OutputRemoveProduct(data)`

Create a new `OutputRemoveProduct` entity instance. Pass `nil` for no initial data.

#### `OutputStart(data)`

Create a new `OutputStart` entity instance. Pass `nil` for no initial data.

#### `OutputStatus(data)`

Create a new `OutputStatus` entity instance. Pass `nil` for no initial data.

#### `OutputUpdateProduct(data)`

Create a new `OutputUpdateProduct` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## MerchantPortalApiControllerEntity

```lua
local merchant_portal_api_controller = client:MerchantPortalApiController(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `number` | No | Account number provided by the acquirer. |
| `additional_data` | `table` | No | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `string` | Yes | Merchant business registration number as stated in the company registry. |
| `city` | `string` | Yes | Merchant's address: city. |
| `corporateuuid` | `string` | No | Unique identifier for the corporate entity (UUID format). |
| `country` | `string` | Yes | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `string` | Yes | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `number` | Yes | Merchant category code as defined by the payment network. |
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
| `sorting_code` | `number` | No | Sorting code provided by the acquirer. |
| `state` | `string` | No | Merchant's address: state. |
| `street` | `string` | Yes | Merchant's address: street and house number. |
| `terminal_country_code` | `string` | Yes | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `string` | Yes | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `string` | Yes | Physical or logical location of the terminal. |
| `terminal_serial_number` | `string` | Yes | Terminal serial number. |
| `terminalid` | `number` | Yes | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `string` | No | Terminal ID as set by the acquirer (optional). |
| `user_email` | `string` | No | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `string` | No | Phone number of the user acting on behalf of the merchant. |
| `username` | `string` | No | Merchant username for MPOS. |
| `vu_nummer` | `string` | Yes | Merchant contract number with the acquirer. |
| `web_shop_url` | `string` | No | URL of the merchant's web shop. |
| `zipcode` | `string` | Yes | Merchant's address: postal code. |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:MerchantPortalApiController():create({
  business_reg_number = --[[ string ]],
  city = --[[ string ]],
  country = --[[ string ]],
  currency = --[[ string ]],
  merchant_category_code = --[[ number ]],
  merchant_name = --[[ string ]],
  packageid = --[[ string ]],
  packageorderuuid = --[[ string ]],
  reason_deactivation = --[[ string ]],
  reason_reactivation = --[[ string ]],
  street = --[[ string ]],
  terminal_country_code = --[[ string ]],
  terminal_language_code = --[[ string ]],
  terminal_location = --[[ string ]],
  terminal_serial_number = --[[ string ]],
  terminalid = --[[ number ]],
  vu_nummer = --[[ string ]],
  zipcode = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalApiControllerEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## MerchantPortalCommonControllerEntity

```lua
local merchant_portal_common_controller = client:MerchantPortalCommonController(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:MerchantPortalCommonController():load()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalCommonControllerEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## MerchantPortalPamContractControllerEntity

```lua
local merchant_portal_pam_contract_controller = client:MerchantPortalPamContractController(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `string` | Yes |  |
| `productOrderUUID` | `string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:MerchantPortalPamContractController():create({
  language = --[[ string ]],
  productOrderUUID = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamContractControllerEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## MerchantPortalPamDocumentControllerEntity

```lua
local merchant_portal_pam_document_controller = client:MerchantPortalPamDocumentController(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appFormFieldDescUUID` | `string` | Yes |  |
| `packageOrderUUID` | `string` | No | UUID of the package order. |
| `productOrderUUID` | `string` | No | UUID of the product order. |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:MerchantPortalPamDocumentController():create({
  appFormFieldDescUUID = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamDocumentControllerEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## MerchantPortalPamFormControllerEntity

```lua
local merchant_portal_pam_form_controller = client:MerchantPortalPamFormController(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appFormFieldsDescUUID` | `string` | Yes |  |
| `filter` | `table` | No |  |
| `language` | `string` | Yes |  |
| `packageOrder` | `table` | No |  |
| `packageOrderUUID` | `string` | Yes | UUID of the package order. |
| `packageUUID` | `string` | No |  |
| `productOrderUUID` | `string` | No | UUID of the product order. |
| `productOrders` | `table` | No |  |
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

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:MerchantPortalPamFormController():create({
  appFormFieldsDescUUID = --[[ string ]],
  language = --[[ string ]],
  packageOrderUUID = --[[ string ]],
  reasonOfReopening = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamFormControllerEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## MerchantPortalPamMandatorControllerEntity

```lua
local merchant_portal_pam_mandator_controller = client:MerchantPortalPamMandatorController(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `clientSecret` | `string` | No |  |
| `mandatorName` | `string` | Yes |  |
| `notificationEmail` | `string` | No |  |
| `packageUUID` | `string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:MerchantPortalPamMandatorController():create({
  mandatorName = --[[ string ]],
  packageUUID = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamMandatorControllerEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## MerchantPortalPamMerchantControllerEntity

```lua
local merchant_portal_pam_merchant_controller = client:MerchantPortalPamMerchantController(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `table` | No | Optional additional merchant-specific data related to enabling acquiring. |
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
| `terminalIds` | `table` | No | Optional list of terminal IDs for which acquiring should be activated. |
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

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:MerchantPortalPamMerchantController():create({
  businessRegistrationNumber = --[[ string ]],
  companyName = --[[ string ]],
  corporateUUID = --[[ string ]],
  currency = --[[ string ]],
  email = --[[ string ]],
  language = --[[ string ]],
  login = --[[ string ]],
  mandator = --[[ string ]],
  merchantContractNumber = --[[ string ]],
  packageorderuuid = --[[ string ]],
  phoneNumber = --[[ string ]],
  productid_acquirer = --[[ string ]],
  vu_nummer = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamMerchantControllerEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## MerchantPortalPamPackageControllerEntity

```lua
local merchant_portal_pam_package_controller = client:MerchantPortalPamPackageController(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumerUUID` | `string` | No |  |
| `corporateUUID` | `string` | No |  |
| `country` | `string` | No | Country associated with the package. |
| `descriptionKey` | `string` | No | Key for the description of the package. |
| `filter` | `table` | No |  |
| `language` | `string` | Yes |  |
| `nameKey` | `string` | No | Key for the name of the package. |
| `packageStatus` | `string` | No | Status of the package. |
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `pagination` | `table` | No |  |
| `sorting` | `table` | No |  |

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

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:MerchantPortalPamPackageController():create({
  language = --[[ string ]],
  packageUUID = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamPackageControllerEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## MerchantPortalPamProductControllerEntity

```lua
local merchant_portal_pam_product_controller = client:MerchantPortalPamProductController(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumerUUID` | `string` | No |  |
| `filter` | `table` | No |  |
| `language` | `string` | No |  |
| `merchantID` | `string` | No |  |
| `packageOrderUUID` | `string` | Yes |  |
| `pagination` | `table` | No |  |
| `productOrderUUID` | `string` | Yes |  |
| `productUUID` | `string` | Yes |  |
| `reason_decline` | `string` | Yes | Reason for product decline. |
| `sorting` | `table` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:MerchantPortalPamProductController():create({
  packageOrderUUID = --[[ string ]],
  productOrderUUID = --[[ string ]],
  productUUID = --[[ string ]],
  reason_decline = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamProductControllerEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## OutputAddProductEntity

```lua
local output_add_product = client:OutputAddProduct(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `productUUIDs` | `table` | Yes | The list of unique identifiers of the products. |
| `responseCode` | `number` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:OutputAddProduct():create({
  packageUUID = --[[ string ]],
  productUUIDs = --[[ table ]],
  responseCode = --[[ number ]],
  responseMessage = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputAddProductEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## OutputCreateProductEntity

```lua
local output_create_product = client:OutputCreateProduct(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acquirerId` | `string` | No | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `boolean` | Yes | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `string` | Yes | Name of the application form template. |
| `contractNeeded` | `boolean` | Yes | Indication whether contract is needed or not. |
| `credentialsNeeded` | `boolean` | No | Indication whether credentials are needed or not. |
| `descriptionKey` | `string` | Yes | Key indicator for product description. |
| `nameKey` | `string` | Yes | Key indicator for product name. |
| `prescreeningAllowed` | `boolean` | Yes | Indication whether prescreening is allowed or not. |
| `productName` | `string` | Yes | Name of the product. |
| `responseCode` | `number` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `terminalTemplateName` | `string` | Yes | Name of the terminal template. |
| `vendorName` | `string` | Yes | Name of the vendor. |
| `xmlTemplateFile` | `string` | Yes | A string value containing the XML template file encoded in Base64. |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:OutputCreateProduct():create({
  allowMultipleOrders = --[[ boolean ]],
  appFormTemplateName = --[[ string ]],
  contractNeeded = --[[ boolean ]],
  descriptionKey = --[[ string ]],
  nameKey = --[[ string ]],
  prescreeningAllowed = --[[ boolean ]],
  productName = --[[ string ]],
  responseCode = --[[ number ]],
  responseMessage = --[[ string ]],
  terminalTemplateName = --[[ string ]],
  vendorName = --[[ string ]],
  xmlTemplateFile = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputCreateProductEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## OutputDetailEntity

```lua
local output_detail = client:OutputDetail(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `batch` | `table` | No |  |
| `lines` | `table` | No |  |
| `progress` | `table` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:OutputDetail():load({ id = "output_detail_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputDetailEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## OutputListEntity

```lua
local output_list = client:OutputList(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `items` | `table` | No |  |
| `pagination` | `table` | Yes |  |
| `responseCode` | `number` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `sorting` | `table` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `items` | - |
| `pagination` | Yes |
| `responseCode` | - |
| `responseMessage` | - |
| `sorting` | - |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:OutputList():create({
  pagination = --[[ table ]],
  responseCode = --[[ number ]],
  responseMessage = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputListEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## OutputMessageEntity

```lua
local output_message = client:OutputMessage(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `responseCode` | `number` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:OutputMessage():load({ id = "output_message_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputMessageEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## OutputMoveTidEntity

```lua
local output_move_tid = client:OutputMoveTid(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `productOrderUUIDs` | `table` | Yes |  |
| `responseCode` | `number` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `targetPackageOrderUUID` | `string` | Yes |  |
| `targetProductOrderUUID` | `string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:OutputMoveTid():create({
  productOrderUUIDs = --[[ table ]],
  responseCode = --[[ number ]],
  responseMessage = --[[ string ]],
  targetPackageOrderUUID = --[[ string ]],
  targetProductOrderUUID = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputMoveTidEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## OutputRemoveProductEntity

```lua
local output_remove_product = client:OutputRemoveProduct(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `productUUIDs` | `table` | Yes | List of product unique identifiers. |
| `responseCode` | `number` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:OutputRemoveProduct():create({
  packageUUID = --[[ string ]],
  productUUIDs = --[[ table ]],
  responseCode = --[[ number ]],
  responseMessage = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputRemoveProductEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## OutputStartEntity

```lua
local output_start = client:OutputStart(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No |  |
| `responseCode` | `number` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:OutputStart():create({
  responseCode = --[[ number ]],
  responseMessage = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputStartEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## OutputStatusEntity

```lua
local output_status = client:OutputStatus(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `number` | No |  |
| `responseCode` | `number` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `status` | `string` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:OutputStatus():load({ id = "output_status_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputStatusEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## OutputUpdateProductEntity

```lua
local output_update_product = client:OutputUpdateProduct(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `allowMultipleOrders` | `boolean` | No | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `string` | No | The name of the application form |
| `contractNeeded` | `boolean` | No | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `boolean` | No | An attribute to indicate if credentials are needed |
| `descriptionKey` | `string` | No | The description of the product |
| `nameKey` | `string` | No | The key of the product name |
| `prescreeningAllowed` | `boolean` | No | An attribute to indicate if prescreening is allowed |
| `productName` | `string` | No | The name of the product |
| `productStatus` | `string` | No | The status of the product |
| `productUUID` | `string` | Yes | The UUID of the product to update |
| `responseCode` | `number` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `vendorName` | `string` | No | The name of the vendor |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:OutputUpdateProduct():create({
  productUUID = --[[ string ]],
  responseCode = --[[ number ]],
  responseMessage = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputUpdateProductEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
  },
})
```

