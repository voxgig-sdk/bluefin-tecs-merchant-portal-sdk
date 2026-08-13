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
| `productOrderUUID` | `string` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.MerchantPortalPamContractController().create({
  language: 'example_language',
  productOrderUUID: 'example_productOrderUUID',
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
| `appFormFieldDescUUID` | `string` | Yes |  |
| `packageOrderUUID` | `string` | No |  |
| `productOrderUUID` | `string` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.MerchantPortalPamDocumentController().create({
  appFormFieldDescUUID: 'example_appFormFieldDescUUID',
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
| `appFormFieldsDescUUID` | `string` | Yes |  |
| `filter` | `Record<string, any>` | No |  |
| `language` | `string` | Yes |  |
| `packageOrder` | `Record<string, any>` | No |  |
| `packageOrderUUID` | `string` | Yes |  |
| `packageUUID` | `string` | No |  |
| `productOrderUUID` | `string` | No |  |
| `productOrders` | `any[]` | No |  |
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

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.MerchantPortalPamFormController().create({
  appFormFieldsDescUUID: 'example_appFormFieldsDescUUID',
  language: 'example_language',
  packageOrderUUID: 'example_packageOrderUUID',
  reasonOfReopening: 'example_reasonOfReopening',
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
| `clientSecret` | `string` | No |  |
| `mandatorName` | `string` | Yes |  |
| `notificationEmail` | `string` | No |  |
| `packageUUID` | `string` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.MerchantPortalPamMandatorController().create({
  mandatorName: 'example_mandatorName',
  packageUUID: 'example_packageUUID',
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
| `businessRegistrationNumber` | `string` | Yes |  |
| `city` | `string` | No |  |
| `companyName` | `string` | Yes |  |
| `corporateUUID` | `string` | Yes |  |
| `country` | `string` | No |  |
| `currency` | `string` | Yes |  |
| `email` | `string` | Yes |  |
| `language` | `string` | Yes |  |
| `login` | `string` | Yes |  |
| `mandator` | `string` | Yes |  |
| `merchantContractNumber` | `string` | Yes |  |
| `merchantName` | `string` | No |  |
| `merchant_category_code` | `string` | No |  |
| `packageUUID` | `string` | No |  |
| `packageorderuuid` | `string` | Yes |  |
| `phoneNumber` | `string` | Yes |  |
| `postalCode` | `string` | No |  |
| `productid_acquirer` | `string` | Yes |  |
| `region` | `string` | No |  |
| `registrationNumber` | `string` | No |  |
| `signature` | `string` | No |  |
| `street` | `string` | No |  |
| `terminalIds` | `any[]` | No |  |
| `terminalid_acquirer` | `string` | No |  |
| `vu_nummer` | `string` | Yes |  |

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

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.MerchantPortalPamMerchantController().create({
  businessRegistrationNumber: 'example_businessRegistrationNumber',
  companyName: 'example_companyName',
  corporateUUID: 'example_corporateUUID',
  currency: 'example_currency',
  email: 'example_email',
  language: 'example_language',
  login: 'example_login',
  mandator: 'example_mandator',
  merchantContractNumber: 'example_merchantContractNumber',
  packageorderuuid: 'example_packageorderuuid',
  phoneNumber: 'example_phoneNumber',
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
| `consumerUUID` | `string` | No |  |
| `corporateUUID` | `string` | No |  |
| `country` | `string` | No |  |
| `descriptionKey` | `string` | No |  |
| `filter` | `Record<string, any>` | No |  |
| `language` | `string` | Yes |  |
| `nameKey` | `string` | No |  |
| `packageStatus` | `string` | No |  |
| `packageUUID` | `string` | Yes |  |
| `pagination` | `Record<string, any>` | No |  |
| `sorting` | `Record<string, any>` | No |  |

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

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.MerchantPortalPamPackageController().create({
  language: 'example_language',
  packageUUID: 'example_packageUUID',
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
| `consumerUUID` | `string` | No |  |
| `filter` | `Record<string, any>` | No |  |
| `language` | `string` | No |  |
| `merchantID` | `string` | No |  |
| `packageOrderUUID` | `string` | Yes |  |
| `pagination` | `Record<string, any>` | No |  |
| `productOrderUUID` | `string` | Yes |  |
| `productUUID` | `string` | Yes |  |
| `reason_decline` | `string` | Yes |  |
| `sorting` | `Record<string, any>` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.MerchantPortalPamProductController().create({
  packageOrderUUID: 'example_packageOrderUUID',
  productOrderUUID: 'example_productOrderUUID',
  productUUID: 'example_productUUID',
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
| `packageUUID` | `string` | Yes |  |
| `productUUIDs` | `any[]` | Yes |  |
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.OutputAddProduct().create({
  packageUUID: 'example_packageUUID',
  productUUIDs: [],
  responseCode: 1,
  responseMessage: 'example_responseMessage',
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
| `acquirerId` | `string` | No |  |
| `allowMultipleOrders` | `boolean` | Yes |  |
| `appFormTemplateName` | `string` | Yes |  |
| `contractNeeded` | `boolean` | Yes |  |
| `credentialsNeeded` | `boolean` | No |  |
| `descriptionKey` | `string` | Yes |  |
| `nameKey` | `string` | Yes |  |
| `prescreeningAllowed` | `boolean` | Yes |  |
| `productName` | `string` | Yes |  |
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |
| `terminalTemplateName` | `string` | Yes |  |
| `vendorName` | `string` | Yes |  |
| `xmlTemplateFile` | `string` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.OutputCreateProduct().create({
  allowMultipleOrders: true,
  appFormTemplateName: 'example_appFormTemplateName',
  contractNeeded: true,
  descriptionKey: 'example_descriptionKey',
  nameKey: 'example_nameKey',
  prescreeningAllowed: true,
  productName: 'example_productName',
  responseCode: 1,
  responseMessage: 'example_responseMessage',
  terminalTemplateName: 'example_terminalTemplateName',
  vendorName: 'example_vendorName',
  xmlTemplateFile: 'example_xmlTemplateFile',
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
| `batch` | `Record<string, any>` | No |  |
| `lines` | `Record<string, any>` | No |  |
| `progress` | `Record<string, any>` | No |  |

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
| `items` | `any[]` | No |  |
| `pagination` | `Record<string, any>` | Yes |  |
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |
| `sorting` | `Record<string, any>` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `items` | - |
| `pagination` | Yes |
| `responseCode` | - |
| `responseMessage` | - |
| `sorting` | - |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.OutputList().create({
  pagination: {},
  responseCode: 1,
  responseMessage: 'example_responseMessage',
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
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |

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
| `productOrderUUIDs` | `any[]` | Yes |  |
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |
| `targetPackageOrderUUID` | `string` | Yes |  |
| `targetProductOrderUUID` | `string` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.OutputMoveTid().create({
  productOrderUUIDs: [],
  responseCode: 1,
  responseMessage: 'example_responseMessage',
  targetPackageOrderUUID: 'example_targetPackageOrderUUID',
  targetProductOrderUUID: 'example_targetProductOrderUUID',
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
| `packageUUID` | `string` | Yes |  |
| `productUUIDs` | `any[]` | Yes |  |
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.OutputRemoveProduct().create({
  packageUUID: 'example_packageUUID',
  productUUIDs: [],
  responseCode: 1,
  responseMessage: 'example_responseMessage',
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
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.OutputStart().create({
  responseCode: 1,
  responseMessage: 'example_responseMessage',
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
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |
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
| `allowMultipleOrders` | `boolean` | No |  |
| `appFormName` | `string` | No |  |
| `contractNeeded` | `boolean` | No |  |
| `credentialsNeeded` | `boolean` | No |  |
| `descriptionKey` | `string` | No |  |
| `nameKey` | `string` | No |  |
| `prescreeningAllowed` | `boolean` | No |  |
| `productName` | `string` | No |  |
| `productStatus` | `string` | No |  |
| `productUUID` | `string` | Yes |  |
| `responseCode` | `number` | Yes |  |
| `responseMessage` | `string` | Yes |  |
| `vendorName` | `string` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.OutputUpdateProduct().create({
  productUUID: 'example_productUUID',
  responseCode: 1,
  responseMessage: 'example_responseMessage',
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

