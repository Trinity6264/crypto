// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'selected_paymethod_cubit.dart';

abstract class SelectedPayMethodState extends Equatable {
  const SelectedPayMethodState();

  @override
  List<Object> get props => [];
}

class SelectedPayMethodInitial extends SelectedPayMethodState {}

class SelectedPayMethodSelected extends SelectedPayMethodState {
  final PaymentMethodModel paymentMethodModel;
  const SelectedPayMethodSelected({required this.paymentMethodModel});

  @override
  List<Object> get props => [paymentMethodModel];
}
