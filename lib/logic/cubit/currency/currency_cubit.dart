import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:crypto/model/currency_model.dart';
import 'package:crypto/repository/api_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  final ApiRepo apiRepo;
  CurrencyCubit({required this.apiRepo}) : super(CurrencyInitial());

  Future<void> getCryptoCurrency() async {
    try {
      emit(CurrencyLoading());
      final res = await apiRepo.getCurrency();
      if (res.isNotEmpty) {
        emit(CurrencySuccess(currencies: res));
        return;
      }
    } on SocketException catch (_) {
      emit(const CurrencyFailed(
          errorMessage: 'Connection error,check your internet connection '));
    } on TimeoutException catch (_) {
      emit(const CurrencyFailed(
          errorMessage: 'Timeout,check your internet connection '));
      emit(
        const CurrencyFailed(
            errorMessage: 'Something happened, Sorry try again 🥳'),
      );
    } catch (e) {
      
      emit(
        const CurrencyFailed(
            errorMessage: 'Something happened, Sorry try again 🥳'),
      );
    }
  }
}
