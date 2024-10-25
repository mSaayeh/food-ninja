import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_ninja/features/home/data/services/menu_service.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockCollectionReference extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

class MockQuerySnapshot extends Mock
    implements QuerySnapshot<Map<String, dynamic>> {}

class MockQueryDocumentSnapshot extends Mock
    implements QueryDocumentSnapshot<Map<String, dynamic>> {}

class MockDocumentReference extends Mock
    implements DocumentReference<Map<String, dynamic>> {}

class MockDocumentSnapshot extends Mock
    implements DocumentSnapshot<Map<String, dynamic>> {}

void main() {
  late MenuServiceImpl menuService;
  late MockFirebaseFirestore mockFirestore;
  late MockCollectionReference mockCollectionReference;
  late MockQuerySnapshot mockQuerySnapshot;
  late MockQueryDocumentSnapshot mockQueryDocumentSnapshot;
  late MockDocumentReference mockDocumentReference;
  late MockDocumentSnapshot mockDocumentSnapshot;

  setUp(() {
    mockFirestore = MockFirebaseFirestore();
    mockCollectionReference = MockCollectionReference();
    mockQuerySnapshot = MockQuerySnapshot();
    mockQueryDocumentSnapshot = MockQueryDocumentSnapshot();
    mockDocumentReference = MockDocumentReference();
    mockDocumentSnapshot = MockDocumentSnapshot();

    when(mockFirestore.collection('popular_meals'))
        .thenReturn(mockCollectionReference);
    when(mockCollectionReference.get())
        .thenAnswer((_) async => mockQuerySnapshot);

    when(mockQuerySnapshot.docs).thenReturn([mockQueryDocumentSnapshot]);

    when(mockQueryDocumentSnapshot.data()).thenReturn({
      'ref': mockDocumentReference,
      'name': 'Meal 1',
      'rating': 4.5,
      'description': 'Delicious meal',
      'price': 10.0,
    });

    when(mockDocumentReference.get())
        .thenAnswer((_) async => mockDocumentSnapshot);

    when(mockDocumentSnapshot.data()).thenReturn({
      'name': 'Restaurant 1',
      'rating': 4.5,
      'image_url': 'restaurant_image_url',
    });

    menuService = MenuServiceImpl(firestore: mockFirestore);
  });

  test('getPopularMeals returns list of meals', () async {
    final meals = await menuService.getPopularMeals();

    expect(meals.length, 1);
    expect(meals.first.name, 'Meal 1');
    expect(meals.first.restaurant.name, 'Restaurant 1');
    expect(meals.first.restaurant.imageUrl, 'restaurant_image_url');
  });
}
