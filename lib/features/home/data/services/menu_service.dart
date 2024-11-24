import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_ninja/core/util/get_meal.dart';
import 'package:food_ninja/features/home/data/models/meal.dart';

abstract class MenuService {
  Future<List<Meal>> getPopularMeals();
}

class MenuServiceImpl implements MenuService {
  final FirebaseFirestore firestore;

  MenuServiceImpl({required this.firestore});

  @override
  Future<List<Meal>> getPopularMeals() async {
    final popularMeals = await firestore.collection('popular_meals').get();

    return Future.wait(popularMeals.docs.map((e) async {
      final DocumentReference<Map<String, dynamic>> docRef = e['ref'];
      final doc = await docRef.get();
      return getMeal(doc);
    }).toList());
  }
}
