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
(0, node_test_1.describe)('OutputUpdateProductEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.BluefinTecsMerchantPortalSDK.test();
        const ent = testsdk.OutputUpdateProduct();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE;
        for (const op of ['create']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'output_update_product.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": [{ "active": true, "name": "allowMultipleOrders", "req": false, "short": "An attribute to indicate if multiple orders are allowed", "type": "`$BOOLEAN`", "index$": 0 }, { "active": true, "name": "appFormName", "req": false, "short": "The name of the application form", "type": "`$STRING`", "index$": 1 }, { "active": true, "name": "contractNeeded", "req": false, "short": "An attribute to indicate if a contract is needed", "type": "`$BOOLEAN`", "index$": 2 }, { "active": true, "name": "credentialsNeeded", "req": false, "short": "An attribute to indicate if credentials are needed", "type": "`$BOOLEAN`", "index$": 3 }, { "active": true, "name": "descriptionKey", "req": false, "short": "The description of the product", "type": "`$STRING`", "index$": 4 }, { "active": true, "name": "nameKey", "req": false, "short": "The key of the product name", "type": "`$STRING`", "index$": 5 }, { "active": true, "name": "prescreeningAllowed", "req": false, "short": "An attribute to indicate if prescreening is allowed", "type": "`$BOOLEAN`", "index$": 6 }, { "active": true, "name": "productName", "req": false, "short": "The name of the product", "type": "`$STRING`", "index$": 7 }, { "active": true, "name": "productStatus", "req": false, "short": "The status of the product", "type": "`$STRING`", "index$": 8 }, { "active": true, "name": "productUUID", "req": true, "short": "The UUID of the product to update", "type": "`$STRING`", "index$": 9 }, { "active": true, "format": "int32", "name": "responseCode", "req": true, "short": "Response code.", "type": "`$INTEGER`", "index$": 10 }, { "active": true, "name": "responseMessage", "req": true, "short": "Response message.", "type": "`$STRING`", "index$": 11 }, { "active": true, "name": "vendorName", "req": false, "short": "The name of the vendor", "type": "`$STRING`", "index$": 12 }], "name": "output_update_product", "op": { "create": { "input": "data", "name": "create", "points": [{ "active": true, "args": { "header": [{ "active": true, "kind": "header", "name": "authorization", "orig": "authorization", "reqd": true, "type": "`$STRING`" }] }, "contract": { "id": "POST /merchantportalws/updateProduct", "json": "{\"operationId\":\"updateProductUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"allowMultipleOrders\":{\"description\":\"An attribute to indicate if multiple orders are allowed\",\"example\":true,\"type\":\"boolean\"},\"appFormName\":{\"description\":\"The name of the application form\",\"example\":\"My Application Form Name\",\"type\":\"string\"},\"contractNeeded\":{\"description\":\"An attribute to indicate if a contract is needed\",\"example\":true,\"type\":\"boolean\"},\"credentialsNeeded\":{\"description\":\"An attribute to indicate if credentials are needed\",\"example\":true,\"type\":\"boolean\"},\"descriptionKey\":{\"description\":\"The description of the product\",\"example\":\"My Product Description\",\"type\":\"string\"},\"nameKey\":{\"description\":\"The key of the product name\",\"example\":\"My Product Name Key\",\"type\":\"string\"},\"prescreeningAllowed\":{\"description\":\"An attribute to indicate if prescreening is allowed\",\"example\":true,\"type\":\"boolean\"},\"productName\":{\"description\":\"The name of the product\",\"example\":\"My Product Name\",\"type\":\"string\"},\"productStatus\":{\"description\":\"The status of the product\",\"example\":\"ACTIVE\",\"type\":\"string\"},\"productUUID\":{\"description\":\"The UUID of the product to update\",\"example\":\"123e4567-e89b-12d3-a456-426614174000\",\"type\":\"string\"},\"vendorName\":{\"description\":\"The name of the vendor\",\"example\":\"My Vendor Name\",\"type\":\"string\"}},\"required\":[\"productUUID\"],\"title\":\"InputUpdateProduct\",\"type\":\"object\"}}},\"description\":\"inputUpdateProduct\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputUpdateProduct\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "POST", "orig": "/merchantportalws/updateProduct", "segments": [{ "lit": "merchantportalws" }, { "lit": "updateProduct" }], "select": { "exist": ["authorization"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "create" } }, "relations": { "ancestors": [] }, "key$": "output_update_product", "name__orig": "output_update_product", "Name": "OutputUpdateProduct", "name_": "output_update_product", "name-": "output-update-product", "NAME": "OUTPUT_UPDATE_PRODUCT", "index$": 18 }, { "active": true, "entity": "output_update_product", "key$": "BasicOutputUpdateProductFlow", "kind": "basic", "name": "BasicOutputUpdateProductFlow", "param": {}, "step": [{ "active": true, "data": {}, "input": { "ref": "output_update_product_ref01" }, "match": {}, "op": "create", "spec": [], "valid": [], "index$": 0 }] }, 'OutputUpdateProduct');
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        // CREATE
        const output_update_product_ref01_ent = client.OutputUpdateProduct();
        let output_update_product_ref01_data = setup.data.new.output_update_product['output_update_product_ref01'];
        output_update_product_ref01_data = (await output_update_product_ref01_ent.create(output_update_product_ref01_data)).data();
        (0, node_assert_1.default)(null != output_update_product_ref01_data);
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/output_update_product/OutputUpdateProductTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.BluefinTecsMerchantPortalSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['output_update_product01', 'output_update_product02', 'output_update_product03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_UPDATE_PRODUCT_ENTID': idmap,
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
    });
    idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_UPDATE_PRODUCT_ENTID'];
    const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_UPDATE_PRODUCT_ENTID'];
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
//# sourceMappingURL=OutputUpdateProductEntity.test.js.map