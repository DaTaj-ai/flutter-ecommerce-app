import 'package:flutter/material.dart';
import 'package:flutterlab3/Onboarding_01Screen/OnBoardingScreen01.dart';

import '../HomeScreen/home_screen.dart';
import '../CardScreen/CardScreen.dart';
import '../SignUpScreen/SignUpScreen.dart';
import '../main.dart';
import 'AppRoutes.dart';

class RouterGenerator {
  static Route generateRoute(RouteSettings settings) {
    //final argument = settings.arguments;
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreenUi();
          },
        );
      case AppRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (context) {
            return OnBoarding();
          },
        );
      case AppRoutes.signup:
        return MaterialPageRoute(
          builder: (context) {
            return SignUpScreen();
          },
        );
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) {
            return MyHomePage();
          },
        );
      case AppRoutes.card:
        return MaterialPageRoute(
          builder: (context) {
            return Cardscreen();
          },
        );
      case AppRoutes.details_Bottom_sheet:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreenUi();
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(body: Text("No Route found"));
          },
        );
    }
  }
}
