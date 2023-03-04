import 'package:dio/dio.dart';

class ApiService {
  Dio dioService = Dio(BaseOptions(
    baseUrl: 'https://api-stg.transak.com/',
    connectTimeout: const Duration(seconds: 30),
  ));

  // get all crypto currencies
  Future<Response> getCurrencies() async {
    final resp = await dioService.get('api/v2/currencies/crypto-currencies');
    return resp;
  }

  // get all crypto country
  Future<Response> getCountry() async {
    final resp = await dioService.get('api/v2/countries');
    return resp;
  }
  // get all crypto currency payment method
  Future<Response> getPaymentMethod() async {
    final resp = await dioService.get('api/v2/currencies/fiat-currencies');
    return resp;
  }
}
