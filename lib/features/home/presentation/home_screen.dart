import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/widgets/app_header.dart';
import 'package:food_ninja/core/widgets/background_widget.dart';
import 'package:food_ninja/core/widgets/filter_button.dart';
import 'package:food_ninja/core/widgets/food_search_bar.dart';
import 'package:food_ninja/di/app_module.dart';
import 'package:food_ninja/features/home/presentation/bloc/home_bloc.dart';
import 'package:food_ninja/features/home/presentation/widgets/promotion.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(sl())..add(const HomeEvent.started()),
      child: Scaffold(
        body: BackgroundWidget(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is Loading) {
                        return const Promotions();
                      } else if (state is Loaded) {
                        log('Promos: ${state.promosList}');
                        return Column(
                          children: [
                            Promotions(promos: state.promosList),
                          ],
                        );
                      } else {
                        return const Text('Error');
                      }
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
