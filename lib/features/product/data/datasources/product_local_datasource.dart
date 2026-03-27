import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/foundation.dart' show debugPrint, FlutterError;
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_play/core/constants/global_constants.dart';
import 'package:google_play/features/product/data/models/product_dto.dart';
import 'package:google_play/features/banners/data/models/banner_dto.dart';

class ProductLocalDatasource {
  static const _basePath = Constants.baseDataPath;
  // Кэш
  final Map<String, List<ProductDto>> _productsCache = {};
  final Map<String, List<BannerDto>> _bannersCache = {};

  // Общий реестр продуктов по ID (для быстрого поиска)
  final Map<String, ProductDto> _allProductsById = {};

  // Загрузка продуктов
  Future<List<ProductDto>> loadProducts({required String fileName}) async {
    return _loadList<ProductDto>(
      fileName: fileName,
      cache: _productsCache,
      fromMap: (map) => ProductDto.fromJson(map),
      onItemsLoaded: (items) {
        for (var p in items) {
          _allProductsById[p.id] = p;
        }
      },
    );
  }

  // Загрузка баннеров
  Future<List<BannerDto>> loadBanners({required String fileName}) async {
    return _loadList<BannerDto>(
      fileName: fileName,
      cache: _bannersCache,
      fromMap: (map) {
        final normalized = Map<String, dynamic>.from(map);
        if (normalized['type'] == 'simple') {
          normalized['type'] = 'event';
        }
        return BannerDto.fromJson(normalized);
      },
    );
  }

  Future<List<T>> _loadList<T>({
    required String fileName,
    required Map<String, List<T>> cache,
    required T Function(Map<String, dynamic>) fromMap,
    void Function(List<T>)? onItemsLoaded,
  }) async {
    final path = '$_basePath/$fileName';

    if (cache.containsKey(path)) return cache[path]!;

    try {
      final String jsonString;
      try {
        jsonString = await rootBundle.loadString(path);
      } on FlutterError catch (e) {
        _logError('FileSystem', e);
        throw Exception('Data error: File $fileName not found in assets');
      }

      final List<T> result = await Isolate.run(() {
        final List<dynamic> jsonList = jsonDecode(jsonString);

        return jsonList
            .map((item) => fromMap(item as Map<String, dynamic>))
            .toList();
      }, debugName: 'Isolate: $fileName');

      onItemsLoaded?.call(result);
      cache[path] = result;
      return result;
    } on FormatException catch (e) {
      _logError('Format', e.message);
      rethrow;
    } catch (e, stack) {
      _logError('Unknown', e, stack);
      throw Exception('Critical error loading $fileName: $e');
    }
  }

  void _logError(String label, dynamic e, [StackTrace? stack]) {
    debugPrint('[$label]: $e');
    if (stack != null) debugPrint('$stack');
  }

  // Методы доступа для репозитория
  ProductDto? getProductById(String id) => _allProductsById[id];

  BannerDto? getBannerById(String id) {
    for (final banners in _bannersCache.values) {
      for (final banner in banners) {
        if (banner.id == id) return banner;
      }
    }
    return null;
  }

  // Получить все закэшированные объекты определенного типа
  List<T> getAllCachedDtos<T>() {
    if (T == ProductDto) return _allProductsById.values.cast<T>().toList();

    if (T == BannerDto) {
      return _bannersCache.values
          .expand(
            (list) => list,
          ) // Схлопываем List<List<BannerDto>> в List<BannerDto>
          .cast<T>()
          .toList();
    }

    return [];
  }

  // Удобный метод для очистки памяти
  void clearCache() {
    _productsCache.clear();
    _bannersCache.clear();
    _allProductsById.clear();
  }
}
