import 'package:flutter/material.dart';

import '../../../domain/entities/product_model.dart';

class OrderResumeCard extends StatelessWidget {
  const OrderResumeCard({
    super.key,
    required this.product,
    required this.quantity,
  });

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            height: 80,
            width: 100,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style: Theme.of(context).textTheme.headline5),
                Text(
                  "Quantity = 2",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          Expanded(
            child: Text('R\$${product.price}',
                style: Theme.of(context).textTheme.headline4),
          )
        ],
      ),
    );
  }
}
