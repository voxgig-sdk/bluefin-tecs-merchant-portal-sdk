package voxgig.bluefintecsmerchantportalsdk.core

/**
 * BluefinTecsMerchantPortal SDK client. All transport and pipeline behaviour lives in the
 * SdkClient base (core/SdkClient.kt); this class binds the API-specific
 * entity accessors and the test-mode constructor.
 */
class BluefinTecsMerchantPortalSDK(options: MutableMap<String, Any?>?) : SdkClient(options) {

  constructor() : this(null)


  /**
   * Returns a merchant_portal_api_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalApiController(null).list(null, null) or
   * client.merchantPortalApiController(null).load(mutableMapOf("id" to ...), null).
   */
  fun merchantPortalApiController(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalApiControllerEntity(this, entopts)
  }

  /**
   * Returns a merchant_portal_common_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalCommonController(null).list(null, null) or
   * client.merchantPortalCommonController(null).load(mutableMapOf("id" to ...), null).
   */
  fun merchantPortalCommonController(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalCommonControllerEntity(this, entopts)
  }

  /**
   * Returns a merchant_portal_pam_contract_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalPamContractController(null).list(null, null) or
   * client.merchantPortalPamContractController(null).load(mutableMapOf("id" to ...), null).
   */
  fun merchantPortalPamContractController(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalPamContractControllerEntity(this, entopts)
  }

  /**
   * Returns a merchant_portal_pam_document_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalPamDocumentController(null).list(null, null) or
   * client.merchantPortalPamDocumentController(null).load(mutableMapOf("id" to ...), null).
   */
  fun merchantPortalPamDocumentController(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalPamDocumentControllerEntity(this, entopts)
  }

  /**
   * Returns a merchant_portal_pam_form_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalPamFormController(null).list(null, null) or
   * client.merchantPortalPamFormController(null).load(mutableMapOf("id" to ...), null).
   */
  fun merchantPortalPamFormController(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalPamFormControllerEntity(this, entopts)
  }

  /**
   * Returns a merchant_portal_pam_mandator_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalPamMandatorController(null).list(null, null) or
   * client.merchantPortalPamMandatorController(null).load(mutableMapOf("id" to ...), null).
   */
  fun merchantPortalPamMandatorController(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalPamMandatorControllerEntity(this, entopts)
  }

  /**
   * Returns a merchant_portal_pam_merchant_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalPamMerchantController(null).list(null, null) or
   * client.merchantPortalPamMerchantController(null).load(mutableMapOf("id" to ...), null).
   */
  fun merchantPortalPamMerchantController(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalPamMerchantControllerEntity(this, entopts)
  }

  /**
   * Returns a merchant_portal_pam_package_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalPamPackageController(null).list(null, null) or
   * client.merchantPortalPamPackageController(null).load(mutableMapOf("id" to ...), null).
   */
  fun merchantPortalPamPackageController(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalPamPackageControllerEntity(this, entopts)
  }

  /**
   * Returns a merchant_portal_pam_product_controller entity bound to this client.
   * Idiomatic usage: client.merchantPortalPamProductController(null).list(null, null) or
   * client.merchantPortalPamProductController(null).load(mutableMapOf("id" to ...), null).
   */
  fun merchantPortalPamProductController(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.MerchantPortalPamProductControllerEntity(this, entopts)
  }

  /**
   * Returns a output_add_product entity bound to this client.
   * Idiomatic usage: client.outputAddProduct(null).list(null, null) or
   * client.outputAddProduct(null).load(mutableMapOf("id" to ...), null).
   */
  fun outputAddProduct(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.OutputAddProductEntity(this, entopts)
  }

  /**
   * Returns a output_create_product entity bound to this client.
   * Idiomatic usage: client.outputCreateProduct(null).list(null, null) or
   * client.outputCreateProduct(null).load(mutableMapOf("id" to ...), null).
   */
  fun outputCreateProduct(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.OutputCreateProductEntity(this, entopts)
  }

  /**
   * Returns a output_detail entity bound to this client.
   * Idiomatic usage: client.outputDetail(null).list(null, null) or
   * client.outputDetail(null).load(mutableMapOf("id" to ...), null).
   */
  fun outputDetail(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.OutputDetailEntity(this, entopts)
  }

  /**
   * Returns a output_list entity bound to this client.
   * Idiomatic usage: client.outputList(null).list(null, null) or
   * client.outputList(null).load(mutableMapOf("id" to ...), null).
   */
  fun outputList(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.OutputListEntity(this, entopts)
  }

  /**
   * Returns a output_message entity bound to this client.
   * Idiomatic usage: client.outputMessage(null).list(null, null) or
   * client.outputMessage(null).load(mutableMapOf("id" to ...), null).
   */
  fun outputMessage(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.OutputMessageEntity(this, entopts)
  }

  /**
   * Returns a output_move_tid entity bound to this client.
   * Idiomatic usage: client.outputMoveTid(null).list(null, null) or
   * client.outputMoveTid(null).load(mutableMapOf("id" to ...), null).
   */
  fun outputMoveTid(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.OutputMoveTidEntity(this, entopts)
  }

  /**
   * Returns a output_remove_product entity bound to this client.
   * Idiomatic usage: client.outputRemoveProduct(null).list(null, null) or
   * client.outputRemoveProduct(null).load(mutableMapOf("id" to ...), null).
   */
  fun outputRemoveProduct(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.OutputRemoveProductEntity(this, entopts)
  }

  /**
   * Returns a output_start entity bound to this client.
   * Idiomatic usage: client.outputStart(null).list(null, null) or
   * client.outputStart(null).load(mutableMapOf("id" to ...), null).
   */
  fun outputStart(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.OutputStartEntity(this, entopts)
  }

  /**
   * Returns a output_status entity bound to this client.
   * Idiomatic usage: client.outputStatus(null).list(null, null) or
   * client.outputStatus(null).load(mutableMapOf("id" to ...), null).
   */
  fun outputStatus(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.OutputStatusEntity(this, entopts)
  }

  /**
   * Returns a output_update_product entity bound to this client.
   * Idiomatic usage: client.outputUpdateProduct(null).list(null, null) or
   * client.outputUpdateProduct(null).load(mutableMapOf("id" to ...), null).
   */
  fun outputUpdateProduct(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefintecsmerchantportalsdk.entity.OutputUpdateProductEntity(this, entopts)
  }


  companion object {
    // testSDK builds a client in test mode: the test feature is activated,
    // installing the in-memory mock transport (no network activity).
    fun testSDK(): BluefinTecsMerchantPortalSDK = testSDK(null, null)

    fun testSDK(
      testopts: MutableMap<String, Any?>?,
      sdkopts: MutableMap<String, Any?>?,
    ): BluefinTecsMerchantPortalSDK {
      val sdk = BluefinTecsMerchantPortalSDK(testOptions(testopts, sdkopts))
      sdk.mode = "test"
      return sdk
    }
  }
}
