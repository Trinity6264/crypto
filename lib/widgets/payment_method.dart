import 'package:crypto/helper/color_pallet.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  static final List<String> listOfPaymentMethod = <String>[
    'UPI',
    'IMPS',
    'Debit or Credit'
  ];

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
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                final paymentModel = listOfPaymentMethod[index];
                return Container(
                  width: double.infinity,
                  height: size.height * .1,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorPallet.lightGrayColor,
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
                        child: const Text('🏦'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        paymentModel,
                        style: TextStyle(
                          color: ColorPallet.textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * .06,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: size.width * .1,
                        height: size.height * .03,
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorPallet.textColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: listOfPaymentMethod.length,
            ),
          )
        ],
      ),
    );
  }
}
