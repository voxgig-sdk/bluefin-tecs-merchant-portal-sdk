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
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": { "allowMultipleOrders": { "a": true, "h": "Allow Multiple Orders", "n": "allowMultipleOrders", "r": false, "sh": "An attribute to indicate if multiple orders are allowed", "t": "`$BOOLEAN`", "key$": "allowMultipleOrders", "index$": 0 }, "appFormName": { "a": true, "h": "App Form Name", "n": "appFormName", "r": false, "sh": "The name of the application form", "t": "`$STRING`", "key$": "appFormName", "index$": 1 }, "contractNeeded": { "a": true, "h": "Contract Needed", "n": "contractNeeded", "r": false, "sh": "An attribute to indicate if a contract is needed", "t": "`$BOOLEAN`", "key$": "contractNeeded", "index$": 2 }, "credentialsNeeded": { "a": true, "h": "Credentials Needed", "n": "credentialsNeeded", "r": false, "sh": "An attribute to indicate if credentials are needed", "t": "`$BOOLEAN`", "key$": "credentialsNeeded", "index$": 3 }, "descriptionKey": { "a": true, "h": "Description Key", "n": "descriptionKey", "r": false, "sh": "The description of the product", "t": "`$STRING`", "key$": "descriptionKey", "index$": 4 }, "nameKey": { "a": true, "h": "Name Key", "n": "nameKey", "r": false, "sh": "The key of the product name", "t": "`$STRING`", "key$": "nameKey", "index$": 5 }, "prescreeningAllowed": { "a": true, "h": "Prescreening Allowed", "n": "prescreeningAllowed", "r": false, "sh": "An attribute to indicate if prescreening is allowed", "t": "`$BOOLEAN`", "key$": "prescreeningAllowed", "index$": 6 }, "productName": { "a": true, "h": "Product Name", "n": "productName", "r": false, "sh": "The name of the product", "t": "`$STRING`", "key$": "productName", "index$": 7 }, "productStatus": { "a": true, "h": "Product Status", "n": "productStatus", "r": false, "sh": "The status of the product", "t": "`$STRING`", "key$": "productStatus", "index$": 8 }, "productUUID": { "a": true, "h": "Product Uuid", "n": "productUUID", "r": true, "sh": "The UUID of the product to update", "t": "`$STRING`", "key$": "productUUID", "index$": 9 }, "responseCode": { "a": true, "fo": "int32", "h": "Response Code", "n": "responseCode", "r": true, "sh": "Response code.", "t": "`$INTEGER`", "key$": "responseCode", "index$": 10 }, "responseMessage": { "a": true, "h": "Response Message", "n": "responseMessage", "r": true, "sh": "Response message.", "t": "`$STRING`", "key$": "responseMessage", "index$": 11 }, "vendorName": { "a": true, "h": "Vendor Name", "n": "vendorName", "r": false, "sh": "The name of the vendor", "t": "`$STRING`", "key$": "vendorName", "index$": 12 } }, "name": "output_update_product", "op": { "create": { "input": "data", "name": "create", "points": [{ "a": true, "co": { "id": "POST /merchantportalws/updateProduct", "source": "openapi3", "version": 2 }, "g": { "header": [{ "a": true, "k": "header", "n": "authorization", "or": "authorization", "r": true, "t": "`$STRING`", "index$": 0 }] }, "k": "http", "m": "POST", "o": "/merchantportalws/updateProduct", "q": { "exist": ["authorization"] }, "r": {}, "s": [{ "lit": "merchantportalws" }, { "lit": "updateProduct" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "create" } }, "relations": { "ancestors": [] }, "key$": "output_update_product", "name__orig": "output_update_product", "Name": "OutputUpdateProduct", "name_": "output_update_product", "name-": "output-update-product", "NAME": "OUTPUT_UPDATE_PRODUCT", "index$": 18 }, { "active": true, "entity": "output_update_product", "key$": "BasicOutputUpdateProductFlow", "kind": "basic", "name": "BasicOutputUpdateProductFlow", "param": {}, "step": [{ "a": true, "d": {}, "i": { "ref": "output_update_product_ref01" }, "m": {}, "o": "create", "s": [], "v": [], "index$": 0 }] }, 'OutputUpdateProduct', { "POST /merchantportalws/updateProduct": { "protocol": "http", "requestBody": { "content": { "application/json": { "schema": { "type": "object", "required": ["productUUID"], "properties": { "allowMultipleOrders": { "type": "boolean", "example": true, "description": "An attribute to indicate if multiple orders are allowed", "key$": "allowMultipleOrders" }, "appFormName": { "type": "string", "example": "My Application Form Name", "description": "The name of the application form", "key$": "appFormName" }, "contractNeeded": { "type": "boolean", "example": true, "description": "An attribute to indicate if a contract is needed", "key$": "contractNeeded" }, "credentialsNeeded": { "type": "boolean", "example": true, "description": "An attribute to indicate if credentials are needed", "key$": "credentialsNeeded" }, "descriptionKey": { "type": "string", "example": "My Product Description", "description": "The description of the product", "key$": "descriptionKey" }, "nameKey": { "type": "string", "example": "My Product Name Key", "description": "The key of the product name", "key$": "nameKey" }, "prescreeningAllowed": { "type": "boolean", "example": true, "description": "An attribute to indicate if prescreening is allowed", "key$": "prescreeningAllowed" }, "productName": { "type": "string", "example": "My Product Name", "description": "The name of the product", "key$": "productName" }, "productStatus": { "type": "string", "example": "ACTIVE", "description": "The status of the product", "key$": "productStatus" }, "productUUID": { "type": "string", "example": "123e4567-e89b-12d3-a456-426614174000", "description": "The UUID of the product to update", "key$": "productUUID" }, "vendorName": { "type": "string", "example": "My Vendor Name", "description": "The name of the vendor", "key$": "vendorName" } }, "title": "InputUpdateProduct", "x-ref": "#/components/schemas/InputUpdateProduct", "index$": 1 } } }, "description": "inputUpdateProduct", "required": true }, "parameters": [{ "name": "Authorization", "in": "header", "description": "Authorization", "required": true, "schema": { "type": "string" }, "index$": 0 }] } });
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