import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:crypto/model/currency_model.dart';
import 'package:equatable/equatable.dart';

part 'selected_currency_state.dart';

class SelectedCurrencyCubit extends Cubit<SelectedCurrencyState> {
  SelectedCurrencyCubit() : super(SelectedCurrencyInitial());

  static CurrencyModel? _currency;
  // getter
  CurrencyModel? get currency => _currency;

// setter
  void setCurrencyMethod(CurrencyModel currency) {
    _currency = currency;
  }

  void selectedCurrency(CurrencyModel model) {
    setCurrencyMethod(model);
    emit(SelectedCurrencyApproved(currencyModel: model));
  }
}
