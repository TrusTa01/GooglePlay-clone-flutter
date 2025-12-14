// product_service.dart

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/product_interface.dart';

class ProductService {
  /// Загружает и парсит список продуктов из локального JSON-файла.
  Future<List<Product>> loadProducts(String fileName) async {
    try {
      // 1. ЧТЕНИЕ ФАЙЛА ИЗ ASSETS (rootBundle)
      // Получаем JSON-строку из указанного пути.
      final jsonString = await rootBundle.loadString('assets/data/$fileName');

      // 2. ДЕКОДИРОВАНИЕ СТРОКИ
      // Преобразует строку в List<dynamic> (List<Map<String, dynamic>>)
      final List<dynamic> rawList = jsonDecode(jsonString);

      // 3. ПРЕОБРАЗОВАНИЕ В МОДЕЛИ (Product)
      final List<Product> products = rawList.map((jsonMap) {
        if (fileName.contains('games.json')) {
            jsonMap['type'] = 'game';
        } 
        return Product.fromJson(jsonMap as Map<String, dynamic>);
      }).toList();
      return products;

    } catch (e) {
      // Здесь можно добавить более детальное логирование ошибки
      // ignore: avoid_print
      print('Ошибка загрузки или парсинга данных из $fileName: $e');
      return []; // Возвращаем пустой список при ошибке
    }
  }
}