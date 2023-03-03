class CountryModel {
  String? alpha2;
  String? alpha3;
  bool? isAllowed;
  bool? isLightKycAllowed;
  String? name;
  List<String>? supportedDocuments;
  String? currencyCode;

  CountryModel(
      {this.alpha2,
      this.alpha3,
      this.isAllowed,
      this.isLightKycAllowed,
      this.name,
      this.supportedDocuments,
      this.currencyCode});

  CountryModel.fromJson(Map<String, dynamic> json) {
    alpha2 = json['alpha2'];
    alpha3 = json['alpha3'];
    isAllowed = json['isAllowed'];
    isLightKycAllowed = json['isLightKycAllowed'];
    name = json['name'];
    supportedDocuments = json['supportedDocuments'].cast<String>();
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['alpha2'] = alpha2;
    data['alpha3'] = alpha3;
    data['isAllowed'] = isAllowed;
    data['isLightKycAllowed'] = isLightKycAllowed;
    data['name'] = name;
    data['supportedDocuments'] = supportedDocuments;
    data['currencyCode'] = currencyCode;
    return data;
  }
}
