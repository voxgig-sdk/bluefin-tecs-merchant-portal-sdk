# Merchant Portal Web Service Documentation

Web service for merchant registration and management.

## Start here

This guide introduces the API, the client libraries, and the companion tools in this repository. Start with the API capabilities, choose a client for your application, and use the linked reference when you need exact request and response details.

The selected API surface contains 19 entities and 43 HTTP routes. There are 23 SDK targets and 2 companion tools.

An entity groups related API operations. An operation can have several routes with different inputs or authentication requirements. The SDK exposes the entity and its operations using the conventions of the selected language.

## What the API provides

### MerchantPortalApiController

Results: OK; Successful registration of an additional terminal.; Successful merchant and terminal registration.

SDK operations: `create`.

Key fields to recognise:

- `account_number`: Account number provided by the acquirer.
- `additional_data`: Arbitrary merchant-specific data related to terminal registration.
- `business_reg_number`: Merchant business registration number as stated in the company registry.
- `city`: Merchant&#39;s address: city.
- `corporateuuid`: An UUID of the newly registered corporate (if created during the flow - it is an optional value).

### MerchantPortalCommonController

Results: OK.

SDK operations: `load`.

### MerchantPortalPamContractController

Results: OK.

SDK operations: `create`.

### MerchantPortalPamDocumentController

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `packageOrderUUID`: UUID of the package order.
- `productOrderUUID`: UUID of the product order.

### MerchantPortalPamFormController

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `packageOrderUUID`: UUID of the package order.
- `productOrderUUID`: UUID of the product order.

### MerchantPortalPamMandatorController

Results: OK.

SDK operations: `create`.

### MerchantPortalPamMerchantController

Results: OK; Successful registration of additional acquiring.

SDK operations: `create`.

Key fields to recognise:

- `additional_data`: Optional additional merchant-specific data related to enabling acquiring.
- `city`: City where the merchant is located.
- `corporateUUID`: Unique identifier for the corporate entity.
- `country`: Country where the merchant is located.
- `currency`: Transaction currency in ISO 4217 format.

### MerchantPortalPamPackageController

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `country`: Country associated with the package.
- `descriptionKey`: Key for the description of the package.
- `nameKey`: Key for the name of the package.
- `packageStatus`: Status of the package.
- `packageUUID`: Unique identifier for the package.

### MerchantPortalPamProductController

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `productUUID`: UUID of the product.
- `reason_decline`: Reason for product decline.

### OutputAddProduct

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `packageUUID`: Unique identifier for the package.
- `productUUIDs`: The list of unique identifiers of the products.
- `responseCode`: Response code. For success state 0. For failure state lower than 0.
- `responseMessage`: Response message. For success state OK. For failure state description of the cause.

### OutputCreateProduct

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `acquirerId`: Unique identifier for the acquirer.
- `allowMultipleOrders`: Indication whether multiple orders are allowed or not.
- `appFormTemplateName`: Name of the application form template.
- `contractNeeded`: Indication whether contract is needed or not.
- `credentialsNeeded`: Indication whether credentials are needed or not.

### OutputDetail

Results: OK.

SDK operations: `load`.

Key fields to recognise:

- `responseCode`: Response code. For success state 0. For failure state lower than 0.
- `responseMessage`: Response message. For success state OK. For failure state description of the cause.

### OutputList

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `responseCode`: Response code. For success state 0. For failure state lower than 0.
- `responseMessage`: Response message. For success state OK. For failure state description of the cause.

### OutputMessage

Results: OK.

SDK operations: `load`.

Key fields to recognise:

- `responseCode`: Response code. For success state 0. For failure state lower than 0.
- `responseMessage`: Response message. For success state OK. For failure state description of the cause.

### OutputMoveTid

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `responseCode`: Response code. For success state 0. For failure state lower than 0.
- `responseMessage`: Response message. For success state OK. For failure state description of the cause.

### OutputRemoveProduct

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `packageUUID`: Unique identifier for the package.
- `productUUIDs`: List of product unique identifiers.
- `responseCode`: Response code. For success state 0. For failure state lower than 0.
- `responseMessage`: Response message. For success state OK. For failure state description of the cause.

### OutputStart

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `responseCode`: Response code. For success state 0. For failure state lower than 0.
- `responseMessage`: Response message. For success state OK. For failure state description of the cause.

### OutputStatus

Results: OK.

SDK operations: `load`.

Key fields to recognise:

- `responseCode`: Response code. For success state 0. For failure state lower than 0.
- `responseMessage`: Response message. For success state OK. For failure state description of the cause.

### OutputUpdateProduct

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `allowMultipleOrders`: An attribute to indicate if multiple orders are allowed
- `appFormName`: The name of the application form
- `contractNeeded`: An attribute to indicate if a contract is needed
- `credentialsNeeded`: An attribute to indicate if credentials are needed
- `descriptionKey`: The description of the product

### Route map

Use this map to locate a capability. Consult the entity reference before supplying request data; routes for the same operation can require different fields.

| Entity | SDK operation | HTTP route | Authentication |
| --- | --- | --- | --- |
| MerchantPortalApiController | `create` | `POST /merchantportalws/deactivateTerminal` | See reference |
| MerchantPortalApiController | `create` | `POST /merchantportalws/reactivateTerminal` | See reference |
| MerchantPortalApiController | `create` | `POST /merchantportalws/registerAdditionalTerminal` | See reference |
| MerchantPortalApiController | `create` | `POST /merchantportalws/registerNewMerchant` | See reference |
| MerchantPortalCommonController | `load` | `GET /merchantportalws/logDeveloperInfo` | See reference |
| MerchantPortalCommonController | `load` | `GET /merchantportalws/version` | See reference |
| MerchantPortalPamContractController | `create` | `POST /merchantportalws/generateContract` | See reference |
| MerchantPortalPamContractController | `create` | `POST /merchantportalws/uploadContract` | See reference |
| MerchantPortalPamDocumentController | `create` | `POST /merchantportalws/documentsList` | See reference |
| MerchantPortalPamDocumentController | `create` | `POST /merchantportalws/downloadDocument` | See reference |
| MerchantPortalPamFormController | `create` | `POST /merchantportalws/applicationForm` | See reference |
| MerchantPortalPamFormController | `create` | `POST /merchantportalws/packageForm` | See reference |
| MerchantPortalPamFormController | `create` | `POST /merchantportalws/reopenForm` | See reference |
| MerchantPortalPamFormController | `create` | `POST /merchantportalws/secretKey` | See reference |
| MerchantPortalPamFormController | `create` | `POST /merchantportalws/submitForm` | See reference |
| MerchantPortalPamFormController | `create` | `POST /merchantportalws/submitValues` | See reference |
| MerchantPortalPamMandatorController | `create` | `POST /merchantportalws/createMandatorConfig` | See reference |
| MerchantPortalPamMandatorController | `create` | `POST /merchantportalws/introduceMandatorPackage` | See reference |
| MerchantPortalPamMandatorController | `create` | `POST /merchantportalws/selfRegistrationLink` | See reference |
| MerchantPortalPamMerchantController | `create` | `POST /merchantportalws/contractNumber` | See reference |
| MerchantPortalPamMerchantController | `create` | `POST /merchantportalws/registerAdditionalAcquiring` | See reference |
| MerchantPortalPamMerchantController | `create` | `POST /merchantportalws/updateMerchant` | See reference |
| MerchantPortalPamMerchantController | `create` | `POST /merchantportalws/registerMerchant` | See reference |
| MerchantPortalPamPackageController | `create` | `POST /merchantportalws/availablePackages` | See reference |
| MerchantPortalPamPackageController | `create` | `POST /merchantportalws/orderPackage` | See reference |
| MerchantPortalPamPackageController | `create` | `POST /merchantportalws/orderedPackages` | See reference |
| MerchantPortalPamPackageController | `create` | `POST /merchantportalws/packageTemplates` | See reference |
| MerchantPortalPamPackageController | `create` | `POST /merchantportalws/updatePackageData` | See reference |
| MerchantPortalPamProductController | `create` | `POST /merchantportalws/approveProduct` | See reference |
| MerchantPortalPamProductController | `create` | `POST /merchantportalws/declineProduct` | See reference |
| MerchantPortalPamProductController | `create` | `POST /merchantportalws/orderAdditionalProduct` | See reference |
| MerchantPortalPamProductController | `create` | `POST /merchantportalws/productsList` | See reference |
| OutputAddProduct | `create` | `POST /merchantportalws/addProductsToPackage` | See reference |
| OutputCreateProduct | `create` | `POST /merchantportalws/createNewProduct` | See reference |
| OutputDetail | `load` | `GET /merchantportalws/batch/registerAdditionalTerminal/details/{id}` | See reference |
| OutputList | `create` | `POST /merchantportalws/batch/registerAdditionalTerminal/list` | See reference |
| OutputMessage | `load` | `GET /merchantportalws/batch/registerAdditionalTerminal/restart/{id}` | See reference |
| OutputMessage | `load` | `GET /merchantportalws/batch/registerAdditionalTerminal/stop/{id}` | See reference |
| OutputMoveTid | `create` | `POST /merchantportalws/moveTid` | See reference |
| OutputRemoveProduct | `create` | `POST /merchantportalws/removeProductsFromPackage` | See reference |
| OutputStart | `create` | `POST /merchantportalws/batch/registerAdditionalTerminal/start` | See reference |
| OutputStatus | `load` | `GET /merchantportalws/batch/registerAdditionalTerminal/status/{id}` | See reference |
| OutputUpdateProduct | `create` | `POST /merchantportalws/updateProduct` | See reference |

## Connect to the API

- Test: `https://test.tecs.at`

Check authentication for the route you plan to call. A route that declares no authentication can be used without credentials; this does not change the requirements of other routes. Keep credentials in environment variables or a configured secret provider, and keep them out of source control and logs.

## Make a first request

1. Choose the API server and an operation that matches your task.
2. Check the operation’s required input and authentication. Use values valid for your account and environment.
3. Send one request and inspect the returned data before adding retries, concurrency, or a larger batch.

For an SDK call, install or build the chosen client, create a client instance with its documented configuration, and call the required entity operation. Language references describe the argument shape, asynchronous behaviour, and returned values.

## Choose an SDK

Choose the language already used by your application or service. The clients represent the same API model, while package setup, naming, and return types follow each language. Check the selected client’s reference and tests before integrating it into an existing application.

| Client | Repository directory | Distribution |
| --- | --- | --- |
| C | `c/` | Build from source |
| Clojure | `clojure/` | Build from source |
| C++ | `cpp/` | Build from source |
| C# | `csharp/` | Build from source |
| Dart | `dart/` | Build from source |
| Elixir | `elixir/` | Build from source |
| Golang | `go/` | Build from source |
| Haskell | `haskell/` | Build from source |
| Java | `java/` | Build from source |
| JavaScript | `js/` | Build from source |
| Kotlin | `kotlin/` | Build from source |
| Lean | `lean/` | Build from source |
| Lua | `lua/` | Build from source |
| OCaml | `ocaml/` | Build from source |
| Perl | `perl/` | Build from source |
| PHP | `php/` | Build from source |
| Python | `py/` | Build from source |
| Ruby | `rb/` | Build from source |
| Rust | `rust/` | Build from source |
| Scala | `scala/` | Build from source |
| Swift | `swift/` | Build from source |
| TypeScript | `ts/` | Build from source |
| Zig | `zig/` | Build from source |

Build-from-source entries are not marked as published in the project model. Follow the build instructions in that target’s README, then consume the resulting package using your language’s local dependency mechanism. Published entries give the installation command recorded for that client.

## Companion tools

These targets provide another way to use the API. Their available commands or tools can cover a smaller set of operations than the client libraries.

### Go CLI

Use the command-line interface for shell-based tasks and scripts.

Repository directory: `go-cli/`. Not published. Build from the go-cli directory.


### Go MCP server

Use the MCP server to expose supported API operations to an MCP client.

Repository directory: `go-mcp/`. Not published. Build from the go-mcp directory.

- `bluefin-tecs-merchant-portal_list`: List records for an entity. No active entity supports this operation.
- `bluefin-tecs-merchant-portal_load`: Load one record for an entity. Supported entities: `merchant_portal_common_controller`, `output_detail`, `output_message`, `output_status`.

## Operational features

Features supply behaviour around API calls, such as request handling, diagnostics, or local testing. Inclusion in this project does not mean a feature is enabled at runtime. Check the selected SDK’s supported features and configuration defaults, then enable the behaviour your application needs.

- `audit`: Structured audit trail of operations
- `clienttrack`: Client identity and per-request correlation headers
- `debug`: Request/response capture ring buffer for debugging
- `idempotency`: Idempotency keys for safe retries of mutating operations
- `log`: Structured request and response logging
- `metrics`: Statistics capture: per-operation counters and latency
- `paging`: Pagination signals for list operations
- `ratelimit`: Client-side rate limiting via a token bucket
- `retry`: Automatic retry of transient failures with exponential backoff
- `telemetry`: Distributed tracing spans with W3C trace-context propagation
- `test`: In-memory mock transport for testing without a live server
- `timeout`: Per-request timeout with transport abort

Start with the default client configuration. Add request limits and diagnostics as needed, test error paths, and review retry behaviour before using operations that change data. A retry can repeat an operation unless the API provides a suitable guarantee.

## Continue with the documentation

- Follow the first-call guide for the setup sequence.
- Read the authentication guide before using protected routes.
- Use the API reference for request schemas, response formats, and status codes.
- Check the chosen SDK or companion tool reference for its configuration and supported operations.

