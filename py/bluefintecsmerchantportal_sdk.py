# BluefinTecsMerchantPortal SDK

from utility.voxgig_struct import voxgig_struct as vs
from core.utility_type import BluefinTecsMerchantPortalUtility
from core.spec import BluefinTecsMerchantPortalSpec
from core import helpers

# Load utility registration (populates Utility._registrar)
from utility import register

# Load features
from feature.base_feature import BluefinTecsMerchantPortalBaseFeature
from features import _make_feature


class BluefinTecsMerchantPortalSDK:

    def __init__(self, options=None):
        self.mode = "live"
        self.features = []
        self.options = None

        utility = BluefinTecsMerchantPortalUtility()
        self._utility = utility

        from config import make_config
        config = make_config()

        self._rootctx = utility.make_context({
            "client": self,
            "utility": utility,
            "config": config,
            "options": options if options is not None else {},
            "shared": {},
        }, None)

        self.options = utility.make_options(self._rootctx)

        if vs.getpath(self.options, "feature.test.active") is True:
            self.mode = "test"

        self._rootctx.options = self.options

        # Add features in the resolved order (make_options puts an explicit
        # list order first, else defaults to test-first). Ordering matters: the
        # `test` feature installs the base mock transport and the transport
        # features (retry/cache/netsim/proxy/ratelimit) wrap whatever is
        # current, so `test` must be added before them to sit at the base.
        feature_opts = helpers.to_map(vs.getprop(self.options, "feature"))
        if feature_opts is not None:
            featureorder = vs.getpath(self.options, "__derived__.featureorder")
            if isinstance(featureorder, list):
                for fname in featureorder:
                    fopts = helpers.to_map(feature_opts.get(fname))
                    if fopts is not None and fopts.get("active") is True:
                        utility.feature_add(self._rootctx, _make_feature(fname))

        # Add extension features.
        extend = vs.getprop(self.options, "extend")
        if isinstance(extend, list):
            for f in extend:
                if isinstance(f, dict) or (hasattr(f, "get_name") and callable(f.get_name)):
                    utility.feature_add(self._rootctx, f)

        # Initialize features.
        for f in self.features:
            utility.feature_init(self._rootctx, f)

        utility.feature_hook(self._rootctx, "PostConstruct")

        # #BuildFeatures

    def options_map(self):
        out = vs.clone(self.options)
        if isinstance(out, dict):
            return out
        return {}

    def get_utility(self):
        return BluefinTecsMerchantPortalUtility.copy(self._utility)

    def get_root_ctx(self):
        return self._rootctx

    def prepare(self, fetchargs=None):
        utility = self._utility

        if fetchargs is None:
            fetchargs = {}

        ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl"))
        if ctrl is None:
            ctrl = {}

        ctx = utility.make_context({
            "opname": "prepare",
            "ctrl": ctrl,
        }, self._rootctx)

        options = self.options

        path = vs.getprop(fetchargs, "path") or ""
        if not isinstance(path, str):
            path = ""

        method = vs.getprop(fetchargs, "method") or "GET"
        if not isinstance(method, str):
            method = "GET"

        params = helpers.to_map(vs.getprop(fetchargs, "params"))
        if params is None:
            params = {}
        query = helpers.to_map(vs.getprop(fetchargs, "query"))
        if query is None:
            query = {}

        headers = utility.prepare_headers(ctx)

        base = vs.getprop(options, "base") or ""
        if not isinstance(base, str):
            base = ""
        prefix = vs.getprop(options, "prefix") or ""
        if not isinstance(prefix, str):
            prefix = ""
        suffix = vs.getprop(options, "suffix") or ""
        if not isinstance(suffix, str):
            suffix = ""

        ctx.spec = BluefinTecsMerchantPortalSpec({
            "base": base,
            "prefix": prefix,
            "suffix": suffix,
            "path": path,
            "method": method,
            "params": params,
            "query": query,
            "headers": headers,
            "body": vs.getprop(fetchargs, "body"),
            "step": "start",
        })

        # Merge user-provided headers.
        uh = vs.getprop(fetchargs, "headers")
        if isinstance(uh, dict):
            for k, v in uh.items():
                ctx.spec.headers[k] = v

        _, err = utility.prepare_auth(ctx)
        if err is not None:
            raise err

        fetchdef, err = utility.make_fetch_def(ctx)
        if err is not None:
            raise err

        return fetchdef

    def direct(self, fetchargs=None):
        utility = self._utility

        try:
            fetchdef = self.prepare(fetchargs)
        except Exception as err:
            # direct() is the raw-HTTP escape hatch: it never raises, it
            # returns a result object callers branch on via result["ok"].
            return {"ok": False, "err": err}

        if fetchargs is None:
            fetchargs = {}
        ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl"))
        if ctrl is None:
            ctrl = {}

        ctx = utility.make_context({
            "opname": "direct",
            "ctrl": ctrl,
        }, self._rootctx)

        url = fetchdef.get("url", "")
        fetched, fetch_err = utility.fetcher(ctx, url, fetchdef)

        if fetch_err is not None:
            return {"ok": False, "err": fetch_err}

        if fetched is None:
            return {
                "ok": False,
                "err": ctx.make_error("direct_no_response", "response: undefined"),
            }

        if isinstance(fetched, dict):
            status = helpers.to_int(vs.getprop(fetched, "status"))
            headers = vs.getprop(fetched, "headers") or {}

            # No-body responses (204, 304) and explicit zero content-length
            # must skip JSON parsing — calling json() on an empty body raises.
            content_length = None
            if isinstance(headers, dict):
                content_length = headers.get("content-length")
            no_body = status in (204, 304) or str(content_length) == "0"

            json_data = None
            if not no_body:
                jf = vs.getprop(fetched, "json")
                if callable(jf):
                    try:
                        json_data = jf()
                    except Exception:
                        # Non-JSON body (e.g. text/plain, text/html). Surface
                        # status + headers but leave data as None.
                        json_data = None

            return {
                "ok": status >= 200 and status < 300,
                "status": status,
                "headers": headers,
                "data": json_data,
            }

        return {
            "ok": False,
            "err": ctx.make_error("direct_invalid", "invalid response type"),
        }


    def MerchantPortalApiController(self, data=None) -> "MerchantPortalApiControllerEntity":
        """Entity factory: client.MerchantPortalApiController().list() / client.MerchantPortalApiController().load({"id": ...})."""
        from entity.merchant_portal_api_controller_entity import MerchantPortalApiControllerEntity
        return MerchantPortalApiControllerEntity(self, data)


    def MerchantPortalCommonController(self, data=None) -> "MerchantPortalCommonControllerEntity":
        """Entity factory: client.MerchantPortalCommonController().list() / client.MerchantPortalCommonController().load({"id": ...})."""
        from entity.merchant_portal_common_controller_entity import MerchantPortalCommonControllerEntity
        return MerchantPortalCommonControllerEntity(self, data)


    def MerchantPortalPamContractController(self, data=None) -> "MerchantPortalPamContractControllerEntity":
        """Entity factory: client.MerchantPortalPamContractController().list() / client.MerchantPortalPamContractController().load({"id": ...})."""
        from entity.merchant_portal_pam_contract_controller_entity import MerchantPortalPamContractControllerEntity
        return MerchantPortalPamContractControllerEntity(self, data)


    def MerchantPortalPamDocumentController(self, data=None) -> "MerchantPortalPamDocumentControllerEntity":
        """Entity factory: client.MerchantPortalPamDocumentController().list() / client.MerchantPortalPamDocumentController().load({"id": ...})."""
        from entity.merchant_portal_pam_document_controller_entity import MerchantPortalPamDocumentControllerEntity
        return MerchantPortalPamDocumentControllerEntity(self, data)


    def MerchantPortalPamFormController(self, data=None) -> "MerchantPortalPamFormControllerEntity":
        """Entity factory: client.MerchantPortalPamFormController().list() / client.MerchantPortalPamFormController().load({"id": ...})."""
        from entity.merchant_portal_pam_form_controller_entity import MerchantPortalPamFormControllerEntity
        return MerchantPortalPamFormControllerEntity(self, data)


    def MerchantPortalPamMandatorController(self, data=None) -> "MerchantPortalPamMandatorControllerEntity":
        """Entity factory: client.MerchantPortalPamMandatorController().list() / client.MerchantPortalPamMandatorController().load({"id": ...})."""
        from entity.merchant_portal_pam_mandator_controller_entity import MerchantPortalPamMandatorControllerEntity
        return MerchantPortalPamMandatorControllerEntity(self, data)


    def MerchantPortalPamMerchantController(self, data=None) -> "MerchantPortalPamMerchantControllerEntity":
        """Entity factory: client.MerchantPortalPamMerchantController().list() / client.MerchantPortalPamMerchantController().load({"id": ...})."""
        from entity.merchant_portal_pam_merchant_controller_entity import MerchantPortalPamMerchantControllerEntity
        return MerchantPortalPamMerchantControllerEntity(self, data)


    def MerchantPortalPamPackageController(self, data=None) -> "MerchantPortalPamPackageControllerEntity":
        """Entity factory: client.MerchantPortalPamPackageController().list() / client.MerchantPortalPamPackageController().load({"id": ...})."""
        from entity.merchant_portal_pam_package_controller_entity import MerchantPortalPamPackageControllerEntity
        return MerchantPortalPamPackageControllerEntity(self, data)


    def MerchantPortalPamProductController(self, data=None) -> "MerchantPortalPamProductControllerEntity":
        """Entity factory: client.MerchantPortalPamProductController().list() / client.MerchantPortalPamProductController().load({"id": ...})."""
        from entity.merchant_portal_pam_product_controller_entity import MerchantPortalPamProductControllerEntity
        return MerchantPortalPamProductControllerEntity(self, data)


    def OutputAddProduct(self, data=None) -> "OutputAddProductEntity":
        """Entity factory: client.OutputAddProduct().list() / client.OutputAddProduct().load({"id": ...})."""
        from entity.output_add_product_entity import OutputAddProductEntity
        return OutputAddProductEntity(self, data)


    def OutputCreateProduct(self, data=None) -> "OutputCreateProductEntity":
        """Entity factory: client.OutputCreateProduct().list() / client.OutputCreateProduct().load({"id": ...})."""
        from entity.output_create_product_entity import OutputCreateProductEntity
        return OutputCreateProductEntity(self, data)


    def OutputDetail(self, data=None) -> "OutputDetailEntity":
        """Entity factory: client.OutputDetail().list() / client.OutputDetail().load({"id": ...})."""
        from entity.output_detail_entity import OutputDetailEntity
        return OutputDetailEntity(self, data)


    def OutputList(self, data=None) -> "OutputListEntity":
        """Entity factory: client.OutputList().list() / client.OutputList().load({"id": ...})."""
        from entity.output_list_entity import OutputListEntity
        return OutputListEntity(self, data)


    def OutputMessage(self, data=None) -> "OutputMessageEntity":
        """Entity factory: client.OutputMessage().list() / client.OutputMessage().load({"id": ...})."""
        from entity.output_message_entity import OutputMessageEntity
        return OutputMessageEntity(self, data)


    def OutputMoveTid(self, data=None) -> "OutputMoveTidEntity":
        """Entity factory: client.OutputMoveTid().list() / client.OutputMoveTid().load({"id": ...})."""
        from entity.output_move_tid_entity import OutputMoveTidEntity
        return OutputMoveTidEntity(self, data)


    def OutputRemoveProduct(self, data=None) -> "OutputRemoveProductEntity":
        """Entity factory: client.OutputRemoveProduct().list() / client.OutputRemoveProduct().load({"id": ...})."""
        from entity.output_remove_product_entity import OutputRemoveProductEntity
        return OutputRemoveProductEntity(self, data)


    def OutputStart(self, data=None) -> "OutputStartEntity":
        """Entity factory: client.OutputStart().list() / client.OutputStart().load({"id": ...})."""
        from entity.output_start_entity import OutputStartEntity
        return OutputStartEntity(self, data)


    def OutputStatus(self, data=None) -> "OutputStatusEntity":
        """Entity factory: client.OutputStatus().list() / client.OutputStatus().load({"id": ...})."""
        from entity.output_status_entity import OutputStatusEntity
        return OutputStatusEntity(self, data)


    def OutputUpdateProduct(self, data=None) -> "OutputUpdateProductEntity":
        """Entity factory: client.OutputUpdateProduct().list() / client.OutputUpdateProduct().load({"id": ...})."""
        from entity.output_update_product_entity import OutputUpdateProductEntity
        return OutputUpdateProductEntity(self, data)



    @classmethod
    def test(cls, testopts=None, sdkopts=None) -> "BluefinTecsMerchantPortalSDK":
        if sdkopts is None:
            sdkopts = {}
        sdkopts = vs.clone(sdkopts)
        if not isinstance(sdkopts, dict):
            sdkopts = {}

        if testopts is None:
            testopts = {}
        testopts = vs.clone(testopts)
        if not isinstance(testopts, dict):
            testopts = {}
        testopts["active"] = True

        vs.setpath(sdkopts, "feature.test", testopts)

        sdk = cls(sdkopts)
        sdk.mode = "test"

        return sdk


from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from entity.merchant_portal_api_controller_entity import MerchantPortalApiControllerEntity
    from entity.merchant_portal_common_controller_entity import MerchantPortalCommonControllerEntity
    from entity.merchant_portal_pam_contract_controller_entity import MerchantPortalPamContractControllerEntity
    from entity.merchant_portal_pam_document_controller_entity import MerchantPortalPamDocumentControllerEntity
    from entity.merchant_portal_pam_form_controller_entity import MerchantPortalPamFormControllerEntity
    from entity.merchant_portal_pam_mandator_controller_entity import MerchantPortalPamMandatorControllerEntity
    from entity.merchant_portal_pam_merchant_controller_entity import MerchantPortalPamMerchantControllerEntity
    from entity.merchant_portal_pam_package_controller_entity import MerchantPortalPamPackageControllerEntity
    from entity.merchant_portal_pam_product_controller_entity import MerchantPortalPamProductControllerEntity
    from entity.output_add_product_entity import OutputAddProductEntity
    from entity.output_create_product_entity import OutputCreateProductEntity
    from entity.output_detail_entity import OutputDetailEntity
    from entity.output_list_entity import OutputListEntity
    from entity.output_message_entity import OutputMessageEntity
    from entity.output_move_tid_entity import OutputMoveTidEntity
    from entity.output_remove_product_entity import OutputRemoveProductEntity
    from entity.output_start_entity import OutputStartEntity
    from entity.output_status_entity import OutputStatusEntity
    from entity.output_update_product_entity import OutputUpdateProductEntity
