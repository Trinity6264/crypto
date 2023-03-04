import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:crypto/model/currency_model.dart';
import 'package:equatable/equatable.dart';

part 'selected_currency_state.dart';

class SelectedCurrencyCubit extends Cubit<SelectedCurrencyState> {
  SelectedCurrencyCubit() : super(SelectedCurrencyInitial());

  void selectedCurrency(CurrencyModel model) {
    emit(SelectedCurrencyApproved(currencyModel: model));
  }

}
