// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class LoadCart extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddProductCartEvent extends CartEvent {
  final Product product;

  const AddProductCartEvent(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProductCartEvent extends CartEvent {
  final Product product;
  const RemoveProductCartEvent({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}
