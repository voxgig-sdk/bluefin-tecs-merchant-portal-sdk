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
(0, node_test_1.describe)('MerchantPortalPamDocumentControllerEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.BluefinTecsMerchantPortalSDK.test();
        const ent = testsdk.MerchantPortalPamDocumentController();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE;
        for (const op of ['create']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'merchant_portal_pam_document_controller.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": { "appFormFieldDescUUID": { "a": true, "h": "App Form Field Desc Uuid", "n": "appFormFieldDescUUID", "r": true, "t": "`$STRING`", "key$": "appFormFieldDescUUID", "index$": 0 }, "packageOrderUUID": { "a": true, "h": "Package Order Uuid", "n": "packageOrderUUID", "r": false, "sh": "UUID of the package order.", "t": "`$STRING`", "key$": "packageOrderUUID", "index$": 1 }, "productOrderUUID": { "a": true, "h": "Product Order Uuid", "n": "productOrderUUID", "r": false, "sh": "UUID of the product order.", "t": "`$STRING`", "key$": "productOrderUUID", "index$": 2 } }, "name": "merchant_portal_pam_document_controller", "op": { "create": { "input": "data", "name": "create", "points": [{ "a": true, "co": { "id": "POST /merchantportalws/documentsList", "source": "openapi3", "version": 2 }, "g": { "header": [{ "a": true, "k": "header", "n": "authorization", "or": "authorization", "r": true, "t": "`$STRING`", "index$": 0 }] }, "k": "http", "m": "POST", "o": "/merchantportalws/documentsList", "q": { "exist": ["authorization"] }, "r": {}, "s": [{ "lit": "merchantportalws" }, { "lit": "documentsList" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }, { "a": true, "co": { "id": "POST /merchantportalws/downloadDocument", "source": "openapi3", "version": 2 }, "g": { "header": [{ "a": true, "k": "header", "n": "authorization", "or": "authorization", "r": true, "t": "`$STRING`", "index$": 0 }] }, "k": "http", "m": "POST", "o": "/merchantportalws/downloadDocument", "q": { "exist": ["authorization"] }, "r": {}, "s": [{ "lit": "merchantportalws" }, { "lit": "downloadDocument" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 1 }], "key$": "create" } }, "relations": { "ancestors": [] }, "key$": "merchant_portal_pam_document_controller", "name__orig": "merchant_portal_pam_document_controller", "Name": "MerchantPortalPamDocumentController", "name_": "merchant_portal_pam_document_controller", "name-": "merchant-portal-pam-document-controller", "NAME": "MERCHANT_PORTAL_PAM_DOCUMENT_CONTROLLER", "index$": 3 }, { "active": true, "entity": "merchant_portal_pam_document_controller", "key$": "BasicMerchantPortalPamDocumentControllerFlow", "kind": "basic", "name": "BasicMerchantPortalPamDocumentControllerFlow", "param": {}, "step": [{ "a": true, "d": {}, "i": { "ref": "merchant_portal_pam_document_controller_ref01" }, "m": {}, "o": "create", "s": [], "v": [], "index$": 0 }] }, 'MerchantPortalPamDocumentController', { "POST /merchantportalws/documentsList": { "protocol": "http", "requestBody": { "content": { "application/json": { "schema": { "type": "object", "properties": { "packageOrderUUID": { "type": "string", "description": "UUID of the package order. NOTE: Either package order UUID or product order UUID has to be present. If none is present error is returned. If both are present error is returned.", "key$": "packageOrderUUID" }, "productOrderUUID": { "type": "string", "description": "UUID of the product order. NOTE: Either package order UUID or product order UUID has to be present. If none is present error is returned. If both are present error is returned.", "key$": "productOrderUUID" } }, "title": "InputDocumentsList", "x-ref": "#/components/schemas/InputDocumentsList", "index$": 1 } } }, "description": "inputDocumentsList", "required": true }, "parameters": [{ "name": "Authorization", "in": "header", "description": "Authorization", "required": true, "schema": { "type": "string" }, "index$": 0 }] }, "POST /merchantportalws/downloadDocument": { "protocol": "http", "requestBody": { "content": { "application/json": { "schema": { "type": "object", "required": ["appFormFieldDescUUID"], "properties": { "appFormFieldDescUUID": { "type": "string", "key$": "appFormFieldDescUUID" }, "packageOrderUUID": { "type": "string", "description": "UUID of the package order. NOTE: Either package order UUID or product order UUID has to be present. If none is present error is returned. If both are present error is returned.", "key$": "packageOrderUUID" }, "productOrderUUID": { "type": "string", "description": "UUID of the product order. NOTE: Either package order UUID or product order UUID has to be present. If none is present error is returned. If both are present error is returned.", "key$": "productOrderUUID" } }, "title": "InputDownloadDocument", "x-ref": "#/components/schemas/InputDownloadDocument", "index$": 1 } } }, "description": "inputDownloadDocument", "required": true }, "parameters": [{ "name": "Authorization", "in": "header", "description": "Authorization", "required": true, "schema": { "type": "string" }, "index$": 0 }] } });
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        // CREATE
        const merchant_portal_pam_document_controller_ref01_ent = client.MerchantPortalPamDocumentController();
        let merchant_portal_pam_document_controller_ref01_data = setup.data.new.merchant_portal_pam_document_controller['merchant_portal_pam_document_controller_ref01'];
        merchant_portal_pam_document_controller_ref01_data = (await merchant_portal_pam_document_controller_ref01_ent.create(merchant_portal_pam_document_controller_ref01_data)).data();
        (0, node_assert_1.default)(null != merchant_portal_pam_document_controller_ref01_data);
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/merchant_portal_pam_document_controller/MerchantPortalPamDocumentControllerTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.BluefinTecsMerchantPortalSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['merchant_portal_pam_document_controller01', 'merchant_portal_pam_document_controller02', 'merchant_portal_pam_document_controller03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_DOCUMENT_CONTROLLER_ENTID': idmap,
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
    });
    idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_DOCUMENT_CONTROLLER_ENTID'];
    const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_DOCUMENT_CONTROLLER_ENTID'];
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
//# sourceMappingURL=MerchantPortalPamDocumentControllerEntity.test.js.map