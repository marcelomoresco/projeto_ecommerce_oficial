import 'package:e_commerce_project_new/presentator/views/cart_page/cart_page.dart';
import 'package:e_commerce_project_new/presentator/views/favorites/favorites_page.dart';
import 'package:e_commerce_project_new/presentator/views/home/home_page.dart';
import 'package:e_commerce_project_new/presentator/views/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/category_model.dart';
import '../../../domain/entities/product_model.dart';
import '../checkout/checkout_page.dart';
import '../product/product_page.dart';
import '../catalog/catalog_page.dart';

class AppRoutes {
  static Route onGenerate(RouteSettings settings) {
    print(settings.name);

    switch (settings.name) {
      case '/':
        return HomePage.route();
      case SplashPage.routeName:
        return SplashPage.route();
      case HomePage.routeName:
        return HomePage.route();
      case CartPage.routeName:
        return CartPage.route();
      case ProductPage.routeName:
        return ProductPage.route(product: settings.arguments as Product);
      case FavoritesPage.routeName:
        return FavoritesPage.route();
      case CheckoutPage.routeName:
        return CheckoutPage.route();
      case CatalogPage.routeName:
        return CatalogPage.route(category: settings.arguments as Category);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
      ),
    );
  }
}
