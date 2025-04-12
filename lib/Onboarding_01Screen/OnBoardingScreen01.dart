import 'package:flutter/material.dart';

import '../navigation/AppRoutes.dart';

class OnBoarding extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Image.asset("assets/images/onboarding01.png"),
            right: 0,
            top: 0,
          ),
          Positioned(
            child: Image.asset("assets/images/onboarding_lines.png"),
            left: 0,
            bottom: 0,
          ),
          Positioned(
            child: Text(
              "I don't feel like\ncooking. Let's\norder food \ndelivery.",
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
            ),
            left: 25,
            top: 490,
            bottom: 0,
          ),

         Positioned(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.signup);
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(154, 54),
                  side: BorderSide(color: Colors.white),
                  backgroundColor: Colors.white.withOpacity(.21),
                ),
                child: Text("Sign Up", style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  print("Sign in");
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(154, 54),
                  backgroundColor: Colors.black,
                ),
                child: Text("Sign in", style: TextStyle(color: Colors.white)),
              ),
            ],
          )
            ,bottom:26 , left: 0, right: 0,),
      ]),
      backgroundColor: Color(0xFFFF6B57),
    );
  }
}
