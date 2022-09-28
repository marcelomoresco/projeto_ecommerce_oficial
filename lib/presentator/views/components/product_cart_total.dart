import 'package:flutter/material.dart';

import '../../../../domain/entities/cart_model.dart';
import '../../../../domain/entities/product_model.dart';
import 'cart_product_card.dart';

class ProductCartTotal extends StatelessWidget {
  const ProductCartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Cart().freeDeliveryString,
              style: Theme.of(context).textTheme.headline5,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
                child: Text(
                  "Adicionar mais Itens",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white),
                ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        /*SizedBox(
          height: 400,
          child: ListView.builder(
              itemCount: cart.keys.length,
              itemBuilder: (context, index) {
                return CartProductCard.cart(
                  product: Cart().products[index],
                );
              }),
        ),*/
      ],
    );
  }
}
