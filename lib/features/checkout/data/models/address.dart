// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'city': city,
      'country': country,
      'postalCode': postalCode,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      address: map['streetAddress'] as String,
      city: map['city'] as String,
      country: map['country'] as String,
      postalCode: map['postalCode'] as String,
    );
  }
}
