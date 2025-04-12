import 'package:flutter/material.dart';
import 'package:flutterlab3/globalWidgets/RatingWidget.dart';

import '../../Models/meal_response_model.dart';
import 'BottomSheetWidget.dart';

class OffersCard extends StatefulWidget {
  OffersCard({super.key, required this.meal});

  Meals ? meal;
  @override
  State<OffersCard> createState() => _OffersCardState();
}

class _OffersCardState extends State<OffersCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap:
    (){
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) => Bottomsheetwidget(meal:  widget.meal),
      );
    },
      child: Container(
        margin: EdgeInsets.all(5),
        height: 100,
        width: 256,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFFF6B57),
        ),
        child: Row(
          children: [
            Image.network(
              widget.meal?.strMealThumb ?? "",
              width: 116,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8), // some spacing
            Expanded( // make sure Column doesn't overflow
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingWidget(),
                    Text(
                      widget.meal?.strMeal ?? "Null",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/deliveryicon.png", width: 12),
                        SizedBox(width: 4),
                        Text(
                          "Free delivery",
                          style: TextStyle(color: Color(0xFF7E8392), fontSize: 8),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Color(0xFFE54630),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "24.99\$",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
