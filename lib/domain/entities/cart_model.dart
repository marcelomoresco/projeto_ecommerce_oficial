// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_project_new/domain/entities/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({
    this.products = const <Product>[],
  });

  double get subTotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryPrice(subTotal) {
    if (subTotal >= 30) {
      return 0.0;
    } else {
      return 15.00;
    }
  }

  String freeDelivery(subTotal) {
    if (subTotal >= 30) {
      return 'Você tem Frete Grátis!';
    } else {
      double missing = 30.00 - subTotal;
      return 'Adicione R\$${missing.toStringAsFixed(2)} para \nganhar FRETE GRÁTIS';
    }
  }

  double total(subTotal, deliveryPrice) {
    return subTotal + deliveryPrice(subTotal);
  }

  String get subTotalString => subTotal.toStringAsFixed(2);

  String get totalString => total(subTotal, deliveryPrice).toStringAsFixed(2);

  String get deliveryPriceString => deliveryPrice(subTotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subTotal);

  Map productQuantity(products) {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  @override
  List<Object?> get props => [products];
}
