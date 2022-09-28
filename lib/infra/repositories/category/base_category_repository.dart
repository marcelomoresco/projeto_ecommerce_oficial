import '../../../domain/entities/category_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
