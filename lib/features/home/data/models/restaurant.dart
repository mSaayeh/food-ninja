// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final String name;
  final double rating;
  final String? imageUrl;

  const Restaurant({
    required this.name,
    required this.rating,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, rating, imageUrl];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'rating': rating,
      'image_url': imageUrl,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      name: map['name'] as String,
      rating: map['rating'] as double,
      imageUrl: map['image_url'] as String,
    );
  }

  @override
  bool get stringify => true;
}
