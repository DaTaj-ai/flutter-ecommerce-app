import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterlab3/globalWidgets/RatingWidget.dart';
import '../../ DetailsScreen/widgets/BottomSheetWidget.dart';
import '../../Models/meal_response_model.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({super.key, required this.meal});
  final Meals? meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: 0.9, // 80% of screen height
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                child: MealDetailsScreen(meal: meal),
              ),
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.all(5.w),
        height: 100.h,
        width: 256.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: const Color(0xFFFF6B57),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6.r,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image Section
            ClipRRect(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(12.r)),
              child: Image.network(
                meal?.strMealThumb ?? "",
                width: 100.w,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.fastfood, color: Colors.grey),
                ),
              ),
            ),

            // Content Section
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 10.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Rating Row
                    const RatingWidget(ratingColor: Colors.white),
                    SizedBox(height: 4.h),

                    // Restaurant Name
                    Text(
                      meal?.strMeal ?? "Burger King",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),

                    // Delivery Info
                    Row(
                      children: [
                        Icon(Icons.delivery_dining,
                          size: 14.sp,
                          color: const Color(0xFFFFB8AE),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "Free delivery",
                          style: TextStyle(
                            color: const Color(0xFFFFB8AE),
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),

                    // Price and CTA Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Buy Now Button
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE54630),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // Price
                        Text(
                          "\$${"22.0"}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
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