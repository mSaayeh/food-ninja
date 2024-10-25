import 'package:flutter_test/flutter_test.dart';
import 'package:food_ninja/features/home/data/models/meal.dart';
import 'package:food_ninja/features/home/data/models/restaurant.dart';

import '../../../../mocks.mocks.dart';

void main() {
  final mockDocumentRef = MockDocumentReference();

  group('Meal', () {
    const restaurant = Restaurant(
      name: 'Test Restaurant',
      rating: 4.5,
      imageUrl: 'https://example.com/restaurant.jpg',
      ref: 'restaurants/testRestaurant',
    );

    final meal = Meal(
      id: '1',
      imageUrl: 'https://example.com/meal.jpg',
      name: 'Test Meal',
      rating: 4.5,
      description: 'A delicious test meal.',
      restaurant: restaurant,
      price: 10.0,
      ref: mockDocumentRef,
    );

    test('Meal props should return the correct properties', () {
      expect(meal.props, [
        '1',
        'https://example.com/meal.jpg',
        'Test Meal',
        4.5,
        'A delicious test meal.',
        restaurant,
        10.0,
        mockDocumentRef,
      ]);
    });

    test('Meals with the same properties should be equal', () {
      final meal2 = Meal(
        id: '1',
        imageUrl: 'https://example.com/meal.jpg',
        name: 'Test Meal',
        rating: 4.5,
        description: 'A delicious test meal.',
        restaurant: restaurant,
        price: 10.0,
        ref: mockDocumentRef,
      );

      expect(meal, equals(meal2));
    });

    test('Meal stringify should return a string', () {
      expect(meal.stringify, true);
    });

    test('Meal toString should return correct string representation', () {
      final expectedString =
          'Meal(imageUrl: https://example.com/meal.jpg, id: 1, name: Test Meal, rating: 4.5, description: A delicious test meal., restaurant: $restaurant, price: 10.0)';
      expect(meal.toString(), contains('Meal'));
    });
  });
}
