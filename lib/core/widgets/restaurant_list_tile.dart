import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/util/extensions.dart';
import 'package:food_ninja/core/widgets/double_fall_back_image.dart';
import 'package:food_ninja/features/home/data/models/meal.dart';
import 'package:food_ninja/features/home/data/models/restaurant.dart';
import 'package:shimmer/shimmer.dart';

class CardListTile extends StatelessWidget {
  final Restaurant? restaurant;
  final void Function()? onClick;
  final Meal? meal;

  const CardListTile.loading({super.key})
      : restaurant = null,
        onClick = null,
        meal = null;

  const CardListTile.restaurant({
    super.key,
    required this.restaurant,
    required this.onClick,
  }) : meal = null;

  const CardListTile.meal({
    super.key,
    required this.meal,
    required this.onClick,
  }) : restaurant = null;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      shadowColor: const Color(0x125A6CEA),
      color: Colors.grey.shade200.withOpacity(.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.r)),
      elevation: 100.r,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: SizedBox(
        height: 184.h,
        width: 147.w,
        child: restaurant != null || meal != null
            ? InkWell(
                onTap: onClick,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DoubleFallBackImage(
                      mainNetworkImage: meal?.imageUrl,
                      fallBackNetworkImage: restaurant?.imageUrl,
                      fallBackLocalImage: 'assets/images/Logo.png',
                      size: 70,
                      boxFit: BoxFit.contain,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      restaurant?.name.capitalize() ?? meal!.name.capitalize(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 4.h),
                    restaurant != null
                        ? RatingBarIndicator(
                            rating: restaurant!.rating,
                            itemBuilder: (context, index) =>
                                const Icon(Icons.star, color: Colors.amber),
                            itemSize: 14.w,
                          )
                        : Text(
                            '\$${meal!.price}',
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                  ],
                ),
              )
            : Shimmer.fromColors(
                period: const Duration(seconds: 3),
                baseColor: Colors.grey.shade700,
                highlightColor: Colors.grey.shade300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 70.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        color: Colors.white.withOpacity(.5),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      height: 15.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        color: Colors.white.withOpacity(.5),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      height: 20.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        color: Colors.white.withOpacity(.5),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
