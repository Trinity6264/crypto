// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'selected_currency_fiat_cubit.dart';

abstract class SelectedCurrencyFiatState extends Equatable {
  const SelectedCurrencyFiatState();

  @override
  List<Object> get props => [];
}

class SelectedCurrencyFiatInitial extends SelectedCurrencyFiatState {}

class SelectedCurrencyFiatSelected extends SelectedCurrencyFiatState {
  final CurrencyFiatModel currencyFiatModel;
  const SelectedCurrencyFiatSelected({required this.currencyFiatModel});

  @override
  List<Object> get props => [currencyFiatModel];
}
