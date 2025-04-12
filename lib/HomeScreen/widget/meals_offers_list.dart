import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlab3/Models/meal_response_model.dart';

import '../../ DetailsScreen/widgets/OffersCard.dart';
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

    print("WE are in Meals List ");
    print("Alama ------ widget.selectedCategory${widget.selectedCategory}");


  }


  @override
  void didUpdateWidget(covariant MealsOffersList oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    print("WE are in Meals List ");
    print("Alama ----- ${widget.selectedCategory}");
    response = NetworkService.getMeals(widget.selectedCategory??"SeaFood");
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
            itemCount: 4 /*snapshot.data!.meals?.length*/,
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
