import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:crypto/logic/cubit/selected_payment/selected_currency_fiat_cubit.dart';
import 'package:crypto/repository/api_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../model/payment_method_model.dart';

part 'currency_fiat_state.dart';

class CurrencyFiatCubit extends Cubit<CurrencyFiatState> {
  final ApiRepo apiRepo;
  CurrencyFiatCubit({required this.apiRepo}) : super(CurrencyFiatInitial());

  Future<void> getCurrencyFiat() async {
    try {
      emit(CurrencyFiatLoading());
      final res = await apiRepo.getCurrencyFiat();
      if (res.isNotEmpty) {
        SelectedCurrencyFiatCubit().setSelectedCurrencyFiat(currencyFiatModel: res[0]);
        emit(CurrencyFiatSuccess(data: res));
        return;
      }
    } on SocketException catch (_) {
      emit(const CurrencyFiatFailure(
          errorMessage: 'Connection error,check your internet connection '));
    } on TimeoutException catch (_) {
      emit(const CurrencyFiatFailure(
          errorMessage: 'Timeout,check your internet connection '));
    } on HandshakeException catch (e) {
      log(e.toString());
      emit(
        const CurrencyFiatFailure(
            errorMessage: 'Something happened, Sorry try again 🥳'),
      );
    } catch (e) {
      log(e.runtimeType.toString());
      emit(
        const CurrencyFiatFailure(
            errorMessage: 'Something happened, Sorry try again 🥳'),
      );
    }
  }
}
