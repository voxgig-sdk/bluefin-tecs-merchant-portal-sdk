# BluefinTecsMerchantPortal Python SDK



The Python SDK for the BluefinTecsMerchantPortal API — an entity-oriented client following Pythonic conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.MerchantPortalApiController()` — each
carrying a small, uniform set of operations (`load`, `create`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to PyPI. Install it from the GitHub
release tag (`py/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/releases)) or
from a source checkout:

```bash
pip install -e .
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```python
from bluefintecsmerchantportal_sdk import BluefinTecsMerchantPortalSDK

client = BluefinTecsMerchantPortalSDK()
```

### 4. Create, update, and remove

```python
# Create — returns the ENTITY (call data_get() for the record)
created = client.MerchantPortalApiController().create({"business_reg_number": "example_business_reg_number", "city": "example_city", "country": "example_country", "currency": "example_currency", "merchant_category_code": 1, "merchant_name": "example_merchant_name", "packageid": "example_packageid", "packageorderuuid": "example_packageorderuuid", "reason_deactivation": "example_reason_deactivation", "reason_reactivation": "example_reason_reactivation", "street": "example_street", "terminal_country_code": "example_terminal_country_code", "terminal_language_code": "example_terminal_language_code", "terminal_location": "example_terminal_location", "terminal_serial_number": "example_terminal_serial_number", "terminalid": 1, "vu_nummer": "example_vu_nummer", "zipcode": "example_zipcode"})

```


## Error handling

Entity operations raise on failure, so wrap them in `try` / `except`:

```python
try:
    outputdetail = client.OutputDetail().load({"id": "example_id"})
    print(outputdetail)
except Exception as err:
    print(f"load failed: {err}")
```

`direct()` does **not** raise — it returns the result envelope. Branch
on `ok`; on failure `status` holds the HTTP status (for error responses)
and `err` holds a transport error, so read both defensively:

```python
result = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example_id"},
})

if not result["ok"]:
    print("request failed:", result.get("status"), result.get("err"))
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```python
result = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})

if result["ok"]:
    print(result["status"])  # 200
    print(result["data"])    # response body
else:
    # A non-2xx response carries status + data (the error body); a
    # transport-level failure carries err instead. Only one is present, so
    # read both with .get() rather than indexing a key that may be absent.
    print(result.get("status"), result.get("err"))
```

### Prepare a request without sending it

```python
# prepare() returns the fetch definition and raises on error.
fetchdef = client.prepare({
    "path": "/api/resource/{id}",
    "method": "DELETE",
    "params": {"id": "example"},
})

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```python
client = BluefinTecsMerchantPortalSDK.test()

# Entity ops return the ENTITY and raises on error;
# call data_get() for the record.
outputdetail = client.OutputDetail().load({"id": "test01"})
# outputdetail contains the mock response record
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```python
def mock_fetch(url, init):
    return {
        "status": 200,
        "statusText": "OK",
        "headers": {},
        "json": lambda: {"id": "mock01"},
    }, None

client = BluefinTecsMerchantPortalSDK({
    "base": "http://localhost:8080",
    "system": {
        "fetch": mock_fetch,
    },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE
```

Then run:

```bash
cd py && pytest test/
```


## Reference

### BluefinTecsMerchantPortalSDK

```python
from bluefintecsmerchantportal_sdk import BluefinTecsMerchantPortalSDK

client = BluefinTecsMerchantPortalSDK(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `str` | Base URL of the API server. |
| `prefix` | `str` | URL path prefix prepended to all requests. |
| `suffix` | `str` | URL path suffix appended to all requests. |
| `feature` | `dict` | Feature activation flags. |
| `extend` | `list` | Additional Feature instances to load. |
| `system` | `dict` | System overrides (e.g. custom `fetch` function). |

### test

```python
client = BluefinTecsMerchantPortalSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `None`.

### BluefinTecsMerchantPortalSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> dict` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> dict` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> dict` | Build and send an HTTP request. Returns a result dict (branch on `ok`). |
| `MerchantPortalApiController` | `(data) -> MerchantPortalApiControllerEntity` | Create a MerchantPortalApiController entity instance. |
| `MerchantPortalCommonController` | `(data) -> MerchantPortalCommonControllerEntity` | Create a MerchantPortalCommonController entity instance. |
| `MerchantPortalPamContractController` | `(data) -> MerchantPortalPamContractControllerEntity` | Create a MerchantPortalPamContractController entity instance. |
| `MerchantPortalPamDocumentController` | `(data) -> MerchantPortalPamDocumentControllerEntity` | Create a MerchantPortalPamDocumentController entity instance. |
| `MerchantPortalPamFormController` | `(data) -> MerchantPortalPamFormControllerEntity` | Create a MerchantPortalPamFormController entity instance. |
| `MerchantPortalPamMandatorController` | `(data) -> MerchantPortalPamMandatorControllerEntity` | Create a MerchantPortalPamMandatorController entity instance. |
| `MerchantPortalPamMerchantController` | `(data) -> MerchantPortalPamMerchantControllerEntity` | Create a MerchantPortalPamMerchantController entity instance. |
| `MerchantPortalPamPackageController` | `(data) -> MerchantPortalPamPackageControllerEntity` | Create a MerchantPortalPamPackageController entity instance. |
| `MerchantPortalPamProductController` | `(data) -> MerchantPortalPamProductControllerEntity` | Create a MerchantPortalPamProductController entity instance. |
| `OutputAddProduct` | `(data) -> OutputAddProductEntity` | Create an OutputAddProduct entity instance. |
| `OutputCreateProduct` | `(data) -> OutputCreateProductEntity` | Create an OutputCreateProduct entity instance. |
| `OutputDetail` | `(data) -> OutputDetailEntity` | Create an OutputDetail entity instance. |
| `OutputList` | `(data) -> OutputListEntity` | Create an OutputList entity instance. |
| `OutputMessage` | `(data) -> OutputMessageEntity` | Create an OutputMessage entity instance. |
| `OutputMoveTid` | `(data) -> OutputMoveTidEntity` | Create an OutputMoveTid entity instance. |
| `OutputRemoveProduct` | `(data) -> OutputRemoveProductEntity` | Create an OutputRemoveProduct entity instance. |
| `OutputStart` | `(data) -> OutputStartEntity` | Create an OutputStart entity instance. |
| `OutputStatus` | `(data) -> OutputStatusEntity` | Create an OutputStatus entity instance. |
| `OutputUpdateProduct` | `(data) -> OutputUpdateProductEntity` | Create an OutputUpdateProduct entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `create` | `(reqdata, ctrl) -> any` | Create a new entity. Raises on error. |
| `data_get` | `() -> dict` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> dict` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> str` | Return the entity name. |

### Result shape

Entity operations return the ENTITY (call data_get() for the record) (a `dict` for single-entity
ops, a `list` for `list`) and raise on error. Wrap calls in
`try`/`except` to handle failures.

The `direct()` escape hatch never raises — it returns a result `dict`
you branch on via `result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `True` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `dict` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `False` and `err` contains the error value.

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

Create an instance: `merchant_portal_api_controller = client.MerchantPortalApiController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `int` | Account number provided by the acquirer. |
| `additional_data` | `dict` | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `str` | Merchant business registration number as stated in the company registry. |
| `city` | `str` | Merchant's address: city. |
| `corporateuuid` | `str` | Unique identifier for the corporate entity (UUID format). |
| `country` | `str` | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `str` | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `int` | Merchant category code as defined by the payment network. |
| `merchant_email` | `str` | Merchant's email address for receiving notifications. |
| `merchant_name` | `str` | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | `str` | Merchant's phone number for notifications. |
| `packageid` | `str` | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | `str` | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | `str` | Merchant password for MPOS. |
| `productid` | `str` | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | `str` | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | `str` | Reason for terminal deactivation. |
| `reason_reactivation` | `str` | Reason for terminal reactivation. |
| `sorting_code` | `int` | Sorting code provided by the acquirer. |
| `state` | `str` | Merchant's address: state. |
| `street` | `str` | Merchant's address: street and house number. |
| `terminal_country_code` | `str` | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `str` | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `str` | Physical or logical location of the terminal. |
| `terminal_serial_number` | `str` | Terminal serial number. |
| `terminalid` | `int` | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `str` | Terminal ID as set by the acquirer (optional). |
| `user_email` | `str` | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `str` | Phone number of the user acting on behalf of the merchant. |
| `username` | `str` | Merchant username for MPOS. |
| `vu_nummer` | `str` | Merchant contract number with the acquirer. |
| `web_shop_url` | `str` | URL of the merchant's web shop. |
| `zipcode` | `str` | Merchant's address: postal code. |

#### Example: Create

```python
merchant_portal_api_controller = client.MerchantPortalApiController().create({
    "business_reg_number": "example_business_reg_number",  # str
    "city": "example_city",  # str
    "country": "example_country",  # str
    "currency": "example_currency",  # str
    "merchant_category_code": 1,  # int
    "merchant_name": "example_merchant_name",  # str
    "packageid": "example_packageid",  # str
    "packageorderuuid": "example_packageorderuuid",  # str
    "reason_deactivation": "example_reason_deactivation",  # str
    "reason_reactivation": "example_reason_reactivation",  # str
    "street": "example_street",  # str
    "terminal_country_code": "example_terminal_country_code",  # str
    "terminal_language_code": "example_terminal_language_code",  # str
    "terminal_location": "example_terminal_location",  # str
    "terminal_serial_number": "example_terminal_serial_number",  # str
    "terminalid": 1,  # int
    "vu_nummer": "example_vu_nummer",  # str
    "zipcode": "example_zipcode",  # str
})
```


### MerchantPortalCommonController

Create an instance: `merchant_portal_common_controller = client.MerchantPortalCommonController()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```python
merchant_portal_common_controller = client.MerchantPortalCommonController().load()
```


### MerchantPortalPamContractController

Create an instance: `merchant_portal_pam_contract_controller = client.MerchantPortalPamContractController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `language` | `str` |  |
| `productOrderUUID` | `str` |  |

#### Example: Create

```python
merchant_portal_pam_contract_controller = client.MerchantPortalPamContractController().create({
    "language": "example_language",  # str
    "productOrderUUID": "example_productOrderUUID",  # str
})
```


### MerchantPortalPamDocumentController

Create an instance: `merchant_portal_pam_document_controller = client.MerchantPortalPamDocumentController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldDescUUID` | `str` |  |
| `packageOrderUUID` | `str` | UUID of the package order. |
| `productOrderUUID` | `str` | UUID of the product order. |

#### Example: Create

```python
merchant_portal_pam_document_controller = client.MerchantPortalPamDocumentController().create({
    "appFormFieldDescUUID": "example_appFormFieldDescUUID",  # str
})
```


### MerchantPortalPamFormController

Create an instance: `merchant_portal_pam_form_controller = client.MerchantPortalPamFormController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appFormFieldsDescUUID` | `str` |  |
| `filter` | `dict` |  |
| `language` | `str` |  |
| `packageOrder` | `dict` |  |
| `packageOrderUUID` | `str` | UUID of the package order. |
| `packageUUID` | `str` |  |
| `productOrderUUID` | `str` | UUID of the product order. |
| `productOrders` | `list` |  |
| `reasonOfReopening` | `str` |  |

#### Example: Create

```python
merchant_portal_pam_form_controller = client.MerchantPortalPamFormController().create({
    "appFormFieldsDescUUID": "example_appFormFieldsDescUUID",  # str
    "language": "example_language",  # str
    "packageOrderUUID": "example_packageOrderUUID",  # str
    "reasonOfReopening": "example_reasonOfReopening",  # str
})
```


### MerchantPortalPamMandatorController

Create an instance: `merchant_portal_pam_mandator_controller = client.MerchantPortalPamMandatorController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `clientSecret` | `str` |  |
| `mandatorName` | `str` |  |
| `notificationEmail` | `str` |  |
| `packageUUID` | `str` |  |

#### Example: Create

```python
merchant_portal_pam_mandator_controller = client.MerchantPortalPamMandatorController().create({
    "mandatorName": "example_mandatorName",  # str
    "packageUUID": "example_packageUUID",  # str
})
```


### MerchantPortalPamMerchantController

Create an instance: `merchant_portal_pam_merchant_controller = client.MerchantPortalPamMerchantController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `additional_data` | `dict` | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` | `str` |  |
| `city` | `str` | City where the merchant is located. |
| `companyName` | `str` |  |
| `corporateUUID` | `str` | Unique identifier for the corporate entity. |
| `country` | `str` | Country where the merchant is located. |
| `currency` | `str` | Transaction currency in ISO 4217 format. |
| `email` | `str` |  |
| `language` | `str` |  |
| `login` | `str` |  |
| `mandator` | `str` | Mandator name assigned by TECS. |
| `merchantContractNumber` | `str` | Unique identifier for the merchant within a specific system. |
| `merchantName` | `str` | Name of the merchant. |
| `merchant_category_code` | `str` | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | `str` | UUID of the package. |
| `packageorderuuid` | `str` | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` | `str` |  |
| `postalCode` | `str` | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | `str` | Identifier of the product for which acquiring is to be enabled. |
| `region` | `str` | State or province where the merchant is located. |
| `registrationNumber` | `str` | Business registration number. |
| `signature` | `str` | Signature value = saltAsHex-hashAsHex. |
| `street` | `str` | Street address of the merchant. |
| `terminalIds` | `list` | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `str` | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `str` | Merchant contract number with the acquirer. |

#### Example: Create

```python
merchant_portal_pam_merchant_controller = client.MerchantPortalPamMerchantController().create({
    "businessRegistrationNumber": "example_businessRegistrationNumber",  # str
    "companyName": "example_companyName",  # str
    "corporateUUID": "example_corporateUUID",  # str
    "currency": "example_currency",  # str
    "email": "example_email",  # str
    "language": "example_language",  # str
    "login": "example_login",  # str
    "mandator": "example_mandator",  # str
    "merchantContractNumber": "example_merchantContractNumber",  # str
    "packageorderuuid": "example_packageorderuuid",  # str
    "phoneNumber": "example_phoneNumber",  # str
    "productid_acquirer": "example_productid_acquirer",  # str
    "vu_nummer": "example_vu_nummer",  # str
})
```


### MerchantPortalPamPackageController

Create an instance: `merchant_portal_pam_package_controller = client.MerchantPortalPamPackageController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `str` |  |
| `corporateUUID` | `str` |  |
| `country` | `str` | Country associated with the package. |
| `descriptionKey` | `str` | Key for the description of the package. |
| `filter` | `dict` |  |
| `language` | `str` |  |
| `nameKey` | `str` | Key for the name of the package. |
| `packageStatus` | `str` | Status of the package. |
| `packageUUID` | `str` | Unique identifier for the package. |
| `pagination` | `dict` |  |
| `sorting` | `dict` |  |

#### Example: Create

```python
merchant_portal_pam_package_controller = client.MerchantPortalPamPackageController().create({
    "language": "example_language",  # str
    "packageUUID": "example_packageUUID",  # str
})
```


### MerchantPortalPamProductController

Create an instance: `merchant_portal_pam_product_controller = client.MerchantPortalPamProductController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `consumerUUID` | `str` |  |
| `filter` | `dict` |  |
| `language` | `str` |  |
| `merchantID` | `str` |  |
| `packageOrderUUID` | `str` |  |
| `pagination` | `dict` |  |
| `productOrderUUID` | `str` |  |
| `productUUID` | `str` |  |
| `reason_decline` | `str` | Reason for product decline. |
| `sorting` | `dict` |  |

#### Example: Create

```python
merchant_portal_pam_product_controller = client.MerchantPortalPamProductController().create({
    "packageOrderUUID": "example_packageOrderUUID",  # str
    "productOrderUUID": "example_productOrderUUID",  # str
    "productUUID": "example_productUUID",  # str
    "reason_decline": "example_reason_decline",  # str
})
```


### OutputAddProduct

Create an instance: `output_add_product = client.OutputAddProduct()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `str` | Unique identifier for the package. |
| `productUUIDs` | `list` | The list of unique identifiers of the products. |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `str` | Response message. |

#### Example: Create

```python
output_add_product = client.OutputAddProduct().create({
    "packageUUID": "example_packageUUID",  # str
    "productUUIDs": [],  # list
    "responseCode": 1,  # int
    "responseMessage": "example_responseMessage",  # str
})
```


### OutputCreateProduct

Create an instance: `output_create_product = client.OutputCreateProduct()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acquirerId` | `str` | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `bool` | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `str` | Name of the application form template. |
| `contractNeeded` | `bool` | Indication whether contract is needed or not. |
| `credentialsNeeded` | `bool` | Indication whether credentials are needed or not. |
| `descriptionKey` | `str` | Key indicator for product description. |
| `nameKey` | `str` | Key indicator for product name. |
| `prescreeningAllowed` | `bool` | Indication whether prescreening is allowed or not. |
| `productName` | `str` | Name of the product. |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `str` | Response message. |
| `terminalTemplateName` | `str` | Name of the terminal template. |
| `vendorName` | `str` | Name of the vendor. |
| `xmlTemplateFile` | `str` | A string value containing the XML template file encoded in Base64. |

#### Example: Create

```python
output_create_product = client.OutputCreateProduct().create({
    "allowMultipleOrders": True,  # bool
    "appFormTemplateName": "example_appFormTemplateName",  # str
    "contractNeeded": True,  # bool
    "descriptionKey": "example_descriptionKey",  # str
    "nameKey": "example_nameKey",  # str
    "prescreeningAllowed": True,  # bool
    "productName": "example_productName",  # str
    "responseCode": 1,  # int
    "responseMessage": "example_responseMessage",  # str
    "terminalTemplateName": "example_terminalTemplateName",  # str
    "vendorName": "example_vendorName",  # str
    "xmlTemplateFile": "example_xmlTemplateFile",  # str
})
```


### OutputDetail

Create an instance: `output_detail = client.OutputDetail()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `batch` | `dict` |  |
| `lines` | `dict` |  |
| `progress` | `dict` |  |

#### Example: Load

```python
output_detail = client.OutputDetail().load({"id": "output_detail_id"})
```


### OutputList

Create an instance: `output_list = client.OutputList()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `items` | `list` |  |
| `pagination` | `dict` |  |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `str` | Response message. |
| `sorting` | `dict` |  |

#### Example: Create

```python
output_list = client.OutputList().create({
    "pagination": {},  # dict
    "responseCode": 1,  # int
    "responseMessage": "example_responseMessage",  # str
})
```


### OutputMessage

Create an instance: `output_message = client.OutputMessage()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `str` | Response message. |

#### Example: Load

```python
output_message = client.OutputMessage().load({"id": "output_message_id"})
```


### OutputMoveTid

Create an instance: `output_move_tid = client.OutputMoveTid()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `productOrderUUIDs` | `list` |  |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `str` | Response message. |
| `targetPackageOrderUUID` | `str` |  |
| `targetProductOrderUUID` | `str` |  |

#### Example: Create

```python
output_move_tid = client.OutputMoveTid().create({
    "productOrderUUIDs": [],  # list
    "responseCode": 1,  # int
    "responseMessage": "example_responseMessage",  # str
    "targetPackageOrderUUID": "example_targetPackageOrderUUID",  # str
    "targetProductOrderUUID": "example_targetProductOrderUUID",  # str
})
```


### OutputRemoveProduct

Create an instance: `output_remove_product = client.OutputRemoveProduct()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `packageUUID` | `str` | Unique identifier for the package. |
| `productUUIDs` | `list` | List of product unique identifiers. |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `str` | Response message. |

#### Example: Create

```python
output_remove_product = client.OutputRemoveProduct().create({
    "packageUUID": "example_packageUUID",  # str
    "productUUIDs": [],  # list
    "responseCode": 1,  # int
    "responseMessage": "example_responseMessage",  # str
})
```


### OutputStart

Create an instance: `output_start = client.OutputStart()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `str` |  |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `str` | Response message. |

#### Example: Create

```python
output_start = client.OutputStart().create({
    "responseCode": 1,  # int
    "responseMessage": "example_responseMessage",  # str
})
```


### OutputStatus

Create an instance: `output_status = client.OutputStatus()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `percentage` | `int` |  |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `str` | Response message. |
| `status` | `str` |  |

#### Example: Load

```python
output_status = client.OutputStatus().load({"id": "output_status_id"})
```


### OutputUpdateProduct

Create an instance: `output_update_product = client.OutputUpdateProduct()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `allowMultipleOrders` | `bool` | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `str` | The name of the application form |
| `contractNeeded` | `bool` | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `bool` | An attribute to indicate if credentials are needed |
| `descriptionKey` | `str` | The description of the product |
| `nameKey` | `str` | The key of the product name |
| `prescreeningAllowed` | `bool` | An attribute to indicate if prescreening is allowed |
| `productName` | `str` | The name of the product |
| `productStatus` | `str` | The status of the product |
| `productUUID` | `str` | The UUID of the product to update |
| `responseCode` | `int` | Response code. |
| `responseMessage` | `str` | Response message. |
| `vendorName` | `str` | The name of the vendor |

#### Example: Create

```python
output_update_product = client.OutputUpdateProduct().create({
    "productUUID": "example_productUUID",  # str
    "responseCode": 1,  # int
    "responseMessage": "example_responseMessage",  # str
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

Features are the extension mechanism. A feature is a Python class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as dicts

The Python SDK uses plain dicts throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a dict.

### Module structure

```
py/
├── bluefintecsmerchantportal_sdk.py         -- Main SDK module
├── config.py                    -- Configuration
├── features.py                  -- Feature factory
├── core/                        -- Core types and context
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (Base, Test, Log)
├── utility/                     -- Utility functions and struct library
└── test/                        -- Test suites
```

The main module (`bluefintecsmerchantportal_sdk`) exports the SDK class.
Import entity or utility modules directly only when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```python
outputdetail = client.OutputDetail()
outputdetail.load({"id": "example_id"})

# outputdetail.data_get() now returns the outputdetail data from the last load
# outputdetail.match_get() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
