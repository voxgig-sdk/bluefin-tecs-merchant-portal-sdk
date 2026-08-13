package voxgig.bluefintecsmerchantportalsdk.core;

// Typed reference models for the BluefinTecsMerchantPortal SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These records are documentation/DX reference shapes ONLY. The SDK ops take
// and return the loose object model (Map<String, Object> / Object) at runtime,
// so these types are not wired into the op signatures — use them to describe a
// payload before converting it to a map. Every component is a boxed (nullable)
// type, so an optional (req:false) key needs no distinct rendering.

import java.util.List;
import java.util.Map;

public final class BluefinTecsMerchantPortalTypes {

  private BluefinTecsMerchantPortalTypes() {}

  public record MerchantPortalApiController(Long account_number, Map<String, Object> additional_data, String business_reg_number, String city, String corporateuuid, String country, String currency, Long merchant_category_code, String merchant_email, String merchant_name, String merchant_phone_number, String packageid, String packageorderuuid, String password, String productid, String productid_acquirer, String reason_deactivation, String reason_reactivation, Long sorting_code, String state, String street, String terminal_country_code, String terminal_language_code, String terminal_location, String terminal_serial_number, Long terminalid, String terminalid_acquirer, String user_email, String user_phone_number, String username, String vu_nummer, String web_shop_url, String zipcode) {}

  public record MerchantPortalApiControllerCreateData(Long account_number, Map<String, Object> additional_data, String business_reg_number, String city, String corporateuuid, String country, String currency, Long merchant_category_code, String merchant_email, String merchant_name, String merchant_phone_number, String packageid, String packageorderuuid, String password, String productid, String productid_acquirer, String reason_deactivation, String reason_reactivation, Long sorting_code, String state, String street, String terminal_country_code, String terminal_language_code, String terminal_location, String terminal_serial_number, Long terminalid, String terminalid_acquirer, String user_email, String user_phone_number, String username, String vu_nummer, String web_shop_url, String zipcode) {}

  public record MerchantPortalCommonController() {}

  public record MerchantPortalCommonControllerLoadMatch() {}

  public record MerchantPortalPamContractController(String language, String productOrderUUID) {}

  public record MerchantPortalPamContractControllerCreateData(String language, String productOrderUUID) {}

  public record MerchantPortalPamDocumentController(String appFormFieldDescUUID, String packageOrderUUID, String productOrderUUID) {}

  public record MerchantPortalPamDocumentControllerCreateData(String appFormFieldDescUUID, String packageOrderUUID, String productOrderUUID) {}

  public record MerchantPortalPamFormController(String appFormFieldsDescUUID, Map<String, Object> filter, String language, Map<String, Object> packageOrder, String packageOrderUUID, String packageUUID, String productOrderUUID, List<Object> productOrders, String reasonOfReopening) {}

  public record MerchantPortalPamFormControllerCreateData(String appFormFieldsDescUUID, Map<String, Object> filter, String language, Map<String, Object> packageOrder, String packageOrderUUID, String packageUUID, String productOrderUUID, List<Object> productOrders, String reasonOfReopening) {}

  public record MerchantPortalPamMandatorController(String clientSecret, String mandatorName, String notificationEmail, String packageUUID) {}

  public record MerchantPortalPamMandatorControllerCreateData(String clientSecret, String mandatorName, String notificationEmail, String packageUUID) {}

  public record MerchantPortalPamMerchantController(Map<String, Object> additional_data, String businessRegistrationNumber, String city, String companyName, String corporateUUID, String country, String currency, String email, String language, String login, String mandator, String merchantContractNumber, String merchantName, String merchant_category_code, String packageUUID, String packageorderuuid, String phoneNumber, String postalCode, String productid_acquirer, String region, String registrationNumber, String signature, String street, List<Object> terminalIds, String terminalid_acquirer, String vu_nummer) {}

  public record MerchantPortalPamMerchantControllerCreateData(Map<String, Object> additional_data, String businessRegistrationNumber, String city, String companyName, String corporateUUID, String country, String currency, String email, String language, String login, String mandator, String merchantContractNumber, String merchantName, String merchant_category_code, String packageUUID, String packageorderuuid, String phoneNumber, String postalCode, String productid_acquirer, String region, String registrationNumber, String signature, String street, List<Object> terminalIds, String terminalid_acquirer, String vu_nummer) {}

  public record MerchantPortalPamPackageController(String consumerUUID, String corporateUUID, String country, String descriptionKey, Map<String, Object> filter, String language, String nameKey, String packageStatus, String packageUUID, Map<String, Object> pagination, Map<String, Object> sorting) {}

  public record MerchantPortalPamPackageControllerCreateData(String consumerUUID, String corporateUUID, String country, String descriptionKey, Map<String, Object> filter, String language, String nameKey, String packageStatus, String packageUUID, Map<String, Object> pagination, Map<String, Object> sorting) {}

  public record MerchantPortalPamProductController(String consumerUUID, Map<String, Object> filter, String language, String merchantID, String packageOrderUUID, Map<String, Object> pagination, String productOrderUUID, String productUUID, String reason_decline, Map<String, Object> sorting) {}

  public record MerchantPortalPamProductControllerCreateData(String consumerUUID, Map<String, Object> filter, String language, String merchantID, String packageOrderUUID, Map<String, Object> pagination, String productOrderUUID, String productUUID, String reason_decline, Map<String, Object> sorting) {}

  public record OutputAddProduct(String packageUUID, List<Object> productUUIDs, Long responseCode, String responseMessage) {}

  public record OutputAddProductCreateData(String packageUUID, List<Object> productUUIDs, Long responseCode, String responseMessage) {}

  public record OutputCreateProduct(String acquirerId, Boolean allowMultipleOrders, String appFormTemplateName, Boolean contractNeeded, Boolean credentialsNeeded, String descriptionKey, String nameKey, Boolean prescreeningAllowed, String productName, Long responseCode, String responseMessage, String terminalTemplateName, String vendorName, String xmlTemplateFile) {}

  public record OutputCreateProductCreateData(String acquirerId, Boolean allowMultipleOrders, String appFormTemplateName, Boolean contractNeeded, Boolean credentialsNeeded, String descriptionKey, String nameKey, Boolean prescreeningAllowed, String productName, Long responseCode, String responseMessage, String terminalTemplateName, String vendorName, String xmlTemplateFile) {}

  public record OutputDetail(Map<String, Object> batch, Map<String, Object> lines, Map<String, Object> progress) {}

  public record OutputDetailLoadMatch(String id) {}

  public record OutputList(List<Object> items, Map<String, Object> pagination, Long responseCode, String responseMessage, Map<String, Object> sorting) {}

  public record OutputListCreateData(List<Object> items, Map<String, Object> pagination, Long responseCode, String responseMessage, Map<String, Object> sorting) {}

  public record OutputMessage(Long responseCode, String responseMessage) {}

  public record OutputMessageLoadMatch(String id) {}

  public record OutputMoveTid(List<Object> productOrderUUIDs, Long responseCode, String responseMessage, String targetPackageOrderUUID, String targetProductOrderUUID) {}

  public record OutputMoveTidCreateData(List<Object> productOrderUUIDs, Long responseCode, String responseMessage, String targetPackageOrderUUID, String targetProductOrderUUID) {}

  public record OutputRemoveProduct(String packageUUID, List<Object> productUUIDs, Long responseCode, String responseMessage) {}

  public record OutputRemoveProductCreateData(String packageUUID, List<Object> productUUIDs, Long responseCode, String responseMessage) {}

  public record OutputStart(String id, Long responseCode, String responseMessage) {}

  public record OutputStartCreateData(String id, Long responseCode, String responseMessage) {}

  public record OutputStatus(Long percentage, Long responseCode, String responseMessage, String status) {}

  public record OutputStatusLoadMatch(String id) {}

  public record OutputUpdateProduct(Boolean allowMultipleOrders, String appFormName, Boolean contractNeeded, Boolean credentialsNeeded, String descriptionKey, String nameKey, Boolean prescreeningAllowed, String productName, String productStatus, String productUUID, Long responseCode, String responseMessage, String vendorName) {}

  public record OutputUpdateProductCreateData(Boolean allowMultipleOrders, String appFormName, Boolean contractNeeded, Boolean credentialsNeeded, String descriptionKey, String nameKey, Boolean prescreeningAllowed, String productName, String productStatus, String productUUID, Long responseCode, String responseMessage, String vendorName) {}

}
