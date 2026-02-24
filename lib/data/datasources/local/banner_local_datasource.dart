import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_play/core/constants/global_constants.dart';
import 'package:google_play/data/models/dtos.dart';

class BannerLocalDatasource {
  static const _basePath = Constants.baseDataPath;
  // Кэш
  final Map<String, dynamic> _bannersCache = {};
  final Map<String, dynamic> _allDtosById = {};

  Future<List<dynamic>> loadBanners({required String fileName}) async {
    // TODO :Типизация и обработка ошибок, вынести в geberic тип
    final String path = '$_basePath/$fileName';
    final jsonString = await rootBundle.loadString(path);
    final String cacheKey = '${fileName}Key';

    if (_bannersCache.containsKey(cacheKey)) return _bannersCache[cacheKey]!;

    try {
      final List<dynamic> banners = await Isolate.run(() {
        final List<dynamic> jsonList = jsonDecode(jsonString);

        return jsonList.map((item) => ProductDto.fromJson(item)).toList();
      }, debugName: 'Banners Isolate');
      // Кеш вне изолята - в противном случае запись не произойдет
      for (var dto in banners) {
        final String id = (dto as dynamic).id;
        _allDtosById[id] = dto;
      }

      _bannersCache[cacheKey] = banners;

      return banners;
    } catch (e, stacktrace) {
      debugPrint('DEBUG ERROR: $e');
      debugPrint('STACKTRACE: $stacktrace');
      throw Exception('Failed to load products from banners : $e');
    }
  }

  // Метод для репозитория, чтобы найти конкретный DTO
  dynamic getDtoById(String id) => _allDtosById[id];

  // Метод для репозитория, получить кеш
  List<dynamic> getAllCachedDtos() => _allDtosById.values.toList();

  // Удобный метод для очистки памяти
  void clearCache() {
    _bannersCache.clear();
    _allDtosById.clear();
  }
}
