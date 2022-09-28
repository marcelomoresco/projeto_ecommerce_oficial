import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product_model.dart';
import '../../blocs/cart_bloc/cart_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthSelect;
  const ProductCard({Key? key, required this.product, this.widthSelect = 2.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/product', arguments: product);
      },
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / widthSelect,
                height: 150,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'R\$${product.price.toString()}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is CartLoadedState) {
                        return ElevatedButton(
                          onPressed: () {
                            context
                                .read<CartBloc>()
                                .add(AddProductCartEvent(product));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple),
                          child: Container(
                            width: 130,
                            child: Row(
                              children: const [
                                Icon(Icons.add_circle),
                                SizedBox(
                                  width: 4,
                                ),
                                Text("Comprar Agora")
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Text("Algo deu errado!");
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
