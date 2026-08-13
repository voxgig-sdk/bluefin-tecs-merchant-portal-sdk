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
  String? productOrderUUID;

  MerchantPortalPamContractController({
    this.language,
    this.productOrderUUID,
  });

  factory MerchantPortalPamContractController.fromMap(Map<String, dynamic> m) => MerchantPortalPamContractController(
        language: m['language'] is String ? m['language'] : null,
        productOrderUUID: m['productOrderUUID'] is String ? m['productOrderUUID'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != language) {
      m['language'] = language;
    }
    if (null != productOrderUUID) {
      m['productOrderUUID'] = productOrderUUID;
    }
    return m;
  }
}

class MerchantPortalPamContractControllerCreateData {
  /// STRING (required at the API)
  String? language;
  /// STRING (required at the API)
  String? productOrderUUID;

  MerchantPortalPamContractControllerCreateData({
    this.language,
    this.productOrderUUID,
  });

  factory MerchantPortalPamContractControllerCreateData.fromMap(Map<String, dynamic> m) => MerchantPortalPamContractControllerCreateData(
        language: m['language'] is String ? m['language'] : null,
        productOrderUUID: m['productOrderUUID'] is String ? m['productOrderUUID'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != language) {
      m['language'] = language;
    }
    if (null != productOrderUUID) {
      m['productOrderUUID'] = productOrderUUID;
    }
    return m;
  }
}

class MerchantPortalPamDocumentController {
  /// STRING (required at the API)
  String? appFormFieldDescUUID;
  /// STRING
  String? packageOrderUUID;
  /// STRING
  String? productOrderUUID;

  MerchantPortalPamDocumentController({
    this.appFormFieldDescUUID,
    this.packageOrderUUID,
    this.productOrderUUID,
  });

  factory MerchantPortalPamDocumentController.fromMap(Map<String, dynamic> m) => MerchantPortalPamDocumentController(
        appFormFieldDescUUID: m['appFormFieldDescUUID'] is String ? m['appFormFieldDescUUID'] : null,
        packageOrderUUID: m['packageOrderUUID'] is String ? m['packageOrderUUID'] : null,
        productOrderUUID: m['productOrderUUID'] is String ? m['productOrderUUID'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != appFormFieldDescUUID) {
      m['appFormFieldDescUUID'] = appFormFieldDescUUID;
    }
    if (null != packageOrderUUID) {
      m['packageOrderUUID'] = packageOrderUUID;
    }
    if (null != productOrderUUID) {
      m['productOrderUUID'] = productOrderUUID;
    }
    return m;
  }
}

class MerchantPortalPamDocumentControllerCreateData {
  /// STRING (required at the API)
  String? appFormFieldDescUUID;
  /// STRING
  String? packageOrderUUID;
  /// STRING
  String? productOrderUUID;

  MerchantPortalPamDocumentControllerCreateData({
    this.appFormFieldDescUUID,
    this.packageOrderUUID,
    this.productOrderUUID,
  });

  factory MerchantPortalPamDocumentControllerCreateData.fromMap(Map<String, dynamic> m) => MerchantPortalPamDocumentControllerCreateData(
        appFormFieldDescUUID: m['appFormFieldDescUUID'] is String ? m['appFormFieldDescUUID'] : null,
        packageOrderUUID: m['packageOrderUUID'] is String ? m['packageOrderUUID'] : null,
        productOrderUUID: m['productOrderUUID'] is String ? m['productOrderUUID'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != appFormFieldDescUUID) {
      m['appFormFieldDescUUID'] = appFormFieldDescUUID;
    }
    if (null != packageOrderUUID) {
      m['packageOrderUUID'] = packageOrderUUID;
    }
    if (null != productOrderUUID) {
      m['productOrderUUID'] = productOrderUUID;
    }
    return m;
  }
}

class MerchantPortalPamFormController {
  /// STRING (required at the API)
  String? appFormFieldsDescUUID;
  /// OBJECT
  Map<String, dynamic>? filter;
  /// STRING (required at the API)
  String? language;
  /// OBJECT
  Map<String, dynamic>? packageOrder;
  /// STRING (required at the API)
  String? packageOrderUUID;
  /// STRING
  String? packageUUID;
  /// STRING
  String? productOrderUUID;
  /// ARRAY
  List<dynamic>? productOrders;
  /// STRING (required at the API)
  String? reasonOfReopening;

  MerchantPortalPamFormController({
    this.appFormFieldsDescUUID,
    this.filter,
    this.language,
    this.packageOrder,
    this.packageOrderUUID,
    this.packageUUID,
    this.productOrderUUID,
    this.productOrders,
    this.reasonOfReopening,
  });

  factory MerchantPortalPamFormController.fromMap(Map<String, dynamic> m) => MerchantPortalPamFormController(
        appFormFieldsDescUUID: m['appFormFieldsDescUUID'] is String ? m['appFormFieldsDescUUID'] : null,
        filter: m['filter'] is Map<String, dynamic> ? m['filter'] : null,
        language: m['language'] is String ? m['language'] : null,
        packageOrder: m['packageOrder'] is Map<String, dynamic> ? m['packageOrder'] : null,
        packageOrderUUID: m['packageOrderUUID'] is String ? m['packageOrderUUID'] : null,
        packageUUID: m['packageUUID'] is String ? m['packageUUID'] : null,
        productOrderUUID: m['productOrderUUID'] is String ? m['productOrderUUID'] : null,
        productOrders: m['productOrders'] is List<dynamic> ? m['productOrders'] : null,
        reasonOfReopening: m['reasonOfReopening'] is String ? m['reasonOfReopening'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != appFormFieldsDescUUID) {
      m['appFormFieldsDescUUID'] = appFormFieldsDescUUID;
    }
    if (null != filter) {
      m['filter'] = filter;
    }
    if (null != language) {
      m['language'] = language;
    }
    if (null != packageOrder) {
      m['packageOrder'] = packageOrder;
    }
    if (null != packageOrderUUID) {
      m['packageOrderUUID'] = packageOrderUUID;
    }
    if (null != packageUUID) {
      m['packageUUID'] = packageUUID;
    }
    if (null != productOrderUUID) {
      m['productOrderUUID'] = productOrderUUID;
    }
    if (null != productOrders) {
      m['productOrders'] = productOrders;
    }
    if (null != reasonOfReopening) {
      m['reasonOfReopening'] = reasonOfReopening;
    }
    return m;
  }
}

class MerchantPortalPamFormControllerCreateData {
  /// STRING (required at the API)
  String? appFormFieldsDescUUID;
  /// OBJECT
  Map<String, dynamic>? filter;
  /// STRING (required at the API)
  String? language;
  /// OBJECT
  Map<String, dynamic>? packageOrder;
  /// STRING (required at the API)
  String? packageOrderUUID;
  /// STRING
  String? packageUUID;
  /// STRING
  String? productOrderUUID;
  /// ARRAY
  List<dynamic>? productOrders;
  /// STRING (required at the API)
  String? reasonOfReopening;

  MerchantPortalPamFormControllerCreateData({
    this.appFormFieldsDescUUID,
    this.filter,
    this.language,
    this.packageOrder,
    this.packageOrderUUID,
    this.packageUUID,
    this.productOrderUUID,
    this.productOrders,
    this.reasonOfReopening,
  });

  factory MerchantPortalPamFormControllerCreateData.fromMap(Map<String, dynamic> m) => MerchantPortalPamFormControllerCreateData(
        appFormFieldsDescUUID: m['appFormFieldsDescUUID'] is String ? m['appFormFieldsDescUUID'] : null,
        filter: m['filter'] is Map<String, dynamic> ? m['filter'] : null,
        language: m['language'] is String ? m['language'] : null,
        packageOrder: m['packageOrder'] is Map<String, dynamic> ? m['packageOrder'] : null,
        packageOrderUUID: m['packageOrderUUID'] is String ? m['packageOrderUUID'] : null,
        packageUUID: m['packageUUID'] is String ? m['packageUUID'] : null,
        productOrderUUID: m['productOrderUUID'] is String ? m['productOrderUUID'] : null,
        productOrders: m['productOrders'] is List<dynamic> ? m['productOrders'] : null,
        reasonOfReopening: m['reasonOfReopening'] is String ? m['reasonOfReopening'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != appFormFieldsDescUUID) {
      m['appFormFieldsDescUUID'] = appFormFieldsDescUUID;
    }
    if (null != filter) {
      m['filter'] = filter;
    }
    if (null != language) {
      m['language'] = language;
    }
    if (null != packageOrder) {
      m['packageOrder'] = packageOrder;
    }
    if (null != packageOrderUUID) {
      m['packageOrderUUID'] = packageOrderUUID;
    }
    if (null != packageUUID) {
      m['packageUUID'] = packageUUID;
    }
    if (null != productOrderUUID) {
      m['productOrderUUID'] = productOrderUUID;
    }
    if (null != productOrders) {
      m['productOrders'] = productOrders;
    }
    if (null != reasonOfReopening) {
      m['reasonOfReopening'] = reasonOfReopening;
    }
    return m;
  }
}

class MerchantPortalPamMandatorController {
  /// STRING
  String? clientSecret;
  /// STRING (required at the API)
  String? mandatorName;
  /// STRING
  String? notificationEmail;
  /// STRING (required at the API)
  String? packageUUID;

  MerchantPortalPamMandatorController({
    this.clientSecret,
    this.mandatorName,
    this.notificationEmail,
    this.packageUUID,
  });

  factory MerchantPortalPamMandatorController.fromMap(Map<String, dynamic> m) => MerchantPortalPamMandatorController(
        clientSecret: m['clientSecret'] is String ? m['clientSecret'] : null,
        mandatorName: m['mandatorName'] is String ? m['mandatorName'] : null,
        notificationEmail: m['notificationEmail'] is String ? m['notificationEmail'] : null,
        packageUUID: m['packageUUID'] is String ? m['packageUUID'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != clientSecret) {
      m['clientSecret'] = clientSecret;
    }
    if (null != mandatorName) {
      m['mandatorName'] = mandatorName;
    }
    if (null != notificationEmail) {
      m['notificationEmail'] = notificationEmail;
    }
    if (null != packageUUID) {
      m['packageUUID'] = packageUUID;
    }
    return m;
  }
}

class MerchantPortalPamMandatorControllerCreateData {
  /// STRING
  String? clientSecret;
  /// STRING (required at the API)
  String? mandatorName;
  /// STRING
  String? notificationEmail;
  /// STRING (required at the API)
  String? packageUUID;

  MerchantPortalPamMandatorControllerCreateData({
    this.clientSecret,
    this.mandatorName,
    this.notificationEmail,
    this.packageUUID,
  });

  factory MerchantPortalPamMandatorControllerCreateData.fromMap(Map<String, dynamic> m) => MerchantPortalPamMandatorControllerCreateData(
        clientSecret: m['clientSecret'] is String ? m['clientSecret'] : null,
        mandatorName: m['mandatorName'] is String ? m['mandatorName'] : null,
        notificationEmail: m['notificationEmail'] is String ? m['notificationEmail'] : null,
        packageUUID: m['packageUUID'] is String ? m['packageUUID'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != clientSecret) {
      m['clientSecret'] = clientSecret;
    }
    if (null != mandatorName) {
      m['mandatorName'] = mandatorName;
    }
    if (null != notificationEmail) {
      m['notificationEmail'] = notificationEmail;
    }
    if (null != packageUUID) {
      m['packageUUID'] = packageUUID;
    }
    return m;
  }
}

class MerchantPortalPamMerchantController {
  /// OBJECT
  Map<String, dynamic>? additional_data;
  /// STRING (required at the API)
  String? businessRegistrationNumber;
  /// STRING
  String? city;
  /// STRING (required at the API)
  String? companyName;
  /// STRING (required at the API)
  String? corporateUUID;
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
  /// STRING (required at the API)
  String? merchantContractNumber;
  /// STRING
  String? merchantName;
  /// STRING
  String? merchant_category_code;
  /// STRING
  String? packageUUID;
  /// STRING (required at the API)
  String? packageorderuuid;
  /// STRING (required at the API)
  String? phoneNumber;
  /// STRING
  String? postalCode;
  /// STRING (required at the API)
  String? productid_acquirer;
  /// STRING
  String? region;
  /// STRING
  String? registrationNumber;
  /// STRING
  String? signature;
  /// STRING
  String? street;
  /// ARRAY
  List<dynamic>? terminalIds;
  /// STRING
  String? terminalid_acquirer;
  /// STRING (required at the API)
  String? vu_nummer;

  MerchantPortalPamMerchantController({
    this.additional_data,
    this.businessRegistrationNumber,
    this.city,
    this.companyName,
    this.corporateUUID,
    this.country,
    this.currency,
    this.email,
    this.language,
    this.login,
    this.mandator,
    this.merchantContractNumber,
    this.merchantName,
    this.merchant_category_code,
    this.packageUUID,
    this.packageorderuuid,
    this.phoneNumber,
    this.postalCode,
    this.productid_acquirer,
    this.region,
    this.registrationNumber,
    this.signature,
    this.street,
    this.terminalIds,
    this.terminalid_acquirer,
    this.vu_nummer,
  });

  factory MerchantPortalPamMerchantController.fromMap(Map<String, dynamic> m) => MerchantPortalPamMerchantController(
        additional_data: m['additional_data'] is Map<String, dynamic> ? m['additional_data'] : null,
        businessRegistrationNumber: m['businessRegistrationNumber'] is String ? m['businessRegistrationNumber'] : null,
        city: m['city'] is String ? m['city'] : null,
        companyName: m['companyName'] is String ? m['companyName'] : null,
        corporateUUID: m['corporateUUID'] is String ? m['corporateUUID'] : null,
        country: m['country'] is String ? m['country'] : null,
        currency: m['currency'] is String ? m['currency'] : null,
        email: m['email'] is String ? m['email'] : null,
        language: m['language'] is String ? m['language'] : null,
        login: m['login'] is String ? m['login'] : null,
        mandator: m['mandator'] is String ? m['mandator'] : null,
        merchantContractNumber: m['merchantContractNumber'] is String ? m['merchantContractNumber'] : null,
        merchantName: m['merchantName'] is String ? m['merchantName'] : null,
        merchant_category_code: m['merchant_category_code'] is String ? m['merchant_category_code'] : null,
        packageUUID: m['packageUUID'] is String ? m['packageUUID'] : null,
        packageorderuuid: m['packageorderuuid'] is String ? m['packageorderuuid'] : null,
        phoneNumber: m['phoneNumber'] is String ? m['phoneNumber'] : null,
        postalCode: m['postalCode'] is String ? m['postalCode'] : null,
        productid_acquirer: m['productid_acquirer'] is String ? m['productid_acquirer'] : null,
        region: m['region'] is String ? m['region'] : null,
        registrationNumber: m['registrationNumber'] is String ? m['registrationNumber'] : null,
        signature: m['signature'] is String ? m['signature'] : null,
        street: m['street'] is String ? m['street'] : null,
        terminalIds: m['terminalIds'] is List<dynamic> ? m['terminalIds'] : null,
        terminalid_acquirer: m['terminalid_acquirer'] is String ? m['terminalid_acquirer'] : null,
        vu_nummer: m['vu_nummer'] is String ? m['vu_nummer'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != additional_data) {
      m['additional_data'] = additional_data;
    }
    if (null != businessRegistrationNumber) {
      m['businessRegistrationNumber'] = businessRegistrationNumber;
    }
    if (null != city) {
      m['city'] = city;
    }
    if (null != companyName) {
      m['companyName'] = companyName;
    }
    if (null != corporateUUID) {
      m['corporateUUID'] = corporateUUID;
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
    if (null != merchantContractNumber) {
      m['merchantContractNumber'] = merchantContractNumber;
    }
    if (null != merchantName) {
      m['merchantName'] = merchantName;
    }
    if (null != merchant_category_code) {
      m['merchant_category_code'] = merchant_category_code;
    }
    if (null != packageUUID) {
      m['packageUUID'] = packageUUID;
    }
    if (null != packageorderuuid) {
      m['packageorderuuid'] = packageorderuuid;
    }
    if (null != phoneNumber) {
      m['phoneNumber'] = phoneNumber;
    }
    if (null != postalCode) {
      m['postalCode'] = postalCode;
    }
    if (null != productid_acquirer) {
      m['productid_acquirer'] = productid_acquirer;
    }
    if (null != region) {
      m['region'] = region;
    }
    if (null != registrationNumber) {
      m['registrationNumber'] = registrationNumber;
    }
    if (null != signature) {
      m['signature'] = signature;
    }
    if (null != street) {
      m['street'] = street;
    }
    if (null != terminalIds) {
      m['terminalIds'] = terminalIds;
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
  String? businessRegistrationNumber;
  /// STRING
  String? city;
  /// STRING (required at the API)
  String? companyName;
  /// STRING (required at the API)
  String? corporateUUID;
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
  /// STRING (required at the API)
  String? merchantContractNumber;
  /// STRING
  String? merchantName;
  /// STRING
  String? merchant_category_code;
  /// STRING
  String? packageUUID;
  /// STRING (required at the API)
  String? packageorderuuid;
  /// STRING (required at the API)
  String? phoneNumber;
  /// STRING
  String? postalCode;
  /// STRING (required at the API)
  String? productid_acquirer;
  /// STRING
  String? region;
  /// STRING
  String? registrationNumber;
  /// STRING
  String? signature;
  /// STRING
  String? street;
  /// ARRAY
  List<dynamic>? terminalIds;
  /// STRING
  String? terminalid_acquirer;
  /// STRING (required at the API)
  String? vu_nummer;

  MerchantPortalPamMerchantControllerCreateData({
    this.additional_data,
    this.businessRegistrationNumber,
    this.city,
    this.companyName,
    this.corporateUUID,
    this.country,
    this.currency,
    this.email,
    this.language,
    this.login,
    this.mandator,
    this.merchantContractNumber,
    this.merchantName,
    this.merchant_category_code,
    this.packageUUID,
    this.packageorderuuid,
    this.phoneNumber,
    this.postalCode,
    this.productid_acquirer,
    this.region,
    this.registrationNumber,
    this.signature,
    this.street,
    this.terminalIds,
    this.terminalid_acquirer,
    this.vu_nummer,
  });

  factory MerchantPortalPamMerchantControllerCreateData.fromMap(Map<String, dynamic> m) => MerchantPortalPamMerchantControllerCreateData(
        additional_data: m['additional_data'] is Map<String, dynamic> ? m['additional_data'] : null,
        businessRegistrationNumber: m['businessRegistrationNumber'] is String ? m['businessRegistrationNumber'] : null,
        city: m['city'] is String ? m['city'] : null,
        companyName: m['companyName'] is String ? m['companyName'] : null,
        corporateUUID: m['corporateUUID'] is String ? m['corporateUUID'] : null,
        country: m['country'] is String ? m['country'] : null,
        currency: m['currency'] is String ? m['currency'] : null,
        email: m['email'] is String ? m['email'] : null,
        language: m['language'] is String ? m['language'] : null,
        login: m['login'] is String ? m['login'] : null,
        mandator: m['mandator'] is String ? m['mandator'] : null,
        merchantContractNumber: m['merchantContractNumber'] is String ? m['merchantContractNumber'] : null,
        merchantName: m['merchantName'] is String ? m['merchantName'] : null,
        merchant_category_code: m['merchant_category_code'] is String ? m['merchant_category_code'] : null,
        packageUUID: m['packageUUID'] is String ? m['packageUUID'] : null,
        packageorderuuid: m['packageorderuuid'] is String ? m['packageorderuuid'] : null,
        phoneNumber: m['phoneNumber'] is String ? m['phoneNumber'] : null,
        postalCode: m['postalCode'] is String ? m['postalCode'] : null,
        productid_acquirer: m['productid_acquirer'] is String ? m['productid_acquirer'] : null,
        region: m['region'] is String ? m['region'] : null,
        registrationNumber: m['registrationNumber'] is String ? m['registrationNumber'] : null,
        signature: m['signature'] is String ? m['signature'] : null,
        street: m['street'] is String ? m['street'] : null,
        terminalIds: m['terminalIds'] is List<dynamic> ? m['terminalIds'] : null,
        terminalid_acquirer: m['terminalid_acquirer'] is String ? m['terminalid_acquirer'] : null,
        vu_nummer: m['vu_nummer'] is String ? m['vu_nummer'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != additional_data) {
      m['additional_data'] = additional_data;
    }
    if (null != businessRegistrationNumber) {
      m['businessRegistrationNumber'] = businessRegistrationNumber;
    }
    if (null != city) {
      m['city'] = city;
    }
    if (null != companyName) {
      m['companyName'] = companyName;
    }
    if (null != corporateUUID) {
      m['corporateUUID'] = corporateUUID;
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
    if (null != merchantContractNumber) {
      m['merchantContractNumber'] = merchantContractNumber;
    }
    if (null != merchantName) {
      m['merchantName'] = merchantName;
    }
    if (null != merchant_category_code) {
      m['merchant_category_code'] = merchant_category_code;
    }
    if (null != packageUUID) {
      m['packageUUID'] = packageUUID;
    }
    if (null != packageorderuuid) {
      m['packageorderuuid'] = packageorderuuid;
    }
    if (null != phoneNumber) {
      m['phoneNumber'] = phoneNumber;
    }
    if (null != postalCode) {
      m['postalCode'] = postalCode;
    }
    if (null != productid_acquirer) {
      m['productid_acquirer'] = productid_acquirer;
    }
    if (null != region) {
      m['region'] = region;
    }
    if (null != registrationNumber) {
      m['registrationNumber'] = registrationNumber;
    }
    if (null != signature) {
      m['signature'] = signature;
    }
    if (null != street) {
      m['street'] = street;
    }
    if (null != terminalIds) {
      m['terminalIds'] = terminalIds;
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
  String? consumerUUID;
  /// STRING
  String? corporateUUID;
  /// STRING
  String? country;
  /// STRING
  String? descriptionKey;
  /// OBJECT
  Map<String, dynamic>? filter;
  /// STRING (required at the API)
  String? language;
  /// STRING
  String? nameKey;
  /// STRING
  String? packageStatus;
  /// STRING (required at the API)
  String? packageUUID;
  /// OBJECT
  Map<String, dynamic>? pagination;
  /// OBJECT
  Map<String, dynamic>? sorting;

  MerchantPortalPamPackageController({
    this.consumerUUID,
    this.corporateUUID,
    this.country,
    this.descriptionKey,
    this.filter,
    this.language,
    this.nameKey,
    this.packageStatus,
    this.packageUUID,
    this.pagination,
    this.sorting,
  });

  factory MerchantPortalPamPackageController.fromMap(Map<String, dynamic> m) => MerchantPortalPamPackageController(
        consumerUUID: m['consumerUUID'] is String ? m['consumerUUID'] : null,
        corporateUUID: m['corporateUUID'] is String ? m['corporateUUID'] : null,
        country: m['country'] is String ? m['country'] : null,
        descriptionKey: m['descriptionKey'] is String ? m['descriptionKey'] : null,
        filter: m['filter'] is Map<String, dynamic> ? m['filter'] : null,
        language: m['language'] is String ? m['language'] : null,
        nameKey: m['nameKey'] is String ? m['nameKey'] : null,
        packageStatus: m['packageStatus'] is String ? m['packageStatus'] : null,
        packageUUID: m['packageUUID'] is String ? m['packageUUID'] : null,
        pagination: m['pagination'] is Map<String, dynamic> ? m['pagination'] : null,
        sorting: m['sorting'] is Map<String, dynamic> ? m['sorting'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != consumerUUID) {
      m['consumerUUID'] = consumerUUID;
    }
    if (null != corporateUUID) {
      m['corporateUUID'] = corporateUUID;
    }
    if (null != country) {
      m['country'] = country;
    }
    if (null != descriptionKey) {
      m['descriptionKey'] = descriptionKey;
    }
    if (null != filter) {
      m['filter'] = filter;
    }
    if (null != language) {
      m['language'] = language;
    }
    if (null != nameKey) {
      m['nameKey'] = nameKey;
    }
    if (null != packageStatus) {
      m['packageStatus'] = packageStatus;
    }
    if (null != packageUUID) {
      m['packageUUID'] = packageUUID;
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
  String? consumerUUID;
  /// STRING
  String? corporateUUID;
  /// STRING
  String? country;
  /// STRING
  String? descriptionKey;
  /// OBJECT
  Map<String, dynamic>? filter;
  /// STRING (required at the API)
  String? language;
  /// STRING
  String? nameKey;
  /// STRING
  String? packageStatus;
  /// STRING (required at the API)
  String? packageUUID;
  /// OBJECT
  Map<String, dynamic>? pagination;
  /// OBJECT
  Map<String, dynamic>? sorting;

  MerchantPortalPamPackageControllerCreateData({
    this.consumerUUID,
    this.corporateUUID,
    this.country,
    this.descriptionKey,
    this.filter,
    this.language,
    this.nameKey,
    this.packageStatus,
    this.packageUUID,
    this.pagination,
    this.sorting,
  });

  factory MerchantPortalPamPackageControllerCreateData.fromMap(Map<String, dynamic> m) => MerchantPortalPamPackageControllerCreateData(
        consumerUUID: m['consumerUUID'] is String ? m['consumerUUID'] : null,
        corporateUUID: m['corporateUUID'] is String ? m['corporateUUID'] : null,
        country: m['country'] is String ? m['country'] : null,
        descriptionKey: m['descriptionKey'] is String ? m['descriptionKey'] : null,
        filter: m['filter'] is Map<String, dynamic> ? m['filter'] : null,
        language: m['language'] is String ? m['language'] : null,
        nameKey: m['nameKey'] is String ? m['nameKey'] : null,
        packageStatus: m['packageStatus'] is String ? m['packageStatus'] : null,
        packageUUID: m['packageUUID'] is String ? m['packageUUID'] : null,
        pagination: m['pagination'] is Map<String, dynamic> ? m['pagination'] : null,
        sorting: m['sorting'] is Map<String, dynamic> ? m['sorting'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != consumerUUID) {
      m['consumerUUID'] = consumerUUID;
    }
    if (null != corporateUUID) {
      m['corporateUUID'] = corporateUUID;
    }
    if (null != country) {
      m['country'] = country;
    }
    if (null != descriptionKey) {
      m['descriptionKey'] = descriptionKey;
    }
    if (null != filter) {
      m['filter'] = filter;
    }
    if (null != language) {
      m['language'] = language;
    }
    if (null != nameKey) {
      m['nameKey'] = nameKey;
    }
    if (null != packageStatus) {
      m['packageStatus'] = packageStatus;
    }
    if (null != packageUUID) {
      m['packageUUID'] = packageUUID;
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
  String? consumerUUID;
  /// OBJECT
  Map<String, dynamic>? filter;
  /// STRING
  String? language;
  /// STRING
  String? merchantID;
  /// STRING (required at the API)
  String? packageOrderUUID;
  /// OBJECT
  Map<String, dynamic>? pagination;
  /// STRING (required at the API)
  String? productOrderUUID;
  /// STRING (required at the API)
  String? productUUID;
  /// STRING (required at the API)
  String? reason_decline;
  /// OBJECT
  Map<String, dynamic>? sorting;

  MerchantPortalPamProductController({
    this.consumerUUID,
    this.filter,
    this.language,
    this.merchantID,
    this.packageOrderUUID,
    this.pagination,
    this.productOrderUUID,
    this.productUUID,
    this.reason_decline,
    this.sorting,
  });

  factory MerchantPortalPamProductController.fromMap(Map<String, dynamic> m) => MerchantPortalPamProductController(
        consumerUUID: m['consumerUUID'] is String ? m['consumerUUID'] : null,
        filter: m['filter'] is Map<String, dynamic> ? m['filter'] : null,
        language: m['language'] is String ? m['language'] : null,
        merchantID: m['merchantID'] is String ? m['merchantID'] : null,
        packageOrderUUID: m['packageOrderUUID'] is String ? m['packageOrderUUID'] : null,
        pagination: m['pagination'] is Map<String, dynamic> ? m['pagination'] : null,
        productOrderUUID: m['productOrderUUID'] is String ? m['productOrderUUID'] : null,
        productUUID: m['productUUID'] is String ? m['productUUID'] : null,
        reason_decline: m['reason_decline'] is String ? m['reason_decline'] : null,
        sorting: m['sorting'] is Map<String, dynamic> ? m['sorting'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != consumerUUID) {
      m['consumerUUID'] = consumerUUID;
    }
    if (null != filter) {
      m['filter'] = filter;
    }
    if (null != language) {
      m['language'] = language;
    }
    if (null != merchantID) {
      m['merchantID'] = merchantID;
    }
    if (null != packageOrderUUID) {
      m['packageOrderUUID'] = packageOrderUUID;
    }
    if (null != pagination) {
      m['pagination'] = pagination;
    }
    if (null != productOrderUUID) {
      m['productOrderUUID'] = productOrderUUID;
    }
    if (null != productUUID) {
      m['productUUID'] = productUUID;
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
  String? consumerUUID;
  /// OBJECT
  Map<String, dynamic>? filter;
  /// STRING
  String? language;
  /// STRING
  String? merchantID;
  /// STRING (required at the API)
  String? packageOrderUUID;
  /// OBJECT
  Map<String, dynamic>? pagination;
  /// STRING (required at the API)
  String? productOrderUUID;
  /// STRING (required at the API)
  String? productUUID;
  /// STRING (required at the API)
  String? reason_decline;
  /// OBJECT
  Map<String, dynamic>? sorting;

  MerchantPortalPamProductControllerCreateData({
    this.consumerUUID,
    this.filter,
    this.language,
    this.merchantID,
    this.packageOrderUUID,
    this.pagination,
    this.productOrderUUID,
    this.productUUID,
    this.reason_decline,
    this.sorting,
  });

  factory MerchantPortalPamProductControllerCreateData.fromMap(Map<String, dynamic> m) => MerchantPortalPamProductControllerCreateData(
        consumerUUID: m['consumerUUID'] is String ? m['consumerUUID'] : null,
        filter: m['filter'] is Map<String, dynamic> ? m['filter'] : null,
        language: m['language'] is String ? m['language'] : null,
        merchantID: m['merchantID'] is String ? m['merchantID'] : null,
        packageOrderUUID: m['packageOrderUUID'] is String ? m['packageOrderUUID'] : null,
        pagination: m['pagination'] is Map<String, dynamic> ? m['pagination'] : null,
        productOrderUUID: m['productOrderUUID'] is String ? m['productOrderUUID'] : null,
        productUUID: m['productUUID'] is String ? m['productUUID'] : null,
        reason_decline: m['reason_decline'] is String ? m['reason_decline'] : null,
        sorting: m['sorting'] is Map<String, dynamic> ? m['sorting'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != consumerUUID) {
      m['consumerUUID'] = consumerUUID;
    }
    if (null != filter) {
      m['filter'] = filter;
    }
    if (null != language) {
      m['language'] = language;
    }
    if (null != merchantID) {
      m['merchantID'] = merchantID;
    }
    if (null != packageOrderUUID) {
      m['packageOrderUUID'] = packageOrderUUID;
    }
    if (null != pagination) {
      m['pagination'] = pagination;
    }
    if (null != productOrderUUID) {
      m['productOrderUUID'] = productOrderUUID;
    }
    if (null != productUUID) {
      m['productUUID'] = productUUID;
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
  String? packageUUID;
  /// ARRAY (required at the API)
  List<dynamic>? productUUIDs;
  /// INTEGER (required at the API)
  int? responseCode;
  /// STRING (required at the API)
  String? responseMessage;

  OutputAddProduct({
    this.packageUUID,
    this.productUUIDs,
    this.responseCode,
    this.responseMessage,
  });

  factory OutputAddProduct.fromMap(Map<String, dynamic> m) => OutputAddProduct(
        packageUUID: m['packageUUID'] is String ? m['packageUUID'] : null,
        productUUIDs: m['productUUIDs'] is List<dynamic> ? m['productUUIDs'] : null,
        responseCode: m['responseCode'] is int ? m['responseCode'] : null,
        responseMessage: m['responseMessage'] is String ? m['responseMessage'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != packageUUID) {
      m['packageUUID'] = packageUUID;
    }
    if (null != productUUIDs) {
      m['productUUIDs'] = productUUIDs;
    }
    if (null != responseCode) {
      m['responseCode'] = responseCode;
    }
    if (null != responseMessage) {
      m['responseMessage'] = responseMessage;
    }
    return m;
  }
}

class OutputAddProductCreateData {
  /// STRING (required at the API)
  String? packageUUID;
  /// ARRAY (required at the API)
  List<dynamic>? productUUIDs;
  /// INTEGER (required at the API)
  int? responseCode;
  /// STRING (required at the API)
  String? responseMessage;

  OutputAddProductCreateData({
    this.packageUUID,
    this.productUUIDs,
    this.responseCode,
    this.responseMessage,
  });

  factory OutputAddProductCreateData.fromMap(Map<String, dynamic> m) => OutputAddProductCreateData(
        packageUUID: m['packageUUID'] is String ? m['packageUUID'] : null,
        productUUIDs: m['productUUIDs'] is List<dynamic> ? m['productUUIDs'] : null,
        responseCode: m['responseCode'] is int ? m['responseCode'] : null,
        responseMessage: m['responseMessage'] is String ? m['responseMessage'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != packageUUID) {
      m['packageUUID'] = packageUUID;
    }
    if (null != productUUIDs) {
      m['productUUIDs'] = productUUIDs;
    }
    if (null != responseCode) {
      m['responseCode'] = responseCode;
    }
    if (null != responseMessage) {
      m['responseMessage'] = responseMessage;
    }
    return m;
  }
}

class OutputCreateProduct {
  /// STRING
  String? acquirerId;
  /// BOOLEAN (required at the API)
  bool? allowMultipleOrders;
  /// STRING (required at the API)
  String? appFormTemplateName;
  /// BOOLEAN (required at the API)
  bool? contractNeeded;
  /// BOOLEAN
  bool? credentialsNeeded;
  /// STRING (required at the API)
  String? descriptionKey;
  /// STRING (required at the API)
  String? nameKey;
  /// BOOLEAN (required at the API)
  bool? prescreeningAllowed;
  /// STRING (required at the API)
  String? productName;
  /// INTEGER (required at the API)
  int? responseCode;
  /// STRING (required at the API)
  String? responseMessage;
  /// STRING (required at the API)
  String? terminalTemplateName;
  /// STRING (required at the API)
  String? vendorName;
  /// STRING (required at the API)
  String? xmlTemplateFile;

  OutputCreateProduct({
    this.acquirerId,
    this.allowMultipleOrders,
    this.appFormTemplateName,
    this.contractNeeded,
    this.credentialsNeeded,
    this.descriptionKey,
    this.nameKey,
    this.prescreeningAllowed,
    this.productName,
    this.responseCode,
    this.responseMessage,
    this.terminalTemplateName,
    this.vendorName,
    this.xmlTemplateFile,
  });

  factory OutputCreateProduct.fromMap(Map<String, dynamic> m) => OutputCreateProduct(
        acquirerId: m['acquirerId'] is String ? m['acquirerId'] : null,
        allowMultipleOrders: m['allowMultipleOrders'] is bool ? m['allowMultipleOrders'] : null,
        appFormTemplateName: m['appFormTemplateName'] is String ? m['appFormTemplateName'] : null,
        contractNeeded: m['contractNeeded'] is bool ? m['contractNeeded'] : null,
        credentialsNeeded: m['credentialsNeeded'] is bool ? m['credentialsNeeded'] : null,
        descriptionKey: m['descriptionKey'] is String ? m['descriptionKey'] : null,
        nameKey: m['nameKey'] is String ? m['nameKey'] : null,
        prescreeningAllowed: m['prescreeningAllowed'] is bool ? m['prescreeningAllowed'] : null,
        productName: m['productName'] is String ? m['productName'] : null,
        responseCode: m['responseCode'] is int ? m['responseCode'] : null,
        responseMessage: m['responseMessage'] is String ? m['responseMessage'] : null,
        terminalTemplateName: m['terminalTemplateName'] is String ? m['terminalTemplateName'] : null,
        vendorName: m['vendorName'] is String ? m['vendorName'] : null,
        xmlTemplateFile: m['xmlTemplateFile'] is String ? m['xmlTemplateFile'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != acquirerId) {
      m['acquirerId'] = acquirerId;
    }
    if (null != allowMultipleOrders) {
      m['allowMultipleOrders'] = allowMultipleOrders;
    }
    if (null != appFormTemplateName) {
      m['appFormTemplateName'] = appFormTemplateName;
    }
    if (null != contractNeeded) {
      m['contractNeeded'] = contractNeeded;
    }
    if (null != credentialsNeeded) {
      m['credentialsNeeded'] = credentialsNeeded;
    }
    if (null != descriptionKey) {
      m['descriptionKey'] = descriptionKey;
    }
    if (null != nameKey) {
      m['nameKey'] = nameKey;
    }
    if (null != prescreeningAllowed) {
      m['prescreeningAllowed'] = prescreeningAllowed;
    }
    if (null != productName) {
      m['productName'] = productName;
    }
    if (null != responseCode) {
      m['responseCode'] = responseCode;
    }
    if (null != responseMessage) {
      m['responseMessage'] = responseMessage;
    }
    if (null != terminalTemplateName) {
      m['terminalTemplateName'] = terminalTemplateName;
    }
    if (null != vendorName) {
      m['vendorName'] = vendorName;
    }
    if (null != xmlTemplateFile) {
      m['xmlTemplateFile'] = xmlTemplateFile;
    }
    return m;
  }
}

class OutputCreateProductCreateData {
  /// STRING
  String? acquirerId;
  /// BOOLEAN (required at the API)
  bool? allowMultipleOrders;
  /// STRING (required at the API)
  String? appFormTemplateName;
  /// BOOLEAN (required at the API)
  bool? contractNeeded;
  /// BOOLEAN
  bool? credentialsNeeded;
  /// STRING (required at the API)
  String? descriptionKey;
  /// STRING (required at the API)
  String? nameKey;
  /// BOOLEAN (required at the API)
  bool? prescreeningAllowed;
  /// STRING (required at the API)
  String? productName;
  /// INTEGER (required at the API)
  int? responseCode;
  /// STRING (required at the API)
  String? responseMessage;
  /// STRING (required at the API)
  String? terminalTemplateName;
  /// STRING (required at the API)
  String? vendorName;
  /// STRING (required at the API)
  String? xmlTemplateFile;

  OutputCreateProductCreateData({
    this.acquirerId,
    this.allowMultipleOrders,
    this.appFormTemplateName,
    this.contractNeeded,
    this.credentialsNeeded,
    this.descriptionKey,
    this.nameKey,
    this.prescreeningAllowed,
    this.productName,
    this.responseCode,
    this.responseMessage,
    this.terminalTemplateName,
    this.vendorName,
    this.xmlTemplateFile,
  });

  factory OutputCreateProductCreateData.fromMap(Map<String, dynamic> m) => OutputCreateProductCreateData(
        acquirerId: m['acquirerId'] is String ? m['acquirerId'] : null,
        allowMultipleOrders: m['allowMultipleOrders'] is bool ? m['allowMultipleOrders'] : null,
        appFormTemplateName: m['appFormTemplateName'] is String ? m['appFormTemplateName'] : null,
        contractNeeded: m['contractNeeded'] is bool ? m['contractNeeded'] : null,
        credentialsNeeded: m['credentialsNeeded'] is bool ? m['credentialsNeeded'] : null,
        descriptionKey: m['descriptionKey'] is String ? m['descriptionKey'] : null,
        nameKey: m['nameKey'] is String ? m['nameKey'] : null,
        prescreeningAllowed: m['prescreeningAllowed'] is bool ? m['prescreeningAllowed'] : null,
        productName: m['productName'] is String ? m['productName'] : null,
        responseCode: m['responseCode'] is int ? m['responseCode'] : null,
        responseMessage: m['responseMessage'] is String ? m['responseMessage'] : null,
        terminalTemplateName: m['terminalTemplateName'] is String ? m['terminalTemplateName'] : null,
        vendorName: m['vendorName'] is String ? m['vendorName'] : null,
        xmlTemplateFile: m['xmlTemplateFile'] is String ? m['xmlTemplateFile'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != acquirerId) {
      m['acquirerId'] = acquirerId;
    }
    if (null != allowMultipleOrders) {
      m['allowMultipleOrders'] = allowMultipleOrders;
    }
    if (null != appFormTemplateName) {
      m['appFormTemplateName'] = appFormTemplateName;
    }
    if (null != contractNeeded) {
      m['contractNeeded'] = contractNeeded;
    }
    if (null != credentialsNeeded) {
      m['credentialsNeeded'] = credentialsNeeded;
    }
    if (null != descriptionKey) {
      m['descriptionKey'] = descriptionKey;
    }
    if (null != nameKey) {
      m['nameKey'] = nameKey;
    }
    if (null != prescreeningAllowed) {
      m['prescreeningAllowed'] = prescreeningAllowed;
    }
    if (null != productName) {
      m['productName'] = productName;
    }
    if (null != responseCode) {
      m['responseCode'] = responseCode;
    }
    if (null != responseMessage) {
      m['responseMessage'] = responseMessage;
    }
    if (null != terminalTemplateName) {
      m['terminalTemplateName'] = terminalTemplateName;
    }
    if (null != vendorName) {
      m['vendorName'] = vendorName;
    }
    if (null != xmlTemplateFile) {
      m['xmlTemplateFile'] = xmlTemplateFile;
    }
    return m;
  }
}

class OutputDetail {
  /// OBJECT
  Map<String, dynamic>? batch;
  /// OBJECT
  Map<String, dynamic>? lines;
  /// OBJECT
  Map<String, dynamic>? progress;

  OutputDetail({
    this.batch,
    this.lines,
    this.progress,
  });

  factory OutputDetail.fromMap(Map<String, dynamic> m) => OutputDetail(
        batch: m['batch'] is Map<String, dynamic> ? m['batch'] : null,
        lines: m['lines'] is Map<String, dynamic> ? m['lines'] : null,
        progress: m['progress'] is Map<String, dynamic> ? m['progress'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != batch) {
      m['batch'] = batch;
    }
    if (null != lines) {
      m['lines'] = lines;
    }
    if (null != progress) {
      m['progress'] = progress;
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
  List<dynamic>? items;
  /// OBJECT (required at the API)
  Map<String, dynamic>? pagination;
  /// INTEGER (required at the API)
  int? responseCode;
  /// STRING (required at the API)
  String? responseMessage;
  /// OBJECT
  Map<String, dynamic>? sorting;

  OutputList({
    this.items,
    this.pagination,
    this.responseCode,
    this.responseMessage,
    this.sorting,
  });

  factory OutputList.fromMap(Map<String, dynamic> m) => OutputList(
        items: m['items'] is List<dynamic> ? m['items'] : null,
        pagination: m['pagination'] is Map<String, dynamic> ? m['pagination'] : null,
        responseCode: m['responseCode'] is int ? m['responseCode'] : null,
        responseMessage: m['responseMessage'] is String ? m['responseMessage'] : null,
        sorting: m['sorting'] is Map<String, dynamic> ? m['sorting'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != items) {
      m['items'] = items;
    }
    if (null != pagination) {
      m['pagination'] = pagination;
    }
    if (null != responseCode) {
      m['responseCode'] = responseCode;
    }
    if (null != responseMessage) {
      m['responseMessage'] = responseMessage;
    }
    if (null != sorting) {
      m['sorting'] = sorting;
    }
    return m;
  }
}

class OutputListCreateData {
  /// ARRAY
  List<dynamic>? items;
  /// OBJECT (required at the API)
  Map<String, dynamic>? pagination;
  /// INTEGER (required at the API)
  int? responseCode;
  /// STRING (required at the API)
  String? responseMessage;
  /// OBJECT
  Map<String, dynamic>? sorting;

  OutputListCreateData({
    this.items,
    this.pagination,
    this.responseCode,
    this.responseMessage,
    this.sorting,
  });

  factory OutputListCreateData.fromMap(Map<String, dynamic> m) => OutputListCreateData(
        items: m['items'] is List<dynamic> ? m['items'] : null,
        pagination: m['pagination'] is Map<String, dynamic> ? m['pagination'] : null,
        responseCode: m['responseCode'] is int ? m['responseCode'] : null,
        responseMessage: m['responseMessage'] is String ? m['responseMessage'] : null,
        sorting: m['sorting'] is Map<String, dynamic> ? m['sorting'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != items) {
      m['items'] = items;
    }
    if (null != pagination) {
      m['pagination'] = pagination;
    }
    if (null != responseCode) {
      m['responseCode'] = responseCode;
    }
    if (null != responseMessage) {
      m['responseMessage'] = responseMessage;
    }
    if (null != sorting) {
      m['sorting'] = sorting;
    }
    return m;
  }
}

class OutputMessage {
  /// INTEGER (required at the API)
  int? responseCode;
  /// STRING (required at the API)
  String? responseMessage;

  OutputMessage({
    this.responseCode,
    this.responseMessage,
  });

  factory OutputMessage.fromMap(Map<String, dynamic> m) => OutputMessage(
        responseCode: m['responseCode'] is int ? m['responseCode'] : null,
        responseMessage: m['responseMessage'] is String ? m['responseMessage'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != responseCode) {
      m['responseCode'] = responseCode;
    }
    if (null != responseMessage) {
      m['responseMessage'] = responseMessage;
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
  List<dynamic>? productOrderUUIDs;
  /// INTEGER (required at the API)
  int? responseCode;
  /// STRING (required at the API)
  String? responseMessage;
  /// STRING (required at the API)
  String? targetPackageOrderUUID;
  /// STRING (required at the API)
  String? targetProductOrderUUID;

  OutputMoveTid({
    this.productOrderUUIDs,
    this.responseCode,
    this.responseMessage,
    this.targetPackageOrderUUID,
    this.targetProductOrderUUID,
  });

  factory OutputMoveTid.fromMap(Map<String, dynamic> m) => OutputMoveTid(
        productOrderUUIDs: m['productOrderUUIDs'] is List<dynamic> ? m['productOrderUUIDs'] : null,
        responseCode: m['responseCode'] is int ? m['responseCode'] : null,
        responseMessage: m['responseMessage'] is String ? m['responseMessage'] : null,
        targetPackageOrderUUID: m['targetPackageOrderUUID'] is String ? m['targetPackageOrderUUID'] : null,
        targetProductOrderUUID: m['targetProductOrderUUID'] is String ? m['targetProductOrderUUID'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != productOrderUUIDs) {
      m['productOrderUUIDs'] = productOrderUUIDs;
    }
    if (null != responseCode) {
      m['responseCode'] = responseCode;
    }
    if (null != responseMessage) {
      m['responseMessage'] = responseMessage;
    }
    if (null != targetPackageOrderUUID) {
      m['targetPackageOrderUUID'] = targetPackageOrderUUID;
    }
    if (null != targetProductOrderUUID) {
      m['targetProductOrderUUID'] = targetProductOrderUUID;
    }
    return m;
  }
}

class OutputMoveTidCreateData {
  /// ARRAY (required at the API)
  List<dynamic>? productOrderUUIDs;
  /// INTEGER (required at the API)
  int? responseCode;
  /// STRING (required at the API)
  String? responseMessage;
  /// STRING (required at the API)
  String? targetPackageOrderUUID;
  /// STRING (required at the API)
  String? targetProductOrderUUID;

  OutputMoveTidCreateData({
    this.productOrderUUIDs,
    this.responseCode,
    this.responseMessage,
    this.targetPackageOrderUUID,
    this.targetProductOrderUUID,
  });

  factory OutputMoveTidCreateData.fromMap(Map<String, dynamic> m) => OutputMoveTidCreateData(
        productOrderUUIDs: m['productOrderUUIDs'] is List<dynamic> ? m['productOrderUUIDs'] : null,
        responseCode: m['responseCode'] is int ? m['responseCode'] : null,
        responseMessage: m['responseMessage'] is String ? m['responseMessage'] : null,
        targetPackageOrderUUID: m['targetPackageOrderUUID'] is String ? m['targetPackageOrderUUID'] : null,
        targetProductOrderUUID: m['targetProductOrderUUID'] is String ? m['targetProductOrderUUID'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != productOrderUUIDs) {
      m['productOrderUUIDs'] = productOrderUUIDs;
    }
    if (null != responseCode) {
      m['responseCode'] = responseCode;
    }
    if (null != responseMessage) {
      m['responseMessage'] = responseMessage;
    }
    if (null != targetPackageOrderUUID) {
      m['targetPackageOrderUUID'] = targetPackageOrderUUID;
    }
    if (null != targetProductOrderUUID) {
      m['targetProductOrderUUID'] = targetProductOrderUUID;
    }
    return m;
  }
}

class OutputRemoveProduct {
  /// STRING (required at the API)
  String? packageUUID;
  /// ARRAY (required at the API)
  List<dynamic>? productUUIDs;
  /// INTEGER (required at the API)
  int? responseCode;
  /// STRING (required at the API)
  String? responseMessage;

  OutputRemoveProduct({
    this.packageUUID,
    this.productUUIDs,
    this.responseCode,
    this.responseMessage,
  });

  factory OutputRemoveProduct.fromMap(Map<String, dynamic> m) => OutputRemoveProduct(
        packageUUID: m['packageUUID'] is String ? m['packageUUID'] : null,
        productUUIDs: m['productUUIDs'] is List<dynamic> ? m['productUUIDs'] : null,
        responseCode: m['responseCode'] is int ? m['responseCode'] : null,
        responseMessage: m['responseMessage'] is String ? m['responseMessage'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != packageUUID) {
      m['packageUUID'] = packageUUID;
    }
    if (null != productUUIDs) {
      m['productUUIDs'] = productUUIDs;
    }
    if (null != responseCode) {
      m['responseCode'] = responseCode;
    }
    if (null != responseMessage) {
      m['responseMessage'] = responseMessage;
    }
    return m;
  }
}

class OutputRemoveProductCreateData {
  /// STRING (required at the API)
  String? packageUUID;
  /// ARRAY (required at the API)
  List<dynamic>? productUUIDs;
  /// INTEGER (required at the API)
  int? responseCode;
  /// STRING (required at the API)
  String? responseMessage;

  OutputRemoveProductCreateData({
    this.packageUUID,
    this.productUUIDs,
    this.responseCode,
    this.responseMessage,
  });

  factory OutputRemoveProductCreateData.fromMap(Map<String, dynamic> m) => OutputRemoveProductCreateData(
        packageUUID: m['packageUUID'] is String ? m['packageUUID'] : null,
        productUUIDs: m['productUUIDs'] is List<dynamic> ? m['productUUIDs'] : null,
        responseCode: m['responseCode'] is int ? m['responseCode'] : null,
        responseMessage: m['responseMessage'] is String ? m['responseMessage'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != packageUUID) {
      m['packageUUID'] = packageUUID;
    }
    if (null != productUUIDs) {
      m['productUUIDs'] = productUUIDs;
    }
    if (null != responseCode) {
      m['responseCode'] = responseCode;
    }
    if (null != responseMessage) {
      m['responseMessage'] = responseMessage;
    }
    return m;
  }
}

class OutputStart {
  /// STRING
  String? id;
  /// INTEGER (required at the API)
  int? responseCode;
  /// STRING (required at the API)
  String? responseMessage;

  OutputStart({
    this.id,
    this.responseCode,
    this.responseMessage,
  });

  factory OutputStart.fromMap(Map<String, dynamic> m) => OutputStart(
        id: m['id'] is String ? m['id'] : null,
        responseCode: m['responseCode'] is int ? m['responseCode'] : null,
        responseMessage: m['responseMessage'] is String ? m['responseMessage'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    if (null != responseCode) {
      m['responseCode'] = responseCode;
    }
    if (null != responseMessage) {
      m['responseMessage'] = responseMessage;
    }
    return m;
  }
}

class OutputStartCreateData {
  /// STRING
  String? id;
  /// INTEGER (required at the API)
  int? responseCode;
  /// STRING (required at the API)
  String? responseMessage;

  OutputStartCreateData({
    this.id,
    this.responseCode,
    this.responseMessage,
  });

  factory OutputStartCreateData.fromMap(Map<String, dynamic> m) => OutputStartCreateData(
        id: m['id'] is String ? m['id'] : null,
        responseCode: m['responseCode'] is int ? m['responseCode'] : null,
        responseMessage: m['responseMessage'] is String ? m['responseMessage'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    if (null != responseCode) {
      m['responseCode'] = responseCode;
    }
    if (null != responseMessage) {
      m['responseMessage'] = responseMessage;
    }
    return m;
  }
}

class OutputStatus {
  /// INTEGER
  int? percentage;
  /// INTEGER (required at the API)
  int? responseCode;
  /// STRING (required at the API)
  String? responseMessage;
  /// STRING
  String? status;

  OutputStatus({
    this.percentage,
    this.responseCode,
    this.responseMessage,
    this.status,
  });

  factory OutputStatus.fromMap(Map<String, dynamic> m) => OutputStatus(
        percentage: m['percentage'] is int ? m['percentage'] : null,
        responseCode: m['responseCode'] is int ? m['responseCode'] : null,
        responseMessage: m['responseMessage'] is String ? m['responseMessage'] : null,
        status: m['status'] is String ? m['status'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != percentage) {
      m['percentage'] = percentage;
    }
    if (null != responseCode) {
      m['responseCode'] = responseCode;
    }
    if (null != responseMessage) {
      m['responseMessage'] = responseMessage;
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
  bool? allowMultipleOrders;
  /// STRING
  String? appFormName;
  /// BOOLEAN
  bool? contractNeeded;
  /// BOOLEAN
  bool? credentialsNeeded;
  /// STRING
  String? descriptionKey;
  /// STRING
  String? nameKey;
  /// BOOLEAN
  bool? prescreeningAllowed;
  /// STRING
  String? productName;
  /// STRING
  String? productStatus;
  /// STRING (required at the API)
  String? productUUID;
  /// INTEGER (required at the API)
  int? responseCode;
  /// STRING (required at the API)
  String? responseMessage;
  /// STRING
  String? vendorName;

  OutputUpdateProduct({
    this.allowMultipleOrders,
    this.appFormName,
    this.contractNeeded,
    this.credentialsNeeded,
    this.descriptionKey,
    this.nameKey,
    this.prescreeningAllowed,
    this.productName,
    this.productStatus,
    this.productUUID,
    this.responseCode,
    this.responseMessage,
    this.vendorName,
  });

  factory OutputUpdateProduct.fromMap(Map<String, dynamic> m) => OutputUpdateProduct(
        allowMultipleOrders: m['allowMultipleOrders'] is bool ? m['allowMultipleOrders'] : null,
        appFormName: m['appFormName'] is String ? m['appFormName'] : null,
        contractNeeded: m['contractNeeded'] is bool ? m['contractNeeded'] : null,
        credentialsNeeded: m['credentialsNeeded'] is bool ? m['credentialsNeeded'] : null,
        descriptionKey: m['descriptionKey'] is String ? m['descriptionKey'] : null,
        nameKey: m['nameKey'] is String ? m['nameKey'] : null,
        prescreeningAllowed: m['prescreeningAllowed'] is bool ? m['prescreeningAllowed'] : null,
        productName: m['productName'] is String ? m['productName'] : null,
        productStatus: m['productStatus'] is String ? m['productStatus'] : null,
        productUUID: m['productUUID'] is String ? m['productUUID'] : null,
        responseCode: m['responseCode'] is int ? m['responseCode'] : null,
        responseMessage: m['responseMessage'] is String ? m['responseMessage'] : null,
        vendorName: m['vendorName'] is String ? m['vendorName'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != allowMultipleOrders) {
      m['allowMultipleOrders'] = allowMultipleOrders;
    }
    if (null != appFormName) {
      m['appFormName'] = appFormName;
    }
    if (null != contractNeeded) {
      m['contractNeeded'] = contractNeeded;
    }
    if (null != credentialsNeeded) {
      m['credentialsNeeded'] = credentialsNeeded;
    }
    if (null != descriptionKey) {
      m['descriptionKey'] = descriptionKey;
    }
    if (null != nameKey) {
      m['nameKey'] = nameKey;
    }
    if (null != prescreeningAllowed) {
      m['prescreeningAllowed'] = prescreeningAllowed;
    }
    if (null != productName) {
      m['productName'] = productName;
    }
    if (null != productStatus) {
      m['productStatus'] = productStatus;
    }
    if (null != productUUID) {
      m['productUUID'] = productUUID;
    }
    if (null != responseCode) {
      m['responseCode'] = responseCode;
    }
    if (null != responseMessage) {
      m['responseMessage'] = responseMessage;
    }
    if (null != vendorName) {
      m['vendorName'] = vendorName;
    }
    return m;
  }
}

class OutputUpdateProductCreateData {
  /// BOOLEAN
  bool? allowMultipleOrders;
  /// STRING
  String? appFormName;
  /// BOOLEAN
  bool? contractNeeded;
  /// BOOLEAN
  bool? credentialsNeeded;
  /// STRING
  String? descriptionKey;
  /// STRING
  String? nameKey;
  /// BOOLEAN
  bool? prescreeningAllowed;
  /// STRING
  String? productName;
  /// STRING
  String? productStatus;
  /// STRING (required at the API)
  String? productUUID;
  /// INTEGER (required at the API)
  int? responseCode;
  /// STRING (required at the API)
  String? responseMessage;
  /// STRING
  String? vendorName;

  OutputUpdateProductCreateData({
    this.allowMultipleOrders,
    this.appFormName,
    this.contractNeeded,
    this.credentialsNeeded,
    this.descriptionKey,
    this.nameKey,
    this.prescreeningAllowed,
    this.productName,
    this.productStatus,
    this.productUUID,
    this.responseCode,
    this.responseMessage,
    this.vendorName,
  });

  factory OutputUpdateProductCreateData.fromMap(Map<String, dynamic> m) => OutputUpdateProductCreateData(
        allowMultipleOrders: m['allowMultipleOrders'] is bool ? m['allowMultipleOrders'] : null,
        appFormName: m['appFormName'] is String ? m['appFormName'] : null,
        contractNeeded: m['contractNeeded'] is bool ? m['contractNeeded'] : null,
        credentialsNeeded: m['credentialsNeeded'] is bool ? m['credentialsNeeded'] : null,
        descriptionKey: m['descriptionKey'] is String ? m['descriptionKey'] : null,
        nameKey: m['nameKey'] is String ? m['nameKey'] : null,
        prescreeningAllowed: m['prescreeningAllowed'] is bool ? m['prescreeningAllowed'] : null,
        productName: m['productName'] is String ? m['productName'] : null,
        productStatus: m['productStatus'] is String ? m['productStatus'] : null,
        productUUID: m['productUUID'] is String ? m['productUUID'] : null,
        responseCode: m['responseCode'] is int ? m['responseCode'] : null,
        responseMessage: m['responseMessage'] is String ? m['responseMessage'] : null,
        vendorName: m['vendorName'] is String ? m['vendorName'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != allowMultipleOrders) {
      m['allowMultipleOrders'] = allowMultipleOrders;
    }
    if (null != appFormName) {
      m['appFormName'] = appFormName;
    }
    if (null != contractNeeded) {
      m['contractNeeded'] = contractNeeded;
    }
    if (null != credentialsNeeded) {
      m['credentialsNeeded'] = credentialsNeeded;
    }
    if (null != descriptionKey) {
      m['descriptionKey'] = descriptionKey;
    }
    if (null != nameKey) {
      m['nameKey'] = nameKey;
    }
    if (null != prescreeningAllowed) {
      m['prescreeningAllowed'] = prescreeningAllowed;
    }
    if (null != productName) {
      m['productName'] = productName;
    }
    if (null != productStatus) {
      m['productStatus'] = productStatus;
    }
    if (null != productUUID) {
      m['productUUID'] = productUUID;
    }
    if (null != responseCode) {
      m['responseCode'] = responseCode;
    }
    if (null != responseMessage) {
      m['responseMessage'] = responseMessage;
    }
    if (null != vendorName) {
      m['vendorName'] = vendorName;
    }
    return m;
  }
}

