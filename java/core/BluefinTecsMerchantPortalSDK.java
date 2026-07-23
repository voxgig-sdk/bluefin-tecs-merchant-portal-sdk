package voxgig.bluefintecsmerchantportalsdk.core;

import java.util.Map;

/**
 * BluefinTecsMerchantPortal SDK client. All transport and pipeline behaviour lives in
 * the SdkClient base (core/SdkClient.java); this class binds the
 * API-specific entity accessors and the test-mode constructor.
 */
public class BluefinTecsMerchantPortalSDK extends SdkClient {

  public BluefinTecsMerchantPortalSDK() {
    this(null);
  }

  public BluefinTecsMerchantPortalSDK(Map<String, Object> options) {
    super(options);
  }


  /**
   * Returns a merchant_portal_api_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalApiController(null).list(null, null) or
   * client.merchantPortalApiController(null).load(Map.of("id", ...), null).
   */
  public SdkEntity merchantPortalApiController(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalApiControllerEntity(this, entopts);
  }

  /**
   * Returns a merchant_portal_common_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalCommonController(null).list(null, null) or
   * client.merchantPortalCommonController(null).load(Map.of("id", ...), null).
   */
  public SdkEntity merchantPortalCommonController(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalCommonControllerEntity(this, entopts);
  }

  /**
   * Returns a merchant_portal_pam_contract_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalPamContractController(null).list(null, null) or
   * client.merchantPortalPamContractController(null).load(Map.of("id", ...), null).
   */
  public SdkEntity merchantPortalPamContractController(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalPamContractControllerEntity(this, entopts);
  }

  /**
   * Returns a merchant_portal_pam_document_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalPamDocumentController(null).list(null, null) or
   * client.merchantPortalPamDocumentController(null).load(Map.of("id", ...), null).
   */
  public SdkEntity merchantPortalPamDocumentController(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalPamDocumentControllerEntity(this, entopts);
  }

  /**
   * Returns a merchant_portal_pam_form_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalPamFormController(null).list(null, null) or
   * client.merchantPortalPamFormController(null).load(Map.of("id", ...), null).
   */
  public SdkEntity merchantPortalPamFormController(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalPamFormControllerEntity(this, entopts);
  }

  /**
   * Returns a merchant_portal_pam_mandator_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalPamMandatorController(null).list(null, null) or
   * client.merchantPortalPamMandatorController(null).load(Map.of("id", ...), null).
   */
  public SdkEntity merchantPortalPamMandatorController(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalPamMandatorControllerEntity(this, entopts);
  }

  /**
   * Returns a merchant_portal_pam_merchant_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalPamMerchantController(null).list(null, null) or
   * client.merchantPortalPamMerchantController(null).load(Map.of("id", ...), null).
   */
  public SdkEntity merchantPortalPamMerchantController(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalPamMerchantControllerEntity(this, entopts);
  }

  /**
   * Returns a merchant_portal_pam_package_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalPamPackageController(null).list(null, null) or
   * client.merchantPortalPamPackageController(null).load(Map.of("id", ...), null).
   */
  public SdkEntity merchantPortalPamPackageController(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalPamPackageControllerEntity(this, entopts);
  }

  /**
   * Returns a merchant_portal_pam_product_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalPamProductController(null).list(null, null) or
   * client.merchantPortalPamProductController(null).load(Map.of("id", ...), null).
   */
  public SdkEntity merchantPortalPamProductController(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalPamProductControllerEntity(this, entopts);
  }

  /**
   * Returns a output_add_product entity bound to this client.
   * Idiomatic usage: client.outputAddProduct(null).list(null, null) or
   * client.outputAddProduct(null).load(Map.of("id", ...), null).
   */
  public SdkEntity outputAddProduct(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.OutputAddProductEntity(this, entopts);
  }

  /**
   * Returns a output_create_product entity bound to this client.
   * Idiomatic usage: client.outputCreateProduct(null).list(null, null) or
   * client.outputCreateProduct(null).load(Map.of("id", ...), null).
   */
  public SdkEntity outputCreateProduct(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.OutputCreateProductEntity(this, entopts);
  }

  /**
   * Returns a output_detail entity bound to this client.
   * Idiomatic usage: client.outputDetail(null).list(null, null) or
   * client.outputDetail(null).load(Map.of("id", ...), null).
   */
  public SdkEntity outputDetail(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.OutputDetailEntity(this, entopts);
  }

  /**
   * Returns a output_list entity bound to this client.
   * Idiomatic usage: client.outputList(null).list(null, null) or
   * client.outputList(null).load(Map.of("id", ...), null).
   */
  public SdkEntity outputList(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.OutputListEntity(this, entopts);
  }

  /**
   * Returns a output_message entity bound to this client.
   * Idiomatic usage: client.outputMessage(null).list(null, null) or
   * client.outputMessage(null).load(Map.of("id", ...), null).
   */
  public SdkEntity outputMessage(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.OutputMessageEntity(this, entopts);
  }

  /**
   * Returns a output_move_tid entity bound to this client.
   * Idiomatic usage: client.outputMoveTid(null).list(null, null) or
   * client.outputMoveTid(null).load(Map.of("id", ...), null).
   */
  public SdkEntity outputMoveTid(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.OutputMoveTidEntity(this, entopts);
  }

  /**
   * Returns a output_remove_product entity bound to this client.
   * Idiomatic usage: client.outputRemoveProduct(null).list(null, null) or
   * client.outputRemoveProduct(null).load(Map.of("id", ...), null).
   */
  public SdkEntity outputRemoveProduct(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.OutputRemoveProductEntity(this, entopts);
  }

  /**
   * Returns a output_start entity bound to this client.
   * Idiomatic usage: client.outputStart(null).list(null, null) or
   * client.outputStart(null).load(Map.of("id", ...), null).
   */
  public SdkEntity outputStart(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.OutputStartEntity(this, entopts);
  }

  /**
   * Returns a output_status entity bound to this client.
   * Idiomatic usage: client.outputStatus(null).list(null, null) or
   * client.outputStatus(null).load(Map.of("id", ...), null).
   */
  public SdkEntity outputStatus(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.OutputStatusEntity(this, entopts);
  }

  /**
   * Returns a output_update_product entity bound to this client.
   * Idiomatic usage: client.outputUpdateProduct(null).list(null, null) or
   * client.outputUpdateProduct(null).load(Map.of("id", ...), null).
   */
  public SdkEntity outputUpdateProduct(Map<String, Object> entopts) {
    return new voxgig.bluefintecsmerchantportalsdk.entity.OutputUpdateProductEntity(this, entopts);
  }


  // testSDK builds a client in test mode: the test feature is activated,
  // installing the in-memory mock transport (no network activity).
  public static BluefinTecsMerchantPortalSDK testSDK() {
    return testSDK(null, null);
  }

  public static BluefinTecsMerchantPortalSDK testSDK(
      Map<String, Object> testopts, Map<String, Object> sdkopts) {
    BluefinTecsMerchantPortalSDK sdk = new BluefinTecsMerchantPortalSDK(SdkClient.testOptions(testopts, sdkopts));
    sdk.mode = "test";
    return sdk;
  }
}
