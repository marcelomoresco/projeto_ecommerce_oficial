import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_project_new/domain/entities/category_model.dart';
import 'package:e_commerce_project_new/presentator/views/components/hero_carousel_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product_model.dart';
import '../../blocs/category_bloc/category_bloc.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_bottom_app_bar.dart';
import '../components/product_card.dart';
import '../components/product_carousel.dart';
import '../components/section_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Mercadinho do Zé",
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      autoPlay: true,
                    ),
                    items: state.categories
                        .map((category) => HeroCarouselCard(category: category))
                        .toList(),
                  );
                } else {
                  return const Center(
                    child: Text("Algo deu muito errado.......!"),
                  );
                }
              },
            ),

            //Recomendados

            const SectionTitle(
              title: "Recomendados",
            ),

            // ListView Product

            ProductCarousel(
              products: Product.products
                  .where((product) => product.isRecommended)
                  .toList(),
            ),
            const SectionTitle(
              title: "Mais Populares",
            ),

            // ListView Product

            ProductCarousel(
              products: Product.products
                  .where((product) => product.isPopular)
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
