import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../infra/repositories/checkout/checkout_repository.dart';
import '../../../domain/entities/cart_model.dart';
import '../../../domain/entities/product_model.dart';
import '../../../domain/entities/checkout_model.dart';
import '../cart_bloc/cart_bloc.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({
    required CartBloc cartBloc,
    required CheckoutRepository checkoutRepository,
  })  : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(
          cartBloc.state is CartLoadedState
              ? CheckoutLoaded(
                  products: (cartBloc.state as CartLoadedState).cart.products,
                  deliveryFee: (cartBloc.state as CartLoadedState)
                      .cart
                      .deliveryPriceString,
                  subtotal:
                      (cartBloc.state as CartLoadedState).cart.subTotalString,
                  total: (cartBloc.state as CartLoadedState).cart.totalString,
                )
              : CheckoutLoading(),
        ) {
    on<UpdateCheckout>(_onUpdateCheckout);
    on<ConfirmCheckout>(_onConfirmCheckout);

    _cartSubscription = _cartBloc.stream.listen(
      (state) {
        if (state is CartLoadedState)
          add(
            UpdateCheckout(cart: state.cart),
          );
      },
    );
  }

  void _onUpdateCheckout(
    UpdateCheckout event,
    Emitter<CheckoutState> emit,
  ) {
    if (this.state is CheckoutLoaded) {
      final state = this.state as CheckoutLoaded;
      emit(
        CheckoutLoaded(
          email: event.email ?? state.email,
          name: event.name ?? state.name,
          products: event.cart?.products ?? state.products,
          deliveryFee: event.cart?.deliveryPriceString ?? state.deliveryFee,
          subtotal: event.cart?.subTotalString ?? state.subtotal,
          total: event.cart?.totalString ?? state.total,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          country: event.country ?? state.country,
          zipCode: event.zipCode ?? state.zipCode,
        ),
      );
    }
  }

  void _onConfirmCheckout(
    ConfirmCheckout event,
    Emitter<CheckoutState> emit,
  ) async {
    _checkoutSubscription?.cancel();
    if (this.state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        print('Deu boa');
        emit(CheckoutLoading());
      } catch (_) {}
    }
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }
}
