import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/features/home/data/models/restaurant.dart';
import 'package:food_ninja/features/home/data/services/restaurants_service.dart';

part 'restaurant_details_state.dart';

class RestaurantDetailsCubit extends Cubit<RestaurantDetailsState> {
  final RestaurantsService _restaurantsService;
  RestaurantDetailsCubit(this._restaurantsService)
      : super(RestaurantDetailsInitial());

  void loadRestaurantDetails(String restaurantRef) async {
    emit(RestaurantDetailsLoading());
    try {
      final restaurant = await _restaurantsService
          .getRestaurantDetails(restaurantRef)
          .timeout(const Duration(seconds: 7));
      emit(RestaurantDetailsLoaded(restaurant: restaurant));
    } catch (e) {
      emit(const RestaurantDetailsError(
          message: 'Failed to load restaurant details'));
    }
  }
}
