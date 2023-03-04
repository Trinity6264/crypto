// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'selected_payment_option_cubit.dart';

abstract class SelectedPaymentOptionState extends Equatable {
  const SelectedPaymentOptionState();

  @override
  List<Object> get props => [];
}

class SelectedPaymentOptionInitial extends SelectedPaymentOptionState {}

class SelectedPaymentOptionAdded extends SelectedPaymentOptionState {
  final PaymentOptions paymentOptions;
  const SelectedPaymentOptionAdded({required this.paymentOptions});
    @override
  List<Object> get props => [paymentOptions];
}
