import 'package:dio/dio.dart';

class ApiService {
  Dio dioService = Dio(BaseOptions(
    baseUrl: 'https://api-stg.transak.com/',
  ));

  // get all crypto currencies
  Future<Response> getCurrencies() async {
    final resp = await dioService.get('api/v2/currencies/crypto-currencies');
    return resp;
  }
}
