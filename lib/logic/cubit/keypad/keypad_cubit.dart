import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'keypad_state.dart';

class KeypadCubit extends Cubit<KeypadState> {
  KeypadCubit() : super(KeypadInitial());

  static String _userInputs = '';
  // getter
  String get userInputs => _userInputs;

// setter
  void setUserInputs(String userInputs) {
    _userInputs = userInputs;
  }

  String inputs = '';

  void getUserInput({required String input}) {
    inputs += input;
    setUserInputs(inputs);
    emit(KeypadTyping(input: inputs));
  }

  void deleteUserInput() {
    if (inputs.isEmpty) {
      emit(KeypadInitial());
      return;
    }
    final rem = inputs.split('');
    rem.removeAt(rem.length - 1);
    inputs = rem.join('');
    setUserInputs(inputs);
    emit(KeypadTyping(input: inputs));
  }
}
