import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_play/core/constants/global_constants.dart';

class ConfigLocalDatasource {
  static const _basePath = Constants.baseDataPath;
  // Кэш для полных конфигов табов
  final Map<String, dynamic> _tabsCache = {};

  // Кэш для списков доступных табов (индексов)
  final Map<String, List<String>> _indexCache = {};

  Future<Map<String, dynamic>> loadTabsConfig({
    // TODO :Типизация и обработка ошибок
    required String folder,
    required String tabKey,
  }) async {
    final cacheKey = '$folder/${tabKey}Key';
    if (_tabsCache.containsKey(cacheKey)) return _tabsCache[cacheKey]!;

    final path = '$_basePath/$folder/$tabKey.json';

    try {
      final jsonString = await rootBundle.loadString(path);
      // Парсим в изоляте для больших конфигов
      final Map<String, dynamic> result = await Isolate.run(() {
        final Map<String, dynamic> json = jsonDecode(jsonString);
        final tabData = json[tabKey] as Map<String, dynamic>?;
        if (tabData == null) throw Exception('Key $tabKey not found');

        return tabData;
      }, debugName: 'Tabs Isolate: $tabKey');

      // Кеш вне изолята - в противном случае запись не произойдет
      _tabsCache[cacheKey] = result;

      return result;
    } catch (e, stacktrace) {
      debugPrint('Debug error: $e');
      debugPrint('stacktrace: $stacktrace');
      throw Exception('Failed to load page configs : $e');
    }
  }

  Future<List<String>> getAvailableTabs({
    required String folder,
    required String indexKey,
  }) async {
    final cacheKey = '$folder/$indexKey';

    if (_indexCache.containsKey(cacheKey)) return _indexCache[cacheKey]!;

    final path = '$_basePath/$folder/index.json';

    try {
      final jsonString = await rootBundle.loadString(path);
      final Map<String, dynamic> json = jsonDecode(jsonString);
      final List<dynamic> tabs = json[indexKey] ?? [];
      final result = tabs.map((e) => e.toString()).toList();

      // Запись в кэш
      _indexCache[cacheKey] = result;
      return result;
    } catch (e, stacktrace) {
      debugPrint('Debug error: $e');
      debugPrint('stacktrace: $stacktrace');
      throw Exception('Failed to load page configs : $e');
    }
  }

  // Удобный метод для очистки памяти
  void clearCache() {
    _tabsCache.clear();
    _indexCache.clear();
  }
}
