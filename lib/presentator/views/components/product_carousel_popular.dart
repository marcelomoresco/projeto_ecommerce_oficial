import 'package:e_commerce_project_new/presentator/views/components/product_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product_model.dart';
import '../../blocs/product_bloc/product_bloc.dart';

class ProductPopularCarousel extends StatelessWidget {
  const ProductPopularCarousel({
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
            products:
                Product.products.where((product) => product.isPopular).toList(),
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
