import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String address;
  final String city;
  final String country;
  final String postalCode;

  const Address({
    required this.address,
    required this.city,
    required this.country,
    required this.postalCode,
  });

  @override
  List<Object?> get props => [address, city, country, postalCode];
}
