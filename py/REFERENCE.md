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
| `account_number` | `int` | No | Account number provided by the acquirer. |
| `additional_data` | `dict` | No | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `str` | Yes | Merchant business registration number as stated in the company registry. |
| `city` | `str` | Yes | Merchant's address: city. |
| `corporateuuid` | `str` | No | Unique identifier for the corporate entity (UUID format). |
| `country` | `str` | Yes | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `str` | Yes | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `int` | Yes | Merchant category code as defined by the payment network. |
| `merchant_email` | `str` | No | Merchant's email address for receiving notifications. |
| `merchant_name` | `str` | Yes | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | `str` | No | Merchant's phone number for notifications. |
| `packageid` | `str` | Yes | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | `str` | Yes | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | `str` | No | Merchant password for MPOS. |
| `productid` | `str` | No | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | `str` | No | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | `str` | Yes | Reason for terminal deactivation. |
| `reason_reactivation` | `str` | Yes | Reason for terminal reactivation. |
| `sorting_code` | `int` | No | Sorting code provided by the acquirer. |
| `state` | `str` | No | Merchant's address: state. |
| `street` | `str` | Yes | Merchant's address: street and house number. |
| `terminal_country_code` | `str` | Yes | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `str` | Yes | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `str` | Yes | Physical or logical location of the terminal. |
| `terminal_serial_number` | `str` | Yes | Terminal serial number. |
| `terminalid` | `int` | Yes | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `str` | No | Terminal ID as set by the acquirer (optional). |
| `user_email` | `str` | No | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `str` | No | Phone number of the user acting on behalf of the merchant. |
| `username` | `str` | No | Merchant username for MPOS. |
| `vu_nummer` | `str` | Yes | Merchant contract number with the acquirer. |
| `web_shop_url` | `str` | No | URL of the merchant's web shop. |
| `zipcode` | `str` | Yes | Merchant's address: postal code. |

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
| `packageOrderUUID` | `str` | No | UUID of the package order. |
| `productOrderUUID` | `str` | No | UUID of the product order. |

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
| `packageOrderUUID` | `str` | Yes | UUID of the package order. |
| `packageUUID` | `str` | No |  |
| `productOrderUUID` | `str` | No | UUID of the product order. |
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
| `additional_data` | `dict` | No | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` | `str` | Yes |  |
| `city` | `str` | No | City where the merchant is located. |
| `companyName` | `str` | Yes |  |
| `corporateUUID` | `str` | Yes | Unique identifier for the corporate entity. |
| `country` | `str` | No | Country where the merchant is located. |
| `currency` | `str` | Yes | Transaction currency in ISO 4217 format. |
| `email` | `str` | Yes |  |
| `language` | `str` | Yes |  |
| `login` | `str` | Yes |  |
| `mandator` | `str` | Yes | Mandator name assigned by TECS. |
| `merchantContractNumber` | `str` | Yes | Unique identifier for the merchant within a specific system. |
| `merchantName` | `str` | No | Name of the merchant. |
| `merchant_category_code` | `str` | No | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | `str` | No | UUID of the package. |
| `packageorderuuid` | `str` | Yes | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` | `str` | Yes |  |
| `postalCode` | `str` | No | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | `str` | Yes | Identifier of the product for which acquiring is to be enabled. |
| `region` | `str` | No | State or province where the merchant is located. |
| `registrationNumber` | `str` | No | Business registration number. |
| `signature` | `str` | No | Signature value = saltAsHex-hashAsHex. |
| `street` | `str` | No | Street address of the merchant. |
| `terminalIds` | `list` | No | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `str` | No | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `str` | Yes | Merchant contract number with the acquirer. |

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
| `country` | `str` | No | Country associated with the package. |
| `descriptionKey` | `str` | No | Key for the description of the package. |
| `filter` | `dict` | No |  |
| `language` | `str` | Yes |  |
| `nameKey` | `str` | No | Key for the name of the package. |
| `packageStatus` | `str` | No | Status of the package. |
| `packageUUID` | `str` | Yes | Unique identifier for the package. |
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
| `reason_decline` | `str` | Yes | Reason for product decline. |
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
| `packageUUID` | `str` | Yes | Unique identifier for the package. |
| `productUUIDs` | `list` | Yes | The list of unique identifiers of the products. |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `str` | Yes | Response message. |

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
| `acquirerId` | `str` | No | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `bool` | Yes | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `str` | Yes | Name of the application form template. |
| `contractNeeded` | `bool` | Yes | Indication whether contract is needed or not. |
| `credentialsNeeded` | `bool` | No | Indication whether credentials are needed or not. |
| `descriptionKey` | `str` | Yes | Key indicator for product description. |
| `nameKey` | `str` | Yes | Key indicator for product name. |
| `prescreeningAllowed` | `bool` | Yes | Indication whether prescreening is allowed or not. |
| `productName` | `str` | Yes | Name of the product. |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `str` | Yes | Response message. |
| `terminalTemplateName` | `str` | Yes | Name of the terminal template. |
| `vendorName` | `str` | Yes | Name of the vendor. |
| `xmlTemplateFile` | `str` | Yes | A string value containing the XML template file encoded in Base64. |

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
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `str` | Yes | Response message. |
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
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `str` | Yes | Response message. |

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
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `str` | Yes | Response message. |
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
| `packageUUID` | `str` | Yes | Unique identifier for the package. |
| `productUUIDs` | `list` | Yes | List of product unique identifiers. |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `str` | Yes | Response message. |

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
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `str` | Yes | Response message. |

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
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `str` | Yes | Response message. |
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
| `allowMultipleOrders` | `bool` | No | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `str` | No | The name of the application form |
| `contractNeeded` | `bool` | No | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `bool` | No | An attribute to indicate if credentials are needed |
| `descriptionKey` | `str` | No | The description of the product |
| `nameKey` | `str` | No | The key of the product name |
| `prescreeningAllowed` | `bool` | No | An attribute to indicate if prescreening is allowed |
| `productName` | `str` | No | The name of the product |
| `productStatus` | `str` | No | The status of the product |
| `productUUID` | `str` | Yes | The UUID of the product to update |
| `responseCode` | `int` | Yes | Response code. |
| `responseMessage` | `str` | Yes | Response message. |
| `vendorName` | `str` | No | The name of the vendor |

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

