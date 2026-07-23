# BluefinTecsMerchantPortal Perl SDK Reference

Complete API reference for the BluefinTecsMerchantPortal Perl SDK.


## BluefinTecsMerchantPortalSDK

### Constructor

```perl
use lib 'lib';
use BluefinTecsMerchantPortalSDK;

my $client = BluefinTecsMerchantPortalSDK->new($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `hashref` | SDK configuration options. |
| `$options->{base}` | `string` | Base URL for API requests. |
| `$options->{prefix}` | `string` | URL prefix appended after base. |
| `$options->{suffix}` | `string` | URL suffix appended after path. |
| `$options->{headers}` | `hashref` | Custom headers for all requests. |
| `$options->{feature}` | `hashref` | Feature configuration. |
| `$options->{system}` | `hashref` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinTecsMerchantPortalSDK->test($testopts, $sdkopts)`

Create a test client with mock features active. Both arguments may be `undef`.

```perl
my $client = BluefinTecsMerchantPortalSDK->test();
```


### Instance Methods

#### `MerchantPortalApiController($data)`

Create a new `MerchantPortalApiController` entity instance. Pass `undef` for no initial data.

#### `MerchantPortalCommonController($data)`

Create a new `MerchantPortalCommonController` entity instance. Pass `undef` for no initial data.

#### `MerchantPortalPamContractController($data)`

Create a new `MerchantPortalPamContractController` entity instance. Pass `undef` for no initial data.

#### `MerchantPortalPamDocumentController($data)`

Create a new `MerchantPortalPamDocumentController` entity instance. Pass `undef` for no initial data.

#### `MerchantPortalPamFormController($data)`

Create a new `MerchantPortalPamFormController` entity instance. Pass `undef` for no initial data.

#### `MerchantPortalPamMandatorController($data)`

Create a new `MerchantPortalPamMandatorController` entity instance. Pass `undef` for no initial data.

#### `MerchantPortalPamMerchantController($data)`

Create a new `MerchantPortalPamMerchantController` entity instance. Pass `undef` for no initial data.

#### `MerchantPortalPamPackageController($data)`

Create a new `MerchantPortalPamPackageController` entity instance. Pass `undef` for no initial data.

#### `MerchantPortalPamProductController($data)`

Create a new `MerchantPortalPamProductController` entity instance. Pass `undef` for no initial data.

#### `OutputAddProduct($data)`

Create a new `OutputAddProduct` entity instance. Pass `undef` for no initial data.

#### `OutputCreateProduct($data)`

Create a new `OutputCreateProduct` entity instance. Pass `undef` for no initial data.

#### `OutputDetail($data)`

Create a new `OutputDetail` entity instance. Pass `undef` for no initial data.

#### `OutputList($data)`

Create a new `OutputList` entity instance. Pass `undef` for no initial data.

#### `OutputMessage($data)`

Create a new `OutputMessage` entity instance. Pass `undef` for no initial data.

#### `OutputMoveTid($data)`

Create a new `OutputMoveTid` entity instance. Pass `undef` for no initial data.

#### `OutputRemoveProduct($data)`

Create a new `OutputRemoveProduct` entity instance. Pass `undef` for no initial data.

#### `OutputStart($data)`

Create a new `OutputStart` entity instance. Pass `undef` for no initial data.

#### `OutputStatus($data)`

Create a new `OutputStatus` entity instance. Pass `undef` for no initial data.

#### `OutputUpdateProduct($data)`

Create a new `OutputUpdateProduct` entity instance. Pass `undef` for no initial data.

#### `options_map() -> hashref`

Return a deep copy of the current SDK options.

#### `get_utility() -> utility`

Return a copy of the SDK utility object.

#### `direct($fetchargs) -> hashref`

Make a direct HTTP request to any API endpoint. Returns a result `hashref` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never dies — branch on `$result->{ok}`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs->{path}` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs->{method}` | `string` | HTTP method (default: `'GET'`). |
| `$fetchargs->{params}` | `hashref` | Path parameter values. |
| `$fetchargs->{query}` | `hashref` | Query string parameters. |
| `$fetchargs->{headers}` | `hashref` | Request headers (merged with defaults). |
| `$fetchargs->{body}` | `any` | Request body (hashrefs are JSON-serialized). |

**Returns:** `hashref`

#### `prepare($fetchargs) -> hashref`

Prepare a fetch definition without sending. Returns the `fetchdef` and dies on error.


---

## MerchantPortalApiController entity

```perl
my $merchant_portal_api_controller = $client->MerchantPortalApiController;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `integer` | No |  |
| `additional_data` | `hashref` | No |  |
| `business_reg_number` | `string` | Yes |  |
| `city` | `string` | Yes |  |
| `corporateuuid` | `string` | No |  |
| `country` | `string` | Yes |  |
| `currency` | `string` | Yes |  |
| `merchant_category_code` | `integer` | Yes |  |
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
| `sorting_code` | `integer` | No |  |
| `state` | `string` | No |  |
| `street` | `string` | Yes |  |
| `terminal_country_code` | `string` | Yes |  |
| `terminal_language_code` | `string` | Yes |  |
| `terminal_location` | `string` | Yes |  |
| `terminal_serial_number` | `string` | Yes |  |
| `terminalid` | `integer` | Yes |  |
| `terminalid_acquirer` | `string` | No |  |
| `user_email` | `string` | No |  |
| `user_phone_number` | `string` | No |  |
| `username` | `string` | No |  |
| `vu_nummer` | `string` | Yes |  |
| `web_shop_url` | `string` | No |  |
| `zipcode` | `string` | Yes |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->MerchantPortalApiController->create({
    'business_reg_number' => 'example_business_reg_number',  # string
    'city' => 'example_city',  # string
    'country' => 'example_country',  # string
    'currency' => 'example_currency',  # string
    'merchant_category_code' => 1,  # integer
    'merchant_name' => 'example_merchant_name',  # string
    'packageid' => 'example_packageid',  # string
    'packageorderuuid' => 'example_packageorderuuid',  # string
    'reason_deactivation' => 'example_reason_deactivation',  # string
    'reason_reactivation' => 'example_reason_reactivation',  # string
    'street' => 'example_street',  # string
    'terminal_country_code' => 'example_terminal_country_code',  # string
    'terminal_language_code' => 'example_terminal_language_code',  # string
    'terminal_location' => 'example_terminal_location',  # string
    'terminal_serial_number' => 'example_terminal_serial_number',  # string
    'terminalid' => 1,  # integer
    'vu_nummer' => 'example_vu_nummer',  # string
    'zipcode' => 'example_zipcode',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `MerchantPortalApiController` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## MerchantPortalCommonController entity

```perl
my $merchant_portal_common_controller = $client->MerchantPortalCommonController;
```

### Operations

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->MerchantPortalCommonController->load();
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `MerchantPortalCommonController` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## MerchantPortalPamContractController entity

```perl
my $merchant_portal_pam_contract_controller = $client->MerchantPortalPamContractController;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `string` | Yes |  |
| `product_order_uuid` | `string` | Yes |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->MerchantPortalPamContractController->create({
    'language' => 'example_language',  # string
    'product_order_uuid' => 'example_product_order_uuid',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `MerchantPortalPamContractController` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## MerchantPortalPamDocumentController entity

```perl
my $merchant_portal_pam_document_controller = $client->MerchantPortalPamDocumentController;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_field_desc_uuid` | `string` | Yes |  |
| `package_order_uuid` | `string` | No |  |
| `product_order_uuid` | `string` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->MerchantPortalPamDocumentController->create({
    'app_form_field_desc_uuid' => 'example_app_form_field_desc_uuid',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `MerchantPortalPamDocumentController` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## MerchantPortalPamFormController entity

```perl
my $merchant_portal_pam_form_controller = $client->MerchantPortalPamFormController;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_fields_desc_uuid` | `string` | Yes |  |
| `filter` | `hashref` | No |  |
| `language` | `string` | Yes |  |
| `package_order` | `hashref` | No |  |
| `package_order_uuid` | `string` | Yes |  |
| `package_uuid` | `string` | No |  |
| `product_order` | `arrayref` | No |  |
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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->MerchantPortalPamFormController->create({
    'app_form_fields_desc_uuid' => 'example_app_form_fields_desc_uuid',  # string
    'language' => 'example_language',  # string
    'package_order_uuid' => 'example_package_order_uuid',  # string
    'reason_of_reopening' => 'example_reason_of_reopening',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `MerchantPortalPamFormController` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## MerchantPortalPamMandatorController entity

```perl
my $merchant_portal_pam_mandator_controller = $client->MerchantPortalPamMandatorController;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client_secret` | `string` | No |  |
| `mandator_name` | `string` | Yes |  |
| `notification_email` | `string` | No |  |
| `package_uuid` | `string` | Yes |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->MerchantPortalPamMandatorController->create({
    'mandator_name' => 'example_mandator_name',  # string
    'package_uuid' => 'example_package_uuid',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `MerchantPortalPamMandatorController` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## MerchantPortalPamMerchantController entity

```perl
my $merchant_portal_pam_merchant_controller = $client->MerchantPortalPamMerchantController;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `hashref` | No |  |
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
| `terminal_id` | `arrayref` | No |  |
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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->MerchantPortalPamMerchantController->create({
    'business_registration_number' => 'example_business_registration_number',  # string
    'company_name' => 'example_company_name',  # string
    'corporate_uuid' => 'example_corporate_uuid',  # string
    'currency' => 'example_currency',  # string
    'email' => 'example_email',  # string
    'language' => 'example_language',  # string
    'login' => 'example_login',  # string
    'mandator' => 'example_mandator',  # string
    'merchant_contract_number' => 'example_merchant_contract_number',  # string
    'packageorderuuid' => 'example_packageorderuuid',  # string
    'phone_number' => 'example_phone_number',  # string
    'productid_acquirer' => 'example_productid_acquirer',  # string
    'vu_nummer' => 'example_vu_nummer',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `MerchantPortalPamMerchantController` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## MerchantPortalPamPackageController entity

```perl
my $merchant_portal_pam_package_controller = $client->MerchantPortalPamPackageController;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `string` | No |  |
| `corporate_uuid` | `string` | No |  |
| `country` | `string` | No |  |
| `description_key` | `string` | No |  |
| `filter` | `hashref` | No |  |
| `language` | `string` | Yes |  |
| `name_key` | `string` | No |  |
| `package_status` | `string` | No |  |
| `package_uuid` | `string` | Yes |  |
| `pagination` | `hashref` | No |  |
| `sorting` | `hashref` | No |  |

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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->MerchantPortalPamPackageController->create({
    'language' => 'example_language',  # string
    'package_uuid' => 'example_package_uuid',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `MerchantPortalPamPackageController` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## MerchantPortalPamProductController entity

```perl
my $merchant_portal_pam_product_controller = $client->MerchantPortalPamProductController;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `string` | No |  |
| `filter` | `hashref` | No |  |
| `language` | `string` | No |  |
| `merchant_id` | `string` | No |  |
| `package_order_uuid` | `string` | Yes |  |
| `pagination` | `hashref` | No |  |
| `product_order_uuid` | `string` | Yes |  |
| `product_uuid` | `string` | Yes |  |
| `reason_decline` | `string` | Yes |  |
| `sorting` | `hashref` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->MerchantPortalPamProductController->create({
    'package_order_uuid' => 'example_package_order_uuid',  # string
    'product_order_uuid' => 'example_product_order_uuid',  # string
    'product_uuid' => 'example_product_uuid',  # string
    'reason_decline' => 'example_reason_decline',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `MerchantPortalPamProductController` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## OutputAddProduct entity

```perl
my $output_add_product = $client->OutputAddProduct;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `string` | Yes |  |
| `product_uui_d` | `arrayref` | Yes |  |
| `response_code` | `integer` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->OutputAddProduct->create({
    'package_uuid' => 'example_package_uuid',  # string
    'product_uui_d' => [],  # arrayref
    'response_code' => 1,  # integer
    'response_message' => 'example_response_message',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `OutputAddProduct` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## OutputCreateProduct entity

```perl
my $output_create_product = $client->OutputCreateProduct;
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
| `response_code` | `integer` | Yes |  |
| `response_message` | `string` | Yes |  |
| `terminal_template_name` | `string` | Yes |  |
| `vendor_name` | `string` | Yes |  |
| `xml_template_file` | `string` | Yes |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->OutputCreateProduct->create({
    'allow_multiple_order' => 1,  # boolean
    'app_form_template_name' => 'example_app_form_template_name',  # string
    'contract_needed' => 1,  # boolean
    'description_key' => 'example_description_key',  # string
    'name_key' => 'example_name_key',  # string
    'prescreening_allowed' => 1,  # boolean
    'product_name' => 'example_product_name',  # string
    'response_code' => 1,  # integer
    'response_message' => 'example_response_message',  # string
    'terminal_template_name' => 'example_terminal_template_name',  # string
    'vendor_name' => 'example_vendor_name',  # string
    'xml_template_file' => 'example_xml_template_file',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `OutputCreateProduct` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## OutputDetail entity

```perl
my $output_detail = $client->OutputDetail;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `detail` | `hashref` | No |  |
| `response_code` | `integer` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->OutputDetail->load({ 'id' => 'output_detail_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `OutputDetail` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## OutputList entity

```perl
my $output_list = $client->OutputList;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `item` | `arrayref` | No |  |
| `pagination` | `hashref` | Yes |  |
| `response_code` | `integer` | Yes |  |
| `response_message` | `string` | Yes |  |
| `sorting` | `hashref` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->OutputList->create({
    'pagination' => {},  # hashref
    'response_code' => 1,  # integer
    'response_message' => 'example_response_message',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `OutputList` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## OutputMessage entity

```perl
my $output_message = $client->OutputMessage;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `response_code` | `integer` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->OutputMessage->load({ 'id' => 'output_message_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `OutputMessage` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## OutputMoveTid entity

```perl
my $output_move_tid = $client->OutputMoveTid;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `product_order_uui_d` | `arrayref` | Yes |  |
| `response_code` | `integer` | Yes |  |
| `response_message` | `string` | Yes |  |
| `target_package_order_uuid` | `string` | Yes |  |
| `target_product_order_uuid` | `string` | Yes |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->OutputMoveTid->create({
    'product_order_uui_d' => [],  # arrayref
    'response_code' => 1,  # integer
    'response_message' => 'example_response_message',  # string
    'target_package_order_uuid' => 'example_target_package_order_uuid',  # string
    'target_product_order_uuid' => 'example_target_product_order_uuid',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `OutputMoveTid` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## OutputRemoveProduct entity

```perl
my $output_remove_product = $client->OutputRemoveProduct;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `string` | Yes |  |
| `product_uui_d` | `arrayref` | Yes |  |
| `response_code` | `integer` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->OutputRemoveProduct->create({
    'package_uuid' => 'example_package_uuid',  # string
    'product_uui_d' => [],  # arrayref
    'response_code' => 1,  # integer
    'response_message' => 'example_response_message',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `OutputRemoveProduct` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## OutputStart entity

```perl
my $output_start = $client->OutputStart;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No |  |
| `response_code` | `integer` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->OutputStart->create({
    'response_code' => 1,  # integer
    'response_message' => 'example_response_message',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `OutputStart` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## OutputStatus entity

```perl
my $output_status = $client->OutputStatus;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `integer` | No |  |
| `response_code` | `integer` | Yes |  |
| `response_message` | `string` | Yes |  |
| `status` | `string` | No |  |

### Operations

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->OutputStatus->load({ 'id' => 'output_status_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `OutputStatus` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## OutputUpdateProduct entity

```perl
my $output_update_product = $client->OutputUpdateProduct;
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
| `response_code` | `integer` | Yes |  |
| `response_message` | `string` | Yes |  |
| `vendor_name` | `string` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->OutputUpdateProduct->create({
    'product_uuid' => 'example_product_uuid',  # string
    'response_code' => 1,  # integer
    'response_message' => 'example_response_message',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `OutputUpdateProduct` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```perl
my $client = BluefinTecsMerchantPortalSDK->new({
    'feature' => {
        'test' => { 'active' => 1 },
    },
});
```

