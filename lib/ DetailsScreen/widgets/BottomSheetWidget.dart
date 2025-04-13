import 'package:flutter/material.dart';
import '../../Models/meal_response_model.dart';
import '../../Service/NetworkService.dart';
import '../../globalWidgets/RatingWidget.dart';
import '../../globalWidgets/deliveryWidget.dart';
import 'ingredients_item.dart';


class MealDetailsScreen extends StatefulWidget {
  final Meals? meal;

  const MealDetailsScreen({super.key, required this.meal});

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  late Future<MealsResponseModel> _mealDetailsFuture;

  @override
  void initState() {
    super.initState();
    _mealDetailsFuture = NetworkService.getMealbyId(widget.meal!.idMeal ?? " ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<MealsResponseModel>(
        future: _mealDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.meals == null || snapshot.data!.meals!.isEmpty) {
            return const Center(child: Text('No meal data available'));
          }

          final mealDetails = snapshot.data!.meals!.first;
          return _buildMainContent(mealDetails);
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildMainContent(Meals mealDetails) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Meal Image Header
              _buildMealImageHeader(),

              // Meal Details Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            widget.meal!.strMeal??"null",
                            style: const TextStyle(
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
                    const SizedBox(height: 16),

                    // Delivery and Rating Info
                    Row(
                      children: [
                        const DeliveryWidget(),
                        Image.asset("assets/images/timeicon.png"),
                        const SizedBox(width: 4),
                        Text(
                          "45 min",
                          style: TextStyle(color: Color(0xFF7E8392)),
                        ),

                        Padding(padding: EdgeInsets.only(left: 130)
                            ,child: RatingWidget(ratingColor: Colors.black)),
                      ],
                    ),
                    const SizedBox(height: 24),

                    Text(
                      mealDetails.strInstructions ?? "No instructions available",
                      style: TextStyle(color: Color(0xFF646982)),
                    ),
                    const SizedBox(height: 24),

                  ],
                ),
              ),

              const SizedBox(height: 200),
            ],
          ),
        ),

        // Toppings Bottom Sheet
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _buildToppingsBottomSheet(),
        ),
      ],
    );
  }

  Widget _buildMealImageHeader() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
        image: DecorationImage(
          image: NetworkImage(widget.meal!.strMealThumb!),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset("assets/images/backicon.png"),
              ),
              Image.asset("assets/images/loveicon.png"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToppingsBottomSheet() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xFF242731),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Topping for you",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.meal!.getIngredientMeasureList().length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IngredientsItem(
                    ingredientMeasureItem: widget.meal!.getIngredientMeasureList()[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 80,
      color: Color(0xFF18191D),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/minusicon.png"),
              ),
              Text(
                "2",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/addicon.png"),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFF6B57),
              minimumSize: Size(210, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added successfully!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Text(
              "Add 2 to basket \$22.34",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}


