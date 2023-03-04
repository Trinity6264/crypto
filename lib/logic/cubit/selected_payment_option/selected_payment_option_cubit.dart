import 'package:bloc/bloc.dart';
import 'package:crypto/model/payment_method_model.dart';
import 'package:equatable/equatable.dart';

part 'selected_payment_option_state.dart';

class SelectedPaymentOptionCubit extends Cubit<SelectedPaymentOptionState> {
  SelectedPaymentOptionCubit() : super(SelectedPaymentOptionInitial());

  void getPaymentOption({required PaymentOptions paymentOption}) {
    emit(SelectedPaymentOptionAdded(paymentOptions: paymentOption));
  }
}
