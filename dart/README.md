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
// Create — returns the bare created record (a Map)
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

// Entity ops return the bare record and throw on error.
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

Entity operations return the bare result data (a `Map` for single-entity
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
| `account_number` |  |
| `additional_data` |  |
| `business_reg_number` |  |
| `city` |  |
| `corporateuuid` |  |
| `country` |  |
| `currency` |  |
| `merchant_category_code` |  |
| `merchant_email` |  |
| `merchant_name` |  |
| `merchant_phone_number` |  |
| `packageid` |  |
| `packageorderuuid` |  |
| `password` |  |
| `productid` |  |
| `productid_acquirer` |  |
| `reason_deactivation` |  |
| `reason_reactivation` |  |
| `sorting_code` |  |
| `state` |  |
| `street` |  |
| `terminal_country_code` |  |
| `terminal_language_code` |  |
| `terminal_location` |  |
| `terminal_serial_number` |  |
| `terminalid` |  |
| `terminalid_acquirer` |  |
| `user_email` |  |
| `user_phone_number` |  |
| `username` |  |
| `vu_nummer` |  |
| `web_shop_url` |  |
| `zipcode` |  |

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
| `product_order_uuid` |  |

Operations: Create.

API path: `/merchantportalws/generateContract`

#### MerchantPortalPamDocumentController

| Field | Description |
| --- | --- |
| `app_form_field_desc_uuid` |  |
| `package_order_uuid` |  |
| `product_order_uuid` |  |

Operations: Create.

API path: `/merchantportalws/documentsList`

#### MerchantPortalPamFormController

| Field | Description |
| --- | --- |
| `app_form_fields_desc_uuid` |  |
| `filter` |  |
| `language` |  |
| `package_order` |  |
| `package_order_uuid` |  |
| `package_uuid` |  |
| `product_order` |  |
| `product_order_uuid` |  |
| `reason_of_reopening` |  |

Operations: Create.

API path: `/merchantportalws/applicationForm`

#### MerchantPortalPamMandatorController

| Field | Description |
| --- | --- |
| `client_secret` |  |
| `mandator_name` |  |
| `notification_email` |  |
| `package_uuid` |  |

Operations: Create.

API path: `/merchantportalws/createMandatorConfig`

#### MerchantPortalPamMerchantController

| Field | Description |
| --- | --- |
| `additional_data` |  |
| `business_registration_number` |  |
| `city` |  |
| `company_name` |  |
| `corporate_uuid` |  |
| `country` |  |
| `currency` |  |
| `email` |  |
| `language` |  |
| `login` |  |
| `mandator` |  |
| `merchant_category_code` |  |
| `merchant_contract_number` |  |
| `merchant_name` |  |
| `package_uuid` |  |
| `packageorderuuid` |  |
| `phone_number` |  |
| `postal_code` |  |
| `productid_acquirer` |  |
| `region` |  |
| `registration_number` |  |
| `signature` |  |
| `street` |  |
| `terminal_id` |  |
| `terminalid_acquirer` |  |
| `vu_nummer` |  |

Operations: Create.

API path: `/merchantportalws/contractNumber`

#### MerchantPortalPamPackageController

| Field | Description |
| --- | --- |
| `consumer_uuid` |  |
| `corporate_uuid` |  |
| `country` |  |
| `description_key` |  |
| `filter` |  |
| `language` |  |
| `name_key` |  |
| `package_status` |  |
| `package_uuid` |  |
| `pagination` |  |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/availablePackages`

#### MerchantPortalPamProductController

| Field | Description |
| --- | --- |
| `consumer_uuid` |  |
| `filter` |  |
| `language` |  |
| `merchant_id` |  |
| `package_order_uuid` |  |
| `pagination` |  |
| `product_order_uuid` |  |
| `product_uuid` |  |
| `reason_decline` |  |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/approveProduct`

#### OutputAddProduct

| Field | Description |
| --- | --- |
| `package_uuid` |  |
| `product_uui_d` |  |
| `response_code` |  |
| `response_message` |  |

Operations: Create.

API path: `/merchantportalws/addProductsToPackage`

#### OutputCreateProduct

| Field | Description |
| --- | --- |
| `acquirer_id` |  |
| `allow_multiple_order` |  |
| `app_form_template_name` |  |
| `contract_needed` |  |
| `credentials_needed` |  |
| `description_key` |  |
| `name_key` |  |
| `prescreening_allowed` |  |
| `product_name` |  |
| `response_code` |  |
| `response_message` |  |
| `terminal_template_name` |  |
| `vendor_name` |  |
| `xml_template_file` |  |

Operations: Create.

API path: `/merchantportalws/createNewProduct`

#### OutputDetail

| Field | Description |
| --- | --- |
| `detail` |  |
| `response_code` |  |
| `response_message` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/details/{id}`

#### OutputList

| Field | Description |
| --- | --- |
| `item` |  |
| `pagination` |  |
| `response_code` |  |
| `response_message` |  |
| `sorting` |  |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/list`

#### OutputMessage

| Field | Description |
| --- | --- |
| `response_code` |  |
| `response_message` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/restart/{id}`

#### OutputMoveTid

| Field | Description |
| --- | --- |
| `product_order_uui_d` |  |
| `response_code` |  |
| `response_message` |  |
| `target_package_order_uuid` |  |
| `target_product_order_uuid` |  |

Operations: Create.

API path: `/merchantportalws/moveTid`

#### OutputRemoveProduct

| Field | Description |
| --- | --- |
| `package_uuid` |  |
| `product_uui_d` |  |
| `response_code` |  |
| `response_message` |  |

Operations: Create.

API path: `/merchantportalws/removeProductsFromPackage`

#### OutputStart

| Field | Description |
| --- | --- |
| `id` |  |
| `response_code` |  |
| `response_message` |  |

Operations: Create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/start`

#### OutputStatus

| Field | Description |
| --- | --- |
| `percentage` |  |
| `response_code` |  |
| `response_message` |  |
| `status` |  |

Operations: Load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/status/{id}`

#### OutputUpdateProduct

| Field | Description |
| --- | --- |
| `allow_multiple_order` |  |
| `app_form_name` |  |
| `contract_needed` |  |
| `credentials_needed` |  |
| `description_key` |  |
| `name_key` |  |
| `prescreening_allowed` |  |
| `product_name` |  |
| `product_status` |  |
| `product_uuid` |  |
| `response_code` |  |
| `response_message` |  |
| `vendor_name` |  |

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
| `account_number` | `int` |  |
| `additional_data` | `Map<String, dynamic>` |  |
| `business_reg_number` | `String` |  |
| `city` | `String` |  |
| `corporateuuid` | `String` |  |
| `country` | `String` |  |
| `currency` | `String` |  |
| `merchant_category_code` | `int` |  |
| `merchant_email` | `String` |  |
| `merchant_name` | `String` |  |
| `merchant_phone_number` | `String` |  |
| `packageid` | `String` |  |
| `packageorderuuid` | `String` |  |
| `password` | `String` |  |
| `productid` | `String` |  |
| `productid_acquirer` | `String` |  |
| `reason_deactivation` | `String` |  |
| `reason_reactivation` | `String` |  |
| `sorting_code` | `int` |  |
| `state` | `String` |  |
| `street` | `String` |  |
| `terminal_country_code` | `String` |  |
| `terminal_language_code` | `String` |  |
| `terminal_location` | `String` |  |
| `terminal_serial_number` | `String` |  |
| `terminalid` | `int` |  |
| `terminalid_acquirer` | `String` |  |
| `user_email` | `String` |  |
| `user_phone_number` | `String` |  |
| `username` | `String` |  |
| `vu_nummer` | `String` |  |
| `web_shop_url` | `String` |  |
| `zipcode` | `String` |  |

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
| `product_order_uuid` | `String` |  |

#### Example: Create

```dart
final merchant_portal_pam_contract_controller = await client.MerchantPortalPamContractController().create({
  'language': 'example_language',  // String
  'product_order_uuid': 'example_product_order_uuid',  // String
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
| `app_form_field_desc_uuid` | `String` |  |
| `package_order_uuid` | `String` |  |
| `product_order_uuid` | `String` |  |

#### Example: Create

```dart
final merchant_portal_pam_document_controller = await client.MerchantPortalPamDocumentController().create({
  'app_form_field_desc_uuid': 'example_app_form_field_desc_uuid',  // String
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
| `app_form_fields_desc_uuid` | `String` |  |
| `filter` | `Map<String, dynamic>` |  |
| `language` | `String` |  |
| `package_order` | `Map<String, dynamic>` |  |
| `package_order_uuid` | `String` |  |
| `package_uuid` | `String` |  |
| `product_order` | `List<dynamic>` |  |
| `product_order_uuid` | `String` |  |
| `reason_of_reopening` | `String` |  |

#### Example: Create

```dart
final merchant_portal_pam_form_controller = await client.MerchantPortalPamFormController().create({
  'app_form_fields_desc_uuid': 'example_app_form_fields_desc_uuid',  // String
  'language': 'example_language',  // String
  'package_order_uuid': 'example_package_order_uuid',  // String
  'reason_of_reopening': 'example_reason_of_reopening',  // String
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
| `client_secret` | `String` |  |
| `mandator_name` | `String` |  |
| `notification_email` | `String` |  |
| `package_uuid` | `String` |  |

#### Example: Create

```dart
final merchant_portal_pam_mandator_controller = await client.MerchantPortalPamMandatorController().create({
  'mandator_name': 'example_mandator_name',  // String
  'package_uuid': 'example_package_uuid',  // String
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
| `additional_data` | `Map<String, dynamic>` |  |
| `business_registration_number` | `String` |  |
| `city` | `String` |  |
| `company_name` | `String` |  |
| `corporate_uuid` | `String` |  |
| `country` | `String` |  |
| `currency` | `String` |  |
| `email` | `String` |  |
| `language` | `String` |  |
| `login` | `String` |  |
| `mandator` | `String` |  |
| `merchant_category_code` | `String` |  |
| `merchant_contract_number` | `String` |  |
| `merchant_name` | `String` |  |
| `package_uuid` | `String` |  |
| `packageorderuuid` | `String` |  |
| `phone_number` | `String` |  |
| `postal_code` | `String` |  |
| `productid_acquirer` | `String` |  |
| `region` | `String` |  |
| `registration_number` | `String` |  |
| `signature` | `String` |  |
| `street` | `String` |  |
| `terminal_id` | `List<dynamic>` |  |
| `terminalid_acquirer` | `String` |  |
| `vu_nummer` | `String` |  |

#### Example: Create

```dart
final merchant_portal_pam_merchant_controller = await client.MerchantPortalPamMerchantController().create({
  'business_registration_number': 'example_business_registration_number',  // String
  'company_name': 'example_company_name',  // String
  'corporate_uuid': 'example_corporate_uuid',  // String
  'currency': 'example_currency',  // String
  'email': 'example_email',  // String
  'language': 'example_language',  // String
  'login': 'example_login',  // String
  'mandator': 'example_mandator',  // String
  'merchant_contract_number': 'example_merchant_contract_number',  // String
  'packageorderuuid': 'example_packageorderuuid',  // String
  'phone_number': 'example_phone_number',  // String
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
| `consumer_uuid` | `String` |  |
| `corporate_uuid` | `String` |  |
| `country` | `String` |  |
| `description_key` | `String` |  |
| `filter` | `Map<String, dynamic>` |  |
| `language` | `String` |  |
| `name_key` | `String` |  |
| `package_status` | `String` |  |
| `package_uuid` | `String` |  |
| `pagination` | `Map<String, dynamic>` |  |
| `sorting` | `Map<String, dynamic>` |  |

#### Example: Create

```dart
final merchant_portal_pam_package_controller = await client.MerchantPortalPamPackageController().create({
  'language': 'example_language',  // String
  'package_uuid': 'example_package_uuid',  // String
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
| `consumer_uuid` | `String` |  |
| `filter` | `Map<String, dynamic>` |  |
| `language` | `String` |  |
| `merchant_id` | `String` |  |
| `package_order_uuid` | `String` |  |
| `pagination` | `Map<String, dynamic>` |  |
| `product_order_uuid` | `String` |  |
| `product_uuid` | `String` |  |
| `reason_decline` | `String` |  |
| `sorting` | `Map<String, dynamic>` |  |

#### Example: Create

```dart
final merchant_portal_pam_product_controller = await client.MerchantPortalPamProductController().create({
  'package_order_uuid': 'example_package_order_uuid',  // String
  'product_order_uuid': 'example_product_order_uuid',  // String
  'product_uuid': 'example_product_uuid',  // String
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
| `package_uuid` | `String` |  |
| `product_uui_d` | `List<dynamic>` |  |
| `response_code` | `int` |  |
| `response_message` | `String` |  |

#### Example: Create

```dart
final output_add_product = await client.OutputAddProduct().create({
  'package_uuid': 'example_package_uuid',  // String
  'product_uui_d': <dynamic>[],  // List<dynamic>
  'response_code': 1,  // int
  'response_message': 'example_response_message',  // String
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
| `acquirer_id` | `String` |  |
| `allow_multiple_order` | `bool` |  |
| `app_form_template_name` | `String` |  |
| `contract_needed` | `bool` |  |
| `credentials_needed` | `bool` |  |
| `description_key` | `String` |  |
| `name_key` | `String` |  |
| `prescreening_allowed` | `bool` |  |
| `product_name` | `String` |  |
| `response_code` | `int` |  |
| `response_message` | `String` |  |
| `terminal_template_name` | `String` |  |
| `vendor_name` | `String` |  |
| `xml_template_file` | `String` |  |

#### Example: Create

```dart
final output_create_product = await client.OutputCreateProduct().create({
  'allow_multiple_order': true,  // bool
  'app_form_template_name': 'example_app_form_template_name',  // String
  'contract_needed': true,  // bool
  'description_key': 'example_description_key',  // String
  'name_key': 'example_name_key',  // String
  'prescreening_allowed': true,  // bool
  'product_name': 'example_product_name',  // String
  'response_code': 1,  // int
  'response_message': 'example_response_message',  // String
  'terminal_template_name': 'example_terminal_template_name',  // String
  'vendor_name': 'example_vendor_name',  // String
  'xml_template_file': 'example_xml_template_file',  // String
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
| `detail` | `Map<String, dynamic>` |  |
| `response_code` | `int` |  |
| `response_message` | `String` |  |

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
| `item` | `List<dynamic>` |  |
| `pagination` | `Map<String, dynamic>` |  |
| `response_code` | `int` |  |
| `response_message` | `String` |  |
| `sorting` | `Map<String, dynamic>` |  |

#### Example: Create

```dart
final output_list = await client.OutputList().create({
  'pagination': <String, dynamic>{},  // Map<String, dynamic>
  'response_code': 1,  // int
  'response_message': 'example_response_message',  // String
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
| `response_code` | `int` |  |
| `response_message` | `String` |  |

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
| `product_order_uui_d` | `List<dynamic>` |  |
| `response_code` | `int` |  |
| `response_message` | `String` |  |
| `target_package_order_uuid` | `String` |  |
| `target_product_order_uuid` | `String` |  |

#### Example: Create

```dart
final output_move_tid = await client.OutputMoveTid().create({
  'product_order_uui_d': <dynamic>[],  // List<dynamic>
  'response_code': 1,  // int
  'response_message': 'example_response_message',  // String
  'target_package_order_uuid': 'example_target_package_order_uuid',  // String
  'target_product_order_uuid': 'example_target_product_order_uuid',  // String
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
| `package_uuid` | `String` |  |
| `product_uui_d` | `List<dynamic>` |  |
| `response_code` | `int` |  |
| `response_message` | `String` |  |

#### Example: Create

```dart
final output_remove_product = await client.OutputRemoveProduct().create({
  'package_uuid': 'example_package_uuid',  // String
  'product_uui_d': <dynamic>[],  // List<dynamic>
  'response_code': 1,  // int
  'response_message': 'example_response_message',  // String
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
| `response_code` | `int` |  |
| `response_message` | `String` |  |

#### Example: Create

```dart
final output_start = await client.OutputStart().create({
  'response_code': 1,  // int
  'response_message': 'example_response_message',  // String
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
| `response_code` | `int` |  |
| `response_message` | `String` |  |
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
| `allow_multiple_order` | `bool` |  |
| `app_form_name` | `String` |  |
| `contract_needed` | `bool` |  |
| `credentials_needed` | `bool` |  |
| `description_key` | `String` |  |
| `name_key` | `String` |  |
| `prescreening_allowed` | `bool` |  |
| `product_name` | `String` |  |
| `product_status` | `String` |  |
| `product_uuid` | `String` |  |
| `response_code` | `int` |  |
| `response_message` | `String` |  |
| `vendor_name` | `String` |  |

#### Example: Create

```dart
final output_update_product = await client.OutputUpdateProduct().create({
  'product_uuid': 'example_product_uuid',  // String
  'response_code': 1,  // int
  'response_message': 'example_response_message',  // String
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
