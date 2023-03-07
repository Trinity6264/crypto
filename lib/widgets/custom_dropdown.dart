import 'package:crypto/helper/color_pallet.dart';
import 'package:crypto/logic/cubit/currencyfiat/currency_fiat_cubit.dart';
import 'package:crypto/logic/cubit/selected_payment/selected_currency_fiat_cubit.dart';

import 'package:crypto/widgets/card_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyFiatCubit, CurrencyFiatState>(
      builder: (context, state) {
        if (state is CurrencyFiatLoading) {
          return const CardWrapper(
            child: SizedBox(),
          );
        }
        if (state is CurrencyFiatFailure) {
          return CardWrapper(
            child: Text(
              state.errorMessage,
              style: const TextStyle(
                color: ColorPallet.whiteColor,
              ),
            ),
          );
        }
        if (state is CurrencyFiatSuccess) {
          context
              .read<SelectedCurrencyFiatCubit>()
              .setSelectedCurrencyFiat(currencyFiatModel: state.data[0]);
          return DropdownButtonFormField(
            iconEnabledColor: ColorPallet.whiteColor,
            isExpanded: true,
            onChanged: (value) {
              context.read<SelectedCurrencyFiatCubit>().setSelectedCurrencyFiat(
                    currencyFiatModel: value!,
                  );
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            dropdownColor: ColorPallet.darkColor,
            items: state.data
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: BlocBuilder<SelectedCurrencyFiatCubit,
                        SelectedCurrencyFiatState>(
                      builder: (context, state) {
                        if (state is SelectedCurrencyFiatSelected) {
                          return SizedBox(
                            height: 20,
                            width: 20,
                            child: SvgPicture.string(e.icon!),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                )
                .toList(),
          );
        }
        return const SizedBox();
      },
    );
  }
}
