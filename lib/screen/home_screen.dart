import 'dart:developer';

import 'package:crypto/app/app_router.dart';
import 'package:crypto/app/service_locator.dart';
import 'package:crypto/helper/color_pallet.dart';
import 'package:crypto/logic/cubit/cubit/currency_cubit.dart';
import 'package:crypto/service/nav_service.dart';
import 'package:crypto/widgets/card_wrapper.dart';
import 'package:crypto/widgets/choose_token.dart';
import 'package:crypto/widgets/custom_button.dart';
import 'package:crypto/widgets/custom_text_button.dart';
import 'package:crypto/widgets/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final _navService = locator.get<NavigationServices>();

  // requesting for model sheet
  void requestModelSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return child;
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPallet.darkColor,
      appBar: AppBar(
        backgroundColor: ColorPallet.darkColor,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios, color: ColorPallet.textColor),
        title: Text(
          'Add Funds',
          style: TextStyle(
            color: ColorPallet.whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: size.width * .065,
          ),
        ),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: size.height * .08,
                      child: Row(
                        children: [
                          Expanded(
                            child: CardWrapper(
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: ColorPallet.primaryColor,
                                  ),
                                  const SizedBox(width: 7),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Account 1',
                                            style: TextStyle(
                                              color: ColorPallet.whiteColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: size.width * .05,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.arrow_drop_down_rounded,
                                            color: ColorPallet.whiteColor,
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        '0x...9865',
                                        style: TextStyle(
                                          color: ColorPallet.textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: size.width * .2,
                            height: double.infinity,
                            child: const CardWrapper(child: Text('data')),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * .03),
                    GestureDetector(
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
                    ),
                    SizedBox(height: size.height * .02),
                    Center(
                      child: Text(
                        '\$0',
                        style: TextStyle(
                          color: ColorPallet.textColor,
                          fontSize: size.width * .15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .01),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Choose payment option',
                          style: TextStyle(
                            color: ColorPallet.textColor,
                            fontSize: size.width * .045,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .01),
                    GestureDetector(
                      onTap: () {
                        requestModelSheet(context, const PaymentMethod());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        width: double.infinity,
                        height: size.height * .08,
                        child: CardWrapper(
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
                                'UPI',
                                style: TextStyle(
                                  color: ColorPallet.textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * .06,
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: ColorPallet.textColor,
                                size: size.width * .04,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .03),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      width: double.infinity,
                      height: size.height * .05,
                      child: CustomButton(
                          text: 'Get quotes',
                          onPressed: () {
                            _navService.pushNamed(AppRouter.selectQuoteScreen);
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: size.height * .4,
              color: ColorPallet.lightGrayColor,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: size.width * .05,
                spacing: size.width * .05,
                children: [
                  CustomTextButton(onPressed: () {}, text: '1'),
                  CustomTextButton(onPressed: () {}, text: '2'),
                  CustomTextButton(onPressed: () {}, text: '3'),
                  CustomTextButton(onPressed: () {}, text: '4'),
                  CustomTextButton(onPressed: () {}, text: '5'),
                  CustomTextButton(onPressed: () {}, text: '6'),
                  CustomTextButton(onPressed: () {}, text: '7'),
                  CustomTextButton(onPressed: () {}, text: '8'),
                  CustomTextButton(onPressed: () {}, text: '9'),
                  CustomTextButton(onPressed: () {}, text: '.'),
                  CustomTextButton(onPressed: () {}, text: '0'),
                  CustomTextButton(onPressed: () {}, text: '', isIcon: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
