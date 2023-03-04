class PaymentMethodModel {
  String? symbol;
  List<dynamic>? supportingCountries;
  String? logoSymbol;
  String? name;
  bool? isPopular;
  bool? isAllowed;
  List<PaymentOptions>? paymentOptions;
  int? roundOff;
  String? icon;
  bool? isPayOutAllowed;

  PaymentMethodModel(
      {this.symbol,
      this.supportingCountries,
      this.logoSymbol,
      this.name,
      this.isPopular,
      this.isAllowed,
      this.paymentOptions,
      this.roundOff,
      this.icon,
      this.isPayOutAllowed});

  PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    supportingCountries = json['supportingCountries'];
    logoSymbol = json['logoSymbol'];
    name = json['name'];
    isPopular = json['isPopular'];
    isAllowed = json['isAllowed'];
    if (json['paymentOptions'] != null) {
      paymentOptions = <PaymentOptions>[];
      json['paymentOptions'].forEach((v) {
        paymentOptions!.add(PaymentOptions.fromJson(v));
      });
    }
    roundOff = json['roundOff'];
    icon = json['icon'];
    isPayOutAllowed = json['isPayOutAllowed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symbol'] = symbol;
    data['supportingCountries'] = supportingCountries;
    data['logoSymbol'] = logoSymbol;
    data['name'] = name;
    data['isPopular'] = isPopular;
    data['isAllowed'] = isAllowed;
    if (paymentOptions != null) {
      data['paymentOptions'] =
          paymentOptions!.map((v) => v.toJson()).toList();
    }
    data['roundOff'] = roundOff;
    data['icon'] = icon;
    data['isPayOutAllowed'] = isPayOutAllowed;
    return data;
  }
}

class PaymentOptions {
  String? name;
  String? id;
  bool? displayText;
  String? processingTime;
  String? icon;
  int? dailyLimit;
  String? limitCurrency;
  int? maxAmount;
  int? minAmount;
  bool? isActive;
  bool? isPayOutAllowed;
  int? minAmountForPayOut;
  int? maxAmountForPayOut;
  int? defaultAmountForPayOut;
  int? defaultAmount;
  bool? isConverted;
  String? provider;
  bool? isBillingAddressRequired;
  List<dynamic>? supportedCountryCode;
  bool? isNftAllowed;
  bool? isNonCustodial;

  PaymentOptions(
      {this.name,
      this.id,
      this.displayText,
      this.processingTime,
      this.icon,
      this.dailyLimit,
      this.limitCurrency,
      this.maxAmount,
      this.minAmount,
      this.isActive,
      this.isPayOutAllowed,
      this.minAmountForPayOut,
      this.maxAmountForPayOut,
      this.defaultAmountForPayOut,
      this.defaultAmount,
      this.isConverted,
      this.provider,
      this.isBillingAddressRequired,
      this.supportedCountryCode,
      this.isNftAllowed,
      this.isNonCustodial});

  PaymentOptions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    displayText = json['displayText'];
    processingTime = json['processingTime'];
    icon = json['icon'];
    dailyLimit = json['dailyLimit'];
    limitCurrency = json['limitCurrency'];
    maxAmount = json['maxAmount'];
    minAmount = json['minAmount'];
    isActive = json['isActive'];
    isPayOutAllowed = json['isPayOutAllowed'];
    minAmountForPayOut = json['minAmountForPayOut'];
    maxAmountForPayOut = json['maxAmountForPayOut'];
    defaultAmountForPayOut = json['defaultAmountForPayOut'];
    defaultAmount = json['defaultAmount'];
    isConverted = json['isConverted'];
    provider = json['provider'];
    isBillingAddressRequired = json['isBillingAddressRequired'];
    supportedCountryCode = json['supportedCountryCode'] ?? [];
    isNftAllowed = json['isNftAllowed'];
    isNonCustodial = json['isNonCustodial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['displayText'] = displayText;
    data['processingTime'] = processingTime;
    data['icon'] = icon;
    data['dailyLimit'] = dailyLimit;
    data['limitCurrency'] = limitCurrency;
    data['maxAmount'] = maxAmount;
    data['minAmount'] = minAmount;
    data['isActive'] = isActive;
    data['isPayOutAllowed'] = isPayOutAllowed;
    data['minAmountForPayOut'] = minAmountForPayOut;
    data['maxAmountForPayOut'] = maxAmountForPayOut;
    data['defaultAmountForPayOut'] = defaultAmountForPayOut;
    data['defaultAmount'] = defaultAmount;
    data['isConverted'] = isConverted;
    data['provider'] = provider;
    data['isBillingAddressRequired'] = isBillingAddressRequired;
    data['supportedCountryCode'] = supportedCountryCode;
    data['isNftAllowed'] = isNftAllowed;
    data['isNonCustodial'] = isNonCustodial;
    return data;
  }
}
