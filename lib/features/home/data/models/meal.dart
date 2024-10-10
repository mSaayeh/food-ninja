// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:food_ninja/features/home/data/models/restaurant.dart';

class Meal extends Equatable {
  final String? imageUrl;
  final String ref;
  final String name;
  final double rating;
  final String description;
  final Restaurant restaurant;
  final double price;

  const Meal({
    required this.imageUrl,
    required this.name,
    required this.rating,
    required this.description,
    required this.restaurant,
    required this.price,
    required this.ref,
  });

  @override
  List<Object?> get props =>
      [imageUrl, name, rating, description, restaurant, price, ref];

  @override
  bool get stringify => true;
}
