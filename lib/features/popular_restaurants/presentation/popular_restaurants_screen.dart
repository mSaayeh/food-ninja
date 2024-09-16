import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/widgets/background_widget.dart';
import 'package:food_ninja/core/widgets/home_flow/home_header.dart';
import 'package:food_ninja/core/widgets/home_flow/home_section.dart';
import 'package:food_ninja/core/widgets/restaurant_list_tile.dart';
import 'package:food_ninja/di/app_module.dart';
import 'package:food_ninja/features/home/presentation/cubit/home_cubit.dart';

class PopularRestaurantsScreen extends StatelessWidget {
  const PopularRestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(sl(), sl(), sl())..loadRestaurants(),
      child: Scaffold(
        body: BackgroundWidget(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0.w),
              child: Column(
                children: [
                  const HomeHeader(
                    hasBackButton: true,
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return HomeSection(
                        title: 'Popular Restaurants',
                        heroTag: 'rest_title',
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            if (state.restaurantsState is RestaurantsLoaded) {
                              final rest =
                                  (state.restaurantsState as RestaurantsLoaded)
                                      .restaurants[index];
                              return RestaurantListTile(
                                restaurant: rest,
                                onClick: () {},
                              );
                            } else {
                              return const RestaurantListTile.loading();
                            }
                          },
                          itemCount: state.restaurantsState is RestaurantsLoaded
                              ? (state.restaurantsState as RestaurantsLoaded)
                                  .restaurants
                                  .length
                              : 4,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
