import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:food_ninja/core/widgets/double_fall_back_image.dart';
import 'package:food_ninja/core/widgets/shimmer_placeholder.dart';
import 'package:food_ninja/features/home/data/models/meal.dart';
import 'package:shimmer/shimmer.dart';

class MealListTile extends StatelessWidget {
  final Meal? meal;
  final void Function()? onClick;

  const MealListTile({super.key, required this.meal, required this.onClick});
  const MealListTile.loading({super.key})
      : meal = null,
        onClick = null;

  @override
  Widget build(BuildContext context) {
    return meal != null
        ? _buildTile(context)
        : Shimmer.fromColors(
            period: const Duration(seconds: 3),
            baseColor: Colors.grey.shade700,
            highlightColor: Colors.grey.shade300,
            child: _buildTile(context),
          );
  }

  Widget _buildTile(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
      tileColor: Colors.grey.shade200.withOpacity(.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.r)),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        clipBehavior: Clip.hardEdge,
        child: meal != null
            ? DoubleFallBackImage(
                mainNetworkImage: meal!.imageUrl,
                fallBackNetworkImage: meal!.restaurant.imageUrl,
                fallBackLocalImage: 'assets/images/Logo.png',
                size: 64,
              )
            : const ShimmerPlaceholder(width: 64, height: 64),
      ),
      trailing: meal != null
          ? Text(
              "\$${meal!.price}",
              style: TextStyle(
                fontSize: 15.sp,
                fontFamily: bentonSansFontFamily,
                fontWeight: FontWeight.bold,
                color: lightOrange,
              ),
            )
          : const ShimmerPlaceholder(width: 12, height: 8),
      onTap: onClick,
      title: meal != null
          ? Text(
              meal!.name,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          : const ShimmerPlaceholder(width: 12, height: 8),
      subtitle: meal != null
          ? Text(
              meal!.restaurant.name,
              style: Theme.of(context).textTheme.labelSmall,
            )
          : const ShimmerPlaceholder(width: 12, height: 8),
    );
  }
}
