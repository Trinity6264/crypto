import 'package:crypto/screen/home_screen.dart';
import 'package:crypto/screen/select_qoute_screen.dart';
import 'package:crypto/screen/splash_screen.dart';
import 'package:crypto/screen/webview_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  // Create variables to hold all routes within this app
  static const String splashScreen = '/';
  static const String homeScreen = '/home';
  static const String selectQuoteScreen = '/select-quote';
  static const String webViewScreen = '/webview';


  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case selectQuoteScreen:
        return MaterialPageRoute(builder: (_) => const SelectQuoteScreen());
      case webViewScreen:
        return MaterialPageRoute(builder: (_) => const WebViewScreen());
      default:
        throw const FormatException('Routes not found');
    }
  }
}