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
| `account_number` | `integer` | No | Account number provided by the acquirer. |
| `additional_data` | `hashref` | No | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `string` | Yes | Merchant business registration number as stated in the company registry. |
| `city` | `string` | Yes | Merchant's address: city. |
| `corporateuuid` | `string` | No | Unique identifier for the corporate entity (UUID format). |
| `country` | `string` | Yes | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `string` | Yes | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `integer` | Yes | Merchant category code as defined by the payment network. |
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
| `sorting_code` | `integer` | No | Sorting code provided by the acquirer. |
| `state` | `string` | No | Merchant's address: state. |
| `street` | `string` | Yes | Merchant's address: street and house number. |
| `terminal_country_code` | `string` | Yes | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `string` | Yes | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `string` | Yes | Physical or logical location of the terminal. |
| `terminal_serial_number` | `string` | Yes | Terminal serial number. |
| `terminalid` | `integer` | Yes | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `string` | No | Terminal ID as set by the acquirer (optional). |
| `user_email` | `string` | No | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `string` | No | Phone number of the user acting on behalf of the merchant. |
| `username` | `string` | No | Merchant username for MPOS. |
| `vu_nummer` | `string` | Yes | Merchant contract number with the acquirer. |
| `web_shop_url` | `string` | No | URL of the merchant's web shop. |
| `zipcode` | `string` | Yes | Merchant's address: postal code. |

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
| `productOrderUUID` | `string` | Yes |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->MerchantPortalPamContractController->create({
    'language' => 'example_language',  # string
    'productOrderUUID' => 'example_productOrderUUID',  # string
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
| `appFormFieldDescUUID` | `string` | Yes |  |
| `packageOrderUUID` | `string` | No | UUID of the package order. |
| `productOrderUUID` | `string` | No | UUID of the product order. |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->MerchantPortalPamDocumentController->create({
    'appFormFieldDescUUID' => 'example_appFormFieldDescUUID',  # string
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
| `appFormFieldsDescUUID` | `string` | Yes |  |
| `filter` | `hashref` | No |  |
| `language` | `string` | Yes |  |
| `packageOrder` | `hashref` | No |  |
| `packageOrderUUID` | `string` | Yes | UUID of the package order. |
| `packageUUID` | `string` | No |  |
| `productOrderUUID` | `string` | No | UUID of the product order. |
| `productOrders` | `arrayref` | No |  |
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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->MerchantPortalPamFormController->create({
    'appFormFieldsDescUUID' => 'example_appFormFieldsDescUUID',  # string
    'language' => 'example_language',  # string
    'packageOrderUUID' => 'example_packageOrderUUID',  # string
    'reasonOfReopening' => 'example_reasonOfReopening',  # string
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
| `clientSecret` | `string` | No |  |
| `mandatorName` | `string` | Yes |  |
| `notificationEmail` | `string` | No |  |
| `packageUUID` | `string` | Yes |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->MerchantPortalPamMandatorController->create({
    'mandatorName' => 'example_mandatorName',  # string
    'packageUUID' => 'example_packageUUID',  # string
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
| `additional_data` | `hashref` | No | Optional additional merchant-specific data related to enabling acquiring. |
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
| `terminalIds` | `arrayref` | No | Optional list of terminal IDs for which acquiring should be activated. |
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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->MerchantPortalPamMerchantController->create({
    'businessRegistrationNumber' => 'example_businessRegistrationNumber',  # string
    'companyName' => 'example_companyName',  # string
    'corporateUUID' => 'example_corporateUUID',  # string
    'currency' => 'example_currency',  # string
    'email' => 'example_email',  # string
    'language' => 'example_language',  # string
    'login' => 'example_login',  # string
    'mandator' => 'example_mandator',  # string
    'merchantContractNumber' => 'example_merchantContractNumber',  # string
    'packageorderuuid' => 'example_packageorderuuid',  # string
    'phoneNumber' => 'example_phoneNumber',  # string
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
| `consumerUUID` | `string` | No |  |
| `corporateUUID` | `string` | No |  |
| `country` | `string` | No | Country associated with the package. |
| `descriptionKey` | `string` | No | Key for the description of the package. |
| `filter` | `hashref` | No |  |
| `language` | `string` | Yes |  |
| `nameKey` | `string` | No | Key for the name of the package. |
| `packageStatus` | `string` | No | Status of the package. |
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `pagination` | `hashref` | No |  |
| `sorting` | `hashref` | No |  |

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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->MerchantPortalPamPackageController->create({
    'language' => 'example_language',  # string
    'packageUUID' => 'example_packageUUID',  # string
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
| `consumerUUID` | `string` | No |  |
| `filter` | `hashref` | No |  |
| `language` | `string` | No |  |
| `merchantID` | `string` | No |  |
| `packageOrderUUID` | `string` | Yes |  |
| `pagination` | `hashref` | No |  |
| `productOrderUUID` | `string` | Yes |  |
| `productUUID` | `string` | Yes |  |
| `reason_decline` | `string` | Yes | Reason for product decline. |
| `sorting` | `hashref` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->MerchantPortalPamProductController->create({
    'packageOrderUUID' => 'example_packageOrderUUID',  # string
    'productOrderUUID' => 'example_productOrderUUID',  # string
    'productUUID' => 'example_productUUID',  # string
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
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `productUUIDs` | `arrayref` | Yes | The list of unique identifiers of the products. |
| `responseCode` | `integer` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->OutputAddProduct->create({
    'packageUUID' => 'example_packageUUID',  # string
    'productUUIDs' => [],  # arrayref
    'responseCode' => 1,  # integer
    'responseMessage' => 'example_responseMessage',  # string
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
| `acquirerId` | `string` | No | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `boolean` | Yes | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `string` | Yes | Name of the application form template. |
| `contractNeeded` | `boolean` | Yes | Indication whether contract is needed or not. |
| `credentialsNeeded` | `boolean` | No | Indication whether credentials are needed or not. |
| `descriptionKey` | `string` | Yes | Key indicator for product description. |
| `nameKey` | `string` | Yes | Key indicator for product name. |
| `prescreeningAllowed` | `boolean` | Yes | Indication whether prescreening is allowed or not. |
| `productName` | `string` | Yes | Name of the product. |
| `responseCode` | `integer` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `terminalTemplateName` | `string` | Yes | Name of the terminal template. |
| `vendorName` | `string` | Yes | Name of the vendor. |
| `xmlTemplateFile` | `string` | Yes | A string value containing the XML template file encoded in Base64. |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->OutputCreateProduct->create({
    'allowMultipleOrders' => 1,  # boolean
    'appFormTemplateName' => 'example_appFormTemplateName',  # string
    'contractNeeded' => 1,  # boolean
    'descriptionKey' => 'example_descriptionKey',  # string
    'nameKey' => 'example_nameKey',  # string
    'prescreeningAllowed' => 1,  # boolean
    'productName' => 'example_productName',  # string
    'responseCode' => 1,  # integer
    'responseMessage' => 'example_responseMessage',  # string
    'terminalTemplateName' => 'example_terminalTemplateName',  # string
    'vendorName' => 'example_vendorName',  # string
    'xmlTemplateFile' => 'example_xmlTemplateFile',  # string
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
| `batch` | `hashref` | No |  |
| `lines` | `hashref` | No |  |
| `progress` | `hashref` | No |  |

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
| `items` | `arrayref` | No |  |
| `pagination` | `hashref` | Yes |  |
| `responseCode` | `integer` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `sorting` | `hashref` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `items` | - |
| `pagination` | Yes |
| `responseCode` | - |
| `responseMessage` | - |
| `sorting` | - |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->OutputList->create({
    'pagination' => {},  # hashref
    'responseCode' => 1,  # integer
    'responseMessage' => 'example_responseMessage',  # string
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
| `responseCode` | `integer` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

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
| `productOrderUUIDs` | `arrayref` | Yes |  |
| `responseCode` | `integer` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `targetPackageOrderUUID` | `string` | Yes |  |
| `targetProductOrderUUID` | `string` | Yes |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->OutputMoveTid->create({
    'productOrderUUIDs' => [],  # arrayref
    'responseCode' => 1,  # integer
    'responseMessage' => 'example_responseMessage',  # string
    'targetPackageOrderUUID' => 'example_targetPackageOrderUUID',  # string
    'targetProductOrderUUID' => 'example_targetProductOrderUUID',  # string
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
| `packageUUID` | `string` | Yes | Unique identifier for the package. |
| `productUUIDs` | `arrayref` | Yes | List of product unique identifiers. |
| `responseCode` | `integer` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->OutputRemoveProduct->create({
    'packageUUID' => 'example_packageUUID',  # string
    'productUUIDs' => [],  # arrayref
    'responseCode' => 1,  # integer
    'responseMessage' => 'example_responseMessage',  # string
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
| `responseCode` | `integer` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->OutputStart->create({
    'responseCode' => 1,  # integer
    'responseMessage' => 'example_responseMessage',  # string
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
| `responseCode` | `integer` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
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
| `responseCode` | `integer` | Yes | Response code. |
| `responseMessage` | `string` | Yes | Response message. |
| `vendorName` | `string` | No | The name of the vendor |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->OutputUpdateProduct->create({
    'productUUID' => 'example_productUUID',  # string
    'responseCode' => 1,  # integer
    'responseMessage' => 'example_responseMessage',  # string
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

