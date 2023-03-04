// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'paymentmethod_cubit.dart';

abstract class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object> get props => [];
}

class PaymentMethodInitial extends PaymentMethodState {}

class PaymentMethodLoading extends PaymentMethodState {}

class PaymentMethodSuccess extends PaymentMethodState {
  final List<PaymentMethodModel> data;
  const PaymentMethodSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class PaymentMethodFailure extends PaymentMethodState {
  final String errorMessage;
  const PaymentMethodFailure({
    required this.errorMessage,
  });
  @override
  List<Object> get props => [errorMessage];
}
