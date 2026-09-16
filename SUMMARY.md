# Merchant Portal Web Service Documentation

Web service for merchant registration and management.

## Start here

This guide introduces the API, the client libraries, and the companion tools in this repository. Start with the API capabilities, choose a client for your application, and use the linked reference when you need exact request and response details.

The selected API surface contains 19 entities and 43 HTTP routes. There are 23 SDK targets and 2 companion tools.

An entity groups related API operations. An operation can have several routes with different inputs or authentication requirements. The SDK exposes the entity and its operations using the conventions of the selected language.

## What the API provides

### [MerchantPortalApiController](docs/api/merchant_portal_api_controller.html)

Results: OK; Successful registration of an additional terminal.; Successful merchant and terminal registration.

SDK operations: `create`.

Key fields to recognise:

- `account_number`: Account number provided by the acquirer.
- `additional_data`: Arbitrary merchant-specific data related to terminal registration.
- `business_reg_number`: Merchant business registration number as stated in the company registry.
- `city`: Merchant&#39;s address: city.
- `corporateuuid`: An UUID of the newly registered corporate (if created during the flow - it is an optional value).

### [MerchantPortalCommonController](docs/api/merchant_portal_common_controller.html)

Results: OK.

SDK operations: `load`.

### [MerchantPortalPamContractController](docs/api/merchant_portal_pam_contract_controller.html)

Results: OK.

SDK operations: `create`.

### [MerchantPortalPamDocumentController](docs/api/merchant_portal_pam_document_controller.html)

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `packageOrderUUID`: UUID of the package order.
- `productOrderUUID`: UUID of the product order.

### [MerchantPortalPamFormController](docs/api/merchant_portal_pam_form_controller.html)

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `packageOrderUUID`: UUID of the package order.
- `productOrderUUID`: UUID of the product order.

### [MerchantPortalPamMandatorController](docs/api/merchant_portal_pam_mandator_controller.html)

Results: OK.

SDK operations: `create`.

### [MerchantPortalPamMerchantController](docs/api/merchant_portal_pam_merchant_controller.html)

Results: OK; Successful registration of additional acquiring.

SDK operations: `create`.

Key fields to recognise:

- `additional_data`: Optional additional merchant-specific data related to enabling acquiring.
- `city`: City where the merchant is located.
- `corporateUUID`: Unique identifier for the corporate entity.
- `country`: Country where the merchant is located.
- `currency`: Transaction currency in ISO 4217 format.

### [MerchantPortalPamPackageController](docs/api/merchant_portal_pam_package_controller.html)

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `country`: Country associated with the package.
- `descriptionKey`: Key for the description of the package.
- `nameKey`: Key for the name of the package.
- `packageStatus`: Status of the package.
- `packageUUID`: Unique identifier for the package.

### [MerchantPortalPamProductController](docs/api/merchant_portal_pam_product_controller.html)

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `reason_decline`: Reason for product decline.

### [OutputAddProduct](docs/api/output_add_product.html)

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `packageUUID`: Unique identifier for the package.
- `productUUIDs`: The list of unique identifiers of the products.
- `responseCode`: Response code. For success state 0. For failure state lower than 0.
- `responseMessage`: Response message. For success state OK. For failure state description of the cause.

### [OutputCreateProduct](docs/api/output_create_product.html)

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `acquirerId`: Unique identifier for the acquirer.
- `allowMultipleOrders`: Indication whether multiple orders are allowed or not.
- `appFormTemplateName`: Name of the application form template.
- `contractNeeded`: Indication whether contract is needed or not.
- `credentialsNeeded`: Indication whether credentials are needed or not.

### [OutputDetail](docs/api/output_detail.html)

Results: OK.

SDK operations: `load`.

### [OutputList](docs/api/output_list.html)

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `responseCode`: Response code. For success state 0. For failure state lower than 0.
- `responseMessage`: Response message. For success state OK. For failure state description of the cause.

### [OutputMessage](docs/api/output_message.html)

Results: OK.

SDK operations: `load`.

Key fields to recognise:

- `responseCode`: Response code. For success state 0. For failure state lower than 0.
- `responseMessage`: Response message. For success state OK. For failure state description of the cause.

### [OutputMoveTid](docs/api/output_move_tid.html)

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `responseCode`: Response code. For success state 0. For failure state lower than 0.
- `responseMessage`: Response message. For success state OK. For failure state description of the cause.

### [OutputRemoveProduct](docs/api/output_remove_product.html)

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `packageUUID`: Unique identifier for the package.
- `productUUIDs`: List of product unique identifiers.
- `responseCode`: Response code. For success state 0. For failure state lower than 0.
- `responseMessage`: Response message. For success state OK. For failure state description of the cause.

### [OutputStart](docs/api/output_start.html)

Results: OK.

SDK operations: `create`.

Key fields to recognise:

- `responseCode`: Response code. For success state 0. For failure state lower than 0.
- `responseMessage`: Response message. For success state OK. For failure state description of the cause.

### [OutputStatus](docs/api/output_status.html)

Results: OK.

SDK operations: `load`.

Key fields to recognise:

- `responseCode`: Response code. For success state 0. For failure state lower than 0.
- `responseMessage`: Response message. For success state OK. For failure state description of the cause.

### [OutputUpdateProduct](docs/api/output_update_product.html)

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
| [MerchantPortalApiController](docs/api/merchant_portal_api_controller.html) | `create` | `POST /merchantportalws/deactivateTerminal` | See reference |
| [MerchantPortalApiController](docs/api/merchant_portal_api_controller.html) | `create` | `POST /merchantportalws/reactivateTerminal` | See reference |
| [MerchantPortalApiController](docs/api/merchant_portal_api_controller.html) | `create` | `POST /merchantportalws/registerAdditionalTerminal` | See reference |
| [MerchantPortalApiController](docs/api/merchant_portal_api_controller.html) | `create` | `POST /merchantportalws/registerNewMerchant` | See reference |
| [MerchantPortalCommonController](docs/api/merchant_portal_common_controller.html) | `load` | `GET /merchantportalws/logDeveloperInfo` | See reference |
| [MerchantPortalCommonController](docs/api/merchant_portal_common_controller.html) | `load` | `GET /merchantportalws/version` | See reference |
| [MerchantPortalPamContractController](docs/api/merchant_portal_pam_contract_controller.html) | `create` | `POST /merchantportalws/generateContract` | See reference |
| [MerchantPortalPamContractController](docs/api/merchant_portal_pam_contract_controller.html) | `create` | `POST /merchantportalws/uploadContract` | See reference |
| [MerchantPortalPamDocumentController](docs/api/merchant_portal_pam_document_controller.html) | `create` | `POST /merchantportalws/documentsList` | See reference |
| [MerchantPortalPamDocumentController](docs/api/merchant_portal_pam_document_controller.html) | `create` | `POST /merchantportalws/downloadDocument` | See reference |
| [MerchantPortalPamFormController](docs/api/merchant_portal_pam_form_controller.html) | `create` | `POST /merchantportalws/applicationForm` | See reference |
| [MerchantPortalPamFormController](docs/api/merchant_portal_pam_form_controller.html) | `create` | `POST /merchantportalws/packageForm` | See reference |
| [MerchantPortalPamFormController](docs/api/merchant_portal_pam_form_controller.html) | `create` | `POST /merchantportalws/reopenForm` | See reference |
| [MerchantPortalPamFormController](docs/api/merchant_portal_pam_form_controller.html) | `create` | `POST /merchantportalws/secretKey` | See reference |
| [MerchantPortalPamFormController](docs/api/merchant_portal_pam_form_controller.html) | `create` | `POST /merchantportalws/submitForm` | See reference |
| [MerchantPortalPamFormController](docs/api/merchant_portal_pam_form_controller.html) | `create` | `POST /merchantportalws/submitValues` | See reference |
| [MerchantPortalPamMandatorController](docs/api/merchant_portal_pam_mandator_controller.html) | `create` | `POST /merchantportalws/createMandatorConfig` | See reference |
| [MerchantPortalPamMandatorController](docs/api/merchant_portal_pam_mandator_controller.html) | `create` | `POST /merchantportalws/introduceMandatorPackage` | See reference |
| [MerchantPortalPamMandatorController](docs/api/merchant_portal_pam_mandator_controller.html) | `create` | `POST /merchantportalws/selfRegistrationLink` | See reference |
| [MerchantPortalPamMerchantController](docs/api/merchant_portal_pam_merchant_controller.html) | `create` | `POST /merchantportalws/contractNumber` | See reference |
| [MerchantPortalPamMerchantController](docs/api/merchant_portal_pam_merchant_controller.html) | `create` | `POST /merchantportalws/registerAdditionalAcquiring` | See reference |
| [MerchantPortalPamMerchantController](docs/api/merchant_portal_pam_merchant_controller.html) | `create` | `POST /merchantportalws/updateMerchant` | See reference |
| [MerchantPortalPamMerchantController](docs/api/merchant_portal_pam_merchant_controller.html) | `create` | `POST /merchantportalws/registerMerchant` | See reference |
| [MerchantPortalPamPackageController](docs/api/merchant_portal_pam_package_controller.html) | `create` | `POST /merchantportalws/availablePackages` | See reference |
| [MerchantPortalPamPackageController](docs/api/merchant_portal_pam_package_controller.html) | `create` | `POST /merchantportalws/orderPackage` | See reference |
| [MerchantPortalPamPackageController](docs/api/merchant_portal_pam_package_controller.html) | `create` | `POST /merchantportalws/orderedPackages` | See reference |
| [MerchantPortalPamPackageController](docs/api/merchant_portal_pam_package_controller.html) | `create` | `POST /merchantportalws/packageTemplates` | See reference |
| [MerchantPortalPamPackageController](docs/api/merchant_portal_pam_package_controller.html) | `create` | `POST /merchantportalws/updatePackageData` | See reference |
| [MerchantPortalPamProductController](docs/api/merchant_portal_pam_product_controller.html) | `create` | `POST /merchantportalws/approveProduct` | See reference |
| [MerchantPortalPamProductController](docs/api/merchant_portal_pam_product_controller.html) | `create` | `POST /merchantportalws/declineProduct` | See reference |
| [MerchantPortalPamProductController](docs/api/merchant_portal_pam_product_controller.html) | `create` | `POST /merchantportalws/orderAdditionalProduct` | See reference |
| [MerchantPortalPamProductController](docs/api/merchant_portal_pam_product_controller.html) | `create` | `POST /merchantportalws/productsList` | See reference |
| [OutputAddProduct](docs/api/output_add_product.html) | `create` | `POST /merchantportalws/addProductsToPackage` | See reference |
| [OutputCreateProduct](docs/api/output_create_product.html) | `create` | `POST /merchantportalws/createNewProduct` | See reference |
| [OutputDetail](docs/api/output_detail.html) | `load` | `GET /merchantportalws/batch/registerAdditionalTerminal/details/{id}` | See reference |
| [OutputList](docs/api/output_list.html) | `create` | `POST /merchantportalws/batch/registerAdditionalTerminal/list` | See reference |
| [OutputMessage](docs/api/output_message.html) | `load` | `GET /merchantportalws/batch/registerAdditionalTerminal/restart/{id}` | See reference |
| [OutputMessage](docs/api/output_message.html) | `load` | `GET /merchantportalws/batch/registerAdditionalTerminal/stop/{id}` | See reference |
| [OutputMoveTid](docs/api/output_move_tid.html) | `create` | `POST /merchantportalws/moveTid` | See reference |
| [OutputRemoveProduct](docs/api/output_remove_product.html) | `create` | `POST /merchantportalws/removeProductsFromPackage` | See reference |
| [OutputStart](docs/api/output_start.html) | `create` | `POST /merchantportalws/batch/registerAdditionalTerminal/start` | See reference |
| [OutputStatus](docs/api/output_status.html) | `load` | `GET /merchantportalws/batch/registerAdditionalTerminal/status/{id}` | See reference |
| [OutputUpdateProduct](docs/api/output_update_product.html) | `create` | `POST /merchantportalws/updateProduct` | See reference |

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
| [C](docs/sdks/c.html) | `c/` | Build from source |
| [Clojure](docs/sdks/clojure.html) | `clojure/` | Build from source |
| [C++](docs/sdks/cpp.html) | `cpp/` | Build from source |
| [C#](docs/sdks/csharp.html) | `csharp/` | Build from source |
| [Dart](docs/sdks/dart.html) | `dart/` | Build from source |
| [Elixir](docs/sdks/elixir.html) | `elixir/` | Build from source |
| [Golang](docs/sdks/go.html) | `go/` | Build from source |
| [Haskell](docs/sdks/haskell.html) | `haskell/` | Build from source |
| [Java](docs/sdks/java.html) | `java/` | Build from source |
| [JavaScript](docs/sdks/js.html) | `js/` | Build from source |
| [Kotlin](docs/sdks/kotlin.html) | `kotlin/` | Build from source |
| [Lean](docs/sdks/lean.html) | `lean/` | Build from source |
| [Lua](docs/sdks/lua.html) | `lua/` | Build from source |
| [OCaml](docs/sdks/ocaml.html) | `ocaml/` | Build from source |
| [Perl](docs/sdks/perl.html) | `perl/` | Build from source |
| [PHP](docs/sdks/php.html) | `php/` | Build from source |
| [Python](docs/sdks/py.html) | `py/` | Build from source |
| [Ruby](docs/sdks/rb.html) | `rb/` | Build from source |
| [Rust](docs/sdks/rust.html) | `rust/` | Build from source |
| [Scala](docs/sdks/scala.html) | `scala/` | Build from source |
| [Swift](docs/sdks/swift.html) | `swift/` | Build from source |
| [TypeScript](docs/sdks/ts.html) | `ts/` | Build from source |
| [Zig](docs/sdks/zig.html) | `zig/` | Build from source |

Build-from-source entries are not marked as published in the project model. Follow the build instructions in that target’s README, then consume the resulting package using your language’s local dependency mechanism. Published entries give the installation command recorded for that client.

## Companion tools

These targets provide another way to use the API. Their available commands or tools can cover a smaller set of operations than the client libraries.

### [Go CLI](docs/tools/go-cli.html)

Use the command-line interface for shell-based tasks and scripts.

Repository directory: `go-cli/`. Not published. Build from the go-cli directory.


### [Go MCP server](docs/tools/go-mcp.html)

Use the MCP server to expose supported API operations to an MCP client.

Repository directory: `go-mcp/`. Not published. Build from the go-mcp directory.

- `bluefin-tecs-merchant-portal_list`: List records for an entity. No active entity supports this operation.
- `bluefin-tecs-merchant-portal_load`: Load one record for an entity. Supported entities: `merchant_portal_common_controller`, `output_detail`, `output_message`, `output_status`.

## Operational features

Features supply behaviour around API calls, such as request handling, diagnostics, or local testing. Inclusion in this project does not mean a feature is enabled at runtime. Check the selected SDK’s supported features and configuration defaults, then enable the behaviour your application needs.

- [`audit`](docs/features/audit.html): Structured audit trail of operations
- [`clienttrack`](docs/features/clienttrack.html): Client identity and per-request correlation headers
- [`debug`](docs/features/debug.html): Request/response capture ring buffer for debugging
- [`idempotency`](docs/features/idempotency.html): Idempotency keys for safe retries of mutating operations
- [`log`](docs/features/log.html): Structured request and response logging
- [`metrics`](docs/features/metrics.html): Statistics capture: per-operation counters and latency
- [`paging`](docs/features/paging.html): Pagination signals for list operations
- [`ratelimit`](docs/features/ratelimit.html): Client-side rate limiting via a token bucket
- [`retry`](docs/features/retry.html): Automatic retry of transient failures with exponential backoff
- [`telemetry`](docs/features/telemetry.html): Distributed tracing spans with W3C trace-context propagation
- [`test`](docs/features/test.html): In-memory mock transport for testing without a live server
- [`timeout`](docs/features/timeout.html): Per-request timeout with transport abort

Start with the default client configuration. Add request limits and diagnostics as needed, test error paths, and review retry behaviour before using operations that change data. A retry can repeat an operation unless the API provides a suitable guarantee.

## Continue with the documentation

- Follow the [first-call guide](docs/guides/first-call.html) for the setup sequence.
- Read the [authentication guide](docs/guides/authentication.html) before using protected routes.
- Use the [API reference](docs/api/index.html) for request schemas, response formats, and status codes.
- Check the chosen SDK or companion tool reference for its configuration and supported operations.

