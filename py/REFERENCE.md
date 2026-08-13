# BluefinTecsMerchantPortal Python SDK Reference

Complete API reference for the BluefinTecsMerchantPortal Python SDK.


## BluefinTecsMerchantPortalSDK

### Constructor

```python
from bluefintecsmerchantportal_sdk import BluefinTecsMerchantPortalSDK

client = BluefinTecsMerchantPortalSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinTecsMerchantPortalSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = BluefinTecsMerchantPortalSDK.test()
```


### Instance Methods

#### `MerchantPortalApiController(data=None)`

Create a new `MerchantPortalApiControllerEntity` instance. Pass `None` for no initial data.

#### `MerchantPortalCommonController(data=None)`

Create a new `MerchantPortalCommonControllerEntity` instance. Pass `None` for no initial data.

#### `MerchantPortalPamContractController(data=None)`

Create a new `MerchantPortalPamContractControllerEntity` instance. Pass `None` for no initial data.

#### `MerchantPortalPamDocumentController(data=None)`

Create a new `MerchantPortalPamDocumentControllerEntity` instance. Pass `None` for no initial data.

#### `MerchantPortalPamFormController(data=None)`

Create a new `MerchantPortalPamFormControllerEntity` instance. Pass `None` for no initial data.

#### `MerchantPortalPamMandatorController(data=None)`

Create a new `MerchantPortalPamMandatorControllerEntity` instance. Pass `None` for no initial data.

#### `MerchantPortalPamMerchantController(data=None)`

Create a new `MerchantPortalPamMerchantControllerEntity` instance. Pass `None` for no initial data.

#### `MerchantPortalPamPackageController(data=None)`

Create a new `MerchantPortalPamPackageControllerEntity` instance. Pass `None` for no initial data.

#### `MerchantPortalPamProductController(data=None)`

Create a new `MerchantPortalPamProductControllerEntity` instance. Pass `None` for no initial data.

#### `OutputAddProduct(data=None)`

Create a new `OutputAddProductEntity` instance. Pass `None` for no initial data.

#### `OutputCreateProduct(data=None)`

Create a new `OutputCreateProductEntity` instance. Pass `None` for no initial data.

#### `OutputDetail(data=None)`

Create a new `OutputDetailEntity` instance. Pass `None` for no initial data.

#### `OutputList(data=None)`

Create a new `OutputListEntity` instance. Pass `None` for no initial data.

#### `OutputMessage(data=None)`

Create a new `OutputMessageEntity` instance. Pass `None` for no initial data.

#### `OutputMoveTid(data=None)`

Create a new `OutputMoveTidEntity` instance. Pass `None` for no initial data.

#### `OutputRemoveProduct(data=None)`

Create a new `OutputRemoveProductEntity` instance. Pass `None` for no initial data.

#### `OutputStart(data=None)`

Create a new `OutputStartEntity` instance. Pass `None` for no initial data.

#### `OutputStatus(data=None)`

Create a new `OutputStatusEntity` instance. Pass `None` for no initial data.

#### `OutputUpdateProduct(data=None)`

Create a new `OutputUpdateProductEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## MerchantPortalApiControllerEntity

```python
merchant_portal_api_controller = client.MerchantPortalApiController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `int` | No |  |
| `additional_data` | `dict` | No |  |
| `business_reg_number` | `str` | Yes |  |
| `city` | `str` | Yes |  |
| `corporateuuid` | `str` | No |  |
| `country` | `str` | Yes |  |
| `currency` | `str` | Yes |  |
| `merchant_category_code` | `int` | Yes |  |
| `merchant_email` | `str` | No |  |
| `merchant_name` | `str` | Yes |  |
| `merchant_phone_number` | `str` | No |  |
| `packageid` | `str` | Yes |  |
| `packageorderuuid` | `str` | Yes |  |
| `password` | `str` | No |  |
| `productid` | `str` | No |  |
| `productid_acquirer` | `str` | No |  |
| `reason_deactivation` | `str` | Yes |  |
| `reason_reactivation` | `str` | Yes |  |
| `sorting_code` | `int` | No |  |
| `state` | `str` | No |  |
| `street` | `str` | Yes |  |
| `terminal_country_code` | `str` | Yes |  |
| `terminal_language_code` | `str` | Yes |  |
| `terminal_location` | `str` | Yes |  |
| `terminal_serial_number` | `str` | Yes |  |
| `terminalid` | `int` | Yes |  |
| `terminalid_acquirer` | `str` | No |  |
| `user_email` | `str` | No |  |
| `user_phone_number` | `str` | No |  |
| `username` | `str` | No |  |
| `vu_nummer` | `str` | Yes |  |
| `web_shop_url` | `str` | No |  |
| `zipcode` | `str` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.MerchantPortalApiController().create({
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

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalApiControllerEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## MerchantPortalCommonControllerEntity

```python
merchant_portal_common_controller = client.MerchantPortalCommonController()
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.MerchantPortalCommonController().load()
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalCommonControllerEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## MerchantPortalPamContractControllerEntity

```python
merchant_portal_pam_contract_controller = client.MerchantPortalPamContractController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `str` | Yes |  |
| `productOrderUUID` | `str` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.MerchantPortalPamContractController().create({
    "language": "example_language",  # str
    "productOrderUUID": "example_productOrderUUID",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamContractControllerEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## MerchantPortalPamDocumentControllerEntity

```python
merchant_portal_pam_document_controller = client.MerchantPortalPamDocumentController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appFormFieldDescUUID` | `str` | Yes |  |
| `packageOrderUUID` | `str` | No |  |
| `productOrderUUID` | `str` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.MerchantPortalPamDocumentController().create({
    "appFormFieldDescUUID": "example_appFormFieldDescUUID",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamDocumentControllerEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## MerchantPortalPamFormControllerEntity

```python
merchant_portal_pam_form_controller = client.MerchantPortalPamFormController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appFormFieldsDescUUID` | `str` | Yes |  |
| `filter` | `dict` | No |  |
| `language` | `str` | Yes |  |
| `packageOrder` | `dict` | No |  |
| `packageOrderUUID` | `str` | Yes |  |
| `packageUUID` | `str` | No |  |
| `productOrderUUID` | `str` | No |  |
| `productOrders` | `list` | No |  |
| `reasonOfReopening` | `str` | Yes |  |

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

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.MerchantPortalPamFormController().create({
    "appFormFieldsDescUUID": "example_appFormFieldsDescUUID",  # str
    "language": "example_language",  # str
    "packageOrderUUID": "example_packageOrderUUID",  # str
    "reasonOfReopening": "example_reasonOfReopening",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamFormControllerEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## MerchantPortalPamMandatorControllerEntity

```python
merchant_portal_pam_mandator_controller = client.MerchantPortalPamMandatorController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `clientSecret` | `str` | No |  |
| `mandatorName` | `str` | Yes |  |
| `notificationEmail` | `str` | No |  |
| `packageUUID` | `str` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.MerchantPortalPamMandatorController().create({
    "mandatorName": "example_mandatorName",  # str
    "packageUUID": "example_packageUUID",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamMandatorControllerEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## MerchantPortalPamMerchantControllerEntity

```python
merchant_portal_pam_merchant_controller = client.MerchantPortalPamMerchantController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `dict` | No |  |
| `businessRegistrationNumber` | `str` | Yes |  |
| `city` | `str` | No |  |
| `companyName` | `str` | Yes |  |
| `corporateUUID` | `str` | Yes |  |
| `country` | `str` | No |  |
| `currency` | `str` | Yes |  |
| `email` | `str` | Yes |  |
| `language` | `str` | Yes |  |
| `login` | `str` | Yes |  |
| `mandator` | `str` | Yes |  |
| `merchantContractNumber` | `str` | Yes |  |
| `merchantName` | `str` | No |  |
| `merchant_category_code` | `str` | No |  |
| `packageUUID` | `str` | No |  |
| `packageorderuuid` | `str` | Yes |  |
| `phoneNumber` | `str` | Yes |  |
| `postalCode` | `str` | No |  |
| `productid_acquirer` | `str` | Yes |  |
| `region` | `str` | No |  |
| `registrationNumber` | `str` | No |  |
| `signature` | `str` | No |  |
| `street` | `str` | No |  |
| `terminalIds` | `list` | No |  |
| `terminalid_acquirer` | `str` | No |  |
| `vu_nummer` | `str` | Yes |  |

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

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.MerchantPortalPamMerchantController().create({
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

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamMerchantControllerEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## MerchantPortalPamPackageControllerEntity

```python
merchant_portal_pam_package_controller = client.MerchantPortalPamPackageController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumerUUID` | `str` | No |  |
| `corporateUUID` | `str` | No |  |
| `country` | `str` | No |  |
| `descriptionKey` | `str` | No |  |
| `filter` | `dict` | No |  |
| `language` | `str` | Yes |  |
| `nameKey` | `str` | No |  |
| `packageStatus` | `str` | No |  |
| `packageUUID` | `str` | Yes |  |
| `pagination` | `dict` | No |  |
| `sorting` | `dict` | No |  |

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

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.MerchantPortalPamPackageController().create({
    "language": "example_language",  # str
    "packageUUID": "example_packageUUID",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamPackageControllerEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## MerchantPortalPamProductControllerEntity

```python
merchant_portal_pam_product_controller = client.MerchantPortalPamProductController()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumerUUID` | `str` | No |  |
| `filter` | `dict` | No |  |
| `language` | `str` | No |  |
| `merchantID` | `str` | No |  |
| `packageOrderUUID` | `str` | Yes |  |
| `pagination` | `dict` | No |  |
| `productOrderUUID` | `str` | Yes |  |
| `productUUID` | `str` | Yes |  |
| `reason_decline` | `str` | Yes |  |
| `sorting` | `dict` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.MerchantPortalPamProductController().create({
    "packageOrderUUID": "example_packageOrderUUID",  # str
    "productOrderUUID": "example_productOrderUUID",  # str
    "productUUID": "example_productUUID",  # str
    "reason_decline": "example_reason_decline",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MerchantPortalPamProductControllerEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## OutputAddProductEntity

```python
output_add_product = client.OutputAddProduct()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `packageUUID` | `str` | Yes |  |
| `productUUIDs` | `list` | Yes |  |
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `str` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.OutputAddProduct().create({
    "packageUUID": "example_packageUUID",  # str
    "productUUIDs": [],  # list
    "responseCode": 1,  # int
    "responseMessage": "example_responseMessage",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputAddProductEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## OutputCreateProductEntity

```python
output_create_product = client.OutputCreateProduct()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acquirerId` | `str` | No |  |
| `allowMultipleOrders` | `bool` | Yes |  |
| `appFormTemplateName` | `str` | Yes |  |
| `contractNeeded` | `bool` | Yes |  |
| `credentialsNeeded` | `bool` | No |  |
| `descriptionKey` | `str` | Yes |  |
| `nameKey` | `str` | Yes |  |
| `prescreeningAllowed` | `bool` | Yes |  |
| `productName` | `str` | Yes |  |
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `str` | Yes |  |
| `terminalTemplateName` | `str` | Yes |  |
| `vendorName` | `str` | Yes |  |
| `xmlTemplateFile` | `str` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.OutputCreateProduct().create({
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

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputCreateProductEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## OutputDetailEntity

```python
output_detail = client.OutputDetail()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `batch` | `dict` | No |  |
| `lines` | `dict` | No |  |
| `progress` | `dict` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.OutputDetail().load({"id": "output_detail_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputDetailEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## OutputListEntity

```python
output_list = client.OutputList()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `items` | `list` | No |  |
| `pagination` | `dict` | Yes |  |
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `str` | Yes |  |
| `sorting` | `dict` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `items` | - |
| `pagination` | Yes |
| `responseCode` | - |
| `responseMessage` | - |
| `sorting` | - |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.OutputList().create({
    "pagination": {},  # dict
    "responseCode": 1,  # int
    "responseMessage": "example_responseMessage",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputListEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## OutputMessageEntity

```python
output_message = client.OutputMessage()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `str` | Yes |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.OutputMessage().load({"id": "output_message_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputMessageEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## OutputMoveTidEntity

```python
output_move_tid = client.OutputMoveTid()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `productOrderUUIDs` | `list` | Yes |  |
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `str` | Yes |  |
| `targetPackageOrderUUID` | `str` | Yes |  |
| `targetProductOrderUUID` | `str` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.OutputMoveTid().create({
    "productOrderUUIDs": [],  # list
    "responseCode": 1,  # int
    "responseMessage": "example_responseMessage",  # str
    "targetPackageOrderUUID": "example_targetPackageOrderUUID",  # str
    "targetProductOrderUUID": "example_targetProductOrderUUID",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputMoveTidEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## OutputRemoveProductEntity

```python
output_remove_product = client.OutputRemoveProduct()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `packageUUID` | `str` | Yes |  |
| `productUUIDs` | `list` | Yes |  |
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `str` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.OutputRemoveProduct().create({
    "packageUUID": "example_packageUUID",  # str
    "productUUIDs": [],  # list
    "responseCode": 1,  # int
    "responseMessage": "example_responseMessage",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputRemoveProductEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## OutputStartEntity

```python
output_start = client.OutputStart()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `str` | No |  |
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `str` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.OutputStart().create({
    "responseCode": 1,  # int
    "responseMessage": "example_responseMessage",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputStartEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## OutputStatusEntity

```python
output_status = client.OutputStatus()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `int` | No |  |
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `str` | Yes |  |
| `status` | `str` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.OutputStatus().load({"id": "output_status_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputStatusEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## OutputUpdateProductEntity

```python
output_update_product = client.OutputUpdateProduct()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `allowMultipleOrders` | `bool` | No |  |
| `appFormName` | `str` | No |  |
| `contractNeeded` | `bool` | No |  |
| `credentialsNeeded` | `bool` | No |  |
| `descriptionKey` | `str` | No |  |
| `nameKey` | `str` | No |  |
| `prescreeningAllowed` | `bool` | No |  |
| `productName` | `str` | No |  |
| `productStatus` | `str` | No |  |
| `productUUID` | `str` | Yes |  |
| `responseCode` | `int` | Yes |  |
| `responseMessage` | `str` | Yes |  |
| `vendorName` | `str` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.OutputUpdateProduct().create({
    "productUUID": "example_productUUID",  # str
    "responseCode": 1,  # int
    "responseMessage": "example_responseMessage",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OutputUpdateProductEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```python
client = BluefinTecsMerchantPortalSDK({
    "feature": {
        "test": {"active": True},
    },
})
```

