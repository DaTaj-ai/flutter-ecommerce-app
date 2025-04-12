import 'package:flutter/material.dart';

import '../../Models/CategoryModel.dart';
import '../../Models/category_response_model.dart';


class Categoryitemwidget extends StatefulWidget {
  final Categories categori;

  Categoryitemwidget({required this.categori, super.key , required this.ontap});
  void Function(String) ontap;

  @override
  State<Categoryitemwidget> createState() => _CategoryitemwidgetState();
}

class _CategoryitemwidgetState extends State<Categoryitemwidget> {
  @override
  Widget build(BuildContext context) {
    final category = widget.categori;
    return GestureDetector(
      onTap: () {
        widget.ontap(category.strCategory ?? "SeaFood") ;
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: 100,
        width: 80,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Image.network(
              category.strCategoryThumb?? "Null",
              width: 60,
              height: 75,
            ),
            Text(
              category.strCategory ?? "Null Category",
              style: TextStyle(color: Colors.black, fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


