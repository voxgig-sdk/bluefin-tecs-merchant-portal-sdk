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
| `account_number` | `integer()` | No | Account number provided by the acquirer. |
| `additional_data` | `map()` | No | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `String.t()` | Yes | Merchant business registration number as stated in the company registry. |
| `city` | `String.t()` | Yes | Merchant's address: city. |
| `corporateuuid` | `String.t()` | No | Unique identifier for the corporate entity (UUID format). |
| `country` | `String.t()` | Yes | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `String.t()` | Yes | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `integer()` | Yes | Merchant category code as defined by the payment network. |
| `merchant_email` | `String.t()` | No | Merchant's email address for receiving notifications. |
| `merchant_name` | `String.t()` | Yes | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | `String.t()` | No | Merchant's phone number for notifications. |
| `packageid` | `String.t()` | Yes | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | `String.t()` | Yes | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | `String.t()` | No | Merchant password for MPOS. |
| `productid` | `String.t()` | No | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | `String.t()` | No | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | `String.t()` | Yes | Reason for terminal deactivation. |
| `reason_reactivation` | `String.t()` | Yes | Reason for terminal reactivation. |
| `sorting_code` | `integer()` | No | Sorting code provided by the acquirer. |
| `state` | `String.t()` | No | Merchant's address: state. |
| `street` | `String.t()` | Yes | Merchant's address: street and house number. |
| `terminal_country_code` | `String.t()` | Yes | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `String.t()` | Yes | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `String.t()` | Yes | Physical or logical location of the terminal. |
| `terminal_serial_number` | `String.t()` | Yes | Terminal serial number. |
| `terminalid` | `integer()` | Yes | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `String.t()` | No | Terminal ID as set by the acquirer (optional). |
| `user_email` | `String.t()` | No | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `String.t()` | No | Phone number of the user acting on behalf of the merchant. |
| `username` | `String.t()` | No | Merchant username for MPOS. |
| `vu_nummer` | `String.t()` | Yes | Merchant contract number with the acquirer. |
| `web_shop_url` | `String.t()` | No | URL of the merchant's web shop. |
| `zipcode` | `String.t()` | Yes | Merchant's address: postal code. |

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
| `productOrderUUID` | `String.t()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamContractController.create(merchant_portal_pam_contract_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "language" => "example_language",  # String.t()
  "productOrderUUID" => "example_productOrderUUID",  # String.t()
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
| `appFormFieldDescUUID` | `String.t()` | Yes |  |
| `packageOrderUUID` | `String.t()` | No | UUID of the package order. |
| `productOrderUUID` | `String.t()` | No | UUID of the product order. |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamDocumentController.create(merchant_portal_pam_document_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "appFormFieldDescUUID" => "example_appFormFieldDescUUID",  # String.t()
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
| `appFormFieldsDescUUID` | `String.t()` | Yes |  |
| `filter` | `map()` | No |  |
| `language` | `String.t()` | Yes |  |
| `packageOrder` | `map()` | No |  |
| `packageOrderUUID` | `String.t()` | Yes | UUID of the package order. |
| `packageUUID` | `String.t()` | No |  |
| `productOrderUUID` | `String.t()` | No | UUID of the product order. |
| `productOrders` | `list()` | No |  |
| `reasonOfReopening` | `String.t()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamFormController.create(merchant_portal_pam_form_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "appFormFieldsDescUUID" => "example_appFormFieldsDescUUID",  # String.t()
  "language" => "example_language",  # String.t()
  "packageOrderUUID" => "example_packageOrderUUID",  # String.t()
  "reasonOfReopening" => "example_reasonOfReopening",  # String.t()
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
| `clientSecret` | `String.t()` | No |  |
| `mandatorName` | `String.t()` | Yes |  |
| `notificationEmail` | `String.t()` | No |  |
| `packageUUID` | `String.t()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamMandatorController.create(merchant_portal_pam_mandator_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "mandatorName" => "example_mandatorName",  # String.t()
  "packageUUID" => "example_packageUUID",  # String.t()
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
| `additional_data` | `map()` | No | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` | `String.t()` | Yes |  |
| `city` | `String.t()` | No | City where the merchant is located. |
| `companyName` | `String.t()` | Yes |  |
| `corporateUUID` | `String.t()` | Yes | Unique identifier for the corporate entity. |
| `country` | `String.t()` | No | Country where the merchant is located. |
| `currency` | `String.t()` | Yes | Transaction currency in ISO 4217 format. |
| `email` | `String.t()` | Yes |  |
| `language` | `String.t()` | Yes |  |
| `login` | `String.t()` | Yes |  |
| `mandator` | `String.t()` | Yes | Mandator name assigned by TECS. |
| `merchantContractNumber` | `String.t()` | Yes | Unique identifier for the merchant within a specific system. |
| `merchantName` | `String.t()` | No | Name of the merchant. |
| `merchant_category_code` | `String.t()` | No | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | `String.t()` | No | UUID of the package. |
| `packageorderuuid` | `String.t()` | Yes | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` | `String.t()` | Yes |  |
| `postalCode` | `String.t()` | No | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | `String.t()` | Yes | Identifier of the product for which acquiring is to be enabled. |
| `region` | `String.t()` | No | State or province where the merchant is located. |
| `registrationNumber` | `String.t()` | No | Business registration number. |
| `signature` | `String.t()` | No | Signature value = saltAsHex-hashAsHex. |
| `street` | `String.t()` | No | Street address of the merchant. |
| `terminalIds` | `list()` | No | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `String.t()` | No | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `String.t()` | Yes | Merchant contract number with the acquirer. |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamMerchantController.create(merchant_portal_pam_merchant_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "businessRegistrationNumber" => "example_businessRegistrationNumber",  # String.t()
  "companyName" => "example_companyName",  # String.t()
  "corporateUUID" => "example_corporateUUID",  # String.t()
  "currency" => "example_currency",  # String.t()
  "email" => "example_email",  # String.t()
  "language" => "example_language",  # String.t()
  "login" => "example_login",  # String.t()
  "mandator" => "example_mandator",  # String.t()
  "merchantContractNumber" => "example_merchantContractNumber",  # String.t()
  "packageorderuuid" => "example_packageorderuuid",  # String.t()
  "phoneNumber" => "example_phoneNumber",  # String.t()
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
| `consumerUUID` | `String.t()` | No |  |
| `corporateUUID` | `String.t()` | No |  |
| `country` | `String.t()` | No | Country associated with the package. |
| `descriptionKey` | `String.t()` | No | Key for the description of the package. |
| `filter` | `map()` | No |  |
| `language` | `String.t()` | Yes |  |
| `nameKey` | `String.t()` | No | Key for the name of the package. |
| `packageStatus` | `String.t()` | No | Status of the package. |
| `packageUUID` | `String.t()` | Yes | Unique identifier for the package. |
| `pagination` | `map()` | No |  |
| `sorting` | `map()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamPackageController.create(merchant_portal_pam_package_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "language" => "example_language",  # String.t()
  "packageUUID" => "example_packageUUID",  # String.t()
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
| `consumerUUID` | `String.t()` | No |  |
| `filter` | `map()` | No |  |
| `language` | `String.t()` | No |  |
| `merchantID` | `String.t()` | No |  |
| `packageOrderUUID` | `String.t()` | Yes |  |
| `pagination` | `map()` | No |  |
| `productOrderUUID` | `String.t()` | Yes |  |
| `productUUID` | `String.t()` | Yes |  |
| `reason_decline` | `String.t()` | Yes | Reason for product decline. |
| `sorting` | `map()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.MerchantPortalPamProductController.create(merchant_portal_pam_product_controller, BluefinTecsMerchantPortal.Helpers.deep(%{
  "packageOrderUUID" => "example_packageOrderUUID",  # String.t()
  "productOrderUUID" => "example_productOrderUUID",  # String.t()
  "productUUID" => "example_productUUID",  # String.t()
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
| `packageUUID` | `String.t()` | Yes | Unique identifier for the package. |
| `productUUIDs` | `list()` | Yes | The list of unique identifiers of the products. |
| `responseCode` | `integer()` | Yes | Response code. |
| `responseMessage` | `String.t()` | Yes | Response message. |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.OutputAddProduct.create(output_add_product, BluefinTecsMerchantPortal.Helpers.deep(%{
  "packageUUID" => "example_packageUUID",  # String.t()
  "productUUIDs" => [],  # list()
  "responseCode" => 1,  # integer()
  "responseMessage" => "example_responseMessage",  # String.t()
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
| `acquirerId` | `String.t()` | No | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `boolean()` | Yes | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `String.t()` | Yes | Name of the application form template. |
| `contractNeeded` | `boolean()` | Yes | Indication whether contract is needed or not. |
| `credentialsNeeded` | `boolean()` | No | Indication whether credentials are needed or not. |
| `descriptionKey` | `String.t()` | Yes | Key indicator for product description. |
| `nameKey` | `String.t()` | Yes | Key indicator for product name. |
| `prescreeningAllowed` | `boolean()` | Yes | Indication whether prescreening is allowed or not. |
| `productName` | `String.t()` | Yes | Name of the product. |
| `responseCode` | `integer()` | Yes | Response code. |
| `responseMessage` | `String.t()` | Yes | Response message. |
| `terminalTemplateName` | `String.t()` | Yes | Name of the terminal template. |
| `vendorName` | `String.t()` | Yes | Name of the vendor. |
| `xmlTemplateFile` | `String.t()` | Yes | A string value containing the XML template file encoded in Base64. |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.OutputCreateProduct.create(output_create_product, BluefinTecsMerchantPortal.Helpers.deep(%{
  "allowMultipleOrders" => true,  # boolean()
  "appFormTemplateName" => "example_appFormTemplateName",  # String.t()
  "contractNeeded" => true,  # boolean()
  "descriptionKey" => "example_descriptionKey",  # String.t()
  "nameKey" => "example_nameKey",  # String.t()
  "prescreeningAllowed" => true,  # boolean()
  "productName" => "example_productName",  # String.t()
  "responseCode" => 1,  # integer()
  "responseMessage" => "example_responseMessage",  # String.t()
  "terminalTemplateName" => "example_terminalTemplateName",  # String.t()
  "vendorName" => "example_vendorName",  # String.t()
  "xmlTemplateFile" => "example_xmlTemplateFile",  # String.t()
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
| `batch` | `map()` | No |  |
| `lines` | `map()` | No |  |
| `progress` | `map()` | No |  |

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
| `items` | `list()` | No |  |
| `pagination` | `map()` | Yes |  |
| `responseCode` | `integer()` | Yes | Response code. |
| `responseMessage` | `String.t()` | Yes | Response message. |
| `sorting` | `map()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.OutputList.create(output_list, BluefinTecsMerchantPortal.Helpers.deep(%{
  "pagination" => %{},  # map()
  "responseCode" => 1,  # integer()
  "responseMessage" => "example_responseMessage",  # String.t()
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
| `responseCode` | `integer()` | Yes | Response code. |
| `responseMessage` | `String.t()` | Yes | Response message. |

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
| `productOrderUUIDs` | `list()` | Yes |  |
| `responseCode` | `integer()` | Yes | Response code. |
| `responseMessage` | `String.t()` | Yes | Response message. |
| `targetPackageOrderUUID` | `String.t()` | Yes |  |
| `targetProductOrderUUID` | `String.t()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.OutputMoveTid.create(output_move_tid, BluefinTecsMerchantPortal.Helpers.deep(%{
  "productOrderUUIDs" => [],  # list()
  "responseCode" => 1,  # integer()
  "responseMessage" => "example_responseMessage",  # String.t()
  "targetPackageOrderUUID" => "example_targetPackageOrderUUID",  # String.t()
  "targetProductOrderUUID" => "example_targetProductOrderUUID",  # String.t()
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
| `packageUUID` | `String.t()` | Yes | Unique identifier for the package. |
| `productUUIDs` | `list()` | Yes | List of product unique identifiers. |
| `responseCode` | `integer()` | Yes | Response code. |
| `responseMessage` | `String.t()` | Yes | Response message. |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.OutputRemoveProduct.create(output_remove_product, BluefinTecsMerchantPortal.Helpers.deep(%{
  "packageUUID" => "example_packageUUID",  # String.t()
  "productUUIDs" => [],  # list()
  "responseCode" => 1,  # integer()
  "responseMessage" => "example_responseMessage",  # String.t()
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
| `responseCode` | `integer()` | Yes | Response code. |
| `responseMessage` | `String.t()` | Yes | Response message. |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.OutputStart.create(output_start, BluefinTecsMerchantPortal.Helpers.deep(%{
  "responseCode" => 1,  # integer()
  "responseMessage" => "example_responseMessage",  # String.t()
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
| `responseCode` | `integer()` | Yes | Response code. |
| `responseMessage` | `String.t()` | Yes | Response message. |
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
| `allowMultipleOrders` | `boolean()` | No | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `String.t()` | No | The name of the application form |
| `contractNeeded` | `boolean()` | No | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `boolean()` | No | An attribute to indicate if credentials are needed |
| `descriptionKey` | `String.t()` | No | The description of the product |
| `nameKey` | `String.t()` | No | The key of the product name |
| `prescreeningAllowed` | `boolean()` | No | An attribute to indicate if prescreening is allowed |
| `productName` | `String.t()` | No | The name of the product |
| `productStatus` | `String.t()` | No | The status of the product |
| `productUUID` | `String.t()` | Yes | The UUID of the product to update |
| `responseCode` | `integer()` | Yes | Response code. |
| `responseMessage` | `String.t()` | Yes | Response message. |
| `vendorName` | `String.t()` | No | The name of the vendor |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinTecsMerchantPortal.Entity.OutputUpdateProduct.create(output_update_product, BluefinTecsMerchantPortal.Helpers.deep(%{
  "productUUID" => "example_productUUID",  # String.t()
  "responseCode" => 1,  # integer()
  "responseMessage" => "example_responseMessage",  # String.t()
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

