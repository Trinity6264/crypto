import 'package:crypto/helper/color_pallet.dart';
import 'package:crypto/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class KeyPadWrapper extends StatelessWidget {
  const KeyPadWrapper({super.key});

  @override
  Widget build(BuildContext context) {
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
              CustomTextButton(onPressed: () {}, text: '1'),
              CustomTextButton(onPressed: () {}, text: '2'),
              CustomTextButton(onPressed: () {}, text: '3'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextButton(onPressed: () {}, text: '4'),
              CustomTextButton(onPressed: () {}, text: '5'),
              CustomTextButton(onPressed: () {}, text: '6'),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextButton(onPressed: () {}, text: '7'),
              CustomTextButton(onPressed: () {}, text: '8'),
              CustomTextButton(onPressed: () {}, text: '9'),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextButton(onPressed: () {}, text: '.'),
              CustomTextButton(onPressed: () {}, text: '0'),
              CustomTextButton(onPressed: () {}, text: '', isIcon: true),
            ],
          ),
        ],
      ),
    );
  }
}
