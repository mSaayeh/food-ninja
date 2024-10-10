part of 'restaurant_details_cubit.dart';

sealed class RestaurantDetailsState extends Equatable {
  const RestaurantDetailsState();

  @override
  List<Object> get props => [];
}

final class RestaurantDetailsInitial extends RestaurantDetailsState {}

final class RestaurantDetailsLoading extends RestaurantDetailsState {}

final class RestaurantDetailsLoaded extends RestaurantDetailsState {
  final Restaurant restaurant;

  const RestaurantDetailsLoaded({
    required this.restaurant,
  });

  @override
  List<Object> get props => [restaurant];
}

final class RestaurantDetailsError extends RestaurantDetailsState {
  final String message;

  const RestaurantDetailsError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
