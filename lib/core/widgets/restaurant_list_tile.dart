import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/widgets/double_fall_back_image.dart';
import 'package:food_ninja/features/home/data/models/restaurant.dart';
import 'package:shimmer/shimmer.dart';

class RestaurantListTile extends StatelessWidget {
  final Restaurant? restaurant;
  final void Function()? onClick;

  const RestaurantListTile.loading({super.key})
      : restaurant = null,
        onClick = null;

  const RestaurantListTile({
    super.key,
    required this.restaurant,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      shadowColor: const Color(0x125A6CEA),
      color: Colors.grey.shade200.withOpacity(.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.r)),
      elevation: 100.r,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(8.r),
      child: SizedBox(
        height: 184.h,
        width: 147.w,
        child: restaurant != null
            ? InkWell(
                onTap: onClick,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DoubleFallBackImage(
                      mainNetworkImage: restaurant!.imageUrl,
                      fallBackLocalImage: 'assets/images/Logo.png',
                      size: 70,
                      boxFit: BoxFit.contain,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      restaurant!.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 4.h),
                    RatingBarIndicator(
                      rating: restaurant!.rating,
                      itemBuilder: (context, index) =>
                          const Icon(Icons.star, color: Colors.amber),
                      itemSize: 14.w,
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
