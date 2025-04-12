import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterlab3/HomeScreen/widget/RestaurantCard.dart';
import 'package:flutterlab3/HomeScreen/widget/category_list.dart';
import 'widget/meals_offers_list.dart';

class HomeScreenUi extends StatefulWidget {
  @override
  State<HomeScreenUi> createState() => _HomeScreenUiState();
}

class _HomeScreenUiState extends State<HomeScreenUi> {
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
        leading: Image.asset("assets/images/homemenu.png" , width: 80, height: 80, ),
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
                    Positioned(left: 0 , top: 0,
                      child: ShaderMask(
                        shaderCallback: (bounds) {
                          return LinearGradient(
                            colors: [Color(0xFFFE724D), Color(0xFFFFC529)],
                          ).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          );
                        },
                        child: Align(alignment: Alignment.centerLeft,
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
                      ),
                    ),
                    SizedBox(height: 16),

                       SearchBar(
                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(15.0))),
                        hintText: "Search dishes, restaurants",
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Image.asset("assets/images/searchicon.png"),
                        ),
                      ),

                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: CategoryListWidget(
                    ontap: (value) {
                      setState(() {
                        selectedCategory = value;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 0, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special Offers",
                      style: TextStyle(
                        fontSize: 22.sp,
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
              SizedBox(height: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: SizedBox(
                    child: MealsOffersList(selectedCategory: selectedCategory),
                  ),
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
                        fontSize: 22.sp,
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
