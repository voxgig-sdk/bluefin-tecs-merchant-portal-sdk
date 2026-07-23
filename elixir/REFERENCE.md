# BluefinTecsMerchantPortal Elixir SDK Reference

Complete API reference for the BluefinTecsMerchantPortal Elixir SDK.


## BluefinTecsMerchantPortal

### Constructor

```elixir
sdk = BluefinTecsMerchantPortal.new(options)
```

Create a new SDK client. `options` is a struct value node — build one from a
native map with `BluefinTecsMerchantPortal.Helpers.deep/1`.

**Options:**

| Name | Type | Description |
| --- | --- | --- |
| `base` | `String.t()` | Base URL for API requests. |
| `prefix` | `String.t()` | URL prefix appended after base. |
| `suffix` | `String.t()` | URL suffix appended after path. |
| `headers` | `map()` | Custom headers for all requests. |
| `feature` | `map()` | Feature configuration. |
| `system` | `map()` | System overrides (e.g. custom fetch). |


### Constructors

#### `BluefinTecsMerchantPortal.test(testopts \\ nil, sdkopts \\ nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```elixir
sdk = BluefinTecsMerchantPortal.test()
```


### Functions

#### `BluefinTecsMerchantPortal.merchant_portal_api_controller(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.MerchantPortalApiController` handle.

#### `BluefinTecsMerchantPortal.merchant_portal_common_controller(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.MerchantPortalCommonController` handle.

#### `BluefinTecsMerchantPortal.merchant_portal_pam_contract_controller(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.MerchantPortalPamContractController` handle.

#### `BluefinTecsMerchantPortal.merchant_portal_pam_document_controller(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.MerchantPortalPamDocumentController` handle.

#### `BluefinTecsMerchantPortal.merchant_portal_pam_form_controller(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.MerchantPortalPamFormController` handle.

#### `BluefinTecsMerchantPortal.merchant_portal_pam_mandator_controller(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.MerchantPortalPamMandatorController` handle.

#### `BluefinTecsMerchantPortal.merchant_portal_pam_merchant_controller(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.MerchantPortalPamMerchantController` handle.

#### `BluefinTecsMerchantPortal.merchant_portal_pam_package_controller(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.MerchantPortalPamPackageController` handle.

#### `BluefinTecsMerchantPortal.merchant_portal_pam_product_controller(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.MerchantPortalPamProductController` handle.

#### `BluefinTecsMerchantPortal.output_add_product(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.OutputAddProduct` handle.

#### `BluefinTecsMerchantPortal.output_create_product(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.OutputCreateProduct` handle.

#### `BluefinTecsMerchantPortal.output_detail(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.OutputDetail` handle.

#### `BluefinTecsMerchantPortal.output_list(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.OutputList` handle.

#### `BluefinTecsMerchantPortal.output_message(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.OutputMessage` handle.

#### `BluefinTecsMerchantPortal.output_move_tid(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.OutputMoveTid` handle.

#### `BluefinTecsMerchantPortal.output_remove_product(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.OutputRemoveProduct` handle.

#### `BluefinTecsMerchantPortal.output_start(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.OutputStart` handle.

#### `BluefinTecsMerchantPortal.output_status(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.OutputStatus` handle.

#### `BluefinTecsMerchantPortal.output_update_product(client, entopts \\ nil)`

Create a `BluefinTecsMerchantPortal.Entity.OutputUpdateProduct` handle.

#### `options_map(client) :: map()`

Return a deep copy of the current SDK options.

#### `get_utility(client) :: map()`

Return the SDK utility node.

#### `direct(client, fetchargs) :: map()`

Make a direct HTTP request to any API endpoint. Returns a result node with
`ok`, `status`, `headers`, and `data` (or `err` on failure). This escape
hatch never raises — branch on `Voxgig.Struct.getprop(result, "ok")`.

**fetchargs keys:**

| Key | Type | Description |
| --- | --- | --- |
| `path` | `String.t()` | URL path with optional `{param}` placeholders. |
| `method` | `String.t()` | HTTP method (default: `"GET"`). |
| `params` | `map()` | Path parameter values. |
| `query` | `map()` | Query string parameters. |
| `headers` | `map()` | Request headers (merged with defaults). |
| `body` | `any()` | Request body (maps are JSON-serialized). |

#### `prepare(client, fetchargs) :: map()`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises
on error.


---

## BluefinTecsMerchantPortal.Entity.MerchantPortalApiController

```elixir
merchant_portal_api_controller = BluefinTecsMerchantPortal.merchant_portal_api_controller(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `integer()` | No |  |
| `additional_data` | `map()` | No |  |
| `business_reg_number` | `String.t()` | Yes |  |
| `city` | `String.t()` | Yes |  |
| `corporateuuid` | `String.t()` | No |  |
| `country` | `String.t()` | Yes |  |
| `currency` | `String.t()` | Yes |  |
| `merchant_category_code` | `integer()` | Yes |  |
| `merchant_email` | `String.t()` | No |  |
| `merchant_name` | `String.t()` | Yes |  |
| `merchant_phone_number` | `String.t()` | No |  |
| `packageid` | `String.t()` | Yes |  |
| `packageorderuuid` | `String.t()` | Yes |  |
| `password` | `String.t()` | No |  |
| `productid` | `String.t()` | No |  |
| `productid_acquirer` | `String.t()` | No |  |
| `reason_deactivation` | `String.t()` | Yes |  |
| `reason_reactivation` | `String.t()` | Yes |  |
| `sorting_code` | `integer()` | No |  |
| `state` | `String.t()` | No |  |
| `street` | `String.t()` | Yes |  |
| `terminal_country_code` | `String.t()` | Yes |  |
| `terminal_language_code` | `String.t()` | Yes |  |
| `terminal_location` | `String.t()` | Yes |  |
| `terminal_serial_number` | `String.t()` | Yes |  |
| `terminalid` | `integer()` | Yes |  |
| `terminalid_acquirer` | `String.t()` | No |  |
| `user_email` | `String.t()` | No |  |
| `user_phone_number` | `String.t()` | No |  |
| `username` | `String.t()` | No |  |
| `vu_nummer` | `String.t()` | Yes |  |
| `web_shop_url` | `String.t()` | No |  |
| `zipcode` | `String.t()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.MerchantPortalApiController.create(merchant_portal_api_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "business_reg_number" => "example_business_reg_number",  # String.t()
  "city" => "example_city",  # String.t()
  "country" => "example_country",  # String.t()
  "currency" => "example_currency",  # String.t()
  "merchant_category_code" => 1,  # integer()
  "merchant_name" => "example_merchant_name",  # String.t()
  "packageid" => "example_packageid",  # String.t()
  "packageorderuuid" => "example_packageorderuuid",  # String.t()
  "reason_deactivation" => "example_reason_deactivation",  # String.t()
  "reason_reactivation" => "example_reason_reactivation",  # String.t()
  "street" => "example_street",  # String.t()
  "terminal_country_code" => "example_terminal_country_code",  # String.t()
  "terminal_language_code" => "example_terminal_language_code",  # String.t()
  "terminal_location" => "example_terminal_location",  # String.t()
  "terminal_serial_number" => "example_terminal_serial_number",  # String.t()
  "terminalid" => 1,  # integer()
  "vu_nummer" => "example_vu_nummer",  # String.t()
  "zipcode" => "example_zipcode",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.MerchantPortalApiController` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.MerchantPortalCommonController

```elixir
merchant_portal_common_controller = BluefinTecsMerchantPortal.merchant_portal_common_controller(sdk)
```

### Operations

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.MerchantPortalCommonController.load(merchant_portal_common_controller, BluefinTecsMerchantPortal.Helpers.deep(%{}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.MerchantPortalCommonController` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.MerchantPortalPamContractController

```elixir
merchant_portal_pam_contract_controller = BluefinTecsMerchantPortal.merchant_portal_pam_contract_controller(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `String.t()` | Yes |  |
| `product_order_uuid` | `String.t()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamContractController.create(merchant_portal_pam_contract_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "language" => "example_language",  # String.t()
  "product_order_uuid" => "example_product_order_uuid",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.MerchantPortalPamContractController` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.MerchantPortalPamDocumentController

```elixir
merchant_portal_pam_document_controller = BluefinTecsMerchantPortal.merchant_portal_pam_document_controller(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_field_desc_uuid` | `String.t()` | Yes |  |
| `package_order_uuid` | `String.t()` | No |  |
| `product_order_uuid` | `String.t()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamDocumentController.create(merchant_portal_pam_document_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "app_form_field_desc_uuid" => "example_app_form_field_desc_uuid",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.MerchantPortalPamDocumentController` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.MerchantPortalPamFormController

```elixir
merchant_portal_pam_form_controller = BluefinTecsMerchantPortal.merchant_portal_pam_form_controller(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_fields_desc_uuid` | `String.t()` | Yes |  |
| `filter` | `map()` | No |  |
| `language` | `String.t()` | Yes |  |
| `package_order` | `map()` | No |  |
| `package_order_uuid` | `String.t()` | Yes |  |
| `package_uuid` | `String.t()` | No |  |
| `product_order` | `list()` | No |  |
| `product_order_uuid` | `String.t()` | No |  |
| `reason_of_reopening` | `String.t()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamFormController.create(merchant_portal_pam_form_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "app_form_fields_desc_uuid" => "example_app_form_fields_desc_uuid",  # String.t()
  "language" => "example_language",  # String.t()
  "package_order_uuid" => "example_package_order_uuid",  # String.t()
  "reason_of_reopening" => "example_reason_of_reopening",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.MerchantPortalPamFormController` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.MerchantPortalPamMandatorController

```elixir
merchant_portal_pam_mandator_controller = BluefinTecsMerchantPortal.merchant_portal_pam_mandator_controller(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client_secret` | `String.t()` | No |  |
| `mandator_name` | `String.t()` | Yes |  |
| `notification_email` | `String.t()` | No |  |
| `package_uuid` | `String.t()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamMandatorController.create(merchant_portal_pam_mandator_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "mandator_name" => "example_mandator_name",  # String.t()
  "package_uuid" => "example_package_uuid",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.MerchantPortalPamMandatorController` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.MerchantPortalPamMerchantController

```elixir
merchant_portal_pam_merchant_controller = BluefinTecsMerchantPortal.merchant_portal_pam_merchant_controller(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `map()` | No |  |
| `business_registration_number` | `String.t()` | Yes |  |
| `city` | `String.t()` | No |  |
| `company_name` | `String.t()` | Yes |  |
| `corporate_uuid` | `String.t()` | Yes |  |
| `country` | `String.t()` | No |  |
| `currency` | `String.t()` | Yes |  |
| `email` | `String.t()` | Yes |  |
| `language` | `String.t()` | Yes |  |
| `login` | `String.t()` | Yes |  |
| `mandator` | `String.t()` | Yes |  |
| `merchant_category_code` | `String.t()` | No |  |
| `merchant_contract_number` | `String.t()` | Yes |  |
| `merchant_name` | `String.t()` | No |  |
| `package_uuid` | `String.t()` | No |  |
| `packageorderuuid` | `String.t()` | Yes |  |
| `phone_number` | `String.t()` | Yes |  |
| `postal_code` | `String.t()` | No |  |
| `productid_acquirer` | `String.t()` | Yes |  |
| `region` | `String.t()` | No |  |
| `registration_number` | `String.t()` | No |  |
| `signature` | `String.t()` | No |  |
| `street` | `String.t()` | No |  |
| `terminal_id` | `list()` | No |  |
| `terminalid_acquirer` | `String.t()` | No |  |
| `vu_nummer` | `String.t()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamMerchantController.create(merchant_portal_pam_merchant_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "business_registration_number" => "example_business_registration_number",  # String.t()
  "company_name" => "example_company_name",  # String.t()
  "corporate_uuid" => "example_corporate_uuid",  # String.t()
  "currency" => "example_currency",  # String.t()
  "email" => "example_email",  # String.t()
  "language" => "example_language",  # String.t()
  "login" => "example_login",  # String.t()
  "mandator" => "example_mandator",  # String.t()
  "merchant_contract_number" => "example_merchant_contract_number",  # String.t()
  "packageorderuuid" => "example_packageorderuuid",  # String.t()
  "phone_number" => "example_phone_number",  # String.t()
  "productid_acquirer" => "example_productid_acquirer",  # String.t()
  "vu_nummer" => "example_vu_nummer",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.MerchantPortalPamMerchantController` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.MerchantPortalPamPackageController

```elixir
merchant_portal_pam_package_controller = BluefinTecsMerchantPortal.merchant_portal_pam_package_controller(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `String.t()` | No |  |
| `corporate_uuid` | `String.t()` | No |  |
| `country` | `String.t()` | No |  |
| `description_key` | `String.t()` | No |  |
| `filter` | `map()` | No |  |
| `language` | `String.t()` | Yes |  |
| `name_key` | `String.t()` | No |  |
| `package_status` | `String.t()` | No |  |
| `package_uuid` | `String.t()` | Yes |  |
| `pagination` | `map()` | No |  |
| `sorting` | `map()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamPackageController.create(merchant_portal_pam_package_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "language" => "example_language",  # String.t()
  "package_uuid" => "example_package_uuid",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.MerchantPortalPamPackageController` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.MerchantPortalPamProductController

```elixir
merchant_portal_pam_product_controller = BluefinTecsMerchantPortal.merchant_portal_pam_product_controller(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `String.t()` | No |  |
| `filter` | `map()` | No |  |
| `language` | `String.t()` | No |  |
| `merchant_id` | `String.t()` | No |  |
| `package_order_uuid` | `String.t()` | Yes |  |
| `pagination` | `map()` | No |  |
| `product_order_uuid` | `String.t()` | Yes |  |
| `product_uuid` | `String.t()` | Yes |  |
| `reason_decline` | `String.t()` | Yes |  |
| `sorting` | `map()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamProductController.create(merchant_portal_pam_product_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "package_order_uuid" => "example_package_order_uuid",  # String.t()
  "product_order_uuid" => "example_product_order_uuid",  # String.t()
  "product_uuid" => "example_product_uuid",  # String.t()
  "reason_decline" => "example_reason_decline",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.MerchantPortalPamProductController` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.OutputAddProduct

```elixir
output_add_product = BluefinTecsMerchantPortal.output_add_product(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `String.t()` | Yes |  |
| `product_uui_d` | `list()` | Yes |  |
| `response_code` | `integer()` | Yes |  |
| `response_message` | `String.t()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.OutputAddProduct.create(output_add_product, BluefinTecsMerchantPortal.Helpers.deep(%{
  "package_uuid" => "example_package_uuid",  # String.t()
  "product_uui_d" => [],  # list()
  "response_code" => 1,  # integer()
  "response_message" => "example_response_message",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.OutputAddProduct` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.OutputCreateProduct

```elixir
output_create_product = BluefinTecsMerchantPortal.output_create_product(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acquirer_id` | `String.t()` | No |  |
| `allow_multiple_order` | `boolean()` | Yes |  |
| `app_form_template_name` | `String.t()` | Yes |  |
| `contract_needed` | `boolean()` | Yes |  |
| `credentials_needed` | `boolean()` | No |  |
| `description_key` | `String.t()` | Yes |  |
| `name_key` | `String.t()` | Yes |  |
| `prescreening_allowed` | `boolean()` | Yes |  |
| `product_name` | `String.t()` | Yes |  |
| `response_code` | `integer()` | Yes |  |
| `response_message` | `String.t()` | Yes |  |
| `terminal_template_name` | `String.t()` | Yes |  |
| `vendor_name` | `String.t()` | Yes |  |
| `xml_template_file` | `String.t()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.OutputCreateProduct.create(output_create_product, BluefinTecsMerchantPortal.Helpers.deep(%{
  "allow_multiple_order" => true,  # boolean()
  "app_form_template_name" => "example_app_form_template_name",  # String.t()
  "contract_needed" => true,  # boolean()
  "description_key" => "example_description_key",  # String.t()
  "name_key" => "example_name_key",  # String.t()
  "prescreening_allowed" => true,  # boolean()
  "product_name" => "example_product_name",  # String.t()
  "response_code" => 1,  # integer()
  "response_message" => "example_response_message",  # String.t()
  "terminal_template_name" => "example_terminal_template_name",  # String.t()
  "vendor_name" => "example_vendor_name",  # String.t()
  "xml_template_file" => "example_xml_template_file",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.OutputCreateProduct` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.OutputDetail

```elixir
output_detail = BluefinTecsMerchantPortal.output_detail(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `detail` | `map()` | No |  |
| `response_code` | `integer()` | Yes |  |
| `response_message` | `String.t()` | Yes |  |

### Operations

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.OutputDetail.load(output_detail, BluefinTecsMerchantPortal.Helpers.deep(%{"id" => "output_detail_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.OutputDetail` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.OutputList

```elixir
output_list = BluefinTecsMerchantPortal.output_list(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `item` | `list()` | No |  |
| `pagination` | `map()` | Yes |  |
| `response_code` | `integer()` | Yes |  |
| `response_message` | `String.t()` | Yes |  |
| `sorting` | `map()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.OutputList.create(output_list, BluefinTecsMerchantPortal.Helpers.deep(%{
  "pagination" => %{},  # map()
  "response_code" => 1,  # integer()
  "response_message" => "example_response_message",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.OutputList` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.OutputMessage

```elixir
output_message = BluefinTecsMerchantPortal.output_message(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `response_code` | `integer()` | Yes |  |
| `response_message` | `String.t()` | Yes |  |

### Operations

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.OutputMessage.load(output_message, BluefinTecsMerchantPortal.Helpers.deep(%{"id" => "output_message_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.OutputMessage` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.OutputMoveTid

```elixir
output_move_tid = BluefinTecsMerchantPortal.output_move_tid(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `product_order_uui_d` | `list()` | Yes |  |
| `response_code` | `integer()` | Yes |  |
| `response_message` | `String.t()` | Yes |  |
| `target_package_order_uuid` | `String.t()` | Yes |  |
| `target_product_order_uuid` | `String.t()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.OutputMoveTid.create(output_move_tid, BluefinTecsMerchantPortal.Helpers.deep(%{
  "product_order_uui_d" => [],  # list()
  "response_code" => 1,  # integer()
  "response_message" => "example_response_message",  # String.t()
  "target_package_order_uuid" => "example_target_package_order_uuid",  # String.t()
  "target_product_order_uuid" => "example_target_product_order_uuid",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.OutputMoveTid` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.OutputRemoveProduct

```elixir
output_remove_product = BluefinTecsMerchantPortal.output_remove_product(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `String.t()` | Yes |  |
| `product_uui_d` | `list()` | Yes |  |
| `response_code` | `integer()` | Yes |  |
| `response_message` | `String.t()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.OutputRemoveProduct.create(output_remove_product, BluefinTecsMerchantPortal.Helpers.deep(%{
  "package_uuid" => "example_package_uuid",  # String.t()
  "product_uui_d" => [],  # list()
  "response_code" => 1,  # integer()
  "response_message" => "example_response_message",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.OutputRemoveProduct` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.OutputStart

```elixir
output_start = BluefinTecsMerchantPortal.output_start(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `String.t()` | No |  |
| `response_code` | `integer()` | Yes |  |
| `response_message` | `String.t()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.OutputStart.create(output_start, BluefinTecsMerchantPortal.Helpers.deep(%{
  "response_code" => 1,  # integer()
  "response_message" => "example_response_message",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.OutputStart` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.OutputStatus

```elixir
output_status = BluefinTecsMerchantPortal.output_status(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `integer()` | No |  |
| `response_code` | `integer()` | Yes |  |
| `response_message` | `String.t()` | Yes |  |
| `status` | `String.t()` | No |  |

### Operations

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.OutputStatus.load(output_status, BluefinTecsMerchantPortal.Helpers.deep(%{"id" => "output_status_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.OutputStatus` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinTecsMerchantPortal.Entity.OutputUpdateProduct

```elixir
output_update_product = BluefinTecsMerchantPortal.output_update_product(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `allow_multiple_order` | `boolean()` | No |  |
| `app_form_name` | `String.t()` | No |  |
| `contract_needed` | `boolean()` | No |  |
| `credentials_needed` | `boolean()` | No |  |
| `description_key` | `String.t()` | No |  |
| `name_key` | `String.t()` | No |  |
| `prescreening_allowed` | `boolean()` | No |  |
| `product_name` | `String.t()` | No |  |
| `product_status` | `String.t()` | No |  |
| `product_uuid` | `String.t()` | Yes |  |
| `response_code` | `integer()` | Yes |  |
| `response_message` | `String.t()` | Yes |  |
| `vendor_name` | `String.t()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.OutputUpdateProduct.create(output_update_product, BluefinTecsMerchantPortal.Helpers.deep(%{
  "product_uuid" => "example_product_uuid",  # String.t()
  "response_code" => 1,  # integer()
  "response_message" => "example_response_message",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinTecsMerchantPortal.Entity.OutputUpdateProduct` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```elixir
sdk = BluefinTecsMerchantPortal.new(BluefinTecsMerchantPortal.Helpers.deep(%{
  "feature" => %{
    "test" => %{"active" => true},
  }
}))
```

