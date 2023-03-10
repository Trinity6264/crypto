import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:crypto/model/price_model.dart';
import 'package:crypto/repository/api_repo.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'price_state.dart';

class PriceCubit extends Cubit<PriceState> {
  final ApiRepo apiRepo;
  PriceCubit({required this.apiRepo}) : super(PriceInitial());

  Future<void> getPriceDetails({
    required String fiatCurrency,
    required String cryptoCurrency,
    required String paymentMethod,
    required String amount,
    required String network,
  }) async {
    try {
      emit(PriceLoading());
      final res = await apiRepo.getPriceDetail(
          amount: amount,
          cryptoCurrency: cryptoCurrency,
          fiatCurrency: fiatCurrency,
          network: network,
          paymentMethod: paymentMethod);
      emit(PriceSuccess(priceModel: res));
    } on SocketException catch (e) {
      emit(PriceFailure(errorMessage: e.message));
    } on TimeoutException catch (_) {
      emit(const PriceFailure(
          errorMessage: 'Timeout,check your internet connection '));
    } on HandshakeException catch (_) {
      emit(
        const PriceFailure(
            errorMessage: 'Something happened, Sorry try again 🥳'),
      );
    } on DioError catch (e) {
      emit(
        PriceFailure(
            errorMessage: e.response?.data['error']['message'] ??
                'Something happened, Sorry try again 🥳'),
      );
    } catch (e) {
      emit(
        const PriceFailure(
            errorMessage: 'Something happened, Sorry try again 🥳'),
      );
    }
  }
}
