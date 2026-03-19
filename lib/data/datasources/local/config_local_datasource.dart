import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/foundation.dart' show debugPrint, FlutterError;
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_play/core/constants/global_constants.dart';
import 'package:google_play/data/models/tabs_dtos/available_tabs_dto.dart';
import 'package:google_play/data/models/section_dtos/section_dto.dart';

class ConfigLocalDatasource {
  static const _basePath = Constants.baseConfigPath;
  // Кэш для полных конфигов табов
  final Map<String, TabConfigDto> _tabsCache = {};

  // Кэш для списков доступных табов (индексов)
  final Map<String, List<AvailableTabsDto>> _indexCache = {};

  Future<TabConfigDto> loadTabsConfig({
    required String folder,
    required String tabKey,
  }) async {
    final cacheKey = '$folder/${tabKey}Key';
    if (_tabsCache.containsKey(cacheKey)) {
      return _tabsCache[cacheKey]!;
    }

    final path = '$_basePath/$folder/$tabKey.json';

    try {
      final String jsonString;
      try {
        jsonString = await rootBundle.loadString(path);
      } on FlutterError catch (e) {
        _logError('FileSystem', e);
        throw Exception('Config error: File $path not found in assets');
      }

      // Парсим в изоляте для больших конфигов
      final TabConfigDto result = await Isolate.run(() {
        final Map<String, dynamic> json = jsonDecode(jsonString);
        final tabData = json[tabKey] as Map<String, dynamic>?;
        if (tabData == null) throw FormatException('Key $tabKey not found');

        return TabConfigDto.fromJson(tabData);
      }, debugName: 'Tabs Isolate: $tabKey');

      // Кеш вне изолята - в противном случае запись не произойдет
      _tabsCache[cacheKey] = result;

      return result;
    } on FormatException catch (e) {
      _logError('Format', e.message);
      rethrow;
    } catch (e, stacktrace) {
      _logError('Parsing error', e, stacktrace);
      throw Exception('Ошибка загрузки вкладки $tabKey: $e');
    }
  }

  Future<List<AvailableTabsDto>> getAvailableTabs({
    required String folder,
    required String indexKey,
  }) async {
    final cacheKey = '$folder/$indexKey';

    if (_indexCache.containsKey(cacheKey)) {
      return _indexCache[cacheKey]!;
    }

    final path = '$_basePath/$folder/index.json';

    try {
      final String jsonString;
      try {
        jsonString = await rootBundle.loadString(path);
      } on FlutterError catch (e) {
        _logError('FileSystem', e);
        throw Exception('Config error: File $path not found in assets');
      }

      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      final List<dynamic> rawTabs = jsonMap[indexKey] ?? [];

      final List<AvailableTabsDto> result = rawTabs
          .map((e) => AvailableTabsDto.fromJson(e as Map<String, dynamic>))
          .toList();

      // Запись в кэш
      _indexCache[cacheKey] = result;
      return result;
    } on FormatException catch (e) {
      _logError('Format', e.message);
      rethrow;
    } catch (e, stacktrace) {
      _logError('Index error', e, stacktrace);
      throw Exception('Не удалось загрузить индекс вкладок : $e');
    }
  }

  void _logError(String label, dynamic e, [StackTrace? stack]) {
    debugPrint('[$label]: $e');
    if (stack != null) debugPrint('$stack');
  }

  // Удобный метод для очистки памяти
  void clearCache() {
    _tabsCache.clear();
    _indexCache.clear();
  }
}
