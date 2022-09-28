import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/product_model.dart';
import '../../blocs/cart_bloc/cart_bloc.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          Image.network(product.imageUrl,
              width: 100, height: 80, fit: BoxFit.cover),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text('R\$${product.price}',
                    style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CartLoadedState) {
                return Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(RemoveProductCartEvent(product: product));
                      },
                    ),
                    Text('$quantity',
                        style: Theme.of(context).textTheme.headline6),
                    IconButton(
                      icon: const Icon(Icons.add_circle),
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(AddProductCartEvent(product));
                      },
                    )
                  ],
                );
              } else {
                return const Text("Algo deu muito errado");
              }
            },
          )
        ],
      ),
    );
  }
}
