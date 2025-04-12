import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../navigation/AppRoutes.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.onBoarding);
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              child: Image.asset("assets/images/splash_screentop.png"),
              left: 0,
              top: 0,
            ),
            Positioned(
              child: Image.asset("assets/images/splashscreen1.png"),
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
            ),
            Positioned(
              child: Image.asset("assets/images/splash_screen_bottom.png"),
              right: 0,
              bottom: 0,
            ),
          ],
        ),
        //flag backgroundColor: Color(0xFF6B57)
        backgroundColor: Color(0xFFFF6B57),
      ),
    );
  }
}
