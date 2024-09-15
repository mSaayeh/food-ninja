import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_ninja/features/home/data/models/restaurant.dart';

abstract class RestaurantsService {
  Future<List<Restaurant>> getRestaurants();
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
      );
    }).toList());
  }
}
