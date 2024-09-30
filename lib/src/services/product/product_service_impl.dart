import 'dart:convert';

import 'package:diacritic/diacritic.dart';
import 'package:flutter/services.dart';

import '../../models/product_model.dart';
import './product_service.dart';

class ProductServiceImpl implements ProductService {
  @override
  Future<List<ProductModel>> getProducts(String? query, List<bool> type) async {
    List<ProductModel> list = <ProductModel>[];
    String fileJson = await rootBundle.loadString('assets/data/products.json');
    final result = json.decode(fileJson);
    result.forEach((d) => list.add(ProductModel.fromMap(d)));
    if (query != null && query.isNotEmpty) {
      var seen = <ProductModel>{};
      for (var prod in list) {
        if ((type[0] && type[1] && type[2] && type[3]) ||
            (!type[0] && !type[1] && !type[2] && !type[3])) {
          if (removeDiacritics(prod.name).toUpperCase().contains(query) ||
              removeDiacritics(prod.description)
                  .toUpperCase()
                  .contains(query) ||
              removeDiacritics(prod.category).toUpperCase().contains(query) ||
              prod.price.toString().contains(query)) seen.add(prod);
        } else {
          if (type[0] &&
              removeDiacritics(prod.name).toUpperCase().contains(query)) {
            seen.add(prod);
          }
          if (type[1] &&
              removeDiacritics(prod.description)
                  .toUpperCase()
                  .contains(query)) {
            seen.add(prod);
          }
          if (type[2] &&
              removeDiacritics(prod.category).toUpperCase().contains(query)) {
            seen.add(prod);
          }
          if (type[3] && prod.price.toString().contains(query)) {
            seen.add(prod);
          }
        }
      }

      List<ProductModel> listQuery = seen.toList();
      return listQuery;
    } else {
      return list;
    }
  }

  bool findProductsType(List<bool> type) {
    return true;
  }
}
