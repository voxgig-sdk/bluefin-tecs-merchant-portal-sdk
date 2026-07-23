// Generated basic-flow test for the merchant_portal_common_controller entity (model-driven;
// mirrors the go TestEntity generator).

#![allow(unused_variables, unused_mut, unused_imports)]

mod common;

use std::rc::Rc;

use common::*;

use bluefin_tecs_merchant_portal_sdk::core::helpers::{getp, getpath, ja, jo, now_ms, setp, to_map};
use bluefin_tecs_merchant_portal_sdk::utility::voxgigstruct as vs;
use bluefin_tecs_merchant_portal_sdk::{test_sdk, Entity, BluefinTecsMerchantPortalEntity, BluefinTecsMerchantPortalSDK, Value};

#[test]
fn merchant_portal_common_controller_entity_instance() {
    let testsdk = test_sdk(Value::Noval, Value::Noval);
    let ent = testsdk.merchant_portal_common_controller(Value::Noval);
    assert_eq!(ent.get_name(), "merchant_portal_common_controller");
}

#[test]
fn merchant_portal_common_controller_entity_basic() {
    let setup = merchant_portal_common_controller_basic_setup(Value::Noval);
    // Per-op sdk-test-control.json skip — the basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    let mode = if setup.live { "live" } else { "unit" };
    for op in ["load"] {
        let (skip, reason) = is_control_skipped("entityOp", &format!("merchant_portal_common_controller.{}", op), mode);
        if skip {
            let reason = if reason.is_empty() {
                "skipped via sdk-test-control.json".to_string()
            } else {
                reason
            };
            eprintln!("skip: {}", reason);
            return;
        }
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup.synthetic_only {
        eprintln!("skip: live entity test uses synthetic IDs from fixture — set BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID JSON to run live");
        return;
    }
    let client = setup.client.clone();

    // Bootstrap entity data from existing test data (no create step in flow).
    let merchant_portal_common_controller_ref01_data_raw = vs::items(&to_map(&getpath(&["existing", "merchant_portal_common_controller"], &setup.data)));
    let merchant_portal_common_controller_ref01_data = to_map(&vs::get_elem(
        &vs::get_elem(&merchant_portal_common_controller_ref01_data_raw, &Value::Num(0.0), Value::Noval),
        &Value::Num(1.0),
        Value::Noval,
    ));
    // LOAD
    let merchant_portal_common_controller_ref01_ent = client.merchant_portal_common_controller(Value::Noval);
    let merchant_portal_common_controller_ref01_match_dt0 = Value::empty_map();
    let merchant_portal_common_controller_ref01_data_dt0_loaded = merchant_portal_common_controller_ref01_ent
        .load(merchant_portal_common_controller_ref01_match_dt0.clone(), Value::Noval)
        .expect("load failed");
    assert!(
        !merchant_portal_common_controller_ref01_data_dt0_loaded.is_noval(),
        "expected load result to be non-nil"
    );

}

fn merchant_portal_common_controller_basic_setup(extra: Value) -> EntityTestSetup {
    load_env_local();

    let mut entity_data_file = manifest_dir();
    entity_data_file.push("..");
    entity_data_file.push(".sdk");
    entity_data_file.push("test");
    entity_data_file.push("entity");
    entity_data_file.push("merchant_portal_common_controller");
    entity_data_file.push("MerchantPortalCommonControllerTestData.json");

    let entity_data = read_json(&entity_data_file);

    let options = jo(vec![("entity", getp(&entity_data, "existing"))]);

    let client = test_sdk(options, extra.clone());

    // Generate idmap via transform, matching the TS pattern.
    let idmap = vs::transform(
        &ja(vec![Value::str("merchant_portal_common_controller01"), Value::str("merchant_portal_common_controller02"), Value::str("merchant_portal_common_controller03")]),
        &jo(vec![(
            "`$PACK`",
            ja(vec![
                Value::str(""),
                jo(vec![
                    ("`$KEY`", Value::str("`$COPY`")),
                    (
                        "`$VAL`",
                        ja(vec![
                            Value::str("`$FORMAT`"),
                            Value::str("upper"),
                            Value::str("`$COPY`"),
                        ]),
                    ),
                ]),
            ]),
        )]),
        None,
    )
    .unwrap_or_else(|_| Value::empty_map());

    // Detect ENTID env override before env_override consumes it. When live
    // mode is on without a real override, the basic test runs against
    // synthetic IDs from the fixture and 4xx's.
    let entid_env_raw = std::env::var("BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID").unwrap_or_default();
    let idmap_overridden =
        !entid_env_raw.trim().is_empty() && entid_env_raw.trim().starts_with('{');

    let env = env_override(jo(vec![
        ("BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID", idmap.clone()),
        ("BLUEFINTECSMERCHANTPORTAL_TEST_LIVE", Value::str("FALSE")),
        ("BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN", Value::str("FALSE")),
    ]));

    let idmap_resolved = match to_map(&getp(&env, "BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_COMMON_CONTROLLER_ENTID")) {
        Value::Map(m) => Value::Map(m),
        _ => to_map(&idmap),
    };

    let live = getp(&env, "BLUEFINTECSMERCHANTPORTAL_TEST_LIVE") == Value::str("TRUE");

    let client = if live {
        let merged = vs::merge(
            &ja(vec![jo(vec![]), extra]),
            None,
        );
        BluefinTecsMerchantPortalSDK::new(to_map(&merged))
    } else {
        client
    };

    EntityTestSetup {
        client,
        data: entity_data,
        idmap: idmap_resolved,
        env: env.clone(),
        explain: getp(&env, "BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN") == Value::str("TRUE"),
        live,
        synthetic_only: live && !idmap_overridden,
        now: now_ms(),
    }
}
