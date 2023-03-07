part of 'internet_bloc.dart';

abstract class InternetEvent extends Equatable {
  const InternetEvent();

  @override
  List<Object> get props => [];
}

class InternetConnectedEvent extends InternetEvent {
  const InternetConnectedEvent() : super();
  @override
  List<Object> get props => [];
}

class InternetDisConnectedEvent extends InternetEvent {
  const InternetDisConnectedEvent() : super();
  @override
  List<Object> get props => [];
}