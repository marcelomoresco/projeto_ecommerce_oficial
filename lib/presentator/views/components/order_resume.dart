import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/cart_bloc/cart_bloc.dart';

class OrderResume extends StatelessWidget {
  const OrderResume({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoadedState) {
          return Column(
            children: [
              const Divider(
                thickness: 2,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.00),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Subtotal",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(
                          "R\$${state.cart.subTotalString}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Envio Imediato",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(
                          "R\$${state.cart.deliveryPriceString}",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            "R\$${state.cart.totalString}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        } else if (state is CartLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text("Algo deu muito errado......."),
          );
        }
      },
    );
  }
}
