// Generated basic-flow test for the merchant_portal_pam_contract_controller entity (model-driven;
// mirrors the go TestEntity generator).

#![allow(unused_variables, unused_mut, unused_imports)]

mod common;

use std::rc::Rc;

use common::*;

use bluefin_tecs_merchant_portal_sdk::core::helpers::{getp, getpath, ja, jo, now_ms, setp, to_map};
use bluefin_tecs_merchant_portal_sdk::utility::voxgigstruct as vs;
use bluefin_tecs_merchant_portal_sdk::{test_sdk, Entity, BluefinTecsMerchantPortalEntity, BluefinTecsMerchantPortalSDK, Value};

#[test]
fn merchant_portal_pam_contract_controller_entity_instance() {
    let testsdk = test_sdk(Value::Noval, Value::Noval);
    let ent = testsdk.merchant_portal_pam_contract_controller(Value::Noval);
    assert_eq!(ent.get_name(), "merchant_portal_pam_contract_controller");
}

#[test]
fn merchant_portal_pam_contract_controller_entity_stream() {
    // stream() runs the list op through the full pipeline and yields each
    // result item. Seed two entities via test mode; with the `streaming`
    // feature active it yields the feature's incremental items, else it
    // falls back to the materialised items — either way every item yields.
    let seed = jo(vec![(
        "entity",
        jo(vec![(
            "merchant_portal_pam_contract_controller",
            jo(vec![
                ("strm01", jo(vec![("id", Value::str("strm01"))])),
                ("strm02", jo(vec![("id", Value::str("strm02"))])),
            ]),
        )]),
    )]);

    let sdkopts = jo(vec![(
        "feature",
        jo(vec![("streaming", jo(vec![("active", Value::Bool(true))]))]),
    )]);

    let testsdk = test_sdk(seed.clone(), sdkopts);
    let ent = testsdk.merchant_portal_pam_contract_controller(Value::Noval);
    let items: Vec<Value> = ent
        .stream("list", Value::empty_map(), Value::empty_map())
        .expect("stream failed")
        .collect();
    assert_eq!(items.len(), 2, "stream should yield both seeded items");

    // Fallback: streaming inactive still yields both materialised items.
    let plainsdk = test_sdk(seed, Value::Noval);
    let plainent = plainsdk.merchant_portal_pam_contract_controller(Value::Noval);
    let plain_items: Vec<Value> = plainent
        .stream("list", Value::empty_map(), Value::empty_map())
        .expect("stream failed")
        .collect();
    assert_eq!(plain_items.len(), 2, "fallback stream should yield both items");
}

#[test]
fn merchant_portal_pam_contract_controller_entity_basic() {
    let setup = merchant_portal_pam_contract_controller_basic_setup(Value::Noval);
    // Per-op sdk-test-control.json skip — the basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    let mode = if setup.live { "live" } else { "unit" };
    for op in ["create"] {
        let (skip, reason) = is_control_skipped("entityOp", &format!("merchant_portal_pam_contract_controller.{}", op), mode);
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
        eprintln!("skip: live entity test uses synthetic IDs from fixture — set BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_CONTRACT_CONTROLLER_ENTID JSON to run live");
        return;
    }
    let client = setup.client.clone();
    // CREATE
    let merchant_portal_pam_contract_controller_ref01_ent = client.merchant_portal_pam_contract_controller(Value::Noval);
    let merchant_portal_pam_contract_controller_ref01_data = to_map(&getp(
        &getpath(&["new", "merchant_portal_pam_contract_controller"], &setup.data),
        "merchant_portal_pam_contract_controller_ref01",
    ));

    let merchant_portal_pam_contract_controller_ref01_data_result = merchant_portal_pam_contract_controller_ref01_ent
        .create(merchant_portal_pam_contract_controller_ref01_data.clone(), Value::Noval)
        .expect("create failed");
    let merchant_portal_pam_contract_controller_ref01_data = to_map(&merchant_portal_pam_contract_controller_ref01_data_result);
    assert!(
        matches!(merchant_portal_pam_contract_controller_ref01_data, Value::Map(_)),
        "expected create result to be a map"
    );

}

fn merchant_portal_pam_contract_controller_basic_setup(extra: Value) -> EntityTestSetup {
    load_env_local();

    let mut entity_data_file = manifest_dir();
    entity_data_file.push("..");
    entity_data_file.push(".sdk");
    entity_data_file.push("test");
    entity_data_file.push("entity");
    entity_data_file.push("merchant_portal_pam_contract_controller");
    entity_data_file.push("MerchantPortalPamContractControllerTestData.json");

    let entity_data = read_json(&entity_data_file);

    let options = jo(vec![("entity", getp(&entity_data, "existing"))]);

    let client = test_sdk(options, extra.clone());

    // Generate idmap via transform, matching the TS pattern.
    let idmap = vs::transform(
        &ja(vec![Value::str("merchant_portal_pam_contract_controller01"), Value::str("merchant_portal_pam_contract_controller02"), Value::str("merchant_portal_pam_contract_controller03")]),
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
    let entid_env_raw = std::env::var("BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_CONTRACT_CONTROLLER_ENTID").unwrap_or_default();
    let idmap_overridden =
        !entid_env_raw.trim().is_empty() && entid_env_raw.trim().starts_with('{');

    let env = env_override(jo(vec![
        ("BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_CONTRACT_CONTROLLER_ENTID", idmap.clone()),
        ("BLUEFINTECSMERCHANTPORTAL_TEST_LIVE", Value::str("FALSE")),
        ("BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN", Value::str("FALSE")),
    ]));

    let idmap_resolved = match to_map(&getp(&env, "BLUEFINTECSMERCHANTPORTAL_TEST_MERCHANT_PORTAL_PAM_CONTRACT_CONTROLLER_ENTID")) {
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
