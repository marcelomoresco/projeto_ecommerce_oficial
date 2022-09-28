// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_project_new/domain/entities/product_model.dart';
import 'package:equatable/equatable.dart';

class Checkout extends Equatable {
  final String name;
  final String email;
  final String address;
  final String country;
  final String city;
  final String zipCode;
  final String subtotal;
  final String deliveryFee;
  final String total;
  final List<Product>? products;

  const Checkout({
    required this.name,
    required this.email,
    required this.address,
    required this.country,
    required this.city,
    required this.zipCode,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.products,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        address,
        country,
        city,
        zipCode,
        subtotal,
        deliveryFee,
        total,
        products
      ];

  Map<String, Object> toDocument() {
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipCode'] = zipCode;

    return {
      'customerAddress': customerAddress,
      'customerName': name,
      'customerEmail': email,
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'total': total,
    };
  }
}
