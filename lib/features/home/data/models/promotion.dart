import 'package:equatable/equatable.dart';

class Promotion extends Equatable {
  final String imageUrl;
  final String redirectUrl;

  const Promotion({
    required this.imageUrl,
    required this.redirectUrl,
  });

  @override
  List<Object?> get props => [imageUrl, redirectUrl];

  @override
  String toString() => 'Promo(imageUrl: $imageUrl, redirectUrl: $redirectUrl)';
}
