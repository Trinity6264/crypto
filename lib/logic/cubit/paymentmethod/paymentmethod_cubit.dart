import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:crypto/model/payment_method_model.dart';
import 'package:crypto/repository/api_repo.dart';
import 'package:equatable/equatable.dart';

part 'paymentmethod_state.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodState> {
    final ApiRepo apiRepo;
  PaymentMethodCubit({required this.apiRepo}) : super(PaymentMethodInitial());

  Future<void> getPaymentMethod() async {
    try {
      emit(PaymentMethodLoading());
      final res = await apiRepo.getPaymentMethod();
      if (res.isNotEmpty) {
        emit(PaymentMethodSuccess(data: res));
        return;
      }
    } 
    on SocketException catch (_) {
      emit(const PaymentMethodFailure(
          errorMessage: 'Connection error,check your internet connection '));
    } on TimeoutException catch (_) {
      emit(const PaymentMethodFailure(
          errorMessage: 'Timeout,check your internet connection '));
    } on HandshakeException catch (e) {
      log(e.toString());
      emit(
        const PaymentMethodFailure(
            errorMessage: 'Something happened, Sorry try again 🥳'),
      );
    } catch (e) {
      log(e.runtimeType.toString());
      emit(
        const PaymentMethodFailure(
            errorMessage: 'Something happened, Sorry try again 🥳'),
      );
    }
  }
}
