# BluefinTecsMerchantPortal Perl SDK



The Perl SDK for the BluefinTecsMerchantPortal API — an entity-oriented client
following idiomatic Perl conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `$client->MerchantPortalApiController` — each
carrying a small, uniform set of operations (`load`, `create`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to CPAN. Install it from the GitHub
release tag (`perl/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases)) or
from a source checkout.

The SDK is pure Perl with zero non-core runtime dependencies, so no build
step is required — just put its `lib` directory on `@INC`:

```perl
use lib 'lib';
use BluefinTecsMerchantPortalSDK;
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```perl
use lib 'lib';
use BluefinTecsMerchantPortalSDK;

my $client = BluefinTecsMerchantPortalSDK->new;
```

### 4. Create, update, and remove

```perl
# Create — returns the ENTITY (call data_get for the record)
my $created = $client->MerchantPortalApiController->create({ 'business_reg_number' => 'example_business_reg_number', 'city' => 'example_city', 'country' => 'example_country', 'currency' => 'example_currency', 'merchant_category_code' => 1, 'merchant_name' => 'example_merchant_name', 'packageid' => 'example_packageid', 'packageorderuuid' => 'example_packageorderuuid', 'reason_deactivation' => 'example_reason_deactivation', 'reason_reactivation' => 'example_reason_reactivation', 'street' => 'example_street', 'terminal_country_code' => 'example_terminal_country_code', 'terminal_language_code' => 'example_terminal_language_code', 'terminal_location' => 'example_terminal_location', 'terminal_serial_number' => 'example_terminal_serial_number', 'terminalid' => 1, 'vu_nummer' => 'example_vu_nummer', 'zipcode' => 'example_zipcode' });

```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const outputdetail = await client.OutputDetail().load({ id: "example_id" })
  console.log(outputdetail)
} catch (err) {
  console.error('load failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```perl
my $result = $client->direct({
    'path' => '/api/resource/{id}',
    'method' => 'GET',
    'params' => { 'id' => 'example' },
});

if ($result->{ok}) {
    print $result->{status}, "\n";  # 200
    print $result->{data}, "\n";    # response body
}
else {
    # A non-2xx response carries status + data (the error body); a
    # transport-level failure carries err instead. Only one is present, so
    # read whichever is defined.
    print $result->{status}, ' ', ($result->{err} // ''), "\n";
}
```

### Prepare a request without sending it

```perl
# prepare() returns the fetch definition and dies on error.
my $fetchdef = $client->prepare({
    'path' => '/api/resource/{id}',
    'method' => 'DELETE',
    'params' => { 'id' => 'example' },
});

print $fetchdef->{url}, "\n";
print $fetchdef->{method}, "\n";
print $fetchdef->{headers}, "\n";
```

### Use test mode

Create a mock client for unit testing — no server required:

```perl
my $client = BluefinTecsMerchantPortalSDK->test(undef, undef);

# Entity ops return the ENTITY and dies on error;
# call data_get for the record.
my $outputdetail = $client->OutputDetail->load({ 'id' => 'test01' });
# $outputdetail contains the mock response record
```

### Use a custom fetch function

Replace the HTTP transport with your own coderef:

```perl
my $mock_fetch = sub {
    my ($url, $init) = @_;
    return ({
        'status' => 200,
        'statusText' => 'OK',
        'headers' => {},
        'json' => sub { { 'id' => 'mock01' } },
    }, undef);
};

my $client = BluefinTecsMerchantPortalSDK->new({
    'base' => 'http://localhost:8080',
    'system' => { 'fetch' => $mock_fetch },
});
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run:

```bash
cd perl && prove -Ilib t/
```


## Reference

### BluefinTecsMerchantPortalSDK

```perl
use lib 'lib';
use BluefinTecsMerchantPortalSDK;

my $client = BluefinTecsMerchantPortalSDK->new($options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `hashref` | Feature activation flags. |
| `extend` | `arrayref` | Additional feature instances to load. |
| `system` | `hashref` | System overrides (e.g. custom `fetch` coderef). |

### test

```perl
my $client = BluefinTecsMerchantPortalSDK->test($testopts, $sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `undef`.

### BluefinTecsMerchantPortalSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> hashref` | Deep copy of current SDK options. |
| `get_utility` | `() -> utility` | Copy of the SDK utility object. |
| `prepare` | `($fetchargs) -> hashref` | Build an HTTP request definition without sending. Dies on error. |
| `direct` | `($fetchargs) -> hashref` | Build and send an HTTP request. Returns a result hashref (branch on `ok`). |
| `MerchantPortalApiController` | `($data) -> MerchantPortalApiController entity` | Create a MerchantPortalApiController entity instance. |
| `MerchantPortalCommonController` | `($data) -> MerchantPortalCommonController entity` | Create a MerchantPortalCommonController entity instance. |
| `MerchantPortalPamContractController` | `($data) -> MerchantPortalPamContractController entity` | Create a MerchantPortalPamContractController entity instance. |
| `MerchantPortalPamDocumentController` | `($data) -> MerchantPortalPamDocumentController entity` | Create a MerchantPortalPamDocumentController entity instance. |
| `MerchantPortalPamFormController` | `($data) -> MerchantPortalPamFormController entity` | Create a MerchantPortalPamFormController entity instance. |
| `MerchantPortalPamMandatorController` | `($data) -> MerchantPortalPamMandatorController entity` | Create a MerchantPortalPamMandatorController entity instance. |
| `MerchantPortalPamMerchantController` | `($data) -> MerchantPortalPamMerchantController entity` | Create a MerchantPortalPamMerchantController entity instance. |
| `MerchantPortalPamPackageController` | `($data) -> MerchantPortalPamPackageController entity` | Create a MerchantPortalPamPackageController entity instance. |
| `MerchantPortalPamProductController` | `($data) -> MerchantPortalPamProductController entity` | Create a MerchantPortalPamProductController entity instance. |
| `OutputAddProduct` | `($data) -> OutputAddProduct entity` | Create an OutputAddProduct entity instance. |
| `OutputCreateProduct` | `($data) -> OutputCreateProduct entity` | Create an OutputCreateProduct entity instance. |
| `OutputDetail` | `($data) -> OutputDetail entity` | Create an OutputDetail entity instance. |
| `OutputList` | `($data) -> OutputList entity` | Create an OutputList entity instance. |
| `OutputMessage` | `($data) -> OutputMessage entity` | Create an OutputMessage entity instance. |
| `OutputMoveTid` | `($data) -> OutputMoveTid entity` | Create an OutputMoveTid entity instance. |
| `OutputRemoveProduct` | `($data) -> OutputRemoveProduct entity` | Create an OutputRemoveProduct entity instance. |
| `OutputStart` | `($data) -> OutputStart entity` | Create an OutputStart entity instance. |
| `OutputStatus` | `($data) -> OutputStatus entity` | Create an OutputStatus entity instance. |
| `OutputUpdateProduct` | `($data) -> OutputUpdateProduct entity` | Create an OutputUpdateProduct entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `($reqmatch, $ctrl) -> hashref` | Load a single entity by match criteria. Dies on error. |
| `create` | `($reqdata, $ctrl) -> hashref` | Create a new entity. Dies on error. |
| `data_get` | `() -> hashref` | Get entity data. |
| `data_set` | `($data)` | Set entity data. |
| `match_get` | `() -> hashref` | Get entity match criteria. |
| `match_set` | `($match)` | Set entity match criteria. |
| `make` | `() -> entity` | Create a new instance with the same options. |
| `get_name` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return the ENTITY (call data_get for the record) (a `hashref` for single-entity
ops, an `arrayref` for `list`) and die on error. Wrap calls in
`eval { ... }` and inspect `$@` to handle failures.

The `direct()` escape hatch never dies — it returns a result `hashref`
you branch on via `$result->{ok}`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `boolean` | True if the HTTP status is 2xx. |
| `status` | `integer` | HTTP status code. |
| `headers` | `hashref` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is false and `err` contains the error value.

### Entities

#### MerchantPortalApiController

| Field | Description |
| --- | --- |
| `account_number` | Account number provided by the acquirer. |
| `additional_data` | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | Merchant business registration number as stated in the company registry. |
| `city` | Merchant's address: city. |
| `corporateuuid` | Unique identifier for the corporate entity (UUID format). |
| `country` | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | Merchant category code as defined by the payment network. |
| `merchant_email` | Merchant's email address for receiving notifications. |
| `merchant_name` | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | Merchant's phone number for notifications. |
| `packageid` | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | Merchant password for MPOS. |
| `productid` | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | Reason for terminal deactivation. |
| `reason_reactivation` | Reason for terminal reactivation. |
| `sorting_code` | Sorting code provided by the acquirer. |
| `state` | Merchant's address: state. |
| `street` | Merchant's address: street and house number. |
| `terminal_country_code` | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | Physical or logical location of the terminal. |
| `terminal_serial_number` | Terminal serial number. |
| `terminalid` | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | Terminal ID as set by the acquirer (optional). |
| `user_email` | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | Phone number of the user acting on behalf of the merchant. |
| `username` | Merchant username for MPOS. |
| `vu_nummer` | Merchant contract number with the acquirer. |
| `web_shop_url` | URL of the merchant's web shop. |
| `zipcode` | Merchant's address: postal code. |

Operations: Create.

API path: `/merchantportalws/deactivateTerminal`

#### MerchantPortalCommonController

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/merchantportalws/logDeveloperInfo`

#### MerchantPortalPamContractController

| Field | Description |
| --- | --- |
| `language` |  |
| `productOrderUUID` |  |

Operations: Create.

API path: `/merchantportalws/generateContract`

#### MerchantPortalPamDocumentController

| Field | Description |
| --- | --- |
| `appFormFieldDescUUID` |  |
| `packageOrderUUID` | UUID of the package order. |
| `productOrderUUID` | UUID of the product order. |

Operations: Create.

API path: `/merchantportalws/documentsList`

#### MerchantPortalPamFormController

| Field | Description |
| --- | --- |
| `appFormFieldsDescUUID` |  |
| `filter` |  |
| `language` |  |
| `packageOrder` |  |
| `packageOrderUUID` | UUID of the package order. |
| `packageUUID` |  |
| `productOrderUUID` | UUID of the product order. |
| `productOrders` |  |
| `reasonOfReopening` |  |

Operations: Create.

API path: `/merchantportalws/applicationForm`

#### MerchantPortalPamMandatorController

| Field | Description |
| --- | --- |
| `clientSecret` |  |
| `mandatorName` |  |
| `notificationEmail` |  |
| `packageUUID` |  |

Operations: Create.

API path: `/merchantportalws/createMandatorConfig`

#### MerchantPortalPamMerchantController

| Field | Description |
| --- | --- |
| `additional_data` | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` |  |
| `city` | City where the merchant is located. |
| `companyName` |  |
| `corporateUUID` | Unique identifier for the corporate entity. |
| `country` | Country where the merchant is located. |
| `currency` | Transaction currency in ISO 4217 format. |
| `email` |  |
| `language` |  |
| `login` |  |
| `mandator` | Mandator name assigned by TECS. |
| `merchantContractNumber` | Unique identifier for the merchant within a specific system. |
| `merchantName` | Name of the merchant. |
| `merchant_category_code` | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | UUID of the package. |
| `packageorderuuid` | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` |  |
| `postalCode` | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | Identifier of the product for which acquiring is to be enabled. |
| `region` | State or province where the merchant is located. |
| `registrationNumber` | Business registration number. |
| `signature` | Signature value = saltAsHex-hashAsHex. |
| `street` | Street address of the merchant. |
| `terminalIds` | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | Merchant contract number with the acquirer. |

Operations: Create.

API path: `/merchantportalws/contractNumber`

#### MerchantPortalPamPackageController

| Field | Description |
| --- | --- |
| `consumerUUID` |  |
| `corporateUUID` |  |
| `country` | Country associated with the package. |
| `descriptionKey` | Key for the description of the package. |
| `filter` |  |
| `language` |  |
| `nameKey` | Key for the name of the package. |
| `packageStatus` | Status of the package. |
| `packageUUID` | Unique identifier for the package. |
| `pagination` |  |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/availablePackages`

#### MerchantPortalPamProductController

| Field | Description |
| --- | --- |
| `consumerUUID` |  |
| `filter` |  |
| `language` |  |
| `merchantID` |  |
| `packageOrderUUID` |  |
| `pagination` |  |
| `productOrderUUID` |  |
| `productUUID` |  |
| `reason_decline` | Reason for product decline. |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/approveProduct`

#### OutputAddProduct

| Field | Description |
| --- | --- |
| `packageUUID` | Unique identifier for the package. |
| `productUUIDs` | The list of unique identifiers of the products. |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: Create.

API path: `/merchantportalws/addProductsToPackage`

#### OutputCreateProduct

| Field | Description |
| --- | --- |
| `acquirerId` | Unique identifier for the acquirer. |
| `allowMultipleOrders` | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | Name of the application form template. |
| `contractNeeded` | Indication whether contract is needed or not. |
| `credentialsNeeded` | Indication whether credentials are needed or not. |
| `descriptionKey` | Key indicator for product description. |
| `nameKey` | Key indicator for product name. |
| `prescreeningAllowed` | Indication whether prescreening is allowed or not. |
| `productName` | Name of the product. |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `terminalTemplateName` | Name of the terminal template. |
| `vendorName` | Name of the vendor. |
| `xmlTemplateFile` | A string value containing the XML template file encoded in Base64. |

Operations: Create.

API path: `/merchantportalws/createNewProduct`

#### OutputDetail

| Field | Description |
| --- | --- |
| `batch` |  |
| `lines` |  |
| `progress` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/details/{id}`

#### OutputList

| Field | Description |
| --- | --- |
| `items` |  |
| `pagination` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/list`

#### OutputMessage

| Field | Description |
| --- | --- |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/restart/{id}`

#### OutputMoveTid

| Field | Description |
| --- | --- |
| `productOrderUUIDs` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `targetPackageOrderUUID` |  |
| `targetProductOrderUUID` |  |

Operations: Create.

API path: `/merchantportalws/moveTid`

#### OutputRemoveProduct

| Field | Description |
| --- | --- |
| `packageUUID` | Unique identifier for the package. |
| `productUUIDs` | List of product unique identifiers. |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: Create.

API path: `/merchantportalws/removeProductsFromPackage`

#### OutputStart

| Field | Description |
| --- | --- |
| `id` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/start`

#### OutputStatus

| Field | Description |
| --- | --- |
| `percentage` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `status` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/status/{id}`

#### OutputUpdateProduct

| Field | Description |
| --- | --- |
| `allowMultipleOrders` | An attribute to indicate if multiple orders are allowed |
| `appFormName` | The name of the application form |
| `contractNeeded` | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | An attribute to indicate if credentials are needed |
| `descriptionKey` | The description of the product |
| `nameKey` | The key of the product name |
| `prescreeningAllowed` | An attribute to indicate if prescreening is allowed |
| `productName` | The name of the product |
| `productStatus` | The status of the product |
| `productUUID` | The UUID of the product to update |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `vendorName` | The name of the vendor |

Operations: Create.

API path: `/merchantportalws/updateProduct`



## Entities


### MerchantPortalApiController

Create an instance: `my $merchant_portal_api_controller = $client->MerchantPortalApiController;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `integer` | Account number provided by the acquirer. |
| `additional_data` | `hashref` | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `string` | Merchant business registration number as stated in the company registry. |
| `city` | `string` | Merchant's address: city. |
| `corporateuuid` | `string` | Unique identifier for the corporate entity (UUID format). |
| `country` | `string` | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `string` | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `integer` | Merchant category code as defined by the payment network. |
| `merchant_email` | `string` | Merchant's email address for receiving notifications. |
| `merchant_name` | `string` | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | `string` | Merchant's phone number for notifications. |
| `packageid` | `string` | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | `string` | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | `string` | Merchant password for MPOS. |
| `productid` | `string` | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | `string` | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | `string` | Reason for terminal deactivation. |
| `reason_reactivation` | `string` | Reason for terminal reactivation. |
| `sorting_code` | `integer` | Sorting code provided by the acquirer. |
| `state` | `string` | Merchant's address: state. |
| `street` | `string` | Merchant's address: street and house number. |
| `terminal_country_code` | `string` | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `string` | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `string` | Physical or logical location of the terminal. |
| `terminal_serial_number` | `string` | Terminal serial number. |
| `terminalid` | `integer` | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `string` | Terminal ID as set by the acquirer (optional). |
| `user_email` | `string` | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `string` | Phone number of the user acting on behalf of the merchant. |
| `username` | `string` | Merchant username for MPOS. |
| `vu_nummer` | `string` | Merchant contract number with the acquirer. |
| `web_shop_url` | `string` | URL of the merchant's web shop. |
| `zipcode` | `string` | Merchant's address: postal code. |

#### Example: Create

```perl
my $merchant_portal_api_controller = $client->MerchantPortalApiController->create({
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


### MerchantPortalCommonController

Create an instance: `my $merchant_portal_common_controller = $client->MerchantPortalCommonController;`

#### Operations

| Method | Description |
| --- | --- |
| `load($match)` | Load a single entity by match criteria. |

#### Example: Load

```perl
my $merchant_portal_common_controller = $client->MerchantPortalCommonController->load();
```


### MerchantPortalPamContractController

Create an instance: `my $merchant_portal_pam_contract_controller = $client->MerchantPortalPamContractController;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `string` |  |
| `productOrderUUID` | `string` |  |

#### Example: Create

```perl
my $merchant_portal_pam_contract_controller = $client->MerchantPortalPamContractController->create({
    'language' => 'example_language',  # string
    'productOrderUUID' => 'example_productOrderUUID',  # string
});
```


### MerchantPortalPamDocumentController

Create an instance: `my $merchant_portal_pam_document_controller = $client->MerchantPortalPamDocumentController;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldDescUUID` | `string` |  |
| `packageOrderUUID` | `string` | UUID of the package order. |
| `productOrderUUID` | `string` | UUID of the product order. |

#### Example: Create

```perl
my $merchant_portal_pam_document_controller = $client->MerchantPortalPamDocumentController->create({
    'appFormFieldDescUUID' => 'example_appFormFieldDescUUID',  # string
});
```


### MerchantPortalPamFormController

Create an instance: `my $merchant_portal_pam_form_controller = $client->MerchantPortalPamFormController;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldsDescUUID` | `string` |  |
| `filter` | `hashref` |  |
| `language` | `string` |  |
| `packageOrder` | `hashref` |  |
| `packageOrderUUID` | `string` | UUID of the package order. |
| `packageUUID` | `string` |  |
| `productOrderUUID` | `string` | UUID of the product order. |
| `productOrders` | `arrayref` |  |
| `reasonOfReopening` | `string` |  |

#### Example: Create

```perl
my $merchant_portal_pam_form_controller = $client->MerchantPortalPamFormController->create({
    'appFormFieldsDescUUID' => 'example_appFormFieldsDescUUID',  # string
    'language' => 'example_language',  # string
    'packageOrderUUID' => 'example_packageOrderUUID',  # string
    'reasonOfReopening' => 'example_reasonOfReopening',  # string
});
```


### MerchantPortalPamMandatorController

Create an instance: `my $merchant_portal_pam_mandator_controller = $client->MerchantPortalPamMandatorController;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `clientSecret` | `string` |  |
| `mandatorName` | `string` |  |
| `notificationEmail` | `string` |  |
| `packageUUID` | `string` |  |

#### Example: Create

```perl
my $merchant_portal_pam_mandator_controller = $client->MerchantPortalPamMandatorController->create({
    'mandatorName' => 'example_mandatorName',  # string
    'packageUUID' => 'example_packageUUID',  # string
});
```


### MerchantPortalPamMerchantController

Create an instance: `my $merchant_portal_pam_merchant_controller = $client->MerchantPortalPamMerchantController;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `hashref` | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` | `string` |  |
| `city` | `string` | City where the merchant is located. |
| `companyName` | `string` |  |
| `corporateUUID` | `string` | Unique identifier for the corporate entity. |
| `country` | `string` | Country where the merchant is located. |
| `currency` | `string` | Transaction currency in ISO 4217 format. |
| `email` | `string` |  |
| `language` | `string` |  |
| `login` | `string` |  |
| `mandator` | `string` | Mandator name assigned by TECS. |
| `merchantContractNumber` | `string` | Unique identifier for the merchant within a specific system. |
| `merchantName` | `string` | Name of the merchant. |
| `merchant_category_code` | `string` | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | `string` | UUID of the package. |
| `packageorderuuid` | `string` | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` | `string` |  |
| `postalCode` | `string` | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | `string` | Identifier of the product for which acquiring is to be enabled. |
| `region` | `string` | State or province where the merchant is located. |
| `registrationNumber` | `string` | Business registration number. |
| `signature` | `string` | Signature value = saltAsHex-hashAsHex. |
| `street` | `string` | Street address of the merchant. |
| `terminalIds` | `arrayref` | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `string` | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `string` | Merchant contract number with the acquirer. |

#### Example: Create

```perl
my $merchant_portal_pam_merchant_controller = $client->MerchantPortalPamMerchantController->create({
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


### MerchantPortalPamPackageController

Create an instance: `my $merchant_portal_pam_package_controller = $client->MerchantPortalPamPackageController;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `string` |  |
| `corporateUUID` | `string` |  |
| `country` | `string` | Country associated with the package. |
| `descriptionKey` | `string` | Key for the description of the package. |
| `filter` | `hashref` |  |
| `language` | `string` |  |
| `nameKey` | `string` | Key for the name of the package. |
| `packageStatus` | `string` | Status of the package. |
| `packageUUID` | `string` | Unique identifier for the package. |
| `pagination` | `hashref` |  |
| `sorting` | `hashref` |  |

#### Example: Create

```perl
my $merchant_portal_pam_package_controller = $client->MerchantPortalPamPackageController->create({
    'language' => 'example_language',  # string
    'packageUUID' => 'example_packageUUID',  # string
});
```


### MerchantPortalPamProductController

Create an instance: `my $merchant_portal_pam_product_controller = $client->MerchantPortalPamProductController;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `string` |  |
| `filter` | `hashref` |  |
| `language` | `string` |  |
| `merchantID` | `string` |  |
| `packageOrderUUID` | `string` |  |
| `pagination` | `hashref` |  |
| `productOrderUUID` | `string` |  |
| `productUUID` | `string` |  |
| `reason_decline` | `string` | Reason for product decline. |
| `sorting` | `hashref` |  |

#### Example: Create

```perl
my $merchant_portal_pam_product_controller = $client->MerchantPortalPamProductController->create({
    'packageOrderUUID' => 'example_packageOrderUUID',  # string
    'productOrderUUID' => 'example_productOrderUUID',  # string
    'productUUID' => 'example_productUUID',  # string
    'reason_decline' => 'example_reason_decline',  # string
});
```


### OutputAddProduct

Create an instance: `my $output_add_product = $client->OutputAddProduct;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `string` | Unique identifier for the package. |
| `productUUIDs` | `arrayref` | The list of unique identifiers of the products. |
| `responseCode` | `integer` | Response code. |
| `responseMessage` | `string` | Response message. |

#### Example: Create

```perl
my $output_add_product = $client->OutputAddProduct->create({
    'packageUUID' => 'example_packageUUID',  # string
    'productUUIDs' => [],  # arrayref
    'responseCode' => 1,  # integer
    'responseMessage' => 'example_responseMessage',  # string
});
```


### OutputCreateProduct

Create an instance: `my $output_create_product = $client->OutputCreateProduct;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirerId` | `string` | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `boolean` | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `string` | Name of the application form template. |
| `contractNeeded` | `boolean` | Indication whether contract is needed or not. |
| `credentialsNeeded` | `boolean` | Indication whether credentials are needed or not. |
| `descriptionKey` | `string` | Key indicator for product description. |
| `nameKey` | `string` | Key indicator for product name. |
| `prescreeningAllowed` | `boolean` | Indication whether prescreening is allowed or not. |
| `productName` | `string` | Name of the product. |
| `responseCode` | `integer` | Response code. |
| `responseMessage` | `string` | Response message. |
| `terminalTemplateName` | `string` | Name of the terminal template. |
| `vendorName` | `string` | Name of the vendor. |
| `xmlTemplateFile` | `string` | A string value containing the XML template file encoded in Base64. |

#### Example: Create

```perl
my $output_create_product = $client->OutputCreateProduct->create({
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


### OutputDetail

Create an instance: `my $output_detail = $client->OutputDetail;`

#### Operations

| Method | Description |
| --- | --- |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `batch` | `hashref` |  |
| `lines` | `hashref` |  |
| `progress` | `hashref` |  |

#### Example: Load

```perl
my $output_detail = $client->OutputDetail->load({ 'id' => 'output_detail_id' });
```


### OutputList

Create an instance: `my $output_list = $client->OutputList;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `items` | `arrayref` |  |
| `pagination` | `hashref` |  |
| `responseCode` | `integer` | Response code. |
| `responseMessage` | `string` | Response message. |
| `sorting` | `hashref` |  |

#### Example: Create

```perl
my $output_list = $client->OutputList->create({
    'pagination' => {},  # hashref
    'responseCode' => 1,  # integer
    'responseMessage' => 'example_responseMessage',  # string
});
```


### OutputMessage

Create an instance: `my $output_message = $client->OutputMessage;`

#### Operations

| Method | Description |
| --- | --- |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `responseCode` | `integer` | Response code. |
| `responseMessage` | `string` | Response message. |

#### Example: Load

```perl
my $output_message = $client->OutputMessage->load({ 'id' => 'output_message_id' });
```


### OutputMoveTid

Create an instance: `my $output_move_tid = $client->OutputMoveTid;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `productOrderUUIDs` | `arrayref` |  |
| `responseCode` | `integer` | Response code. |
| `responseMessage` | `string` | Response message. |
| `targetPackageOrderUUID` | `string` |  |
| `targetProductOrderUUID` | `string` |  |

#### Example: Create

```perl
my $output_move_tid = $client->OutputMoveTid->create({
    'productOrderUUIDs' => [],  # arrayref
    'responseCode' => 1,  # integer
    'responseMessage' => 'example_responseMessage',  # string
    'targetPackageOrderUUID' => 'example_targetPackageOrderUUID',  # string
    'targetProductOrderUUID' => 'example_targetProductOrderUUID',  # string
});
```


### OutputRemoveProduct

Create an instance: `my $output_remove_product = $client->OutputRemoveProduct;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `string` | Unique identifier for the package. |
| `productUUIDs` | `arrayref` | List of product unique identifiers. |
| `responseCode` | `integer` | Response code. |
| `responseMessage` | `string` | Response message. |

#### Example: Create

```perl
my $output_remove_product = $client->OutputRemoveProduct->create({
    'packageUUID' => 'example_packageUUID',  # string
    'productUUIDs' => [],  # arrayref
    'responseCode' => 1,  # integer
    'responseMessage' => 'example_responseMessage',  # string
});
```


### OutputStart

Create an instance: `my $output_start = $client->OutputStart;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `string` |  |
| `responseCode` | `integer` | Response code. |
| `responseMessage` | `string` | Response message. |

#### Example: Create

```perl
my $output_start = $client->OutputStart->create({
    'responseCode' => 1,  # integer
    'responseMessage' => 'example_responseMessage',  # string
});
```


### OutputStatus

Create an instance: `my $output_status = $client->OutputStatus;`

#### Operations

| Method | Description |
| --- | --- |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `integer` |  |
| `responseCode` | `integer` | Response code. |
| `responseMessage` | `string` | Response message. |
| `status` | `string` |  |

#### Example: Load

```perl
my $output_status = $client->OutputStatus->load({ 'id' => 'output_status_id' });
```


### OutputUpdateProduct

Create an instance: `my $output_update_product = $client->OutputUpdateProduct;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allowMultipleOrders` | `boolean` | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `string` | The name of the application form |
| `contractNeeded` | `boolean` | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `boolean` | An attribute to indicate if credentials are needed |
| `descriptionKey` | `string` | The description of the product |
| `nameKey` | `string` | The key of the product name |
| `prescreeningAllowed` | `boolean` | An attribute to indicate if prescreening is allowed |
| `productName` | `string` | The name of the product |
| `productStatus` | `string` | The status of the product |
| `productUUID` | `string` | The UUID of the product to update |
| `responseCode` | `integer` | Response code. |
| `responseMessage` | `string` | Response message. |
| `vendorName` | `string` | The name of the vendor |

#### Example: Create

```perl
my $output_update_product = $client->OutputUpdateProduct->create({
    'productUUID' => 'example_productUUID',  # string
    'responseCode' => 1,  # integer
    'responseMessage' => 'example_responseMessage',  # string
});
```


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as hashrefs

The Perl SDK uses plain hashrefs and arrayrefs throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Use `BluefinTecsMerchantPortalHelpers::to_map()` to safely validate that a value
is a hashref.

### Module structure

```
perl/
├── lib/BluefinTecsMerchantPortalSDK.pm    -- Main SDK module (package BluefinTecsMerchantPortalSDK)
├── config.pm                    -- Configuration
├── features.pm                  -- Feature factory
├── core/                        -- Core types and context
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (base, test, log)
├── utility/                     -- Utility functions
├── lib/Voxgig/Struct.pm         -- Vendored struct library
└── t/                           -- Test suites
```

Load the main module with `use lib 'lib'; use BluefinTecsMerchantPortalSDK;` — it
pulls in the config, features, and core modules for you. Require entity or
utility modules directly only when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const outputdetail = client.OutputDetail()
await outputdetail.load({ id: "example_id" })

// outputdetail.data() now returns the outputdetail data from the last `load`
// outputdetail.match() returns { id: "example_id" }
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
