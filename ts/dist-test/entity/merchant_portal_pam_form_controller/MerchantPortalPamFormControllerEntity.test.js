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
(0, node_test_1.describe)('MerchantPortalPamFormControllerEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.BluefinTecsMerchantPortalSDK.test();
        const ent = testsdk.MerchantPortalPamFormController();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE;
        for (const op of ['create']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'merchant_portal_pam_form_controller.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": [{ "active": true, "name": "appFormFieldsDescUUID", "req": true, "type": "`$STRING`", "index$": 0 }, { "active": true, "name": "filter", "req": false, "type": "`$OBJECT`", "index$": 1 }, { "active": true, "name": "language", "op": { "create": { "req": false, "type": "`$STRING`" } }, "req": true, "type": "`$STRING`", "index$": 2 }, { "active": true, "name": "packageOrder", "req": false, "type": "`$OBJECT`", "index$": 3 }, { "active": true, "name": "packageOrderUUID", "op": { "create": { "req": false, "type": "`$STRING`" } }, "req": true, "short": "UUID of the package order.", "type": "`$STRING`", "index$": 4 }, { "active": true, "name": "packageUUID", "req": false, "type": "`$STRING`", "index$": 5 }, { "active": true, "name": "productOrderUUID", "op": { "create": { "req": true, "type": "`$STRING`" } }, "req": false, "short": "UUID of the product order.", "type": "`$STRING`", "index$": 6 }, { "active": true, "name": "productOrders", "req": false, "type": "`$ARRAY`", "index$": 7 }, { "active": true, "name": "reasonOfReopening", "req": true, "type": "`$STRING`", "index$": 8 }], "name": "merchant_portal_pam_form_controller", "op": { "create": { "input": "data", "name": "create", "points": [{ "active": true, "args": { "header": [{ "active": true, "kind": "header", "name": "authorization", "orig": "authorization", "reqd": true, "type": "`$STRING`" }] }, "contract": { "id": "POST /merchantportalws/applicationForm", "json": "{\"operationId\":\"applicationFormUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"filter\":{\"properties\":{\"page\":{\"format\":\"int32\",\"type\":\"integer\"},\"productOrderUUID\":{\"type\":\"string\"}},\"title\":\"InputApplicationForm_Filter\",\"type\":\"object\"},\"language\":{\"type\":\"string\"},\"packageOrderUUID\":{\"type\":\"string\"}},\"required\":[\"language\",\"packageOrderUUID\"],\"title\":\"InputApplicationForm\",\"type\":\"object\"}}},\"description\":\"inputApplicationForm\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"packageOrder\":{\"properties\":{\"packageApplicationForm\":{\"items\":{\"properties\":{\"appFormFieldDescUUID\":{\"type\":\"string\"},\"defaultValue\":{\"type\":\"string\"},\"description\":{\"type\":\"string\"},\"fieldInputTypeDescription\":{\"type\":\"string\"},\"mandatory\":{\"type\":\"boolean\"},\"merchantAppFormsValue\":{\"type\":\"string\"},\"name\":{\"type\":\"string\"},\"originalReopenReason\":{\"type\":\"string\"},\"page\":{\"format\":\"int32\",\"type\":\"integer\"},\"placeHolder\":{\"type\":\"string\"},\"position\":{\"format\":\"int32\",\"type\":\"integer\"},\"possibleValues\":{\"type\":\"string\"},\"readOnly\":{\"type\":\"boolean\"},\"reopenReason\":{\"type\":\"string\"},\"visible\":{\"type\":\"boolean\"}},\"title\":\"OutputApplicationForm_ApplicationFormItem\",\"type\":\"object\"},\"type\":\"array\"},\"pagesCount\":{\"format\":\"int32\",\"type\":\"integer\"},\"statusDescription\":{\"type\":\"string\"},\"uuid\":{\"type\":\"string\"}},\"title\":\"OutputApplicationForm_PackageOrder\",\"type\":\"object\"},\"productOrders\":{\"items\":{\"properties\":{\"applicationForm\":{\"items\":{\"properties\":{\"appFormFieldDescUUID\":{\"type\":\"string\"},\"defaultValue\":{\"type\":\"string\"},\"description\":{\"type\":\"string\"},\"fieldInputTypeDescription\":{\"type\":\"string\"},\"mandatory\":{\"type\":\"boolean\"},\"merchantAppFormsValue\":{\"type\":\"string\"},\"name\":{\"type\":\"string\"},\"originalReopenReason\":{\"type\":\"string\"},\"page\":{\"format\":\"int32\",\"type\":\"integer\"},\"placeHolder\":{\"type\":\"string\"},\"position\":{\"format\":\"int32\",\"type\":\"integer\"},\"possibleValues\":{\"type\":\"string\"},\"readOnly\":{\"type\":\"boolean\"},\"reopenReason\":{\"type\":\"string\"},\"visible\":{\"type\":\"boolean\"}},\"title\":\"OutputApplicationForm_ApplicationFormItem\",\"type\":\"object\"},\"type\":\"array\"},\"pagesCount\":{\"format\":\"int32\",\"type\":\"integer\"},\"productName\":{\"type\":\"string\"},\"statusDescription\":{\"type\":\"string\"},\"uuid\":{\"type\":\"string\"}},\"title\":\"OutputApplicationForm_ProductOrder\",\"type\":\"object\"},\"type\":\"array\"},\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputApplicationForm\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "POST", "orig": "/merchantportalws/applicationForm", "segments": [{ "lit": "merchantportalws" }, { "lit": "applicationForm" }], "select": { "exist": ["authorization"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }, { "active": true, "args": { "header": [{ "active": true, "kind": "header", "name": "authorization", "orig": "authorization", "reqd": true, "type": "`$STRING`" }] }, "contract": { "id": "POST /merchantportalws/packageForm", "json": "{\"operationId\":\"merchantFormUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"filter\":{\"properties\":{\"productType\":{\"description\":\"Name of the product type\",\"example\":\"MERCHANT_CONTRACT\",\"type\":\"string\"},\"productUUID\":{\"type\":\"string\"}},\"title\":\"InputMerchantForm_Filter\",\"type\":\"object\"},\"language\":{\"type\":\"string\"},\"packageUUID\":{\"type\":\"string\"}},\"title\":\"InputMerchantForm\",\"type\":\"object\"}}},\"description\":\"inputMerchantForm\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"packages\":{\"items\":{\"properties\":{\"packageFormItems\":{\"items\":{\"properties\":{\"appFormFieldDescUUID\":{\"type\":\"string\"},\"backendMappingDescription\":{\"type\":\"string\"},\"backendMappingField\":{\"type\":\"string\"},\"backendMappingService\":{\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"defaultValue\":{\"type\":\"string\"},\"description\":{\"type\":\"string\"},\"fieldConstraints\":{\"items\":{\"properties\":{\"name\":{\"type\":\"string\"},\"value\":{\"type\":\"string\"}},\"title\":\"OutputMerchantForm_FieldConstraint\",\"type\":\"object\"},\"type\":\"array\"},\"fieldInputTypeDescription\":{\"type\":\"string\"},\"mandatory\":{\"type\":\"boolean\"},\"name\":{\"type\":\"string\"},\"page\":{\"format\":\"int32\",\"type\":\"integer\"},\"placeHolder\":{\"type\":\"string\"},\"position\":{\"format\":\"int32\",\"type\":\"integer\"},\"possibleValues\":{\"type\":\"string\"},\"readOnly\":{\"type\":\"boolean\"},\"visible\":{\"type\":\"boolean\"}},\"title\":\"OutputMerchantForm_ApplicationFormItem\",\"type\":\"object\"},\"type\":\"array\"},\"pagesCount\":{\"format\":\"int32\",\"type\":\"integer\"}},\"title\":\"OutputMerchantForm_Package\",\"type\":\"object\"},\"type\":\"array\"},\"products\":{\"items\":{\"properties\":{\"pagesCount\":{\"format\":\"int32\",\"type\":\"integer\"},\"productFormItems\":{\"items\":{\"properties\":{\"appFormFieldDescUUID\":{\"type\":\"string\"},\"backendMappingDescription\":{\"type\":\"string\"},\"backendMappingField\":{\"type\":\"string\"},\"backendMappingService\":{\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"defaultValue\":{\"type\":\"string\"},\"description\":{\"type\":\"string\"},\"fieldConstraints\":{\"items\":{\"properties\":{\"name\":{\"type\":\"string\"},\"value\":{\"type\":\"string\"}},\"title\":\"OutputMerchantForm_FieldConstraint\",\"type\":\"object\"},\"type\":\"array\"},\"fieldInputTypeDescription\":{\"type\":\"string\"},\"mandatory\":{\"type\":\"boolean\"},\"name\":{\"type\":\"string\"},\"page\":{\"format\":\"int32\",\"type\":\"integer\"},\"placeHolder\":{\"type\":\"string\"},\"position\":{\"format\":\"int32\",\"type\":\"integer\"},\"possibleValues\":{\"type\":\"string\"},\"readOnly\":{\"type\":\"boolean\"},\"visible\":{\"type\":\"boolean\"}},\"title\":\"OutputMerchantForm_ApplicationFormItem\",\"type\":\"object\"},\"type\":\"array\"},\"productName\":{\"type\":\"string\"}},\"title\":\"OutputMerchantForm_Product\",\"type\":\"object\"},\"type\":\"array\"},\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputMerchantForm\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "POST", "orig": "/merchantportalws/packageForm", "segments": [{ "lit": "merchantportalws" }, { "lit": "packageForm" }], "select": { "exist": ["authorization"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 1 }, { "active": true, "args": { "header": [{ "active": true, "kind": "header", "name": "authorization", "orig": "authorization", "reqd": true, "type": "`$STRING`" }] }, "contract": { "id": "POST /merchantportalws/reopenForm", "json": "{\"operationId\":\"reopenFormUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"appFormFieldsDescUUID\":{\"type\":\"string\"},\"packageOrderUUID\":{\"description\":\"UUID of the package order. NOTE: Either package order UUID or product order UUID has to be present. If none is present error is returned. If both are present error is returned.\",\"type\":\"string\"},\"productOrderUUID\":{\"description\":\"UUID of the product order. NOTE: Either package order UUID or product order UUID has to be present. If none is present error is returned. If both are present error is returned.\",\"type\":\"string\"},\"reasonOfReopening\":{\"type\":\"string\"}},\"required\":[\"appFormFieldsDescUUID\",\"reasonOfReopening\"],\"title\":\"InputReopenForm\",\"type\":\"object\"}}},\"description\":\"inputReopenForm\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputReopenForm\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "POST", "orig": "/merchantportalws/reopenForm", "segments": [{ "lit": "merchantportalws" }, { "lit": "reopenForm" }], "select": { "exist": ["authorization"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 2 }, { "active": true, "args": { "header": [{ "active": true, "kind": "header", "name": "authorization", "orig": "authorization", "reqd": true, "type": "`$STRING`" }] }, "contract": { "id": "POST /merchantportalws/secretKey", "json": "{\"operationId\":\"secretKeyUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"productOrderUUID\":{\"type\":\"string\"}},\"required\":[\"productOrderUUID\"],\"title\":\"InputSecretKey\",\"type\":\"object\"}}},\"description\":\"inputSecretKey\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"},\"tecsWebSecretKey\":{\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputSecretKey\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "POST", "orig": "/merchantportalws/secretKey", "segments": [{ "lit": "merchantportalws" }, { "lit": "secretKey" }], "select": { "exist": ["authorization"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 3 }, { "active": true, "args": { "header": [{ "active": true, "kind": "header", "name": "authorization", "orig": "authorization", "reqd": true, "type": "`$STRING`" }] }, "contract": { "id": "POST /merchantportalws/submitForm", "json": "{\"operationId\":\"submitFormUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"productOrderUUID\":{\"type\":\"string\"}},\"required\":[\"productOrderUUID\"],\"title\":\"InputSubmitForm\",\"type\":\"object\"}}},\"description\":\"inputSubmitForm\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"missingFields\":{\"items\":{\"properties\":{\"appFormFieldDescUUID\":{\"type\":\"string\"},\"packageOrderUUID\":{\"type\":\"string\"},\"productOrderUUID\":{\"type\":\"string\"}},\"title\":\"OutputSubmitForm_MissingField\",\"type\":\"object\"},\"type\":\"array\"},\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputSubmitForm\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "POST", "orig": "/merchantportalws/submitForm", "segments": [{ "lit": "merchantportalws" }, { "lit": "submitForm" }], "select": { "exist": ["authorization"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 4 }, { "active": true, "args": { "header": [{ "active": true, "kind": "header", "name": "authorization", "orig": "authorization", "reqd": true, "type": "`$STRING`" }] }, "contract": { "id": "POST /merchantportalws/submitValues", "json": "{\"operationId\":\"submitValuesUsingPOST\",\"parameters\":[{\"description\":\"Authorization\",\"in\":\"header\",\"name\":\"Authorization\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"packageOrder\":{\"properties\":{\"applicationForms\":{\"items\":{\"properties\":{\"appFormFieldDescUUID\":{\"type\":\"string\"},\"document\":{\"description\":\"Base64 encoded byte array of document. The following types are supported: PDF, JPEG.\",\"example\":\"JVBERi0=\",\"type\":\"string\"},\"merchantAppFormsValue\":{\"type\":\"string\"}},\"required\":[\"appFormFieldDescUUID\",\"merchantAppFormsValue\"],\"title\":\"InputSubmitValues_ApplicationForm\",\"type\":\"object\"},\"type\":\"array\"},\"uuid\":{\"type\":\"string\"}},\"title\":\"InputSubmitValues_PackageOrder\",\"type\":\"object\"},\"productOrders\":{\"items\":{\"properties\":{\"applicationForms\":{\"items\":{\"properties\":{\"appFormFieldDescUUID\":{\"type\":\"string\"},\"document\":{\"description\":\"Base64 encoded byte array of document. The following types are supported: PDF, JPEG.\",\"example\":\"JVBERi0=\",\"type\":\"string\"},\"merchantAppFormsValue\":{\"type\":\"string\"}},\"required\":[\"appFormFieldDescUUID\",\"merchantAppFormsValue\"],\"title\":\"InputSubmitValues_ApplicationForm\",\"type\":\"object\"},\"type\":\"array\"},\"uuid\":{\"type\":\"string\"}},\"title\":\"InputSubmitValues_ProductOrder\",\"type\":\"object\"},\"type\":\"array\"}},\"title\":\"InputSubmitValues\",\"type\":\"object\"}}},\"description\":\"inputSubmitValues\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"*/*\":{\"schema\":{\"properties\":{\"responseCode\":{\"description\":\"Response code. For success state 0. For failure state lower than 0.\",\"example\":0,\"format\":\"int32\",\"type\":\"integer\"},\"responseMessage\":{\"description\":\"Response message. For success state OK. For failure state description of the cause.\",\"example\":\"OK\",\"type\":\"string\"}},\"required\":[\"responseCode\",\"responseMessage\"],\"title\":\"OutputSubmitValues\",\"type\":\"object\"}}},\"description\":\"OK\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "POST", "orig": "/merchantportalws/submitValues", "segments": [{ "lit": "merchantportalws" }, { "lit": "submitValues" }], "select": { "exist": ["authorization"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 5 }], "key$": "create" } }, "relations": { "ancestors": [] }, "key$": "merchant_portal_pam_form_controller", "name__orig": "merchant_portal_pam_form_controller", "Name": "MerchantPortalPamFormController", "name_": "merchant_portal_pam_form_controller", "name-": "merchant-portal-pam-form-controller", "NAME": "MERCHANT_PORTAL_PAM_FORM_CONTROLLER", "index$": 4 }, { "active": true, "entity": "merchant_portal_pam_form_controller", "key$": "BasicMerchantPortalPamFormControllerFlow", "kind": "basic", "name": "BasicMerchantPortalPamFormControllerFlow", "param": {}, "step": [{ "active": true, "data": {}, "input": { "ref": "merchant_portal_pam_form_controller_ref01" }, "match": {}, "op": "create", "spec": [], "valid": [], "index$": 0 }] }, 'MerchantPortalPamFormController');
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        // CREATE
        const merchant_portal_pam_form_controller_ref01_ent = client.MerchantPortalPamFormController();
        let merchant_portal_pam_form_controller_ref01_data = setup.data.new.merchant_portal_pam_form_controller['merchant_portal_pam_form_controller_ref01'];
        merchant_portal_pam_form_controller_ref01_data = (await merchant_portal_pam_form_controller_ref01_ent.create(merchant_portal_pam_form_controller_ref01_data)).data();
        (0, node_assert_1.default)(null != merchant_portal_pam_form_controller_ref01_data);
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/merchant_portal_pam_form_controller/MerchantPortalPamFormControllerTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.BluefinTecsMerchantPortalSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['merchant_portal_pam_form_controller01', 'merchant_portal_pam_form_controller02', 'merchant_portal_pam_form_controller03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_FORM_CONTROLLER_ENTID': idmap,
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
    });
    idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_FORM_CONTROLLER_ENTID'];
    const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_FORM_CONTROLLER_ENTID'];
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
//# sourceMappingURL=MerchantPortalPamFormControllerEntity.test.js.map