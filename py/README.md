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
# Create — returns the bare created record (a dict)
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

# Entity ops return the bare record and raise on error.
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

Entity operations return the bare result data (a `dict` for single-entity
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

Create an instance: `merchant_portal_api_controller = client.MerchantPortalApiController()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_number` | `int` |  |
| `additional_data` | `dict` |  |
| `business_reg_number` | `str` |  |
| `city` | `str` |  |
| `corporateuuid` | `str` |  |
| `country` | `str` |  |
| `currency` | `str` |  |
| `merchant_category_code` | `int` |  |
| `merchant_email` | `str` |  |
| `merchant_name` | `str` |  |
| `merchant_phone_number` | `str` |  |
| `packageid` | `str` |  |
| `packageorderuuid` | `str` |  |
| `password` | `str` |  |
| `productid` | `str` |  |
| `productid_acquirer` | `str` |  |
| `reason_deactivation` | `str` |  |
| `reason_reactivation` | `str` |  |
| `sorting_code` | `int` |  |
| `state` | `str` |  |
| `street` | `str` |  |
| `terminal_country_code` | `str` |  |
| `terminal_language_code` | `str` |  |
| `terminal_location` | `str` |  |
| `terminal_serial_number` | `str` |  |
| `terminalid` | `int` |  |
| `terminalid_acquirer` | `str` |  |
| `user_email` | `str` |  |
| `user_phone_number` | `str` |  |
| `username` | `str` |  |
| `vu_nummer` | `str` |  |
| `web_shop_url` | `str` |  |
| `zipcode` | `str` |  |

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
| `product_order_uuid` | `str` |  |

#### Example: Create

```python
merchant_portal_pam_contract_controller = client.MerchantPortalPamContractController().create({
    "language": "example_language",  # str
    "product_order_uuid": "example_product_order_uuid",  # str
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
| `app_form_field_desc_uuid` | `str` |  |
| `package_order_uuid` | `str` |  |
| `product_order_uuid` | `str` |  |

#### Example: Create

```python
merchant_portal_pam_document_controller = client.MerchantPortalPamDocumentController().create({
    "app_form_field_desc_uuid": "example_app_form_field_desc_uuid",  # str
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
| `app_form_fields_desc_uuid` | `str` |  |
| `filter` | `dict` |  |
| `language` | `str` |  |
| `package_order` | `dict` |  |
| `package_order_uuid` | `str` |  |
| `package_uuid` | `str` |  |
| `product_order` | `list` |  |
| `product_order_uuid` | `str` |  |
| `reason_of_reopening` | `str` |  |

#### Example: Create

```python
merchant_portal_pam_form_controller = client.MerchantPortalPamFormController().create({
    "app_form_fields_desc_uuid": "example_app_form_fields_desc_uuid",  # str
    "language": "example_language",  # str
    "package_order_uuid": "example_package_order_uuid",  # str
    "reason_of_reopening": "example_reason_of_reopening",  # str
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
| `client_secret` | `str` |  |
| `mandator_name` | `str` |  |
| `notification_email` | `str` |  |
| `package_uuid` | `str` |  |

#### Example: Create

```python
merchant_portal_pam_mandator_controller = client.MerchantPortalPamMandatorController().create({
    "mandator_name": "example_mandator_name",  # str
    "package_uuid": "example_package_uuid",  # str
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
| `additional_data` | `dict` |  |
| `business_registration_number` | `str` |  |
| `city` | `str` |  |
| `company_name` | `str` |  |
| `corporate_uuid` | `str` |  |
| `country` | `str` |  |
| `currency` | `str` |  |
| `email` | `str` |  |
| `language` | `str` |  |
| `login` | `str` |  |
| `mandator` | `str` |  |
| `merchant_category_code` | `str` |  |
| `merchant_contract_number` | `str` |  |
| `merchant_name` | `str` |  |
| `package_uuid` | `str` |  |
| `packageorderuuid` | `str` |  |
| `phone_number` | `str` |  |
| `postal_code` | `str` |  |
| `productid_acquirer` | `str` |  |
| `region` | `str` |  |
| `registration_number` | `str` |  |
| `signature` | `str` |  |
| `street` | `str` |  |
| `terminal_id` | `list` |  |
| `terminalid_acquirer` | `str` |  |
| `vu_nummer` | `str` |  |

#### Example: Create

```python
merchant_portal_pam_merchant_controller = client.MerchantPortalPamMerchantController().create({
    "business_registration_number": "example_business_registration_number",  # str
    "company_name": "example_company_name",  # str
    "corporate_uuid": "example_corporate_uuid",  # str
    "currency": "example_currency",  # str
    "email": "example_email",  # str
    "language": "example_language",  # str
    "login": "example_login",  # str
    "mandator": "example_mandator",  # str
    "merchant_contract_number": "example_merchant_contract_number",  # str
    "packageorderuuid": "example_packageorderuuid",  # str
    "phone_number": "example_phone_number",  # str
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
| `consumer_uuid` | `str` |  |
| `corporate_uuid` | `str` |  |
| `country` | `str` |  |
| `description_key` | `str` |  |
| `filter` | `dict` |  |
| `language` | `str` |  |
| `name_key` | `str` |  |
| `package_status` | `str` |  |
| `package_uuid` | `str` |  |
| `pagination` | `dict` |  |
| `sorting` | `dict` |  |

#### Example: Create

```python
merchant_portal_pam_package_controller = client.MerchantPortalPamPackageController().create({
    "language": "example_language",  # str
    "package_uuid": "example_package_uuid",  # str
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
| `consumer_uuid` | `str` |  |
| `filter` | `dict` |  |
| `language` | `str` |  |
| `merchant_id` | `str` |  |
| `package_order_uuid` | `str` |  |
| `pagination` | `dict` |  |
| `product_order_uuid` | `str` |  |
| `product_uuid` | `str` |  |
| `reason_decline` | `str` |  |
| `sorting` | `dict` |  |

#### Example: Create

```python
merchant_portal_pam_product_controller = client.MerchantPortalPamProductController().create({
    "package_order_uuid": "example_package_order_uuid",  # str
    "product_order_uuid": "example_product_order_uuid",  # str
    "product_uuid": "example_product_uuid",  # str
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
| `package_uuid` | `str` |  |
| `product_uui_d` | `list` |  |
| `response_code` | `int` |  |
| `response_message` | `str` |  |

#### Example: Create

```python
output_add_product = client.OutputAddProduct().create({
    "package_uuid": "example_package_uuid",  # str
    "product_uui_d": [],  # list
    "response_code": 1,  # int
    "response_message": "example_response_message",  # str
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
| `acquirer_id` | `str` |  |
| `allow_multiple_order` | `bool` |  |
| `app_form_template_name` | `str` |  |
| `contract_needed` | `bool` |  |
| `credentials_needed` | `bool` |  |
| `description_key` | `str` |  |
| `name_key` | `str` |  |
| `prescreening_allowed` | `bool` |  |
| `product_name` | `str` |  |
| `response_code` | `int` |  |
| `response_message` | `str` |  |
| `terminal_template_name` | `str` |  |
| `vendor_name` | `str` |  |
| `xml_template_file` | `str` |  |

#### Example: Create

```python
output_create_product = client.OutputCreateProduct().create({
    "allow_multiple_order": True,  # bool
    "app_form_template_name": "example_app_form_template_name",  # str
    "contract_needed": True,  # bool
    "description_key": "example_description_key",  # str
    "name_key": "example_name_key",  # str
    "prescreening_allowed": True,  # bool
    "product_name": "example_product_name",  # str
    "response_code": 1,  # int
    "response_message": "example_response_message",  # str
    "terminal_template_name": "example_terminal_template_name",  # str
    "vendor_name": "example_vendor_name",  # str
    "xml_template_file": "example_xml_template_file",  # str
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
| `detail` | `dict` |  |
| `response_code` | `int` |  |
| `response_message` | `str` |  |

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
| `item` | `list` |  |
| `pagination` | `dict` |  |
| `response_code` | `int` |  |
| `response_message` | `str` |  |
| `sorting` | `dict` |  |

#### Example: Create

```python
output_list = client.OutputList().create({
    "pagination": {},  # dict
    "response_code": 1,  # int
    "response_message": "example_response_message",  # str
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
| `response_code` | `int` |  |
| `response_message` | `str` |  |

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
| `product_order_uui_d` | `list` |  |
| `response_code` | `int` |  |
| `response_message` | `str` |  |
| `target_package_order_uuid` | `str` |  |
| `target_product_order_uuid` | `str` |  |

#### Example: Create

```python
output_move_tid = client.OutputMoveTid().create({
    "product_order_uui_d": [],  # list
    "response_code": 1,  # int
    "response_message": "example_response_message",  # str
    "target_package_order_uuid": "example_target_package_order_uuid",  # str
    "target_product_order_uuid": "example_target_product_order_uuid",  # str
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
| `package_uuid` | `str` |  |
| `product_uui_d` | `list` |  |
| `response_code` | `int` |  |
| `response_message` | `str` |  |

#### Example: Create

```python
output_remove_product = client.OutputRemoveProduct().create({
    "package_uuid": "example_package_uuid",  # str
    "product_uui_d": [],  # list
    "response_code": 1,  # int
    "response_message": "example_response_message",  # str
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
| `response_code` | `int` |  |
| `response_message` | `str` |  |

#### Example: Create

```python
output_start = client.OutputStart().create({
    "response_code": 1,  # int
    "response_message": "example_response_message",  # str
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
| `response_code` | `int` |  |
| `response_message` | `str` |  |
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
| `allow_multiple_order` | `bool` |  |
| `app_form_name` | `str` |  |
| `contract_needed` | `bool` |  |
| `credentials_needed` | `bool` |  |
| `description_key` | `str` |  |
| `name_key` | `str` |  |
| `prescreening_allowed` | `bool` |  |
| `product_name` | `str` |  |
| `product_status` | `str` |  |
| `product_uuid` | `str` |  |
| `response_code` | `int` |  |
| `response_message` | `str` |  |
| `vendor_name` | `str` |  |

#### Example: Create

```python
output_update_product = client.OutputUpdateProduct().create({
    "product_uuid": "example_product_uuid",  # str
    "response_code": 1,  # int
    "response_message": "example_response_message",  # str
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
