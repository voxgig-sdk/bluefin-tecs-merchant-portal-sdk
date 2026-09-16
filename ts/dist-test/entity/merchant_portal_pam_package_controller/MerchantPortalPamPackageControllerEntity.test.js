"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const node_path_1 = __importDefault(require("node:path"));
const Fs = __importStar(require("node:fs"));
const node_test_1 = require("node:test");
const node_assert_1 = __importDefault(require("node:assert"));
const live_runner_1 = require("../../live-runner");
const live_entity_1 = require("../../live-entity");
const __1 = require("../../..");
const utility_1 = require("../../utility");
// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
(0, utility_1.loadEnvLocal)(__dirname + '/../../../.env.local');
(0, node_test_1.describe)('MerchantPortalPamPackageControllerEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.BluefinTecsMerchantPortalSDK.test();
        const ent = testsdk.MerchantPortalPamPackageController();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE;
        for (const op of ['create']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'merchant_portal_pam_package_controller.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": [{ "active": true, "name": "consumerUUID", "req": false, "type": "`$STRING`", "index$": 0 }, { "active": true, "name": "corporateUUID", "req": false, "type": "`$STRING`", "index$": 1 }, { "active": true, "name": "country", "req": false, "short": "Country associated with the package.", "type": "`$STRING`", "index$": 2 }, { "active": true, "name": "descriptionKey", "req": false, "short": "Key for the description of the package.", "type": "`$STRING`", "index$": 3 }, { "active": true, "name": "filter", "req": false, "type": "`$OBJECT`", "index$": 4 }, { "active": true, "name": "language", "op": { "create": { "req": false, "type": "`$STRING`" } }, "req": true, "type": "`$STRING`", "index$": 5 }, { "active": true, "name": "nameKey", "req": false, "short": "Key for the name of the package.", "type": "`$STRING`", "index$": 6 }, { "active": true, "name": "packageStatus", "req": false, "short": "Status of the package.", "type": "`$STRING`", "index$": 7 }, { "active": true, "name": "packageUUID", "req": true, "short": "Unique identifier for the package.", "type": "`$STRING`", "index$": 8 }, { "active": true, "name": "pagination", "req": false, "type": "`$OBJECT`", "index$": 9 }, { "active": true, "name": "sorting", "req": false, "type": "`$OBJECT`", "index$": 10 }], "name": "merchant_portal_pam_package_controller", "op": { "create": { "input": "data", "name": "create", "points": [{ "active": true, "args": { "header": [{ "active": true, "kind": "header", "name": "authorization", "orig": "authorization", "reqd": true, "type": "`$STRING`" }] }, "contract": { "id": "POST /merchantportalws/availablePackages", "json": "{\"operationId\":\"availablePackagesUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"filter\":{\"properties\":{\"packageStatus\":{\"description\":\"Name of the package status\",\"example\":\"Active\",\"type\":\"string\"},\"packageUUID\":{\"type\":\"string\"},\"productType\":{\"description\":\"Name of the product type\",\"example\":\"MERCHANT_CONTRACT\",\"type\":\"string\"}},\"title\":\"InputAvailablePackages_Filter\",\"type\":\"object\"},\"language\":{\"type\":\"string\"},\"pagination\":{\"properties\":{\"page\":{\"description\":\"Number of the page to display.\",\"example\":1,\"format\":\"int32\",\"type\":\"integer\"},\"size\":{\"description\":\"Number of elements per page to display.\",\"example\":10,\"format\":\"int32\",\"type\":\"integer\"}},\"title\":\"Pagination\",\"type\":\"object\"},\"sorting\":{\"properties\":{\"name\":{\"description\":\"Sort attribute name.\",\"example\":\"requestorID\",\"type\":\"string\"},\"type\":{\"description\":\"Sort type ASC / DESC.\",\"example\":\"ASC\",\"type\":\"string\"}},\"title\":\"Sorting\",\"type\":\"object\"}},\"required\":[\"language\"],\"title\":\"InputAvailablePackages\",\"type\":\"object\"}}},\"description\":\"inputAvailablePackages\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"packages\":{\"items\":{\"properties\":{\"country\":{\"type\":\"string\"},\"description\":{\"type\":\"string\"},\"name\":{\"type\":\"string\"},\"packageStatus\":{\"type\":\"string\"},\"products\":{\"items\":{\"properties\":{\"allowMultipleOrders\":{\"type\":\"boolean\"},\"description\":{\"type\":\"string\"},\"name\":{\"type\":\"string\"},\"productName\":{\"type\":\"string\"},\"uuid\":{\"type\":\"string\"}},\"title\":\"OutputAvailablePackages_Product\",\"type\":\"object\"},\"type\":\"array\"},\"uuid\":{\"type\":\"string\"}},\"title\":\"OutputAvailablePackages_Package\",\"type\":\"object\"},\"type\":\"array\"},\"pagination\":{\"properties\":{\"page\":{\"description\":\"Number of the page to display.\",\"example\":1,\"format\":\"int32\",\"type\":\"integer\"},\"size\":{\"description\":\"Number of elements per page to display.\",\"example\":10,\"format\":\"int32\",\"type\":\"integer\"},\"totalElements\":{\"description\":\"Number of total elements available.\",\"example\":1587,\"format\":\"int64\",\"type\":\"integer\"},\"totalPages\":{\"description\":\"Number of total pages available.\",\"example\":10,\"format\":\"int32\",\"type\":\"integer\"}},\"required\":[\"totalElements\",\"totalPages\"],\"title\":\"OutputPagination\",\"type\":\"object\"},\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"pagination\",\"responseCode\",\"responseMessage\"],\"title\":\"OutputAvailablePackages\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "POST", "orig": "/merchantportalws/availablePackages", "segments": [{ "lit": "merchantportalws" }, { "lit": "availablePackages" }], "select": { "exist": ["authorization"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }, { "active": true, "args": { "header": [{ "active": true, "kind": "header", "name": "authorization", "orig": "authorization", "reqd": true, "type": "`$STRING`" }] }, "contract": { "id": "POST /merchantportalws/orderPackage", "json": "{\"operationId\":\"orderPackageUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"consumerUUID\":{\"type\":\"string\"},\"corporateUUID\":{\"type\":\"string\"},\"language\":{\"type\":\"string\"},\"packageUUID\":{\"type\":\"string\"}},\"required\":[\"packageUUID\"],\"title\":\"InputOrderPackage\",\"type\":\"object\"}}},\"description\":\"inputOrderPackage\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"packageOrderUUID\":{\"type\":\"string\"},\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputOrderPackage\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "POST", "orig": "/merchantportalws/orderPackage", "segments": [{ "lit": "merchantportalws" }, { "lit": "orderPackage" }], "select": { "exist": ["authorization"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 1 }, { "active": true, "args": { "header": [{ "active": true, "kind": "header", "name": "authorization", "orig": "authorization", "reqd": true, "type": "`$STRING`" }] }, "contract": { "id": "POST /merchantportalws/orderedPackages", "json": "{\"operationId\":\"orderedPackagesUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"filter\":{\"properties\":{\"consumerUUID\":{\"type\":\"string\"},\"corporateUUID\":{\"type\":\"string\"},\"dateFrom\":{\"format\":\"date-time\",\"type\":\"string\"},\"dateTo\":{\"format\":\"date-time\",\"type\":\"string\"},\"packageOrderStatus\":{\"description\":\"Name of the package order status\",\"example\":\"New\",\"type\":\"string\"},\"packageOrderUUID\":{\"type\":\"string\"},\"packageStatus\":{\"description\":\"Name of the package status\",\"example\":\"Active\",\"type\":\"string\"},\"packageUUID\":{\"type\":\"string\"},\"productOrderStatus\":{\"description\":\"Name of the product order status\",\"example\":\"New\",\"type\":\"string\"},\"productOrderUUID\":{\"type\":\"string\"},\"productUUID\":{\"type\":\"string\"}},\"title\":\"InputOrderedPackages_Filter\",\"type\":\"object\"},\"language\":{\"type\":\"string\"},\"pagination\":{\"properties\":{\"page\":{\"description\":\"Number of the page to display.\",\"example\":1,\"format\":\"int32\",\"type\":\"integer\"},\"size\":{\"description\":\"Number of elements per page to display.\",\"example\":10,\"format\":\"int32\",\"type\":\"integer\"}},\"title\":\"Pagination\",\"type\":\"object\"},\"sorting\":{\"properties\":{\"name\":{\"description\":\"Sort attribute name.\",\"example\":\"requestorID\",\"type\":\"string\"},\"type\":{\"description\":\"Sort type ASC / DESC.\",\"example\":\"ASC\",\"type\":\"string\"}},\"title\":\"Sorting\",\"type\":\"object\"}},\"required\":[\"language\"],\"title\":\"InputOrderedPackages\",\"type\":\"object\"}}},\"description\":\"inputOrderedPackages\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"packageOrders\":{\"items\":{\"properties\":{\"consumerUUID\":{\"type\":\"string\"},\"corporateName\":{\"type\":\"string\"},\"corporateUUID\":{\"type\":\"string\"},\"country\":{\"type\":\"string\"},\"datetimeCreated\":{\"format\":\"date-time\",\"type\":\"string\"},\"description\":{\"type\":\"string\"},\"name\":{\"type\":\"string\"},\"numberOfRequiredFields\":{\"format\":\"int32\",\"type\":\"integer\"},\"numberOfSubmittedFields\":{\"format\":\"int32\",\"type\":\"integer\"},\"packageOrderStatus\":{\"type\":\"string\"},\"packageOrderUUID\":{\"type\":\"string\"},\"packageUUID\":{\"type\":\"string\"},\"productOrders\":{\"items\":{\"properties\":{\"allowMultipleOrders\":{\"type\":\"boolean\"},\"consumerUUID\":{\"type\":\"string\"},\"datetimeCreated\":{\"format\":\"date-time\",\"type\":\"string\"},\"numberOfRequiredFields\":{\"format\":\"int32\",\"type\":\"integer\"},\"numberOfSubmittedFields\":{\"format\":\"int32\",\"type\":\"integer\"},\"productDescription\":{\"type\":\"string\"},\"productName\":{\"type\":\"string\"},\"productOrderStatus\":{\"type\":\"string\"},\"productOrderUUID\":{\"type\":\"string\"},\"productType\":{\"type\":\"string\"},\"productUUID\":{\"type\":\"string\"},\"terminal\":{\"properties\":{\"id\":{\"type\":\"string\"},\"location\":{\"type\":\"string\"}},\"title\":\"OutputOrderedPackages_Terminal\",\"type\":\"object\"}},\"title\":\"OutputOrderedPackages_ProductOrder\",\"type\":\"object\"},\"type\":\"array\"}},\"title\":\"OutputOrderedPackages_PackageOrder\",\"type\":\"object\"},\"type\":\"array\"},\"pagination\":{\"properties\":{\"page\":{\"description\":\"Number of the page to display.\",\"example\":1,\"format\":\"int32\",\"type\":\"integer\"},\"size\":{\"description\":\"Number of elements per page to display.\",\"example\":10,\"format\":\"int32\",\"type\":\"integer\"},\"totalElements\":{\"description\":\"Number of total elements available.\",\"example\":1587,\"format\":\"int64\",\"type\":\"integer\"},\"totalPages\":{\"description\":\"Number of total pages available.\",\"example\":10,\"format\":\"int32\",\"type\":\"integer\"}},\"required\":[\"totalElements\",\"totalPages\"],\"title\":\"OutputPagination\",\"type\":\"object\"},\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"pagination\",\"responseCode\",\"responseMessage\"],\"title\":\"OutputOrderedPackages\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "POST", "orig": "/merchantportalws/orderedPackages", "segments": [{ "lit": "merchantportalws" }, { "lit": "orderedPackages" }], "select": { "exist": ["authorization"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 2 }, { "active": true, "args": { "header": [{ "active": true, "kind": "header", "name": "authorization", "orig": "authorization", "reqd": true, "type": "`$STRING`" }] }, "contract": { "id": "POST /merchantportalws/packageTemplates", "json": "{\"operationId\":\"packageTemplatesUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"filter\":{\"properties\":{\"descriptionKey\":{\"type\":\"string\"}},\"title\":\"InputPackageTemplates_Filter\",\"type\":\"object\"},\"pagination\":{\"properties\":{\"page\":{\"description\":\"Number of the page to display.\",\"example\":1,\"format\":\"int32\",\"type\":\"integer\"},\"size\":{\"description\":\"Number of elements per page to display.\",\"example\":10,\"format\":\"int32\",\"type\":\"integer\"}},\"title\":\"Pagination\",\"type\":\"object\"},\"sorting\":{\"properties\":{\"name\":{\"description\":\"Sort attribute name.\",\"example\":\"requestorID\",\"type\":\"string\"},\"type\":{\"description\":\"Sort type ASC / DESC.\",\"example\":\"ASC\",\"type\":\"string\"}},\"title\":\"Sorting\",\"type\":\"object\"}},\"title\":\"InputPackageTemplates\",\"type\":\"object\"}}},\"description\":\"inputPackageTemplates\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"packages\":{\"items\":{\"properties\":{\"descriptionKey\":{\"type\":\"string\"},\"nameKey\":{\"type\":\"string\"},\"packageUUID\":{\"type\":\"string\"}},\"title\":\"OutputPackageTemplates_Package\",\"type\":\"object\"},\"type\":\"array\"},\"pagination\":{\"properties\":{\"page\":{\"description\":\"Number of the page to display.\",\"example\":1,\"format\":\"int32\",\"type\":\"integer\"},\"size\":{\"description\":\"Number of elements per page to display.\",\"example\":10,\"format\":\"int32\",\"type\":\"integer\"},\"totalElements\":{\"description\":\"Number of total elements available.\",\"example\":1587,\"format\":\"int64\",\"type\":\"integer\"},\"totalPages\":{\"description\":\"Number of total pages available.\",\"example\":10,\"format\":\"int32\",\"type\":\"integer\"}},\"required\":[\"totalElements\",\"totalPages\"],\"title\":\"OutputPagination\",\"type\":\"object\"},\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"pagination\",\"responseCode\",\"responseMessage\"],\"title\":\"OutputPackageTemplates\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "POST", "orig": "/merchantportalws/packageTemplates", "segments": [{ "lit": "merchantportalws" }, { "lit": "packageTemplates" }], "select": { "exist": ["authorization"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 3 }, { "active": true, "args": { "header": [{ "active": true, "kind": "header", "name": "authorization", "orig": "authorization", "reqd": false, "type": "`$STRING`" }] }, "contract": { "id": "POST /merchantportalws/updatePackageData", "json": "{\"operationId\":\"updatePackageDataUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":false,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"country\":{\"description\":\"Country associated with the package.\",\"example\":\"AT\",\"type\":\"string\"},\"descriptionKey\":{\"description\":\"Key for the description of the package.\",\"example\":\"package_description_key\",\"type\":\"string\"},\"nameKey\":{\"description\":\"Key for the name of the package.\",\"example\":\"package_name_key\",\"type\":\"string\"},\"packageStatus\":{\"description\":\"Status of the package. Possible values: Active/Inactive\",\"example\":\"Active\",\"type\":\"string\"},\"packageUUID\":{\"description\":\"Unique identifier for the package.\",\"example\":\"123e4567-e89b-12d3-a456-426655440000\",\"type\":\"string\"}},\"required\":[\"packageUUID\"],\"title\":\"InputUpdatePackageData\",\"type\":\"object\"}}},\"description\":\"inputUpdatePackageData\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputUpdatePackageData\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "POST", "orig": "/merchantportalws/updatePackageData", "segments": [{ "lit": "merchantportalws" }, { "lit": "updatePackageData" }], "select": { "exist": ["authorization"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 4 }], "key$": "create" } }, "relations": { "ancestors": [] }, "key$": "merchant_portal_pam_package_controller", "name__orig": "merchant_portal_pam_package_controller", "Name": "MerchantPortalPamPackageController", "name_": "merchant_portal_pam_package_controller", "name-": "merchant-portal-pam-package-controller", "NAME": "MERCHANT_PORTAL_PAM_PACKAGE_CONTROLLER", "index$": 7 }, { "active": true, "entity": "merchant_portal_pam_package_controller", "key$": "BasicMerchantPortalPamPackageControllerFlow", "kind": "basic", "name": "BasicMerchantPortalPamPackageControllerFlow", "param": {}, "step": [{ "active": true, "data": {}, "input": { "ref": "merchant_portal_pam_package_controller_ref01" }, "match": {}, "op": "create", "spec": [], "valid": [], "index$": 0 }] }, 'MerchantPortalPamPackageController');
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        // CREATE
        const merchant_portal_pam_package_controller_ref01_ent = client.MerchantPortalPamPackageController();
        let merchant_portal_pam_package_controller_ref01_data = setup.data.new.merchant_portal_pam_package_controller['merchant_portal_pam_package_controller_ref01'];
        merchant_portal_pam_package_controller_ref01_data = (await merchant_portal_pam_package_controller_ref01_ent.create(merchant_portal_pam_package_controller_ref01_data)).data();
        (0, node_assert_1.default)(null != merchant_portal_pam_package_controller_ref01_data);
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/merchant_portal_pam_package_controller/MerchantPortalPamPackageControllerTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.BluefinTecsMerchantPortalSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['merchant_portal_pam_package_controller01', 'merchant_portal_pam_package_controller02', 'merchant_portal_pam_package_controller03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_PACKAGE_CONTROLLER_ENTID': idmap,
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
    });
    idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_PACKAGE_CONTROLLER_ENTID'];
    const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_PACKAGE_CONTROLLER_ENTID'];
        idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {};
        if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
            throw new Error('Live ENTID must be a JSON object');
        }
        client = new __1.BluefinTecsMerchantPortalSDK(merge([
            // FIRST, so the generated fields below win: sdk-test-control.json's
            // test.client.options adds to the live client, it does not redirect it.
            (0, utility_1.liveClientOptions)(),
            {},
            // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
            // last entry is undefined, and basicSetup is normally called with no
            // argument at all - so a bare 'extra' silently discarded the apikey
            // and server values above and handed the SDK undefined. Harmless
            // while there was nothing in that object; not harmless now.
            extra || {},
            { system: { fetch: transport.fetch } }
        ]));
    }
    const setup = {
        idmap,
        env,
        options,
        client,
        struct,
        data: entityData,
        explain: 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN,
        live,
        transport,
        now: Date.now(),
    };
    return setup;
}
//# sourceMappingURL=MerchantPortalPamPackageControllerEntity.test.js.map