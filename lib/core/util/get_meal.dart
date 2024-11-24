import 'dart:developer';

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
    description: restaurantData['description'] ?? 'No description',
    detailsImageUrl: restaurantData['details_image_url'] ?? '',
    rating: restaurantData['rating'] ?? 0.0,
    ref: '/${restaurantDoc.reference.path}',
  );

  late Meal meal;

  try {
    final imageUrl = e.data()?['image_url'] ?? '';
    late String mealImageUrl;
    if (imageUrl.isNotEmpty) {
      mealImageUrl =
          await FirebaseStorage.instance.ref(imageUrl!).getDownloadURL();
    } else {
      mealImageUrl = '';
    }

    meal = Meal(
      id: e.id,
      imageUrl: mealImageUrl,
      name: e.data()?['name'] ?? 'Unnamed Meal',
      rating: e.data()?['rating'] ?? 0.0,
      description: e.data()?['description'] ?? 'No description',
      restaurant: restaurant,
      price: double.parse("${e.data()?['price'] ?? 0}"),
      ref: e.reference,
    );
  } catch (error) {
    log('Error creating meal from document ${e.id}', error: error);
  }

  return meal;
}
