import 'package:crypto/app/app_router.dart';
import 'package:crypto/app/service_locator.dart';
import 'package:crypto/helper/color_pallet.dart';
import 'package:crypto/service/nav_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _service = locator.get<NavigationServices>();

  Future<void> waitForWhile() async {
    Future.delayed(const Duration(seconds: 3), () {
      _service.replaceNamed(AppRouter.homeScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    waitForWhile();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPallet.darkColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Crypto Wallet',
              style: TextStyle(
                color: ColorPallet.whiteColor,
                fontSize: size.width * .15,
              ),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              color: ColorPallet.whiteColor,
            )
          ],
        ),
      ),
    );
  }
}
