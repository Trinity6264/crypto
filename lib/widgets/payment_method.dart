import 'package:crypto/app/service_locator.dart';
import 'package:crypto/helper/color_pallet.dart';
import 'package:crypto/logic/cubit/selected_payment/selected_currency_fiat_cubit.dart';
import 'package:crypto/logic/cubit/selected_payment_option/selected_payment_option_cubit.dart';
import 'package:crypto/service/nav_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  static final _navService = locator.get<NavigationServices>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: ColorPallet.darkColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: size.width * .25,
            height: size.height * .004,
            decoration: BoxDecoration(
              color: ColorPallet.lightGrayColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: size.height * .03),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Select payment method',
              style: TextStyle(
                color: ColorPallet.textColor,
                fontWeight: FontWeight.w600,
                fontSize: size.width * .05,
              ),
            ),
          ),
          SizedBox(height: size.height * .04),
          BlocBuilder<SelectedCurrencyFiatCubit, SelectedCurrencyFiatState>(
            builder: (context, state) {
              if (state is SelectedCurrencyFiatSelected) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: state.currencyFiatModel.paymentOptions!.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      final paymentOption =
                          state.currencyFiatModel.paymentOptions![index];
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<SelectedPaymentOptionCubit>()
                              .getPaymentOption(paymentOption: paymentOption);
                          _navService.goBack();
                        },
                        child: Container(
                          width: double.infinity,
                          height: size.height * .1,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Container(
                                width: size.width * .08,
                                height: size.height * .04,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: ColorPallet.darkColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: SvgPicture.string(
                                  state.currencyFiatModel.icon!,
                                  semanticsLabel: 'Logo',
                                  placeholderBuilder: (context) => const Center(
                                      child: CircularProgressIndicator()),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  paymentOption.name ?? '-',
                                  style: TextStyle(
                                    color: ColorPallet.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.width * .06,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: state
                                        .currencyFiatModel.paymentOptions!
                                        .map(
                                          (e) => Container(
                                            width: size.width * .1,
                                            height: size.height * .03,
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 1,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: ColorPallet.textColor,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            alignment: Alignment.center,
                                            child: SvgPicture.network(
                                              e.icon!,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
