part of 'internet_bloc.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetInitial extends InternetState {}

class InternetConnected extends InternetState {
    final String message;

   const InternetConnected(this.message);
     @override
  List<Object> get props => [message];
}

class InternetDisConnected extends InternetState {
  final String message;

  const InternetDisConnected(this.message);
  @override
  List<Object> get props => [message];
}