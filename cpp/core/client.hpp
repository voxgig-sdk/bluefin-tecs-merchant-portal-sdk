// BluefinTecsMerchantPortal SDK client. All transport and pipeline behaviour lives in the
// SdkClient base (core/types.hpp); this class binds the API-specific entity
// accessors and the test-mode constructor.

#ifndef SDK_CORE_CLIENT_HPP
#define SDK_CORE_CLIENT_HPP

#include <memory>

#include "../core/types.hpp"
#include "../entity/entities.hpp"

namespace sdk {

class BluefinTecsMerchantPortalSDK : public SdkClient {
public:
  explicit BluefinTecsMerchantPortalSDK(Value options = Value::undef()) : SdkClient(options) {}


  // MerchantPortalApiController entity bound to this client.
  std::shared_ptr<MerchantPortalApiControllerEntity> merchant_portal_api_controller(Value entopts = Value::undef()) {
    return std::make_shared<MerchantPortalApiControllerEntity>(this, entopts);
  }

  // MerchantPortalCommonController entity bound to this client.
  std::shared_ptr<MerchantPortalCommonControllerEntity> merchant_portal_common_controller(Value entopts = Value::undef()) {
    return std::make_shared<MerchantPortalCommonControllerEntity>(this, entopts);
  }

  // MerchantPortalPamContractController entity bound to this client.
  std::shared_ptr<MerchantPortalPamContractControllerEntity> merchant_portal_pam_contract_controller(Value entopts = Value::undef()) {
    return std::make_shared<MerchantPortalPamContractControllerEntity>(this, entopts);
  }

  // MerchantPortalPamDocumentController entity bound to this client.
  std::shared_ptr<MerchantPortalPamDocumentControllerEntity> merchant_portal_pam_document_controller(Value entopts = Value::undef()) {
    return std::make_shared<MerchantPortalPamDocumentControllerEntity>(this, entopts);
  }

  // MerchantPortalPamFormController entity bound to this client.
  std::shared_ptr<MerchantPortalPamFormControllerEntity> merchant_portal_pam_form_controller(Value entopts = Value::undef()) {
    return std::make_shared<MerchantPortalPamFormControllerEntity>(this, entopts);
  }

  // MerchantPortalPamMandatorController entity bound to this client.
  std::shared_ptr<MerchantPortalPamMandatorControllerEntity> merchant_portal_pam_mandator_controller(Value entopts = Value::undef()) {
    return std::make_shared<MerchantPortalPamMandatorControllerEntity>(this, entopts);
  }

  // MerchantPortalPamMerchantController entity bound to this client.
  std::shared_ptr<MerchantPortalPamMerchantControllerEntity> merchant_portal_pam_merchant_controller(Value entopts = Value::undef()) {
    return std::make_shared<MerchantPortalPamMerchantControllerEntity>(this, entopts);
  }

  // MerchantPortalPamPackageController entity bound to this client.
  std::shared_ptr<MerchantPortalPamPackageControllerEntity> merchant_portal_pam_package_controller(Value entopts = Value::undef()) {
    return std::make_shared<MerchantPortalPamPackageControllerEntity>(this, entopts);
  }

  // MerchantPortalPamProductController entity bound to this client.
  std::shared_ptr<MerchantPortalPamProductControllerEntity> merchant_portal_pam_product_controller(Value entopts = Value::undef()) {
    return std::make_shared<MerchantPortalPamProductControllerEntity>(this, entopts);
  }

  // OutputAddProduct entity bound to this client.
  std::shared_ptr<OutputAddProductEntity> output_add_product(Value entopts = Value::undef()) {
    return std::make_shared<OutputAddProductEntity>(this, entopts);
  }

  // OutputCreateProduct entity bound to this client.
  std::shared_ptr<OutputCreateProductEntity> output_create_product(Value entopts = Value::undef()) {
    return std::make_shared<OutputCreateProductEntity>(this, entopts);
  }

  // OutputDetail entity bound to this client.
  std::shared_ptr<OutputDetailEntity> output_detail(Value entopts = Value::undef()) {
    return std::make_shared<OutputDetailEntity>(this, entopts);
  }

  // OutputList entity bound to this client.
  std::shared_ptr<OutputListEntity> output_list(Value entopts = Value::undef()) {
    return std::make_shared<OutputListEntity>(this, entopts);
  }

  // OutputMessage entity bound to this client.
  std::shared_ptr<OutputMessageEntity> output_message(Value entopts = Value::undef()) {
    return std::make_shared<OutputMessageEntity>(this, entopts);
  }

  // OutputMoveTid entity bound to this client.
  std::shared_ptr<OutputMoveTidEntity> output_move_tid(Value entopts = Value::undef()) {
    return std::make_shared<OutputMoveTidEntity>(this, entopts);
  }

  // OutputRemoveProduct entity bound to this client.
  std::shared_ptr<OutputRemoveProductEntity> output_remove_product(Value entopts = Value::undef()) {
    return std::make_shared<OutputRemoveProductEntity>(this, entopts);
  }

  // OutputStart entity bound to this client.
  std::shared_ptr<OutputStartEntity> output_start(Value entopts = Value::undef()) {
    return std::make_shared<OutputStartEntity>(this, entopts);
  }

  // OutputStatus entity bound to this client.
  std::shared_ptr<OutputStatusEntity> output_status(Value entopts = Value::undef()) {
    return std::make_shared<OutputStatusEntity>(this, entopts);
  }

  // OutputUpdateProduct entity bound to this client.
  std::shared_ptr<OutputUpdateProductEntity> output_update_product(Value entopts = Value::undef()) {
    return std::make_shared<OutputUpdateProductEntity>(this, entopts);
  }


  // testSDK builds a client in test mode: the test feature is activated,
  // installing the in-memory mock transport (no network activity).
  static std::shared_ptr<BluefinTecsMerchantPortalSDK> testSDK() {
    return testSDK(Value::undef(), Value::undef());
  }

  static std::shared_ptr<BluefinTecsMerchantPortalSDK> testSDK(Value testopts, Value sdkopts) {
    auto sdk = std::make_shared<BluefinTecsMerchantPortalSDK>(SdkClient::testOptions(testopts, sdkopts));
    sdk->mode = "test";
    return sdk;
  }

  // Convenience no-arg constructor.
  static std::shared_ptr<BluefinTecsMerchantPortalSDK> create() {
    return std::make_shared<BluefinTecsMerchantPortalSDK>(Value::undef());
  }
};

using BluefinTecsMerchantPortalSDKPtr = std::shared_ptr<BluefinTecsMerchantPortalSDK>;

} // namespace sdk

#endif // SDK_CORE_CLIENT_HPP
