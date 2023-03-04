import 'dart:developer';

import 'package:crypto/app/service_locator.dart';
import 'package:crypto/model/country_model.dart';
import 'package:crypto/model/currency_model.dart';
import 'package:crypto/model/payment_method_model.dart';
import 'package:crypto/service/api_service.dart';

class ApiRepo {
  final apiService = locator.get<ApiService>();

  Future<List<CurrencyModel>> getCurrency() async {
    final res = await apiService.getCurrencies();
    if (res.statusCode != 200) throw Exception({});
    List<dynamic> data = res.data['response'] as List<dynamic>;
    List<CurrencyModel> currency =
        data.map((e) => CurrencyModel.fromJson(e)).toList();
    return currency;
  }


  Future<List<CountryModel>> getCountry() async {
    final res = await apiService.getCountry();
    if (res.statusCode != 200) throw Exception({});
    List<dynamic> data = res.data['response'] as List<dynamic>;
    List<CountryModel> countries =
        data.map((e) => CountryModel.fromJson(e)).toList();
    return countries;
  }
  Future<List<PaymentMethodModel>> getPaymentMethod() async {
    final res = await apiService.getPaymentMethod();
    if (res.statusCode != 200) throw Exception({});
    log(res.data.toString());
    List<dynamic> data = res.data['response'] as List<dynamic>;
    List<PaymentMethodModel> methods =
        data.map((e) => PaymentMethodModel.fromJson(e)).toList();
    return methods;
  }
}
