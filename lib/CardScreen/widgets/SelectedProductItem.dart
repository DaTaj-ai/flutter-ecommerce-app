import 'package:flutter/material.dart';

class Selectedproductitem extends StatelessWidget {
  const Selectedproductitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              "assets/images/item.png",
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("title",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text("subtitle",
                    style: const TextStyle(fontWeight: FontWeight.w400)),
                const SizedBox(height: 6),
                Text("price",
                  // "\$${price.toStringAsFixed(2)2}",
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Row(

            children: [
              IconButton(style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(CircleBorder()),
              ),
                onPressed: (){},
                icon: Icon(Icons.remove_circle_outline),
              ),
              Text('quantity'),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.add_circle_outline),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0 , top: 0),
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }
}
