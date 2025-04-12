import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key , required this.ratingColor });
  final Color ratingColor   ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/images/staricon.png",
        ),
        SizedBox(width: 4),
        Text(
          "4.9",
          style: TextStyle(
            decoration:
            TextDecoration.underline,
            color: ratingColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
