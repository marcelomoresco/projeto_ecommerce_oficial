import 'package:flutter/material.dart';

import '../../../domain/entities/category_model.dart';
import '../../../domain/entities/product_model.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_bottom_app_bar.dart';
import '../components/product_card.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key, required this.category});

  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CatalogPage(category: category),
    );
  }

  final Category category;

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 26),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 90,
            childAspectRatio: 1,
          ),
          shrinkWrap: true,
          itemCount: categoryProducts.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: SizedBox(
                height: 50,
                child: Center(
                  child: ProductCard(
                      product: categoryProducts[index], widthSelect: 2.2),
                ),
              ),
            );
          }),
    );
  }
}
