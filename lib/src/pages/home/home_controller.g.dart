// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'HomeControllerBase._status', context: context);

  HomeStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  HomeStateStatus get _status => status;

  @override
  set _status(HomeStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'HomeControllerBase._errorMessage', context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$_productsAtom =
      Atom(name: 'HomeControllerBase._products', context: context);

  List<ProductModel> get products {
    _$_productsAtom.reportRead();
    return super._products;
  }

  @override
  List<ProductModel> get _products => products;

  @override
  set _products(List<ProductModel> value) {
    _$_productsAtom.reportWrite(value, super._products, () {
      super._products = value;
    });
  }

  late final _$_suggestionsAtom =
      Atom(name: 'HomeControllerBase._suggestions', context: context);

  List<String> get suggestions {
    _$_suggestionsAtom.reportRead();
    return super._suggestions;
  }

  @override
  List<String> get _suggestions => suggestions;

  @override
  set _suggestions(List<String> value) {
    _$_suggestionsAtom.reportWrite(value, super._suggestions, () {
      super._suggestions = value;
    });
  }

  late final _$_groupProductsAtom =
      Atom(name: 'HomeControllerBase._groupProducts', context: context);

  Map<dynamic, List<dynamic>> get groupProducts {
    _$_groupProductsAtom.reportRead();
    return super._groupProducts;
  }

  @override
  Map<dynamic, List<dynamic>> get _groupProducts => groupProducts;

  @override
  set _groupProducts(Map<dynamic, List<dynamic>> value) {
    _$_groupProductsAtom.reportWrite(value, super._groupProducts, () {
      super._groupProducts = value;
    });
  }

  late final _$filterQueryAtom =
      Atom(name: 'HomeControllerBase.filterQuery', context: context);

  @override
  String get filterQuery {
    _$filterQueryAtom.reportRead();
    return super.filterQuery;
  }

  @override
  set filterQuery(String value) {
    _$filterQueryAtom.reportWrite(value, super.filterQuery, () {
      super.filterQuery = value;
    });
  }

  late final _$filterTypeAtom =
      Atom(name: 'HomeControllerBase.filterType', context: context);

  @override
  List<bool> get filterType {
    _$filterTypeAtom.reportRead();
    return super.filterType;
  }

  @override
  set filterType(List<bool> value) {
    _$filterTypeAtom.reportWrite(value, super.filterType, () {
      super.filterType = value;
    });
  }

  late final _$searchableAtom =
      Atom(name: 'HomeControllerBase.searchable', context: context);

  @override
  bool get searchable {
    _$searchableAtom.reportRead();
    return super.searchable;
  }

  @override
  set searchable(bool value) {
    _$searchableAtom.reportWrite(value, super.searchable, () {
      super.searchable = value;
    });
  }

  late final _$loadSuggestionsAsyncAction =
      AsyncAction('HomeControllerBase.loadSuggestions', context: context);

  @override
  Future<void> loadSuggestions() {
    return _$loadSuggestionsAsyncAction.run(() => super.loadSuggestions());
  }

  late final _$filterAsyncAction =
      AsyncAction('HomeControllerBase.filter', context: context);

  @override
  Future<void> filter(String query, List<bool> type) {
    return _$filterAsyncAction.run(() => super.filter(query, type));
  }

  late final _$loadProductsAsyncAction =
      AsyncAction('HomeControllerBase.loadProducts', context: context);

  @override
  Future<void> loadProducts() {
    return _$loadProductsAsyncAction.run(() => super.loadProducts());
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void setSearchable(bool value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setSearchable');
    try {
      return super.setSearchable(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilterQuery(String value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setFilterQuery');
    try {
      return super.setFilterQuery(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilterType(List<bool> value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setFilterType');
    try {
      return super.setFilterType(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filterQuery: ${filterQuery},
filterType: ${filterType},
searchable: ${searchable}
    ''';
  }
}
