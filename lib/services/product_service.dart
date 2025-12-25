import 'dart:convert';
import 'package:flutter/material.dart' hide Banner;
import 'package:flutter/services.dart' show rootBundle;
import '/models/models.dart';

class ProductService {
  final Map<String, Product> _allProductsById = {};

  Future<List<Product>> loadProducts(String fileName) async {
    try {
      final jsonString = await rootBundle.loadString('assets/data/$fileName');
      final List<dynamic> jsonList = json.decode(jsonString);

      final products = jsonList.map((json) => Product.fromJson(json)).toList();

      // Добавляем всё, что загрузили, в общую карту
      for (var product in products) {
        _allProductsById[product.id] = product;
      }
      return products;
    } catch (e, stacktrace) {
      debugPrint('DEBUG ERROR: $e');
      debugPrint('STACKTRACE: $stacktrace');
      throw Exception('Failed to load products from $fileName : $e');
    }
  }

  Future<List<AppBanner>> loadBanners() async {
    try {
      final jsonString = await rootBundle.loadString('assets/data/banners.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => BannerMapper.fromJson(json)).toList();
    } catch (e, stacktrace) {
      debugPrint('DEBUG ERROR: $e');
      debugPrint('STACKTRACE: $stacktrace');
      throw Exception('Failed to load products from banners : $e');
    }
    
  }

  // Метод-поиск, передаем id из баннера, а сервис возвращает продукт или null
  Product? getProductById(String id) => _allProductsById[id];
}