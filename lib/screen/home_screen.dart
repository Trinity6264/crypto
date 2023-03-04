import 'package:crypto/app/app_router.dart';
import 'package:crypto/app/service_locator.dart';
import 'package:crypto/helper/color_pallet.dart';
import 'package:crypto/logic/cubit/country/country_cubit.dart';
import 'package:crypto/logic/cubit/currency/currency_cubit.dart';
import 'package:crypto/logic/cubit/keypad/keypad_cubit.dart';
import 'package:crypto/logic/cubit/paymentmethod/paymentmethod_cubit.dart';
import 'package:crypto/service/nav_service.dart';
import 'package:crypto/widgets/card_wrapper.dart';
import 'package:crypto/widgets/crypto_type_display.dart';
import 'package:crypto/widgets/custom_button.dart';
import 'package:crypto/widgets/custom_dropdown.dart';
import 'package:crypto/widgets/keypad_wrapper.dart';
import 'package:crypto/widgets/modal_sheet.dart';
import 'package:crypto/widgets/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  static final _navService = locator.get<NavigationServices>();
}

class _HomeScreenState extends State<HomeScreen> {
  // Future<void> getCountries() async {
  //   final apiService = context.read<CountryCubit>();
  //   await apiService.getCryptoCountry();
  // }

  Future<void> getCrypto() async {
    await context.read<CurrencyCubit>().getCryptoCurrency();
  }

  Future<void> getPaymentMethod() async {
    await context.read<PaymentMethodCubit>().getPaymentMethod();
  }

  @override
  void initState() {
    getCrypto();
    getPaymentMethod();
    super.initState();
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
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
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
                                      backgroundColor: ColorPallet.darkColor,
                                      backgroundImage: NetworkImage(
                                        'https://images.unsplash.com/photo-1667808930615-b6cf6a7c0af5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                                      ),
                                    ),
                                    const SizedBox(width: 7),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                fontSize: size.width * .045,
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
                            const SizedBox(width: 10),
                            Container(
                              height: double.infinity,
                              width: size.width * .2,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: ColorPallet.lightGrayColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const CustomDropDown(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * .03),
                      const CryptoTypeDisplay(),
                      SizedBox(height: size.height * .02),
                      Center(
                        child: BlocBuilder<KeypadCubit, KeypadState>(
                          builder: (context, state) {
                            if (state is KeypadTyping) {
                              return Text(
                                '\$${state.input}',
                                style: TextStyle(
                                  color: ColorPallet.textColor,
                                  fontSize: size.width * .15,
                                  fontWeight: FontWeight.w700,
                                ),
                              );
                            }
                            return Text(
                              '\$0',
                              style: TextStyle(
                                color: ColorPallet.textColor,
                                fontSize: size.width * .15,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          },
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
                      BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
                        builder: (context, state) {
                          if (state is PaymentMethodLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (state is PaymentMethodFailure) {
                            return Center(
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.refresh_rounded,
                                  color: ColorPallet.textColor,
                                ),
                                label: Text(
                                  state.errorMessage,
                                  style: const TextStyle(
                                      color: ColorPallet.whiteColor),
                                ),
                              ),
                            );
                          }
                          if (state is PaymentMethodSuccess) {
                            return GestureDetector(
                              onTap: () {
                                requestModelSheet(
                                    context, const PaymentMethod());
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: SvgPicture.network(
                                            state.data[0].paymentOptions![0]
                                                .icon!,
                                            semanticsLabel: 'Logo',
                                            placeholderBuilder: (context) =>
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                          )),
                                      const SizedBox(width: 8),
                                      Text(
                                        state.data[0].symbol ?? '-',
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
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      SizedBox(height: size.height * .03),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        width: double.infinity,
                        height: size.height * .05,
                        child: CustomButton(
                            text: 'Get quotes',
                            onPressed: () {
                              HomeScreen._navService
                                  .pushNamed(AppRouter.selectQuoteScreen);
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const KeyPadWrapper()
          ],
        ),
      ),
    );
  }
}
