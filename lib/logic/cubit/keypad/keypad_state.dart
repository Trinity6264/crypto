part of 'keypad_cubit.dart';

abstract class KeypadState extends Equatable {
  const KeypadState();

  @override
  List<Object> get props => [];
}

class KeypadInitial extends KeypadState {}

class KeypadTyping extends KeypadState {
  final String input;

  const KeypadTyping({required this.input});

  @override
  List<Object> get props => [input];
}
