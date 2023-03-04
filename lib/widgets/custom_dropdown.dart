import 'dart:developer';

import 'package:crypto/helper/color_pallet.dart';
import 'package:crypto/logic/cubit/country/country_cubit.dart';
import 'package:crypto/logic/cubit/paymentmethod/paymentmethod_cubit.dart';
import 'package:crypto/logic/cubit/selected_payment/selected_paymethod_cubit.dart';
import 'package:crypto/widgets/card_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
      builder: (context, state) {
        if (state is PaymentMethodLoading) {
          return const CardWrapper(
            child: SizedBox(),
          );
        }
        if (state is PaymentMethodFailure) {
          return CardWrapper(
            child: Text(
              state.errorMessage,
              style: const TextStyle(
                color: ColorPallet.whiteColor,
              ),
            ),
          );
        }
        if (state is PaymentMethodSuccess) {
          return DropdownButtonFormField(
            iconEnabledColor: ColorPallet.whiteColor,
            isExpanded: true,
            onChanged: (value) {
              context.read<SelectedPayMethodCubit>().setSelectedPaymentMethod(
                    paymentMethodModel: value!,
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
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: SvgPicture.string(e.icon!),
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
