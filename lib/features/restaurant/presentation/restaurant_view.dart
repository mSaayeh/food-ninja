import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/widgets/double_fall_back_image.dart';
import 'package:food_ninja/di/app_module.dart';
import 'package:food_ninja/features/home/data/models/restaurant.dart';
import 'package:food_ninja/features/restaurant/cubit/restaurant_details_cubit.dart';
import 'package:food_ninja/features/restaurant/presentation/menu_list_view.dart';
import 'package:food_ninja/features/restaurant/presentation/rating_indicator_with_number.dart';

class RestaurantView extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantView({super.key, required this.restaurant});

  @override
  State<RestaurantView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {
  double sheetPosition = 0.6;
  final double dragSensitivity = 600;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => RestaurantDetailsCubit(sl())
        ..loadRestaurantDetails(widget.restaurant.ref),
      child: Scaffold(
        body: BlocBuilder<RestaurantDetailsCubit, RestaurantDetailsState>(
          builder: (context, state) {
            if (state is RestaurantDetailsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is RestaurantDetailsLoaded) {
              final rest = state.restaurant;
              return Stack(
                children: [
                  DoubleFallBackImage(
                    mainNetworkImage: rest.detailsImageUrl,
                    fallBackNetworkImage: rest.imageUrl,
                    fallBackLocalImage: 'assets/images/Logo.png',
                    size: height * 0.45,
                  ),
                  SafeArea(
                    child: DraggableScrollableSheet(
                      snap: true,
                      initialChildSize: sheetPosition,
                      minChildSize: 0.55,
                      maxChildSize: 0.95,
                      builder: (context, scrollController) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 32.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45.r),
                              topRight: Radius.circular(45.r),
                            ),
                          ),
                          child: Stack(
                            children: [
                              ListView(
                                controller: scrollController,
                                children: [
                                  SizedBox(height: 50.h),
                                  Text(
                                    rest.name,
                                    style: TextStyle(
                                      fontFamily: 'BentonSans',
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff09051C),
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 20.h),
                                    child: RatingIndicatorWithNumber(
                                      rating: rest.rating,
                                      label: "Rating",
                                      fontSize: 14.sp,
                                      iconSize: 20.w,
                                      iconPadding: 10.w,
                                    ),
                                  ),
                                  rest.description == null
                                      ? const SizedBox()
                                      : Text(
                                          rest.description!,
                                          maxLines: 4,
                                          style: TextStyle(
                                            fontFamily: 'BentonSans',
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12.sp,
                                            height: 1.5,
                                          ),
                                          textAlign: TextAlign.start,
                                          softWrap: true,
                                        ),
                                  rest.meals == null
                                      ? const SizedBox()
                                      : Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20.h),
                                          child: const Text(
                                            'Popular Menu',
                                            style: TextStyle(
                                              fontFamily: 'BentonSans Bold',
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff09051C),
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                  rest.meals == null
                                      ? const SizedBox()
                                      : MenuListView(
                                          meals: rest.meals!,
                                        ),
                                ],
                              ),
                              Positioned(
                                top: 20.h,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    width: 50.w,
                                    height: 5.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffD9D9D9),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return SafeArea(
                child: Center(
                  child: Text((state as RestaurantDetailsError).message),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
