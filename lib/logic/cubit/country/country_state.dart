// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'country_cubit.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountrySuccess extends CountryState {
  final List<CountryModel> countries;
  const CountrySuccess({required this.countries});

  @override
  List<Object> get props => [countries];
}

class CountryFailed extends CountryState {
  final String errorMessage;

  const CountryFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
