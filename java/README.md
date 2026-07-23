# BluefinTecsMerchantPortal Java SDK



The Java SDK for the BluefinTecsMerchantPortal API — an entity-oriented client following idiomatic Java conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.merchantPortalApiController(null)` — each
carrying a small, uniform set of operations (`load`, `create`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Maven Central. Install it from the GitHub
release tag (`java/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases)) or
from a source checkout — build the library with Maven:

```bash
cd java && mvn install
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```java
import voxgig.bluefintecsmerchantportalsdk.core.BluefinTecsMerchantPortalSDK;

BluefinTecsMerchantPortalSDK client = new BluefinTecsMerchantPortalSDK();
```

### 4. Create, update, and remove

```java
// Create — returns the bare created record (as Object)
Object created = client.merchantPortalApiController(null).create(Map.of("business_reg_number", "example_business_reg_number", "city", "example_city", "country", "example_country", "currency", "example_currency", "merchant_category_code", 1L, "merchant_name", "example_merchant_name", "packageid", "example_packageid", "packageorderuuid", "example_packageorderuuid", "reason_deactivation", "example_reason_deactivation", "reason_reactivation", "example_reason_reactivation", "street", "example_street", "terminal_country_code", "example_terminal_country_code", "terminal_language_code", "example_terminal_language_code", "terminal_location", "example_terminal_location", "terminal_serial_number", "example_terminal_serial_number", "terminalid", 1L, "vu_nummer", "example_vu_nummer", "zipcode", "example_zipcode"), null);

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

```java
Map<String, Object> result = client.direct(Map.of(
    "path", "/api/resource/{id}",
    "method", "GET",
    "params", Map.of("id", "example")));

if (Boolean.TRUE.equals(result.get("ok"))) {
    System.out.println(result.get("status"));  // 200
    System.out.println(result.get("data"));    // response body
}
else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // read both — an absent key simply reads as null.
    System.out.println(result.get("status") + " " + result.get("err"));
}
```

### Prepare a request without sending it

```java
// prepare() returns the fetch definition and raises on error.
Map<String, Object> fetchdef = client.prepare(Map.of(
    "path", "/api/resource/{id}",
    "method", "DELETE",
    "params", Map.of("id", "example")));

System.out.println(fetchdef.get("url"));
System.out.println(fetchdef.get("method"));
System.out.println(fetchdef.get("headers"));
```

### Use test mode

Create a mock client for unit testing — no server required:

```java
BluefinTecsMerchantPortalSDK client = BluefinTecsMerchantPortalSDK.testSDK(null, null);

// Entity ops return the bare record and raise on error.
Object outputDetail = client.outputDetail(null).load(Map.of("id", "test01"), null);
// outputDetail holds the mock response record
System.out.println(outputDetail);
```

### Use a custom fetch function

Replace the HTTP transport with your own `BiFunction`:

```java
java.util.function.BiFunction<String, Map<String, Object>, Object> mockFetch =
    (url, init) -> {
        Map<String, Object> res = new java.util.LinkedHashMap<>();
        res.put("status", 200);
        res.put("statusText", "OK");
        res.put("headers", new java.util.LinkedHashMap<String, Object>());
        res.put("json", (java.util.function.Supplier<Object>) () ->
            Map.of("id", "mock01"));
        return res;
    };

Map<String, Object> options = new java.util.LinkedHashMap<>();
options.put("base", "http://localhost:8080");
options.put("system", Map.of("fetch", mockFetch));
BluefinTecsMerchantPortalSDK client = new BluefinTecsMerchantPortalSDK(options);
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run:

```bash
cd java && mvn test
```


## Reference

### BluefinTecsMerchantPortalSDK

```java
BluefinTecsMerchantPortalSDK client = new BluefinTecsMerchantPortalSDK(options);
```

Creates a new SDK client. `options` is a `Map<String, Object>`.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Map` | Feature activation flags. |
| `extend` | `List` | Additional Feature instances to load. |
| `system` | `Map` | System overrides (e.g. custom `fetch` function). |

### testSDK

```java
BluefinTecsMerchantPortalSDK client = BluefinTecsMerchantPortalSDK.testSDK(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinTecsMerchantPortalSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `optionsMap` | `() -> Map` | Deep copy of current SDK options. |
| `getUtility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Map` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> Map` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `merchantPortalApiController` | `(entopts) -> SdkEntity` | Create a MerchantPortalApiController entity instance. |
| `merchantPortalCommonController` | `(entopts) -> SdkEntity` | Create a MerchantPortalCommonController entity instance. |
| `merchantPortalPamContractController` | `(entopts) -> SdkEntity` | Create a MerchantPortalPamContractController entity instance. |
| `merchantPortalPamDocumentController` | `(entopts) -> SdkEntity` | Create a MerchantPortalPamDocumentController entity instance. |
| `merchantPortalPamFormController` | `(entopts) -> SdkEntity` | Create a MerchantPortalPamFormController entity instance. |
| `merchantPortalPamMandatorController` | `(entopts) -> SdkEntity` | Create a MerchantPortalPamMandatorController entity instance. |
| `merchantPortalPamMerchantController` | `(entopts) -> SdkEntity` | Create a MerchantPortalPamMerchantController entity instance. |
| `merchantPortalPamPackageController` | `(entopts) -> SdkEntity` | Create a MerchantPortalPamPackageController entity instance. |
| `merchantPortalPamProductController` | `(entopts) -> SdkEntity` | Create a MerchantPortalPamProductController entity instance. |
| `outputAddProduct` | `(entopts) -> SdkEntity` | Create an OutputAddProduct entity instance. |
| `outputCreateProduct` | `(entopts) -> SdkEntity` | Create an OutputCreateProduct entity instance. |
| `outputDetail` | `(entopts) -> SdkEntity` | Create an OutputDetail entity instance. |
| `outputList` | `(entopts) -> SdkEntity` | Create an OutputList entity instance. |
| `outputMessage` | `(entopts) -> SdkEntity` | Create an OutputMessage entity instance. |
| `outputMoveTid` | `(entopts) -> SdkEntity` | Create an OutputMoveTid entity instance. |
| `outputRemoveProduct` | `(entopts) -> SdkEntity` | Create an OutputRemoveProduct entity instance. |
| `outputStart` | `(entopts) -> SdkEntity` | Create an OutputStart entity instance. |
| `outputStatus` | `(entopts) -> SdkEntity` | Create an OutputStatus entity instance. |
| `outputUpdateProduct` | `(entopts) -> SdkEntity` | Create an OutputUpdateProduct entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> Object` | Load a single entity by match criteria. Raises on error. |
| `create` | `(reqdata, ctrl) -> Object` | Create a new entity. Raises on error. |
| `data` | `(newdata...) -> Object` | Get or set entity data. |
| `match` | `(newmatch...) -> Object` | Get or set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `getName` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `Map` for single-entity
ops, an aggregate `List` for `list`) as `Object` and raise on error. Wrap
calls in `try`/`catch` to handle failures.

The `direct()` escape hatch never raises — it returns a result
`Map<String, Object>` you branch on via `result.get("ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `Object` | Parsed JSON response body. |

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

Operations: create.

API path: `/merchantportalws/deactivateTerminal`

#### MerchantPortalCommonController

| Field | Description |
| --- | --- |

Operations: load.

API path: `/merchantportalws/logDeveloperInfo`

#### MerchantPortalPamContractController

| Field | Description |
| --- | --- |
| `language` |  |
| `product_order_uuid` |  |

Operations: create.

API path: `/merchantportalws/generateContract`

#### MerchantPortalPamDocumentController

| Field | Description |
| --- | --- |
| `app_form_field_desc_uuid` |  |
| `package_order_uuid` |  |
| `product_order_uuid` |  |

Operations: create.

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

Operations: create.

API path: `/merchantportalws/applicationForm`

#### MerchantPortalPamMandatorController

| Field | Description |
| --- | --- |
| `client_secret` |  |
| `mandator_name` |  |
| `notification_email` |  |
| `package_uuid` |  |

Operations: create.

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

Operations: create.

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

Operations: create.

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

Operations: create.

API path: `/merchantportalws/approveProduct`

#### OutputAddProduct

| Field | Description |
| --- | --- |
| `package_uuid` |  |
| `product_uui_d` |  |
| `response_code` |  |
| `response_message` |  |

Operations: create.

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

Operations: create.

API path: `/merchantportalws/createNewProduct`

#### OutputDetail

| Field | Description |
| --- | --- |
| `detail` |  |
| `response_code` |  |
| `response_message` |  |

Operations: load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/details/{id}`

#### OutputList

| Field | Description |
| --- | --- |
| `item` |  |
| `pagination` |  |
| `response_code` |  |
| `response_message` |  |
| `sorting` |  |

Operations: create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/list`

#### OutputMessage

| Field | Description |
| --- | --- |
| `response_code` |  |
| `response_message` |  |

Operations: load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/restart/{id}`

#### OutputMoveTid

| Field | Description |
| --- | --- |
| `product_order_uui_d` |  |
| `response_code` |  |
| `response_message` |  |
| `target_package_order_uuid` |  |
| `target_product_order_uuid` |  |

Operations: create.

API path: `/merchantportalws/moveTid`

#### OutputRemoveProduct

| Field | Description |
| --- | --- |
| `package_uuid` |  |
| `product_uui_d` |  |
| `response_code` |  |
| `response_message` |  |

Operations: create.

API path: `/merchantportalws/removeProductsFromPackage`

#### OutputStart

| Field | Description |
| --- | --- |
| `id` |  |
| `response_code` |  |
| `response_message` |  |

Operations: create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/start`

#### OutputStatus

| Field | Description |
| --- | --- |
| `percentage` |  |
| `response_code` |  |
| `response_message` |  |
| `status` |  |

Operations: load.

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

Operations: create.

API path: `/merchantportalws/updateProduct`



## Entities


### MerchantPortalApiController

Create an instance: `SdkEntity merchantPortalApiController = client.merchantPortalApiController(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `Long` |  |
| `additional_data` | `Map<String, Object>` |  |
| `business_reg_number` | `String` |  |
| `city` | `String` |  |
| `corporateuuid` | `String` |  |
| `country` | `String` |  |
| `currency` | `String` |  |
| `merchant_category_code` | `Long` |  |
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
| `sorting_code` | `Long` |  |
| `state` | `String` |  |
| `street` | `String` |  |
| `terminal_country_code` | `String` |  |
| `terminal_language_code` | `String` |  |
| `terminal_location` | `String` |  |
| `terminal_serial_number` | `String` |  |
| `terminalid` | `Long` |  |
| `terminalid_acquirer` | `String` |  |
| `user_email` | `String` |  |
| `user_phone_number` | `String` |  |
| `username` | `String` |  |
| `vu_nummer` | `String` |  |
| `web_shop_url` | `String` |  |
| `zipcode` | `String` |  |

#### Example: Create

```java
Object merchantPortalApiController = client.merchantPortalApiController(null).create(Map.of(
    "business_reg_number", "example_business_reg_number",  // String
    "city", "example_city",  // String
    "country", "example_country",  // String
    "currency", "example_currency",  // String
    "merchant_category_code", 1L,  // Long
    "merchant_name", "example_merchant_name",  // String
    "packageid", "example_packageid",  // String
    "packageorderuuid", "example_packageorderuuid",  // String
    "reason_deactivation", "example_reason_deactivation",  // String
    "reason_reactivation", "example_reason_reactivation",  // String
    "street", "example_street",  // String
    "terminal_country_code", "example_terminal_country_code",  // String
    "terminal_language_code", "example_terminal_language_code",  // String
    "terminal_location", "example_terminal_location",  // String
    "terminal_serial_number", "example_terminal_serial_number",  // String
    "terminalid", 1L,  // Long
    "vu_nummer", "example_vu_nummer",  // String
    "zipcode", "example_zipcode"  // String
), null);
```


### MerchantPortalCommonController

Create an instance: `SdkEntity merchantPortalCommonController = client.merchantPortalCommonController(null);`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Example: Load

```java
Object merchantPortalCommonController = client.merchantPortalCommonController(null).load(null, null);
```


### MerchantPortalPamContractController

Create an instance: `SdkEntity merchantPortalPamContractController = client.merchantPortalPamContractController(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `String` |  |
| `product_order_uuid` | `String` |  |

#### Example: Create

```java
Object merchantPortalPamContractController = client.merchantPortalPamContractController(null).create(Map.of(
    "language", "example_language",  // String
    "product_order_uuid", "example_product_order_uuid"  // String
), null);
```


### MerchantPortalPamDocumentController

Create an instance: `SdkEntity merchantPortalPamDocumentController = client.merchantPortalPamDocumentController(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_field_desc_uuid` | `String` |  |
| `package_order_uuid` | `String` |  |
| `product_order_uuid` | `String` |  |

#### Example: Create

```java
Object merchantPortalPamDocumentController = client.merchantPortalPamDocumentController(null).create(Map.of(
    "app_form_field_desc_uuid", "example_app_form_field_desc_uuid"  // String
), null);
```


### MerchantPortalPamFormController

Create an instance: `SdkEntity merchantPortalPamFormController = client.merchantPortalPamFormController(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_form_fields_desc_uuid` | `String` |  |
| `filter` | `Map<String, Object>` |  |
| `language` | `String` |  |
| `package_order` | `Map<String, Object>` |  |
| `package_order_uuid` | `String` |  |
| `package_uuid` | `String` |  |
| `product_order` | `List<Object>` |  |
| `product_order_uuid` | `String` |  |
| `reason_of_reopening` | `String` |  |

#### Example: Create

```java
Object merchantPortalPamFormController = client.merchantPortalPamFormController(null).create(Map.of(
    "app_form_fields_desc_uuid", "example_app_form_fields_desc_uuid",  // String
    "language", "example_language",  // String
    "package_order_uuid", "example_package_order_uuid",  // String
    "reason_of_reopening", "example_reason_of_reopening"  // String
), null);
```


### MerchantPortalPamMandatorController

Create an instance: `SdkEntity merchantPortalPamMandatorController = client.merchantPortalPamMandatorController(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client_secret` | `String` |  |
| `mandator_name` | `String` |  |
| `notification_email` | `String` |  |
| `package_uuid` | `String` |  |

#### Example: Create

```java
Object merchantPortalPamMandatorController = client.merchantPortalPamMandatorController(null).create(Map.of(
    "mandator_name", "example_mandator_name",  // String
    "package_uuid", "example_package_uuid"  // String
), null);
```


### MerchantPortalPamMerchantController

Create an instance: `SdkEntity merchantPortalPamMerchantController = client.merchantPortalPamMerchantController(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `Map<String, Object>` |  |
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
| `terminal_id` | `List<Object>` |  |
| `terminalid_acquirer` | `String` |  |
| `vu_nummer` | `String` |  |

#### Example: Create

```java
Object merchantPortalPamMerchantController = client.merchantPortalPamMerchantController(null).create(Map.of(
    "business_registration_number", "example_business_registration_number",  // String
    "company_name", "example_company_name",  // String
    "corporate_uuid", "example_corporate_uuid",  // String
    "currency", "example_currency",  // String
    "email", "example_email",  // String
    "language", "example_language",  // String
    "login", "example_login",  // String
    "mandator", "example_mandator",  // String
    "merchant_contract_number", "example_merchant_contract_number",  // String
    "packageorderuuid", "example_packageorderuuid",  // String
    "phone_number", "example_phone_number",  // String
    "productid_acquirer", "example_productid_acquirer",  // String
    "vu_nummer", "example_vu_nummer"  // String
), null);
```


### MerchantPortalPamPackageController

Create an instance: `SdkEntity merchantPortalPamPackageController = client.merchantPortalPamPackageController(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `String` |  |
| `corporate_uuid` | `String` |  |
| `country` | `String` |  |
| `description_key` | `String` |  |
| `filter` | `Map<String, Object>` |  |
| `language` | `String` |  |
| `name_key` | `String` |  |
| `package_status` | `String` |  |
| `package_uuid` | `String` |  |
| `pagination` | `Map<String, Object>` |  |
| `sorting` | `Map<String, Object>` |  |

#### Example: Create

```java
Object merchantPortalPamPackageController = client.merchantPortalPamPackageController(null).create(Map.of(
    "language", "example_language",  // String
    "package_uuid", "example_package_uuid"  // String
), null);
```


### MerchantPortalPamProductController

Create an instance: `SdkEntity merchantPortalPamProductController = client.merchantPortalPamProductController(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumer_uuid` | `String` |  |
| `filter` | `Map<String, Object>` |  |
| `language` | `String` |  |
| `merchant_id` | `String` |  |
| `package_order_uuid` | `String` |  |
| `pagination` | `Map<String, Object>` |  |
| `product_order_uuid` | `String` |  |
| `product_uuid` | `String` |  |
| `reason_decline` | `String` |  |
| `sorting` | `Map<String, Object>` |  |

#### Example: Create

```java
Object merchantPortalPamProductController = client.merchantPortalPamProductController(null).create(Map.of(
    "package_order_uuid", "example_package_order_uuid",  // String
    "product_order_uuid", "example_product_order_uuid",  // String
    "product_uuid", "example_product_uuid",  // String
    "reason_decline", "example_reason_decline"  // String
), null);
```


### OutputAddProduct

Create an instance: `SdkEntity outputAddProduct = client.outputAddProduct(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `String` |  |
| `product_uui_d` | `List<Object>` |  |
| `response_code` | `Long` |  |
| `response_message` | `String` |  |

#### Example: Create

```java
Object outputAddProduct = client.outputAddProduct(null).create(Map.of(
    "package_uuid", "example_package_uuid",  // String
    "product_uui_d", List.of(),  // List<Object>
    "response_code", 1L,  // Long
    "response_message", "example_response_message"  // String
), null);
```


### OutputCreateProduct

Create an instance: `SdkEntity outputCreateProduct = client.outputCreateProduct(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirer_id` | `String` |  |
| `allow_multiple_order` | `Boolean` |  |
| `app_form_template_name` | `String` |  |
| `contract_needed` | `Boolean` |  |
| `credentials_needed` | `Boolean` |  |
| `description_key` | `String` |  |
| `name_key` | `String` |  |
| `prescreening_allowed` | `Boolean` |  |
| `product_name` | `String` |  |
| `response_code` | `Long` |  |
| `response_message` | `String` |  |
| `terminal_template_name` | `String` |  |
| `vendor_name` | `String` |  |
| `xml_template_file` | `String` |  |

#### Example: Create

```java
Object outputCreateProduct = client.outputCreateProduct(null).create(Map.of(
    "allow_multiple_order", true,  // Boolean
    "app_form_template_name", "example_app_form_template_name",  // String
    "contract_needed", true,  // Boolean
    "description_key", "example_description_key",  // String
    "name_key", "example_name_key",  // String
    "prescreening_allowed", true,  // Boolean
    "product_name", "example_product_name",  // String
    "response_code", 1L,  // Long
    "response_message", "example_response_message",  // String
    "terminal_template_name", "example_terminal_template_name",  // String
    "vendor_name", "example_vendor_name",  // String
    "xml_template_file", "example_xml_template_file"  // String
), null);
```


### OutputDetail

Create an instance: `SdkEntity outputDetail = client.outputDetail(null);`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `detail` | `Map<String, Object>` |  |
| `response_code` | `Long` |  |
| `response_message` | `String` |  |

#### Example: Load

```java
Object outputDetail = client.outputDetail(null).load(Map.of("id", "output_detail_id"), null);
```


### OutputList

Create an instance: `SdkEntity outputList = client.outputList(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `item` | `List<Object>` |  |
| `pagination` | `Map<String, Object>` |  |
| `response_code` | `Long` |  |
| `response_message` | `String` |  |
| `sorting` | `Map<String, Object>` |  |

#### Example: Create

```java
Object outputList = client.outputList(null).create(Map.of(
    "pagination", Map.of(),  // Map<String, Object>
    "response_code", 1L,  // Long
    "response_message", "example_response_message"  // String
), null);
```


### OutputMessage

Create an instance: `SdkEntity outputMessage = client.outputMessage(null);`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `response_code` | `Long` |  |
| `response_message` | `String` |  |

#### Example: Load

```java
Object outputMessage = client.outputMessage(null).load(Map.of("id", "output_message_id"), null);
```


### OutputMoveTid

Create an instance: `SdkEntity outputMoveTid = client.outputMoveTid(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `product_order_uui_d` | `List<Object>` |  |
| `response_code` | `Long` |  |
| `response_message` | `String` |  |
| `target_package_order_uuid` | `String` |  |
| `target_product_order_uuid` | `String` |  |

#### Example: Create

```java
Object outputMoveTid = client.outputMoveTid(null).create(Map.of(
    "product_order_uui_d", List.of(),  // List<Object>
    "response_code", 1L,  // Long
    "response_message", "example_response_message",  // String
    "target_package_order_uuid", "example_target_package_order_uuid",  // String
    "target_product_order_uuid", "example_target_product_order_uuid"  // String
), null);
```


### OutputRemoveProduct

Create an instance: `SdkEntity outputRemoveProduct = client.outputRemoveProduct(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `package_uuid` | `String` |  |
| `product_uui_d` | `List<Object>` |  |
| `response_code` | `Long` |  |
| `response_message` | `String` |  |

#### Example: Create

```java
Object outputRemoveProduct = client.outputRemoveProduct(null).create(Map.of(
    "package_uuid", "example_package_uuid",  // String
    "product_uui_d", List.of(),  // List<Object>
    "response_code", 1L,  // Long
    "response_message", "example_response_message"  // String
), null);
```


### OutputStart

Create an instance: `SdkEntity outputStart = client.outputStart(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `String` |  |
| `response_code` | `Long` |  |
| `response_message` | `String` |  |

#### Example: Create

```java
Object outputStart = client.outputStart(null).create(Map.of(
    "response_code", 1L,  // Long
    "response_message", "example_response_message"  // String
), null);
```


### OutputStatus

Create an instance: `SdkEntity outputStatus = client.outputStatus(null);`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `Long` |  |
| `response_code` | `Long` |  |
| `response_message` | `String` |  |
| `status` | `String` |  |

#### Example: Load

```java
Object outputStatus = client.outputStatus(null).load(Map.of("id", "output_status_id"), null);
```


### OutputUpdateProduct

Create an instance: `SdkEntity outputUpdateProduct = client.outputUpdateProduct(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allow_multiple_order` | `Boolean` |  |
| `app_form_name` | `String` |  |
| `contract_needed` | `Boolean` |  |
| `credentials_needed` | `Boolean` |  |
| `description_key` | `String` |  |
| `name_key` | `String` |  |
| `prescreening_allowed` | `Boolean` |  |
| `product_name` | `String` |  |
| `product_status` | `String` |  |
| `product_uuid` | `String` |  |
| `response_code` | `Long` |  |
| `response_message` | `String` |  |
| `vendor_name` | `String` |  |

#### Example: Create

```java
Object outputUpdateProduct = client.outputUpdateProduct(null).create(Map.of(
    "product_uuid", "example_product_uuid",  // String
    "response_code", 1L,  // Long
    "response_message", "example_response_message"  // String
), null);
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

### Data as maps

The Java SDK uses a loose object model — `Map<String, Object>` throughout —
rather than a bespoke typed class per endpoint. This mirrors the dynamic
nature of the API and keeps the SDK flexible: no regeneration is needed when
the API schema changes.

Use `Helpers.toMapAny(value)` to safely coerce a value to a
`Map<String, Object>`. A `BluefinTecsMerchantPortalTypes.java` module of reference
`record` types is also generated for editor documentation.

### Project structure

```
java/
├── pom.xml                     -- Maven project (compiles core/, utility/, feature/, entity/)
├── core/                       -- Main SDK client, config, entity base, error type
├── entity/                     -- Entity implementations
├── feature/                    -- Built-in features (Base, Test, Log, ...)
├── utility/                    -- Utility functions and the vendored struct library
└── test/                       -- JUnit test suites
```

The main client class (`BluefinTecsMerchantPortalSDK`, package `voxgig.bluefintecsmerchantportalsdk.core`)
exposes the entity accessors. Reference entity or utility types directly only
when needed.

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
