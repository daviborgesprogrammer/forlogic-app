import '../../models/product_model.dart';
import "package:collection/collection.dart";
import '../../services/suggestion/suggestion_service.dart';
import 'package:diacritic/diacritic.dart';
import 'package:mobx/mobx.dart';

import '../../services/product/product_service.dart';
part 'home_controller.g.dart';

enum HomeStateStatus {
  initial,
  loading,
  loadingSuggestion,
  loaded,
  error,
}

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  @readonly
  var _status = HomeStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  var _products = <ProductModel>[];

  @readonly
  var _suggestions = <String>[];

  @readonly
  var _groupProducts = <dynamic, List<dynamic>>{};

  @observable
  String filterQuery = '';

  @observable
  List<bool> filterType = <bool>[false, false, false, false];

  @observable
  bool searchable = false;

  @action
  void setSearchable(bool value) => searchable = value;

  @action
  void setFilterQuery(String value) => filterQuery = value;

  @action
  void setFilterType(List<bool> value) => filterType = value;

  @action
  Future<void> loadSuggestions() async {
    try {
      _status = HomeStateStatus.loadingSuggestion;
      _suggestions = (await SuggestionService().getSuggestions())!;
      _status = HomeStateStatus.loaded;
    } catch (e) {
      _status = HomeStateStatus.error;
      _errorMessage = 'Erro recuperar sugestões';
    }
  }

  @action
  Future<void> filter(String query, List<bool> type) async {
    filterQuery = query;
    filterType = type;
    await loadProducts();
  }

  @action
  Future<void> loadProducts() async {
    try {
      _status = HomeStateStatus.loading;
      _products = await ProductService()
          .getProducts(removeDiacritics(filterQuery.toUpperCase()), filterType);
      if (filterQuery.isEmpty) {
        _groupProducts = groupBy(_products, (obj) => obj.post);
      }

      _status = HomeStateStatus.loaded;
    } catch (e) {
      _status = HomeStateStatus.error;
      _errorMessage = 'Erro recuperar produtos';
    }
  }
}
