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
(0, node_test_1.describe)('OutputMoveTidEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.BluefinTecsMerchantPortalSDK.test();
        const ent = testsdk.OutputMoveTid();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE;
        for (const op of ['create']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'output_move_tid.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": { "productOrderUUIDs": { "a": true, "h": "Product Order Uui Ds", "n": "productOrderUUIDs", "r": true, "t": "`$ARRAY`", "key$": "productOrderUUIDs", "index$": 0 }, "responseCode": { "a": true, "fo": "int32", "h": "Response Code", "n": "responseCode", "r": true, "sh": "Response code.", "t": "`$INTEGER`", "key$": "responseCode", "index$": 1 }, "responseMessage": { "a": true, "h": "Response Message", "n": "responseMessage", "r": true, "sh": "Response message.", "t": "`$STRING`", "key$": "responseMessage", "index$": 2 }, "targetPackageOrderUUID": { "a": true, "h": "Target Package Order Uuid", "n": "targetPackageOrderUUID", "r": true, "t": "`$STRING`", "key$": "targetPackageOrderUUID", "index$": 3 }, "targetProductOrderUUID": { "a": true, "h": "Target Product Order Uuid", "n": "targetProductOrderUUID", "r": true, "t": "`$STRING`", "key$": "targetProductOrderUUID", "index$": 4 } }, "name": "output_move_tid", "op": { "create": { "input": "data", "name": "create", "points": [{ "a": true, "co": { "id": "POST /merchantportalws/moveTid", "source": "openapi3", "version": 2 }, "g": { "header": [{ "a": true, "k": "header", "n": "authorization", "or": "authorization", "r": true, "t": "`$STRING`", "index$": 0 }] }, "k": "http", "m": "POST", "o": "/merchantportalws/moveTid", "q": { "exist": ["authorization"] }, "r": {}, "s": [{ "lit": "merchantportalws" }, { "lit": "moveTid" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "create" } }, "relations": { "ancestors": [] }, "key$": "output_move_tid", "name__orig": "output_move_tid", "Name": "OutputMoveTid", "name_": "output_move_tid", "name-": "output-move-tid", "NAME": "OUTPUT_MOVE_TID", "index$": 14 }, { "active": true, "entity": "output_move_tid", "key$": "BasicOutputMoveTidFlow", "kind": "basic", "name": "BasicOutputMoveTidFlow", "param": {}, "step": [{ "a": true, "d": {}, "i": { "ref": "output_move_tid_ref01" }, "m": {}, "o": "create", "s": [], "v": [], "index$": 0 }] }, 'OutputMoveTid', { "POST /merchantportalws/moveTid": { "protocol": "http", "requestBody": { "content": { "application/json": { "schema": { "type": "object", "required": ["productOrderUUIDs", "targetPackageOrderUUID", "targetProductOrderUUID"], "properties": { "productOrderUUIDs": { "type": "array", "uniqueItems": true, "items": { "type": "string" }, "key$": "productOrderUUIDs" }, "targetPackageOrderUUID": { "type": "string", "key$": "targetPackageOrderUUID" }, "targetProductOrderUUID": { "type": "string", "key$": "targetProductOrderUUID" } }, "title": "InputMoveTid", "x-ref": "#/components/schemas/InputMoveTid", "index$": 1 } } }, "description": "inputMoveTid", "required": true }, "parameters": [{ "name": "Authorization", "in": "header", "description": "Authorization", "required": true, "schema": { "type": "string" }, "index$": 0 }] } });
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        // CREATE
        const output_move_tid_ref01_ent = client.OutputMoveTid();
        let output_move_tid_ref01_data = setup.data.new.output_move_tid['output_move_tid_ref01'];
        output_move_tid_ref01_data = (await output_move_tid_ref01_ent.create(output_move_tid_ref01_data)).data();
        (0, node_assert_1.default)(null != output_move_tid_ref01_data);
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/output_move_tid/OutputMoveTidTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.BluefinTecsMerchantPortalSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['output_move_tid01', 'output_move_tid02', 'output_move_tid03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_MOVE_TID_ENTID': idmap,
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
    });
    idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_MOVE_TID_ENTID'];
    const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_OUTPUT_MOVE_TID_ENTID'];
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
//# sourceMappingURL=OutputMoveTidEntity.test.js.map