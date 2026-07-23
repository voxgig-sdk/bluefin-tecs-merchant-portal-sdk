// Typed reference models for the BluefinTecsMerchantPortal SDK (C++).
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params. The C++ SDK runtime is Value-based, so these structs are
// DOCUMENTATION / convenience types only — the SDK neither includes nor
// requires this header. Array fields surface as std::vector<Value>, object
// fields as std::map<std::string, Value>, and any/null fields as sdk::Value.
// Optional (req:false) members are flagged with a trailing "// optional"
// comment. Do not edit by hand.

#ifndef SDK_BLUEFINTECSMERCHANTPORTAL_TYPES_HPP
#define SDK_BLUEFINTECSMERCHANTPORTAL_TYPES_HPP

#include <cstdint>
#include <map>
#include <string>
#include <vector>

#include "core/types.hpp"

namespace sdk {
namespace types {

struct MerchantPortalApiController {
  int64_t account_number;  // optional
  std::map<std::string, Value> additional_data;  // optional
  std::string business_reg_number;
  std::string city;
  std::string corporateuuid;  // optional
  std::string country;
  std::string currency;
  int64_t merchant_category_code;
  std::string merchant_email;  // optional
  std::string merchant_name;
  std::string merchant_phone_number;  // optional
  std::string packageid;
  std::string packageorderuuid;
  std::string password;  // optional
  std::string productid;  // optional
  std::string productid_acquirer;  // optional
  std::string reason_deactivation;
  std::string reason_reactivation;
  int64_t sorting_code;  // optional
  std::string state;  // optional
  std::string street;
  std::string terminal_country_code;
  std::string terminal_language_code;
  std::string terminal_location;
  std::string terminal_serial_number;
  int64_t terminalid;
  std::string terminalid_acquirer;  // optional
  std::string user_email;  // optional
  std::string user_phone_number;  // optional
  std::string username;  // optional
  std::string vu_nummer;
  std::string web_shop_url;  // optional
  std::string zipcode;
};

struct MerchantPortalApiControllerCreateData {
  int64_t account_number;  // optional
  std::map<std::string, Value> additional_data;  // optional
  std::string business_reg_number;
  std::string city;
  std::string corporateuuid;  // optional
  std::string country;
  std::string currency;
  int64_t merchant_category_code;
  std::string merchant_email;  // optional
  std::string merchant_name;
  std::string merchant_phone_number;  // optional
  std::string packageid;
  std::string packageorderuuid;
  std::string password;  // optional
  std::string productid;  // optional
  std::string productid_acquirer;  // optional
  std::string reason_deactivation;
  std::string reason_reactivation;
  int64_t sorting_code;  // optional
  std::string state;  // optional
  std::string street;
  std::string terminal_country_code;
  std::string terminal_language_code;
  std::string terminal_location;
  std::string terminal_serial_number;
  int64_t terminalid;
  std::string terminalid_acquirer;  // optional
  std::string user_email;  // optional
  std::string user_phone_number;  // optional
  std::string username;  // optional
  std::string vu_nummer;
  std::string web_shop_url;  // optional
  std::string zipcode;
};

struct MerchantPortalCommonController {};

struct MerchantPortalCommonControllerLoadMatch {};

struct MerchantPortalPamContractController {
  std::string language;
  std::string product_order_uuid;
};

struct MerchantPortalPamContractControllerCreateData {
  std::string language;
  std::string product_order_uuid;
};

struct MerchantPortalPamDocumentController {
  std::string app_form_field_desc_uuid;
  std::string package_order_uuid;  // optional
  std::string product_order_uuid;  // optional
};

struct MerchantPortalPamDocumentControllerCreateData {
  std::string app_form_field_desc_uuid;
  std::string package_order_uuid;  // optional
  std::string product_order_uuid;  // optional
};

struct MerchantPortalPamFormController {
  std::string app_form_fields_desc_uuid;
  std::map<std::string, Value> filter;  // optional
  std::string language;
  std::map<std::string, Value> package_order;  // optional
  std::string package_order_uuid;
  std::string package_uuid;  // optional
  std::vector<Value> product_order;  // optional
  std::string product_order_uuid;  // optional
  std::string reason_of_reopening;
};

struct MerchantPortalPamFormControllerCreateData {
  std::string app_form_fields_desc_uuid;
  std::map<std::string, Value> filter;  // optional
  std::string language;
  std::map<std::string, Value> package_order;  // optional
  std::string package_order_uuid;
  std::string package_uuid;  // optional
  std::vector<Value> product_order;  // optional
  std::string product_order_uuid;  // optional
  std::string reason_of_reopening;
};

struct MerchantPortalPamMandatorController {
  std::string client_secret;  // optional
  std::string mandator_name;
  std::string notification_email;  // optional
  std::string package_uuid;
};

struct MerchantPortalPamMandatorControllerCreateData {
  std::string client_secret;  // optional
  std::string mandator_name;
  std::string notification_email;  // optional
  std::string package_uuid;
};

struct MerchantPortalPamMerchantController {
  std::map<std::string, Value> additional_data;  // optional
  std::string business_registration_number;
  std::string city;  // optional
  std::string company_name;
  std::string corporate_uuid;
  std::string country;  // optional
  std::string currency;
  std::string email;
  std::string language;
  std::string login;
  std::string mandator;
  std::string merchant_category_code;  // optional
  std::string merchant_contract_number;
  std::string merchant_name;  // optional
  std::string package_uuid;  // optional
  std::string packageorderuuid;
  std::string phone_number;
  std::string postal_code;  // optional
  std::string productid_acquirer;
  std::string region;  // optional
  std::string registration_number;  // optional
  std::string signature;  // optional
  std::string street;  // optional
  std::vector<Value> terminal_id;  // optional
  std::string terminalid_acquirer;  // optional
  std::string vu_nummer;
};

struct MerchantPortalPamMerchantControllerCreateData {
  std::map<std::string, Value> additional_data;  // optional
  std::string business_registration_number;
  std::string city;  // optional
  std::string company_name;
  std::string corporate_uuid;
  std::string country;  // optional
  std::string currency;
  std::string email;
  std::string language;
  std::string login;
  std::string mandator;
  std::string merchant_category_code;  // optional
  std::string merchant_contract_number;
  std::string merchant_name;  // optional
  std::string package_uuid;  // optional
  std::string packageorderuuid;
  std::string phone_number;
  std::string postal_code;  // optional
  std::string productid_acquirer;
  std::string region;  // optional
  std::string registration_number;  // optional
  std::string signature;  // optional
  std::string street;  // optional
  std::vector<Value> terminal_id;  // optional
  std::string terminalid_acquirer;  // optional
  std::string vu_nummer;
};

struct MerchantPortalPamPackageController {
  std::string consumer_uuid;  // optional
  std::string corporate_uuid;  // optional
  std::string country;  // optional
  std::string description_key;  // optional
  std::map<std::string, Value> filter;  // optional
  std::string language;
  std::string name_key;  // optional
  std::string package_status;  // optional
  std::string package_uuid;
  std::map<std::string, Value> pagination;  // optional
  std::map<std::string, Value> sorting;  // optional
};

struct MerchantPortalPamPackageControllerCreateData {
  std::string consumer_uuid;  // optional
  std::string corporate_uuid;  // optional
  std::string country;  // optional
  std::string description_key;  // optional
  std::map<std::string, Value> filter;  // optional
  std::string language;
  std::string name_key;  // optional
  std::string package_status;  // optional
  std::string package_uuid;
  std::map<std::string, Value> pagination;  // optional
  std::map<std::string, Value> sorting;  // optional
};

struct MerchantPortalPamProductController {
  std::string consumer_uuid;  // optional
  std::map<std::string, Value> filter;  // optional
  std::string language;  // optional
  std::string merchant_id;  // optional
  std::string package_order_uuid;
  std::map<std::string, Value> pagination;  // optional
  std::string product_order_uuid;
  std::string product_uuid;
  std::string reason_decline;
  std::map<std::string, Value> sorting;  // optional
};

struct MerchantPortalPamProductControllerCreateData {
  std::string consumer_uuid;  // optional
  std::map<std::string, Value> filter;  // optional
  std::string language;  // optional
  std::string merchant_id;  // optional
  std::string package_order_uuid;
  std::map<std::string, Value> pagination;  // optional
  std::string product_order_uuid;
  std::string product_uuid;
  std::string reason_decline;
  std::map<std::string, Value> sorting;  // optional
};

struct OutputAddProduct {
  std::string package_uuid;
  std::vector<Value> product_uui_d;
  int64_t response_code;
  std::string response_message;
};

struct OutputAddProductCreateData {
  std::string package_uuid;
  std::vector<Value> product_uui_d;
  int64_t response_code;
  std::string response_message;
};

struct OutputCreateProduct {
  std::string acquirer_id;  // optional
  bool allow_multiple_order;
  std::string app_form_template_name;
  bool contract_needed;
  bool credentials_needed;  // optional
  std::string description_key;
  std::string name_key;
  bool prescreening_allowed;
  std::string product_name;
  int64_t response_code;
  std::string response_message;
  std::string terminal_template_name;
  std::string vendor_name;
  std::string xml_template_file;
};

struct OutputCreateProductCreateData {
  std::string acquirer_id;  // optional
  bool allow_multiple_order;
  std::string app_form_template_name;
  bool contract_needed;
  bool credentials_needed;  // optional
  std::string description_key;
  std::string name_key;
  bool prescreening_allowed;
  std::string product_name;
  int64_t response_code;
  std::string response_message;
  std::string terminal_template_name;
  std::string vendor_name;
  std::string xml_template_file;
};

struct OutputDetail {
  std::map<std::string, Value> detail;  // optional
  int64_t response_code;
  std::string response_message;
};

struct OutputDetailLoadMatch {
  std::string id;
};

struct OutputList {
  std::vector<Value> item;  // optional
  std::map<std::string, Value> pagination;
  int64_t response_code;
  std::string response_message;
  std::map<std::string, Value> sorting;  // optional
};

struct OutputListCreateData {
  std::vector<Value> item;  // optional
  std::map<std::string, Value> pagination;
  int64_t response_code;
  std::string response_message;
  std::map<std::string, Value> sorting;  // optional
};

struct OutputMessage {
  int64_t response_code;
  std::string response_message;
};

struct OutputMessageLoadMatch {
  std::string id;
};

struct OutputMoveTid {
  std::vector<Value> product_order_uui_d;
  int64_t response_code;
  std::string response_message;
  std::string target_package_order_uuid;
  std::string target_product_order_uuid;
};

struct OutputMoveTidCreateData {
  std::vector<Value> product_order_uui_d;
  int64_t response_code;
  std::string response_message;
  std::string target_package_order_uuid;
  std::string target_product_order_uuid;
};

struct OutputRemoveProduct {
  std::string package_uuid;
  std::vector<Value> product_uui_d;
  int64_t response_code;
  std::string response_message;
};

struct OutputRemoveProductCreateData {
  std::string package_uuid;
  std::vector<Value> product_uui_d;
  int64_t response_code;
  std::string response_message;
};

struct OutputStart {
  std::string id;  // optional
  int64_t response_code;
  std::string response_message;
};

struct OutputStartCreateData {
  std::string id;  // optional
  int64_t response_code;
  std::string response_message;
};

struct OutputStatus {
  int64_t percentage;  // optional
  int64_t response_code;
  std::string response_message;
  std::string status;  // optional
};

struct OutputStatusLoadMatch {
  std::string id;
};

struct OutputUpdateProduct {
  bool allow_multiple_order;  // optional
  std::string app_form_name;  // optional
  bool contract_needed;  // optional
  bool credentials_needed;  // optional
  std::string description_key;  // optional
  std::string name_key;  // optional
  bool prescreening_allowed;  // optional
  std::string product_name;  // optional
  std::string product_status;  // optional
  std::string product_uuid;
  int64_t response_code;
  std::string response_message;
  std::string vendor_name;  // optional
};

struct OutputUpdateProductCreateData {
  bool allow_multiple_order;  // optional
  std::string app_form_name;  // optional
  bool contract_needed;  // optional
  bool credentials_needed;  // optional
  std::string description_key;  // optional
  std::string name_key;  // optional
  bool prescreening_allowed;  // optional
  std::string product_name;  // optional
  std::string product_status;  // optional
  std::string product_uuid;
  int64_t response_code;
  std::string response_message;
  std::string vendor_name;  // optional
};

} // namespace types
} // namespace sdk

#endif // SDK_BLUEFINTECSMERCHANTPORTAL_TYPES_HPP
