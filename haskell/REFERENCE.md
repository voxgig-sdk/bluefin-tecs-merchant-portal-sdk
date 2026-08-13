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

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

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
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
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

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

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
| `productOrderUUID` | `String` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.merchant_portal_pam_contract_controller sdk VNoval
  d <- jo
    [ ("language", VStr "example_language")   -- String
    , ("productOrderUUID", VStr "example_productOrderUUID")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
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
| `appFormFieldDescUUID` | `String` | Yes |  |
| `packageOrderUUID` | `String` | No |  |
| `productOrderUUID` | `String` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.merchant_portal_pam_document_controller sdk VNoval
  d <- jo
    [ ("appFormFieldDescUUID", VStr "example_appFormFieldDescUUID")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
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
| `appFormFieldsDescUUID` | `String` | Yes |  |
| `filter` | `Value` | No |  |
| `language` | `String` | Yes |  |
| `packageOrder` | `Value` | No |  |
| `packageOrderUUID` | `String` | Yes |  |
| `packageUUID` | `String` | No |  |
| `productOrderUUID` | `String` | No |  |
| `productOrders` | `[Value]` | No |  |
| `reasonOfReopening` | `String` | Yes |  |

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

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.merchant_portal_pam_form_controller sdk VNoval
  d <- jo
    [ ("appFormFieldsDescUUID", VStr "example_appFormFieldsDescUUID")   -- String
    , ("language", VStr "example_language")   -- String
    , ("packageOrderUUID", VStr "example_packageOrderUUID")   -- String
    , ("reasonOfReopening", VStr "example_reasonOfReopening")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
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
| `clientSecret` | `String` | No |  |
| `mandatorName` | `String` | Yes |  |
| `notificationEmail` | `String` | No |  |
| `packageUUID` | `String` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.merchant_portal_pam_mandator_controller sdk VNoval
  d <- jo
    [ ("mandatorName", VStr "example_mandatorName")   -- String
    , ("packageUUID", VStr "example_packageUUID")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
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
| `businessRegistrationNumber` | `String` | Yes |  |
| `city` | `String` | No |  |
| `companyName` | `String` | Yes |  |
| `corporateUUID` | `String` | Yes |  |
| `country` | `String` | No |  |
| `currency` | `String` | Yes |  |
| `email` | `String` | Yes |  |
| `language` | `String` | Yes |  |
| `login` | `String` | Yes |  |
| `mandator` | `String` | Yes |  |
| `merchantContractNumber` | `String` | Yes |  |
| `merchantName` | `String` | No |  |
| `merchant_category_code` | `String` | No |  |
| `packageUUID` | `String` | No |  |
| `packageorderuuid` | `String` | Yes |  |
| `phoneNumber` | `String` | Yes |  |
| `postalCode` | `String` | No |  |
| `productid_acquirer` | `String` | Yes |  |
| `region` | `String` | No |  |
| `registrationNumber` | `String` | No |  |
| `signature` | `String` | No |  |
| `street` | `String` | No |  |
| `terminalIds` | `[Value]` | No |  |
| `terminalid_acquirer` | `String` | No |  |
| `vu_nummer` | `String` | Yes |  |

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

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.merchant_portal_pam_merchant_controller sdk VNoval
  d <- jo
    [ ("businessRegistrationNumber", VStr "example_businessRegistrationNumber")   -- String
    , ("companyName", VStr "example_companyName")   -- String
    , ("corporateUUID", VStr "example_corporateUUID")   -- String
    , ("currency", VStr "example_currency")   -- String
    , ("email", VStr "example_email")   -- String
    , ("language", VStr "example_language")   -- String
    , ("login", VStr "example_login")   -- String
    , ("mandator", VStr "example_mandator")   -- String
    , ("merchantContractNumber", VStr "example_merchantContractNumber")   -- String
    , ("packageorderuuid", VStr "example_packageorderuuid")   -- String
    , ("phoneNumber", VStr "example_phoneNumber")   -- String
    , ("productid_acquirer", VStr "example_productid_acquirer")   -- String
    , ("vu_nummer", VStr "example_vu_nummer")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
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
| `consumerUUID` | `String` | No |  |
| `corporateUUID` | `String` | No |  |
| `country` | `String` | No |  |
| `descriptionKey` | `String` | No |  |
| `filter` | `Value` | No |  |
| `language` | `String` | Yes |  |
| `nameKey` | `String` | No |  |
| `packageStatus` | `String` | No |  |
| `packageUUID` | `String` | Yes |  |
| `pagination` | `Value` | No |  |
| `sorting` | `Value` | No |  |

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

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.merchant_portal_pam_package_controller sdk VNoval
  d <- jo
    [ ("language", VStr "example_language")   -- String
    , ("packageUUID", VStr "example_packageUUID")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
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
| `consumerUUID` | `String` | No |  |
| `filter` | `Value` | No |  |
| `language` | `String` | No |  |
| `merchantID` | `String` | No |  |
| `packageOrderUUID` | `String` | Yes |  |
| `pagination` | `Value` | No |  |
| `productOrderUUID` | `String` | Yes |  |
| `productUUID` | `String` | Yes |  |
| `reason_decline` | `String` | Yes |  |
| `sorting` | `Value` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.merchant_portal_pam_product_controller sdk VNoval
  d <- jo
    [ ("packageOrderUUID", VStr "example_packageOrderUUID")   -- String
    , ("productOrderUUID", VStr "example_productOrderUUID")   -- String
    , ("productUUID", VStr "example_productUUID")   -- String
    , ("reason_decline", VStr "example_reason_decline")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
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
| `packageUUID` | `String` | Yes |  |
| `productUUIDs` | `[Value]` | Yes |  |
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.output_add_product sdk VNoval
  d <- jo
    [ ("packageUUID", VStr "example_packageUUID")   -- String
    , ("productUUIDs", VNoval)   -- [Value]
    , ("responseCode", VNum 1)   -- Int
    , ("responseMessage", VStr "example_responseMessage")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
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
| `acquirerId` | `String` | No |  |
| `allowMultipleOrders` | `Bool` | Yes |  |
| `appFormTemplateName` | `String` | Yes |  |
| `contractNeeded` | `Bool` | Yes |  |
| `credentialsNeeded` | `Bool` | No |  |
| `descriptionKey` | `String` | Yes |  |
| `nameKey` | `String` | Yes |  |
| `prescreeningAllowed` | `Bool` | Yes |  |
| `productName` | `String` | Yes |  |
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |
| `terminalTemplateName` | `String` | Yes |  |
| `vendorName` | `String` | Yes |  |
| `xmlTemplateFile` | `String` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.output_create_product sdk VNoval
  d <- jo
    [ ("allowMultipleOrders", VBool True)   -- Bool
    , ("appFormTemplateName", VStr "example_appFormTemplateName")   -- String
    , ("contractNeeded", VBool True)   -- Bool
    , ("descriptionKey", VStr "example_descriptionKey")   -- String
    , ("nameKey", VStr "example_nameKey")   -- String
    , ("prescreeningAllowed", VBool True)   -- Bool
    , ("productName", VStr "example_productName")   -- String
    , ("responseCode", VNum 1)   -- Int
    , ("responseMessage", VStr "example_responseMessage")   -- String
    , ("terminalTemplateName", VStr "example_terminalTemplateName")   -- String
    , ("vendorName", VStr "example_vendorName")   -- String
    , ("xmlTemplateFile", VStr "example_xmlTemplateFile")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
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
| `batch` | `Value` | No |  |
| `lines` | `Value` | No |  |
| `progress` | `Value` | No |  |

### Operations

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

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
| `items` | `[Value]` | No |  |
| `pagination` | `Value` | Yes |  |
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |
| `sorting` | `Value` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `items` | - |
| `pagination` | Yes |
| `responseCode` | - |
| `responseMessage` | - |
| `sorting` | - |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.output_list sdk VNoval
  d <- jo
    [ ("pagination", VNoval)   -- Value
    , ("responseCode", VNum 1)   -- Int
    , ("responseMessage", VStr "example_responseMessage")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
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
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |

### Operations

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

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
| `productOrderUUIDs` | `[Value]` | Yes |  |
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |
| `targetPackageOrderUUID` | `String` | Yes |  |
| `targetProductOrderUUID` | `String` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.output_move_tid sdk VNoval
  d <- jo
    [ ("productOrderUUIDs", VNoval)   -- [Value]
    , ("responseCode", VNum 1)   -- Int
    , ("responseMessage", VStr "example_responseMessage")   -- String
    , ("targetPackageOrderUUID", VStr "example_targetPackageOrderUUID")   -- String
    , ("targetProductOrderUUID", VStr "example_targetProductOrderUUID")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
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
| `packageUUID` | `String` | Yes |  |
| `productUUIDs` | `[Value]` | Yes |  |
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.output_remove_product sdk VNoval
  d <- jo
    [ ("packageUUID", VStr "example_packageUUID")   -- String
    , ("productUUIDs", VNoval)   -- [Value]
    , ("responseCode", VNum 1)   -- Int
    , ("responseMessage", VStr "example_responseMessage")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
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
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.output_start sdk VNoval
  d <- jo
    [ ("responseCode", VNum 1)   -- Int
    , ("responseMessage", VStr "example_responseMessage")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
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
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |
| `status` | `String` | No |  |

### Operations

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

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
| `allowMultipleOrders` | `Bool` | No |  |
| `appFormName` | `String` | No |  |
| `contractNeeded` | `Bool` | No |  |
| `credentialsNeeded` | `Bool` | No |  |
| `descriptionKey` | `String` | No |  |
| `nameKey` | `String` | No |  |
| `prescreeningAllowed` | `Bool` | No |  |
| `productName` | `String` | No |  |
| `productStatus` | `String` | No |  |
| `productUUID` | `String` | Yes |  |
| `responseCode` | `Int` | Yes |  |
| `responseMessage` | `String` | Yes |  |
| `vendorName` | `String` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.output_update_product sdk VNoval
  d <- jo
    [ ("productUUID", VStr "example_productUUID")   -- String
    , ("responseCode", VNum 1)   -- Int
    , ("responseMessage", VStr "example_responseMessage")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
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

