# BluefinTecsMerchantPortal JavaScript SDK



The JavaScript SDK for the BluefinTecsMerchantPortal API — an entity-oriented client with full async/await support.

The API is exposed as capitalised, semantic **Entities** — e.g.
`client.MerchantPortalApiController()` — each with a small set of operations (`load`, `create`)
instead of raw URL paths and query parameters. This keeps the surface
predictable and low-friction for both humans and AI agents.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
```js
npm install bluefin-tecs-merchant-portal
```
## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.


### Create a Client

```js
const { BluefinTecsMerchantPortalSDK } = require('@voxgig-sdk/bluefin-tecs-merchant-portal-js')

const client = new BluefinTecsMerchantPortalSDK()
```

### Create a MerchantPortalApiController

```js
const created = await client.MerchantPortalApiController().create({
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
console.log(created)
```

### Direct API Access

Use `client.direct()` to call any API endpoint directly:

```js
const result = await client.direct({
  path: '/custom/endpoint/{id}',
  method: 'GET',
  params: { id: 'abc123' },
})

if (result.ok) {
  console.log(result.data)
}
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

```js
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})

if (result instanceof Error) {
  throw result
}
if (result.ok) {
  console.log(result.status)  // 200
  console.log(result.data)    // response body
}
```

### Prepare a request without sending it

```js
const fetchdef = await client.prepare({
  path: '/api/resource/{id}',
  method: 'DELETE',
  params: { id: 'example' },
})

// Inspect before sending
console.log(fetchdef.url)
console.log(fetchdef.method)
console.log(fetchdef.headers)
```

### Use test mode

Create a mock client for unit testing — no server required:

```js
const client = BluefinTecsMerchantPortalSDK.test()

const outputdetail = await client.OutputDetail().load({ id: 'test01' })
// outputdetail is the entity, populated with mock response data
// — call outputdetail.data() for the record itself
console.log(outputdetail)
```

You can also use the instance method:

```js
const client = new BluefinTecsMerchantPortalSDK()
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```js
const entity = client.OutputDetail()

// First call runs the operation and stores its result
await entity.load({ id: 'example' })

// Subsequent calls reuse the stored state
const data = entity.data()
console.log(data)
```

### Add custom middleware

Pass features via the `extend` option:

```js
const logger = {
  hooks: {
    PreRequest: (ctx) => {
      console.log('Requesting:', ctx.spec.method, ctx.spec.path)
    },
    PreResponse: (ctx) => {
      console.log('Status:', ctx.out.request?.status)
    },
  },
}

const client = new BluefinTecsMerchantPortalSDK({
  extend: [logger],
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run:

```bash
cd js && npm test
```


## Reference

### BluefinTecsMerchantPortalSDK

#### Constructor

```js
new BluefinTecsMerchantPortalSDK(options?)
```

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `object` | Feature activation flags (e.g. `{ test: { active: true } }`). |
| `extend` | `Feature[]` | Additional feature instances to load. |

#### Methods

| Method | Returns | Description |
| --- | --- | --- |
| `options()` | `object` | Deep copy of current SDK options. |
| `utility()` | `Utility` | Deep copy of the SDK utility object. |
| `prepare(fetchargs?)` | `Promise<FetchDef>` | Build an HTTP request definition without sending it. |
| `direct(fetchargs?)` | `Promise<DirectResult>` | Build and send an HTTP request. |
| `MerchantPortalApiController(data?)` | `MerchantPortalApiControllerEntity` | Create a MerchantPortalApiController entity instance. |
| `MerchantPortalCommonController(data?)` | `MerchantPortalCommonControllerEntity` | Create a MerchantPortalCommonController entity instance. |
| `MerchantPortalPamContractController(data?)` | `MerchantPortalPamContractControllerEntity` | Create a MerchantPortalPamContractController entity instance. |
| `MerchantPortalPamDocumentController(data?)` | `MerchantPortalPamDocumentControllerEntity` | Create a MerchantPortalPamDocumentController entity instance. |
| `MerchantPortalPamFormController(data?)` | `MerchantPortalPamFormControllerEntity` | Create a MerchantPortalPamFormController entity instance. |
| `MerchantPortalPamMandatorController(data?)` | `MerchantPortalPamMandatorControllerEntity` | Create a MerchantPortalPamMandatorController entity instance. |
| `MerchantPortalPamMerchantController(data?)` | `MerchantPortalPamMerchantControllerEntity` | Create a MerchantPortalPamMerchantController entity instance. |
| `MerchantPortalPamPackageController(data?)` | `MerchantPortalPamPackageControllerEntity` | Create a MerchantPortalPamPackageController entity instance. |
| `MerchantPortalPamProductController(data?)` | `MerchantPortalPamProductControllerEntity` | Create a MerchantPortalPamProductController entity instance. |
| `OutputAddProduct(data?)` | `OutputAddProductEntity` | Create an OutputAddProduct entity instance. |
| `OutputCreateProduct(data?)` | `OutputCreateProductEntity` | Create an OutputCreateProduct entity instance. |
| `OutputDetail(data?)` | `OutputDetailEntity` | Create an OutputDetail entity instance. |
| `OutputList(data?)` | `OutputListEntity` | Create an OutputList entity instance. |
| `OutputMessage(data?)` | `OutputMessageEntity` | Create an OutputMessage entity instance. |
| `OutputMoveTid(data?)` | `OutputMoveTidEntity` | Create an OutputMoveTid entity instance. |
| `OutputRemoveProduct(data?)` | `OutputRemoveProductEntity` | Create an OutputRemoveProduct entity instance. |
| `OutputStart(data?)` | `OutputStartEntity` | Create an OutputStart entity instance. |
| `OutputStatus(data?)` | `OutputStatusEntity` | Create an OutputStatus entity instance. |
| `OutputUpdateProduct(data?)` | `OutputUpdateProductEntity` | Create an OutputUpdateProduct entity instance. |
| `tester(testopts?, sdkopts?)` | `BluefinTecsMerchantPortalSDK` | Create a test-mode client instance. |

#### Static methods

| Method | Returns | Description |
| --- | --- | --- |
| `BluefinTecsMerchantPortalSDK.test(testopts?, sdkopts?)` | `BluefinTecsMerchantPortalSDK` | Create a test-mode client. |

### Entity interface

All entities share the same interface.

#### Methods

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `load(reqmatch?, ctrl?): Promise<Entity>` | Load a single entity by match criteria. |
| `create` | `create(reqdata?, ctrl?): Promise<Entity>` | Create a new entity. |
| `data` | `data(data?: Partial<Entity>): Entity` | Get or set entity data. |
| `match` | `match(match?: Partial<Entity>): Partial<Entity>` | Get or set entity match criteria. |
| `make` | `make(): Entity` | Create a new instance with the same options. |
| `client` | `client(): BluefinTecsMerchantPortalSDK` | Return the parent SDK client. |
| `entopts` | `entopts(): object` | Return a copy of the entity options. |

#### Return values

Entity operations resolve to the entity data directly — there is no
result envelope:

- `load` and `create` resolve to a single entity object.

On a failed request these methods **throw**, so wrap calls in
`try`/`catch` to handle errors. Only `direct()` returns the result
envelope described below.

### DirectResult shape

The `direct()` method returns:

```js
{
  ok: true,
  status: 200,
  headers: {},
  data: {}
}
```

On error, `ok` is `false` and an `err` property contains the error.

### FetchDef shape

The `prepare()` method returns:

```js
{
  url: 'string',
  method: 'string',
  headers: {},
  body: undefined
}
```

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
| `productOrderUUID` |  |

Operations: create.

API path: `/merchantportalws/generateContract`

#### MerchantPortalPamDocumentController

| Field | Description |
| --- | --- |
| `appFormFieldDescUUID` |  |
| `packageOrderUUID` | UUID of the package order. |
| `productOrderUUID` | UUID of the product order. |

Operations: create.

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

Operations: create.

API path: `/merchantportalws/applicationForm`

#### MerchantPortalPamMandatorController

| Field | Description |
| --- | --- |
| `clientSecret` |  |
| `mandatorName` |  |
| `notificationEmail` |  |
| `packageUUID` |  |

Operations: create.

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

Operations: create.

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

Operations: create.

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

Operations: create.

API path: `/merchantportalws/approveProduct`

#### OutputAddProduct

| Field | Description |
| --- | --- |
| `packageUUID` | Unique identifier for the package. |
| `productUUIDs` | The list of unique identifiers of the products. |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: create.

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

Operations: create.

API path: `/merchantportalws/createNewProduct`

#### OutputDetail

| Field | Description |
| --- | --- |
| `batch` |  |
| `lines` |  |
| `progress` |  |

Operations: load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/details/{id}`

#### OutputList

| Field | Description |
| --- | --- |
| `items` |  |
| `pagination` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `sorting` |  |

Operations: create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/list`

#### OutputMessage

| Field | Description |
| --- | --- |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: load.

API path: `/merchantportalws/batch/registerAdditionalTerminal/restart/{id}`

#### OutputMoveTid

| Field | Description |
| --- | --- |
| `productOrderUUIDs` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `targetPackageOrderUUID` |  |
| `targetProductOrderUUID` |  |

Operations: create.

API path: `/merchantportalws/moveTid`

#### OutputRemoveProduct

| Field | Description |
| --- | --- |
| `packageUUID` | Unique identifier for the package. |
| `productUUIDs` | List of product unique identifiers. |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: create.

API path: `/merchantportalws/removeProductsFromPackage`

#### OutputStart

| Field | Description |
| --- | --- |
| `id` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |

Operations: create.

API path: `/merchantportalws/batch/registerAdditionalTerminal/start`

#### OutputStatus

| Field | Description |
| --- | --- |
| `percentage` |  |
| `responseCode` | Response code. |
| `responseMessage` | Response message. |
| `status` |  |

Operations: load.

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

Operations: create.

API path: `/merchantportalws/updateProduct`



## Entities


### MerchantPortalApiController

Create an instance: `const merchant_portal_api_controller = client.MerchantPortalApiController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `number` | Account number provided by the acquirer. |
| `additional_data` | `Object` | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `string` | Merchant business registration number as stated in the company registry. |
| `city` | `string` | Merchant's address: city. |
| `corporateuuid` | `string` | Unique identifier for the corporate entity (UUID format). |
| `country` | `string` | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `string` | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `number` | Merchant category code as defined by the payment network. |
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
| `sorting_code` | `number` | Sorting code provided by the acquirer. |
| `state` | `string` | Merchant's address: state. |
| `street` | `string` | Merchant's address: street and house number. |
| `terminal_country_code` | `string` | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `string` | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `string` | Physical or logical location of the terminal. |
| `terminal_serial_number` | `string` | Terminal serial number. |
| `terminalid` | `number` | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `string` | Terminal ID as set by the acquirer (optional). |
| `user_email` | `string` | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `string` | Phone number of the user acting on behalf of the merchant. |
| `username` | `string` | Merchant username for MPOS. |
| `vu_nummer` | `string` | Merchant contract number with the acquirer. |
| `web_shop_url` | `string` | URL of the merchant's web shop. |
| `zipcode` | `string` | Merchant's address: postal code. |

#### Example: Create

```ts
const merchant_portal_api_controller = await client.MerchantPortalApiController().create({
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


### MerchantPortalCommonController

Create an instance: `const merchant_portal_common_controller = client.MerchantPortalCommonController()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const merchant_portal_common_controller = await client.MerchantPortalCommonController().load()
```


### MerchantPortalPamContractController

Create an instance: `const merchant_portal_pam_contract_controller = client.MerchantPortalPamContractController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `string` |  |
| `productOrderUUID` | `string` |  |

#### Example: Create

```ts
const merchant_portal_pam_contract_controller = await client.MerchantPortalPamContractController().create({
  language: 'example_language',
  productOrderUUID: 'example_productOrderUUID',
})
```


### MerchantPortalPamDocumentController

Create an instance: `const merchant_portal_pam_document_controller = client.MerchantPortalPamDocumentController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldDescUUID` | `string` |  |
| `packageOrderUUID` | `string` | UUID of the package order. |
| `productOrderUUID` | `string` | UUID of the product order. |

#### Example: Create

```ts
const merchant_portal_pam_document_controller = await client.MerchantPortalPamDocumentController().create({
  appFormFieldDescUUID: 'example_appFormFieldDescUUID',
})
```


### MerchantPortalPamFormController

Create an instance: `const merchant_portal_pam_form_controller = client.MerchantPortalPamFormController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldsDescUUID` | `string` |  |
| `filter` | `Object` |  |
| `language` | `string` |  |
| `packageOrder` | `Object` |  |
| `packageOrderUUID` | `string` | UUID of the package order. |
| `packageUUID` | `string` |  |
| `productOrderUUID` | `string` | UUID of the product order. |
| `productOrders` | `Array` |  |
| `reasonOfReopening` | `string` |  |

#### Example: Create

```ts
const merchant_portal_pam_form_controller = await client.MerchantPortalPamFormController().create({
  appFormFieldsDescUUID: 'example_appFormFieldsDescUUID',
  language: 'example_language',
  packageOrderUUID: 'example_packageOrderUUID',
  reasonOfReopening: 'example_reasonOfReopening',
})
```


### MerchantPortalPamMandatorController

Create an instance: `const merchant_portal_pam_mandator_controller = client.MerchantPortalPamMandatorController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `clientSecret` | `string` |  |
| `mandatorName` | `string` |  |
| `notificationEmail` | `string` |  |
| `packageUUID` | `string` |  |

#### Example: Create

```ts
const merchant_portal_pam_mandator_controller = await client.MerchantPortalPamMandatorController().create({
  mandatorName: 'example_mandatorName',
  packageUUID: 'example_packageUUID',
})
```


### MerchantPortalPamMerchantController

Create an instance: `const merchant_portal_pam_merchant_controller = client.MerchantPortalPamMerchantController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `Object` | Optional additional merchant-specific data related to enabling acquiring. |
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
| `terminalIds` | `Array` | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `string` | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `string` | Merchant contract number with the acquirer. |

#### Example: Create

```ts
const merchant_portal_pam_merchant_controller = await client.MerchantPortalPamMerchantController().create({
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


### MerchantPortalPamPackageController

Create an instance: `const merchant_portal_pam_package_controller = client.MerchantPortalPamPackageController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `string` |  |
| `corporateUUID` | `string` |  |
| `country` | `string` | Country associated with the package. |
| `descriptionKey` | `string` | Key for the description of the package. |
| `filter` | `Object` |  |
| `language` | `string` |  |
| `nameKey` | `string` | Key for the name of the package. |
| `packageStatus` | `string` | Status of the package. |
| `packageUUID` | `string` | Unique identifier for the package. |
| `pagination` | `Object` |  |
| `sorting` | `Object` |  |

#### Example: Create

```ts
const merchant_portal_pam_package_controller = await client.MerchantPortalPamPackageController().create({
  language: 'example_language',
  packageUUID: 'example_packageUUID',
})
```


### MerchantPortalPamProductController

Create an instance: `const merchant_portal_pam_product_controller = client.MerchantPortalPamProductController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `string` |  |
| `filter` | `Object` |  |
| `language` | `string` |  |
| `merchantID` | `string` |  |
| `packageOrderUUID` | `string` |  |
| `pagination` | `Object` |  |
| `productOrderUUID` | `string` |  |
| `productUUID` | `string` |  |
| `reason_decline` | `string` | Reason for product decline. |
| `sorting` | `Object` |  |

#### Example: Create

```ts
const merchant_portal_pam_product_controller = await client.MerchantPortalPamProductController().create({
  packageOrderUUID: 'example_packageOrderUUID',
  productOrderUUID: 'example_productOrderUUID',
  productUUID: 'example_productUUID',
  reason_decline: 'example_reason_decline',
})
```


### OutputAddProduct

Create an instance: `const output_add_product = client.OutputAddProduct()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `string` | Unique identifier for the package. |
| `productUUIDs` | `Array` | The list of unique identifiers of the products. |
| `responseCode` | `number` | Response code. |
| `responseMessage` | `string` | Response message. |

#### Example: Create

```ts
const output_add_product = await client.OutputAddProduct().create({
  packageUUID: 'example_packageUUID',
  productUUIDs: [],
  responseCode: 1,
  responseMessage: 'example_responseMessage',
})
```


### OutputCreateProduct

Create an instance: `const output_create_product = client.OutputCreateProduct()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

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
| `responseCode` | `number` | Response code. |
| `responseMessage` | `string` | Response message. |
| `terminalTemplateName` | `string` | Name of the terminal template. |
| `vendorName` | `string` | Name of the vendor. |
| `xmlTemplateFile` | `string` | A string value containing the XML template file encoded in Base64. |

#### Example: Create

```ts
const output_create_product = await client.OutputCreateProduct().create({
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


### OutputDetail

Create an instance: `const output_detail = client.OutputDetail()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `batch` | `Object` |  |
| `lines` | `Object` |  |
| `progress` | `Object` |  |

#### Example: Load

```ts
const output_detail = await client.OutputDetail().load({ id: 'output_detail_id' })
```


### OutputList

Create an instance: `const output_list = client.OutputList()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `items` | `Array` |  |
| `pagination` | `Object` |  |
| `responseCode` | `number` | Response code. |
| `responseMessage` | `string` | Response message. |
| `sorting` | `Object` |  |

#### Example: Create

```ts
const output_list = await client.OutputList().create({
  pagination: {},
  responseCode: 1,
  responseMessage: 'example_responseMessage',
})
```


### OutputMessage

Create an instance: `const output_message = client.OutputMessage()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `responseCode` | `number` | Response code. |
| `responseMessage` | `string` | Response message. |

#### Example: Load

```ts
const output_message = await client.OutputMessage().load({ id: 'output_message_id' })
```


### OutputMoveTid

Create an instance: `const output_move_tid = client.OutputMoveTid()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `productOrderUUIDs` | `Array` |  |
| `responseCode` | `number` | Response code. |
| `responseMessage` | `string` | Response message. |
| `targetPackageOrderUUID` | `string` |  |
| `targetProductOrderUUID` | `string` |  |

#### Example: Create

```ts
const output_move_tid = await client.OutputMoveTid().create({
  productOrderUUIDs: [],
  responseCode: 1,
  responseMessage: 'example_responseMessage',
  targetPackageOrderUUID: 'example_targetPackageOrderUUID',
  targetProductOrderUUID: 'example_targetProductOrderUUID',
})
```


### OutputRemoveProduct

Create an instance: `const output_remove_product = client.OutputRemoveProduct()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `string` | Unique identifier for the package. |
| `productUUIDs` | `Array` | List of product unique identifiers. |
| `responseCode` | `number` | Response code. |
| `responseMessage` | `string` | Response message. |

#### Example: Create

```ts
const output_remove_product = await client.OutputRemoveProduct().create({
  packageUUID: 'example_packageUUID',
  productUUIDs: [],
  responseCode: 1,
  responseMessage: 'example_responseMessage',
})
```


### OutputStart

Create an instance: `const output_start = client.OutputStart()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `string` |  |
| `responseCode` | `number` | Response code. |
| `responseMessage` | `string` | Response message. |

#### Example: Create

```ts
const output_start = await client.OutputStart().create({
  responseCode: 1,
  responseMessage: 'example_responseMessage',
})
```


### OutputStatus

Create an instance: `const output_status = client.OutputStatus()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `number` |  |
| `responseCode` | `number` | Response code. |
| `responseMessage` | `string` | Response message. |
| `status` | `string` |  |

#### Example: Load

```ts
const output_status = await client.OutputStatus().load({ id: 'output_status_id' })
```


### OutputUpdateProduct

Create an instance: `const output_update_product = client.OutputUpdateProduct()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

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
| `responseCode` | `number` | Response code. |
| `responseMessage` | `string` | Response message. |
| `vendorName` | `string` | The name of the vendor |

#### Example: Create

```ts
const output_update_product = await client.OutputUpdateProduct().create({
  productUUID: 'example_productUUID',
  responseCode: 1,
  responseMessage: 'example_responseMessage',
})
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

### Module structure

```
bluefin-tecs-merchant-portal/
├── src/
│   ├── BluefinTecsMerchantPortalSDK.js        # Main SDK class
│   ├── entity/             # Entity implementations
│   ├── feature/            # Built-in features (Base, Test, Log)
│   └── utility/            # Utility functions
└── test/                   # Test suites
```

Import the SDK from the package root:

```js
const { BluefinTecsMerchantPortalSDK } = require('@voxgig-sdk/bluefin-tecs-merchant-portal-js')
```

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
