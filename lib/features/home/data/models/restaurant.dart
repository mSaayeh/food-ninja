import 'package:equatable/equatable.dart';
import 'package:food_ninja/features/home/data/models/meal.dart';

class Restaurant extends Equatable {
  final String name;
  final double rating;
  final String? imageUrl;
  final String ref;
  final String? description;
  final String? detailsImageUrl;
  final List<Meal>? meals;

  const Restaurant({
    required this.name,
    required this.rating,
    required this.imageUrl,
    required this.ref,
    this.detailsImageUrl,
    this.description,
    this.meals,
  });

  @override
  List<Object?> get props =>
      [name, rating, imageUrl, ref, description, meals, detailsImageUrl];

  @override
  bool get stringify => true;
}
