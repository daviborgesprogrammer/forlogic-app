// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoriesController on CategoriesControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'CategoriesControllerBase._status', context: context);

  CategoriesStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  CategoriesStateStatus get _status => status;

  @override
  set _status(CategoriesStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'CategoriesControllerBase._errorMessage', context: context);

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

  late final _$_categoriesAtom =
      Atom(name: 'CategoriesControllerBase._categories', context: context);

  List<CategoryModel> get categories {
    _$_categoriesAtom.reportRead();
    return super._categories;
  }

  @override
  List<CategoryModel> get _categories => categories;

  @override
  set _categories(List<CategoryModel> value) {
    _$_categoriesAtom.reportWrite(value, super._categories, () {
      super._categories = value;
    });
  }

  late final _$getCategoriesAsyncAction =
      AsyncAction('CategoriesControllerBase.getCategories', context: context);

  @override
  Future<void> getCategories() {
    return _$getCategoriesAsyncAction.run(() => super.getCategories());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
