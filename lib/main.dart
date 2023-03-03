// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypto/repository/api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:crypto/app/app_router.dart';
import 'package:crypto/app/service_locator.dart';
import 'package:crypto/logic/cubit/cubit/currency_cubit.dart';
import 'package:crypto/screen/splash_screen.dart';
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
      ],
      child: MaterialApp(
        title: 'crypto',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorKey: navigationKey,
        onGenerateRoute: AppRouter.onGenerateRoutes,
      ),
    );
  }
}
