import 'package:flutter/material.dart';
import 'package:flutterlab3/%20DetailsScreen/widgets/RestaurantCard.dart';
import 'package:flutterlab3/HomeScreen/widget/category_list.dart';
import '../HomeScreen/widget/meals_offers_list.dart';

class DetailsScreen extends StatefulWidget {
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            children: [
              Text("Deliver to"),
              Image.asset("assets/images/downarrow.png"),
              Text("387  Merdina"),
            ],
          ),
        ),
        leading: Image.asset("assets/images/homemenu.png"),
        actions: [Image.asset("assets/images/homeprofile.png")],
      ),
      body: Stack(
        children: [
          // FLag
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          colors: [Color(0xFFFE724D), Color(0xFFFFC529)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        );
                      },
                      child: Text(
                        textAlign: TextAlign.start,
                        "Good Afternoon!",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          // Ensures the text color is visible within the gradient
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SearchBar(
                      hintText: "Search dishes, restaurants",
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Image.asset("assets/images/searchicon.png"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 105,
                child: CategoryListWidget(
                  ontap: (value) {
                    setState(() {
                      selectedCategory = value;
                      print("We are hhheeeeeeeerrreeeeee $selectedCategory");
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special Offers",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(fontSize: 18, color: Color(0xFFFF6B57)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 12),
                child: SizedBox(
                  height: 130,
                  child: MealsOffersList(selectedCategory: selectedCategory),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Restaurants",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(fontSize: 18, color: Color(0xFFFF6B57)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 12),
                child: SizedBox(
                  height: 230,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return RestaurantCard();
                    },
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
