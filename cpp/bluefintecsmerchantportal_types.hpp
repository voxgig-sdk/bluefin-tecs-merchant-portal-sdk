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
  std::string productOrderUUID;
};

struct MerchantPortalPamContractControllerCreateData {
  std::string language;
  std::string productOrderUUID;
};

struct MerchantPortalPamDocumentController {
  std::string appFormFieldDescUUID;
  std::string packageOrderUUID;  // optional
  std::string productOrderUUID;  // optional
};

struct MerchantPortalPamDocumentControllerCreateData {
  std::string appFormFieldDescUUID;
  std::string packageOrderUUID;  // optional
  std::string productOrderUUID;  // optional
};

struct MerchantPortalPamFormController {
  std::string appFormFieldsDescUUID;
  std::map<std::string, Value> filter;  // optional
  std::string language;
  std::map<std::string, Value> packageOrder;  // optional
  std::string packageOrderUUID;
  std::string packageUUID;  // optional
  std::string productOrderUUID;  // optional
  std::vector<Value> productOrders;  // optional
  std::string reasonOfReopening;
};

struct MerchantPortalPamFormControllerCreateData {
  std::string appFormFieldsDescUUID;
  std::map<std::string, Value> filter;  // optional
  std::string language;
  std::map<std::string, Value> packageOrder;  // optional
  std::string packageOrderUUID;
  std::string packageUUID;  // optional
  std::string productOrderUUID;  // optional
  std::vector<Value> productOrders;  // optional
  std::string reasonOfReopening;
};

struct MerchantPortalPamMandatorController {
  std::string clientSecret;  // optional
  std::string mandatorName;
  std::string notificationEmail;  // optional
  std::string packageUUID;
};

struct MerchantPortalPamMandatorControllerCreateData {
  std::string clientSecret;  // optional
  std::string mandatorName;
  std::string notificationEmail;  // optional
  std::string packageUUID;
};

struct MerchantPortalPamMerchantController {
  std::map<std::string, Value> additional_data;  // optional
  std::string businessRegistrationNumber;
  std::string city;  // optional
  std::string companyName;
  std::string corporateUUID;
  std::string country;  // optional
  std::string currency;
  std::string email;
  std::string language;
  std::string login;
  std::string mandator;
  std::string merchantContractNumber;
  std::string merchantName;  // optional
  std::string merchant_category_code;  // optional
  std::string packageUUID;  // optional
  std::string packageorderuuid;
  std::string phoneNumber;
  std::string postalCode;  // optional
  std::string productid_acquirer;
  std::string region;  // optional
  std::string registrationNumber;  // optional
  std::string signature;  // optional
  std::string street;  // optional
  std::vector<Value> terminalIds;  // optional
  std::string terminalid_acquirer;  // optional
  std::string vu_nummer;
};

struct MerchantPortalPamMerchantControllerCreateData {
  std::map<std::string, Value> additional_data;  // optional
  std::string businessRegistrationNumber;
  std::string city;  // optional
  std::string companyName;
  std::string corporateUUID;
  std::string country;  // optional
  std::string currency;
  std::string email;
  std::string language;
  std::string login;
  std::string mandator;
  std::string merchantContractNumber;
  std::string merchantName;  // optional
  std::string merchant_category_code;  // optional
  std::string packageUUID;  // optional
  std::string packageorderuuid;
  std::string phoneNumber;
  std::string postalCode;  // optional
  std::string productid_acquirer;
  std::string region;  // optional
  std::string registrationNumber;  // optional
  std::string signature;  // optional
  std::string street;  // optional
  std::vector<Value> terminalIds;  // optional
  std::string terminalid_acquirer;  // optional
  std::string vu_nummer;
};

struct MerchantPortalPamPackageController {
  std::string consumerUUID;  // optional
  std::string corporateUUID;  // optional
  std::string country;  // optional
  std::string descriptionKey;  // optional
  std::map<std::string, Value> filter;  // optional
  std::string language;
  std::string nameKey;  // optional
  std::string packageStatus;  // optional
  std::string packageUUID;
  std::map<std::string, Value> pagination;  // optional
  std::map<std::string, Value> sorting;  // optional
};

struct MerchantPortalPamPackageControllerCreateData {
  std::string consumerUUID;  // optional
  std::string corporateUUID;  // optional
  std::string country;  // optional
  std::string descriptionKey;  // optional
  std::map<std::string, Value> filter;  // optional
  std::string language;
  std::string nameKey;  // optional
  std::string packageStatus;  // optional
  std::string packageUUID;
  std::map<std::string, Value> pagination;  // optional
  std::map<std::string, Value> sorting;  // optional
};

struct MerchantPortalPamProductController {
  std::string consumerUUID;  // optional
  std::map<std::string, Value> filter;  // optional
  std::string language;  // optional
  std::string merchantID;  // optional
  std::string packageOrderUUID;
  std::map<std::string, Value> pagination;  // optional
  std::string productOrderUUID;
  std::string productUUID;
  std::string reason_decline;
  std::map<std::string, Value> sorting;  // optional
};

struct MerchantPortalPamProductControllerCreateData {
  std::string consumerUUID;  // optional
  std::map<std::string, Value> filter;  // optional
  std::string language;  // optional
  std::string merchantID;  // optional
  std::string packageOrderUUID;
  std::map<std::string, Value> pagination;  // optional
  std::string productOrderUUID;
  std::string productUUID;
  std::string reason_decline;
  std::map<std::string, Value> sorting;  // optional
};

struct OutputAddProduct {
  std::string packageUUID;
  std::vector<Value> productUUIDs;
  int64_t responseCode;
  std::string responseMessage;
};

struct OutputAddProductCreateData {
  std::string packageUUID;
  std::vector<Value> productUUIDs;
  int64_t responseCode;
  std::string responseMessage;
};

struct OutputCreateProduct {
  std::string acquirerId;  // optional
  bool allowMultipleOrders;
  std::string appFormTemplateName;
  bool contractNeeded;
  bool credentialsNeeded;  // optional
  std::string descriptionKey;
  std::string nameKey;
  bool prescreeningAllowed;
  std::string productName;
  int64_t responseCode;
  std::string responseMessage;
  std::string terminalTemplateName;
  std::string vendorName;
  std::string xmlTemplateFile;
};

struct OutputCreateProductCreateData {
  std::string acquirerId;  // optional
  bool allowMultipleOrders;
  std::string appFormTemplateName;
  bool contractNeeded;
  bool credentialsNeeded;  // optional
  std::string descriptionKey;
  std::string nameKey;
  bool prescreeningAllowed;
  std::string productName;
  int64_t responseCode;
  std::string responseMessage;
  std::string terminalTemplateName;
  std::string vendorName;
  std::string xmlTemplateFile;
};

struct OutputDetail {
  std::map<std::string, Value> batch;  // optional
  std::map<std::string, Value> lines;  // optional
  std::map<std::string, Value> progress;  // optional
};

struct OutputDetailLoadMatch {
  std::string id;
};

struct OutputList {
  std::vector<Value> items;  // optional
  std::map<std::string, Value> pagination;
  int64_t responseCode;
  std::string responseMessage;
  std::map<std::string, Value> sorting;  // optional
};

struct OutputListCreateData {
  std::vector<Value> items;  // optional
  std::map<std::string, Value> pagination;
  int64_t responseCode;
  std::string responseMessage;
  std::map<std::string, Value> sorting;  // optional
};

struct OutputMessage {
  int64_t responseCode;
  std::string responseMessage;
};

struct OutputMessageLoadMatch {
  std::string id;
};

struct OutputMoveTid {
  std::vector<Value> productOrderUUIDs;
  int64_t responseCode;
  std::string responseMessage;
  std::string targetPackageOrderUUID;
  std::string targetProductOrderUUID;
};

struct OutputMoveTidCreateData {
  std::vector<Value> productOrderUUIDs;
  int64_t responseCode;
  std::string responseMessage;
  std::string targetPackageOrderUUID;
  std::string targetProductOrderUUID;
};

struct OutputRemoveProduct {
  std::string packageUUID;
  std::vector<Value> productUUIDs;
  int64_t responseCode;
  std::string responseMessage;
};

struct OutputRemoveProductCreateData {
  std::string packageUUID;
  std::vector<Value> productUUIDs;
  int64_t responseCode;
  std::string responseMessage;
};

struct OutputStart {
  std::string id;  // optional
  int64_t responseCode;
  std::string responseMessage;
};

struct OutputStartCreateData {
  std::string id;  // optional
  int64_t responseCode;
  std::string responseMessage;
};

struct OutputStatus {
  int64_t percentage;  // optional
  int64_t responseCode;
  std::string responseMessage;
  std::string status;  // optional
};

struct OutputStatusLoadMatch {
  std::string id;
};

struct OutputUpdateProduct {
  bool allowMultipleOrders;  // optional
  std::string appFormName;  // optional
  bool contractNeeded;  // optional
  bool credentialsNeeded;  // optional
  std::string descriptionKey;  // optional
  std::string nameKey;  // optional
  bool prescreeningAllowed;  // optional
  std::string productName;  // optional
  std::string productStatus;  // optional
  std::string productUUID;
  int64_t responseCode;
  std::string responseMessage;
  std::string vendorName;  // optional
};

struct OutputUpdateProductCreateData {
  bool allowMultipleOrders;  // optional
  std::string appFormName;  // optional
  bool contractNeeded;  // optional
  bool credentialsNeeded;  // optional
  std::string descriptionKey;  // optional
  std::string nameKey;  // optional
  bool prescreeningAllowed;  // optional
  std::string productName;  // optional
  std::string productStatus;  // optional
  std::string productUUID;
  int64_t responseCode;
  std::string responseMessage;
  std::string vendorName;  // optional
};

} // namespace types
} // namespace sdk

#endif // SDK_BLUEFINTECSMERCHANTPORTAL_TYPES_HPP
