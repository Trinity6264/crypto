// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypto/logic/cubit/country/country_cubit.dart';
import 'package:crypto/logic/cubit/currencyfiat/currency_fiat_cubit.dart';
import 'package:crypto/logic/cubit/keypad/keypad_cubit.dart';
import 'package:crypto/logic/cubit/price/price_cubit.dart';
import 'package:crypto/logic/cubit/selected_currency/selected_currency_cubit.dart';
import 'package:crypto/logic/cubit/selected_payment/selected_currency_fiat_cubit.dart';
import 'package:crypto/logic/cubit/selected_payment_option/selected_payment_option_cubit.dart';
import 'package:crypto/repository/api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:crypto/app/app_router.dart';
import 'package:crypto/app/service_locator.dart';
import 'package:crypto/logic/cubit/currency/currency_cubit.dart';
import 'package:crypto/service/nav_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupAllService();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp(apiRepo: ApiRepo()));
}

class MyApp extends StatelessWidget {
  final ApiRepo apiRepo;
  const MyApp({
    Key? key,
    required this.apiRepo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrencyCubit>(
          create: (context) => CurrencyCubit(apiRepo: apiRepo),
        ),
        BlocProvider<CountryCubit>(
          create: (context) => CountryCubit(apiRepo: apiRepo),
        ),
        BlocProvider<KeypadCubit>(
          create: (context) => KeypadCubit(),
        ),
        BlocProvider<CurrencyFiatCubit>(
          create: (context) => CurrencyFiatCubit(apiRepo: apiRepo),
        ),
        BlocProvider<SelectedCurrencyFiatCubit>(
          create: (context) => SelectedCurrencyFiatCubit(),
        ),
        BlocProvider<SelectedCurrencyCubit>(
          create: (context) => SelectedCurrencyCubit(),
        ),
        BlocProvider<SelectedPaymentOptionCubit>(
          create: (context) => SelectedPaymentOptionCubit(),
        ),
        BlocProvider<PriceCubit>(
          create: (context) => PriceCubit(apiRepo: apiRepo),
        ),
      ],
      child: MaterialApp(
        title: 'crypto',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorKey: navigationKey,
        scaffoldMessengerKey: scaffoldKey,
        onGenerateRoute: AppRouter.onGenerateRoutes,
      ),
    );
  }
}
