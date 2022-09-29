import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  static Product fromSnapshot(DocumentSnapshot snapshot) {
    Product product = Product(
      category: snapshot['category'],
      imageUrl: snapshot['imageUrl'],
      isPopular: snapshot['isPopular'],
      isRecommended: snapshot['isRecommended'],
      name: snapshot['name'],
      price: snapshot['price'],
    );
    return product;
  }

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
      ];

  static List<Product> products = [
    const Product(
      name: 'Pão Sem Glútem #1',
      category: 'Pães',
      imageUrl:
          'https://distribuicao.abad.com.br/wp-content/uploads/2022/02/wickbold-amendoim-450x300.jpg',
      price: 12.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Pão Sem Glútem #2',
      category: 'Pães',
      imageUrl:
          'https://distribuicao.abad.com.br/wp-content/uploads/2022/02/wickbold-amendoim-450x300.jpg', //https://unsplash.com/photos/Viy_8zHEznk
      price: 12.99,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Pão sem Glútem #3',
      category: 'Pães',
      imageUrl:
          'https://distribuicao.abad.com.br/wp-content/uploads/2022/02/wickbold-amendoim-450x300.jpg', //https://unsplash.com/photos/5LIInaqRp5s
      price: 25.99,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      name: 'Maça #1',
      category: 'Frutas',
      imageUrl:
          'https://conteudo.imguol.com.br/c/entretenimento/32/2018/01/18/maca-1516308281068_v2_4x3.jpg', //https://unsplash.com/photos/kcYXj4tBtes
      price: 21.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Banana #2',
      category: 'Frutas',
      imageUrl:
          'https://minhasaude.proteste.org.br/wp-content/uploads/2022/07/bananas.jpg', //https://unsplash.com/photos/CrK843Pl9a4
      price: 9.99,
      isRecommended: false,
      isPopular: false,
    ),
    const Product(
      name: 'Carne Costela #1',
      category: 'Açogue',
      imageUrl:
          'https://tdc099.vtexassets.com/arquivos/ids/184001/FOTOSVTEX.jpg?v=637728398936970000', //https://unsplash.com/photos/dO9A6mhSZZY
      price: 52.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Carne Ovelha #2',
      category: 'Açogue',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1sa26smoEirB1ZN247vTdqAHk-11tXWFkXY917r-aIETuOtY9EQ0_8TebxRASk3-2AqE&usqp=CAU', //https://unsplash.com/photos/Viy_8zHEznk
      price: 62.99,
      isRecommended: false,
      isPopular: true,
    ),
  ];
}
