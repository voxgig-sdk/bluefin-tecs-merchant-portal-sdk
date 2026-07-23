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

  public record MerchantPortalPamContractController(String language, String product_order_uuid) {}

  public record MerchantPortalPamContractControllerCreateData(String language, String product_order_uuid) {}

  public record MerchantPortalPamDocumentController(String app_form_field_desc_uuid, String package_order_uuid, String product_order_uuid) {}

  public record MerchantPortalPamDocumentControllerCreateData(String app_form_field_desc_uuid, String package_order_uuid, String product_order_uuid) {}

  public record MerchantPortalPamFormController(String app_form_fields_desc_uuid, Map<String, Object> filter, String language, Map<String, Object> package_order, String package_order_uuid, String package_uuid, List<Object> product_order, String product_order_uuid, String reason_of_reopening) {}

  public record MerchantPortalPamFormControllerCreateData(String app_form_fields_desc_uuid, Map<String, Object> filter, String language, Map<String, Object> package_order, String package_order_uuid, String package_uuid, List<Object> product_order, String product_order_uuid, String reason_of_reopening) {}

  public record MerchantPortalPamMandatorController(String client_secret, String mandator_name, String notification_email, String package_uuid) {}

  public record MerchantPortalPamMandatorControllerCreateData(String client_secret, String mandator_name, String notification_email, String package_uuid) {}

  public record MerchantPortalPamMerchantController(Map<String, Object> additional_data, String business_registration_number, String city, String company_name, String corporate_uuid, String country, String currency, String email, String language, String login, String mandator, String merchant_category_code, String merchant_contract_number, String merchant_name, String package_uuid, String packageorderuuid, String phone_number, String postal_code, String productid_acquirer, String region, String registration_number, String signature, String street, List<Object> terminal_id, String terminalid_acquirer, String vu_nummer) {}

  public record MerchantPortalPamMerchantControllerCreateData(Map<String, Object> additional_data, String business_registration_number, String city, String company_name, String corporate_uuid, String country, String currency, String email, String language, String login, String mandator, String merchant_category_code, String merchant_contract_number, String merchant_name, String package_uuid, String packageorderuuid, String phone_number, String postal_code, String productid_acquirer, String region, String registration_number, String signature, String street, List<Object> terminal_id, String terminalid_acquirer, String vu_nummer) {}

  public record MerchantPortalPamPackageController(String consumer_uuid, String corporate_uuid, String country, String description_key, Map<String, Object> filter, String language, String name_key, String package_status, String package_uuid, Map<String, Object> pagination, Map<String, Object> sorting) {}

  public record MerchantPortalPamPackageControllerCreateData(String consumer_uuid, String corporate_uuid, String country, String description_key, Map<String, Object> filter, String language, String name_key, String package_status, String package_uuid, Map<String, Object> pagination, Map<String, Object> sorting) {}

  public record MerchantPortalPamProductController(String consumer_uuid, Map<String, Object> filter, String language, String merchant_id, String package_order_uuid, Map<String, Object> pagination, String product_order_uuid, String product_uuid, String reason_decline, Map<String, Object> sorting) {}

  public record MerchantPortalPamProductControllerCreateData(String consumer_uuid, Map<String, Object> filter, String language, String merchant_id, String package_order_uuid, Map<String, Object> pagination, String product_order_uuid, String product_uuid, String reason_decline, Map<String, Object> sorting) {}

  public record OutputAddProduct(String package_uuid, List<Object> product_uui_d, Long response_code, String response_message) {}

  public record OutputAddProductCreateData(String package_uuid, List<Object> product_uui_d, Long response_code, String response_message) {}

  public record OutputCreateProduct(String acquirer_id, Boolean allow_multiple_order, String app_form_template_name, Boolean contract_needed, Boolean credentials_needed, String description_key, String name_key, Boolean prescreening_allowed, String product_name, Long response_code, String response_message, String terminal_template_name, String vendor_name, String xml_template_file) {}

  public record OutputCreateProductCreateData(String acquirer_id, Boolean allow_multiple_order, String app_form_template_name, Boolean contract_needed, Boolean credentials_needed, String description_key, String name_key, Boolean prescreening_allowed, String product_name, Long response_code, String response_message, String terminal_template_name, String vendor_name, String xml_template_file) {}

  public record OutputDetail(Map<String, Object> detail, Long response_code, String response_message) {}

  public record OutputDetailLoadMatch(String id) {}

  public record OutputList(List<Object> item, Map<String, Object> pagination, Long response_code, String response_message, Map<String, Object> sorting) {}

  public record OutputListCreateData(List<Object> item, Map<String, Object> pagination, Long response_code, String response_message, Map<String, Object> sorting) {}

  public record OutputMessage(Long response_code, String response_message) {}

  public record OutputMessageLoadMatch(String id) {}

  public record OutputMoveTid(List<Object> product_order_uui_d, Long response_code, String response_message, String target_package_order_uuid, String target_product_order_uuid) {}

  public record OutputMoveTidCreateData(List<Object> product_order_uui_d, Long response_code, String response_message, String target_package_order_uuid, String target_product_order_uuid) {}

  public record OutputRemoveProduct(String package_uuid, List<Object> product_uui_d, Long response_code, String response_message) {}

  public record OutputRemoveProductCreateData(String package_uuid, List<Object> product_uui_d, Long response_code, String response_message) {}

  public record OutputStart(String id, Long response_code, String response_message) {}

  public record OutputStartCreateData(String id, Long response_code, String response_message) {}

  public record OutputStatus(Long percentage, Long response_code, String response_message, String status) {}

  public record OutputStatusLoadMatch(String id) {}

  public record OutputUpdateProduct(Boolean allow_multiple_order, String app_form_name, Boolean contract_needed, Boolean credentials_needed, String description_key, String name_key, Boolean prescreening_allowed, String product_name, String product_status, String product_uuid, Long response_code, String response_message, String vendor_name) {}

  public record OutputUpdateProductCreateData(Boolean allow_multiple_order, String app_form_name, Boolean contract_needed, Boolean credentials_needed, String description_key, String name_key, Boolean prescreening_allowed, String product_name, String product_status, String product_uuid, Long response_code, String response_message, String vendor_name) {}

}
