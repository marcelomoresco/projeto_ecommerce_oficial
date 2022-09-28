import 'package:e_commerce_project_new/presentator/views/components/product_card.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/product_model.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 265,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ProductCard(
                product: products[index],
              ),
            );
          }),
    );
  }
}
