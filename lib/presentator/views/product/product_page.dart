import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/product_model.dart';
import '../../blocs/cart_bloc/cart_bloc.dart';
import '../../blocs/favorites_bloc/favorites_bloc.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_bottom_app_bar.dart';
import '../components/hero_carousel_card.dart';

class ProductPage extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProductPage(product: product),
    );
  }

  final Product product;

  const ProductPage({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomAppBar(
            color: Colors.deepPurple,
            child: Container(
              height: 70,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BlocBuilder<FavoritesBloc, FavoritesState>(
                      builder: (context, state) {
                        return IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            context
                                .read<FavoritesBloc>()
                                .add(AddFavoriteProductEvent(product));
                            final snackBar = SnackBar(
                                content: Text("Adicionado aos Favoritos"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        );
                      },
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {
                            context
                                .read<CartBloc>()
                                .add(AddProductCartEvent(product));
                            Navigator.of(context).pushNamed('/cart');
                          },
                          child: const Text(
                            "Comprar Agora",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    )
                  ]),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: [
              HeroCarouselCard(product: product),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Novo | 19929 Vendidos",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "${product.name}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.verified, color: Colors.blue)
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "(Cód. Item 123131) |",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      "Disponível em Estoque",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow.shade600,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow.shade600,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow.shade600,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow.shade600,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow.shade600,
                    ),
                    Text(
                      "(29 Avaliações)",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Preço",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'R\$${product.price}',
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15)),
                              width: 40,
                              child: const Center(
                                child: Text(
                                  "60%",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Ou em Até 12x de R\$ ${(product.price / 12).toStringAsFixed(2)}",
                              style: TextStyle(color: Colors.grey[400]),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    "Informações do Produto",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Informações de Entrega",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
