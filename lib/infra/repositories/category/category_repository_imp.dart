import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/category_model.dart';
import 'base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    print(_firebaseFirestore.collection('categorias'));
    return _firebaseFirestore
        .collection('categorias')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Category.fromSnapshot(doc)).toList();
    });
  }
}
