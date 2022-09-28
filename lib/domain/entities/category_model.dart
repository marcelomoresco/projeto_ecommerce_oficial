import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imgUrl;

  const Category({
    required this.name,
    required this.imgUrl,
  });

  @override
  List<Object?> get props => [
        name,
        imgUrl,
      ];

  static Category fromSnapshot(DocumentSnapshot snapshot) {
    Category category = Category(
      name: snapshot['name'],
      imgUrl: snapshot['imgUrl'],
    );
    return category;
  }

  static List<Category> categories = [
    const Category(
      name: 'Frutas',
      imgUrl:
          'https://images.unsplash.com/photo-1488459716781-31db52582fe9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    ),
    const Category(
      name: 'Vegetais',
      imgUrl:
          'https://images.unsplash.com/photo-1566385101042-1a0aa0c1268c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80',
    ),
    const Category(
      name: 'Açogue',
      imgUrl:
          'https://images.unsplash.com/photo-1547637205-fde0c9011f9d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    ),
    const Category(
      name: 'Pães',
      imgUrl:
          'https://blog.praticabr.com/wp-content/uploads/2019/01/263396-os-10-tipos-de-paes-que-voce-precisa-conhecer-1024x682.jpg',
    ),
  ];
}
