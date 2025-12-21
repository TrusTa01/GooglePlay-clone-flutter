import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../models/product_interface.dart';

class ProductService {
  Future<List<Product>> loadProducts(String fileName) async {
    try {
      final jsonString = await rootBundle.loadString('assets/data/$fileName');

      final List<dynamic> jsonList = json.decode(jsonString);

      return jsonList.map((json) => Product.fromJson(json)).toList();
    } catch (e, stacktrace) {
      debugPrint('DEBUG ERROR: $e');
      debugPrint('STACKTRACE: $stacktrace');
      throw Exception('Failed to load products from $fileName');
    }
  }
}
