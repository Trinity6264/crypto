// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'price_cubit.dart';

abstract class PriceState extends Equatable {
  const PriceState();

  @override
  List<Object> get props => [];
}

class PriceInitial extends PriceState {}

class PriceLoading extends PriceState {}

class PriceSuccess extends PriceState {
  final PriceModel priceModel;
  const PriceSuccess({required this.priceModel});
  @override
  List<Object> get props => [];
}

class PriceFailure extends PriceState {
  final String errorMessage;
  const PriceFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
