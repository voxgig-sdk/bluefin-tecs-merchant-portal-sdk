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
| `account_number` | `number` | No |  |
| `additional_data` | `table` | No |  |
| `business_reg_number` | `string` | Yes |  |
| `city` | `string` | Yes |  |
| `corporateuuid` | `string` | No |  |
| `country` | `string` | Yes |  |
| `currency` | `string` | Yes |  |
| `merchant_category_code` | `number` | Yes |  |
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
| `sorting_code` | `number` | No |  |
| `state` | `string` | No |  |
| `street` | `string` | Yes |  |
| `terminal_country_code` | `string` | Yes |  |
| `terminal_language_code` | `string` | Yes |  |
| `terminal_location` | `string` | Yes |  |
| `terminal_serial_number` | `string` | Yes |  |
| `terminalid` | `number` | Yes |  |
| `terminalid_acquirer` | `string` | No |  |
| `user_email` | `string` | No |  |
| `user_phone_number` | `string` | No |  |
| `username` | `string` | No |  |
| `vu_nummer` | `string` | Yes |  |
| `web_shop_url` | `string` | No |  |
| `zipcode` | `string` | Yes |  |

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
| `packageOrderUUID` | `string` | No |  |
| `productOrderUUID` | `string` | No |  |

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
| `packageOrderUUID` | `string` | Yes |  |
| `packageUUID` | `string` | No |  |
| `productOrderUUID` | `string` | No |  |
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
| `additional_data` | `table` | No |  |
| `businessRegistrationNumber` | `string` | Yes |  |
| `city` | `string` | No |  |
| `companyName` | `string` | Yes |  |
| `corporateUUID` | `string` | Yes |  |
| `country` | `string` | No |  |
| `currency` | `string` | Yes |  |
| `email` | `string` | Yes |  |
| `language` | `string` | Yes |  |
| `login` | `string` | Yes |  |
| `mandator` | `string` | Yes |  |
| `merchantContractNumber` | `string` | Yes |  |
| `merchantName` | `string` | No |  |
| `merchant_category_code` | `string` | No |  |
| `packageUUID` | `string` | No |  |
| `packageorderuuid` | `string` | Yes |  |
| `phoneNumber` | `string` | Yes |  |
| `postalCode` | `string` | No |  |
| `productid_acquirer` | `string` | Yes |  |
| `region` | `string` | No |  |
| `registrationNumber` | `string` | No |  |
| `signature` | `string` | No |  |
| `street` | `string` | No |  |
| `terminalIds` | `table` | No |  |
| `terminalid_acquirer` | `string` | No |  |
| `vu_nummer` | `string` | Yes |  |

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
| `country` | `string` | No |  |
| `descriptionKey` | `string` | No |  |
| `filter` | `table` | No |  |
| `language` | `string` | Yes |  |
| `nameKey` | `string` | No |  |
| `packageStatus` | `string` | No |  |
| `packageUUID` | `string` | Yes |  |
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
| `reason_decline` | `string` | Yes |  |
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
| `packageUUID` | `string` | Yes |  |
| `productUUIDs` | `table` | Yes |  |
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |

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
| `acquirerId` | `string` | No |  |
| `allowMultipleOrders` | `boolean` | Yes |  |
| `appFormTemplateName` | `string` | Yes |  |
| `contractNeeded` | `boolean` | Yes |  |
| `credentialsNeeded` | `boolean` | No |  |
| `descriptionKey` | `string` | Yes |  |
| `nameKey` | `string` | Yes |  |
| `prescreeningAllowed` | `boolean` | Yes |  |
| `productName` | `string` | Yes |  |
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |
| `terminalTemplateName` | `string` | Yes |  |
| `vendorName` | `string` | Yes |  |
| `xmlTemplateFile` | `string` | Yes |  |

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
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |
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
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |

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
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |
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
| `packageUUID` | `string` | Yes |  |
| `productUUIDs` | `table` | Yes |  |
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |

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
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |

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
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |
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
| `allowMultipleOrders` | `boolean` | No |  |
| `appFormName` | `string` | No |  |
| `contractNeeded` | `boolean` | No |  |
| `credentialsNeeded` | `boolean` | No |  |
| `descriptionKey` | `string` | No |  |
| `nameKey` | `string` | No |  |
| `prescreeningAllowed` | `boolean` | No |  |
| `productName` | `string` | No |  |
| `productStatus` | `string` | No |  |
| `productUUID` | `string` | Yes |  |
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |
| `vendorName` | `string` | No |  |

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

