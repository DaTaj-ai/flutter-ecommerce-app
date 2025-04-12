import 'package:flutter/material.dart';

import '../navigation/AppRoutes.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/background.png" , width: double.infinity, fit: BoxFit.cover),
          Container(
            padding: EdgeInsets.all(25),
            child: Positioned(
              top: 70,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/backicon.png"),
                  SizedBox(height: 24),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Please sign in to your \n existing account",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
        bottomSheet: BottomSheet(
          elevation: 80,
          onClosing: () {},
          builder: (context) {
            return ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              child: Container(
                height: 700,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("Full name"),
                        SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none, // set default border color
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Color(0xFFFF6B57), width: 2), // your custom color
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        SizedBox(height: 16),

                        Text("E-mail"),
                        SizedBox(height: 8),
                        SizedBox(
                          child: TextField(
                            decoration: InputDecoration( focusColor:Color(0xFFFF6B57) ,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none, // set default border color
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Color(0xFFFF6B57), width: 2), // your custom color
                                ),                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        height: 62,),

                        SizedBox(height: 16),

                        Text("Password"),
                        SizedBox(height: 8),
                        SizedBox(
                          height: 62,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Color(0xFFFF6B57), width: 2), // your custom color
                              ),                            ),                          ),                        ),
                        SizedBox(height: 24),

                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFF6B57),
                              minimumSize: Size(249, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(70),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.home);
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 24),

                        Center(
                          child: Text(
                            "Or Sign up with",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFFD3D1D8),
                            ),
                          ),
                        ),

                        SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Facebook Button
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Image.asset("assets/images/iconfacebookpng.png", width: 38, height: 38),
                              label: Text("FACEBOOK"),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                minimumSize: Size(140, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 4,
                                shadowColor: Colors.black12,
                              ),
                            ),

                            // Google Button
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Image.asset("assets/images/icongoogle.png", width: 38, height: 38),
                              label: Text("GOOGLE"),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                minimumSize: Size(140, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 4,
                                shadowColor: Colors.black12,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 24),

                        Center(
                          child: Text(
                            "Already have an account? Login",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colors.white,
//     body: Stack(
//       children: [
//         Positioned(
//           top: 0,
//           left: 0,
//           right: 0,
//           height: 300,
//           child: Image.asset(
//             "assets/images/test.png",
//             fit: BoxFit.cover,
//           ),
//         ),
//
//         // 🔹 Top content (back icon + texts)
//         Positioned(
//           top: 50,
//           left: 16,
//           right: 16,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Back button (you can use IconButton too)
//               CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Icon(Icons.arrow_back, color: Colors.black),
//               ),
//               SizedBox(height: 24),
//               Text(
//                 "Login",
//                 style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 "Please sign in to your\nexisting account",
//                 style: TextStyle(fontSize: 16, color: Colors.white70),
//               ),
//             ],
//           ),
//         ),
//
//         // 🔹 Bottom white sheet (form)
//         Positioned(
//           top: 250,
//           left: 0,
//           right: 0,
//           child: ClipRRect(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
//             child: Container(
//               color: Colors.white,
//               padding: EdgeInsets.all(24),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       hintText: 'example@gmail.com',
//                       filled: true,
//                       fillColor: Colors.grey[100],
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       filled: true,
//                       fillColor: Colors.grey[100],
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 24),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFFFF6B57),
//                       minimumSize: Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: Text("Sign Up", style: TextStyle(color: Colors.white)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
