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
| `product_order_uuid` | `str` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.MerchantPortalPamContractController().create({
    "language": "example_language",  # str
    "product_order_uuid": "example_product_order_uuid",  # str
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
| `app_form_field_desc_uuid` | `str` | Yes |  |
| `package_order_uuid` | `str` | No |  |
| `product_order_uuid` | `str` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.MerchantPortalPamDocumentController().create({
    "app_form_field_desc_uuid": "example_app_form_field_desc_uuid",  # str
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
| `app_form_fields_desc_uuid` | `str` | Yes |  |
| `filter` | `dict` | No |  |
| `language` | `str` | Yes |  |
| `package_order` | `dict` | No |  |
| `package_order_uuid` | `str` | Yes |  |
| `package_uuid` | `str` | No |  |
| `product_order` | `list` | No |  |
| `product_order_uuid` | `str` | No |  |
| `reason_of_reopening` | `str` | Yes |  |

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

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.MerchantPortalPamFormController().create({
    "app_form_fields_desc_uuid": "example_app_form_fields_desc_uuid",  # str
    "language": "example_language",  # str
    "package_order_uuid": "example_package_order_uuid",  # str
    "reason_of_reopening": "example_reason_of_reopening",  # str
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
| `client_secret` | `str` | No |  |
| `mandator_name` | `str` | Yes |  |
| `notification_email` | `str` | No |  |
| `package_uuid` | `str` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.MerchantPortalPamMandatorController().create({
    "mandator_name": "example_mandator_name",  # str
    "package_uuid": "example_package_uuid",  # str
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
| `business_registration_number` | `str` | Yes |  |
| `city` | `str` | No |  |
| `company_name` | `str` | Yes |  |
| `corporate_uuid` | `str` | Yes |  |
| `country` | `str` | No |  |
| `currency` | `str` | Yes |  |
| `email` | `str` | Yes |  |
| `language` | `str` | Yes |  |
| `login` | `str` | Yes |  |
| `mandator` | `str` | Yes |  |
| `merchant_category_code` | `str` | No |  |
| `merchant_contract_number` | `str` | Yes |  |
| `merchant_name` | `str` | No |  |
| `package_uuid` | `str` | No |  |
| `packageorderuuid` | `str` | Yes |  |
| `phone_number` | `str` | Yes |  |
| `postal_code` | `str` | No |  |
| `productid_acquirer` | `str` | Yes |  |
| `region` | `str` | No |  |
| `registration_number` | `str` | No |  |
| `signature` | `str` | No |  |
| `street` | `str` | No |  |
| `terminal_id` | `list` | No |  |
| `terminalid_acquirer` | `str` | No |  |
| `vu_nummer` | `str` | Yes |  |

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

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.MerchantPortalPamMerchantController().create({
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
| `consumer_uuid` | `str` | No |  |
| `corporate_uuid` | `str` | No |  |
| `country` | `str` | No |  |
| `description_key` | `str` | No |  |
| `filter` | `dict` | No |  |
| `language` | `str` | Yes |  |
| `name_key` | `str` | No |  |
| `package_status` | `str` | No |  |
| `package_uuid` | `str` | Yes |  |
| `pagination` | `dict` | No |  |
| `sorting` | `dict` | No |  |

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

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.MerchantPortalPamPackageController().create({
    "language": "example_language",  # str
    "package_uuid": "example_package_uuid",  # str
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
| `consumer_uuid` | `str` | No |  |
| `filter` | `dict` | No |  |
| `language` | `str` | No |  |
| `merchant_id` | `str` | No |  |
| `package_order_uuid` | `str` | Yes |  |
| `pagination` | `dict` | No |  |
| `product_order_uuid` | `str` | Yes |  |
| `product_uuid` | `str` | Yes |  |
| `reason_decline` | `str` | Yes |  |
| `sorting` | `dict` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.MerchantPortalPamProductController().create({
    "package_order_uuid": "example_package_order_uuid",  # str
    "product_order_uuid": "example_product_order_uuid",  # str
    "product_uuid": "example_product_uuid",  # str
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
| `package_uuid` | `str` | Yes |  |
| `product_uui_d` | `list` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `str` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.OutputAddProduct().create({
    "package_uuid": "example_package_uuid",  # str
    "product_uui_d": [],  # list
    "response_code": 1,  # int
    "response_message": "example_response_message",  # str
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
| `acquirer_id` | `str` | No |  |
| `allow_multiple_order` | `bool` | Yes |  |
| `app_form_template_name` | `str` | Yes |  |
| `contract_needed` | `bool` | Yes |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `str` | Yes |  |
| `name_key` | `str` | Yes |  |
| `prescreening_allowed` | `bool` | Yes |  |
| `product_name` | `str` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `str` | Yes |  |
| `terminal_template_name` | `str` | Yes |  |
| `vendor_name` | `str` | Yes |  |
| `xml_template_file` | `str` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.OutputCreateProduct().create({
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
| `detail` | `dict` | No |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `str` | Yes |  |

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
| `item` | `list` | No |  |
| `pagination` | `dict` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `str` | Yes |  |
| `sorting` | `dict` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.OutputList().create({
    "pagination": {},  # dict
    "response_code": 1,  # int
    "response_message": "example_response_message",  # str
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
| `response_code` | `int` | Yes |  |
| `response_message` | `str` | Yes |  |

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
| `product_order_uui_d` | `list` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `str` | Yes |  |
| `target_package_order_uuid` | `str` | Yes |  |
| `target_product_order_uuid` | `str` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.OutputMoveTid().create({
    "product_order_uui_d": [],  # list
    "response_code": 1,  # int
    "response_message": "example_response_message",  # str
    "target_package_order_uuid": "example_target_package_order_uuid",  # str
    "target_product_order_uuid": "example_target_product_order_uuid",  # str
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
| `package_uuid` | `str` | Yes |  |
| `product_uui_d` | `list` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `str` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.OutputRemoveProduct().create({
    "package_uuid": "example_package_uuid",  # str
    "product_uui_d": [],  # list
    "response_code": 1,  # int
    "response_message": "example_response_message",  # str
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
| `response_code` | `int` | Yes |  |
| `response_message` | `str` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.OutputStart().create({
    "response_code": 1,  # int
    "response_message": "example_response_message",  # str
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
| `response_code` | `int` | Yes |  |
| `response_message` | `str` | Yes |  |
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
| `allow_multiple_order` | `bool` | No |  |
| `app_form_name` | `str` | No |  |
| `contract_needed` | `bool` | No |  |
| `credentials_needed` | `bool` | No |  |
| `description_key` | `str` | No |  |
| `name_key` | `str` | No |  |
| `prescreening_allowed` | `bool` | No |  |
| `product_name` | `str` | No |  |
| `product_status` | `str` | No |  |
| `product_uuid` | `str` | Yes |  |
| `response_code` | `int` | Yes |  |
| `response_message` | `str` | Yes |  |
| `vendor_name` | `str` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.OutputUpdateProduct().create({
    "product_uuid": "example_product_uuid",  # str
    "response_code": 1,  # int
    "response_message": "example_response_message",  # str
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

