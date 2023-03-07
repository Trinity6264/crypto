import 'package:crypto/helper/color_pallet.dart';
import 'package:crypto/logic/cubit/currency/currency_cubit.dart';
import 'package:crypto/logic/cubit/selected_currency/selected_currency_cubit.dart';
import 'package:crypto/model/currency_model.dart';
import 'package:crypto/widgets/choose_token.dart';
import 'package:crypto/widgets/modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoTypeDisplay extends StatelessWidget {
  const CryptoTypeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyCubit, CurrencyState>(
      builder: (context, state) {
        if (state is CurrencyLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CurrencyFailed) {
          return Center(
            child: TextButton.icon(
              onPressed: () async {
                await context.read<CurrencyCubit>().getCryptoCurrency();
              },
              icon:
                  const Icon(Icons.rotate_right, color: ColorPallet.whiteColor),
              label:const Text(
                'Sorry for the inconvenience, tap to try again',
                style: TextStyle(
                  color: ColorPallet.whiteColor,
                ),
              ),
            ),
          );
        }
        if (state is CurrencySuccess) {
          context
              .read<SelectedCurrencyCubit>()
              .selectedCurrency(state.currencies[0]);

          return GestureDetector(
            onTap: () {
              requestModelSheet(context, const ChooseToken());
            },
            child: SizedBox(
              child: BlocBuilder<SelectedCurrencyCubit, SelectedCurrencyState>(
                builder: (context, state) {
                  if (state is SelectedCurrencyApproved) {
                    return CurrencyWidget(model: state.currencyModel);
                  }
                  return const SizedBox();
                },
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class CurrencyWidget extends StatelessWidget {
  const CurrencyWidget({super.key, required this.model});

  final CurrencyModel model;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: ColorPallet.lightGrayColor,
          radius: 15,
          backgroundImage: NetworkImage(
            model.image!.large!,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          model.symbol ?? '-',
          style: TextStyle(
            color: ColorPallet.whiteColor,
            fontSize: size.width * .06,
          ),
        ),
        const SizedBox(width: 2),
        const Icon(
          Icons.arrow_drop_down_rounded,
          color: ColorPallet.whiteColor,
        ),
      ],
    );
  }
}
