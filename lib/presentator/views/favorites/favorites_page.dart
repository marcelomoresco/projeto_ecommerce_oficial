import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product_model.dart';
import '../../blocs/favorites_bloc/favorites_bloc.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_bottom_app_bar.dart';
import '../components/product_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  static const String routeName = '/favorites';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const FavoritesPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Favoritos",
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FavoritesLoadedState) {
            return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 26),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 90,
                  childAspectRatio: 1,
                ),
                shrinkWrap: true,
                itemCount: state.favorite.products.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 50,
                    child: Center(
                      child: ProductCard(
                        product: state.favorite.products[index],
                        widthSelect: 2.2,
                      ),
                    ),
                  );
                });
          } else if (state is FavoritesErrorState) {
            return const Center(
              child: Text("Erro ao carregar Favoritos"),
            );
          } else {
            return const Center(
              child: Text("Algo deu muito errado!"),
            );
          }
        },
      ),
    );
  }
}
