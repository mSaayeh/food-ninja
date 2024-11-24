import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/features/home/data/models/meal.dart';
import 'package:food_ninja/features/home/data/models/promotion.dart';
import 'package:food_ninja/features/home/data/models/restaurant.dart';
import 'package:food_ninja/features/home/data/services/menu_service.dart';
import 'package:food_ninja/features/home/data/services/promotions_service.dart';
import 'package:food_ninja/features/home/data/services/restaurants_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final PromotionsService promosService;
  final RestaurantsService restaurantsService;
  final MenuService menuService;

  HomeCubit(this.promosService, this.restaurantsService, this.menuService)
      : super(HomeState.initial());

  Future<void> loadPromotions() async {
    emit(state.copyWith(promotionsState: PromotionsLoading()));

    final promotions = await promosService.getPromotions();

    emit(state.copyWith(promotionsState: PromotionsLoaded(promotions)));
  }

  Future<void> loadRestaurants([String? searchQuery]) async {
    emit(state.copyWith(restaurantsState: RestaurantsLoading()));

    final restaurants = await restaurantsService.getRestaurants(searchQuery);

    emit(state.copyWith(restaurantsState: RestaurantsLoaded(restaurants)));
  }

  Future<void> loadMenu() async {
    emit(state.copyWith(menuState: MenuLoading()));

    final popularMeals = await menuService.getPopularMeals();

    emit(state.copyWith(menuState: MenuLoaded(popularMeals)));
  }
}
