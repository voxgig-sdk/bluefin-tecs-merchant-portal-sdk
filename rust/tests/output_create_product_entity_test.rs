// Generated basic-flow test for the output_create_product entity (model-driven;
// mirrors the go TestEntity generator).

#![allow(unused_variables, unused_mut, unused_imports)]

mod common;

use std::rc::Rc;

use common::*;

use bluefin_tecs_merchant_portal_sdk::core::helpers::{getp, getpath, ja, jo, now_ms, setp, to_map};
use bluefin_tecs_merchant_portal_sdk::utility::voxgigstruct as vs;
use bluefin_tecs_merchant_portal_sdk::{test_sdk, Entity, BluefinTecsMerchantPortalEntity, BluefinTecsMerchantPortalSDK, Value};

#[test]
fn output_create_product_entity_instance() {
    let testsdk = test_sdk(Value::Noval, Value::Noval);
    let ent = testsdk.output_create_product(Value::Noval);
    assert_eq!(ent.get_name(), "output_create_product");
}

#[test]
fn output_create_product_entity_basic() {
    let setup = output_create_product_basic_setup(Value::Noval);
    // Per-op sdk-test-control.json skip — the basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    let mode = if setup.live { "live" } else { "unit" };
    for op in ["create"] {
        let (skip, reason) = is_control_skipped("entityOp", &format!("output_create_product.{}", op), mode);
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
        eprintln!("skip: live entity test uses synthetic IDs from fixture — set BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_CREATE_PRODUCT_ENTID JSON to run live");
        return;
    }
    let client = setup.client.clone();
    // CREATE
    let output_create_product_ref01_ent = client.output_create_product(Value::Noval);
    let output_create_product_ref01_data = to_map(&getp(
        &getpath(&["new", "output_create_product"], &setup.data),
        "output_create_product_ref01",
    ));

    let output_create_product_ref01_data_result = output_create_product_ref01_ent
        .create(output_create_product_ref01_data.clone(), Value::Noval)
        .expect("create failed");
    let output_create_product_ref01_data = to_map(&output_create_product_ref01_data_result);
    assert!(
        matches!(output_create_product_ref01_data, Value::Map(_)),
        "expected create result to be a map"
    );

}

fn output_create_product_basic_setup(extra: Value) -> EntityTestSetup {
    load_env_local();

    let mut entity_data_file = manifest_dir();
    entity_data_file.push("..");
    entity_data_file.push(".sdk");
    entity_data_file.push("test");
    entity_data_file.push("entity");
    entity_data_file.push("output_create_product");
    entity_data_file.push("OutputCreateProductTestData.json");

    let entity_data = read_json(&entity_data_file);

    let options = jo(vec![("entity", getp(&entity_data, "existing"))]);

    let client = test_sdk(options, extra.clone());

    // Generate idmap via transform, matching the TS pattern.
    let idmap = vs::transform(
        &ja(vec![Value::str("output_create_product01"), Value::str("output_create_product02"), Value::str("output_create_product03")]),
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
    let entid_env_raw = std::env::var("BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_CREATE_PRODUCT_ENTID").unwrap_or_default();
    let idmap_overridden =
        !entid_env_raw.trim().is_empty() && entid_env_raw.trim().starts_with('{');

    let env = env_override(jo(vec![
        ("BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_CREATE_PRODUCT_ENTID", idmap.clone()),
        ("BLUEFINTECSMERCHANTPORTAL_TEST_LIVE", Value::str("FALSE")),
        ("BLUEFINTECSMERCHANTPORTAL_TEST_EXPLAIN", Value::str("FALSE")),
    ]));

    let idmap_resolved = match to_map(&getp(&env, "BLUEFINTECSMERCHANTPORTAL_TEST_OUTPUT_CREATE_PRODUCT_ENTID")) {
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
