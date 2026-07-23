# BluefinTecsMerchantPortal Ruby SDK Reference

Complete API reference for the BluefinTecsMerchantPortal Ruby SDK.


## BluefinTecsMerchantPortalSDK

### Constructor

```ruby
require_relative 'BluefinTecsMerchantPortal_sdk'

client = BluefinTecsMerchantPortalSDK.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Hash` | SDK configuration options. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Hash` | Custom headers for all requests. |
| `options["feature"]` | `Hash` | Feature configuration. |
| `options["system"]` | `Hash` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinTecsMerchantPortalSDK.test(testopts = nil, sdkopts = nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```ruby
client = BluefinTecsMerchantPortalSDK.test
```


### Instance Methods

#### `MerchantPortalApiController(data = nil)`

Create a new `MerchantPortalApiController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalCommonController(data = nil)`

Create a new `MerchantPortalCommonController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamContractController(data = nil)`

Create a new `MerchantPortalPamContractController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamDocumentController(data = nil)`

Create a new `MerchantPortalPamDocumentController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamFormController(data = nil)`

Create a new `MerchantPortalPamFormController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamMandatorController(data = nil)`

Create a new `MerchantPortalPamMandatorController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamMerchantController(data = nil)`

Create a new `MerchantPortalPamMerchantController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamPackageController(data = nil)`

Create a new `MerchantPortalPamPackageController` entity instance. Pass `nil` for no initial data.

#### `MerchantPortalPamProductController(data = nil)`

Create a new `MerchantPortalPamProductController` entity instance. Pass `nil` for no initial data.

#### `OutputAddProduct(data = nil)`

Create a new `OutputAddProduct` entity instance. Pass `nil` for no initial data.

#### `OutputCreateProduct(data = nil)`

Create a new `OutputCreateProduct` entity instance. Pass `nil` for no initial data.

#### `OutputDetail(data = nil)`

Create a new `OutputDetail` entity instance. Pass `nil` for no initial data.

#### `OutputList(data = nil)`

Create a new `OutputList` entity instance. Pass `nil` for no initial data.

#### `OutputMessage(data = nil)`

Create a new `OutputMessage` entity instance. Pass `nil` for no initial data.

#### `OutputMoveTid(data = nil)`

Create a new `OutputMoveTid` entity instance. Pass `nil` for no initial data.

#### `OutputRemoveProduct(data = nil)`

Create a new `OutputRemoveProduct` entity instance. Pass `nil` for no initial data.

#### `OutputStart(data = nil)`

Create a new `OutputStart` entity instance. Pass `nil` for no initial data.

#### `OutputStatus(data = nil)`

Create a new `OutputStatus` entity instance. Pass `nil` for no initial data.

#### `OutputUpdateProduct(data = nil)`

Create a new `OutputUpdateProduct` entity instance. Pass `nil` for no initial data.

#### `options_map -> Hash`

Return a deep copy of the current SDK options.

#### `get_utility -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs = {}) -> Hash`

Make a direct HTTP request to any API endpoint. Returns a result hash
(`{ "ok" => ..., "status" => ..., "data" => ..., "err" => ... }`); it
does not raise — inspect `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Hash` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `Hash` | Query string parameters. |
| `fetchargs["headers"]` | `Hash` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (hashes are JSON-serialized). |
| `fetchargs["ctrl"]` | `Hash` | Control options (e.g. `{ "explain" => true }`). |

**Returns:** `Hash`

#### `prepare(fetchargs = {}) -> Hash`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`. Raises on error.

**Returns:** `Hash` (the fetch definition; raises on error)


---

## MerchantPortalApiControllerEntity

```ruby
merchant_portal_api_controller = client.MerchantPortalApiController
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `Integer` | No |  |
| `additional_data` | `Hash` | No |  |
| `business_reg_number` | `String` | Yes |  |
| `city` | `String` | Yes |  |
| `corporateuuid` | `String` | No |  |
| `country` | `String` | Yes |  |
| `currency` | `String` | Yes |  |
| `merchant_category_code` | `Integer` | Yes |  |
| `merchant_email` | `String` | No |  |
| `merchant_name` | `String` | Yes |  |
| `merchant_phone_number` | `String` | No |  |
| `packageid` | `String` | Yes |  |
| `packageorderuuid` | `String` | Yes |  |
| `password` | `String` | No |  |
| `productid` | `String` | No |  |
| `productid_acquirer` | `String` | No |  |
| `reason_deactivation` | `String` | Yes |  |
| `reason_reactivation` | `String` | Yes |  |
| `sorting_code` | `Integer` | No |  |
| `state` | `String` | No |  |
| `street` | `String` | Yes |  |
| `terminal_country_code` | `String` | Yes |  |
| `terminal_language_code` | `String` | Yes |  |
| `terminal_location` | `String` | Yes |  |
| `terminal_serial_number` | `String` | Yes |  |
| `terminalid` | `Integer` | Yes |  |
| `terminalid_acquirer` | `String` | No |  |
| `user_email` | `String` | No |  |
| `user_phone_number` | `String` | No |  |
| `username` | `String` | No |  |
| `vu_nummer` | `String` | Yes |  |
| `web_shop_url` | `String` | No |  |
| `zipcode` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.MerchantPortalApiController.create({
  "business_reg_number" => "example_business_reg_number", # String
  "city" => "example_city", # String
  "country" => "example_country", # String
  "currency" => "example_currency", # String
  "merchant_category_code" => 1, # Integer
  "merchant_name" => "example_merchant_name", # String
  "packageid" => "example_packageid", # String
  "packageorderuuid" => "example_packageorderuuid", # String
  "reason_deactivation" => "example_reason_deactivation", # String
  "reason_reactivation" => "example_reason_reactivation", # String
  "street" => "example_street", # String
  "terminal_country_code" => "example_terminal_country_code", # String
  "terminal_language_code" => "example_terminal_language_code", # String
  "terminal_location" => "example_terminal_location", # String
  "terminal_serial_number" => "example_terminal_serial_number", # String
  "terminalid" => 1, # Integer
  "vu_nummer" => "example_vu_nummer", # String
  "zipcode" => "example_zipcode", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `MerchantPortalApiControllerEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## MerchantPortalCommonControllerEntity

```ruby
merchant_portal_common_controller = client.MerchantPortalCommonController
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.MerchantPortalCommonController.load()
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `MerchantPortalCommonControllerEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## MerchantPortalPamContractControllerEntity

```ruby
merchant_portal_pam_contract_controller = client.MerchantPortalPamContractController
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `String` | Yes |  |
| `product_order_uuid` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.MerchantPortalPamContractController.create({
  "language" => "example_language", # String
  "product_order_uuid" => "example_product_order_uuid", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `MerchantPortalPamContractControllerEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## MerchantPortalPamDocumentControllerEntity

```ruby
merchant_portal_pam_document_controller = client.MerchantPortalPamDocumentController
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_field_desc_uuid` | `String` | Yes |  |
| `package_order_uuid` | `String` | No |  |
| `product_order_uuid` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.MerchantPortalPamDocumentController.create({
  "app_form_field_desc_uuid" => "example_app_form_field_desc_uuid", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `MerchantPortalPamDocumentControllerEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## MerchantPortalPamFormControllerEntity

```ruby
merchant_portal_pam_form_controller = client.MerchantPortalPamFormController
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_fields_desc_uuid` | `String` | Yes |  |
| `filter` | `Hash` | No |  |
| `language` | `String` | Yes |  |
| `package_order` | `Hash` | No |  |
| `package_order_uuid` | `String` | Yes |  |
| `package_uuid` | `String` | No |  |
| `product_order` | `Array` | No |  |
| `product_order_uuid` | `String` | No |  |
| `reason_of_reopening` | `String` | Yes |  |

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

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.MerchantPortalPamFormController.create({
  "app_form_fields_desc_uuid" => "example_app_form_fields_desc_uuid", # String
  "language" => "example_language", # String
  "package_order_uuid" => "example_package_order_uuid", # String
  "reason_of_reopening" => "example_reason_of_reopening", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `MerchantPortalPamFormControllerEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## MerchantPortalPamMandatorControllerEntity

```ruby
merchant_portal_pam_mandator_controller = client.MerchantPortalPamMandatorController
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client_secret` | `String` | No |  |
| `mandator_name` | `String` | Yes |  |
| `notification_email` | `String` | No |  |
| `package_uuid` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.MerchantPortalPamMandatorController.create({
  "mandator_name" => "example_mandator_name", # String
  "package_uuid" => "example_package_uuid", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `MerchantPortalPamMandatorControllerEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## MerchantPortalPamMerchantControllerEntity

```ruby
merchant_portal_pam_merchant_controller = client.MerchantPortalPamMerchantController
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `Hash` | No |  |
| `business_registration_number` | `String` | Yes |  |
| `city` | `String` | No |  |
| `company_name` | `String` | Yes |  |
| `corporate_uuid` | `String` | Yes |  |
| `country` | `String` | No |  |
| `currency` | `String` | Yes |  |
| `email` | `String` | Yes |  |
| `language` | `String` | Yes |  |
| `login` | `String` | Yes |  |
| `mandator` | `String` | Yes |  |
| `merchant_category_code` | `String` | No |  |
| `merchant_contract_number` | `String` | Yes |  |
| `merchant_name` | `String` | No |  |
| `package_uuid` | `String` | No |  |
| `packageorderuuid` | `String` | Yes |  |
| `phone_number` | `String` | Yes |  |
| `postal_code` | `String` | No |  |
| `productid_acquirer` | `String` | Yes |  |
| `region` | `String` | No |  |
| `registration_number` | `String` | No |  |
| `signature` | `String` | No |  |
| `street` | `String` | No |  |
| `terminal_id` | `Array` | No |  |
| `terminalid_acquirer` | `String` | No |  |
| `vu_nummer` | `String` | Yes |  |

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

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.MerchantPortalPamMerchantController.create({
  "business_registration_number" => "example_business_registration_number", # String
  "company_name" => "example_company_name", # String
  "corporate_uuid" => "example_corporate_uuid", # String
  "currency" => "example_currency", # String
  "email" => "example_email", # String
  "language" => "example_language", # String
  "login" => "example_login", # String
  "mandator" => "example_mandator", # String
  "merchant_contract_number" => "example_merchant_contract_number", # String
  "packageorderuuid" => "example_packageorderuuid", # String
  "phone_number" => "example_phone_number", # String
  "productid_acquirer" => "example_productid_acquirer", # String
  "vu_nummer" => "example_vu_nummer", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `MerchantPortalPamMerchantControllerEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## MerchantPortalPamPackageControllerEntity

```ruby
merchant_portal_pam_package_controller = client.MerchantPortalPamPackageController
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `String` | No |  |
| `corporate_uuid` | `String` | No |  |
| `country` | `String` | No |  |
| `description_key` | `String` | No |  |
| `filter` | `Hash` | No |  |
| `language` | `String` | Yes |  |
| `name_key` | `String` | No |  |
| `package_status` | `String` | No |  |
| `package_uuid` | `String` | Yes |  |
| `pagination` | `Hash` | No |  |
| `sorting` | `Hash` | No |  |

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

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.MerchantPortalPamPackageController.create({
  "language" => "example_language", # String
  "package_uuid" => "example_package_uuid", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `MerchantPortalPamPackageControllerEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## MerchantPortalPamProductControllerEntity

```ruby
merchant_portal_pam_product_controller = client.MerchantPortalPamProductController
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `String` | No |  |
| `filter` | `Hash` | No |  |
| `language` | `String` | No |  |
| `merchant_id` | `String` | No |  |
| `package_order_uuid` | `String` | Yes |  |
| `pagination` | `Hash` | No |  |
| `product_order_uuid` | `String` | Yes |  |
| `product_uuid` | `String` | Yes |  |
| `reason_decline` | `String` | Yes |  |
| `sorting` | `Hash` | No |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.MerchantPortalPamProductController.create({
  "package_order_uuid" => "example_package_order_uuid", # String
  "product_order_uuid" => "example_product_order_uuid", # String
  "product_uuid" => "example_product_uuid", # String
  "reason_decline" => "example_reason_decline", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `MerchantPortalPamProductControllerEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## OutputAddProductEntity

```ruby
output_add_product = client.OutputAddProduct
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `String` | Yes |  |
| `product_uui_d` | `Array` | Yes |  |
| `response_code` | `Integer` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.OutputAddProduct.create({
  "package_uuid" => "example_package_uuid", # String
  "product_uui_d" => [], # Array
  "response_code" => 1, # Integer
  "response_message" => "example_response_message", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `OutputAddProductEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## OutputCreateProductEntity

```ruby
output_create_product = client.OutputCreateProduct
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acquirer_id` | `String` | No |  |
| `allow_multiple_order` | `Boolean` | Yes |  |
| `app_form_template_name` | `String` | Yes |  |
| `contract_needed` | `Boolean` | Yes |  |
| `credentials_needed` | `Boolean` | No |  |
| `description_key` | `String` | Yes |  |
| `name_key` | `String` | Yes |  |
| `prescreening_allowed` | `Boolean` | Yes |  |
| `product_name` | `String` | Yes |  |
| `response_code` | `Integer` | Yes |  |
| `response_message` | `String` | Yes |  |
| `terminal_template_name` | `String` | Yes |  |
| `vendor_name` | `String` | Yes |  |
| `xml_template_file` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.OutputCreateProduct.create({
  "allow_multiple_order" => true, # Boolean
  "app_form_template_name" => "example_app_form_template_name", # String
  "contract_needed" => true, # Boolean
  "description_key" => "example_description_key", # String
  "name_key" => "example_name_key", # String
  "prescreening_allowed" => true, # Boolean
  "product_name" => "example_product_name", # String
  "response_code" => 1, # Integer
  "response_message" => "example_response_message", # String
  "terminal_template_name" => "example_terminal_template_name", # String
  "vendor_name" => "example_vendor_name", # String
  "xml_template_file" => "example_xml_template_file", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `OutputCreateProductEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## OutputDetailEntity

```ruby
output_detail = client.OutputDetail
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `detail` | `Hash` | No |  |
| `response_code` | `Integer` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.OutputDetail.load({ "id" => "output_detail_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `OutputDetailEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## OutputListEntity

```ruby
output_list = client.OutputList
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `item` | `Array` | No |  |
| `pagination` | `Hash` | Yes |  |
| `response_code` | `Integer` | Yes |  |
| `response_message` | `String` | Yes |  |
| `sorting` | `Hash` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.OutputList.create({
  "pagination" => {}, # Hash
  "response_code" => 1, # Integer
  "response_message" => "example_response_message", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `OutputListEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## OutputMessageEntity

```ruby
output_message = client.OutputMessage
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `response_code` | `Integer` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.OutputMessage.load({ "id" => "output_message_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `OutputMessageEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## OutputMoveTidEntity

```ruby
output_move_tid = client.OutputMoveTid
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `product_order_uui_d` | `Array` | Yes |  |
| `response_code` | `Integer` | Yes |  |
| `response_message` | `String` | Yes |  |
| `target_package_order_uuid` | `String` | Yes |  |
| `target_product_order_uuid` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.OutputMoveTid.create({
  "product_order_uui_d" => [], # Array
  "response_code" => 1, # Integer
  "response_message" => "example_response_message", # String
  "target_package_order_uuid" => "example_target_package_order_uuid", # String
  "target_product_order_uuid" => "example_target_product_order_uuid", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `OutputMoveTidEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## OutputRemoveProductEntity

```ruby
output_remove_product = client.OutputRemoveProduct
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `String` | Yes |  |
| `product_uui_d` | `Array` | Yes |  |
| `response_code` | `Integer` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.OutputRemoveProduct.create({
  "package_uuid" => "example_package_uuid", # String
  "product_uui_d" => [], # Array
  "response_code" => 1, # Integer
  "response_message" => "example_response_message", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `OutputRemoveProductEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## OutputStartEntity

```ruby
output_start = client.OutputStart
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `String` | No |  |
| `response_code` | `Integer` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.OutputStart.create({
  "response_code" => 1, # Integer
  "response_message" => "example_response_message", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `OutputStartEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## OutputStatusEntity

```ruby
output_status = client.OutputStatus
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `Integer` | No |  |
| `response_code` | `Integer` | Yes |  |
| `response_message` | `String` | Yes |  |
| `status` | `String` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.OutputStatus.load({ "id" => "output_status_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `OutputStatusEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## OutputUpdateProductEntity

```ruby
output_update_product = client.OutputUpdateProduct
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `allow_multiple_order` | `Boolean` | No |  |
| `app_form_name` | `String` | No |  |
| `contract_needed` | `Boolean` | No |  |
| `credentials_needed` | `Boolean` | No |  |
| `description_key` | `String` | No |  |
| `name_key` | `String` | No |  |
| `prescreening_allowed` | `Boolean` | No |  |
| `product_name` | `String` | No |  |
| `product_status` | `String` | No |  |
| `product_uuid` | `String` | Yes |  |
| `response_code` | `Integer` | Yes |  |
| `response_message` | `String` | Yes |  |
| `vendor_name` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.OutputUpdateProduct.create({
  "product_uuid" => "example_product_uuid", # String
  "response_code" => 1, # Integer
  "response_message" => "example_response_message", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `OutputUpdateProductEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ruby
client = BluefinTecsMerchantPortalSDK.new({
  "feature" => {
    "test" => { "active" => true },
  },
})
```

