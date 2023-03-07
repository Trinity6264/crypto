class PriceModel {
  String? quoteId;
  double? conversionPrice;
  double? marketConversionPrice;
  double? slippage;
  String? fiatCurrency;
  String? cryptoCurrency;
  String? paymentMethod;
  String? processingTime;
  int? processingTimeInSec;
  int? fiatAmount;
  double? cryptoAmount;
  String? isBuyOrSell;
  String? network;
  double? feeDecimal;
  double? totalFee;
  List<FeeBreakdown>? feeBreakdown;
  int? nonce;
  String? cryptoLiquidityProvider;
  String? note;

  PriceModel(
      {this.quoteId,
      this.conversionPrice,
      this.marketConversionPrice,
      this.slippage,
      this.fiatCurrency,
      this.cryptoCurrency,
      this.paymentMethod,
      this.processingTime,
      this.processingTimeInSec,
      this.fiatAmount,
      this.cryptoAmount,
      this.isBuyOrSell,
      this.network,
      this.feeDecimal,
      this.totalFee,
      this.feeBreakdown,
      this.nonce,
      this.cryptoLiquidityProvider,
      this.note});

  PriceModel.fromJson(Map<String, dynamic> json) {
    quoteId = json['quoteId'];
    conversionPrice = json['conversionPrice'];
    marketConversionPrice = json['marketConversionPrice'];
    slippage = json['slippage'];
    fiatCurrency = json['fiatCurrency'];
    cryptoCurrency = json['cryptoCurrency'];
    paymentMethod = json['paymentMethod'];
    processingTime = json['processingTime'];
    processingTimeInSec = json['processingTimeInSec'];
    fiatAmount = json['fiatAmount'];
    cryptoAmount = json['cryptoAmount'];
    isBuyOrSell = json['isBuyOrSell'];
    network = json['network'];
    feeDecimal = json['feeDecimal'];
    totalFee = json['totalFee'];
    if (json['feeBreakdown'] != null) {
      feeBreakdown = <FeeBreakdown>[];
      json['feeBreakdown'].forEach((v) {
        feeBreakdown!.add(FeeBreakdown.fromJson(v));
      });
    }
    nonce = json['nonce'];
    cryptoLiquidityProvider = json['cryptoLiquidityProvider'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quoteId'] = quoteId;
    data['conversionPrice'] = conversionPrice;
    data['marketConversionPrice'] = marketConversionPrice;
    data['slippage'] = slippage;
    data['fiatCurrency'] = fiatCurrency;
    data['cryptoCurrency'] = cryptoCurrency;
    data['paymentMethod'] = paymentMethod;
    data['processingTime'] = processingTime;
    data['processingTimeInSec'] = processingTimeInSec;
    data['fiatAmount'] = fiatAmount;
    data['cryptoAmount'] = cryptoAmount;
    data['isBuyOrSell'] = isBuyOrSell;
    data['network'] = network;
    data['feeDecimal'] = feeDecimal;
    data['totalFee'] = totalFee;
    if (feeBreakdown != null) {
      data['feeBreakdown'] = feeBreakdown!.map((v) => v.toJson()).toList();
    }
    data['nonce'] = nonce;
    data['cryptoLiquidityProvider'] = cryptoLiquidityProvider;
    data['note'] = note;
    return data;
  }
}

class FeeBreakdown {
  String? name;
  num? value;
  String? id;
  List<String>? ids;

  FeeBreakdown({this.name, this.value, this.id, this.ids});

  FeeBreakdown.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    id = json['id'];
    ids = json['ids'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    data['id'] = id;
    data['ids'] = ids;
    return data;
  }
}
