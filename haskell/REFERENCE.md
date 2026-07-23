# BluefinTecsMerchantPortal Haskell SDK Reference

Complete API reference for the BluefinTecsMerchantPortal Haskell SDK.


## Client

### Constructors

```haskell
import qualified SdkClient as Sdk
import VoxgigStruct (Value (..))
import SdkHelpers (jo)

makeClient :: IO Sdk.Client
makeClient = do
  opts <- jo [("base", VStr "https://api.example.com")]
  Sdk.newSdk opts
```

Construct a live SDK client.

**Functions:**

| Function | Signature | Description |
| --- | --- | --- |
| `newSdk` | `Value -> IO Client` | Construct a client from an options map. |
| `newSdk0` | `IO Client` | Construct a client with defaults. |

**Options (map keys):**

| Key | Type | Description |
| --- | --- | --- |
| `base` | `String` | Base URL for API requests. |
| `prefix` | `String` | URL prefix appended after base. |
| `suffix` | `String` | URL suffix appended after path. |
| `headers` | `Value` | Custom headers for all requests. |
| `feature` | `Value` | Feature configuration. |
| `system` | `Value` | System overrides (e.g. custom fetch). |


### Test constructors

```haskell
client <- Sdk.testSdk0
```

`testSdk :: Value -> Value -> IO Client` constructs a test client with mock
features active (`testSdk0 :: IO Client` for the no-argument form). Pass
`VNoval` for defaults.


### Entity accessors

#### `merchant_portal_api_controller :: Client -> Value -> IO Entity`

Construct a `MerchantPortalApiController` entity bound to the client. Pass `VNoval` for no initial options.

#### `merchant_portal_common_controller :: Client -> Value -> IO Entity`

Construct a `MerchantPortalCommonController` entity bound to the client. Pass `VNoval` for no initial options.

#### `merchant_portal_pam_contract_controller :: Client -> Value -> IO Entity`

Construct a `MerchantPortalPamContractController` entity bound to the client. Pass `VNoval` for no initial options.

#### `merchant_portal_pam_document_controller :: Client -> Value -> IO Entity`

Construct a `MerchantPortalPamDocumentController` entity bound to the client. Pass `VNoval` for no initial options.

#### `merchant_portal_pam_form_controller :: Client -> Value -> IO Entity`

Construct a `MerchantPortalPamFormController` entity bound to the client. Pass `VNoval` for no initial options.

#### `merchant_portal_pam_mandator_controller :: Client -> Value -> IO Entity`

Construct a `MerchantPortalPamMandatorController` entity bound to the client. Pass `VNoval` for no initial options.

#### `merchant_portal_pam_merchant_controller :: Client -> Value -> IO Entity`

Construct a `MerchantPortalPamMerchantController` entity bound to the client. Pass `VNoval` for no initial options.

#### `merchant_portal_pam_package_controller :: Client -> Value -> IO Entity`

Construct a `MerchantPortalPamPackageController` entity bound to the client. Pass `VNoval` for no initial options.

#### `merchant_portal_pam_product_controller :: Client -> Value -> IO Entity`

Construct a `MerchantPortalPamProductController` entity bound to the client. Pass `VNoval` for no initial options.

#### `output_add_product :: Client -> Value -> IO Entity`

Construct a `OutputAddProduct` entity bound to the client. Pass `VNoval` for no initial options.

#### `output_create_product :: Client -> Value -> IO Entity`

Construct a `OutputCreateProduct` entity bound to the client. Pass `VNoval` for no initial options.

#### `output_detail :: Client -> Value -> IO Entity`

Construct a `OutputDetail` entity bound to the client. Pass `VNoval` for no initial options.

#### `output_list :: Client -> Value -> IO Entity`

Construct a `OutputList` entity bound to the client. Pass `VNoval` for no initial options.

#### `output_message :: Client -> Value -> IO Entity`

Construct a `OutputMessage` entity bound to the client. Pass `VNoval` for no initial options.

#### `output_move_tid :: Client -> Value -> IO Entity`

Construct a `OutputMoveTid` entity bound to the client. Pass `VNoval` for no initial options.

#### `output_remove_product :: Client -> Value -> IO Entity`

Construct a `OutputRemoveProduct` entity bound to the client. Pass `VNoval` for no initial options.

#### `output_start :: Client -> Value -> IO Entity`

Construct a `OutputStart` entity bound to the client. Pass `VNoval` for no initial options.

#### `output_status :: Client -> Value -> IO Entity`

Construct a `OutputStatus` entity bound to the client. Pass `VNoval` for no initial options.

#### `output_update_product :: Client -> Value -> IO Entity`

Construct a `OutputUpdateProduct` entity bound to the client. Pass `VNoval` for no initial options.

### HTTP escape hatches

#### `direct :: Client -> Value -> IO Value` (module `SdkFeatures`)

Make a direct HTTP request to any API endpoint. Returns a result `Value` with
`ok`, `status`, `headers`, and `data` (or `err` on failure). This escape
hatch never raises — branch on `getp result "ok"`.

**Argument (map keys):**

| Key | Type | Description |
| --- | --- | --- |
| `path` | `String` | URL path with optional `{param}` placeholders. |
| `method` | `String` | HTTP method (default: `"GET"`). |
| `params` | `Value` | Path parameter values. |
| `query` | `Value` | Query string parameters. |
| `headers` | `Value` | Request headers (merged with defaults). |
| `body` | `Value` | Request body (maps are JSON-serialized). |

#### `prepare :: Client -> Value -> IO Value` (module `SdkFeatures`)

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## MerchantPortalApiController

```haskell
  ent <- Sdk.merchant_portal_api_controller sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_number` | `Int` | No |  |
| `additional_data` | `Value` | No |  |
| `business_reg_number` | `String` | Yes |  |
| `city` | `String` | Yes |  |
| `corporateuuid` | `String` | No |  |
| `country` | `String` | Yes |  |
| `currency` | `String` | Yes |  |
| `merchant_category_code` | `Int` | Yes |  |
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
| `sorting_code` | `Int` | No |  |
| `state` | `String` | No |  |
| `street` | `String` | Yes |  |
| `terminal_country_code` | `String` | Yes |  |
| `terminal_language_code` | `String` | Yes |  |
| `terminal_location` | `String` | Yes |  |
| `terminal_serial_number` | `String` | Yes |  |
| `terminalid` | `Int` | Yes |  |
| `terminalid_acquirer` | `String` | No |  |
| `user_email` | `String` | No |  |
| `user_phone_number` | `String` | No |  |
| `username` | `String` | No |  |
| `vu_nummer` | `String` | Yes |  |
| `web_shop_url` | `String` | No |  |
| `zipcode` | `String` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.merchant_portal_api_controller sdk VNoval
  d <- jo
    [ ("business_reg_number", VStr "example_business_reg_number")   -- String
    , ("city", VStr "example_city")   -- String
    , ("country", VStr "example_country")   -- String
    , ("currency", VStr "example_currency")   -- String
    , ("merchant_category_code", VNum 1)   -- Int
    , ("merchant_name", VStr "example_merchant_name")   -- String
    , ("packageid", VStr "example_packageid")   -- String
    , ("packageorderuuid", VStr "example_packageorderuuid")   -- String
    , ("reason_deactivation", VStr "example_reason_deactivation")   -- String
    , ("reason_reactivation", VStr "example_reason_reactivation")   -- String
    , ("street", VStr "example_street")   -- String
    , ("terminal_country_code", VStr "example_terminal_country_code")   -- String
    , ("terminal_language_code", VStr "example_terminal_language_code")   -- String
    , ("terminal_location", VStr "example_terminal_location")   -- String
    , ("terminal_serial_number", VStr "example_terminal_serial_number")   -- String
    , ("terminalid", VNum 1)   -- Int
    , ("vu_nummer", VStr "example_vu_nummer")   -- String
    , ("zipcode", VStr "example_zipcode")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `MerchantPortalApiController` entity with the same options.

#### `eName :: String`

The entity name.


---

## MerchantPortalCommonController

```haskell
  ent <- Sdk.merchant_portal_common_controller sdk VNoval
```

### Operations

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```haskell
  ent <- Sdk.merchant_portal_common_controller sdk VNoval
  match <- jo []
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `MerchantPortalCommonController` entity with the same options.

#### `eName :: String`

The entity name.


---

## MerchantPortalPamContractController

```haskell
  ent <- Sdk.merchant_portal_pam_contract_controller sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `language` | `String` | Yes |  |
| `product_order_uuid` | `String` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.merchant_portal_pam_contract_controller sdk VNoval
  d <- jo
    [ ("language", VStr "example_language")   -- String
    , ("product_order_uuid", VStr "example_product_order_uuid")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `MerchantPortalPamContractController` entity with the same options.

#### `eName :: String`

The entity name.


---

## MerchantPortalPamDocumentController

```haskell
  ent <- Sdk.merchant_portal_pam_document_controller sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_field_desc_uuid` | `String` | Yes |  |
| `package_order_uuid` | `String` | No |  |
| `product_order_uuid` | `String` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.merchant_portal_pam_document_controller sdk VNoval
  d <- jo
    [ ("app_form_field_desc_uuid", VStr "example_app_form_field_desc_uuid")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `MerchantPortalPamDocumentController` entity with the same options.

#### `eName :: String`

The entity name.


---

## MerchantPortalPamFormController

```haskell
  ent <- Sdk.merchant_portal_pam_form_controller sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_form_fields_desc_uuid` | `String` | Yes |  |
| `filter` | `Value` | No |  |
| `language` | `String` | Yes |  |
| `package_order` | `Value` | No |  |
| `package_order_uuid` | `String` | Yes |  |
| `package_uuid` | `String` | No |  |
| `product_order` | `[Value]` | No |  |
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

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.merchant_portal_pam_form_controller sdk VNoval
  d <- jo
    [ ("app_form_fields_desc_uuid", VStr "example_app_form_fields_desc_uuid")   -- String
    , ("language", VStr "example_language")   -- String
    , ("package_order_uuid", VStr "example_package_order_uuid")   -- String
    , ("reason_of_reopening", VStr "example_reason_of_reopening")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `MerchantPortalPamFormController` entity with the same options.

#### `eName :: String`

The entity name.


---

## MerchantPortalPamMandatorController

```haskell
  ent <- Sdk.merchant_portal_pam_mandator_controller sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client_secret` | `String` | No |  |
| `mandator_name` | `String` | Yes |  |
| `notification_email` | `String` | No |  |
| `package_uuid` | `String` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.merchant_portal_pam_mandator_controller sdk VNoval
  d <- jo
    [ ("mandator_name", VStr "example_mandator_name")   -- String
    , ("package_uuid", VStr "example_package_uuid")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `MerchantPortalPamMandatorController` entity with the same options.

#### `eName :: String`

The entity name.


---

## MerchantPortalPamMerchantController

```haskell
  ent <- Sdk.merchant_portal_pam_merchant_controller sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `additional_data` | `Value` | No |  |
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
| `terminal_id` | `[Value]` | No |  |
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

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.merchant_portal_pam_merchant_controller sdk VNoval
  d <- jo
    [ ("business_registration_number", VStr "example_business_registration_number")   -- String
    , ("company_name", VStr "example_company_name")   -- String
    , ("corporate_uuid", VStr "example_corporate_uuid")   -- String
    , ("currency", VStr "example_currency")   -- String
    , ("email", VStr "example_email")   -- String
    , ("language", VStr "example_language")   -- String
    , ("login", VStr "example_login")   -- String
    , ("mandator", VStr "example_mandator")   -- String
    , ("merchant_contract_number", VStr "example_merchant_contract_number")   -- String
    , ("packageorderuuid", VStr "example_packageorderuuid")   -- String
    , ("phone_number", VStr "example_phone_number")   -- String
    , ("productid_acquirer", VStr "example_productid_acquirer")   -- String
    , ("vu_nummer", VStr "example_vu_nummer")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `MerchantPortalPamMerchantController` entity with the same options.

#### `eName :: String`

The entity name.


---

## MerchantPortalPamPackageController

```haskell
  ent <- Sdk.merchant_portal_pam_package_controller sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `String` | No |  |
| `corporate_uuid` | `String` | No |  |
| `country` | `String` | No |  |
| `description_key` | `String` | No |  |
| `filter` | `Value` | No |  |
| `language` | `String` | Yes |  |
| `name_key` | `String` | No |  |
| `package_status` | `String` | No |  |
| `package_uuid` | `String` | Yes |  |
| `pagination` | `Value` | No |  |
| `sorting` | `Value` | No |  |

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

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.merchant_portal_pam_package_controller sdk VNoval
  d <- jo
    [ ("language", VStr "example_language")   -- String
    , ("package_uuid", VStr "example_package_uuid")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `MerchantPortalPamPackageController` entity with the same options.

#### `eName :: String`

The entity name.


---

## MerchantPortalPamProductController

```haskell
  ent <- Sdk.merchant_portal_pam_product_controller sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `consumer_uuid` | `String` | No |  |
| `filter` | `Value` | No |  |
| `language` | `String` | No |  |
| `merchant_id` | `String` | No |  |
| `package_order_uuid` | `String` | Yes |  |
| `pagination` | `Value` | No |  |
| `product_order_uuid` | `String` | Yes |  |
| `product_uuid` | `String` | Yes |  |
| `reason_decline` | `String` | Yes |  |
| `sorting` | `Value` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.merchant_portal_pam_product_controller sdk VNoval
  d <- jo
    [ ("package_order_uuid", VStr "example_package_order_uuid")   -- String
    , ("product_order_uuid", VStr "example_product_order_uuid")   -- String
    , ("product_uuid", VStr "example_product_uuid")   -- String
    , ("reason_decline", VStr "example_reason_decline")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `MerchantPortalPamProductController` entity with the same options.

#### `eName :: String`

The entity name.


---

## OutputAddProduct

```haskell
  ent <- Sdk.output_add_product sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `String` | Yes |  |
| `product_uui_d` | `[Value]` | Yes |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.output_add_product sdk VNoval
  d <- jo
    [ ("package_uuid", VStr "example_package_uuid")   -- String
    , ("product_uui_d", VNoval)   -- [Value]
    , ("response_code", VNum 1)   -- Int
    , ("response_message", VStr "example_response_message")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `OutputAddProduct` entity with the same options.

#### `eName :: String`

The entity name.


---

## OutputCreateProduct

```haskell
  ent <- Sdk.output_create_product sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acquirer_id` | `String` | No |  |
| `allow_multiple_order` | `Bool` | Yes |  |
| `app_form_template_name` | `String` | Yes |  |
| `contract_needed` | `Bool` | Yes |  |
| `credentials_needed` | `Bool` | No |  |
| `description_key` | `String` | Yes |  |
| `name_key` | `String` | Yes |  |
| `prescreening_allowed` | `Bool` | Yes |  |
| `product_name` | `String` | Yes |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |
| `terminal_template_name` | `String` | Yes |  |
| `vendor_name` | `String` | Yes |  |
| `xml_template_file` | `String` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.output_create_product sdk VNoval
  d <- jo
    [ ("allow_multiple_order", VBool True)   -- Bool
    , ("app_form_template_name", VStr "example_app_form_template_name")   -- String
    , ("contract_needed", VBool True)   -- Bool
    , ("description_key", VStr "example_description_key")   -- String
    , ("name_key", VStr "example_name_key")   -- String
    , ("prescreening_allowed", VBool True)   -- Bool
    , ("product_name", VStr "example_product_name")   -- String
    , ("response_code", VNum 1)   -- Int
    , ("response_message", VStr "example_response_message")   -- String
    , ("terminal_template_name", VStr "example_terminal_template_name")   -- String
    , ("vendor_name", VStr "example_vendor_name")   -- String
    , ("xml_template_file", VStr "example_xml_template_file")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `OutputCreateProduct` entity with the same options.

#### `eName :: String`

The entity name.


---

## OutputDetail

```haskell
  ent <- Sdk.output_detail sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `detail` | `Value` | No |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```haskell
  ent <- Sdk.output_detail sdk VNoval
  match <- jo [("id", VStr "output_detail_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `OutputDetail` entity with the same options.

#### `eName :: String`

The entity name.


---

## OutputList

```haskell
  ent <- Sdk.output_list sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `item` | `[Value]` | No |  |
| `pagination` | `Value` | Yes |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |
| `sorting` | `Value` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `item` | - |
| `pagination` | Yes |
| `response_code` | - |
| `response_message` | - |
| `sorting` | - |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.output_list sdk VNoval
  d <- jo
    [ ("pagination", VNoval)   -- Value
    , ("response_code", VNum 1)   -- Int
    , ("response_message", VStr "example_response_message")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `OutputList` entity with the same options.

#### `eName :: String`

The entity name.


---

## OutputMessage

```haskell
  ent <- Sdk.output_message sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```haskell
  ent <- Sdk.output_message sdk VNoval
  match <- jo [("id", VStr "output_message_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `OutputMessage` entity with the same options.

#### `eName :: String`

The entity name.


---

## OutputMoveTid

```haskell
  ent <- Sdk.output_move_tid sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `product_order_uui_d` | `[Value]` | Yes |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |
| `target_package_order_uuid` | `String` | Yes |  |
| `target_product_order_uuid` | `String` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.output_move_tid sdk VNoval
  d <- jo
    [ ("product_order_uui_d", VNoval)   -- [Value]
    , ("response_code", VNum 1)   -- Int
    , ("response_message", VStr "example_response_message")   -- String
    , ("target_package_order_uuid", VStr "example_target_package_order_uuid")   -- String
    , ("target_product_order_uuid", VStr "example_target_product_order_uuid")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `OutputMoveTid` entity with the same options.

#### `eName :: String`

The entity name.


---

## OutputRemoveProduct

```haskell
  ent <- Sdk.output_remove_product sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `package_uuid` | `String` | Yes |  |
| `product_uui_d` | `[Value]` | Yes |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.output_remove_product sdk VNoval
  d <- jo
    [ ("package_uuid", VStr "example_package_uuid")   -- String
    , ("product_uui_d", VNoval)   -- [Value]
    , ("response_code", VNum 1)   -- Int
    , ("response_message", VStr "example_response_message")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `OutputRemoveProduct` entity with the same options.

#### `eName :: String`

The entity name.


---

## OutputStart

```haskell
  ent <- Sdk.output_start sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `String` | No |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.output_start sdk VNoval
  d <- jo
    [ ("response_code", VNum 1)   -- Int
    , ("response_message", VStr "example_response_message")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `OutputStart` entity with the same options.

#### `eName :: String`

The entity name.


---

## OutputStatus

```haskell
  ent <- Sdk.output_status sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `percentage` | `Int` | No |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |
| `status` | `String` | No |  |

### Operations

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```haskell
  ent <- Sdk.output_status sdk VNoval
  match <- jo [("id", VStr "output_status_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `OutputStatus` entity with the same options.

#### `eName :: String`

The entity name.


---

## OutputUpdateProduct

```haskell
  ent <- Sdk.output_update_product sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `allow_multiple_order` | `Bool` | No |  |
| `app_form_name` | `String` | No |  |
| `contract_needed` | `Bool` | No |  |
| `credentials_needed` | `Bool` | No |  |
| `description_key` | `String` | No |  |
| `name_key` | `String` | No |  |
| `prescreening_allowed` | `Bool` | No |  |
| `product_name` | `String` | No |  |
| `product_status` | `String` | No |  |
| `product_uuid` | `String` | Yes |  |
| `response_code` | `Int` | Yes |  |
| `response_message` | `String` | Yes |  |
| `vendor_name` | `String` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.output_update_product sdk VNoval
  d <- jo
    [ ("product_uuid", VStr "example_product_uuid")   -- String
    , ("response_code", VNum 1)   -- Int
    , ("response_message", VStr "example_response_message")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `OutputUpdateProduct` entity with the same options.

#### `eName :: String`

The entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```haskell
  active <- jo [("active", VBool True)]
  featureCfg <- jo
    [ ("test", active)
    ]
  opts <- jo [("feature", featureCfg)]
  client <- Sdk.newSdk opts
```

