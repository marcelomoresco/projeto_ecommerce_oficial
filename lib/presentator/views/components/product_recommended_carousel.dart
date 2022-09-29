import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product_model.dart';
import '../../blocs/product_bloc/product_bloc.dart';
import 'product_carousel.dart';

class ProductRecommendedCarousel extends StatelessWidget {
  const ProductRecommendedCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductLoadedState) {
          return ProductCarousel(
            products: Product.products
                .where((product) => product.isRecommended)
                .toList(),
          );
        } else {
          return const Center(
            child:
                Text("Algo deu muito errado ao puxar as imagens do Firebase"),
          );
        }
      },
    );
  }
}
