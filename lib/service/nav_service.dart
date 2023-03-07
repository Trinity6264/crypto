import 'dart:async';

import 'package:crypto/helper/color_pallet.dart';
import 'package:flutter/material.dart';

// ! This two Global keys will help us manipulate the navigation and scaffold state
final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();

class NavigationServices {
  //? creating a navigations methods

  void replaceNamed(String path) {
    navigationKey.currentState!.pushReplacementNamed(path);
  }

  void pushNamed(String path) {
    navigationKey.currentState!.pushNamed(path);
  }

  void goBack() {
    navigationKey.currentState!.pop();
  }

  FutureOr<dynamic> showSnackBar(String message) {
    scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: ColorPallet.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: ColorPallet.darkColor,
      ),
    );
    Future.delayed(
      const Duration(seconds: 5),
      () => scaffoldKey.currentState!.hideCurrentSnackBar(),
    );
  }

  FutureOr<dynamic> showBanner(String message) {
    scaffoldKey.currentState!.showMaterialBanner(
      MaterialBanner(
        content: Text(
          message,
          style: const TextStyle(
            color: ColorPallet.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: ColorPallet.primaryColor,
        overflowAlignment: OverflowBarAlignment.start,
        elevation: 5.0,
        leading: const Icon(Icons.info, color: ColorPallet.whiteColor),
        actions: [
          Container(),
        ],
      ),
    );
    Future.delayed(
      const Duration(seconds: 3),
      () => scaffoldKey.currentState!.hideCurrentMaterialBanner(),
    );
  }

// no internet connection banner
void showInternetBanner(BuildContext _, String mes) {
  ScaffoldMessenger.of(_).showMaterialBanner(
    MaterialBanner(
      backgroundColor: Colors.red,
      content: Text(
        mes,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      actions: const [
        Icon(
          Icons.wifi_off,
          color: Colors.white,
        )
      ],
    ),
  );
}

// no internet connection banner close
void closeInternetBanner(BuildContext _) {
  ScaffoldMessenger.of(_).clearMaterialBanners();
}

}
