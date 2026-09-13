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
| `account_number` | `Int` | No | Account number provided by the acquirer. |
| `additional_data` | `Value` | No | Arbitrary merchant-specific data related to terminal registration. |
| `business_reg_number` | `String` | Yes | Merchant business registration number as stated in the company registry. |
| `city` | `String` | Yes | Merchant's address: city. |
| `corporateuuid` | `String` | No | Unique identifier for the corporate entity (UUID format). |
| `country` | `String` | Yes | Merchant's address: country (must be in 'ISO-3166 ALPHA-3' format). |
| `currency` | `String` | Yes | Transaction currency (must be in "ISO 4217" format). |
| `merchant_category_code` | `Int` | Yes | Merchant category code as defined by the payment network. |
| `merchant_email` | `String` | No | Merchant's email address for receiving notifications. |
| `merchant_name` | `String` | Yes | The officially incorporated company name of the merchant. |
| `merchant_phone_number` | `String` | No | Merchant's phone number for notifications. |
| `packageid` | `String` | Yes | Identifier of the package in the TECS processing engine provided by TECS. |
| `packageorderuuid` | `String` | Yes | Identifier of the registered merchant in the TECS system, provided in the response of the registerNewMerchant call. |
| `password` | `String` | No | Merchant password for MPOS. |
| `productid` | `String` | No | Identifier of the product for which terminal registration is to be performed. |
| `productid_acquirer` | `String` | No | Identifier of the product for which acquiring is enabled. |
| `reason_deactivation` | `String` | Yes | Reason for terminal deactivation. |
| `reason_reactivation` | `String` | Yes | Reason for terminal reactivation. |
| `sorting_code` | `Int` | No | Sorting code provided by the acquirer. |
| `state` | `String` | No | Merchant's address: state. |
| `street` | `String` | Yes | Merchant's address: street and house number. |
| `terminal_country_code` | `String` | Yes | Terminal country code (must be in 'ISO-3166 ALPHA-3' format). |
| `terminal_language_code` | `String` | Yes | Terminal language code (must be in 'ISO 639-1' format). |
| `terminal_location` | `String` | Yes | Physical or logical location of the terminal. |
| `terminal_serial_number` | `String` | Yes | Terminal serial number. |
| `terminalid` | `Int` | Yes | TECS terminalid given by Tecs processing engine. |
| `terminalid_acquirer` | `String` | No | Terminal ID as set by the acquirer (optional). |
| `user_email` | `String` | No | Email address of the user acting on behalf of the merchant. |
| `user_phone_number` | `String` | No | Phone number of the user acting on behalf of the merchant. |
| `username` | `String` | No | Merchant username for MPOS. |
| `vu_nummer` | `String` | Yes | Merchant contract number with the acquirer. |
| `web_shop_url` | `String` | No | URL of the merchant's web shop. |
| `zipcode` | `String` | Yes | Merchant's address: postal code. |

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
| `packageOrderUUID` | `String` | No | UUID of the package order. |
| `productOrderUUID` | `String` | No | UUID of the product order. |

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
| `packageOrderUUID` | `String` | Yes | UUID of the package order. |
| `packageUUID` | `String` | No |  |
| `productOrderUUID` | `String` | No | UUID of the product order. |
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
| `additional_data` | `Value` | No | Optional additional merchant-specific data related to enabling acquiring. |
| `businessRegistrationNumber` | `String` | Yes |  |
| `city` | `String` | No | City where the merchant is located. |
| `companyName` | `String` | Yes |  |
| `corporateUUID` | `String` | Yes | Unique identifier for the corporate entity. |
| `country` | `String` | No | Country where the merchant is located. |
| `currency` | `String` | Yes | Transaction currency in ISO 4217 format. |
| `email` | `String` | Yes |  |
| `language` | `String` | Yes |  |
| `login` | `String` | Yes |  |
| `mandator` | `String` | Yes | Mandator name assigned by TECS. |
| `merchantContractNumber` | `String` | Yes | Unique identifier for the merchant within a specific system. |
| `merchantName` | `String` | No | Name of the merchant. |
| `merchant_category_code` | `String` | No | Merchant Category Code (MCC) describing the merchant’s type of business. |
| `packageUUID` | `String` | No | UUID of the package. |
| `packageorderuuid` | `String` | Yes | Unique identifier for the registered merchant in the TECS system. |
| `phoneNumber` | `String` | Yes |  |
| `postalCode` | `String` | No | Postal or ZIP code of the merchant’s location. |
| `productid_acquirer` | `String` | Yes | Identifier of the product for which acquiring is to be enabled. |
| `region` | `String` | No | State or province where the merchant is located. |
| `registrationNumber` | `String` | No | Business registration number. |
| `signature` | `String` | No | Signature value = saltAsHex-hashAsHex. |
| `street` | `String` | No | Street address of the merchant. |
| `terminalIds` | `[Value]` | No | Optional list of terminal IDs for which acquiring should be activated. |
| `terminalid_acquirer` | `String` | No | Optional terminal ID provided by the acquirer. |
| `vu_nummer` | `String` | Yes | Merchant contract number with the acquirer. |

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
| `country` | `String` | No | Country associated with the package. |
| `descriptionKey` | `String` | No | Key for the description of the package. |
| `filter` | `Value` | No |  |
| `language` | `String` | Yes |  |
| `nameKey` | `String` | No | Key for the name of the package. |
| `packageStatus` | `String` | No | Status of the package. |
| `packageUUID` | `String` | Yes | Unique identifier for the package. |
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
| `reason_decline` | `String` | Yes | Reason for product decline. |
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
| `packageUUID` | `String` | Yes | Unique identifier for the package. |
| `productUUIDs` | `[Value]` | Yes | The list of unique identifiers of the products. |
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

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
| `acquirerId` | `String` | No | Unique identifier for the acquirer. |
| `allowMultipleOrders` | `Bool` | Yes | Indication whether multiple orders are allowed or not. |
| `appFormTemplateName` | `String` | Yes | Name of the application form template. |
| `contractNeeded` | `Bool` | Yes | Indication whether contract is needed or not. |
| `credentialsNeeded` | `Bool` | No | Indication whether credentials are needed or not. |
| `descriptionKey` | `String` | Yes | Key indicator for product description. |
| `nameKey` | `String` | Yes | Key indicator for product name. |
| `prescreeningAllowed` | `Bool` | Yes | Indication whether prescreening is allowed or not. |
| `productName` | `String` | Yes | Name of the product. |
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `terminalTemplateName` | `String` | Yes | Name of the terminal template. |
| `vendorName` | `String` | Yes | Name of the vendor. |
| `xmlTemplateFile` | `String` | Yes | A string value containing the XML template file encoded in Base64. |

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
| `id` | `String` | No |  |
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
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
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
| `id` | `String` | No |  |
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

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
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
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
| `packageUUID` | `String` | Yes | Unique identifier for the package. |
| `productUUIDs` | `[Value]` | Yes | List of product unique identifiers. |
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

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
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |

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
| `id` | `String` | No |  |
| `percentage` | `Int` | No |  |
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
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
| `allowMultipleOrders` | `Bool` | No | An attribute to indicate if multiple orders are allowed |
| `appFormName` | `String` | No | The name of the application form |
| `contractNeeded` | `Bool` | No | An attribute to indicate if a contract is needed |
| `credentialsNeeded` | `Bool` | No | An attribute to indicate if credentials are needed |
| `descriptionKey` | `String` | No | The description of the product |
| `nameKey` | `String` | No | The key of the product name |
| `prescreeningAllowed` | `Bool` | No | An attribute to indicate if prescreening is allowed |
| `productName` | `String` | No | The name of the product |
| `productStatus` | `String` | No | The status of the product |
| `productUUID` | `String` | Yes | The UUID of the product to update |
| `responseCode` | `Int` | Yes | Response code. |
| `responseMessage` | `String` | Yes | Response message. |
| `vendorName` | `String` | No | The name of the vendor |

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
| `audit` | 0.0.1 | Structured audit trail of operations |
| `clienttrack` | 0.0.1 | Client identity and per-request correlation headers |
| `idempotency` | 0.0.1 | Idempotency keys for safe retries of mutating operations |
| `log` | 0.0.1 | Structured request and response logging |
| `metrics` | 0.0.1 | Statistics capture: per-operation counters and latency |
| `paging` | 0.0.1 | Pagination signals for list operations |
| `ratelimit` | 0.0.1 | Client-side rate limiting via a token bucket |
| `retry` | 0.0.1 | Automatic retry of transient failures with exponential backoff |
| `telemetry` | 0.0.1 | Distributed tracing spans with W3C trace-context propagation |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |
| `timeout` | 0.0.1 | Per-request timeout with transport abort |


Features are activated via the `feature` option:

```haskell
  active <- jo [("active", VBool True)]
  featureCfg <- jo
    [ ("audit", active)
    , ("clienttrack", active)
    , ("idempotency", active)
    , ("log", active)
    , ("metrics", active)
    , ("paging", active)
    , ("ratelimit", active)
    , ("retry", active)
    , ("telemetry", active)
    , ("test", active)
    , ("timeout", active)
    ]
  opts <- jo [("feature", featureCfg)]
  client <- Sdk.newSdk opts
```

