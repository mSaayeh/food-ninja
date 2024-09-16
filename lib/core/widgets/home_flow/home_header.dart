import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/widgets/app_header.dart';
import 'package:food_ninja/core/widgets/home_flow/food_search_bar.dart';
import 'package:go_router/go_router.dart';

class HomeHeader extends StatelessWidget {
  final bool hasBackButton;

  const HomeHeader({super.key, this.hasBackButton = false});

  void navigateBack(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10.h),
        Visibility(
          visible: hasBackButton,
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: IconButton(
              onPressed: () => navigateBack(context),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        SizedBox(height: 50.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: const AppHeader(),
        ),
        SizedBox(height: 18.h),
        const FoodSearchBar(),
        SizedBox(height: 20.h),
      ],
    );
  }
}
