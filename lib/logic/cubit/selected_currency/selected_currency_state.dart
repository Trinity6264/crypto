// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'selected_currency_cubit.dart';

abstract class SelectedCurrencyState extends Equatable {
  const SelectedCurrencyState();

  @override
  List<Object> get props => [];
}

class SelectedCurrencyInitial extends SelectedCurrencyState {}

class SelectedCurrencyApproved extends SelectedCurrencyState {
  final CurrencyModel currencyModel;
  const SelectedCurrencyApproved({required this.currencyModel});

  @override
  List<Object> get props => [currencyModel];
}
