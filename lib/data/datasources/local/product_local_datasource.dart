import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_play/core/constants/global_constants.dart';
import 'package:google_play/data/models/dtos.dart';

class ProductLocalDatasource {
  static const _basePath = Constants.baseDataPath;
  // Кэш
  final Map<String, dynamic> _productsCache = {};
  final Map<String, dynamic> _allDtosById = {};

  Future<List<dynamic>> loadProducts({required String fileName}) async {
    // TODO :Типизация и обработка ошибок
    final path = '$_basePath/$fileName';
    final jsonString = await rootBundle.loadString(path);
    final cacheKey = '${path}Key';

    if (_productsCache.containsKey(cacheKey)) return _productsCache[cacheKey]!;

    try {
      final List<dynamic> products = await Isolate.run(() {
        final List<dynamic> jsonList = jsonDecode(jsonString);

        return jsonList.map((item) => ProductDto.fromJson(item)).toList();
      }, debugName: 'Isolate: $fileName');
      // Кеш вне изолята - в противном случае запись не произойдет
      for (var dto in products) {
        final String id = (dto as dynamic).id;
        _allDtosById[id] = dto;
      }

      _productsCache[cacheKey] = products;

      return products;
    } catch (e, stacktrace) {
      debugPrint('Debug error: $e');
      debugPrint('stacktrace: $stacktrace');
      throw Exception('Failed to load page configs : $e');
    }
  }

  // Метод для репозитория, чтобы найти конкретный DTO
  dynamic getDtoById(String id) => _allDtosById[id];

  // Метод для репозитория, получить кеш
  List<dynamic> getAllCachedDtos() => _allDtosById.values.toList();

  // Удобный метод для очистки памяти
  void clearCache() {
    _productsCache.clear();
    _allDtosById.clear();
  }
}
