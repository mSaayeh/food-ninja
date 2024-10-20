import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_ninja/features/home/data/models/meal.dart';
import 'package:food_ninja/features/home/data/models/restaurant.dart';

Future<Meal> getMeal(DocumentSnapshot e) async {
  // final imageUrl =
  //     await FirebaseStorage.instance.ref(e['image_url']).getDownloadURL();
  final restaurantDoc = await e['restaurant'].get();
  log('restaurantDoc: $restaurantDoc');
  final restaurantData = restaurantDoc.data()!;
  final restaurantImageUrl = await FirebaseStorage.instance
      .ref(restaurantData['image_url'])
      .getDownloadURL();
  final restaurant = Restaurant(
    imageUrl: restaurantImageUrl,
    name: restaurantData['name'],
    rating: restaurantData['rating'],
    ref: '/${restaurantDoc.reference.path}',
  );
  return Meal(
    id: e.id,
    imageUrl: '',
    name: e['name'],
    rating: e['rating'],
    description: e['description'],
    restaurant: restaurant,
    price: e['price'],
    ref: e.reference,
  );
}
