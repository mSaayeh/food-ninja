part of 'home_cubit.dart';

abstract class PromotionsState extends Equatable {
  const PromotionsState();

  @override
  List<Object> get props => [];
}

final class PromotionsLoading extends PromotionsState {}

final class PromotionsLoaded extends PromotionsState {
  final List<Promotion> promotions;

  const PromotionsLoaded(this.promotions);

  @override
  List<Object> get props => [promotions];
}

abstract class RestaurantsState extends Equatable {
  const RestaurantsState();

  @override
  List<Object?> get props => [];
}

final class RestaurantsLoading extends RestaurantsState {}

final class RestaurantsLoaded extends RestaurantsState {
  final List<Restaurant> restaurants;

  const RestaurantsLoaded(this.restaurants);

  @override
  List<Object?> get props => [restaurants];
}

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object?> get props => [];
}

final class MenuLoading extends MenuState {}

final class MenuLoaded extends MenuState {
  final List<Meal> meals;

  const MenuLoaded(this.meals);

  @override
  List<Object?> get props => [meals];
}

final class HomeState extends Equatable {
  final PromotionsState promotionsState;
  final RestaurantsState restaurantsState;
  final MenuState menuState;
  final bool isSearch;

  HomeState.initial()
      : promotionsState = PromotionsLoading(),
        restaurantsState = RestaurantsLoading(),
        menuState = MenuLoading(),
        isSearch = false;

  const HomeState({
    required this.promotionsState,
    required this.restaurantsState,
    required this.menuState,
    required this.isSearch,
  });

  HomeState copyWith({
    PromotionsState? promotionsState,
    RestaurantsState? restaurantsState,
    MenuState? menuState,
    bool? isSearch,
  }) =>
      HomeState(
        promotionsState: promotionsState ?? this.promotionsState,
        restaurantsState: restaurantsState ?? this.restaurantsState,
        menuState: menuState ?? this.menuState,
        isSearch: isSearch ?? this.isSearch,
      );

  @override
  List<Object?> get props =>
      [promotionsState, restaurantsState, menuState, isSearch];
}
