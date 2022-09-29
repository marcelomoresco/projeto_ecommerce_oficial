import 'package:flutter/material.dart';

import '../../../domain/entities/category_model.dart';
import '../../../domain/entities/product_model.dart';

class HeroCarouselCard extends StatelessWidget {
  final Category? category;
  final Product? product;
  const HeroCarouselCard({super.key, this.category, this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (product == null) {
          Navigator.of(context).pushNamed('/catalog', arguments: category);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                    product == null ? category!.imgUrl : product!.imageUrl,
                    fit: BoxFit.cover,
                    width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      product == null ? category!.name : product!.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
