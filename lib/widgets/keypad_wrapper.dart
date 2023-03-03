import 'package:crypto/helper/color_pallet.dart';
import 'package:crypto/logic/cubit/keypad/keypad_cubit.dart';
import 'package:crypto/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KeyPadWrapper extends StatelessWidget {
  const KeyPadWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final keyPadCubit = context.read<KeypadCubit>();
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .4,
      color: ColorPallet.lightGrayColor,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextButton(
                  onPressed: () {
                    keyPadCubit.getUserInput(input: '1');
                  },
                  text: '1'),
              CustomTextButton(
                  onPressed: () {
                    keyPadCubit.getUserInput(input: '2');
                  },
                  text: '2'),
              CustomTextButton(
                  onPressed: () {
                    keyPadCubit.getUserInput(input: '3');
                  },
                  text: '3'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextButton(
                  onPressed: () {
                    keyPadCubit.getUserInput(input: '4');
                  },
                  text: '4'),
              CustomTextButton(
                  onPressed: () {
                    keyPadCubit.getUserInput(input: '5');
                  },
                  text: '5'),
              CustomTextButton(
                  onPressed: () {
                    keyPadCubit.getUserInput(input: '6');
                  },
                  text: '6'),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextButton(
                  onPressed: () {
                    keyPadCubit.getUserInput(input: '7');
                  },
                  text: '7'),
              CustomTextButton(
                  onPressed: () {
                    keyPadCubit.getUserInput(input: '8');
                  },
                  text: '8'),
              CustomTextButton(
                  onPressed: () {
                    keyPadCubit.getUserInput(input: '9');
                  },
                  text: '9'),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextButton(
                  onPressed: () {
                    keyPadCubit.getUserInput(input: '.');
                  },
                  text: '.'),
              CustomTextButton(
                  onPressed: () {
                    keyPadCubit.getUserInput(input: '0');
                  },
                  text: '0'),
              CustomTextButton(
                  onPressed: () {
                    keyPadCubit.deleteUserInput();
                  },
                  text: '',
                  isIcon: true),
            ],
          ),
        ],
      ),
    );
  }
}
