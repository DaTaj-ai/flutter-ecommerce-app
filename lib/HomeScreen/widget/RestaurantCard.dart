import 'package:flutter/material.dart';

import '../../navigation/AppRoutes.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap:(){
      Navigator.pushNamed(
        context,AppRoutes.card,
      );
    } ,
      child: Container(
        width: 320,
        height: 400,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration
          (
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                "assets/images/covermealbottom1.png",
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Seafood maki sushi",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
      
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      const Text("4.5", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.delivery_dining,
                    size: 16,
                    color: Colors.redAccent,
                  ),
                  const SizedBox(width: 4),
                  const Text("Free delivery"),
                  const SizedBox(width: 12),
                  const Icon(Icons.timer, size: 16, color: Colors.redAccent),
                  const SizedBox(width: 4),
                  const Text("45 mins"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
