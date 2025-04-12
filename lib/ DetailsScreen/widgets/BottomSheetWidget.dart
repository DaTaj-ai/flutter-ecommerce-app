import 'package:flutter/material.dart';
import '../../Models/meal_response_model.dart';
import '../../Service/NetworkService.dart';
import '../../globalWidgets/RatingWidget.dart';
import '../../globalWidgets/deliveryWidget.dart';

class Bottomsheetwidget extends StatefulWidget {
  Bottomsheetwidget({super.key, required this.meal});

  Meals? meal;

  @override
  State<Bottomsheetwidget> createState() => _BottomsheetwidgetState();
}

class _BottomsheetwidgetState extends State<Bottomsheetwidget> {
  late Future<MealsResponseModel> response;

  @override
  void initState() {
    super.initState();
    print("YYYYYYYYYEEEEEEEEEEESSSSSSSSSS you are here ");
    response = NetworkService.getMealbyId(widget.meal!.idMeal!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MealsResponseModel>(
      future: response,
      builder: (context, snapshot) {
        // Handle loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // Handle error state
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // Handle no data state
        if (!snapshot.hasData || snapshot.data!.meals == null ||
            snapshot.data!.meals!.isEmpty) {
          return const Center(child: Text('No meal data available'));
        }

        final mealDetails = snapshot.data!.meals!.first;
        return _buildContent(mealDetails);

      },
    );
  }

  Widget _buildContent(Meals mealDetails) {
    return Container(
      height: 800,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white, // Sets the background color
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    widget.meal!.strMealThumb!,
                  ), // Adjusts how the image fits the container
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                  right: 25,
                  top: 25,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/backicon.png"),
                    Image.asset("assets/images/loveicon.png"),
                  ],
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title and Price Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                widget.meal!.strMeal!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              "24.99\$",
                              style: TextStyle(
                                color: Color(0xFFFF6B57),
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: [
                            // Delivery
                            DeliveryWidget(),
                            Image.asset("assets/images/timeicon.png"),
                            SizedBox(width: 4),
                            Text(
                              "45 min",
                              style: TextStyle(color: Color(0xFF7E8392)),
                            ),

                            // Rating
                            RatingWidget(ratingColor: Colors.black),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),

                  Text(
                    mealDetails.strInstructions ??
                        "No instructions available",
                    style: TextStyle(color: Color(0xFFFF646982)),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomSheet: BottomSheet(
          elevation: 80,
          onClosing: () {},
          builder: (context) {
            return ClipRRect(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24)),
              child: Container(
                color: Color(0xFFF242731),
                height: 200,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25.0,
                    top: 25,
                    right: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Toping for you",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 16),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
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
                                  "Pepperoni",
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
                      },
                    ),
                  ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xFFFF18191D),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/addicon.png"),
              ),
              Text(
                "2",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/minusicon.png"),
              ),
              Container(
                padding: EdgeInsets.only(left: 35),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFFF6B57),
                    minimumSize: Size(210, 50),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('added successful!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text(
                    "Add 2 to basket \$22.34",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

}
