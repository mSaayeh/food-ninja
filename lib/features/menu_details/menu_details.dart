import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/widgets/double_fall_back_image.dart';
import 'package:food_ninja/features/home/data/models/meal.dart';

class MenuDetails extends StatefulWidget {
  const MenuDetails({super.key, required this.meal});

  final Meal meal;

  @override
  State<MenuDetails> createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  double sheetPosition = 0.6;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            DoubleFallBackImage(
              mainNetworkImage: widget.meal.imageUrl,
              fallBackNetworkImage: widget.meal.restaurant.imageUrl,
              fallBackLocalImage: 'assets/images/Logo.png',
              size: MediaQuery.of(context).size.height * 0.45,
            ),
            SafeArea(
              child: DraggableScrollableSheet(
                snap: true,
                initialChildSize: sheetPosition,
                minChildSize: sheetPosition,
                maxChildSize: 0.95,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(45.r),
                        topLeft: Radius.circular(45.r),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32.w),
                          child: ListView(
                            controller: scrollController,
                            children: [
                              SizedBox(height: 20.h),
                              Center(
                                child: Container(
                                  width: 50.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffD9D9D9),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30.h),
                              Text('${widget.meal.name}')
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 20.h,
                          right: 20.w,
                          left: 20.w,
                          child: FilledButton(
                            style: Theme.of(context)
                                .filledButtonTheme
                                .style
                                ?.copyWith(
                                  padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(vertical: 5.h),
                                  ),
                                ),
                            onPressed: () {},
                            child: Text(
                              'Add To Cart',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFFEFEFF),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
