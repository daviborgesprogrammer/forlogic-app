import 'package:mobx/mobx.dart';

import '../../models/category_model.dart';
import '../../services/category/category_service.dart';
part 'categories_controller.g.dart';

enum CategoriesStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class CategoriesController = CategoriesControllerBase
    with _$CategoriesController;

abstract class CategoriesControllerBase with Store {
  @readonly
  var _status = CategoriesStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  var _categories = <CategoryModel>[];

  @action
  Future<void> getCategories() async {
    try {
      _status = CategoriesStateStatus.loading;
      _categories = await CategoryService().getCategories();
      _status = CategoriesStateStatus.loaded;
    } catch (e) {
      _status = CategoriesStateStatus.error;
      _errorMessage = 'Erro recuperar Categorias';
    }
  }
}
