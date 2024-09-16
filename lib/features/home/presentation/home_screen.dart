import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/navigation/app_router.dart';
import 'package:food_ninja/core/widgets/background_widget.dart';
import 'package:food_ninja/core/widgets/home_flow/home_header.dart';
import 'package:food_ninja/core/widgets/home_flow/home_section.dart';
import 'package:food_ninja/core/widgets/meal_list_tile.dart';
import 'package:food_ninja/core/widgets/restaurant_list_tile.dart';
import 'package:food_ninja/di/app_module.dart';
import 'package:food_ninja/features/home/presentation/cubit/home_cubit.dart';
import 'package:food_ninja/features/home/presentation/widgets/promotions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(sl(), sl(), sl())
        ..loadPromotions()
        ..loadRestaurants()
        ..loadMenu(),
      child: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40.h),
                const HomeHeader(),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        if (state.promotionsState is PromotionsLoading)
                          const Promotions.loading()
                        else
                          Promotions(
                            promos: (state.promotionsState as PromotionsLoaded)
                                .promotions,
                          ),
                        HomeSection(
                          title: 'Popular Restaurants',
                          heroTag: 'rest_title',
                          buttonText: 'View More',
                          navigationPath: '$home/$popularRestaurats',
                          child: SizedBox(
                            height: 190.h,
                            width: double.infinity,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                if (state.restaurantsState
                                    is RestaurantsLoading) {
                                  return const RestaurantListTile.loading();
                                } else {
                                  return RestaurantListTile(
                                    restaurant: (state.restaurantsState
                                            as RestaurantsLoaded)
                                        .restaurants[index],
                                    onClick: () {},
                                  );
                                }
                              },
                              itemCount:
                                  state.restaurantsState is RestaurantsLoading
                                      ? 3
                                      : (state.restaurantsState
                                              as RestaurantsLoaded)
                                          .restaurants
                                          .length,
                            ),
                          ),
                        ),
                        HomeSection(
                          title: 'Popular Menu',
                          child: ListView.separated(
                            physics: const ClampingScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 16.h),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              if (state.menuState is MenuLoading) {
                                return const MealListTile.loading();
                              } else {
                                return MealListTile(
                                  meal: (state.menuState as MenuLoaded)
                                      .meals[index],
                                  onClick: () {},
                                );
                              }
                            },
                            itemCount: state.menuState is MenuLoading
                                ? 3
                                : (state.menuState as MenuLoaded).meals.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    SizedBox(height: 10.h),
                          ),
                        ),
                        SizedBox(height: 70.h)
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
