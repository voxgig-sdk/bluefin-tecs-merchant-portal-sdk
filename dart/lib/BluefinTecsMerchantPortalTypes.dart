// Typed models for the BluefinTecsMerchantPortal SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON).
// Do not edit by hand.
//
// The operation pipeline passes plain maps; these classes are the typed,
// convertible view: `BluefinTecsMerchantPortal.fromMap(ent.data())` / `model.toMap()`.

class MerchantPortalApiController {
  /// INTEGER
  int? account_number;
  /// OBJECT
  Map<String, dynamic>? additional_data;
  /// STRING (required at the API)
  String? business_reg_number;
  /// STRING (required at the API)
  String? city;
  /// STRING
  String? corporateuuid;
  /// STRING (required at the API)
  String? country;
  /// STRING (required at the API)
  String? currency;
  /// INTEGER (required at the API)
  int? merchant_category_code;
  /// STRING
  String? merchant_email;
  /// STRING (required at the API)
  String? merchant_name;
  /// STRING
  String? merchant_phone_number;
  /// STRING (required at the API)
  String? packageid;
  /// STRING (required at the API)
  String? packageorderuuid;
  /// STRING
  String? password;
  /// STRING
  String? productid;
  /// STRING
  String? productid_acquirer;
  /// STRING (required at the API)
  String? reason_deactivation;
  /// STRING (required at the API)
  String? reason_reactivation;
  /// INTEGER
  int? sorting_code;
  /// STRING
  String? state;
  /// STRING (required at the API)
  String? street;
  /// STRING (required at the API)
  String? terminal_country_code;
  /// STRING (required at the API)
  String? terminal_language_code;
  /// STRING (required at the API)
  String? terminal_location;
  /// STRING (required at the API)
  String? terminal_serial_number;
  /// INTEGER (required at the API)
  int? terminalid;
  /// STRING
  String? terminalid_acquirer;
  /// STRING
  String? user_email;
  /// STRING
  String? user_phone_number;
  /// STRING
  String? username;
  /// STRING (required at the API)
  String? vu_nummer;
  /// STRING
  String? web_shop_url;
  /// STRING (required at the API)
  String? zipcode;

  MerchantPortalApiController({
    this.account_number,
    this.additional_data,
    this.business_reg_number,
    this.city,
    this.corporateuuid,
    this.country,
    this.currency,
    this.merchant_category_code,
    this.merchant_email,
    this.merchant_name,
    this.merchant_phone_number,
    this.packageid,
    this.packageorderuuid,
    this.password,
    this.productid,
    this.productid_acquirer,
    this.reason_deactivation,
    this.reason_reactivation,
    this.sorting_code,
    this.state,
    this.street,
    this.terminal_country_code,
    this.terminal_language_code,
    this.terminal_location,
    this.terminal_serial_number,
    this.terminalid,
    this.terminalid_acquirer,
    this.user_email,
    this.user_phone_number,
    this.username,
    this.vu_nummer,
    this.web_shop_url,
    this.zipcode,
  });

  factory MerchantPortalApiController.fromMap(Map<String, dynamic> m) => MerchantPortalApiController(
        account_number: m['account_number'] is int ? m['account_number'] : null,
        additional_data: m['additional_data'] is Map<String, dynamic> ? m['additional_data'] : null,
        business_reg_number: m['business_reg_number'] is String ? m['business_reg_number'] : null,
        city: m['city'] is String ? m['city'] : null,
        corporateuuid: m['corporateuuid'] is String ? m['corporateuuid'] : null,
        country: m['country'] is String ? m['country'] : null,
        currency: m['currency'] is String ? m['currency'] : null,
        merchant_category_code: m['merchant_category_code'] is int ? m['merchant_category_code'] : null,
        merchant_email: m['merchant_email'] is String ? m['merchant_email'] : null,
        merchant_name: m['merchant_name'] is String ? m['merchant_name'] : null,
        merchant_phone_number: m['merchant_phone_number'] is String ? m['merchant_phone_number'] : null,
        packageid: m['packageid'] is String ? m['packageid'] : null,
        packageorderuuid: m['packageorderuuid'] is String ? m['packageorderuuid'] : null,
        password: m['password'] is String ? m['password'] : null,
        productid: m['productid'] is String ? m['productid'] : null,
        productid_acquirer: m['productid_acquirer'] is String ? m['productid_acquirer'] : null,
        reason_deactivation: m['reason_deactivation'] is String ? m['reason_deactivation'] : null,
        reason_reactivation: m['reason_reactivation'] is String ? m['reason_reactivation'] : null,
        sorting_code: m['sorting_code'] is int ? m['sorting_code'] : null,
        state: m['state'] is String ? m['state'] : null,
        street: m['street'] is String ? m['street'] : null,
        terminal_country_code: m['terminal_country_code'] is String ? m['terminal_country_code'] : null,
        terminal_language_code: m['terminal_language_code'] is String ? m['terminal_language_code'] : null,
        terminal_location: m['terminal_location'] is String ? m['terminal_location'] : null,
        terminal_serial_number: m['terminal_serial_number'] is String ? m['terminal_serial_number'] : null,
        terminalid: m['terminalid'] is int ? m['terminalid'] : null,
        terminalid_acquirer: m['terminalid_acquirer'] is String ? m['terminalid_acquirer'] : null,
        user_email: m['user_email'] is String ? m['user_email'] : null,
        user_phone_number: m['user_phone_number'] is String ? m['user_phone_number'] : null,
        username: m['username'] is String ? m['username'] : null,
        vu_nummer: m['vu_nummer'] is String ? m['vu_nummer'] : null,
        web_shop_url: m['web_shop_url'] is String ? m['web_shop_url'] : null,
        zipcode: m['zipcode'] is String ? m['zipcode'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_number) {
      m['account_number'] = account_number;
    }
    if (null != additional_data) {
      m['additional_data'] = additional_data;
    }
    if (null != business_reg_number) {
      m['business_reg_number'] = business_reg_number;
    }
    if (null != city) {
      m['city'] = city;
    }
    if (null != corporateuuid) {
      m['corporateuuid'] = corporateuuid;
    }
    if (null != country) {
      m['country'] = country;
    }
    if (null != currency) {
      m['currency'] = currency;
    }
    if (null != merchant_category_code) {
      m['merchant_category_code'] = merchant_category_code;
    }
    if (null != merchant_email) {
      m['merchant_email'] = merchant_email;
    }
    if (null != merchant_name) {
      m['merchant_name'] = merchant_name;
    }
    if (null != merchant_phone_number) {
      m['merchant_phone_number'] = merchant_phone_number;
    }
    if (null != packageid) {
      m['packageid'] = packageid;
    }
    if (null != packageorderuuid) {
      m['packageorderuuid'] = packageorderuuid;
    }
    if (null != password) {
      m['password'] = password;
    }
    if (null != productid) {
      m['productid'] = productid;
    }
    if (null != productid_acquirer) {
      m['productid_acquirer'] = productid_acquirer;
    }
    if (null != reason_deactivation) {
      m['reason_deactivation'] = reason_deactivation;
    }
    if (null != reason_reactivation) {
      m['reason_reactivation'] = reason_reactivation;
    }
    if (null != sorting_code) {
      m['sorting_code'] = sorting_code;
    }
    if (null != state) {
      m['state'] = state;
    }
    if (null != street) {
      m['street'] = street;
    }
    if (null != terminal_country_code) {
      m['terminal_country_code'] = terminal_country_code;
    }
    if (null != terminal_language_code) {
      m['terminal_language_code'] = terminal_language_code;
    }
    if (null != terminal_location) {
      m['terminal_location'] = terminal_location;
    }
    if (null != terminal_serial_number) {
      m['terminal_serial_number'] = terminal_serial_number;
    }
    if (null != terminalid) {
      m['terminalid'] = terminalid;
    }
    if (null != terminalid_acquirer) {
      m['terminalid_acquirer'] = terminalid_acquirer;
    }
    if (null != user_email) {
      m['user_email'] = user_email;
    }
    if (null != user_phone_number) {
      m['user_phone_number'] = user_phone_number;
    }
    if (null != username) {
      m['username'] = username;
    }
    if (null != vu_nummer) {
      m['vu_nummer'] = vu_nummer;
    }
    if (null != web_shop_url) {
      m['web_shop_url'] = web_shop_url;
    }
    if (null != zipcode) {
      m['zipcode'] = zipcode;
    }
    return m;
  }
}

class MerchantPortalApiControllerCreateData {
  /// INTEGER
  int? account_number;
  /// OBJECT
  Map<String, dynamic>? additional_data;
  /// STRING (required at the API)
  String? business_reg_number;
  /// STRING (required at the API)
  String? city;
  /// STRING
  String? corporateuuid;
  /// STRING (required at the API)
  String? country;
  /// STRING (required at the API)
  String? currency;
  /// INTEGER (required at the API)
  int? merchant_category_code;
  /// STRING
  String? merchant_email;
  /// STRING (required at the API)
  String? merchant_name;
  /// STRING
  String? merchant_phone_number;
  /// STRING (required at the API)
  String? packageid;
  /// STRING (required at the API)
  String? packageorderuuid;
  /// STRING
  String? password;
  /// STRING
  String? productid;
  /// STRING
  String? productid_acquirer;
  /// STRING (required at the API)
  String? reason_deactivation;
  /// STRING (required at the API)
  String? reason_reactivation;
  /// INTEGER
  int? sorting_code;
  /// STRING
  String? state;
  /// STRING (required at the API)
  String? street;
  /// STRING (required at the API)
  String? terminal_country_code;
  /// STRING (required at the API)
  String? terminal_language_code;
  /// STRING (required at the API)
  String? terminal_location;
  /// STRING (required at the API)
  String? terminal_serial_number;
  /// INTEGER (required at the API)
  int? terminalid;
  /// STRING
  String? terminalid_acquirer;
  /// STRING
  String? user_email;
  /// STRING
  String? user_phone_number;
  /// STRING
  String? username;
  /// STRING (required at the API)
  String? vu_nummer;
  /// STRING
  String? web_shop_url;
  /// STRING (required at the API)
  String? zipcode;

  MerchantPortalApiControllerCreateData({
    this.account_number,
    this.additional_data,
    this.business_reg_number,
    this.city,
    this.corporateuuid,
    this.country,
    this.currency,
    this.merchant_category_code,
    this.merchant_email,
    this.merchant_name,
    this.merchant_phone_number,
    this.packageid,
    this.packageorderuuid,
    this.password,
    this.productid,
    this.productid_acquirer,
    this.reason_deactivation,
    this.reason_reactivation,
    this.sorting_code,
    this.state,
    this.street,
    this.terminal_country_code,
    this.terminal_language_code,
    this.terminal_location,
    this.terminal_serial_number,
    this.terminalid,
    this.terminalid_acquirer,
    this.user_email,
    this.user_phone_number,
    this.username,
    this.vu_nummer,
    this.web_shop_url,
    this.zipcode,
  });

  factory MerchantPortalApiControllerCreateData.fromMap(Map<String, dynamic> m) => MerchantPortalApiControllerCreateData(
        account_number: m['account_number'] is int ? m['account_number'] : null,
        additional_data: m['additional_data'] is Map<String, dynamic> ? m['additional_data'] : null,
        business_reg_number: m['business_reg_number'] is String ? m['business_reg_number'] : null,
        city: m['city'] is String ? m['city'] : null,
        corporateuuid: m['corporateuuid'] is String ? m['corporateuuid'] : null,
        country: m['country'] is String ? m['country'] : null,
        currency: m['currency'] is String ? m['currency'] : null,
        merchant_category_code: m['merchant_category_code'] is int ? m['merchant_category_code'] : null,
        merchant_email: m['merchant_email'] is String ? m['merchant_email'] : null,
        merchant_name: m['merchant_name'] is String ? m['merchant_name'] : null,
        merchant_phone_number: m['merchant_phone_number'] is String ? m['merchant_phone_number'] : null,
        packageid: m['packageid'] is String ? m['packageid'] : null,
        packageorderuuid: m['packageorderuuid'] is String ? m['packageorderuuid'] : null,
        password: m['password'] is String ? m['password'] : null,
        productid: m['productid'] is String ? m['productid'] : null,
        productid_acquirer: m['productid_acquirer'] is String ? m['productid_acquirer'] : null,
        reason_deactivation: m['reason_deactivation'] is String ? m['reason_deactivation'] : null,
        reason_reactivation: m['reason_reactivation'] is String ? m['reason_reactivation'] : null,
        sorting_code: m['sorting_code'] is int ? m['sorting_code'] : null,
        state: m['state'] is String ? m['state'] : null,
        street: m['street'] is String ? m['street'] : null,
        terminal_country_code: m['terminal_country_code'] is String ? m['terminal_country_code'] : null,
        terminal_language_code: m['terminal_language_code'] is String ? m['terminal_language_code'] : null,
        terminal_location: m['terminal_location'] is String ? m['terminal_location'] : null,
        terminal_serial_number: m['terminal_serial_number'] is String ? m['terminal_serial_number'] : null,
        terminalid: m['terminalid'] is int ? m['terminalid'] : null,
        terminalid_acquirer: m['terminalid_acquirer'] is String ? m['terminalid_acquirer'] : null,
        user_email: m['user_email'] is String ? m['user_email'] : null,
        user_phone_number: m['user_phone_number'] is String ? m['user_phone_number'] : null,
        username: m['username'] is String ? m['username'] : null,
        vu_nummer: m['vu_nummer'] is String ? m['vu_nummer'] : null,
        web_shop_url: m['web_shop_url'] is String ? m['web_shop_url'] : null,
        zipcode: m['zipcode'] is String ? m['zipcode'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != account_number) {
      m['account_number'] = account_number;
    }
    if (null != additional_data) {
      m['additional_data'] = additional_data;
    }
    if (null != business_reg_number) {
      m['business_reg_number'] = business_reg_number;
    }
    if (null != city) {
      m['city'] = city;
    }
    if (null != corporateuuid) {
      m['corporateuuid'] = corporateuuid;
    }
    if (null != country) {
      m['country'] = country;
    }
    if (null != currency) {
      m['currency'] = currency;
    }
    if (null != merchant_category_code) {
      m['merchant_category_code'] = merchant_category_code;
    }
    if (null != merchant_email) {
      m['merchant_email'] = merchant_email;
    }
    if (null != merchant_name) {
      m['merchant_name'] = merchant_name;
    }
    if (null != merchant_phone_number) {
      m['merchant_phone_number'] = merchant_phone_number;
    }
    if (null != packageid) {
      m['packageid'] = packageid;
    }
    if (null != packageorderuuid) {
      m['packageorderuuid'] = packageorderuuid;
    }
    if (null != password) {
      m['password'] = password;
    }
    if (null != productid) {
      m['productid'] = productid;
    }
    if (null != productid_acquirer) {
      m['productid_acquirer'] = productid_acquirer;
    }
    if (null != reason_deactivation) {
      m['reason_deactivation'] = reason_deactivation;
    }
    if (null != reason_reactivation) {
      m['reason_reactivation'] = reason_reactivation;
    }
    if (null != sorting_code) {
      m['sorting_code'] = sorting_code;
    }
    if (null != state) {
      m['state'] = state;
    }
    if (null != street) {
      m['street'] = street;
    }
    if (null != terminal_country_code) {
      m['terminal_country_code'] = terminal_country_code;
    }
    if (null != terminal_language_code) {
      m['terminal_language_code'] = terminal_language_code;
    }
    if (null != terminal_location) {
      m['terminal_location'] = terminal_location;
    }
    if (null != terminal_serial_number) {
      m['terminal_serial_number'] = terminal_serial_number;
    }
    if (null != terminalid) {
      m['terminalid'] = terminalid;
    }
    if (null != terminalid_acquirer) {
      m['terminalid_acquirer'] = terminalid_acquirer;
    }
    if (null != user_email) {
      m['user_email'] = user_email;
    }
    if (null != user_phone_number) {
      m['user_phone_number'] = user_phone_number;
    }
    if (null != username) {
      m['username'] = username;
    }
    if (null != vu_nummer) {
      m['vu_nummer'] = vu_nummer;
    }
    if (null != web_shop_url) {
      m['web_shop_url'] = web_shop_url;
    }
    if (null != zipcode) {
      m['zipcode'] = zipcode;
    }
    return m;
  }
}

class MerchantPortalCommonController {
  MerchantPortalCommonController();

  factory MerchantPortalCommonController.fromMap(Map<String, dynamic> m) => MerchantPortalCommonController();

  Map<String, dynamic> toMap() => <String, dynamic>{};
}

class MerchantPortalCommonControllerLoadMatch {
  MerchantPortalCommonControllerLoadMatch();

  factory MerchantPortalCommonControllerLoadMatch.fromMap(Map<String, dynamic> m) => MerchantPortalCommonControllerLoadMatch();

  Map<String, dynamic> toMap() => <String, dynamic>{};
}

class MerchantPortalPamContractController {
  /// STRING (required at the API)
  String? language;
  /// STRING (required at the API)
  String? product_order_uuid;

  MerchantPortalPamContractController({
    this.language,
    this.product_order_uuid,
  });

  factory MerchantPortalPamContractController.fromMap(Map<String, dynamic> m) => MerchantPortalPamContractController(
        language: m['language'] is String ? m['language'] : null,
        product_order_uuid: m['product_order_uuid'] is String ? m['product_order_uuid'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != language) {
      m['language'] = language;
    }
    if (null != product_order_uuid) {
      m['product_order_uuid'] = product_order_uuid;
    }
    return m;
  }
}

class MerchantPortalPamContractControllerCreateData {
  /// STRING (required at the API)
  String? language;
  /// STRING (required at the API)
  String? product_order_uuid;

  MerchantPortalPamContractControllerCreateData({
    this.language,
    this.product_order_uuid,
  });

  factory MerchantPortalPamContractControllerCreateData.fromMap(Map<String, dynamic> m) => MerchantPortalPamContractControllerCreateData(
        language: m['language'] is String ? m['language'] : null,
        product_order_uuid: m['product_order_uuid'] is String ? m['product_order_uuid'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != language) {
      m['language'] = language;
    }
    if (null != product_order_uuid) {
      m['product_order_uuid'] = product_order_uuid;
    }
    return m;
  }
}

class MerchantPortalPamDocumentController {
  /// STRING (required at the API)
  String? app_form_field_desc_uuid;
  /// STRING
  String? package_order_uuid;
  /// STRING
  String? product_order_uuid;

  MerchantPortalPamDocumentController({
    this.app_form_field_desc_uuid,
    this.package_order_uuid,
    this.product_order_uuid,
  });

  factory MerchantPortalPamDocumentController.fromMap(Map<String, dynamic> m) => MerchantPortalPamDocumentController(
        app_form_field_desc_uuid: m['app_form_field_desc_uuid'] is String ? m['app_form_field_desc_uuid'] : null,
        package_order_uuid: m['package_order_uuid'] is String ? m['package_order_uuid'] : null,
        product_order_uuid: m['product_order_uuid'] is String ? m['product_order_uuid'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != app_form_field_desc_uuid) {
      m['app_form_field_desc_uuid'] = app_form_field_desc_uuid;
    }
    if (null != package_order_uuid) {
      m['package_order_uuid'] = package_order_uuid;
    }
    if (null != product_order_uuid) {
      m['product_order_uuid'] = product_order_uuid;
    }
    return m;
  }
}

class MerchantPortalPamDocumentControllerCreateData {
  /// STRING (required at the API)
  String? app_form_field_desc_uuid;
  /// STRING
  String? package_order_uuid;
  /// STRING
  String? product_order_uuid;

  MerchantPortalPamDocumentControllerCreateData({
    this.app_form_field_desc_uuid,
    this.package_order_uuid,
    this.product_order_uuid,
  });

  factory MerchantPortalPamDocumentControllerCreateData.fromMap(Map<String, dynamic> m) => MerchantPortalPamDocumentControllerCreateData(
        app_form_field_desc_uuid: m['app_form_field_desc_uuid'] is String ? m['app_form_field_desc_uuid'] : null,
        package_order_uuid: m['package_order_uuid'] is String ? m['package_order_uuid'] : null,
        product_order_uuid: m['product_order_uuid'] is String ? m['product_order_uuid'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != app_form_field_desc_uuid) {
      m['app_form_field_desc_uuid'] = app_form_field_desc_uuid;
    }
    if (null != package_order_uuid) {
      m['package_order_uuid'] = package_order_uuid;
    }
    if (null != product_order_uuid) {
      m['product_order_uuid'] = product_order_uuid;
    }
    return m;
  }
}

class MerchantPortalPamFormController {
  /// STRING (required at the API)
  String? app_form_fields_desc_uuid;
  /// OBJECT
  Map<String, dynamic>? filter;
  /// STRING (required at the API)
  String? language;
  /// OBJECT
  Map<String, dynamic>? package_order;
  /// STRING (required at the API)
  String? package_order_uuid;
  /// STRING
  String? package_uuid;
  /// ARRAY
  List<dynamic>? product_order;
  /// STRING
  String? product_order_uuid;
  /// STRING (required at the API)
  String? reason_of_reopening;

  MerchantPortalPamFormController({
    this.app_form_fields_desc_uuid,
    this.filter,
    this.language,
    this.package_order,
    this.package_order_uuid,
    this.package_uuid,
    this.product_order,
    this.product_order_uuid,
    this.reason_of_reopening,
  });

  factory MerchantPortalPamFormController.fromMap(Map<String, dynamic> m) => MerchantPortalPamFormController(
        app_form_fields_desc_uuid: m['app_form_fields_desc_uuid'] is String ? m['app_form_fields_desc_uuid'] : null,
        filter: m['filter'] is Map<String, dynamic> ? m['filter'] : null,
        language: m['language'] is String ? m['language'] : null,
        package_order: m['package_order'] is Map<String, dynamic> ? m['package_order'] : null,
        package_order_uuid: m['package_order_uuid'] is String ? m['package_order_uuid'] : null,
        package_uuid: m['package_uuid'] is String ? m['package_uuid'] : null,
        product_order: m['product_order'] is List<dynamic> ? m['product_order'] : null,
        product_order_uuid: m['product_order_uuid'] is String ? m['product_order_uuid'] : null,
        reason_of_reopening: m['reason_of_reopening'] is String ? m['reason_of_reopening'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != app_form_fields_desc_uuid) {
      m['app_form_fields_desc_uuid'] = app_form_fields_desc_uuid;
    }
    if (null != filter) {
      m['filter'] = filter;
    }
    if (null != language) {
      m['language'] = language;
    }
    if (null != package_order) {
      m['package_order'] = package_order;
    }
    if (null != package_order_uuid) {
      m['package_order_uuid'] = package_order_uuid;
    }
    if (null != package_uuid) {
      m['package_uuid'] = package_uuid;
    }
    if (null != product_order) {
      m['product_order'] = product_order;
    }
    if (null != product_order_uuid) {
      m['product_order_uuid'] = product_order_uuid;
    }
    if (null != reason_of_reopening) {
      m['reason_of_reopening'] = reason_of_reopening;
    }
    return m;
  }
}

class MerchantPortalPamFormControllerCreateData {
  /// STRING (required at the API)
  String? app_form_fields_desc_uuid;
  /// OBJECT
  Map<String, dynamic>? filter;
  /// STRING (required at the API)
  String? language;
  /// OBJECT
  Map<String, dynamic>? package_order;
  /// STRING (required at the API)
  String? package_order_uuid;
  /// STRING
  String? package_uuid;
  /// ARRAY
  List<dynamic>? product_order;
  /// STRING
  String? product_order_uuid;
  /// STRING (required at the API)
  String? reason_of_reopening;

  MerchantPortalPamFormControllerCreateData({
    this.app_form_fields_desc_uuid,
    this.filter,
    this.language,
    this.package_order,
    this.package_order_uuid,
    this.package_uuid,
    this.product_order,
    this.product_order_uuid,
    this.reason_of_reopening,
  });

  factory MerchantPortalPamFormControllerCreateData.fromMap(Map<String, dynamic> m) => MerchantPortalPamFormControllerCreateData(
        app_form_fields_desc_uuid: m['app_form_fields_desc_uuid'] is String ? m['app_form_fields_desc_uuid'] : null,
        filter: m['filter'] is Map<String, dynamic> ? m['filter'] : null,
        language: m['language'] is String ? m['language'] : null,
        package_order: m['package_order'] is Map<String, dynamic> ? m['package_order'] : null,
        package_order_uuid: m['package_order_uuid'] is String ? m['package_order_uuid'] : null,
        package_uuid: m['package_uuid'] is String ? m['package_uuid'] : null,
        product_order: m['product_order'] is List<dynamic> ? m['product_order'] : null,
        product_order_uuid: m['product_order_uuid'] is String ? m['product_order_uuid'] : null,
        reason_of_reopening: m['reason_of_reopening'] is String ? m['reason_of_reopening'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != app_form_fields_desc_uuid) {
      m['app_form_fields_desc_uuid'] = app_form_fields_desc_uuid;
    }
    if (null != filter) {
      m['filter'] = filter;
    }
    if (null != language) {
      m['language'] = language;
    }
    if (null != package_order) {
      m['package_order'] = package_order;
    }
    if (null != package_order_uuid) {
      m['package_order_uuid'] = package_order_uuid;
    }
    if (null != package_uuid) {
      m['package_uuid'] = package_uuid;
    }
    if (null != product_order) {
      m['product_order'] = product_order;
    }
    if (null != product_order_uuid) {
      m['product_order_uuid'] = product_order_uuid;
    }
    if (null != reason_of_reopening) {
      m['reason_of_reopening'] = reason_of_reopening;
    }
    return m;
  }
}

class MerchantPortalPamMandatorController {
  /// STRING
  String? client_secret;
  /// STRING (required at the API)
  String? mandator_name;
  /// STRING
  String? notification_email;
  /// STRING (required at the API)
  String? package_uuid;

  MerchantPortalPamMandatorController({
    this.client_secret,
    this.mandator_name,
    this.notification_email,
    this.package_uuid,
  });

  factory MerchantPortalPamMandatorController.fromMap(Map<String, dynamic> m) => MerchantPortalPamMandatorController(
        client_secret: m['client_secret'] is String ? m['client_secret'] : null,
        mandator_name: m['mandator_name'] is String ? m['mandator_name'] : null,
        notification_email: m['notification_email'] is String ? m['notification_email'] : null,
        package_uuid: m['package_uuid'] is String ? m['package_uuid'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != client_secret) {
      m['client_secret'] = client_secret;
    }
    if (null != mandator_name) {
      m['mandator_name'] = mandator_name;
    }
    if (null != notification_email) {
      m['notification_email'] = notification_email;
    }
    if (null != package_uuid) {
      m['package_uuid'] = package_uuid;
    }
    return m;
  }
}

class MerchantPortalPamMandatorControllerCreateData {
  /// STRING
  String? client_secret;
  /// STRING (required at the API)
  String? mandator_name;
  /// STRING
  String? notification_email;
  /// STRING (required at the API)
  String? package_uuid;

  MerchantPortalPamMandatorControllerCreateData({
    this.client_secret,
    this.mandator_name,
    this.notification_email,
    this.package_uuid,
  });

  factory MerchantPortalPamMandatorControllerCreateData.fromMap(Map<String, dynamic> m) => MerchantPortalPamMandatorControllerCreateData(
        client_secret: m['client_secret'] is String ? m['client_secret'] : null,
        mandator_name: m['mandator_name'] is String ? m['mandator_name'] : null,
        notification_email: m['notification_email'] is String ? m['notification_email'] : null,
        package_uuid: m['package_uuid'] is String ? m['package_uuid'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != client_secret) {
      m['client_secret'] = client_secret;
    }
    if (null != mandator_name) {
      m['mandator_name'] = mandator_name;
    }
    if (null != notification_email) {
      m['notification_email'] = notification_email;
    }
    if (null != package_uuid) {
      m['package_uuid'] = package_uuid;
    }
    return m;
  }
}

class MerchantPortalPamMerchantController {
  /// OBJECT
  Map<String, dynamic>? additional_data;
  /// STRING (required at the API)
  String? business_registration_number;
  /// STRING
  String? city;
  /// STRING (required at the API)
  String? company_name;
  /// STRING (required at the API)
  String? corporate_uuid;
  /// STRING
  String? country;
  /// STRING (required at the API)
  String? currency;
  /// STRING (required at the API)
  String? email;
  /// STRING (required at the API)
  String? language;
  /// STRING (required at the API)
  String? login;
  /// STRING (required at the API)
  String? mandator;
  /// STRING
  String? merchant_category_code;
  /// STRING (required at the API)
  String? merchant_contract_number;
  /// STRING
  String? merchant_name;
  /// STRING
  String? package_uuid;
  /// STRING (required at the API)
  String? packageorderuuid;
  /// STRING (required at the API)
  String? phone_number;
  /// STRING
  String? postal_code;
  /// STRING (required at the API)
  String? productid_acquirer;
  /// STRING
  String? region;
  /// STRING
  String? registration_number;
  /// STRING
  String? signature;
  /// STRING
  String? street;
  /// ARRAY
  List<dynamic>? terminal_id;
  /// STRING
  String? terminalid_acquirer;
  /// STRING (required at the API)
  String? vu_nummer;

  MerchantPortalPamMerchantController({
    this.additional_data,
    this.business_registration_number,
    this.city,
    this.company_name,
    this.corporate_uuid,
    this.country,
    this.currency,
    this.email,
    this.language,
    this.login,
    this.mandator,
    this.merchant_category_code,
    this.merchant_contract_number,
    this.merchant_name,
    this.package_uuid,
    this.packageorderuuid,
    this.phone_number,
    this.postal_code,
    this.productid_acquirer,
    this.region,
    this.registration_number,
    this.signature,
    this.street,
    this.terminal_id,
    this.terminalid_acquirer,
    this.vu_nummer,
  });

  factory MerchantPortalPamMerchantController.fromMap(Map<String, dynamic> m) => MerchantPortalPamMerchantController(
        additional_data: m['additional_data'] is Map<String, dynamic> ? m['additional_data'] : null,
        business_registration_number: m['business_registration_number'] is String ? m['business_registration_number'] : null,
        city: m['city'] is String ? m['city'] : null,
        company_name: m['company_name'] is String ? m['company_name'] : null,
        corporate_uuid: m['corporate_uuid'] is String ? m['corporate_uuid'] : null,
        country: m['country'] is String ? m['country'] : null,
        currency: m['currency'] is String ? m['currency'] : null,
        email: m['email'] is String ? m['email'] : null,
        language: m['language'] is String ? m['language'] : null,
        login: m['login'] is String ? m['login'] : null,
        mandator: m['mandator'] is String ? m['mandator'] : null,
        merchant_category_code: m['merchant_category_code'] is String ? m['merchant_category_code'] : null,
        merchant_contract_number: m['merchant_contract_number'] is String ? m['merchant_contract_number'] : null,
        merchant_name: m['merchant_name'] is String ? m['merchant_name'] : null,
        package_uuid: m['package_uuid'] is String ? m['package_uuid'] : null,
        packageorderuuid: m['packageorderuuid'] is String ? m['packageorderuuid'] : null,
        phone_number: m['phone_number'] is String ? m['phone_number'] : null,
        postal_code: m['postal_code'] is String ? m['postal_code'] : null,
        productid_acquirer: m['productid_acquirer'] is String ? m['productid_acquirer'] : null,
        region: m['region'] is String ? m['region'] : null,
        registration_number: m['registration_number'] is String ? m['registration_number'] : null,
        signature: m['signature'] is String ? m['signature'] : null,
        street: m['street'] is String ? m['street'] : null,
        terminal_id: m['terminal_id'] is List<dynamic> ? m['terminal_id'] : null,
        terminalid_acquirer: m['terminalid_acquirer'] is String ? m['terminalid_acquirer'] : null,
        vu_nummer: m['vu_nummer'] is String ? m['vu_nummer'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != additional_data) {
      m['additional_data'] = additional_data;
    }
    if (null != business_registration_number) {
      m['business_registration_number'] = business_registration_number;
    }
    if (null != city) {
      m['city'] = city;
    }
    if (null != company_name) {
      m['company_name'] = company_name;
    }
    if (null != corporate_uuid) {
      m['corporate_uuid'] = corporate_uuid;
    }
    if (null != country) {
      m['country'] = country;
    }
    if (null != currency) {
      m['currency'] = currency;
    }
    if (null != email) {
      m['email'] = email;
    }
    if (null != language) {
      m['language'] = language;
    }
    if (null != login) {
      m['login'] = login;
    }
    if (null != mandator) {
      m['mandator'] = mandator;
    }
    if (null != merchant_category_code) {
      m['merchant_category_code'] = merchant_category_code;
    }
    if (null != merchant_contract_number) {
      m['merchant_contract_number'] = merchant_contract_number;
    }
    if (null != merchant_name) {
      m['merchant_name'] = merchant_name;
    }
    if (null != package_uuid) {
      m['package_uuid'] = package_uuid;
    }
    if (null != packageorderuuid) {
      m['packageorderuuid'] = packageorderuuid;
    }
    if (null != phone_number) {
      m['phone_number'] = phone_number;
    }
    if (null != postal_code) {
      m['postal_code'] = postal_code;
    }
    if (null != productid_acquirer) {
      m['productid_acquirer'] = productid_acquirer;
    }
    if (null != region) {
      m['region'] = region;
    }
    if (null != registration_number) {
      m['registration_number'] = registration_number;
    }
    if (null != signature) {
      m['signature'] = signature;
    }
    if (null != street) {
      m['street'] = street;
    }
    if (null != terminal_id) {
      m['terminal_id'] = terminal_id;
    }
    if (null != terminalid_acquirer) {
      m['terminalid_acquirer'] = terminalid_acquirer;
    }
    if (null != vu_nummer) {
      m['vu_nummer'] = vu_nummer;
    }
    return m;
  }
}

class MerchantPortalPamMerchantControllerCreateData {
  /// OBJECT
  Map<String, dynamic>? additional_data;
  /// STRING (required at the API)
  String? business_registration_number;
  /// STRING
  String? city;
  /// STRING (required at the API)
  String? company_name;
  /// STRING (required at the API)
  String? corporate_uuid;
  /// STRING
  String? country;
  /// STRING (required at the API)
  String? currency;
  /// STRING (required at the API)
  String? email;
  /// STRING (required at the API)
  String? language;
  /// STRING (required at the API)
  String? login;
  /// STRING (required at the API)
  String? mandator;
  /// STRING
  String? merchant_category_code;
  /// STRING (required at the API)
  String? merchant_contract_number;
  /// STRING
  String? merchant_name;
  /// STRING
  String? package_uuid;
  /// STRING (required at the API)
  String? packageorderuuid;
  /// STRING (required at the API)
  String? phone_number;
  /// STRING
  String? postal_code;
  /// STRING (required at the API)
  String? productid_acquirer;
  /// STRING
  String? region;
  /// STRING
  String? registration_number;
  /// STRING
  String? signature;
  /// STRING
  String? street;
  /// ARRAY
  List<dynamic>? terminal_id;
  /// STRING
  String? terminalid_acquirer;
  /// STRING (required at the API)
  String? vu_nummer;

  MerchantPortalPamMerchantControllerCreateData({
    this.additional_data,
    this.business_registration_number,
    this.city,
    this.company_name,
    this.corporate_uuid,
    this.country,
    this.currency,
    this.email,
    this.language,
    this.login,
    this.mandator,
    this.merchant_category_code,
    this.merchant_contract_number,
    this.merchant_name,
    this.package_uuid,
    this.packageorderuuid,
    this.phone_number,
    this.postal_code,
    this.productid_acquirer,
    this.region,
    this.registration_number,
    this.signature,
    this.street,
    this.terminal_id,
    this.terminalid_acquirer,
    this.vu_nummer,
  });

  factory MerchantPortalPamMerchantControllerCreateData.fromMap(Map<String, dynamic> m) => MerchantPortalPamMerchantControllerCreateData(
        additional_data: m['additional_data'] is Map<String, dynamic> ? m['additional_data'] : null,
        business_registration_number: m['business_registration_number'] is String ? m['business_registration_number'] : null,
        city: m['city'] is String ? m['city'] : null,
        company_name: m['company_name'] is String ? m['company_name'] : null,
        corporate_uuid: m['corporate_uuid'] is String ? m['corporate_uuid'] : null,
        country: m['country'] is String ? m['country'] : null,
        currency: m['currency'] is String ? m['currency'] : null,
        email: m['email'] is String ? m['email'] : null,
        language: m['language'] is String ? m['language'] : null,
        login: m['login'] is String ? m['login'] : null,
        mandator: m['mandator'] is String ? m['mandator'] : null,
        merchant_category_code: m['merchant_category_code'] is String ? m['merchant_category_code'] : null,
        merchant_contract_number: m['merchant_contract_number'] is String ? m['merchant_contract_number'] : null,
        merchant_name: m['merchant_name'] is String ? m['merchant_name'] : null,
        package_uuid: m['package_uuid'] is String ? m['package_uuid'] : null,
        packageorderuuid: m['packageorderuuid'] is String ? m['packageorderuuid'] : null,
        phone_number: m['phone_number'] is String ? m['phone_number'] : null,
        postal_code: m['postal_code'] is String ? m['postal_code'] : null,
        productid_acquirer: m['productid_acquirer'] is String ? m['productid_acquirer'] : null,
        region: m['region'] is String ? m['region'] : null,
        registration_number: m['registration_number'] is String ? m['registration_number'] : null,
        signature: m['signature'] is String ? m['signature'] : null,
        street: m['street'] is String ? m['street'] : null,
        terminal_id: m['terminal_id'] is List<dynamic> ? m['terminal_id'] : null,
        terminalid_acquirer: m['terminalid_acquirer'] is String ? m['terminalid_acquirer'] : null,
        vu_nummer: m['vu_nummer'] is String ? m['vu_nummer'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != additional_data) {
      m['additional_data'] = additional_data;
    }
    if (null != business_registration_number) {
      m['business_registration_number'] = business_registration_number;
    }
    if (null != city) {
      m['city'] = city;
    }
    if (null != company_name) {
      m['company_name'] = company_name;
    }
    if (null != corporate_uuid) {
      m['corporate_uuid'] = corporate_uuid;
    }
    if (null != country) {
      m['country'] = country;
    }
    if (null != currency) {
      m['currency'] = currency;
    }
    if (null != email) {
      m['email'] = email;
    }
    if (null != language) {
      m['language'] = language;
    }
    if (null != login) {
      m['login'] = login;
    }
    if (null != mandator) {
      m['mandator'] = mandator;
    }
    if (null != merchant_category_code) {
      m['merchant_category_code'] = merchant_category_code;
    }
    if (null != merchant_contract_number) {
      m['merchant_contract_number'] = merchant_contract_number;
    }
    if (null != merchant_name) {
      m['merchant_name'] = merchant_name;
    }
    if (null != package_uuid) {
      m['package_uuid'] = package_uuid;
    }
    if (null != packageorderuuid) {
      m['packageorderuuid'] = packageorderuuid;
    }
    if (null != phone_number) {
      m['phone_number'] = phone_number;
    }
    if (null != postal_code) {
      m['postal_code'] = postal_code;
    }
    if (null != productid_acquirer) {
      m['productid_acquirer'] = productid_acquirer;
    }
    if (null != region) {
      m['region'] = region;
    }
    if (null != registration_number) {
      m['registration_number'] = registration_number;
    }
    if (null != signature) {
      m['signature'] = signature;
    }
    if (null != street) {
      m['street'] = street;
    }
    if (null != terminal_id) {
      m['terminal_id'] = terminal_id;
    }
    if (null != terminalid_acquirer) {
      m['terminalid_acquirer'] = terminalid_acquirer;
    }
    if (null != vu_nummer) {
      m['vu_nummer'] = vu_nummer;
    }
    return m;
  }
}

class MerchantPortalPamPackageController {
  /// STRING
  String? consumer_uuid;
  /// STRING
  String? corporate_uuid;
  /// STRING
  String? country;
  /// STRING
  String? description_key;
  /// OBJECT
  Map<String, dynamic>? filter;
  /// STRING (required at the API)
  String? language;
  /// STRING
  String? name_key;
  /// STRING
  String? package_status;
  /// STRING (required at the API)
  String? package_uuid;
  /// OBJECT
  Map<String, dynamic>? pagination;
  /// OBJECT
  Map<String, dynamic>? sorting;

  MerchantPortalPamPackageController({
    this.consumer_uuid,
    this.corporate_uuid,
    this.country,
    this.description_key,
    this.filter,
    this.language,
    this.name_key,
    this.package_status,
    this.package_uuid,
    this.pagination,
    this.sorting,
  });

  factory MerchantPortalPamPackageController.fromMap(Map<String, dynamic> m) => MerchantPortalPamPackageController(
        consumer_uuid: m['consumer_uuid'] is String ? m['consumer_uuid'] : null,
        corporate_uuid: m['corporate_uuid'] is String ? m['corporate_uuid'] : null,
        country: m['country'] is String ? m['country'] : null,
        description_key: m['description_key'] is String ? m['description_key'] : null,
        filter: m['filter'] is Map<String, dynamic> ? m['filter'] : null,
        language: m['language'] is String ? m['language'] : null,
        name_key: m['name_key'] is String ? m['name_key'] : null,
        package_status: m['package_status'] is String ? m['package_status'] : null,
        package_uuid: m['package_uuid'] is String ? m['package_uuid'] : null,
        pagination: m['pagination'] is Map<String, dynamic> ? m['pagination'] : null,
        sorting: m['sorting'] is Map<String, dynamic> ? m['sorting'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != consumer_uuid) {
      m['consumer_uuid'] = consumer_uuid;
    }
    if (null != corporate_uuid) {
      m['corporate_uuid'] = corporate_uuid;
    }
    if (null != country) {
      m['country'] = country;
    }
    if (null != description_key) {
      m['description_key'] = description_key;
    }
    if (null != filter) {
      m['filter'] = filter;
    }
    if (null != language) {
      m['language'] = language;
    }
    if (null != name_key) {
      m['name_key'] = name_key;
    }
    if (null != package_status) {
      m['package_status'] = package_status;
    }
    if (null != package_uuid) {
      m['package_uuid'] = package_uuid;
    }
    if (null != pagination) {
      m['pagination'] = pagination;
    }
    if (null != sorting) {
      m['sorting'] = sorting;
    }
    return m;
  }
}

class MerchantPortalPamPackageControllerCreateData {
  /// STRING
  String? consumer_uuid;
  /// STRING
  String? corporate_uuid;
  /// STRING
  String? country;
  /// STRING
  String? description_key;
  /// OBJECT
  Map<String, dynamic>? filter;
  /// STRING (required at the API)
  String? language;
  /// STRING
  String? name_key;
  /// STRING
  String? package_status;
  /// STRING (required at the API)
  String? package_uuid;
  /// OBJECT
  Map<String, dynamic>? pagination;
  /// OBJECT
  Map<String, dynamic>? sorting;

  MerchantPortalPamPackageControllerCreateData({
    this.consumer_uuid,
    this.corporate_uuid,
    this.country,
    this.description_key,
    this.filter,
    this.language,
    this.name_key,
    this.package_status,
    this.package_uuid,
    this.pagination,
    this.sorting,
  });

  factory MerchantPortalPamPackageControllerCreateData.fromMap(Map<String, dynamic> m) => MerchantPortalPamPackageControllerCreateData(
        consumer_uuid: m['consumer_uuid'] is String ? m['consumer_uuid'] : null,
        corporate_uuid: m['corporate_uuid'] is String ? m['corporate_uuid'] : null,
        country: m['country'] is String ? m['country'] : null,
        description_key: m['description_key'] is String ? m['description_key'] : null,
        filter: m['filter'] is Map<String, dynamic> ? m['filter'] : null,
        language: m['language'] is String ? m['language'] : null,
        name_key: m['name_key'] is String ? m['name_key'] : null,
        package_status: m['package_status'] is String ? m['package_status'] : null,
        package_uuid: m['package_uuid'] is String ? m['package_uuid'] : null,
        pagination: m['pagination'] is Map<String, dynamic> ? m['pagination'] : null,
        sorting: m['sorting'] is Map<String, dynamic> ? m['sorting'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != consumer_uuid) {
      m['consumer_uuid'] = consumer_uuid;
    }
    if (null != corporate_uuid) {
      m['corporate_uuid'] = corporate_uuid;
    }
    if (null != country) {
      m['country'] = country;
    }
    if (null != description_key) {
      m['description_key'] = description_key;
    }
    if (null != filter) {
      m['filter'] = filter;
    }
    if (null != language) {
      m['language'] = language;
    }
    if (null != name_key) {
      m['name_key'] = name_key;
    }
    if (null != package_status) {
      m['package_status'] = package_status;
    }
    if (null != package_uuid) {
      m['package_uuid'] = package_uuid;
    }
    if (null != pagination) {
      m['pagination'] = pagination;
    }
    if (null != sorting) {
      m['sorting'] = sorting;
    }
    return m;
  }
}

class MerchantPortalPamProductController {
  /// STRING
  String? consumer_uuid;
  /// OBJECT
  Map<String, dynamic>? filter;
  /// STRING
  String? language;
  /// STRING
  String? merchant_id;
  /// STRING (required at the API)
  String? package_order_uuid;
  /// OBJECT
  Map<String, dynamic>? pagination;
  /// STRING (required at the API)
  String? product_order_uuid;
  /// STRING (required at the API)
  String? product_uuid;
  /// STRING (required at the API)
  String? reason_decline;
  /// OBJECT
  Map<String, dynamic>? sorting;

  MerchantPortalPamProductController({
    this.consumer_uuid,
    this.filter,
    this.language,
    this.merchant_id,
    this.package_order_uuid,
    this.pagination,
    this.product_order_uuid,
    this.product_uuid,
    this.reason_decline,
    this.sorting,
  });

  factory MerchantPortalPamProductController.fromMap(Map<String, dynamic> m) => MerchantPortalPamProductController(
        consumer_uuid: m['consumer_uuid'] is String ? m['consumer_uuid'] : null,
        filter: m['filter'] is Map<String, dynamic> ? m['filter'] : null,
        language: m['language'] is String ? m['language'] : null,
        merchant_id: m['merchant_id'] is String ? m['merchant_id'] : null,
        package_order_uuid: m['package_order_uuid'] is String ? m['package_order_uuid'] : null,
        pagination: m['pagination'] is Map<String, dynamic> ? m['pagination'] : null,
        product_order_uuid: m['product_order_uuid'] is String ? m['product_order_uuid'] : null,
        product_uuid: m['product_uuid'] is String ? m['product_uuid'] : null,
        reason_decline: m['reason_decline'] is String ? m['reason_decline'] : null,
        sorting: m['sorting'] is Map<String, dynamic> ? m['sorting'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != consumer_uuid) {
      m['consumer_uuid'] = consumer_uuid;
    }
    if (null != filter) {
      m['filter'] = filter;
    }
    if (null != language) {
      m['language'] = language;
    }
    if (null != merchant_id) {
      m['merchant_id'] = merchant_id;
    }
    if (null != package_order_uuid) {
      m['package_order_uuid'] = package_order_uuid;
    }
    if (null != pagination) {
      m['pagination'] = pagination;
    }
    if (null != product_order_uuid) {
      m['product_order_uuid'] = product_order_uuid;
    }
    if (null != product_uuid) {
      m['product_uuid'] = product_uuid;
    }
    if (null != reason_decline) {
      m['reason_decline'] = reason_decline;
    }
    if (null != sorting) {
      m['sorting'] = sorting;
    }
    return m;
  }
}

class MerchantPortalPamProductControllerCreateData {
  /// STRING
  String? consumer_uuid;
  /// OBJECT
  Map<String, dynamic>? filter;
  /// STRING
  String? language;
  /// STRING
  String? merchant_id;
  /// STRING (required at the API)
  String? package_order_uuid;
  /// OBJECT
  Map<String, dynamic>? pagination;
  /// STRING (required at the API)
  String? product_order_uuid;
  /// STRING (required at the API)
  String? product_uuid;
  /// STRING (required at the API)
  String? reason_decline;
  /// OBJECT
  Map<String, dynamic>? sorting;

  MerchantPortalPamProductControllerCreateData({
    this.consumer_uuid,
    this.filter,
    this.language,
    this.merchant_id,
    this.package_order_uuid,
    this.pagination,
    this.product_order_uuid,
    this.product_uuid,
    this.reason_decline,
    this.sorting,
  });

  factory MerchantPortalPamProductControllerCreateData.fromMap(Map<String, dynamic> m) => MerchantPortalPamProductControllerCreateData(
        consumer_uuid: m['consumer_uuid'] is String ? m['consumer_uuid'] : null,
        filter: m['filter'] is Map<String, dynamic> ? m['filter'] : null,
        language: m['language'] is String ? m['language'] : null,
        merchant_id: m['merchant_id'] is String ? m['merchant_id'] : null,
        package_order_uuid: m['package_order_uuid'] is String ? m['package_order_uuid'] : null,
        pagination: m['pagination'] is Map<String, dynamic> ? m['pagination'] : null,
        product_order_uuid: m['product_order_uuid'] is String ? m['product_order_uuid'] : null,
        product_uuid: m['product_uuid'] is String ? m['product_uuid'] : null,
        reason_decline: m['reason_decline'] is String ? m['reason_decline'] : null,
        sorting: m['sorting'] is Map<String, dynamic> ? m['sorting'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != consumer_uuid) {
      m['consumer_uuid'] = consumer_uuid;
    }
    if (null != filter) {
      m['filter'] = filter;
    }
    if (null != language) {
      m['language'] = language;
    }
    if (null != merchant_id) {
      m['merchant_id'] = merchant_id;
    }
    if (null != package_order_uuid) {
      m['package_order_uuid'] = package_order_uuid;
    }
    if (null != pagination) {
      m['pagination'] = pagination;
    }
    if (null != product_order_uuid) {
      m['product_order_uuid'] = product_order_uuid;
    }
    if (null != product_uuid) {
      m['product_uuid'] = product_uuid;
    }
    if (null != reason_decline) {
      m['reason_decline'] = reason_decline;
    }
    if (null != sorting) {
      m['sorting'] = sorting;
    }
    return m;
  }
}

class OutputAddProduct {
  /// STRING (required at the API)
  String? package_uuid;
  /// ARRAY (required at the API)
  List<dynamic>? product_uui_d;
  /// INTEGER (required at the API)
  int? response_code;
  /// STRING (required at the API)
  String? response_message;

  OutputAddProduct({
    this.package_uuid,
    this.product_uui_d,
    this.response_code,
    this.response_message,
  });

  factory OutputAddProduct.fromMap(Map<String, dynamic> m) => OutputAddProduct(
        package_uuid: m['package_uuid'] is String ? m['package_uuid'] : null,
        product_uui_d: m['product_uui_d'] is List<dynamic> ? m['product_uui_d'] : null,
        response_code: m['response_code'] is int ? m['response_code'] : null,
        response_message: m['response_message'] is String ? m['response_message'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != package_uuid) {
      m['package_uuid'] = package_uuid;
    }
    if (null != product_uui_d) {
      m['product_uui_d'] = product_uui_d;
    }
    if (null != response_code) {
      m['response_code'] = response_code;
    }
    if (null != response_message) {
      m['response_message'] = response_message;
    }
    return m;
  }
}

class OutputAddProductCreateData {
  /// STRING (required at the API)
  String? package_uuid;
  /// ARRAY (required at the API)
  List<dynamic>? product_uui_d;
  /// INTEGER (required at the API)
  int? response_code;
  /// STRING (required at the API)
  String? response_message;

  OutputAddProductCreateData({
    this.package_uuid,
    this.product_uui_d,
    this.response_code,
    this.response_message,
  });

  factory OutputAddProductCreateData.fromMap(Map<String, dynamic> m) => OutputAddProductCreateData(
        package_uuid: m['package_uuid'] is String ? m['package_uuid'] : null,
        product_uui_d: m['product_uui_d'] is List<dynamic> ? m['product_uui_d'] : null,
        response_code: m['response_code'] is int ? m['response_code'] : null,
        response_message: m['response_message'] is String ? m['response_message'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != package_uuid) {
      m['package_uuid'] = package_uuid;
    }
    if (null != product_uui_d) {
      m['product_uui_d'] = product_uui_d;
    }
    if (null != response_code) {
      m['response_code'] = response_code;
    }
    if (null != response_message) {
      m['response_message'] = response_message;
    }
    return m;
  }
}

class OutputCreateProduct {
  /// STRING
  String? acquirer_id;
  /// BOOLEAN (required at the API)
  bool? allow_multiple_order;
  /// STRING (required at the API)
  String? app_form_template_name;
  /// BOOLEAN (required at the API)
  bool? contract_needed;
  /// BOOLEAN
  bool? credentials_needed;
  /// STRING (required at the API)
  String? description_key;
  /// STRING (required at the API)
  String? name_key;
  /// BOOLEAN (required at the API)
  bool? prescreening_allowed;
  /// STRING (required at the API)
  String? product_name;
  /// INTEGER (required at the API)
  int? response_code;
  /// STRING (required at the API)
  String? response_message;
  /// STRING (required at the API)
  String? terminal_template_name;
  /// STRING (required at the API)
  String? vendor_name;
  /// STRING (required at the API)
  String? xml_template_file;

  OutputCreateProduct({
    this.acquirer_id,
    this.allow_multiple_order,
    this.app_form_template_name,
    this.contract_needed,
    this.credentials_needed,
    this.description_key,
    this.name_key,
    this.prescreening_allowed,
    this.product_name,
    this.response_code,
    this.response_message,
    this.terminal_template_name,
    this.vendor_name,
    this.xml_template_file,
  });

  factory OutputCreateProduct.fromMap(Map<String, dynamic> m) => OutputCreateProduct(
        acquirer_id: m['acquirer_id'] is String ? m['acquirer_id'] : null,
        allow_multiple_order: m['allow_multiple_order'] is bool ? m['allow_multiple_order'] : null,
        app_form_template_name: m['app_form_template_name'] is String ? m['app_form_template_name'] : null,
        contract_needed: m['contract_needed'] is bool ? m['contract_needed'] : null,
        credentials_needed: m['credentials_needed'] is bool ? m['credentials_needed'] : null,
        description_key: m['description_key'] is String ? m['description_key'] : null,
        name_key: m['name_key'] is String ? m['name_key'] : null,
        prescreening_allowed: m['prescreening_allowed'] is bool ? m['prescreening_allowed'] : null,
        product_name: m['product_name'] is String ? m['product_name'] : null,
        response_code: m['response_code'] is int ? m['response_code'] : null,
        response_message: m['response_message'] is String ? m['response_message'] : null,
        terminal_template_name: m['terminal_template_name'] is String ? m['terminal_template_name'] : null,
        vendor_name: m['vendor_name'] is String ? m['vendor_name'] : null,
        xml_template_file: m['xml_template_file'] is String ? m['xml_template_file'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != acquirer_id) {
      m['acquirer_id'] = acquirer_id;
    }
    if (null != allow_multiple_order) {
      m['allow_multiple_order'] = allow_multiple_order;
    }
    if (null != app_form_template_name) {
      m['app_form_template_name'] = app_form_template_name;
    }
    if (null != contract_needed) {
      m['contract_needed'] = contract_needed;
    }
    if (null != credentials_needed) {
      m['credentials_needed'] = credentials_needed;
    }
    if (null != description_key) {
      m['description_key'] = description_key;
    }
    if (null != name_key) {
      m['name_key'] = name_key;
    }
    if (null != prescreening_allowed) {
      m['prescreening_allowed'] = prescreening_allowed;
    }
    if (null != product_name) {
      m['product_name'] = product_name;
    }
    if (null != response_code) {
      m['response_code'] = response_code;
    }
    if (null != response_message) {
      m['response_message'] = response_message;
    }
    if (null != terminal_template_name) {
      m['terminal_template_name'] = terminal_template_name;
    }
    if (null != vendor_name) {
      m['vendor_name'] = vendor_name;
    }
    if (null != xml_template_file) {
      m['xml_template_file'] = xml_template_file;
    }
    return m;
  }
}

class OutputCreateProductCreateData {
  /// STRING
  String? acquirer_id;
  /// BOOLEAN (required at the API)
  bool? allow_multiple_order;
  /// STRING (required at the API)
  String? app_form_template_name;
  /// BOOLEAN (required at the API)
  bool? contract_needed;
  /// BOOLEAN
  bool? credentials_needed;
  /// STRING (required at the API)
  String? description_key;
  /// STRING (required at the API)
  String? name_key;
  /// BOOLEAN (required at the API)
  bool? prescreening_allowed;
  /// STRING (required at the API)
  String? product_name;
  /// INTEGER (required at the API)
  int? response_code;
  /// STRING (required at the API)
  String? response_message;
  /// STRING (required at the API)
  String? terminal_template_name;
  /// STRING (required at the API)
  String? vendor_name;
  /// STRING (required at the API)
  String? xml_template_file;

  OutputCreateProductCreateData({
    this.acquirer_id,
    this.allow_multiple_order,
    this.app_form_template_name,
    this.contract_needed,
    this.credentials_needed,
    this.description_key,
    this.name_key,
    this.prescreening_allowed,
    this.product_name,
    this.response_code,
    this.response_message,
    this.terminal_template_name,
    this.vendor_name,
    this.xml_template_file,
  });

  factory OutputCreateProductCreateData.fromMap(Map<String, dynamic> m) => OutputCreateProductCreateData(
        acquirer_id: m['acquirer_id'] is String ? m['acquirer_id'] : null,
        allow_multiple_order: m['allow_multiple_order'] is bool ? m['allow_multiple_order'] : null,
        app_form_template_name: m['app_form_template_name'] is String ? m['app_form_template_name'] : null,
        contract_needed: m['contract_needed'] is bool ? m['contract_needed'] : null,
        credentials_needed: m['credentials_needed'] is bool ? m['credentials_needed'] : null,
        description_key: m['description_key'] is String ? m['description_key'] : null,
        name_key: m['name_key'] is String ? m['name_key'] : null,
        prescreening_allowed: m['prescreening_allowed'] is bool ? m['prescreening_allowed'] : null,
        product_name: m['product_name'] is String ? m['product_name'] : null,
        response_code: m['response_code'] is int ? m['response_code'] : null,
        response_message: m['response_message'] is String ? m['response_message'] : null,
        terminal_template_name: m['terminal_template_name'] is String ? m['terminal_template_name'] : null,
        vendor_name: m['vendor_name'] is String ? m['vendor_name'] : null,
        xml_template_file: m['xml_template_file'] is String ? m['xml_template_file'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != acquirer_id) {
      m['acquirer_id'] = acquirer_id;
    }
    if (null != allow_multiple_order) {
      m['allow_multiple_order'] = allow_multiple_order;
    }
    if (null != app_form_template_name) {
      m['app_form_template_name'] = app_form_template_name;
    }
    if (null != contract_needed) {
      m['contract_needed'] = contract_needed;
    }
    if (null != credentials_needed) {
      m['credentials_needed'] = credentials_needed;
    }
    if (null != description_key) {
      m['description_key'] = description_key;
    }
    if (null != name_key) {
      m['name_key'] = name_key;
    }
    if (null != prescreening_allowed) {
      m['prescreening_allowed'] = prescreening_allowed;
    }
    if (null != product_name) {
      m['product_name'] = product_name;
    }
    if (null != response_code) {
      m['response_code'] = response_code;
    }
    if (null != response_message) {
      m['response_message'] = response_message;
    }
    if (null != terminal_template_name) {
      m['terminal_template_name'] = terminal_template_name;
    }
    if (null != vendor_name) {
      m['vendor_name'] = vendor_name;
    }
    if (null != xml_template_file) {
      m['xml_template_file'] = xml_template_file;
    }
    return m;
  }
}

class OutputDetail {
  /// OBJECT
  Map<String, dynamic>? detail;
  /// INTEGER (required at the API)
  int? response_code;
  /// STRING (required at the API)
  String? response_message;

  OutputDetail({
    this.detail,
    this.response_code,
    this.response_message,
  });

  factory OutputDetail.fromMap(Map<String, dynamic> m) => OutputDetail(
        detail: m['detail'] is Map<String, dynamic> ? m['detail'] : null,
        response_code: m['response_code'] is int ? m['response_code'] : null,
        response_message: m['response_message'] is String ? m['response_message'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != detail) {
      m['detail'] = detail;
    }
    if (null != response_code) {
      m['response_code'] = response_code;
    }
    if (null != response_message) {
      m['response_message'] = response_message;
    }
    return m;
  }
}

class OutputDetailLoadMatch {
  /// STRING (required at the API)
  String? id;

  OutputDetailLoadMatch({
    this.id,
  });

  factory OutputDetailLoadMatch.fromMap(Map<String, dynamic> m) => OutputDetailLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class OutputList {
  /// ARRAY
  List<dynamic>? item;
  /// OBJECT (required at the API)
  Map<String, dynamic>? pagination;
  /// INTEGER (required at the API)
  int? response_code;
  /// STRING (required at the API)
  String? response_message;
  /// OBJECT
  Map<String, dynamic>? sorting;

  OutputList({
    this.item,
    this.pagination,
    this.response_code,
    this.response_message,
    this.sorting,
  });

  factory OutputList.fromMap(Map<String, dynamic> m) => OutputList(
        item: m['item'] is List<dynamic> ? m['item'] : null,
        pagination: m['pagination'] is Map<String, dynamic> ? m['pagination'] : null,
        response_code: m['response_code'] is int ? m['response_code'] : null,
        response_message: m['response_message'] is String ? m['response_message'] : null,
        sorting: m['sorting'] is Map<String, dynamic> ? m['sorting'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != item) {
      m['item'] = item;
    }
    if (null != pagination) {
      m['pagination'] = pagination;
    }
    if (null != response_code) {
      m['response_code'] = response_code;
    }
    if (null != response_message) {
      m['response_message'] = response_message;
    }
    if (null != sorting) {
      m['sorting'] = sorting;
    }
    return m;
  }
}

class OutputListCreateData {
  /// ARRAY
  List<dynamic>? item;
  /// OBJECT (required at the API)
  Map<String, dynamic>? pagination;
  /// INTEGER (required at the API)
  int? response_code;
  /// STRING (required at the API)
  String? response_message;
  /// OBJECT
  Map<String, dynamic>? sorting;

  OutputListCreateData({
    this.item,
    this.pagination,
    this.response_code,
    this.response_message,
    this.sorting,
  });

  factory OutputListCreateData.fromMap(Map<String, dynamic> m) => OutputListCreateData(
        item: m['item'] is List<dynamic> ? m['item'] : null,
        pagination: m['pagination'] is Map<String, dynamic> ? m['pagination'] : null,
        response_code: m['response_code'] is int ? m['response_code'] : null,
        response_message: m['response_message'] is String ? m['response_message'] : null,
        sorting: m['sorting'] is Map<String, dynamic> ? m['sorting'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != item) {
      m['item'] = item;
    }
    if (null != pagination) {
      m['pagination'] = pagination;
    }
    if (null != response_code) {
      m['response_code'] = response_code;
    }
    if (null != response_message) {
      m['response_message'] = response_message;
    }
    if (null != sorting) {
      m['sorting'] = sorting;
    }
    return m;
  }
}

class OutputMessage {
  /// INTEGER (required at the API)
  int? response_code;
  /// STRING (required at the API)
  String? response_message;

  OutputMessage({
    this.response_code,
    this.response_message,
  });

  factory OutputMessage.fromMap(Map<String, dynamic> m) => OutputMessage(
        response_code: m['response_code'] is int ? m['response_code'] : null,
        response_message: m['response_message'] is String ? m['response_message'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != response_code) {
      m['response_code'] = response_code;
    }
    if (null != response_message) {
      m['response_message'] = response_message;
    }
    return m;
  }
}

class OutputMessageLoadMatch {
  /// STRING (required at the API)
  String? id;

  OutputMessageLoadMatch({
    this.id,
  });

  factory OutputMessageLoadMatch.fromMap(Map<String, dynamic> m) => OutputMessageLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class OutputMoveTid {
  /// ARRAY (required at the API)
  List<dynamic>? product_order_uui_d;
  /// INTEGER (required at the API)
  int? response_code;
  /// STRING (required at the API)
  String? response_message;
  /// STRING (required at the API)
  String? target_package_order_uuid;
  /// STRING (required at the API)
  String? target_product_order_uuid;

  OutputMoveTid({
    this.product_order_uui_d,
    this.response_code,
    this.response_message,
    this.target_package_order_uuid,
    this.target_product_order_uuid,
  });

  factory OutputMoveTid.fromMap(Map<String, dynamic> m) => OutputMoveTid(
        product_order_uui_d: m['product_order_uui_d'] is List<dynamic> ? m['product_order_uui_d'] : null,
        response_code: m['response_code'] is int ? m['response_code'] : null,
        response_message: m['response_message'] is String ? m['response_message'] : null,
        target_package_order_uuid: m['target_package_order_uuid'] is String ? m['target_package_order_uuid'] : null,
        target_product_order_uuid: m['target_product_order_uuid'] is String ? m['target_product_order_uuid'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != product_order_uui_d) {
      m['product_order_uui_d'] = product_order_uui_d;
    }
    if (null != response_code) {
      m['response_code'] = response_code;
    }
    if (null != response_message) {
      m['response_message'] = response_message;
    }
    if (null != target_package_order_uuid) {
      m['target_package_order_uuid'] = target_package_order_uuid;
    }
    if (null != target_product_order_uuid) {
      m['target_product_order_uuid'] = target_product_order_uuid;
    }
    return m;
  }
}

class OutputMoveTidCreateData {
  /// ARRAY (required at the API)
  List<dynamic>? product_order_uui_d;
  /// INTEGER (required at the API)
  int? response_code;
  /// STRING (required at the API)
  String? response_message;
  /// STRING (required at the API)
  String? target_package_order_uuid;
  /// STRING (required at the API)
  String? target_product_order_uuid;

  OutputMoveTidCreateData({
    this.product_order_uui_d,
    this.response_code,
    this.response_message,
    this.target_package_order_uuid,
    this.target_product_order_uuid,
  });

  factory OutputMoveTidCreateData.fromMap(Map<String, dynamic> m) => OutputMoveTidCreateData(
        product_order_uui_d: m['product_order_uui_d'] is List<dynamic> ? m['product_order_uui_d'] : null,
        response_code: m['response_code'] is int ? m['response_code'] : null,
        response_message: m['response_message'] is String ? m['response_message'] : null,
        target_package_order_uuid: m['target_package_order_uuid'] is String ? m['target_package_order_uuid'] : null,
        target_product_order_uuid: m['target_product_order_uuid'] is String ? m['target_product_order_uuid'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != product_order_uui_d) {
      m['product_order_uui_d'] = product_order_uui_d;
    }
    if (null != response_code) {
      m['response_code'] = response_code;
    }
    if (null != response_message) {
      m['response_message'] = response_message;
    }
    if (null != target_package_order_uuid) {
      m['target_package_order_uuid'] = target_package_order_uuid;
    }
    if (null != target_product_order_uuid) {
      m['target_product_order_uuid'] = target_product_order_uuid;
    }
    return m;
  }
}

class OutputRemoveProduct {
  /// STRING (required at the API)
  String? package_uuid;
  /// ARRAY (required at the API)
  List<dynamic>? product_uui_d;
  /// INTEGER (required at the API)
  int? response_code;
  /// STRING (required at the API)
  String? response_message;

  OutputRemoveProduct({
    this.package_uuid,
    this.product_uui_d,
    this.response_code,
    this.response_message,
  });

  factory OutputRemoveProduct.fromMap(Map<String, dynamic> m) => OutputRemoveProduct(
        package_uuid: m['package_uuid'] is String ? m['package_uuid'] : null,
        product_uui_d: m['product_uui_d'] is List<dynamic> ? m['product_uui_d'] : null,
        response_code: m['response_code'] is int ? m['response_code'] : null,
        response_message: m['response_message'] is String ? m['response_message'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != package_uuid) {
      m['package_uuid'] = package_uuid;
    }
    if (null != product_uui_d) {
      m['product_uui_d'] = product_uui_d;
    }
    if (null != response_code) {
      m['response_code'] = response_code;
    }
    if (null != response_message) {
      m['response_message'] = response_message;
    }
    return m;
  }
}

class OutputRemoveProductCreateData {
  /// STRING (required at the API)
  String? package_uuid;
  /// ARRAY (required at the API)
  List<dynamic>? product_uui_d;
  /// INTEGER (required at the API)
  int? response_code;
  /// STRING (required at the API)
  String? response_message;

  OutputRemoveProductCreateData({
    this.package_uuid,
    this.product_uui_d,
    this.response_code,
    this.response_message,
  });

  factory OutputRemoveProductCreateData.fromMap(Map<String, dynamic> m) => OutputRemoveProductCreateData(
        package_uuid: m['package_uuid'] is String ? m['package_uuid'] : null,
        product_uui_d: m['product_uui_d'] is List<dynamic> ? m['product_uui_d'] : null,
        response_code: m['response_code'] is int ? m['response_code'] : null,
        response_message: m['response_message'] is String ? m['response_message'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != package_uuid) {
      m['package_uuid'] = package_uuid;
    }
    if (null != product_uui_d) {
      m['product_uui_d'] = product_uui_d;
    }
    if (null != response_code) {
      m['response_code'] = response_code;
    }
    if (null != response_message) {
      m['response_message'] = response_message;
    }
    return m;
  }
}

class OutputStart {
  /// STRING
  String? id;
  /// INTEGER (required at the API)
  int? response_code;
  /// STRING (required at the API)
  String? response_message;

  OutputStart({
    this.id,
    this.response_code,
    this.response_message,
  });

  factory OutputStart.fromMap(Map<String, dynamic> m) => OutputStart(
        id: m['id'] is String ? m['id'] : null,
        response_code: m['response_code'] is int ? m['response_code'] : null,
        response_message: m['response_message'] is String ? m['response_message'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    if (null != response_code) {
      m['response_code'] = response_code;
    }
    if (null != response_message) {
      m['response_message'] = response_message;
    }
    return m;
  }
}

class OutputStartCreateData {
  /// STRING
  String? id;
  /// INTEGER (required at the API)
  int? response_code;
  /// STRING (required at the API)
  String? response_message;

  OutputStartCreateData({
    this.id,
    this.response_code,
    this.response_message,
  });

  factory OutputStartCreateData.fromMap(Map<String, dynamic> m) => OutputStartCreateData(
        id: m['id'] is String ? m['id'] : null,
        response_code: m['response_code'] is int ? m['response_code'] : null,
        response_message: m['response_message'] is String ? m['response_message'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    if (null != response_code) {
      m['response_code'] = response_code;
    }
    if (null != response_message) {
      m['response_message'] = response_message;
    }
    return m;
  }
}

class OutputStatus {
  /// INTEGER
  int? percentage;
  /// INTEGER (required at the API)
  int? response_code;
  /// STRING (required at the API)
  String? response_message;
  /// STRING
  String? status;

  OutputStatus({
    this.percentage,
    this.response_code,
    this.response_message,
    this.status,
  });

  factory OutputStatus.fromMap(Map<String, dynamic> m) => OutputStatus(
        percentage: m['percentage'] is int ? m['percentage'] : null,
        response_code: m['response_code'] is int ? m['response_code'] : null,
        response_message: m['response_message'] is String ? m['response_message'] : null,
        status: m['status'] is String ? m['status'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != percentage) {
      m['percentage'] = percentage;
    }
    if (null != response_code) {
      m['response_code'] = response_code;
    }
    if (null != response_message) {
      m['response_message'] = response_message;
    }
    if (null != status) {
      m['status'] = status;
    }
    return m;
  }
}

class OutputStatusLoadMatch {
  /// STRING (required at the API)
  String? id;

  OutputStatusLoadMatch({
    this.id,
  });

  factory OutputStatusLoadMatch.fromMap(Map<String, dynamic> m) => OutputStatusLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class OutputUpdateProduct {
  /// BOOLEAN
  bool? allow_multiple_order;
  /// STRING
  String? app_form_name;
  /// BOOLEAN
  bool? contract_needed;
  /// BOOLEAN
  bool? credentials_needed;
  /// STRING
  String? description_key;
  /// STRING
  String? name_key;
  /// BOOLEAN
  bool? prescreening_allowed;
  /// STRING
  String? product_name;
  /// STRING
  String? product_status;
  /// STRING (required at the API)
  String? product_uuid;
  /// INTEGER (required at the API)
  int? response_code;
  /// STRING (required at the API)
  String? response_message;
  /// STRING
  String? vendor_name;

  OutputUpdateProduct({
    this.allow_multiple_order,
    this.app_form_name,
    this.contract_needed,
    this.credentials_needed,
    this.description_key,
    this.name_key,
    this.prescreening_allowed,
    this.product_name,
    this.product_status,
    this.product_uuid,
    this.response_code,
    this.response_message,
    this.vendor_name,
  });

  factory OutputUpdateProduct.fromMap(Map<String, dynamic> m) => OutputUpdateProduct(
        allow_multiple_order: m['allow_multiple_order'] is bool ? m['allow_multiple_order'] : null,
        app_form_name: m['app_form_name'] is String ? m['app_form_name'] : null,
        contract_needed: m['contract_needed'] is bool ? m['contract_needed'] : null,
        credentials_needed: m['credentials_needed'] is bool ? m['credentials_needed'] : null,
        description_key: m['description_key'] is String ? m['description_key'] : null,
        name_key: m['name_key'] is String ? m['name_key'] : null,
        prescreening_allowed: m['prescreening_allowed'] is bool ? m['prescreening_allowed'] : null,
        product_name: m['product_name'] is String ? m['product_name'] : null,
        product_status: m['product_status'] is String ? m['product_status'] : null,
        product_uuid: m['product_uuid'] is String ? m['product_uuid'] : null,
        response_code: m['response_code'] is int ? m['response_code'] : null,
        response_message: m['response_message'] is String ? m['response_message'] : null,
        vendor_name: m['vendor_name'] is String ? m['vendor_name'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != allow_multiple_order) {
      m['allow_multiple_order'] = allow_multiple_order;
    }
    if (null != app_form_name) {
      m['app_form_name'] = app_form_name;
    }
    if (null != contract_needed) {
      m['contract_needed'] = contract_needed;
    }
    if (null != credentials_needed) {
      m['credentials_needed'] = credentials_needed;
    }
    if (null != description_key) {
      m['description_key'] = description_key;
    }
    if (null != name_key) {
      m['name_key'] = name_key;
    }
    if (null != prescreening_allowed) {
      m['prescreening_allowed'] = prescreening_allowed;
    }
    if (null != product_name) {
      m['product_name'] = product_name;
    }
    if (null != product_status) {
      m['product_status'] = product_status;
    }
    if (null != product_uuid) {
      m['product_uuid'] = product_uuid;
    }
    if (null != response_code) {
      m['response_code'] = response_code;
    }
    if (null != response_message) {
      m['response_message'] = response_message;
    }
    if (null != vendor_name) {
      m['vendor_name'] = vendor_name;
    }
    return m;
  }
}

class OutputUpdateProductCreateData {
  /// BOOLEAN
  bool? allow_multiple_order;
  /// STRING
  String? app_form_name;
  /// BOOLEAN
  bool? contract_needed;
  /// BOOLEAN
  bool? credentials_needed;
  /// STRING
  String? description_key;
  /// STRING
  String? name_key;
  /// BOOLEAN
  bool? prescreening_allowed;
  /// STRING
  String? product_name;
  /// STRING
  String? product_status;
  /// STRING (required at the API)
  String? product_uuid;
  /// INTEGER (required at the API)
  int? response_code;
  /// STRING (required at the API)
  String? response_message;
  /// STRING
  String? vendor_name;

  OutputUpdateProductCreateData({
    this.allow_multiple_order,
    this.app_form_name,
    this.contract_needed,
    this.credentials_needed,
    this.description_key,
    this.name_key,
    this.prescreening_allowed,
    this.product_name,
    this.product_status,
    this.product_uuid,
    this.response_code,
    this.response_message,
    this.vendor_name,
  });

  factory OutputUpdateProductCreateData.fromMap(Map<String, dynamic> m) => OutputUpdateProductCreateData(
        allow_multiple_order: m['allow_multiple_order'] is bool ? m['allow_multiple_order'] : null,
        app_form_name: m['app_form_name'] is String ? m['app_form_name'] : null,
        contract_needed: m['contract_needed'] is bool ? m['contract_needed'] : null,
        credentials_needed: m['credentials_needed'] is bool ? m['credentials_needed'] : null,
        description_key: m['description_key'] is String ? m['description_key'] : null,
        name_key: m['name_key'] is String ? m['name_key'] : null,
        prescreening_allowed: m['prescreening_allowed'] is bool ? m['prescreening_allowed'] : null,
        product_name: m['product_name'] is String ? m['product_name'] : null,
        product_status: m['product_status'] is String ? m['product_status'] : null,
        product_uuid: m['product_uuid'] is String ? m['product_uuid'] : null,
        response_code: m['response_code'] is int ? m['response_code'] : null,
        response_message: m['response_message'] is String ? m['response_message'] : null,
        vendor_name: m['vendor_name'] is String ? m['vendor_name'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != allow_multiple_order) {
      m['allow_multiple_order'] = allow_multiple_order;
    }
    if (null != app_form_name) {
      m['app_form_name'] = app_form_name;
    }
    if (null != contract_needed) {
      m['contract_needed'] = contract_needed;
    }
    if (null != credentials_needed) {
      m['credentials_needed'] = credentials_needed;
    }
    if (null != description_key) {
      m['description_key'] = description_key;
    }
    if (null != name_key) {
      m['name_key'] = name_key;
    }
    if (null != prescreening_allowed) {
      m['prescreening_allowed'] = prescreening_allowed;
    }
    if (null != product_name) {
      m['product_name'] = product_name;
    }
    if (null != product_status) {
      m['product_status'] = product_status;
    }
    if (null != product_uuid) {
      m['product_uuid'] = product_uuid;
    }
    if (null != response_code) {
      m['response_code'] = response_code;
    }
    if (null != response_message) {
      m['response_message'] = response_message;
    }
    if (null != vendor_name) {
      m['vendor_name'] = vendor_name;
    }
    return m;
  }
}

