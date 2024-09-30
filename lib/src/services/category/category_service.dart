import '../../models/category_model.dart';
import 'category_service_impl.dart';

abstract interface class CategoryService {
  Future<List<CategoryModel>> getCategories();

  factory CategoryService() {
    return CategoryServiceImpl();
  }
}
