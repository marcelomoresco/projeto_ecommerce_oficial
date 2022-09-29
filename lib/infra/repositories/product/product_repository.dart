import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/product_model.dart';
import 'base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    print(_firebaseFirestore.collection('products'));
    print("FIREBASE PRODUCT");
    print("FIREBASE PRODUCT");

    print("FIREBASE PRODUCT");
    print("FIREBASE PRODUCT");
    print("FIREBASE PRODUCT");

    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}
