import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_ninja/core/util/get_meal.dart';
import 'package:food_ninja/features/home/data/models/restaurant.dart';

abstract class RestaurantsService {
  Future<List<Restaurant>> getRestaurants();
  Future<Restaurant> getRestaurantDetails(String ref);
}

class RestaurantsServiceImpl implements RestaurantsService {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<List<Restaurant>> getRestaurants() async {
    final restaurants = await firestore.collection('restaurants').get();
    return Future.wait(restaurants.docs.map((e) async {
      final imageUrl =
          await FirebaseStorage.instance.ref(e['image_url']).getDownloadURL();
      return Restaurant(
        imageUrl: imageUrl,
        name: e['name'],
        rating: e['rating'],
        ref: e.reference.id,
      );
    }).toList());
  }

  @override
  Future<Restaurant> getRestaurantDetails(String ref) async {
    final restaurant = await firestore.collection('restaurants').doc(ref).get();
    late String imageUrl;
    late String detailsImageUrl;
    try {
      imageUrl = await FirebaseStorage.instance
          .ref(restaurant['image_url'])
          .getDownloadURL();
      detailsImageUrl = await FirebaseStorage.instance
          .ref(restaurant['details_image_url'])
          .getDownloadURL();
    } catch (e) {
      imageUrl = 'assets/images/Logo.png';
      detailsImageUrl = 'assets/images/Logo.png';
    }
    final meals = await restaurant.reference.collection('meals').get();
    final mealsList = await Future.wait(meals.docs.map(getMeal).toList());
    return Restaurant(
      imageUrl: imageUrl,
      name: restaurant['name'],
      rating: restaurant['rating'],
      ref: restaurant.reference.id,
      description: restaurant['description'],
      detailsImageUrl: detailsImageUrl,
      meals: mealsList,
    );
  }
}
