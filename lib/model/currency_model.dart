class CurrencyModel {
  String? sId;
  String? coinId;
  bool? addressAdditionalData;
  String? createdAt;
  Image? image;
  bool? isAllowed;
  bool? isPopular;
  bool? isStable;
  String? name;
  int? roundOff;
  String? symbol;
  bool? isSuspended;
  Image? imageBk;
  Network? network;
  String? uniqueId;
  String? tokenType;
  String? address;
  String? tokenIdentifier;
  bool? isPayInAllowed;
  String? minAmountForPayIn;
  String? maxAmountForPayIn;

  CurrencyModel(
      {this.sId,
      this.coinId,
      this.addressAdditionalData,
      this.createdAt,
      this.image,
      this.isAllowed,
      this.isPopular,
      this.isStable,
      this.name,
      this.roundOff,
      this.symbol,
      this.isSuspended,
      this.imageBk,
      this.network,
      this.uniqueId,
      this.tokenType,
      this.address,
      this.tokenIdentifier,
      this.isPayInAllowed,
      this.minAmountForPayIn,
      this.maxAmountForPayIn});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    coinId = json['coinId'];
    createdAt = json['createdAt'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    isAllowed = json['isAllowed'];
    isPopular = json['isPopular'];
    isStable = json['isStable'];
    name = json['name'];
    roundOff = json['roundOff'];
    symbol = json['symbol'];
    isSuspended = json['isSuspended'];
    imageBk =
        json['image_bk'] != null ? Image.fromJson(json['image_bk']) : null;
    network =
        json['network'] != null ? Network.fromJson(json['network']) : null;
    uniqueId = json['uniqueId'];
    tokenType = json['tokenType'];
    address = json['address'];
    tokenIdentifier = json['tokenIdentifier'];
    isPayInAllowed = json['isPayInAllowed'];
    minAmountForPayIn = json['minAmountForPayIn'];
    maxAmountForPayIn = json['maxAmountForPayIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['coinId'] = coinId;
    data['addressAdditionalData'] = addressAdditionalData;
    data['createdAt'] = createdAt;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['isAllowed'] = isAllowed;
    data['isPopular'] = isPopular;
    data['isStable'] = isStable;
    data['name'] = name;
    data['roundOff'] = roundOff;
    data['symbol'] = symbol;
    data['isSuspended'] = isSuspended;
    if (imageBk != null) {
      data['image_bk'] = imageBk!.toJson();
    }
    if (network != null) {
      data['network'] = network!.toJson();
    }
    data['uniqueId'] = uniqueId;
    data['tokenType'] = tokenType;
    data['address'] = address;
    data['tokenIdentifier'] = tokenIdentifier;
    data['isPayInAllowed'] = isPayInAllowed;
    data['minAmountForPayIn'] = minAmountForPayIn;
    data['maxAmountForPayIn'] = maxAmountForPayIn;
    return data;
  }
}

class Image {
  String? large;
  String? small;
  String? thumb;

  Image({this.large, this.small, this.thumb});

  Image.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    small = json['small'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['large'] = large;
    data['small'] = small;
    data['thumb'] = thumb;
    return data;
  }
}

class Network {
  String? name;
  List<FiatCurrenciesNotSupported>? fiatCurrenciesNotSupported;
  String? chainId;

  Network({this.name, this.fiatCurrenciesNotSupported, this.chainId});

  Network.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['fiatCurrenciesNotSupported'] != null) {
      fiatCurrenciesNotSupported = <FiatCurrenciesNotSupported>[];
      json['fiatCurrenciesNotSupported'].forEach((v) {
        fiatCurrenciesNotSupported!.add(FiatCurrenciesNotSupported.fromJson(v));
      });
    }
    chainId = json['chainId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (fiatCurrenciesNotSupported != null) {
      data['fiatCurrenciesNotSupported'] =
          fiatCurrenciesNotSupported!.map((v) => v.toJson()).toList();
    }
    data['chainId'] = chainId;
    return data;
  }
}

class FiatCurrenciesNotSupported {
  String? fiatCurrency;
  String? paymentMethod;

  FiatCurrenciesNotSupported({this.fiatCurrency, this.paymentMethod});

  FiatCurrenciesNotSupported.fromJson(Map<String, dynamic> json) {
    fiatCurrency = json['fiatCurrency'];
    paymentMethod = json['paymentMethod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fiatCurrency'] = fiatCurrency;
    data['paymentMethod'] = paymentMethod;
    return data;
  }
}
