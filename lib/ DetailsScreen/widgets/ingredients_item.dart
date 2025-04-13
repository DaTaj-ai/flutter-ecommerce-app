import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IngredientsItem extends StatelessWidget {
  const IngredientsItem({required this.ingredientMeasureItem, super.key});
  final Map<String, String> ingredientMeasureItem ;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipOval(
              child: Image.asset(
                "assets/images/item.png",
                width: 40,
                height: 40,
              ),
            ),
            SizedBox(width: 16),
            Text(
              ingredientMeasureItem.keys.first,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
              color: Color(0xFFFF6B57),
              width: 2,
            ),
          ),
        ),
      ],
    );
  }
}
