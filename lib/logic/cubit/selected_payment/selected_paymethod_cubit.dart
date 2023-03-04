import 'package:bloc/bloc.dart';
import 'package:crypto/model/payment_method_model.dart';
import 'package:equatable/equatable.dart';

part 'selected_paymethod_state.dart';

class SelectedPayMethodCubit extends Cubit<SelectedPayMethodState> {
  SelectedPayMethodCubit() : super(SelectedPayMethodInitial());

  static PaymentMethodModel? _paymentMethod;
  // getter
  PaymentMethodModel? get paymentMethod => _paymentMethod;

// setter
  void setPaymentMethod(PaymentMethodModel paymentMethod) {
    _paymentMethod = paymentMethod;
  }

  void setSelectedPaymentMethod(
      {required PaymentMethodModel paymentMethodModel}) {
    setPaymentMethod(paymentMethodModel);
    emit(SelectedPayMethodSelected(paymentMethodModel: paymentMethodModel));
  }
}
