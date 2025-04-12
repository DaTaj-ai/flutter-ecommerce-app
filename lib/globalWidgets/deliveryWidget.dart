import 'package:flutter/material.dart';

class DeliveryWidget extends StatelessWidget {
  const DeliveryWidget({super.key , Color? color } );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/deliveryicon.png"),
        SizedBox(width: 4),
        Text("Free delivery", style: TextStyle(color: Color(0xFF7E8392))),
        SizedBox(width: 12),
      ],
    );
  }
}
