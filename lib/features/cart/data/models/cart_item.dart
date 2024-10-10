import 'package:food_ninja/features/home/data/models/meal.dart';

class CartItem {
  Meal meal;
  int quantity;
  
  CartItem({
    required this.meal,
    required this.quantity,
  });
}
