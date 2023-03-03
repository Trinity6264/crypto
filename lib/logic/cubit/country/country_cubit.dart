import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:crypto/model/country_model.dart';
import 'package:crypto/repository/api_repo.dart';
import 'package:equatable/equatable.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
    final ApiRepo apiRepo;
  CountryCubit({required this.apiRepo}) : super(CountryInitial());

   Future<void> getCryptoCountry() async {
    try {
      emit(CountryLoading());
      final res = await apiRepo.getCountry();
      if (res.isNotEmpty) {
        emit(CountrySuccess(countries: res));
        return;
      }
    } on SocketException catch (_) {
      emit(const CountryFailed(
          errorMessage: 'Connection error,check your internet connection '));
    } on TimeoutException catch (_) {
      emit(const CountryFailed(
          errorMessage: 'Timeout,check your internet connection '));
    } on HandshakeException catch (e) {
      log(e.toString());
      emit(
        const CountryFailed(
            errorMessage: 'Something happened, Sorry try again 🥳'),
      );
    } catch (e) {
      log(e.runtimeType.toString());
      emit(
        const CountryFailed(
            errorMessage: 'Something happened, Sorry try again 🥳'),
      );
    }
  }
}
