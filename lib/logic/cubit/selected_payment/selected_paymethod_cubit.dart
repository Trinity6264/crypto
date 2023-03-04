import 'package:bloc/bloc.dart';
import 'package:crypto/model/payment_method_model.dart';
import 'package:equatable/equatable.dart';

part 'selected_paymethod_state.dart';

class SelectedPayMethodCubit extends Cubit<SelectedPayMethodState> {
  SelectedPayMethodCubit() : super(SelectedPayMethodInitial());

  void setSelectedPaymentMethod({
    required PaymentMethodModel paymentMethodModel,
  }) {
    emit(SelectedPayMethodSelected(paymentMethodModel: paymentMethodModel));
  }
}
