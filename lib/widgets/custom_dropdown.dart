import 'package:crypto/helper/color_pallet.dart';
import 'package:crypto/logic/cubit/country/country_cubit.dart';
import 'package:crypto/widgets/card_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryCubit, CountryState>(
      builder: (context, state) {
        if (state is CountryLoading) {
          return const CardWrapper(
            child: SizedBox(),
          );
        }
        if (state is CountryFailed) {
          return CardWrapper(
            child: Text(
              state.errorMessage,
              style: const TextStyle(
                color: ColorPallet.whiteColor,
              ),
            ),
          );
        }
        if (state is CountrySuccess) {
          return DropdownButtonFormField(
            isExpanded: true,
            onChanged: (value) {},
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            dropdownColor: ColorPallet.darkColor,
            hint: const Text(
              'Select Country',
              style: TextStyle(
                color: ColorPallet.textColor,
              ),
            ),
            items: state.countries
                .map(
                  (e) => DropdownMenuItem(
                    value: e.name,
                    child: Text(
                      e.name ?? '-',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: ColorPallet.whiteColor,
                      ),
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
