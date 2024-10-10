import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_ninja/features/home/data/models/meal.dart';
import 'package:food_ninja/features/home/data/models/restaurant.dart';

abstract class MenuService {
  Future<List<Meal>> getPopularMeals();
}

class MenuServiceImpl implements MenuService {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<List<Meal>> getPopularMeals() async {
    final popularMeals = await firestore.collection('popular_meals').get();
    return Future.wait(popularMeals.docs.map((e) async {
      final doc = await e['ref'].get();
      return getMeal(doc);
    }).toList());
  }

  Future<Meal> getMeal(DocumentSnapshot e) async {
    // final imageUrl =
    //     await FirebaseStorage.instance.ref(e['image_url']).getDownloadURL();
    final restaurantData = (await e['restaurant'].get()).data()!;
    final restaurantImageUrl = await FirebaseStorage.instance
        .ref(restaurantData['image_url'])
        .getDownloadURL();
    final restaurant = Restaurant(
      imageUrl: restaurantImageUrl,
      name: restaurantData['name'],
      rating: restaurantData['rating'],
      ref: e.reference.id,
    );
    return Meal(
      imageUrl: '',
      name: e['name'],
      rating: e['rating'],
      description: e['description'],
      restaurant: restaurant,
      price: e['price'],
    );
  }
}
