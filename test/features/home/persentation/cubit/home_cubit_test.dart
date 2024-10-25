import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_ninja/features/home/data/models/meal.dart';
import 'package:food_ninja/features/home/data/models/restaurant.dart';
import 'package:food_ninja/features/home/data/services/menu_service.dart';
import 'package:food_ninja/features/home/data/services/promotions_service.dart';
import 'package:food_ninja/features/home/data/services/restaurants_service.dart';
import 'package:food_ninja/features/home/presentation/cubit/home_cubit.dart';
import 'package:mockito/mockito.dart';

class MockMenuService extends Mock implements MenuService {}

class MockPromotionsService extends Mock implements PromotionsService {}

class MockRestaurantsService extends Mock implements RestaurantsService {}

void main() {
  late HomeCubit homeCubit;
  late MockMenuService mockMenuService;
  late MockPromotionsService mockPromotionsService;
  late MockRestaurantsService mockRestaurantsService;
  late FakeFirebaseFirestore fakeFirestore;

  setUp(() {
    fakeFirestore = FakeFirebaseFirestore();
    mockMenuService = MockMenuService();
    mockPromotionsService = MockPromotionsService();
    mockRestaurantsService = MockRestaurantsService();
    homeCubit = HomeCubit(
        mockPromotionsService, mockRestaurantsService, mockMenuService);
  });

  group('HomeCubit', () {
    test('loadMenu emits MenuLoaded state', () async {
      final fakeMeal = Meal(
        id: '1',
        imageUrl: 'https://example.com/meal.jpg',
        name: 'Test Meal',
        rating: 4.5,
        description: 'A delicious test meal.',
        restaurant: const Restaurant(
          name: 'Test Restaurant',
          rating: 4.5,
          imageUrl: 'https://example.com/restaurant.jpg',
          ref: 'restaurants/testRestaurant',
        ),
        price: 10.0,
        ref: fakeFirestore.doc('meals/1'),
      );

      when(mockMenuService.getPopularMeals())
          .thenReturn(Future.value([fakeMeal]));

      await homeCubit.loadMenu();

      expect(homeCubit.state.menuState, isA<MenuLoaded>());
      final menuLoadedState = homeCubit.state.menuState as MenuLoaded;
      expect(menuLoadedState.meals.first.name, 'Test Meal');
    });
  });
}
