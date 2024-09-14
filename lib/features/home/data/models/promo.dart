// ignore_for_file: public_member_api_docs, sort_constructors_first
class Promo {
  final String imageUrl;
  final String redirectUrl;

  Promo({
    required this.imageUrl,
    required this.redirectUrl,
  });

  @override
  String toString() => 'Promo(imageUrl: $imageUrl, redirectUrl: $redirectUrl)';
}
