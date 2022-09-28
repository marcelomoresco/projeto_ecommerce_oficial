import 'package:e_commerce_project_new/presentator/views/components/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/cart_model.dart';
import '../../../domain/entities/product_model.dart';
import '../../blocs/cart_bloc/cart_bloc.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_bottom_app_bar.dart';
import '../components/order_resume.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Carrinho de Compras",
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BottomAppBar(
              color: Colors.deepPurple,
              child: Container(
                height: 70,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/checkout');
                    },
                    child: const Text(
                      "IR PARA O CHECKOUT",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CartLoadedState) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Cart().freeDeliveryString,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("/");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text("+ Produtos"))
                      ],
                    ),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: state.cart
                            .productQuantity(state.cart.products)
                            .keys
                            .length,
                        itemBuilder: (context, index) {
                          return CartProductCard(
                              product: state.cart
                                  .productQuantity(state.cart.products)
                                  .keys
                                  .elementAt(index),
                              quantity: state.cart
                                  .productQuantity(state.cart.products)
                                  .values
                                  .elementAt(index));
                        },
                      ),
                    ),
                    const OrderResume(),
                  ],
                ),
              );
            } else {
              return const Text("Algo deu errado!");
            }
          },
        ));
  }
}
