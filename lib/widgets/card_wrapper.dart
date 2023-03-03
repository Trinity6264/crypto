// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:crypto/helper/color_pallet.dart';

class CardWrapper extends StatelessWidget {
  final Widget child;
  const CardWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorPallet.lightGrayColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
