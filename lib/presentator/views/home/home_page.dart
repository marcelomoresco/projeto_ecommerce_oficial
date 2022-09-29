import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_project_new/domain/entities/category_model.dart';
import 'package:e_commerce_project_new/presentator/views/components/hero_carousel_card.dart';
import 'package:e_commerce_project_new/presentator/views/components/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product_model.dart';
import '../../blocs/category_bloc/category_bloc.dart';
import '../../blocs/product_bloc/product_bloc.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_bottom_app_bar.dart';
import '../components/hero_carousel_package.dart';
import '../components/product_carousel.dart';
import '../components/product_carousel_popular.dart';
import '../components/product_recommended_carousel.dart';
import '../components/section_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Mercadinho do Zé",
        ),
        bottomNavigationBar: const CustomBottomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              HeroCarouselPackage(),
              //Pesquisa

              SearchBox(),

              //Recomendados

              SectionTitle(
                title: "Recomendados",
              ),

              // ListView Product

              ProductRecommendedCarousel(),
              SectionTitle(
                title: "Mais Populares",
              ),

              // ListView Product

              ProductPopularCarousel(),
            ],
          ),
        ),
      ),
    );
  }
}
