import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_ninja/features/home/data/models/meal.dart';
import 'package:food_ninja/features/home/data/models/restaurant.dart';

Future<Meal> getMeal(DocumentSnapshot<Map<String, dynamic>> e) async {
  final restaurantRef =
      e.data()?['restaurant'] as DocumentReference<Map<String, dynamic>>?;
  if (restaurantRef == null) {
    throw Exception("Field 'restaurant' is missing in document ${e.id}");
  }

  final restaurantDoc = await restaurantRef.get();
  final restaurantData = restaurantDoc.data();
  if (restaurantData == null) {
    throw Exception(
        "Restaurant data is missing in document ${restaurantDoc.id}");
  }

  final restaurantImageUrl = await FirebaseStorage.instance
      .ref(restaurantData['image_url'] ?? '')
      .getDownloadURL();

  final restaurant = Restaurant(
    imageUrl: restaurantImageUrl,
    name: restaurantData['name'] ?? 'Unknown Restaurant',
    rating: restaurantData['rating'] ?? 0.0,
    ref: '/${restaurantDoc.reference.path}',
  );

  return Meal(
    id: e.id,
    imageUrl: '',
    name: e.data()?['name'] ?? 'Unnamed Meal',
    rating: e.data()?['rating'] ?? 0.0,
    description: e.data()?['description'] ?? 'No description',
    restaurant: restaurant,
    price: e.data()?['price'] ?? 0.0,
    ref: e.reference,
  );
}
