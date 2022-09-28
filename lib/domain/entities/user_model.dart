import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String name;
  final String email;
  final String address;
  final String city;
  final String country;
  final String zipCode;

  const User({
    this.id,
    this.name = '',
    this.email = '',
    this.address = '',
    this.city = '',
    this.country = '',
    this.zipCode = '',
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? address,
    String? city,
    String? country,
    String? zipCode,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode,
    );
  }

  factory User.fromSnapshot(DocumentSnapshot snap) {
    return User(
      id: snap.id,
      name: snap['name'],
      email: snap['email'],
      address: snap['address'],
      city: snap['city'],
      country: snap['country'],
      zipCode: snap['zipCode'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'country': country,
      'zipCode': zipCode
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        address,
        city,
        country,
        zipCode,
      ];
}
