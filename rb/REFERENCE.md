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
| `account_number` | `Integer` | No | Account number provided by the acquirer. |
| `additional_data` | `Hash` | No | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `String` | Yes | Merchant business registration number as stated in the company registry. |
| `city` | `String` | Yes | Merchant's address: city. |
| `corporateuuid` | `String` | No | Unique identifier for the corporate entity (UUID format). |
| `country` | `String` | Yes | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `String` | Yes | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `Integer` | Yes | Merchant category code as defined by the payment network. |
| `merchant_email` | `String` | No | Merchant's email address for receiving notifications. |
| `merchant_name` | `String` | Yes | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | `String` | No | Merchant's phone number for notifications. |
| `packageid` | `String` | Yes | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | `String` | Yes | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | `String` | No | Merchant password for MPOS. |
| `productid` | `String` | No | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | `String` | No | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | `String` | Yes | Reason for terminal deactivation. |
| `reason_reactivation` | `String` | Yes | Reason for terminal reactivation. |
| `sorting_code` | `Integer` | No | Sorting code provided by the acquirer. |
| `state` | `String` | No | Merchant's address: state. |
| `street` | `String` | Yes | Merchant's address: street and house number. |
| `terminal_country_code` | `String` | Yes | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `String` | Yes | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `String` | Yes | Physical or logical location of the terminal. |
| `terminal_serial_number` | `String` | Yes | Terminal serial number. |
| `terminalid` | `Integer` | Yes | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `String` | No | Terminal ID as set by the acquirer (optional). |
| `user_email` | `String` | No | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `String` | No | Phone number of the user acting on behalf of the merchant. |
| `username` | `String` | No | Merchant username for MPOS. |
| `vu_nummer` | `String` | Yes | Merchant contract number with the acquirer. |
| `web_shop_url` | `String` | No | URL of the merchant's web shop. |
| `zipcode` | `String` | Yes | Merchant's address: postal code. |

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
| `productOrderUUID` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.MerchantPortalPamContractController.create({
  "language" => "example_language", # String
  "productOrderUUID" => "example_productOrderUUID", # String
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
| `appFormFieldDescUUID` | `String` | Yes |  |
| `packageOrderUUID` | `String` | No | UUID of the package order. |
| `productOrderUUID` | `String` | No | UUID of the product order. |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.MerchantPortalPamDocumentController.create({
  "appFormFieldDescUUID" => "example_appFormFieldDescUUID", # String
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
| `appFormFieldsDescUUID` | `String` | Yes |  |
| `filter` | `Hash` | No |  |
| `language` | `String` | Yes |  |
| `packageOrder` | `Hash` | No |  |
| `packageOrderUUID` | `String` | Yes | UUID of the package order. |
| `packageUUID` | `String` | No |  |
| `productOrderUUID` | `String` | No | UUID of the product order. |
| `productOrders` | `Array` | No |  |
| `reasonOfReopening` | `String` | Yes |  |

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

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.MerchantPortalPamFormController.create({
  "appFormFieldsDescUUID" => "example_appFormFieldsDescUUID", # String
  "language" => "example_language", # String
  "packageOrderUUID" => "example_packageOrderUUID", # String
  "reasonOfReopening" => "example_reasonOfReopening", # String
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
| `clientSecret` | `String` | No |  |
| `mandatorName` | `String` | Yes |  |
| `notificationEmail` | `String` | No |  |
| `packageUUID` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.MerchantPortalPamMandatorController.create({
  "mandatorName" => "example_mandatorName", # String
  "packageUUID" => "example_packageUUID", # String
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
| `additional_data` | `Hash` | No | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` | `String` | Yes |  |
| `city` | `String` | No | City where the merchant is located. |
| `companyName` | `String` | Yes |  |
| `corporateUUID` | `String` | Yes | Unique identifier for the corporate entity. |
| `country` | `String` | No | Country where the merchant is located. |
| `currency` | `String` | Yes | Transaction currency in ISO 4217 format. |
| `email` | `String` | Yes |  |
| `language` | `String` | Yes |  |
| `login` | `String` | Yes |  |
| `mandator` | `String` | Yes | Mandator name assigned by TECS. |
| `merchantContractNumber` | `String` | Yes | Unique identifier for the merchant within a specific system. |
| `merchantName` | `String` | No | Name of the merchant. |
| `merchant_category_code` | `String` | No | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | `String` | No | UUID of the package. |
| `packageorderuuid` | `String` | Yes | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` | `String` | Yes |  |
| `postalCode` | `String` | No | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | `String` | Yes | Identifier of the product for which acquiring is to be enabled. |
| `region` | `String` | No | State or province where the merchant is located. |
| `registrationNumber` | `String` | No | Business registration number. |
| `signature` | `String` | No | Signature value = saltAsHex-hashAsHex. |
| `street` | `String` | No | Street address of the merchant. |
| `terminalIds` | `Array` | No | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `String` | No | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `String` | Yes | Merchant contract number with the acquirer. |

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

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.MerchantPortalPamMerchantController.create({
  "businessRegistrationNumber" => "example_businessRegistrationNumber", # String
  "companyName" => "example_companyName", # String
  "corporateUUID" => "example_corporateUUID", # String
  "currency" => "example_currency", # String
  "email" => "example_email", # String
  "language" => "example_language", # String
  "login" => "example_login", # String
  "mandator" => "example_mandator", # String
  "merchantContractNumber" => "example_merchantContractNumber", # String
  "packageorderuuid" => "example_packageorderuuid", # String
  "phoneNumber" => "example_phoneNumber", # String
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
| `consumerUUID` | `String` | No |  |
| `corporateUUID` | `String` | No |  |
| `country` | `String` | No | Country associated with the package. |
| `descriptionKey` | `String` | No | Key for the description of the package. |
| `filter` | `Hash` | No |  |
| `language` | `String` | Yes |  |
| `nameKey` | `String` | No | Key for the name of the package. |
| `packageStatus` | `String` | No | Status of the package. |
| `packageUUID` | `String` | Yes | Unique identifier for the package. |
| `pagination` | `Hash` | No |  |
| `sorting` | `Hash` | No |  |

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

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.MerchantPortalPamPackageController.create({
  "language" => "example_language", # String
  "packageUUID" => "example_packageUUID", # String
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
| `consumerUUID` | `String` | No |  |
| `filter` | `Hash` | No |  |
| `language` | `String` | No |  |
| `merchantID` | `String` | No |  |
| `packageOrderUUID` | `String` | Yes |  |
| `pagination` | `Hash` | No |  |
| `productOrderUUID` | `String` | Yes |  |
| `productUUID` | `String` | Yes |  |
| `reason_decline` | `String` | Yes | Reason for product decline. |
| `sorting` | `Hash` | No |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.MerchantPortalPamProductController.create({
  "packageOrderUUID" => "example_packageOrderUUID", # String
  "productOrderUUID" => "example_productOrderUUID", # String
  "productUUID" => "example_productUUID", # String
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
| `packageUUID` | `String` | Yes | Unique identifier for the package. |
| `productUUIDs` | `Array` | Yes | The list of unique identifiers of the products. |
| `responseCode` | `Integer` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.OutputAddProduct.create({
  "packageUUID" => "example_packageUUID", # String
  "productUUIDs" => [], # Array
  "responseCode" => 1, # Integer
  "responseMessage" => "example_responseMessage", # String
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
| `acquirerId` | `String` | No | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `Boolean` | Yes | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `String` | Yes | Name of the application form template. |
| `contractNeeded` | `Boolean` | Yes | Indication whether contract is needed or not. |
| `credentialsNeeded` | `Boolean` | No | Indication whether credentials are needed or not. |
| `descriptionKey` | `String` | Yes | Key indicator for product description. |
| `nameKey` | `String` | Yes | Key indicator for product name. |
| `prescreeningAllowed` | `Boolean` | Yes | Indication whether prescreening is allowed or not. |
| `productName` | `String` | Yes | Name of the product. |
| `responseCode` | `Integer` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `terminalTemplateName` | `String` | Yes | Name of the terminal template. |
| `vendorName` | `String` | Yes | Name of the vendor. |
| `xmlTemplateFile` | `String` | Yes | A string value containing the XML template file encoded in Base64. |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.OutputCreateProduct.create({
  "allowMultipleOrders" => true, # Boolean
  "appFormTemplateName" => "example_appFormTemplateName", # String
  "contractNeeded" => true, # Boolean
  "descriptionKey" => "example_descriptionKey", # String
  "nameKey" => "example_nameKey", # String
  "prescreeningAllowed" => true, # Boolean
  "productName" => "example_productName", # String
  "responseCode" => 1, # Integer
  "responseMessage" => "example_responseMessage", # String
  "terminalTemplateName" => "example_terminalTemplateName", # String
  "vendorName" => "example_vendorName", # String
  "xmlTemplateFile" => "example_xmlTemplateFile", # String
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
| `batch` | `Hash` | No |  |
| `lines` | `Hash` | No |  |
| `progress` | `Hash` | No |  |

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
| `items` | `Array` | No |  |
| `pagination` | `Hash` | Yes |  |
| `responseCode` | `Integer` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `sorting` | `Hash` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `items` | - |
| `pagination` | Yes |
| `responseCode` | - |
| `responseMessage` | - |
| `sorting` | - |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.OutputList.create({
  "pagination" => {}, # Hash
  "responseCode" => 1, # Integer
  "responseMessage" => "example_responseMessage", # String
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
| `responseCode` | `Integer` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

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
| `productOrderUUIDs` | `Array` | Yes |  |
| `responseCode` | `Integer` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `targetPackageOrderUUID` | `String` | Yes |  |
| `targetProductOrderUUID` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.OutputMoveTid.create({
  "productOrderUUIDs" => [], # Array
  "responseCode" => 1, # Integer
  "responseMessage" => "example_responseMessage", # String
  "targetPackageOrderUUID" => "example_targetPackageOrderUUID", # String
  "targetProductOrderUUID" => "example_targetProductOrderUUID", # String
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
| `packageUUID` | `String` | Yes | Unique identifier for the package. |
| `productUUIDs` | `Array` | Yes | List of product unique identifiers. |
| `responseCode` | `Integer` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.OutputRemoveProduct.create({
  "packageUUID" => "example_packageUUID", # String
  "productUUIDs" => [], # Array
  "responseCode" => 1, # Integer
  "responseMessage" => "example_responseMessage", # String
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
| `responseCode` | `Integer` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.OutputStart.create({
  "responseCode" => 1, # Integer
  "responseMessage" => "example_responseMessage", # String
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
| `responseCode` | `Integer` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
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
| `allowMultipleOrders` | `Boolean` | No | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `String` | No | The name of the application form |
| `contractNeeded` | `Boolean` | No | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `Boolean` | No | An attribute to indicate if credentials are needed |
| `descriptionKey` | `String` | No | The description of the product |
| `nameKey` | `String` | No | The key of the product name |
| `prescreeningAllowed` | `Boolean` | No | An attribute to indicate if prescreening is allowed |
| `productName` | `String` | No | The name of the product |
| `productStatus` | `String` | No | The status of the product |
| `productUUID` | `String` | Yes | The UUID of the product to update |
| `responseCode` | `Integer` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `vendorName` | `String` | No | The name of the vendor |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.OutputUpdateProduct.create({
  "productUUID" => "example_productUUID", # String
  "responseCode" => 1, # Integer
  "responseMessage" => "example_responseMessage", # String
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

