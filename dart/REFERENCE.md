# BluefinTecsMerchantPortal Dart SDK Reference

Complete API reference for the BluefinTecsMerchantPortal Dart SDK.

## BluefinTecsMerchantPortalSDK

### Constructor

```dart
import 'package:bluefin_tecs_merchant_portal_sdk/BluefinTecsMerchantPortalSDK.dart';

final client = BluefinTecsMerchantPortalSDK(options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Map` | SDK configuration options. |
| `options['base']` | `String` | Base URL for API requests. |
| `options['prefix']` | `String` | URL prefix appended after base. |
| `options['suffix']` | `String` | URL suffix appended after path. |
| `options['headers']` | `Map` | Custom headers for all requests. |
| `options['feature']` | `Map` | Feature configuration. |
| `options['system']` | `Map` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinTecsMerchantPortalSDK.test([testopts, sdkopts])`

Create a test client with mock features active. Both arguments may be `null`.

```dart
final client = BluefinTecsMerchantPortalSDK.test();
```


### Instance Methods

#### `MerchantPortalApiController([entopts])`

Create a new `MerchantPortalApiControllerEntity` instance. Pass no argument for no initial data.

#### `MerchantPortalCommonController([entopts])`

Create a new `MerchantPortalCommonControllerEntity` instance. Pass no argument for no initial data.

#### `MerchantPortalPamContractController([entopts])`

Create a new `MerchantPortalPamContractControllerEntity` instance. Pass no argument for no initial data.

#### `MerchantPortalPamDocumentController([entopts])`

Create a new `MerchantPortalPamDocumentControllerEntity` instance. Pass no argument for no initial data.

#### `MerchantPortalPamFormController([entopts])`

Create a new `MerchantPortalPamFormControllerEntity` instance. Pass no argument for no initial data.

#### `MerchantPortalPamMandatorController([entopts])`

Create a new `MerchantPortalPamMandatorControllerEntity` instance. Pass no argument for no initial data.

#### `MerchantPortalPamMerchantController([entopts])`

Create a new `MerchantPortalPamMerchantControllerEntity` instance. Pass no argument for no initial data.

#### `MerchantPortalPamPackageController([entopts])`

Create a new `MerchantPortalPamPackageControllerEntity` instance. Pass no argument for no initial data.

#### `MerchantPortalPamProductController([entopts])`

Create a new `MerchantPortalPamProductControllerEntity` instance. Pass no argument for no initial data.

#### `OutputAddProduct([entopts])`

Create a new `OutputAddProductEntity` instance. Pass no argument for no initial data.

#### `OutputCreateProduct([entopts])`

Create a new `OutputCreateProductEntity` instance. Pass no argument for no initial data.

#### `OutputDetail([entopts])`

Create a new `OutputDetailEntity` instance. Pass no argument for no initial data.

#### `OutputList([entopts])`

Create a new `OutputListEntity` instance. Pass no argument for no initial data.

#### `OutputMessage([entopts])`

Create a new `OutputMessageEntity` instance. Pass no argument for no initial data.

#### `OutputMoveTid([entopts])`

Create a new `OutputMoveTidEntity` instance. Pass no argument for no initial data.

#### `OutputRemoveProduct([entopts])`

Create a new `OutputRemoveProductEntity` instance. Pass no argument for no initial data.

#### `OutputStart([entopts])`

Create a new `OutputStartEntity` instance. Pass no argument for no initial data.

#### `OutputStatus([entopts])`

Create a new `OutputStatusEntity` instance. Pass no argument for no initial data.

#### `OutputUpdateProduct([entopts])`

Create a new `OutputUpdateProductEntity` instance. Pass no argument for no initial data.

#### `options() -> Map`

Return a deep copy of the current SDK options.

#### `utility() -> Utility`

Return the SDK utility object.

#### `direct([fetchargs]) -> Future<Map>`

Make a direct HTTP request to any API endpoint. Returns a result `Map` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never throws — branch on `result['ok']`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs['path']` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs['method']` | `String` | HTTP method (default: `'GET'`). |
| `fetchargs['params']` | `Map` | Path parameter values. |
| `fetchargs['query']` | `Map` | Query string parameters. |
| `fetchargs['headers']` | `Map` | Request headers (merged with defaults). |
| `fetchargs['body']` | `dynamic` | Request body (maps are JSON-serialized). |

**Returns:** `Future<Map>`

#### `prepare([fetchargs]) -> Future`

Prepare a fetch definition without sending. Returns the `fetchdef` (or an error value on failure).


---

## MerchantPortalApiControllerEntity

```dart
final merchant_portal_api_controller = client.MerchantPortalApiController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `int` | No |  |
| `additional_data` | `Map<String, dynamic>` | No |  |
| `business_reg_number` | `String` | Yes |  |
| `city` | `String` | Yes |  |
| `corporateuuid` | `String` | No |  |
| `country` | `String` | Yes |  |
| `currency` | `String` | Yes |  |
| `merchant_category_code` | `int` | Yes |  |
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
| `sorting_code` | `int` | No |  |
| `state` | `String` | No |  |
| `street` | `String` | Yes |  |
| `terminal_country_code` | `String` | Yes |  |
| `terminal_language_code` | `String` | Yes |  |
| `terminal_location` | `String` | Yes |  |
| `terminal_serial_number` | `String` | Yes |  |
| `terminalid` | `int` | Yes |  |
| `terminalid_acquirer` | `String` | No |  |
| `user_email` | `String` | No |  |
| `user_phone_number` | `String` | No |  |
| `username` | `String` | No |  |
| `vu_nummer` | `String` | Yes |  |
| `web_shop_url` | `String` | No |  |
| `zipcode` | `String` | Yes |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.MerchantPortalApiController().create({
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

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `MerchantPortalApiControllerEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## MerchantPortalCommonControllerEntity

```dart
final merchant_portal_common_controller = client.MerchantPortalCommonController();
```

### Operations

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.MerchantPortalCommonController().load();
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `MerchantPortalCommonControllerEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## MerchantPortalPamContractControllerEntity

```dart
final merchant_portal_pam_contract_controller = client.MerchantPortalPamContractController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `String` | Yes |  |
| `product_order_uuid` | `String` | Yes |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.MerchantPortalPamContractController().create({
  'language': 'example_language',  // String
  'product_order_uuid': 'example_product_order_uuid',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `MerchantPortalPamContractControllerEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## MerchantPortalPamDocumentControllerEntity

```dart
final merchant_portal_pam_document_controller = client.MerchantPortalPamDocumentController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_field_desc_uuid` | `String` | Yes |  |
| `package_order_uuid` | `String` | No |  |
| `product_order_uuid` | `String` | No |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.MerchantPortalPamDocumentController().create({
  'app_form_field_desc_uuid': 'example_app_form_field_desc_uuid',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `MerchantPortalPamDocumentControllerEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## MerchantPortalPamFormControllerEntity

```dart
final merchant_portal_pam_form_controller = client.MerchantPortalPamFormController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_fields_desc_uuid` | `String` | Yes |  |
| `filter` | `Map<String, dynamic>` | No |  |
| `language` | `String` | Yes |  |
| `package_order` | `Map<String, dynamic>` | No |  |
| `package_order_uuid` | `String` | Yes |  |
| `package_uuid` | `String` | No |  |
| `product_order` | `List<dynamic>` | No |  |
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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.MerchantPortalPamFormController().create({
  'app_form_fields_desc_uuid': 'example_app_form_fields_desc_uuid',  // String
  'language': 'example_language',  // String
  'package_order_uuid': 'example_package_order_uuid',  // String
  'reason_of_reopening': 'example_reason_of_reopening',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `MerchantPortalPamFormControllerEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## MerchantPortalPamMandatorControllerEntity

```dart
final merchant_portal_pam_mandator_controller = client.MerchantPortalPamMandatorController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client_secret` | `String` | No |  |
| `mandator_name` | `String` | Yes |  |
| `notification_email` | `String` | No |  |
| `package_uuid` | `String` | Yes |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.MerchantPortalPamMandatorController().create({
  'mandator_name': 'example_mandator_name',  // String
  'package_uuid': 'example_package_uuid',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `MerchantPortalPamMandatorControllerEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## MerchantPortalPamMerchantControllerEntity

```dart
final merchant_portal_pam_merchant_controller = client.MerchantPortalPamMerchantController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `Map<String, dynamic>` | No |  |
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
| `terminal_id` | `List<dynamic>` | No |  |
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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.MerchantPortalPamMerchantController().create({
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

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `MerchantPortalPamMerchantControllerEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## MerchantPortalPamPackageControllerEntity

```dart
final merchant_portal_pam_package_controller = client.MerchantPortalPamPackageController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `String` | No |  |
| `corporate_uuid` | `String` | No |  |
| `country` | `String` | No |  |
| `description_key` | `String` | No |  |
| `filter` | `Map<String, dynamic>` | No |  |
| `language` | `String` | Yes |  |
| `name_key` | `String` | No |  |
| `package_status` | `String` | No |  |
| `package_uuid` | `String` | Yes |  |
| `pagination` | `Map<String, dynamic>` | No |  |
| `sorting` | `Map<String, dynamic>` | No |  |

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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.MerchantPortalPamPackageController().create({
  'language': 'example_language',  // String
  'package_uuid': 'example_package_uuid',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `MerchantPortalPamPackageControllerEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## MerchantPortalPamProductControllerEntity

```dart
final merchant_portal_pam_product_controller = client.MerchantPortalPamProductController();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `String` | No |  |
| `filter` | `Map<String, dynamic>` | No |  |
| `language` | `String` | No |  |
| `merchant_id` | `String` | No |  |
| `package_order_uuid` | `String` | Yes |  |
| `pagination` | `Map<String, dynamic>` | No |  |
| `product_order_uuid` | `String` | Yes |  |
| `product_uuid` | `String` | Yes |  |
| `reason_decline` | `String` | Yes |  |
| `sorting` | `Map<String, dynamic>` | No |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.MerchantPortalPamProductController().create({
  'package_order_uuid': 'example_package_order_uuid',  // String
  'product_order_uuid': 'example_product_order_uuid',  // String
  'product_uuid': 'example_product_uuid',  // String
  'reason_decline': 'example_reason_decline',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `MerchantPortalPamProductControllerEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## OutputAddProductEntity

```dart
final output_add_product = client.OutputAddProduct();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `String` | Yes |  |
| `product_uui_d` | `List<dynamic>` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.OutputAddProduct().create({
  'package_uuid': 'example_package_uuid',  // String
  'product_uui_d': <dynamic>[],  // List<dynamic>
  'response_code': 1,  // int
  'response_message': 'example_response_message',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `OutputAddProductEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## OutputCreateProductEntity

```dart
final output_create_product = client.OutputCreateProduct();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acquirer_id` | `String` | No |  |
| `allow_multiple_order` | `bool` | Yes |  |
| `app_form_template_name` | `String` | Yes |  |
| `contract_needed` | `bool` | Yes |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `String` | Yes |  |
| `name_key` | `String` | Yes |  |
| `prescreening_allowed` | `bool` | Yes |  |
| `product_name` | `String` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `String` | Yes |  |
| `terminal_template_name` | `String` | Yes |  |
| `vendor_name` | `String` | Yes |  |
| `xml_template_file` | `String` | Yes |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.OutputCreateProduct().create({
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

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `OutputCreateProductEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## OutputDetailEntity

```dart
final output_detail = client.OutputDetail();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `detail` | `Map<String, dynamic>` | No |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.OutputDetail().load({'id': 'output_detail_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `OutputDetailEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## OutputListEntity

```dart
final output_list = client.OutputList();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `item` | `List<dynamic>` | No |  |
| `pagination` | `Map<String, dynamic>` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `String` | Yes |  |
| `sorting` | `Map<String, dynamic>` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.OutputList().create({
  'pagination': <String, dynamic>{},  // Map<String, dynamic>
  'response_code': 1,  // int
  'response_message': 'example_response_message',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `OutputListEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## OutputMessageEntity

```dart
final output_message = client.OutputMessage();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `response_code` | `int` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.OutputMessage().load({'id': 'output_message_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `OutputMessageEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## OutputMoveTidEntity

```dart
final output_move_tid = client.OutputMoveTid();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `product_order_uui_d` | `List<dynamic>` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `String` | Yes |  |
| `target_package_order_uuid` | `String` | Yes |  |
| `target_product_order_uuid` | `String` | Yes |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.OutputMoveTid().create({
  'product_order_uui_d': <dynamic>[],  // List<dynamic>
  'response_code': 1,  // int
  'response_message': 'example_response_message',  // String
  'target_package_order_uuid': 'example_target_package_order_uuid',  // String
  'target_product_order_uuid': 'example_target_product_order_uuid',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `OutputMoveTidEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## OutputRemoveProductEntity

```dart
final output_remove_product = client.OutputRemoveProduct();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `String` | Yes |  |
| `product_uui_d` | `List<dynamic>` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.OutputRemoveProduct().create({
  'package_uuid': 'example_package_uuid',  // String
  'product_uui_d': <dynamic>[],  // List<dynamic>
  'response_code': 1,  // int
  'response_message': 'example_response_message',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `OutputRemoveProductEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## OutputStartEntity

```dart
final output_start = client.OutputStart();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `String` | No |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.OutputStart().create({
  'response_code': 1,  // int
  'response_message': 'example_response_message',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `OutputStartEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## OutputStatusEntity

```dart
final output_status = client.OutputStatus();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `int` | No |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `String` | Yes |  |
| `status` | `String` | No |  |

### Operations

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.OutputStatus().load({'id': 'output_status_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `OutputStatusEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## OutputUpdateProductEntity

```dart
final output_update_product = client.OutputUpdateProduct();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `allow_multiple_order` | `bool` | No |  |
| `app_form_name` | `String` | No |  |
| `contract_needed` | `bool` | No |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `String` | No |  |
| `name_key` | `String` | No |  |
| `prescreening_allowed` | `bool` | No |  |
| `product_name` | `String` | No |  |
| `product_status` | `String` | No |  |
| `product_uuid` | `String` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `String` | Yes |  |
| `vendor_name` | `String` | No |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.OutputUpdateProduct().create({
  'product_uuid': 'example_product_uuid',  // String
  'response_code': 1,  // int
  'response_message': 'example_response_message',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `OutputUpdateProductEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```dart
final client = BluefinTecsMerchantPortalSDK({
  'feature': {
    'test': {'active': true},
  },
});
```

