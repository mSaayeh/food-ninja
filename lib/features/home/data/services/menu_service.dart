import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_ninja/core/util/get_meal.dart';
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
}
