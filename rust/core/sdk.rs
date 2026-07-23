// BluefinTecsMerchantPortalSDK client (generated — mirrors the go Main fragment).

use std::cell::RefCell;
use std::rc::Rc;

use crate::core::config::{make_config, make_feature};
use crate::core::context::{Context, CtxSpec};
use crate::core::error::BluefinTecsMerchantPortalError;
use crate::core::helpers::{call_json, get_bool, get_str, getp, getpath, jo, setp, to_int, to_map};
use crate::core::spec::Spec;
use crate::core::types::FeatureRef;
use crate::core::utility_type::Utility;
use crate::utility::voxgigstruct as vs;
use crate::utility::voxgigstruct::Value;

pub struct BluefinTecsMerchantPortalSDK {
    pub mode: RefCell<String>,
    options: RefCell<Value>,
    utility: Rc<Utility>,
    pub features: RefCell<Vec<FeatureRef>>,
    rootctx: RefCell<Option<Rc<Context>>>,
}

impl BluefinTecsMerchantPortalSDK {
    pub fn new(options: Value) -> Rc<BluefinTecsMerchantPortalSDK> {
        let sdk = Rc::new(BluefinTecsMerchantPortalSDK {
            mode: RefCell::new("live".to_string()),
            options: RefCell::new(Value::Noval),
            utility: Utility::new(),
            features: RefCell::new(Vec::new()),
            rootctx: RefCell::new(None),
        });

        let config = make_config();

        let rootctx = sdk.utility.make_context(
            CtxSpec {
                client: Some(sdk.clone()),
                utility: Some(sdk.utility.clone()),
                config: Some(config),
                options: Some(options),
                shared: Some(Value::empty_map()),
                ..Default::default()
            },
            None,
        );

        let opts = sdk.utility.make_options(&rootctx);
        *sdk.options.borrow_mut() = opts.clone();

        if getpath(&["feature", "test", "active"], &opts) == Value::Bool(true) {
            *sdk.mode.borrow_mut() = "test".to_string();
        }

        *rootctx.options.borrow_mut() = opts.clone();
        *sdk.rootctx.borrow_mut() = Some(rootctx.clone());

        // Add features in the resolved order (make_options puts an explicit
        // List order first, else defaults to test-first). Ordering matters:
        // the `test` feature installs the base mock transport and the
        // transport features (retry/cache/netsim/proxy/ratelimit) wrap
        // whatever is current, so `test` must be added before them to sit at
        // the base of the transport wrapper chain.
        let feature_opts = to_map(&getp(&opts, "feature"));
        if let Value::List(order) = getpath(&["__derived__", "featureorder"], &opts) {
            let names: Vec<String> = order
                .borrow()
                .iter()
                .filter_map(|v| match v {
                    Value::Str(s) => Some(s.clone()),
                    _ => None,
                })
                .collect();
            for fname in names {
                let fopts = getp(&feature_opts, &fname);
                if let Value::Map(_) = fopts {
                    if get_bool(&fopts, "active") == Some(true) {
                        sdk.utility.feature_add(&rootctx, make_feature(&fname));
                    }
                }
            }
        }

        // NOTE: go/ts also accept live Feature objects via an `extend`
        // option; rust options are pure data (Value), so extension features
        // are added with utility.feature_add directly instead.

        // Initialize features.
        let features: Vec<FeatureRef> = sdk.features.borrow().iter().cloned().collect();
        for f in features {
            sdk.utility.feature_init(&rootctx, &f);
        }

        sdk.utility.feature_hook(&rootctx, "PostConstruct");

        sdk
    }

    pub fn options_map(&self) -> Value {
        vs::clone(&self.options.borrow())
    }

    pub fn get_utility(&self) -> Rc<Utility> {
        Utility::copy(&self.utility)
    }

    pub fn get_root_ctx(&self) -> Rc<Context> {
        self.rootctx
            .borrow()
            .clone()
            .expect("SDK root context not initialised")
    }

    pub fn prepare(&self, fetchargs: Value) -> Result<Value, BluefinTecsMerchantPortalError> {
        let utility = &self.utility;

        let fetchargs = match fetchargs {
            Value::Map(m) => Value::Map(m),
            _ => Value::empty_map(),
        };

        let ctrl = match to_map(&getp(&fetchargs, "ctrl")) {
            Value::Map(m) => Value::Map(m),
            _ => Value::empty_map(),
        };

        let ctx = utility.make_context(
            CtxSpec {
                opname: Some("prepare".to_string()),
                ctrl: Some(ctrl),
                ..Default::default()
            },
            Some(&self.get_root_ctx()),
        );

        let options = self.options.borrow().clone();

        let path = get_str(&fetchargs, "path").unwrap_or_default();
        let method = get_str(&fetchargs, "method")
            .filter(|m| !m.is_empty())
            .unwrap_or_else(|| "GET".to_string());

        let params = match to_map(&getp(&fetchargs, "params")) {
            Value::Map(m) => Value::Map(m),
            _ => Value::empty_map(),
        };
        let query = match to_map(&getp(&fetchargs, "query")) {
            Value::Map(m) => Value::Map(m),
            _ => Value::empty_map(),
        };

        let headers = utility.prepare_headers(&ctx);

        let specmap = jo(vec![
            ("base", getp(&options, "base")),
            ("prefix", getp(&options, "prefix")),
            ("suffix", getp(&options, "suffix")),
            ("path", Value::str(path)),
            ("method", Value::str(method)),
            ("params", params),
            ("query", query),
            ("headers", headers),
            ("body", getp(&fetchargs, "body")),
            ("step", Value::str("start")),
        ]);
        let spec = Rc::new(RefCell::new(Spec::new(&specmap)));
        *ctx.spec.borrow_mut() = Some(spec.clone());

        // Merge user-provided headers.
        if let Value::Map(uh) = getp(&fetchargs, "headers") {
            let spec_headers = spec.borrow().headers.clone();
            for (k, v) in uh.borrow().iter() {
                setp(&spec_headers, k, v.clone());
            }
        }

        utility.prepare_auth(&ctx)?;

        utility.make_fetch_def(&ctx)
    }

    pub fn direct(&self, fetchargs: Value) -> Result<Value, BluefinTecsMerchantPortalError> {
        let utility = &self.utility;

        let fetchdef = match self.prepare(fetchargs.clone()) {
            Ok(fd) => fd,
            Err(err) => {
                return Ok(jo(vec![
                    ("ok", Value::Bool(false)),
                    ("err", Value::str(err.msg.clone())),
                ]));
            }
        };

        let ctrl = match to_map(&getp(&fetchargs, "ctrl")) {
            Value::Map(m) => Value::Map(m),
            _ => Value::empty_map(),
        };

        let ctx = utility.make_context(
            CtxSpec {
                opname: Some("direct".to_string()),
                ctrl: Some(ctrl),
                ..Default::default()
            },
            Some(&self.get_root_ctx()),
        );

        let url = get_str(&fetchdef, "url").unwrap_or_default();
        let fetched = utility.fetch(&ctx, &url, &fetchdef);

        let fetched = match fetched {
            Err(err) => {
                return Ok(jo(vec![
                    ("ok", Value::Bool(false)),
                    ("err", Value::str(err.msg.clone())),
                ]));
            }
            Ok(f) => f,
        };

        if fetched.is_noval() || fetched.is_null() {
            return Ok(jo(vec![
                ("ok", Value::Bool(false)),
                ("err", Value::str("response: undefined")),
            ]));
        }

        if let Value::Map(_) = &fetched {
            let status = to_int(&getp(&fetched, "status"));
            let headers = getp(&fetched, "headers");

            // No-body responses (204, 304) and explicit zero content-length
            // must skip JSON parsing.
            let content_length = match getp(&headers, "content-length") {
                Value::Str(s) => s,
                Value::Num(n) => format!("{}", n as i64),
                _ => String::new(),
            };
            let no_body = status == 204 || status == 304 || content_length == "0";

            let json_data = if no_body {
                Value::Noval
            } else {
                let jf = getp(&fetched, "json");
                if let Value::Func(_) = jf {
                    call_json(&jf)
                } else {
                    Value::Noval
                }
            };

            return Ok(jo(vec![
                ("ok", Value::Bool((200..300).contains(&status))),
                ("status", Value::Num(status as f64)),
                ("headers", headers),
                ("data", json_data),
            ]));
        }

        Ok(jo(vec![
            ("ok", Value::Bool(false)),
            ("err", Value::str("invalid response type")),
        ]))
    }


    /// MerchantPortalApiController entity bound to this client.
    pub fn merchant_portal_api_controller(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::merchant_portal_api_controller::MerchantPortalApiControllerEntity> {
        crate::entity::merchant_portal_api_controller::MerchantPortalApiControllerEntity::new(self, entopts)
    }

    /// MerchantPortalCommonController entity bound to this client.
    pub fn merchant_portal_common_controller(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::merchant_portal_common_controller::MerchantPortalCommonControllerEntity> {
        crate::entity::merchant_portal_common_controller::MerchantPortalCommonControllerEntity::new(self, entopts)
    }

    /// MerchantPortalPamContractController entity bound to this client.
    pub fn merchant_portal_pam_contract_controller(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::merchant_portal_pam_contract_controller::MerchantPortalPamContractControllerEntity> {
        crate::entity::merchant_portal_pam_contract_controller::MerchantPortalPamContractControllerEntity::new(self, entopts)
    }

    /// MerchantPortalPamDocumentController entity bound to this client.
    pub fn merchant_portal_pam_document_controller(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::merchant_portal_pam_document_controller::MerchantPortalPamDocumentControllerEntity> {
        crate::entity::merchant_portal_pam_document_controller::MerchantPortalPamDocumentControllerEntity::new(self, entopts)
    }

    /// MerchantPortalPamFormController entity bound to this client.
    pub fn merchant_portal_pam_form_controller(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::merchant_portal_pam_form_controller::MerchantPortalPamFormControllerEntity> {
        crate::entity::merchant_portal_pam_form_controller::MerchantPortalPamFormControllerEntity::new(self, entopts)
    }

    /// MerchantPortalPamMandatorController entity bound to this client.
    pub fn merchant_portal_pam_mandator_controller(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::merchant_portal_pam_mandator_controller::MerchantPortalPamMandatorControllerEntity> {
        crate::entity::merchant_portal_pam_mandator_controller::MerchantPortalPamMandatorControllerEntity::new(self, entopts)
    }

    /// MerchantPortalPamMerchantController entity bound to this client.
    pub fn merchant_portal_pam_merchant_controller(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::merchant_portal_pam_merchant_controller::MerchantPortalPamMerchantControllerEntity> {
        crate::entity::merchant_portal_pam_merchant_controller::MerchantPortalPamMerchantControllerEntity::new(self, entopts)
    }

    /// MerchantPortalPamPackageController entity bound to this client.
    pub fn merchant_portal_pam_package_controller(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::merchant_portal_pam_package_controller::MerchantPortalPamPackageControllerEntity> {
        crate::entity::merchant_portal_pam_package_controller::MerchantPortalPamPackageControllerEntity::new(self, entopts)
    }

    /// MerchantPortalPamProductController entity bound to this client.
    pub fn merchant_portal_pam_product_controller(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::merchant_portal_pam_product_controller::MerchantPortalPamProductControllerEntity> {
        crate::entity::merchant_portal_pam_product_controller::MerchantPortalPamProductControllerEntity::new(self, entopts)
    }

    /// OutputAddProduct entity bound to this client.
    pub fn output_add_product(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::output_add_product::OutputAddProductEntity> {
        crate::entity::output_add_product::OutputAddProductEntity::new(self, entopts)
    }

    /// OutputCreateProduct entity bound to this client.
    pub fn output_create_product(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::output_create_product::OutputCreateProductEntity> {
        crate::entity::output_create_product::OutputCreateProductEntity::new(self, entopts)
    }

    /// OutputDetail entity bound to this client.
    pub fn output_detail(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::output_detail::OutputDetailEntity> {
        crate::entity::output_detail::OutputDetailEntity::new(self, entopts)
    }

    /// OutputList entity bound to this client.
    pub fn output_list(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::output_list::OutputListEntity> {
        crate::entity::output_list::OutputListEntity::new(self, entopts)
    }

    /// OutputMessage entity bound to this client.
    pub fn output_message(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::output_message::OutputMessageEntity> {
        crate::entity::output_message::OutputMessageEntity::new(self, entopts)
    }

    /// OutputMoveTid entity bound to this client.
    pub fn output_move_tid(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::output_move_tid::OutputMoveTidEntity> {
        crate::entity::output_move_tid::OutputMoveTidEntity::new(self, entopts)
    }

    /// OutputRemoveProduct entity bound to this client.
    pub fn output_remove_product(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::output_remove_product::OutputRemoveProductEntity> {
        crate::entity::output_remove_product::OutputRemoveProductEntity::new(self, entopts)
    }

    /// OutputStart entity bound to this client.
    pub fn output_start(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::output_start::OutputStartEntity> {
        crate::entity::output_start::OutputStartEntity::new(self, entopts)
    }

    /// OutputStatus entity bound to this client.
    pub fn output_status(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::output_status::OutputStatusEntity> {
        crate::entity::output_status::OutputStatusEntity::new(self, entopts)
    }

    /// OutputUpdateProduct entity bound to this client.
    pub fn output_update_product(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::output_update_product::OutputUpdateProductEntity> {
        crate::entity::output_update_product::OutputUpdateProductEntity::new(self, entopts)
    }

}

pub fn test_sdk(testopts: Value, sdkopts: Value) -> Rc<BluefinTecsMerchantPortalSDK> {
    let sdkopts = match sdkopts {
        Value::Map(_) => vs::clone(&sdkopts),
        _ => Value::empty_map(),
    };

    let testopts = match testopts {
        Value::Map(_) => vs::clone(&testopts),
        _ => Value::empty_map(),
    };
    setp(&testopts, "active", Value::Bool(true));

    // set_path mutates `sdkopts` in place and returns the inner parent node;
    // discard the return so we pass the full options root (mirrors go's
    // vs.SetPath(sdkopts, ...) which does not rebind).
    vs::set_path(
        &sdkopts,
        &Value::list(vec![Value::str("feature"), Value::str("test")]),
        testopts,
        None,
    );

    let sdk = BluefinTecsMerchantPortalSDK::new(sdkopts);
    *sdk.mode.borrow_mut() = "test".to_string();

    sdk
}
