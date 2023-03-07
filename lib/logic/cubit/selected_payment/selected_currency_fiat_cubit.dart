import 'package:bloc/bloc.dart';
import 'package:crypto/model/payment_method_model.dart';
import 'package:equatable/equatable.dart';

part 'selected_currency_fiat_state.dart';

class SelectedCurrencyFiatCubit extends Cubit<SelectedCurrencyFiatState> {
  SelectedCurrencyFiatCubit() : super(SelectedCurrencyFiatInitial());

  static CurrencyFiatModel? _currencyFiat;
  // getter
  CurrencyFiatModel? get currencyFiat => _currencyFiat;

// setter
  void setCurrencyFiat(CurrencyFiatModel currencyFiat) {
    _currencyFiat = currencyFiat;
  }

  void setSelectedCurrencyFiat(
      {required CurrencyFiatModel currencyFiatModel}) {
    setCurrencyFiat(currencyFiatModel);
    emit(SelectedCurrencyFiatSelected(currencyFiatModel: currencyFiatModel));
  }
}
