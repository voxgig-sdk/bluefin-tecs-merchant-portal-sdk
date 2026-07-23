# BluefinTecsMerchantPortal TypeScript SDK Reference

Complete API reference for the BluefinTecsMerchantPortal TypeScript SDK.


## BluefinTecsMerchantPortalSDK

### Constructor

```ts
new BluefinTecsMerchantPortalSDK(options?: object)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `object` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `object` | Custom headers for all requests. |
| `options.feature` | `object` | Feature configuration. |
| `options.system` | `object` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinTecsMerchantPortalSDK.test(testopts?, sdkopts?)`

Create a test client with mock features active.

```ts
const client = BluefinTecsMerchantPortalSDK.test()
```

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `testopts` | `object` | Test feature options. |
| `sdkopts` | `object` | Additional SDK options merged with test defaults. |

**Returns:** `BluefinTecsMerchantPortalSDK` instance in test mode.


### Instance Methods

#### `MerchantPortalApiController(data?: object)`

Create a new `MerchantPortalApiController` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `MerchantPortalApiControllerEntity` instance.

#### `MerchantPortalCommonController(data?: object)`

Create a new `MerchantPortalCommonController` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `MerchantPortalCommonControllerEntity` instance.

#### `MerchantPortalPamContractController(data?: object)`

Create a new `MerchantPortalPamContractController` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `MerchantPortalPamContractControllerEntity` instance.

#### `MerchantPortalPamDocumentController(data?: object)`

Create a new `MerchantPortalPamDocumentController` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `MerchantPortalPamDocumentControllerEntity` instance.

#### `MerchantPortalPamFormController(data?: object)`

Create a new `MerchantPortalPamFormController` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `MerchantPortalPamFormControllerEntity` instance.

#### `MerchantPortalPamMandatorController(data?: object)`

Create a new `MerchantPortalPamMandatorController` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `MerchantPortalPamMandatorControllerEntity` instance.

#### `MerchantPortalPamMerchantController(data?: object)`

Create a new `MerchantPortalPamMerchantController` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `MerchantPortalPamMerchantControllerEntity` instance.

#### `MerchantPortalPamPackageController(data?: object)`

Create a new `MerchantPortalPamPackageController` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `MerchantPortalPamPackageControllerEntity` instance.

#### `MerchantPortalPamProductController(data?: object)`

Create a new `MerchantPortalPamProductController` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `MerchantPortalPamProductControllerEntity` instance.

#### `OutputAddProduct(data?: object)`

Create a new `OutputAddProduct` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `OutputAddProductEntity` instance.

#### `OutputCreateProduct(data?: object)`

Create a new `OutputCreateProduct` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `OutputCreateProductEntity` instance.

#### `OutputDetail(data?: object)`

Create a new `OutputDetail` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `OutputDetailEntity` instance.

#### `OutputList(data?: object)`

Create a new `OutputList` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `OutputListEntity` instance.

#### `OutputMessage(data?: object)`

Create a new `OutputMessage` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `OutputMessageEntity` instance.

#### `OutputMoveTid(data?: object)`

Create a new `OutputMoveTid` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `OutputMoveTidEntity` instance.

#### `OutputRemoveProduct(data?: object)`

Create a new `OutputRemoveProduct` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `OutputRemoveProductEntity` instance.

#### `OutputStart(data?: object)`

Create a new `OutputStart` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `OutputStartEntity` instance.

#### `OutputStatus(data?: object)`

Create a new `OutputStatus` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `OutputStatusEntity` instance.

#### `OutputUpdateProduct(data?: object)`

Create a new `OutputUpdateProduct` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `OutputUpdateProductEntity` instance.

#### `options()`

Return a deep copy of the current SDK options.

**Returns:** `object`

#### `utility()`

Return a copy of the SDK utility object.

**Returns:** `object`

#### `direct(fetchargs?: object)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `GET`). |
| `fetchargs.params` | `object` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `object` | Query string parameters. |
| `fetchargs.headers` | `object` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (objects are JSON-serialized). |
| `fetchargs.ctrl` | `object` | Control options (e.g. `{ explain: true }`). |

**Returns:** `Promise<{ ok, status, headers, data } | Error>`

#### `prepare(fetchargs?: object)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `Promise<{ url, method, headers, body } | Error>`

#### `tester(testopts?, sdkopts?)`

Alias for `BluefinTecsMerchantPortalSDK.test()`.

**Returns:** `BluefinTecsMerchantPortalSDK` instance in test mode.


---

## MerchantPortalApiControllerEntity

```ts
const merchant_portal_api_controller = client.MerchantPortalApiController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `number` | No |  |
| `additional_data` | `Record<string, any>` | No |  |
| `business_reg_number` | `string` | Yes |  |
| `city` | `string` | Yes |  |
| `corporateuuid` | `string` | No |  |
| `country` | `string` | Yes |  |
| `currency` | `string` | Yes |  |
| `merchant_category_code` | `number` | Yes |  |
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
| `sorting_code` | `number` | No |  |
| `state` | `string` | No |  |
| `street` | `string` | Yes |  |
| `terminal_country_code` | `string` | Yes |  |
| `terminal_language_code` | `string` | Yes |  |
| `terminal_location` | `string` | Yes |  |
| `terminal_serial_number` | `string` | Yes |  |
| `terminalid` | `number` | Yes |  |
| `terminalid_acquirer` | `string` | No |  |
| `user_email` | `string` | No |  |
| `user_phone_number` | `string` | No |  |
| `username` | `string` | No |  |
| `vu_nummer` | `string` | Yes |  |
| `web_shop_url` | `string` | No |  |
| `zipcode` | `string` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.MerchantPortalApiController().create({
  business_reg_number: 'example_business_reg_number',
  city: 'example_city',
  country: 'example_country',
  currency: 'example_currency',
  merchant_category_code: 1,
  merchant_name: 'example_merchant_name',
  packageid: 'example_packageid',
  packageorderuuid: 'example_packageorderuuid',
  reason_deactivation: 'example_reason_deactivation',
  reason_reactivation: 'example_reason_reactivation',
  street: 'example_street',
  terminal_country_code: 'example_terminal_country_code',
  terminal_language_code: 'example_terminal_language_code',
  terminal_location: 'example_terminal_location',
  terminal_serial_number: 'example_terminal_serial_number',
  terminalid: 1,
  vu_nummer: 'example_vu_nummer',
  zipcode: 'example_zipcode',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `MerchantPortalApiControllerEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## MerchantPortalCommonControllerEntity

```ts
const merchant_portal_common_controller = client.MerchantPortalCommonController()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.MerchantPortalCommonController().load()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `MerchantPortalCommonControllerEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## MerchantPortalPamContractControllerEntity

```ts
const merchant_portal_pam_contract_controller = client.MerchantPortalPamContractController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `string` | Yes |  |
| `product_order_uuid` | `string` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.MerchantPortalPamContractController().create({
  language: 'example_language',
  product_order_uuid: 'example_product_order_uuid',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `MerchantPortalPamContractControllerEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## MerchantPortalPamDocumentControllerEntity

```ts
const merchant_portal_pam_document_controller = client.MerchantPortalPamDocumentController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_field_desc_uuid` | `string` | Yes |  |
| `package_order_uuid` | `string` | No |  |
| `product_order_uuid` | `string` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.MerchantPortalPamDocumentController().create({
  app_form_field_desc_uuid: 'example_app_form_field_desc_uuid',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `MerchantPortalPamDocumentControllerEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## MerchantPortalPamFormControllerEntity

```ts
const merchant_portal_pam_form_controller = client.MerchantPortalPamFormController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_fields_desc_uuid` | `string` | Yes |  |
| `filter` | `Record<string, any>` | No |  |
| `language` | `string` | Yes |  |
| `package_order` | `Record<string, any>` | No |  |
| `package_order_uuid` | `string` | Yes |  |
| `package_uuid` | `string` | No |  |
| `product_order` | `any[]` | No |  |
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

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.MerchantPortalPamFormController().create({
  app_form_fields_desc_uuid: 'example_app_form_fields_desc_uuid',
  language: 'example_language',
  package_order_uuid: 'example_package_order_uuid',
  reason_of_reopening: 'example_reason_of_reopening',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `MerchantPortalPamFormControllerEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## MerchantPortalPamMandatorControllerEntity

```ts
const merchant_portal_pam_mandator_controller = client.MerchantPortalPamMandatorController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client_secret` | `string` | No |  |
| `mandator_name` | `string` | Yes |  |
| `notification_email` | `string` | No |  |
| `package_uuid` | `string` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.MerchantPortalPamMandatorController().create({
  mandator_name: 'example_mandator_name',
  package_uuid: 'example_package_uuid',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `MerchantPortalPamMandatorControllerEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## MerchantPortalPamMerchantControllerEntity

```ts
const merchant_portal_pam_merchant_controller = client.MerchantPortalPamMerchantController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `Record<string, any>` | No |  |
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
| `terminal_id` | `any[]` | No |  |
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

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.MerchantPortalPamMerchantController().create({
  business_registration_number: 'example_business_registration_number',
  company_name: 'example_company_name',
  corporate_uuid: 'example_corporate_uuid',
  currency: 'example_currency',
  email: 'example_email',
  language: 'example_language',
  login: 'example_login',
  mandator: 'example_mandator',
  merchant_contract_number: 'example_merchant_contract_number',
  packageorderuuid: 'example_packageorderuuid',
  phone_number: 'example_phone_number',
  productid_acquirer: 'example_productid_acquirer',
  vu_nummer: 'example_vu_nummer',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `MerchantPortalPamMerchantControllerEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## MerchantPortalPamPackageControllerEntity

```ts
const merchant_portal_pam_package_controller = client.MerchantPortalPamPackageController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `string` | No |  |
| `corporate_uuid` | `string` | No |  |
| `country` | `string` | No |  |
| `description_key` | `string` | No |  |
| `filter` | `Record<string, any>` | No |  |
| `language` | `string` | Yes |  |
| `name_key` | `string` | No |  |
| `package_status` | `string` | No |  |
| `package_uuid` | `string` | Yes |  |
| `pagination` | `Record<string, any>` | No |  |
| `sorting` | `Record<string, any>` | No |  |

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

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.MerchantPortalPamPackageController().create({
  language: 'example_language',
  package_uuid: 'example_package_uuid',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `MerchantPortalPamPackageControllerEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## MerchantPortalPamProductControllerEntity

```ts
const merchant_portal_pam_product_controller = client.MerchantPortalPamProductController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `string` | No |  |
| `filter` | `Record<string, any>` | No |  |
| `language` | `string` | No |  |
| `merchant_id` | `string` | No |  |
| `package_order_uuid` | `string` | Yes |  |
| `pagination` | `Record<string, any>` | No |  |
| `product_order_uuid` | `string` | Yes |  |
| `product_uuid` | `string` | Yes |  |
| `reason_decline` | `string` | Yes |  |
| `sorting` | `Record<string, any>` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.MerchantPortalPamProductController().create({
  package_order_uuid: 'example_package_order_uuid',
  product_order_uuid: 'example_product_order_uuid',
  product_uuid: 'example_product_uuid',
  reason_decline: 'example_reason_decline',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `MerchantPortalPamProductControllerEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## OutputAddProductEntity

```ts
const output_add_product = client.OutputAddProduct()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `string` | Yes |  |
| `product_uui_d` | `any[]` | Yes |  |
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.OutputAddProduct().create({
  package_uuid: 'example_package_uuid',
  product_uui_d: [],
  response_code: 1,
  response_message: 'example_response_message',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `OutputAddProductEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## OutputCreateProductEntity

```ts
const output_create_product = client.OutputCreateProduct()
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
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |
| `terminal_template_name` | `string` | Yes |  |
| `vendor_name` | `string` | Yes |  |
| `xml_template_file` | `string` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.OutputCreateProduct().create({
  allow_multiple_order: true,
  app_form_template_name: 'example_app_form_template_name',
  contract_needed: true,
  description_key: 'example_description_key',
  name_key: 'example_name_key',
  prescreening_allowed: true,
  product_name: 'example_product_name',
  response_code: 1,
  response_message: 'example_response_message',
  terminal_template_name: 'example_terminal_template_name',
  vendor_name: 'example_vendor_name',
  xml_template_file: 'example_xml_template_file',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `OutputCreateProductEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## OutputDetailEntity

```ts
const output_detail = client.OutputDetail()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `detail` | `Record<string, any>` | No |  |
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.OutputDetail().load({ id: 'output_detail_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `OutputDetailEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## OutputListEntity

```ts
const output_list = client.OutputList()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `item` | `any[]` | No |  |
| `pagination` | `Record<string, any>` | Yes |  |
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |
| `sorting` | `Record<string, any>` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.OutputList().create({
  pagination: {},
  response_code: 1,
  response_message: 'example_response_message',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `OutputListEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## OutputMessageEntity

```ts
const output_message = client.OutputMessage()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.OutputMessage().load({ id: 'output_message_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `OutputMessageEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## OutputMoveTidEntity

```ts
const output_move_tid = client.OutputMoveTid()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `product_order_uui_d` | `any[]` | Yes |  |
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |
| `target_package_order_uuid` | `string` | Yes |  |
| `target_product_order_uuid` | `string` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.OutputMoveTid().create({
  product_order_uui_d: [],
  response_code: 1,
  response_message: 'example_response_message',
  target_package_order_uuid: 'example_target_package_order_uuid',
  target_product_order_uuid: 'example_target_product_order_uuid',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `OutputMoveTidEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## OutputRemoveProductEntity

```ts
const output_remove_product = client.OutputRemoveProduct()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `string` | Yes |  |
| `product_uui_d` | `any[]` | Yes |  |
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.OutputRemoveProduct().create({
  package_uuid: 'example_package_uuid',
  product_uui_d: [],
  response_code: 1,
  response_message: 'example_response_message',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `OutputRemoveProductEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## OutputStartEntity

```ts
const output_start = client.OutputStart()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No |  |
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.OutputStart().create({
  response_code: 1,
  response_message: 'example_response_message',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `OutputStartEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## OutputStatusEntity

```ts
const output_status = client.OutputStatus()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `number` | No |  |
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |
| `status` | `string` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.OutputStatus().load({ id: 'output_status_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `OutputStatusEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## OutputUpdateProductEntity

```ts
const output_update_product = client.OutputUpdateProduct()
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
| `response_code` | `number` | Yes |  |
| `response_message` | `string` | Yes |  |
| `vendor_name` | `string` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.OutputUpdateProduct().create({
  product_uuid: 'example_product_uuid',
  response_code: 1,
  response_message: 'example_response_message',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `OutputUpdateProductEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinTecsMerchantPortalSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ts
const client = new BluefinTecsMerchantPortalSDK({
  feature: {
    test: { active: true },
  }
})
```

