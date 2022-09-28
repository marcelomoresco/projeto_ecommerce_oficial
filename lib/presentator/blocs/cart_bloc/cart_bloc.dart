import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/cart_model.dart';
import '../../../domain/entities/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoadingState()) {
    on<LoadCart>(_onLoadCart);
    on<AddProductCartEvent>(_onAddProductCart);
    on<RemoveProductCartEvent>(_onRemoveProductCart);
  }
  void _onLoadCart(event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const CartLoadedState());
    } catch (_) {
      emit(const CartErrorState("Erro ao Carregar o Carrinho"));
    }
  }

  void _onAddProductCart(event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoadedState) {
      try {
        emit(
          CartLoadedState(
            cart: Cart(
              products: List.from(state.cart.products)..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(const CartErrorState("Erro ao Adicionar ao Carrinho"));
      }
    }
  }

  void _onRemoveProductCart(event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoadedState) {
      try {
        emit(
          CartLoadedState(
            cart: Cart(
              products: List.from(state.cart.products)..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(const CartErrorState("Erro ao Adicionar ao Carrinho"));
      }
    }
  }
}
