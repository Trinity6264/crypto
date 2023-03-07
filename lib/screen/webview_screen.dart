import 'dart:developer';

import 'package:crypto/app/service_locator.dart';
import 'package:crypto/helper/color_pallet.dart';
import 'package:crypto/logic/cubit/keypad/keypad_cubit.dart';
import 'package:crypto/logic/cubit/selected_currency/selected_currency_cubit.dart';
import 'package:crypto/logic/cubit/selected_payment/selected_currency_fiat_cubit.dart';
import 'package:crypto/logic/cubit/selected_payment_option/selected_payment_option_cubit.dart';
import 'package:crypto/service/nav_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;

  void init() {
    // final spo = context.read<SelectedPaymentOptionCubit>().paymentOptions;
    // final scf = context.read<SelectedCurrencyFiatCubit>().currencyFiat;
    // final sc = context.read<SelectedCurrencyCubit>().currency;
    final userInput = context.read<KeypadCubit>().userInputs;
    Future.delayed(const Duration(seconds: 1), () {
      controller.runJavaScript(
          "document.querySelector('#transak-calculator-source').value = $userInput");
      // controller.runJavaScript(
      //     "document.querySelector('.ladda-label').style.color = 'red'");
      // controller.runJavaScript(
      //     "document.querySelector('.btn-input > div > img').src = '${sc!.image}'");
      // controller.runJavaScript(
      //     "document.querySelector('.btn-input > div').innerHtml = '${sc.symbol}'");
    });
  }

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) async {},
          onPageFinished: (String url) {
            init();
          },
          onWebResourceError: (WebResourceError error) {
            log('Err ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://global.transak.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://global.transak.com/'));
    super.initState();
  }

  static final _navService = locator.get<NavigationServices>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPallet.lightGrayColor,
      body: SafeArea(
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
                        'Transak',
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
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
