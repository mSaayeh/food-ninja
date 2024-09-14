import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:food_ninja/core/util/network_info.dart';
import 'package:food_ninja/features/home/data/services/promos_service.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Connectivity
  sl.registerLazySingleton(() => Connectivity());

  // Network Info
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectivity: sl()));

  // services
  sl.registerLazySingleton<PromosService>(() => PromosServiceImpl());
}
