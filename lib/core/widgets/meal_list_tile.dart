import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:food_ninja/core/widgets/double_fall_back_image.dart';
import 'package:food_ninja/features/home/data/models/meal.dart';

class MealListTile extends StatelessWidget {
  final Meal? meal;
  final void Function()? onClick;

  const MealListTile({super.key, required this.meal, required this.onClick});
  const MealListTile.loading({super.key})
      : meal = null,
        onClick = null;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.r)),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        clipBehavior: Clip.hardEdge,
        child: DoubleFallBackImage(
          mainNetworkImage: meal!.imageUrl,
          fallBackNetowrkImage: meal!.restaurant.imageUrl,
          fallBackLocalImage: 'assets/images/Logo.png',
          size: 64,
        ),
      ),
      trailing: Text(
        "\$${meal!.price}",
        style: TextStyle(
          fontSize: 15.sp,
          fontFamily: bentonSansFontFamily,
          fontWeight: FontWeight.bold,
          color: lightOrange,
        ),
      ),
      onTap: onClick,
      title: Text(
        meal!.name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(
        meal!.restaurant.name,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
