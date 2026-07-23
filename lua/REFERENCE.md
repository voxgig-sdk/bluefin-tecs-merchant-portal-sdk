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
| `product_order_uuid` | `string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:MerchantPortalPamContractController():create({
  language = --[[ string ]],
  product_order_uuid = --[[ string ]],
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
| `app_form_field_desc_uuid` | `string` | Yes |  |
| `package_order_uuid` | `string` | No |  |
| `product_order_uuid` | `string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:MerchantPortalPamDocumentController():create({
  app_form_field_desc_uuid = --[[ string ]],
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
| `app_form_fields_desc_uuid` | `string` | Yes |  |
| `filter` | `table` | No |  |
| `language` | `string` | Yes |  |
| `package_order` | `table` | No |  |
| `package_order_uuid` | `string` | Yes |  |
| `package_uuid` | `string` | No |  |
| `product_order` | `table` | No |  |
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

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:MerchantPortalPamFormController():create({
  app_form_fields_desc_uuid = --[[ string ]],
  language = --[[ string ]],
  package_order_uuid = --[[ string ]],
  reason_of_reopening = --[[ string ]],
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
| `client_secret` | `string` | No |  |
| `mandator_name` | `string` | Yes |  |
| `notification_email` | `string` | No |  |
| `package_uuid` | `string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:MerchantPortalPamMandatorController():create({
  mandator_name = --[[ string ]],
  package_uuid = --[[ string ]],
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
| `terminal_id` | `table` | No |  |
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

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:MerchantPortalPamMerchantController():create({
  business_registration_number = --[[ string ]],
  company_name = --[[ string ]],
  corporate_uuid = --[[ string ]],
  currency = --[[ string ]],
  email = --[[ string ]],
  language = --[[ string ]],
  login = --[[ string ]],
  mandator = --[[ string ]],
  merchant_contract_number = --[[ string ]],
  packageorderuuid = --[[ string ]],
  phone_number = --[[ string ]],
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
| `consumer_uuid` | `string` | No |  |
| `corporate_uuid` | `string` | No |  |
| `country` | `string` | No |  |
| `description_key` | `string` | No |  |
| `filter` | `table` | No |  |
| `language` | `string` | Yes |  |
| `name_key` | `string` | No |  |
| `package_status` | `string` | No |  |
| `package_uuid` | `string` | Yes |  |
| `pagination` | `table` | No |  |
| `sorting` | `table` | No |  |

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

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:MerchantPortalPamPackageController():create({
  language = --[[ string ]],
  package_uuid = --[[ string ]],
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
| `consumer_uuid` | `string` | No |  |
| `filter` | `table` | No |  |
| `language` | `string` | No |  |
| `merchant_id` | `string` | No |  |
| `package_order_uuid` | `string` | Yes |  |
| `pagination` | `table` | No |  |
| `product_order_uuid` | `string` | Yes |  |
| `product_uuid` | `string` | Yes |  |
| `reason_decline` | `string` | Yes |  |
| `sorting` | `table` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:MerchantPortalPamProductController():create({
  package_order_uuid = --[[ string ]],
  product_order_uuid = --[[ string ]],
  product_uuid = --[[ string ]],
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
| `package_uuid` | `string` | Yes |  |
| `product_uui_d` | `table` | Yes |  |
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:OutputAddProduct():create({
  package_uuid = --[[ string ]],
  product_uui_d = --[[ table ]],
  response_code = --[[ number ]],
  response_message = --[[ string ]],
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
| `acquirer_id` | `string` | No |  |
| `allow_multiple_order` | `boolean` | Yes |  |
| `app_form_template_name` | `string` | Yes |  |
| `contract_needed` | `boolean` | Yes |  |
| `credentials_needed` | `boolean` | No |  |
| `description_key` | `string` | Yes |  |
| `name_key` | `string` | Yes |  |
| `prescreening_allowed` | `boolean` | Yes |  |
| `product_name` | `string` | Yes |  |
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |
| `terminal_template_name` | `string` | Yes |  |
| `vendor_name` | `string` | Yes |  |
| `xml_template_file` | `string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:OutputCreateProduct():create({
  allow_multiple_order = --[[ boolean ]],
  app_form_template_name = --[[ string ]],
  contract_needed = --[[ boolean ]],
  description_key = --[[ string ]],
  name_key = --[[ string ]],
  prescreening_allowed = --[[ boolean ]],
  product_name = --[[ string ]],
  response_code = --[[ number ]],
  response_message = --[[ string ]],
  terminal_template_name = --[[ string ]],
  vendor_name = --[[ string ]],
  xml_template_file = --[[ string ]],
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
| `detail` | `table` | No |  |
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |

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
| `item` | `table` | No |  |
| `pagination` | `table` | Yes |  |
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |
| `sorting` | `table` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:OutputList():create({
  pagination = --[[ table ]],
  response_code = --[[ number ]],
  response_message = --[[ string ]],
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
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |

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
| `product_order_uui_d` | `table` | Yes |  |
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |
| `target_package_order_uuid` | `string` | Yes |  |
| `target_product_order_uuid` | `string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:OutputMoveTid():create({
  product_order_uui_d = --[[ table ]],
  response_code = --[[ number ]],
  response_message = --[[ string ]],
  target_package_order_uuid = --[[ string ]],
  target_product_order_uuid = --[[ string ]],
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
| `package_uuid` | `string` | Yes |  |
| `product_uui_d` | `table` | Yes |  |
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:OutputRemoveProduct():create({
  package_uuid = --[[ string ]],
  product_uui_d = --[[ table ]],
  response_code = --[[ number ]],
  response_message = --[[ string ]],
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
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:OutputStart():create({
  response_code = --[[ number ]],
  response_message = --[[ string ]],
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
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |
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
| `allow_multiple_order` | `boolean` | No |  |
| `app_form_name` | `string` | No |  |
| `contract_needed` | `boolean` | No |  |
| `credentials_needed` | `boolean` | No |  |
| `description_key` | `string` | No |  |
| `name_key` | `string` | No |  |
| `prescreening_allowed` | `boolean` | No |  |
| `product_name` | `string` | No |  |
| `product_status` | `string` | No |  |
| `product_uuid` | `string` | Yes |  |
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |
| `vendor_name` | `string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:OutputUpdateProduct():create({
  product_uuid = --[[ string ]],
  response_code = --[[ number ]],
  response_message = --[[ string ]],
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

