"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const node_test_1 = require("node:test");
const __1 = require("..");
const definition_runner_1 = require("./definition-runner");
const utility_1 = require("./utility");
// Generated from the API definition, not from the model this SDK was built
// from: the route, the declared query parameters, the credential the security
// scheme names, and the definition's own response example.
const PLAN = [
    {
        "entity": "merchant_portal_pam_merchant_controller",
        "accessor": "MerchantPortalPamMerchantController",
        "op": "create",
        "method": "POST",
        "path": "/merchantportalws/registerMerchant",
        "args": [],
        "select": {},
        "headers": [],
        "cookies": [],
        "responseMedia": [
            "*/*"
        ],
        "query": [],
        "queryArgs": [],
        "auth": null,
        "status": 200,
        "sample": {
            "responseCode": 0,
            "responseMessage": "OK"
        },
        "idField": "id"
    },
    {
        "entity": "merchant_portal_pam_package_controller",
        "accessor": "MerchantPortalPamPackageController",
        "op": "create",
        "method": "POST",
        "path": "/merchantportalws/updatePackageData",
        "args": [],
        "select": {},
        "headers": [],
        "cookies": [],
        "responseMedia": [
            "*/*"
        ],
        "query": [],
        "queryArgs": [],
        "auth": null,
        "status": 200,
        "sample": {
            "responseCode": 0,
            "responseMessage": "OK"
        },
        "idField": "id"
    },
    {
        "entity": "output_add_product",
        "accessor": "OutputAddProduct",
        "op": "create",
        "method": "POST",
        "path": "/merchantportalws/addProductsToPackage",
        "args": [],
        "select": {
            "authorization": "v1"
        },
        "headers": [],
        "cookies": [],
        "responseMedia": [
            "application/json"
        ],
        "query": [],
        "queryArgs": [],
        "auth": null,
        "status": 200,
        "sample": {
            "responseCode": 0,
            "responseMessage": "OK"
        },
        "idField": "id"
    },
    {
        "entity": "output_create_product",
        "accessor": "OutputCreateProduct",
        "op": "create",
        "method": "POST",
        "path": "/merchantportalws/createNewProduct",
        "args": [],
        "select": {
            "authorization": "v1"
        },
        "headers": [],
        "cookies": [],
        "responseMedia": [
            "application/json"
        ],
        "query": [],
        "queryArgs": [],
        "auth": null,
        "status": 200,
        "sample": {
            "responseCode": 0,
            "responseMessage": "OK"
        },
        "idField": "id"
    },
    {
        "entity": "output_detail",
        "accessor": "OutputDetail",
        "op": "load",
        "method": "GET",
        "path": "/merchantportalws/batch/registerAdditionalTerminal/details/{id}",
        "args": [
            {
                "name": "id",
                "wire": "id",
                "value": "p1"
            }
        ],
        "select": {
            "authorization": "v1"
        },
        "headers": [],
        "cookies": [],
        "responseMedia": [
            "application/json"
        ],
        "query": [],
        "queryArgs": [],
        "auth": null,
        "status": 200,
        "sample": {
            "details": {
                "batch": {
                    "id": "x",
                    "name": "x",
                    "owner": "x",
                    "status": "COMPLETED_SUCCESSFULLY",
                    "timestamp": "x"
                },
                "lines": {},
                "progress": {
                    "line": "x",
                    "percentage": 1
                }
            },
            "responseCode": 0,
            "responseMessage": "OK"
        },
        "idField": "id"
    },
    {
        "entity": "output_list",
        "accessor": "OutputList",
        "op": "create",
        "method": "POST",
        "path": "/merchantportalws/batch/registerAdditionalTerminal/list",
        "args": [],
        "select": {
            "authorization": "v1"
        },
        "headers": [],
        "cookies": [],
        "responseMedia": [
            "application/json"
        ],
        "query": [],
        "queryArgs": [],
        "auth": null,
        "status": 200,
        "sample": {
            "items": [
                {
                    "id": "x",
                    "name": "x",
                    "owner": "x",
                    "status": "COMPLETED_SUCCESSFULLY",
                    "timestamp": "x"
                }
            ],
            "pagination": {
                "page": 1,
                "size": 10,
                "totalElements": 1587,
                "totalPages": 10
            },
            "responseCode": 0,
            "responseMessage": "OK"
        },
        "idField": "id"
    },
    {
        "entity": "output_move_tid",
        "accessor": "OutputMoveTid",
        "op": "create",
        "method": "POST",
        "path": "/merchantportalws/moveTid",
        "args": [],
        "select": {
            "authorization": "v1"
        },
        "headers": [],
        "cookies": [],
        "responseMedia": [
            "application/json"
        ],
        "query": [],
        "queryArgs": [],
        "auth": null,
        "status": 200,
        "sample": {
            "responseCode": 0,
            "responseMessage": "OK"
        },
        "idField": "id"
    },
    {
        "entity": "output_remove_product",
        "accessor": "OutputRemoveProduct",
        "op": "create",
        "method": "POST",
        "path": "/merchantportalws/removeProductsFromPackage",
        "args": [],
        "select": {
            "authorization": "v1"
        },
        "headers": [],
        "cookies": [],
        "responseMedia": [
            "application/json"
        ],
        "query": [],
        "queryArgs": [],
        "auth": null,
        "status": 200,
        "sample": {
            "responseCode": 0,
            "responseMessage": "OK"
        },
        "idField": "id"
    },
    {
        "entity": "output_start",
        "accessor": "OutputStart",
        "op": "create",
        "method": "POST",
        "path": "/merchantportalws/batch/registerAdditionalTerminal/start",
        "args": [],
        "select": {
            "authorization": "v1"
        },
        "headers": [],
        "cookies": [],
        "responseMedia": [
            "application/json"
        ],
        "query": [],
        "queryArgs": [],
        "auth": null,
        "status": 200,
        "sample": {
            "id": "x",
            "responseCode": 0,
            "responseMessage": "OK"
        },
        "idField": "id"
    },
    {
        "entity": "output_status",
        "accessor": "OutputStatus",
        "op": "load",
        "method": "GET",
        "path": "/merchantportalws/batch/registerAdditionalTerminal/status/{id}",
        "args": [
            {
                "name": "id",
                "wire": "id",
                "value": "p1"
            }
        ],
        "select": {
            "authorization": "v1"
        },
        "headers": [],
        "cookies": [],
        "responseMedia": [
            "application/json"
        ],
        "query": [],
        "queryArgs": [],
        "auth": null,
        "status": 200,
        "sample": {
            "percentage": 1,
            "responseCode": 0,
            "responseMessage": "OK",
            "status": "COMPLETED_SUCCESSFULLY"
        },
        "idField": "id"
    },
    {
        "entity": "output_update_product",
        "accessor": "OutputUpdateProduct",
        "op": "create",
        "method": "POST",
        "path": "/merchantportalws/updateProduct",
        "args": [],
        "select": {
            "authorization": "v1"
        },
        "headers": [],
        "cookies": [],
        "responseMedia": [
            "application/json"
        ],
        "query": [],
        "queryArgs": [],
        "auth": null,
        "status": 200,
        "sample": {
            "responseCode": 0,
            "responseMessage": "OK"
        },
        "idField": "id"
    }
];
(0, node_test_1.describe)('definition', () => {
    for (const point of PLAN) {
        (0, node_test_1.test)(point.entity + '.' + point.op + ' ' + point.method + ' ' + point.path, async (t) => {
            const control = (0, utility_1.isControlSkipped)('entityOp', point.entity + '.' + point.op, 'definition');
            if (control.skip) {
                t.skip(control.reason || 'skipped via sdk-test-control.json');
                return;
            }
            await (0, definition_runner_1.runDefinitionPoint)(__1.SDK, point);
        });
    }
});
//# sourceMappingURL=definition.test.js.map