import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/widgets/app_header.dart';
import 'package:food_ninja/core/widgets/background_widget.dart';
import 'package:food_ninja/core/widgets/filter_button.dart';
import 'package:food_ninja/core/widgets/food_search_bar.dart';
import 'package:food_ninja/core/widgets/meal_list_tile.dart';
import 'package:food_ninja/core/widgets/restaurant_list_tile.dart';
import 'package:food_ninja/di/app_module.dart';
import 'package:food_ninja/features/home/presentation/cubit/home_cubit.dart';
import 'package:food_ninja/features/home/presentation/widgets/home_section.dart';
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
      child: Scaffold(
        body: BackgroundWidget(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 60.h),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: AppHeader(),
                    ),
                    SizedBox(height: 18.h),
                    Row(
                      children: [
                        const Expanded(child: FoodSearchBar()),
                        SizedBox(width: 8.w),
                        const FilterButton(),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            if (state.promotionsState is PromotionsLoading)
                              const Promotions.loading()
                            else
                              Promotions(
                                promos:
                                    (state.promotionsState as PromotionsLoaded)
                                        .promotions,
                              ),
                            HomeSection(
                              title: 'Nearest Restaurant',
                              buttonText: 'View More',
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
                                  itemCount: state.restaurantsState
                                          is RestaurantsLoading
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
                              buttonText: 'View More',
                              child: ListView.builder(
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
                                    : (state.menuState as MenuLoaded)
                                        .meals
                                        .length,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
