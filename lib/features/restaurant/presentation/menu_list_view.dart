import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/features/home/data/models/meal.dart';
import 'package:food_ninja/features/restaurant/presentation/meal_tile.dart';

class MenuListView extends StatelessWidget {
  final List<Meal> meals;
  const MenuListView({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final meal = meals[index];
        return MealTile(
          meal: meal,
          // TODO: Get the data from the cart service
          cartQuantity: 0,
          onClick: () {
            // TODO: Navigate to meal details
          },
        );
      },
      itemCount: meals.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 20.h);
      },
    );
  }
}
