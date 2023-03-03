part of 'currency_cubit.dart';

@immutable
abstract class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}

class CurrencyInitial extends CurrencyState {}

class CurrencyLoading extends CurrencyState {}

class CurrencySuccess extends CurrencyState {
  final List<CurrencyModel> currencies;
  const CurrencySuccess({required this.currencies});

  @override
  List<Object> get props => [currencies];
}

class CurrencyFailed extends CurrencyState {
  final String errorMessage;
  const CurrencyFailed({required this.errorMessage});
 
  @override
  List<Object> get props => [errorMessage];
}
