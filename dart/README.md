# BluefinTecsMerchantPortal Dart SDK



The Dart SDK for the BluefinTecsMerchantPortal API — an entity-oriented client following idiomatic Dart conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.MerchantPortalApiController()` — each
carrying a small, uniform set of operations (`load`, `create`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to pub.dev. Add it as a git
dependency (pinned to a release tag `dart/vX.Y.Z`, see
[Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases)) in your `pubspec.yaml`:

```yaml
dependencies:
  bluefin_tecs_merchant_portal_sdk:
    git:
      url: https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk
      path: dart
      ref: dart/v0.0.1
```

Or depend on a local source checkout:

```yaml
dependencies:
  bluefin_tecs_merchant_portal_sdk:
    path: ../dart
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```dart
import 'package:bluefin_tecs_merchant_portal_sdk/BluefinTecsMerchantPortalSDK.dart';

final client = BluefinTecsMerchantPortalSDK();
```

### 4. Create, update, and remove

```dart
// Create — returns the ENTITY (call data() for the record)
final created = await client.MerchantPortalApiController().create({'business_reg_number': 'example_business_reg_number', 'city': 'example_city', 'country': 'example_country', 'currency': 'example_currency', 'merchant_category_code': 1, 'merchant_name': 'example_merchant_name', 'packageid': 'example_packageid', 'packageorderuuid': 'example_packageorderuuid', 'reason_deactivation': 'example_reason_deactivation', 'reason_reactivation': 'example_reason_reactivation', 'street': 'example_street', 'terminal_country_code': 'example_terminal_country_code', 'terminal_language_code': 'example_terminal_language_code', 'terminal_location': 'example_terminal_location', 'terminal_serial_number': 'example_terminal_serial_number', 'terminalid': 1, 'vu_nummer': 'example_vu_nummer', 'zipcode': 'example_zipcode'});

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

```dart
final result = await client.direct({
  'path': '/api/resource/{id}',
  'method': 'GET',
  'params': {'id': 'example'},
});

if (true == result['ok']) {
  print(result['status']);  // 200
  print(result['data']);    // response body
} else {
  // A non-2xx response carries status + data (the error body); a
  // transport-level failure carries err instead. direct() never throws —
  // branch on result['ok'].
  print(result['status']);
  print(result['err']);
}
```

### Prepare a request without sending it

```dart
// prepare() returns the fetch definition (or an error value on failure).
final fetchdef = await client.prepare({
  'path': '/api/resource/{id}',
  'method': 'DELETE',
  'params': {'id': 'example'},
});

print(fetchdef['url']);
print(fetchdef['method']);
print(fetchdef['headers']);
```

### Use test mode

Create a mock client for unit testing — no server required:

```dart
final client = BluefinTecsMerchantPortalSDK.test();

// Entity ops return the ENTITY and throws on error;
// call data() for the record.
final outputdetail = await client.OutputDetail().load({'id': 'test01'});
// outputdetail contains the mock response record
print(outputdetail);
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```dart
Future<dynamic> mockFetch(dynamic url, dynamic init) async {
  return {
    'status': 200,
    'statusText': 'OK',
    'headers': <String, dynamic>{},
    'json': () => {'id': 'mock01'},
  };
}

final client = BluefinTecsMerchantPortalSDK({
  'base': 'http://localhost:8080',
  'system': {
    'fetch': mockFetch,
  },
});
```

### Run live tests

Set the live-mode environment variables:

```bash
export BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run:

```bash
cd dart && dart run test/main.dart
```


## Reference

### BluefinTecsMerchantPortalSDK

```dart
import 'package:bluefin_tecs_merchant_portal_sdk/BluefinTecsMerchantPortalSDK.dart';

final client = BluefinTecsMerchantPortalSDK(options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Map` | Feature activation flags. |
| `extend` | `List` | Additional Feature instances to load. |
| `system` | `Map` | System overrides (e.g. custom `fetch` function). |

### test

```dart
final client = BluefinTecsMerchantPortalSDK.test(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinTecsMerchantPortalSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options` | `() -> Map` | Deep copy of current SDK options. |
| `utility` | `() -> Utility` | The SDK utility object. |
| `prepare` | `([fetchargs]) -> Future` | Build an HTTP request definition without sending. Returns an error value on failure. |
| `direct` | `([fetchargs]) -> Future<Map>` | Build and send an HTTP request. Returns a result map (branch on `ok`); never throws. |
| `MerchantPortalApiController` | `([entopts]) -> MerchantPortalApiControllerEntity` | Create a MerchantPortalApiController entity instance. |
| `MerchantPortalCommonController` | `([entopts]) -> MerchantPortalCommonControllerEntity` | Create a MerchantPortalCommonController entity instance. |
| `MerchantPortalPamContractController` | `([entopts]) -> MerchantPortalPamContractControllerEntity` | Create a MerchantPortalPamContractController entity instance. |
| `MerchantPortalPamDocumentController` | `([entopts]) -> MerchantPortalPamDocumentControllerEntity` | Create a MerchantPortalPamDocumentController entity instance. |
| `MerchantPortalPamFormController` | `([entopts]) -> MerchantPortalPamFormControllerEntity` | Create a MerchantPortalPamFormController entity instance. |
| `MerchantPortalPamMandatorController` | `([entopts]) -> MerchantPortalPamMandatorControllerEntity` | Create a MerchantPortalPamMandatorController entity instance. |
| `MerchantPortalPamMerchantController` | `([entopts]) -> MerchantPortalPamMerchantControllerEntity` | Create a MerchantPortalPamMerchantController entity instance. |
| `MerchantPortalPamPackageController` | `([entopts]) -> MerchantPortalPamPackageControllerEntity` | Create a MerchantPortalPamPackageController entity instance. |
| `MerchantPortalPamProductController` | `([entopts]) -> MerchantPortalPamProductControllerEntity` | Create a MerchantPortalPamProductController entity instance. |
| `OutputAddProduct` | `([entopts]) -> OutputAddProductEntity` | Create an OutputAddProduct entity instance. |
| `OutputCreateProduct` | `([entopts]) -> OutputCreateProductEntity` | Create an OutputCreateProduct entity instance. |
| `OutputDetail` | `([entopts]) -> OutputDetailEntity` | Create an OutputDetail entity instance. |
| `OutputList` | `([entopts]) -> OutputListEntity` | Create an OutputList entity instance. |
| `OutputMessage` | `([entopts]) -> OutputMessageEntity` | Create an OutputMessage entity instance. |
| `OutputMoveTid` | `([entopts]) -> OutputMoveTidEntity` | Create an OutputMoveTid entity instance. |
| `OutputRemoveProduct` | `([entopts]) -> OutputRemoveProductEntity` | Create an OutputRemoveProduct entity instance. |
| `OutputStart` | `([entopts]) -> OutputStartEntity` | Create an OutputStart entity instance. |
| `OutputStatus` | `([entopts]) -> OutputStatusEntity` | Create an OutputStatus entity instance. |
| `OutputUpdateProduct` | `([entopts]) -> OutputUpdateProductEntity` | Create an OutputUpdateProduct entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, [ctrl]) -> Future<dynamic>` | Load a single entity by match criteria. Throws on error. |
| `create` | `(reqdata, [ctrl]) -> Future<dynamic>` | Create a new entity. Throws on error. |
| `data` | `([d]) -> Map` | Get (or, with an argument, set) entity data. |
| `match` | `([m]) -> Map` | Get (or, with an argument, set) entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `entopts` | `() -> Map` | Return the entity options. |
| `Name` | `String` | The entity name (a public field). |

### Result shape

Entity operations return the ENTITY (call data() for the record) (a `Map` for single-entity
ops, a `List` of entity instances for `list`) and throw on error. Wrap calls
in `try`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `Map` you
branch on via `result['ok']`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `dynamic` | Parsed JSON response body. |

On error, `ok` is `false` and `err` contains the error value.

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

Create an instance: `final merchant_portal_api_controller = client.MerchantPortalApiController();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `int` | Account number provided by the acquirer. |
| `additional_data` | `Map<String, dynamic>` | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `String` | Merchant business registration number as stated in the company registry. |
| `city` | `String` | Merchant's address: city. |
| `corporateuuid` | `String` | Unique identifier for the corporate entity (UUID format). |
| `country` | `String` | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `String` | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `int` | Merchant category code as defined by the payment network. |
| `merchant_email` | `String` | Merchant's email address for receiving notifications. |
| `merchant_name` | `String` | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | `String` | Merchant's phone number for notifications. |
| `packageid` | `String` | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | `String` | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | `String` | Merchant password for MPOS. |
| `productid` | `String` | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | `String` | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | `String` | Reason for terminal deactivation. |
| `reason_reactivation` | `String` | Reason for terminal reactivation. |
| `sorting_code` | `int` | Sorting code provided by the acquirer. |
| `state` | `String` | Merchant's address: state. |
| `street` | `String` | Merchant's address: street and house number. |
| `terminal_country_code` | `String` | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `String` | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `String` | Physical or logical location of the terminal. |
| `terminal_serial_number` | `String` | Terminal serial number. |
| `terminalid` | `int` | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `String` | Terminal ID as set by the acquirer (optional). |
| `user_email` | `String` | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `String` | Phone number of the user acting on behalf of the merchant. |
| `username` | `String` | Merchant username for MPOS. |
| `vu_nummer` | `String` | Merchant contract number with the acquirer. |
| `web_shop_url` | `String` | URL of the merchant's web shop. |
| `zipcode` | `String` | Merchant's address: postal code. |

#### Example: Create

```dart
final merchant_portal_api_controller = await client.MerchantPortalApiController().create({
  'business_reg_number': 'example_business_reg_number',  // String
  'city': 'example_city',  // String
  'country': 'example_country',  // String
  'currency': 'example_currency',  // String
  'merchant_category_code': 1,  // int
  'merchant_name': 'example_merchant_name',  // String
  'packageid': 'example_packageid',  // String
  'packageorderuuid': 'example_packageorderuuid',  // String
  'reason_deactivation': 'example_reason_deactivation',  // String
  'reason_reactivation': 'example_reason_reactivation',  // String
  'street': 'example_street',  // String
  'terminal_country_code': 'example_terminal_country_code',  // String
  'terminal_language_code': 'example_terminal_language_code',  // String
  'terminal_location': 'example_terminal_location',  // String
  'terminal_serial_number': 'example_terminal_serial_number',  // String
  'terminalid': 1,  // int
  'vu_nummer': 'example_vu_nummer',  // String
  'zipcode': 'example_zipcode',  // String
});
```


### MerchantPortalCommonController

Create an instance: `final merchant_portal_common_controller = client.MerchantPortalCommonController();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```dart
final merchant_portal_common_controller = await client.MerchantPortalCommonController().load();
```


### MerchantPortalPamContractController

Create an instance: `final merchant_portal_pam_contract_controller = client.MerchantPortalPamContractController();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `String` |  |
| `productOrderUUID` | `String` |  |

#### Example: Create

```dart
final merchant_portal_pam_contract_controller = await client.MerchantPortalPamContractController().create({
  'language': 'example_language',  // String
  'productOrderUUID': 'example_productOrderUUID',  // String
});
```


### MerchantPortalPamDocumentController

Create an instance: `final merchant_portal_pam_document_controller = client.MerchantPortalPamDocumentController();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldDescUUID` | `String` |  |
| `packageOrderUUID` | `String` | UUID of the package order. |
| `productOrderUUID` | `String` | UUID of the product order. |

#### Example: Create

```dart
final merchant_portal_pam_document_controller = await client.MerchantPortalPamDocumentController().create({
  'appFormFieldDescUUID': 'example_appFormFieldDescUUID',  // String
});
```


### MerchantPortalPamFormController

Create an instance: `final merchant_portal_pam_form_controller = client.MerchantPortalPamFormController();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldsDescUUID` | `String` |  |
| `filter` | `Map<String, dynamic>` |  |
| `language` | `String` |  |
| `packageOrder` | `Map<String, dynamic>` |  |
| `packageOrderUUID` | `String` | UUID of the package order. |
| `packageUUID` | `String` |  |
| `productOrderUUID` | `String` | UUID of the product order. |
| `productOrders` | `List<dynamic>` |  |
| `reasonOfReopening` | `String` |  |

#### Example: Create

```dart
final merchant_portal_pam_form_controller = await client.MerchantPortalPamFormController().create({
  'appFormFieldsDescUUID': 'example_appFormFieldsDescUUID',  // String
  'language': 'example_language',  // String
  'packageOrderUUID': 'example_packageOrderUUID',  // String
  'reasonOfReopening': 'example_reasonOfReopening',  // String
});
```


### MerchantPortalPamMandatorController

Create an instance: `final merchant_portal_pam_mandator_controller = client.MerchantPortalPamMandatorController();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `clientSecret` | `String` |  |
| `mandatorName` | `String` |  |
| `notificationEmail` | `String` |  |
| `packageUUID` | `String` |  |

#### Example: Create

```dart
final merchant_portal_pam_mandator_controller = await client.MerchantPortalPamMandatorController().create({
  'mandatorName': 'example_mandatorName',  // String
  'packageUUID': 'example_packageUUID',  // String
});
```


### MerchantPortalPamMerchantController

Create an instance: `final merchant_portal_pam_merchant_controller = client.MerchantPortalPamMerchantController();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `Map<String, dynamic>` | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` | `String` |  |
| `city` | `String` | City where the merchant is located. |
| `companyName` | `String` |  |
| `corporateUUID` | `String` | Unique identifier for the corporate entity. |
| `country` | `String` | Country where the merchant is located. |
| `currency` | `String` | Transaction currency in ISO 4217 format. |
| `email` | `String` |  |
| `language` | `String` |  |
| `login` | `String` |  |
| `mandator` | `String` | Mandator name assigned by TECS. |
| `merchantContractNumber` | `String` | Unique identifier for the merchant within a specific system. |
| `merchantName` | `String` | Name of the merchant. |
| `merchant_category_code` | `String` | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | `String` | UUID of the package. |
| `packageorderuuid` | `String` | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` | `String` |  |
| `postalCode` | `String` | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | `String` | Identifier of the product for which acquiring is to be enabled. |
| `region` | `String` | State or province where the merchant is located. |
| `registrationNumber` | `String` | Business registration number. |
| `signature` | `String` | Signature value = saltAsHex-hashAsHex. |
| `street` | `String` | Street address of the merchant. |
| `terminalIds` | `List<dynamic>` | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `String` | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `String` | Merchant contract number with the acquirer. |

#### Example: Create

```dart
final merchant_portal_pam_merchant_controller = await client.MerchantPortalPamMerchantController().create({
  'businessRegistrationNumber': 'example_businessRegistrationNumber',  // String
  'companyName': 'example_companyName',  // String
  'corporateUUID': 'example_corporateUUID',  // String
  'currency': 'example_currency',  // String
  'email': 'example_email',  // String
  'language': 'example_language',  // String
  'login': 'example_login',  // String
  'mandator': 'example_mandator',  // String
  'merchantContractNumber': 'example_merchantContractNumber',  // String
  'packageorderuuid': 'example_packageorderuuid',  // String
  'phoneNumber': 'example_phoneNumber',  // String
  'productid_acquirer': 'example_productid_acquirer',  // String
  'vu_nummer': 'example_vu_nummer',  // String
});
```


### MerchantPortalPamPackageController

Create an instance: `final merchant_portal_pam_package_controller = client.MerchantPortalPamPackageController();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `String` |  |
| `corporateUUID` | `String` |  |
| `country` | `String` | Country associated with the package. |
| `descriptionKey` | `String` | Key for the description of the package. |
| `filter` | `Map<String, dynamic>` |  |
| `language` | `String` |  |
| `nameKey` | `String` | Key for the name of the package. |
| `packageStatus` | `String` | Status of the package. |
| `packageUUID` | `String` | Unique identifier for the package. |
| `pagination` | `Map<String, dynamic>` |  |
| `sorting` | `Map<String, dynamic>` |  |

#### Example: Create

```dart
final merchant_portal_pam_package_controller = await client.MerchantPortalPamPackageController().create({
  'language': 'example_language',  // String
  'packageUUID': 'example_packageUUID',  // String
});
```


### MerchantPortalPamProductController

Create an instance: `final merchant_portal_pam_product_controller = client.MerchantPortalPamProductController();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `String` |  |
| `filter` | `Map<String, dynamic>` |  |
| `language` | `String` |  |
| `merchantID` | `String` |  |
| `packageOrderUUID` | `String` |  |
| `pagination` | `Map<String, dynamic>` |  |
| `productOrderUUID` | `String` |  |
| `productUUID` | `String` |  |
| `reason_decline` | `String` | Reason for product decline. |
| `sorting` | `Map<String, dynamic>` |  |

#### Example: Create

```dart
final merchant_portal_pam_product_controller = await client.MerchantPortalPamProductController().create({
  'packageOrderUUID': 'example_packageOrderUUID',  // String
  'productOrderUUID': 'example_productOrderUUID',  // String
  'productUUID': 'example_productUUID',  // String
  'reason_decline': 'example_reason_decline',  // String
});
```


### OutputAddProduct

Create an instance: `final output_add_product = client.OutputAddProduct();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `String` | Unique identifier for the package. |
| `productUUIDs` | `List<dynamic>` | The list of unique identifiers of the products. |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `String` | Response message. |

#### Example: Create

```dart
final output_add_product = await client.OutputAddProduct().create({
  'packageUUID': 'example_packageUUID',  // String
  'productUUIDs': <dynamic>[],  // List<dynamic>
  'responseCode': 1,  // int
  'responseMessage': 'example_responseMessage',  // String
});
```


### OutputCreateProduct

Create an instance: `final output_create_product = client.OutputCreateProduct();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirerId` | `String` | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `bool` | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `String` | Name of the application form template. |
| `contractNeeded` | `bool` | Indication whether contract is needed or not. |
| `credentialsNeeded` | `bool` | Indication whether credentials are needed or not. |
| `descriptionKey` | `String` | Key indicator for product description. |
| `nameKey` | `String` | Key indicator for product name. |
| `prescreeningAllowed` | `bool` | Indication whether prescreening is allowed or not. |
| `productName` | `String` | Name of the product. |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `String` | Response message. |
| `terminalTemplateName` | `String` | Name of the terminal template. |
| `vendorName` | `String` | Name of the vendor. |
| `xmlTemplateFile` | `String` | A string value containing the XML template file encoded in Base64. |

#### Example: Create

```dart
final output_create_product = await client.OutputCreateProduct().create({
  'allowMultipleOrders': true,  // bool
  'appFormTemplateName': 'example_appFormTemplateName',  // String
  'contractNeeded': true,  // bool
  'descriptionKey': 'example_descriptionKey',  // String
  'nameKey': 'example_nameKey',  // String
  'prescreeningAllowed': true,  // bool
  'productName': 'example_productName',  // String
  'responseCode': 1,  // int
  'responseMessage': 'example_responseMessage',  // String
  'terminalTemplateName': 'example_terminalTemplateName',  // String
  'vendorName': 'example_vendorName',  // String
  'xmlTemplateFile': 'example_xmlTemplateFile',  // String
});
```


### OutputDetail

Create an instance: `final output_detail = client.OutputDetail();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `batch` | `Map<String, dynamic>` |  |
| `lines` | `Map<String, dynamic>` |  |
| `progress` | `Map<String, dynamic>` |  |

#### Example: Load

```dart
final output_detail = await client.OutputDetail().load({'id': 'output_detail_id'});
```


### OutputList

Create an instance: `final output_list = client.OutputList();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `items` | `List<dynamic>` |  |
| `pagination` | `Map<String, dynamic>` |  |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `String` | Response message. |
| `sorting` | `Map<String, dynamic>` |  |

#### Example: Create

```dart
final output_list = await client.OutputList().create({
  'pagination': <String, dynamic>{},  // Map<String, dynamic>
  'responseCode': 1,  // int
  'responseMessage': 'example_responseMessage',  // String
});
```


### OutputMessage

Create an instance: `final output_message = client.OutputMessage();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `String` | Response message. |

#### Example: Load

```dart
final output_message = await client.OutputMessage().load({'id': 'output_message_id'});
```


### OutputMoveTid

Create an instance: `final output_move_tid = client.OutputMoveTid();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `productOrderUUIDs` | `List<dynamic>` |  |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `String` | Response message. |
| `targetPackageOrderUUID` | `String` |  |
| `targetProductOrderUUID` | `String` |  |

#### Example: Create

```dart
final output_move_tid = await client.OutputMoveTid().create({
  'productOrderUUIDs': <dynamic>[],  // List<dynamic>
  'responseCode': 1,  // int
  'responseMessage': 'example_responseMessage',  // String
  'targetPackageOrderUUID': 'example_targetPackageOrderUUID',  // String
  'targetProductOrderUUID': 'example_targetProductOrderUUID',  // String
});
```


### OutputRemoveProduct

Create an instance: `final output_remove_product = client.OutputRemoveProduct();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `String` | Unique identifier for the package. |
| `productUUIDs` | `List<dynamic>` | List of product unique identifiers. |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `String` | Response message. |

#### Example: Create

```dart
final output_remove_product = await client.OutputRemoveProduct().create({
  'packageUUID': 'example_packageUUID',  // String
  'productUUIDs': <dynamic>[],  // List<dynamic>
  'responseCode': 1,  // int
  'responseMessage': 'example_responseMessage',  // String
});
```


### OutputStart

Create an instance: `final output_start = client.OutputStart();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `String` |  |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `String` | Response message. |

#### Example: Create

```dart
final output_start = await client.OutputStart().create({
  'responseCode': 1,  // int
  'responseMessage': 'example_responseMessage',  // String
});
```


### OutputStatus

Create an instance: `final output_status = client.OutputStatus();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `int` |  |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `String` | Response message. |
| `status` | `String` |  |

#### Example: Load

```dart
final output_status = await client.OutputStatus().load({'id': 'output_status_id'});
```


### OutputUpdateProduct

Create an instance: `final output_update_product = client.OutputUpdateProduct();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allowMultipleOrders` | `bool` | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `String` | The name of the application form |
| `contractNeeded` | `bool` | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `bool` | An attribute to indicate if credentials are needed |
| `descriptionKey` | `String` | The description of the product |
| `nameKey` | `String` | The key of the product name |
| `prescreeningAllowed` | `bool` | An attribute to indicate if prescreening is allowed |
| `productName` | `String` | The name of the product |
| `productStatus` | `String` | The status of the product |
| `productUUID` | `String` | The UUID of the product to update |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `String` | Response message. |
| `vendorName` | `String` | The name of the vendor |

#### Example: Create

```dart
final output_update_product = await client.OutputUpdateProduct().create({
  'productUUID': 'example_productUUID',  // String
  'responseCode': 1,  // int
  'responseMessage': 'example_responseMessage',  // String
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

### Maps in, typed models alongside

The Dart SDK passes plain `Map<String, dynamic>` values through the
operation pipeline rather than requiring typed objects at every call. This
mirrors the dynamic nature of the API and keeps calls terse — a create is
just `create({'name': 'example'})`.

For a typed, documented view of each entity and operation, the generated
`BluefinTecsMerchantPortalTypes.dart` provides a class per entity plus per-op request/match
classes (e.g. `BluefinTecsMerchantPortal.fromMap(entity.data())` and `model.toMap()`), so you
can convert to and from those maps wherever you want compile-time structure.

### Package structure

```
dart/
├── lib/
│   ├── BluefinTecsMerchantPortalSDK.dart          -- Main SDK library (exported entry point)
│   ├── BluefinTecsMerchantPortalTypes.dart        -- Typed entity + request/match models
│   ├── BluefinTecsMerchantPortalEntityBase.dart   -- Base class for entities
│   ├── BluefinTecsMerchantPortalError.dart        -- SDK error type
│   ├── Config.dart              -- Configuration
│   ├── entity/                  -- Entity implementations
│   ├── feature/                 -- Built-in features (base, test, log, ...)
│   └── utility/                 -- Utility functions and vendored struct library
└── test/                        -- Test suites (dart run test/main.dart)
```

The main library (`BluefinTecsMerchantPortalSDK.dart`) re-exports the SDK class, the typed
models, and every entity class, so a single
`import 'package:bluefin_tecs_merchant_portal_sdk/BluefinTecsMerchantPortalSDK.dart';`
brings in everything you need.

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
