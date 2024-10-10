import 'package:food_ninja/features/cart/data/services/cart_service.dart';
import 'package:food_ninja/features/home/data/services/menu_service.dart';
import 'package:food_ninja/features/home/data/services/promotions_service.dart';
import 'package:food_ninja/features/home/data/services/restaurants_service.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // services
  sl.registerLazySingleton<PromotionsService>(() => PromotionsServiceImpl());
  sl.registerLazySingleton<RestaurantsService>(() => RestaurantsServiceImpl());
  sl.registerLazySingleton<MenuService>(() => MenuServiceImpl());
  sl.registerLazySingleton<CartService>(() => CartServiceImpl());
}
