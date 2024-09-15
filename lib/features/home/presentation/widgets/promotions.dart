import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:food_ninja/features/home/data/models/promotion.dart';
import 'package:shimmer/shimmer.dart';

class Promotions extends StatelessWidget {
  final List<Promotion>? promos;

  const Promotions.loading({super.key}) : promos = null;
  const Promotions({
    super.key,
    required this.promos,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: CarouselSlider.builder(
        itemBuilder: (context, index, realIndex) => promos?[index] == null
            ? Shimmer.fromColors(
                baseColor: gradientDarkGreen,
                highlightColor: gradientLightGreen,
                direction: ShimmerDirection.ltr,
                enabled: true,
                child: Container(
                  height: 150.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.white,
                  ),
                ),
              )
            : Image.network(
                promos![index].imageUrl,
                height: 150.h,
                fit: BoxFit.fitHeight,
              ),
        options: CarouselOptions(
          height: 150.h,
          enableInfiniteScroll: true,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 1,
          autoPlayCurve: Curves.easeInOut,
        ),
        itemCount: promos?.length ?? 1,
      ),
    );
  }
}
