import 'package:e_commerce_project_new/domain/entities/product_model.dart';
import 'package:equatable/equatable.dart';

class Favorite extends Equatable {
  final List<Product> products;

  const Favorite({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];
}
