// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';

class ProductModel {
  ProductModel({
    required this.id,
    required this.post,
    required this.name,
    required this.description,
    required this.price,
    required this.installments,
    required this.installmentValue,
    required this.priceOriginal,
    required this.status,
    required this.discount,
    required this.urlImage,
    required this.category,
  });
  final int id;
  final DateTime post;
  final String name;
  final String description;
  final double price;
  final int installments;
  final double installmentValue;
  final double priceOriginal;
  final String status;
  final int discount;
  final String urlImage;
  final String category;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'post': post.millisecondsSinceEpoch,
      'name': name,
      'description': description,
      'price': price,
      'installments': installments,
      'installmentValue': installmentValue,
      'priceOriginal': priceOriginal,
      'status': status,
      'discount': discount,
      'urlImage': urlImage,
      'category': category,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: (map['id'] ?? 0) as int,
      post: _formatDate(map['post']),
      name: (map['name'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      price: (map['price'] ?? 0.0) as double,
      installments: (map['installments'] ?? 0) as int,
      installmentValue: (map['installmentValue'] ?? 0.0) as double,
      priceOriginal: (map['priceOriginal'] ?? 0.0) as double,
      status: (map['status'] ?? '') as String,
      discount: (map['discount'] ?? 0) as int,
      urlImage: (map['urlImage'] ?? '') as String,
      category: (map['category'] ?? '') as String,
    );
  }

  static DateTime _formatDate(String? strData) {
    if (strData != null) {
      final dateFormat = DateFormat('yyyy-MM-dd');
      return dateFormat.parse(strData);
    } else {
      return DateTime.now();
    }
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
