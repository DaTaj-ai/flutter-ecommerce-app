import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlab3/Models/meal_response_model.dart';

import 'meals_offers_card_item.dart';
import '../../Service/NetworkService.dart';


class MealsOffersList extends StatefulWidget {
  MealsOffersList({super.key, required this.selectedCategory});

  String? selectedCategory;

  @override
  State<MealsOffersList> createState() => _MealsOffersListState();
}

class _MealsOffersListState extends State<MealsOffersList> {
  late Future<MealsResponseModel> response;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    response = NetworkService.getMealsByCategory(widget.selectedCategory??"SeaFood");

  }


  @override
  void didUpdateWidget(covariant MealsOffersList oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    print("WE are in Meals List ");
    print("Alama ----- ${widget.selectedCategory}");
    response = NetworkService.getMealsByCategory(widget.selectedCategory??"SeaFood");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: response,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.meals!.length /*snapshot.data!.meals?.length*/,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return OffersCard(meal: snapshot.data!.meals![index]);
            },
          );
        } else {
          return Center(child: Text('No data'));
        }
      },
    );
  }
}
