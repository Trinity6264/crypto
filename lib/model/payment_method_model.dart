class CurrencyFiatModel {
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

  CurrencyFiatModel(
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

  CurrencyFiatModel.fromJson(Map<String, dynamic> json) {
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

  
}
