import 'package:crypto/app/service_locator.dart';
import 'package:crypto/helper/color_pallet.dart';
import 'package:crypto/service/nav_service.dart';
import 'package:crypto/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SelectQuoteScreen extends StatelessWidget {
  const SelectQuoteScreen({super.key});
  static final _navService = locator.get<NavigationServices>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPallet.lightGrayColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: size.height * .1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: ColorPallet.textColor,
                      ),
                      onPressed: _navService.goBack,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Select a Quote',
                          style: TextStyle(
                            color: ColorPallet.whiteColor,
                            fontSize: size.width * .05,
                          ),
                        ),
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 2.5,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Ethereum Main Network',
                              style: TextStyle(
                                color: ColorPallet.textColor,
                                fontSize: size.width * .025,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: ColorPallet.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * .4,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorPallet.darkColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                alignment: Alignment.center,
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'New quotes in ',
                        style: TextStyle(
                          color: ColorPallet.textColor,
                        ),
                      ),
                      TextSpan(
                        text: '0:16 ',
                        style: TextStyle(
                          color: ColorPallet.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * .03),
              Text(
                'To buy DAI from one of our integrations, you\'ll be securely taken to their portal without leaving the MetaMask app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorPallet.textColor,
                  fontSize: size.width * .05,
                ),
              ),
              SizedBox(height: size.height * .03),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: ColorPallet.primaryColor,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.swap_vert,
                            color: ColorPallet.whiteColor),
                        const SizedBox(width: 5),
                        const Text(
                          'Transak',
                          style: TextStyle(
                            color: ColorPallet.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          Icons.add_circle_outline,
                          color: ColorPallet.textColor,
                          size: size.width * .03,
                        ),
                        const Spacer(),
                        const Text(
                          '50.75 DAI',
                          style: TextStyle(
                            color: ColorPallet.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * .01),
                    rowText('Price INR', '=\$4445.97 INR', context),
                    SizedBox(height: size.height * .005),
                    rowText('Total Fees', '=\$554.03 INR', context),
                    SizedBox(height: size.height * .005),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: rowText('Process Fees', '=\$504.03 INR', context),
                    ),
                    SizedBox(height: size.height * .005),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: rowText('Network Fees', '=\$50 INR', context),
                    ),
                    SizedBox(height: size.height * .005),
                    rowText('Total ', '=\$5000 INR', context),
                    SizedBox(height: size.height * .02),
                    SizedBox(
                      width: double.infinity,
                      height: size.height * .05,
                      child: CustomButton(
                        onPressed: () {},
                        text: 'Buy with Transak',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row rowText(
    String firstText,
    String secondText,
    BuildContext context,
  ) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firstText,
          style: TextStyle(
              color: ColorPallet.textColor, fontSize: size.width * .035),
        ),
        Text(
          secondText,
          style: TextStyle(
              color: ColorPallet.textColor, fontSize: size.width * .035),
        ),
      ],
    );
  }
}
