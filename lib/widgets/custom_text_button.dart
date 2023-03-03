// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:crypto/helper/color_pallet.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isIcon;
  final String text;
  const CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
      onPressed: onPressed,
      child: isIcon ? const Icon(Icons.backspace_outlined, color: ColorPallet.textColor): Text(
        text,
        style: TextStyle(
          color: ColorPallet.textColor,
          fontWeight: FontWeight.w600,
          fontSize: size.width * .09,
        ),
      ),
    );
  }
}
