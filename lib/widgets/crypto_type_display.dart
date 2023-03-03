import 'package:crypto/helper/color_pallet.dart';
import 'package:crypto/widgets/choose_token.dart';
import 'package:crypto/widgets/modal_sheet.dart';
import 'package:flutter/material.dart';

class CryptoTypeDisplay extends StatelessWidget {
  const CryptoTypeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        requestModelSheet(context, const ChooseToken());
      },
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: ColorPallet.whiteColor,
              radius: 15,
            ),
            const SizedBox(width: 5),
            Text(
              'ETH',
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
        ),
      ),
    );
  }
}
