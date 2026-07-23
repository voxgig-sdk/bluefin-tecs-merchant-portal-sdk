// Generated direct-call tests for the merchant_portal_common_controller entity (mirrors the
// go TestDirect generator; the live-mode path uses idmap-provided IDs).

#![allow(unused_variables, unused_imports, dead_code)]

mod common;

use std::cell::RefCell;
use std::rc::Rc;

use common::*;

use bluefin_tecs_merchant_portal_sdk::core::helpers::{getp, ja, jo, json_thunk, setp, to_int, to_map};
use bluefin_tecs_merchant_portal_sdk::utility::voxgigstruct as vs;
use bluefin_tecs_merchant_portal_sdk::{Value, BluefinTecsMerchantPortalSDK};

struct MerchantPortalCommonControllerDirectSetup {
    client: Rc<BluefinTecsMerchantPortalSDK>,
    calls: Rc<RefCell<Vec<Value>>>,
    live: bool,
    idmap: Value,
}

fn merchant_portal_common_controller_direct_setup(mockres: Value) -> MerchantPortalCommonControllerDirectSetup {
    load_env_local();

    let calls: Rc<RefCell<Vec<Value>>> = Rc::new(RefCell::new(Vec::new()));

    let env = env_override(jo(vec![
        ("BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID", Value::empty_map()),
        ("BLUEFINTECSMERCHANTPORTAL_TEST_LIVE", Value::str("FALSE")),
    ]));

    let live = getp(&env, "BLUEFINTECSMERCHANTPORTAL_TEST_LIVE") == Value::str("TRUE");

    if live {
        let client = BluefinTecsMerchantPortalSDK::new(jo(vec![]));
        let idmap = match to_map(&getp(&env, "BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID")) {
            Value::Map(m) => Value::Map(m),
            _ => Value::empty_map(),
        };
        return MerchantPortalCommonControllerDirectSetup {
            client,
            calls,
            live: true,
            idmap,
        };
    }

    let c = calls.clone();
    let mock_fetch = Value::func(move |_inj, args, _r, _s| {
        let url = vs::get_elem(args, &Value::Num(0.0), Value::Noval);
        let init = vs::get_elem(args, &Value::Num(1.0), Value::Noval);
        c.borrow_mut().push(jo(vec![("url", url), ("init", init)]));
        let data = if mockres.is_noval() || mockres.is_null() {
            jo(vec![("id", Value::str("direct01"))])
        } else {
            mockres.clone()
        };
        jo(vec![
            ("status", Value::Num(200.0)),
            ("statusText", Value::str("OK")),
            ("headers", Value::empty_map()),
            ("json", json_thunk(data)),
        ])
    });

    let client = BluefinTecsMerchantPortalSDK::new(jo(vec![
        ("base", Value::str("http://localhost:8080")),
        ("system", jo(vec![("fetch", mock_fetch)])),
    ]));

    MerchantPortalCommonControllerDirectSetup {
        client,
        calls,
        live: false,
        idmap: Value::empty_map(),
    }
}

#[test]
fn merchant_portal_common_controller_direct_load() {
    let setup = merchant_portal_common_controller_direct_setup(jo(vec![("id", Value::str("direct01"))]));
    let mode = if setup.live { "live" } else { "unit" };
    let (skip, reason) = is_control_skipped("direct", "direct-load-merchant_portal_common_controller", mode);
    if skip {
        eprintln!(
            "skip: {}",
            if reason.is_empty() {
                "skipped via sdk-test-control.json".to_string()
            } else {
                reason
            }
        );
        return;
    }
    let client = setup.client.clone();

    let params = Value::empty_map();

    let result = client
        .direct(jo(vec![
            ("path", Value::str("merchantportalws/logDeveloperInfo")),
            ("method", Value::str("GET")),
            ("params", params.clone()),
        ]))
        .expect("direct failed");

    if setup.live {
        // Live mode is lenient: synthetic IDs frequently 4xx.
        if getp(&result, "ok") != Value::Bool(true) {
            eprintln!("skip: load call not ok (likely synthetic IDs against live API)");
            return;
        }
        let status = to_int(&getp(&result, "status"));
        if !(200..300).contains(&status) {
            eprintln!("skip: expected 2xx status, got {}", status);
            return;
        }
    } else {
        assert_eq!(getp(&result, "ok"), Value::Bool(true), "expected ok true");
        assert_eq!(to_int(&getp(&result, "status")), 200, "expected status 200");
        assert!(
            !getp(&result, "data").is_noval(),
            "expected data to be non-nil"
        );

        let data = getp(&result, "data");
        if let Value::Map(_) = data {
            assert_eq!(
                getp(&data, "id"),
                Value::str("direct01"),
                "expected data.id to be direct01"
            );
        }

        assert_eq!(setup.calls.borrow().len(), 1, "expected 1 call");
        let call = setup.calls.borrow()[0].clone();
        assert_eq!(
            getp(&getp(&call, "init"), "method"),
            Value::str("GET"),
            "expected method GET"
        );
        let url = match getp(&call, "url") {
            Value::Str(u) => u,
            _ => String::new(),
        };
    }
}
