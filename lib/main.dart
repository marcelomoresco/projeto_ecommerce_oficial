import 'package:e_commerce_project_new/infra/repositories/checkout/checkout_repository.dart';
import 'package:e_commerce_project_new/infra/repositories/product/product_repository.dart';
import 'package:e_commerce_project_new/presentator/blocs/cart_bloc/cart_bloc.dart';
import 'package:e_commerce_project_new/presentator/blocs/checkout_bloc/checkout_bloc.dart';
import 'package:e_commerce_project_new/presentator/blocs/favorites_bloc/favorites_bloc.dart';
import 'package:e_commerce_project_new/presentator/blocs/product_bloc/product_bloc.dart';
import 'package:e_commerce_project_new/presentator/views/home/home_page.dart';
import 'package:e_commerce_project_new/presentator/views/routes/app_routes.dart';
import 'package:e_commerce_project_new/presentator/views/splash/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'infra/repositories/category/category_repository_imp.dart';
import 'presentator/blocs/category_bloc/category_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavoritesBloc>(
          create: (_) => FavoritesBloc()
            ..add(
              StartFavoriteEvent(),
            ),
        ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc()..add(LoadCart()),
        ),
        BlocProvider<CategoryBloc>(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(
              LoadCategoriesEvent(),
            ),
        ),
        BlocProvider<ProductBloc>(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(
              LoadProductsEvent(),
            ),
        ),
        BlocProvider<CheckoutBloc>(
          create: (_) => CheckoutBloc(
              cartBloc: context.read<CartBloc>(),
              checkoutRepository: CheckoutRepository()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerate,
        initialRoute: SplashPage.routeName,
      ),
    );
  }
}
