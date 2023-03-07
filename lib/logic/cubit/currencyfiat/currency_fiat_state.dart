// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'currency_fiat_cubit.dart';

abstract class CurrencyFiatState extends Equatable {
  const CurrencyFiatState();

  @override
  List<Object> get props => [];
}

class CurrencyFiatInitial extends CurrencyFiatState {}

class CurrencyFiatLoading extends CurrencyFiatState {}

class CurrencyFiatSuccess extends CurrencyFiatState {
  final List<CurrencyFiatModel> data;
  const CurrencyFiatSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class CurrencyFiatFailure extends CurrencyFiatState {
  final String errorMessage;
  const CurrencyFiatFailure({
    required this.errorMessage,
  });
  @override
  List<Object> get props => [errorMessage];
}
