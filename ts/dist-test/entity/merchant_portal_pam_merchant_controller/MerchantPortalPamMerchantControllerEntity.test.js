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
(0, node_test_1.describe)('MerchantPortalPamMerchantControllerEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.BluefinTecsMerchantPortalSDK.test();
        const ent = testsdk.MerchantPortalPamMerchantController();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE;
        for (const op of ['create']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'merchant_portal_pam_merchant_controller.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": { "additional_data": { "a": true, "h": "Additional Data", "n": "additional_data", "r": false, "sh": "Optional additional merchant-specific data related to enabling acquiring.", "t": "`$OBJECT`", "key$": "additional_data", "index$": 0 }, "businessRegistrationNumber": { "a": true, "h": "Business Registration Number", "n": "businessRegistrationNumber", "r": true, "t": "`$STRING`", "key$": "businessRegistrationNumber", "index$": 1 }, "city": { "a": true, "h": "City", "n": "city", "r": false, "sh": "City where the merchant is located.", "t": "`$STRING`", "key$": "city", "index$": 2 }, "companyName": { "a": true, "h": "Company Name", "n": "companyName", "r": true, "t": "`$STRING`", "key$": "companyName", "index$": 3 }, "corporateUUID": { "a": true, "h": "Corporate Uuid", "n": "corporateUUID", "r": true, "sh": "Unique identifier for the corporate entity.", "t": "`$STRING`", "key$": "corporateUUID", "index$": 4 }, "country": { "a": true, "h": "Country", "n": "country", "r": false, "sh": "Country where the merchant is located.", "t": "`$STRING`", "key$": "country", "index$": 5 }, "currency": { "a": true, "h": "Currency", "n": "currency", "r": true, "sh": "Transaction currency in ISO 4217 format.", "t": "`$STRING`", "key$": "currency", "index$": 6 }, "email": { "a": true, "h": "Email", "n": "email", "r": true, "t": "`$STRING`", "key$": "email", "index$": 7 }, "language": { "a": true, "h": "Language", "n": "language", "r": true, "t": "`$STRING`", "key$": "language", "index$": 8 }, "login": { "a": true, "h": "Login", "n": "login", "r": true, "t": "`$STRING`", "key$": "login", "index$": 9 }, "mandator": { "a": true, "h": "Mandator", "n": "mandator", "r": true, "sh": "Mandator name assigned by TECS.", "t": "`$STRING`", "key$": "mandator", "index$": 10 }, "merchantContractNumber": { "a": true, "h": "Merchant Contract Number", "n": "merchantContractNumber", "op": { "create": { "req": false, "type": "`$STRING`" } }, "r": true, "sh": "Unique identifier for the merchant within a specific system.", "t": "`$STRING`", "key$": "merchantContractNumber", "index$": 11 }, "merchantName": { "a": true, "h": "Merchant Name", "n": "merchantName", "r": false, "sh": "Name of the merchant.", "t": "`$STRING`", "key$": "merchantName", "index$": 12 }, "merchant_category_code": { "a": true, "h": "Merchant Category Code", "n": "merchant_category_code", "r": false, "sh": "Merchant Category Code (MCC) describing the merchant’s type of business.", "t": "`$STRING`", "key$": "merchant_category_code", "index$": 13 }, "packageUUID": { "a": true, "h": "Package Uuid", "n": "packageUUID", "r": false, "sh": "UUID of the package.", "t": "`$STRING`", "key$": "packageUUID", "index$": 14 }, "packageorderuuid": { "a": true, "h": "Packageorderuuid", "n": "packageorderuuid", "r": true, "sh": "Unique identifier for the registered merchant in the TECS system.", "t": "`$STRING`", "key$": "packageorderuuid", "index$": 15 }, "phoneNumber": { "a": true, "h": "Phone Number", "n": "phoneNumber", "r": true, "t": "`$STRING`", "key$": "phoneNumber", "index$": 16 }, "postalCode": { "a": true, "h": "Postal Code", "n": "postalCode", "r": false, "sh": "Postal or ZIP code of the merchant’s location.", "t": "`$STRING`", "key$": "postalCode", "index$": 17 }, "productid_acquirer": { "a": true, "h": "Productid Acquirer", "n": "productid_acquirer", "r": true, "sh": "Identifier of the product for which acquiring is to be enabled.", "t": "`$STRING`", "key$": "productid_acquirer", "index$": 18 }, "region": { "a": true, "h": "Region", "n": "region", "r": false, "sh": "State or province where the merchant is located.", "t": "`$STRING`", "key$": "region", "index$": 19 }, "registrationNumber": { "a": true, "h": "Registration Number", "n": "registrationNumber", "r": false, "sh": "Business registration number.", "t": "`$STRING`", "key$": "registrationNumber", "index$": 20 }, "signature": { "a": true, "h": "Signature", "n": "signature", "r": false, "sh": "Signature value = saltAsHex-hashAsHex.", "t": "`$STRING`", "key$": "signature", "index$": 21 }, "street": { "a": true, "h": "Street", "n": "street", "r": false, "sh": "Street address of the merchant.", "t": "`$STRING`", "key$": "street", "index$": 22 }, "terminalIds": { "a": true, "h": "Terminal Ids", "n": "terminalIds", "r": false, "sh": "Optional list of terminal IDs for which acquiring should be activated.", "t": "`$ARRAY`", "key$": "terminalIds", "index$": 23 }, "terminalid_acquirer": { "a": true, "h": "Terminalid Acquirer", "n": "terminalid_acquirer", "r": false, "sh": "Optional terminal ID provided by the acquirer.", "t": "`$STRING`", "key$": "terminalid_acquirer", "index$": 24 }, "vu_nummer": { "a": true, "h": "Vu Nummer", "n": "vu_nummer", "r": true, "sh": "Merchant contract number with the acquirer.", "t": "`$STRING`", "key$": "vu_nummer", "index$": 25 } }, "name": "merchant_portal_pam_merchant_controller", "op": { "create": { "input": "data", "name": "create", "points": [{ "a": true, "co": { "id": "POST /merchantportalws/contractNumber", "source": "openapi3", "version": 2 }, "g": { "header": [{ "a": true, "k": "header", "n": "authorization", "or": "authorization", "r": true, "t": "`$STRING`", "index$": 0 }] }, "k": "http", "m": "POST", "o": "/merchantportalws/contractNumber", "q": { "exist": ["authorization"] }, "r": {}, "s": [{ "lit": "merchantportalws" }, { "lit": "contractNumber" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }, { "a": true, "co": { "id": "POST /merchantportalws/registerAdditionalAcquiring", "source": "openapi3", "version": 2 }, "g": { "header": [{ "a": true, "k": "header", "n": "authorization", "or": "authorization", "r": true, "t": "`$STRING`", "index$": 0 }] }, "k": "http", "m": "POST", "o": "/merchantportalws/registerAdditionalAcquiring", "q": { "exist": ["authorization"] }, "r": {}, "s": [{ "lit": "merchantportalws" }, { "lit": "registerAdditionalAcquiring" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 1 }, { "a": true, "co": { "id": "POST /merchantportalws/updateMerchant", "source": "openapi3", "version": 2 }, "g": { "header": [{ "a": true, "k": "header", "n": "authorization", "or": "authorization", "r": true, "t": "`$STRING`", "index$": 0 }] }, "k": "http", "m": "POST", "o": "/merchantportalws/updateMerchant", "q": { "exist": ["authorization"] }, "r": {}, "s": [{ "lit": "merchantportalws" }, { "lit": "updateMerchant" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 2 }, { "a": true, "co": { "id": "POST /merchantportalws/registerMerchant", "source": "openapi3", "version": 2 }, "g": {}, "k": "http", "m": "POST", "o": "/merchantportalws/registerMerchant", "q": {}, "r": {}, "s": [{ "lit": "merchantportalws" }, { "lit": "registerMerchant" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 3 }], "key$": "create" } }, "relations": { "ancestors": [] }, "key$": "merchant_portal_pam_merchant_controller", "name__orig": "merchant_portal_pam_merchant_controller", "Name": "MerchantPortalPamMerchantController", "name_": "merchant_portal_pam_merchant_controller", "name-": "merchant-portal-pam-merchant-controller", "NAME": "MERCHANT_PORTAL_PAM_MERCHANT_CONTROLLER", "index$": 6 }, { "active": true, "entity": "merchant_portal_pam_merchant_controller", "key$": "BasicMerchantPortalPamMerchantControllerFlow", "kind": "basic", "name": "BasicMerchantPortalPamMerchantControllerFlow", "param": {}, "step": [{ "a": true, "d": {}, "i": { "ref": "merchant_portal_pam_merchant_controller_ref01" }, "m": {}, "o": "create", "s": [], "v": [], "index$": 0 }] }, 'MerchantPortalPamMerchantController', { "POST /merchantportalws/contractNumber": { "protocol": "http", "requestBody": { "content": { "application/json": { "schema": { "type": "object", "required": ["merchantContractNumber"], "properties": { "merchantContractNumber": { "type": "string", "key$": "merchantContractNumber" } }, "title": "InputContractNumber", "x-ref": "#/components/schemas/InputContractNumber", "index$": 1 } } }, "description": "inputContractNumber", "required": true }, "parameters": [{ "name": "Authorization", "in": "header", "description": "Authorization", "required": true, "schema": { "type": "string" }, "index$": 0 }] }, "POST /merchantportalws/registerAdditionalAcquiring": { "protocol": "http", "requestBody": { "content": { "application/json": { "schema": { "type": "object", "title": "InputRegisterAdditionalAcquiring", "required": ["currency", "packageorderuuid", "productid_acquirer", "vu_nummer"], "properties": { "additional_data": { "type": "object", "description": "Optional additional merchant-specific data related to enabling acquiring.\nThis may include custom key-value pairs that provide further context.\n", "example": { "firstname": "John", "surname": "Doe", "type": "tx-300", "version": "v1.2.3" }, "additionalProperties": { "type": "string" }, "key$": "additional_data" }, "currency": { "type": "string", "description": "Transaction currency in ISO 4217 format.", "example": "EUR", "minLength": 3, "maxLength": 3, "key$": "currency" }, "packageorderuuid": { "type": "string", "description": "Unique identifier for the registered merchant in the TECS system. This value is provided by TECS during the initial merchant registration and must be used for subsequent terminal or acquirer registrations.\n", "example": "16acb5a4-e573-423c-a024-fae90ea45d70", "key$": "packageorderuuid" }, "productid_acquirer": { "type": "string", "description": "Identifier of the product for which acquiring is to be enabled. If not provided, the default product as defined in the package may be used.\n", "example": "874d84a8-a6f4-47fa-b594-944593fc394b", "key$": "productid_acquirer" }, "terminalIds": { "type": "array", "description": "Optional list of terminal IDs for which acquiring should be activated. If omitted, acquiring will be enabled for all terminals associated with the merchant.\n", "items": { "type": "integer", "format": "int32" }, "example": [77000001, 77000002, 77000003], "key$": "terminalIds" }, "terminalid_acquirer": { "type": "string", "description": "Optional terminal ID provided by the acquirer.", "example": "66000001", "key$": "terminalid_acquirer" }, "vu_nummer": { "type": "string", "description": "Merchant contract number with the acquirer.", "example": "VU-20230501-00123", "key$": "vu_nummer" } }, "x-ref": "#/components/schemas/InputRegisterAdditionalAcquiring", "index$": 1 } } }, "description": "JSON payload containing details for registering additional acquiring. This includes the package order UUID, transaction currency, acquirer product identifier, merchant contract number, and optional terminal IDs.\n", "required": true }, "parameters": [{ "name": "Authorization", "in": "header", "description": "Authorization header containing valid credentials. Example: \"Bearer AT-2359-DFYpOWfDFSls4DeKDmGOXDyynx0a8Trwk\"\n", "required": true, "schema": { "type": "string" }, "index$": 0 }] }, "POST /merchantportalws/updateMerchant": { "protocol": "http", "requestBody": { "content": { "application/json": { "schema": { "type": "object", "required": ["corporateUUID"], "properties": { "city": { "type": "string", "example": "Vienna", "description": "City where the merchant is located.", "key$": "city" }, "corporateUUID": { "type": "string", "example": "123e4567-e89b-12d3-a456-426614174000", "description": "Unique identifier for the corporate entity.", "key$": "corporateUUID" }, "country": { "type": "string", "example": "Austria", "description": "Country where the merchant is located.", "key$": "country" }, "merchantContractNumber": { "type": "string", "example": 987654321, "description": "Unique identifier for the merchant within a specific system.", "key$": "merchantContractNumber" }, "merchantName": { "type": "string", "example": "Acme Corporation", "description": "Name of the merchant.", "key$": "merchantName" }, "merchant_category_code": { "type": "string", "example": 1234, "description": "Merchant Category Code (MCC) describing the merchant’s type of business.", "key$": "merchant_category_code" }, "postalCode": { "type": "string", "example": 1010, "description": "Postal or ZIP code of the merchant’s location.", "key$": "postalCode" }, "region": { "type": "string", "example": "Vienna", "description": "State or province where the merchant is located.", "key$": "region" }, "registrationNumber": { "type": "string", "example": 1234567890, "description": "Business registration number.", "key$": "registrationNumber" }, "street": { "type": "string", "example": "Main Street 123", "description": "Street address of the merchant.", "key$": "street" } }, "title": "InputUpdateMerchant", "x-ref": "#/components/schemas/InputUpdateMerchant", "index$": 1 } } }, "description": "inputUpdateMerchant", "required": true }, "parameters": [{ "name": "Authorization", "in": "header", "description": "Authorization", "required": true, "schema": { "type": "string" }, "index$": 0 }] }, "POST /merchantportalws/registerMerchant": { "protocol": "http", "requestBody": { "content": { "application/json": { "schema": { "type": "object", "required": ["businessRegistrationNumber", "companyName", "email", "language", "login", "mandator", "phoneNumber"], "properties": { "businessRegistrationNumber": { "type": "string", "key$": "businessRegistrationNumber" }, "companyName": { "type": "string", "key$": "companyName" }, "email": { "type": "string", "key$": "email" }, "language": { "type": "string", "key$": "language" }, "login": { "type": "string", "key$": "login" }, "mandator": { "type": "string", "example": "MY_MANDATOR", "description": "Mandator name assigned by TECS.", "key$": "mandator" }, "packageUUID": { "type": "string", "example": "aabdf175-3035-435e-b982-4fd82ed9f763", "description": "UUID of the package.", "key$": "packageUUID" }, "phoneNumber": { "type": "string", "key$": "phoneNumber" }, "signature": { "type": "string", "example": "If packageUUID is: aabdf175-3035-435e-b982-4fd82ed9f763, mandator is: MY_MANDATOR, client secret is: MY_CLIENT_SECRET, salt is: MY_SALT then signature will be 4d595f53414c54-1ec8296e5e95f99cf0495a3ad99546ad63f942e36c72de936396f881bd6ddddd", "description": "Signature value = saltAsHex-hashAsHex. Salt as hex value = Hex.encodeHexString(saltAsByte). Hash as hex value = DigestUtils.sha256Hex(packageUUID + \"|\" + mandator + \"|\" + clientSecret + \"|\" + saltAsString).", "key$": "signature" } }, "title": "InputRegisterMerchant", "x-ref": "#/components/schemas/InputRegisterMerchant", "index$": 1 } } }, "description": "inputRegisterMerchant", "required": true }, "parameters": [] } });
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        // CREATE
        const merchant_portal_pam_merchant_controller_ref01_ent = client.MerchantPortalPamMerchantController();
        let merchant_portal_pam_merchant_controller_ref01_data = setup.data.new.merchant_portal_pam_merchant_controller['merchant_portal_pam_merchant_controller_ref01'];
        merchant_portal_pam_merchant_controller_ref01_data = (await merchant_portal_pam_merchant_controller_ref01_ent.create(merchant_portal_pam_merchant_controller_ref01_data)).data();
        (0, node_assert_1.default)(null != merchant_portal_pam_merchant_controller_ref01_data);
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/merchant_portal_pam_merchant_controller/MerchantPortalPamMerchantControllerTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.BluefinTecsMerchantPortalSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['merchant_portal_pam_merchant_controller01', 'merchant_portal_pam_merchant_controller02', 'merchant_portal_pam_merchant_controller03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_MERCHANT_CONTROLLER_ENTID': idmap,
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE': 'FALSE',
        'BLUEFIN_TECS_MERCHANT_PORTAL_TEST_EXPLAIN': 'FALSE',
    });
    idmap = env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_MERCHANT_CONTROLLER_ENTID'];
    const live = 'TRUE' === env.BLUEFIN_TECS_MERCHANT_PORTAL_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['BLUEFIN_TECS_MERCHANT_PORTAL_TEST_MERCHANT_PORTAL_PAM_MERCHANT_CONTROLLER_ENTID'];
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
//# sourceMappingURL=MerchantPortalPamMerchantControllerEntity.test.js.map