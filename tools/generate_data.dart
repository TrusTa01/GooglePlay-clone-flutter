// Entry point wrapper for mock data generation
// ignore_for_file: avoid_print
//
// Порядок запуска:
//   1. dart run tools/generators/sync_storage_media_lists.dart
//      (синхронизирует URL из Supabase Storage в *_text_data.dart и storage_links.json)
//   2. dart run tools/generate_data.dart
//      (генерирует JSON-файлы на основе обновлённых данных)
//   3. dart run tools/upload_data.dart
//      (загружает JSON в Supabase)

import 'dart:io';

import 'generators/products/games/generate_data_games.dart';
import 'generators/products/apps/generate_data_apps.dart';
import 'generators/products/books/generate_data_books.dart';
import 'generators/banners/generate_data_banners.dart';

Future<void> main() async {
  print(
    'Требование: сначала выполните '
    'dart run tools/generators/sync_storage_media_lists.dart',
  );
  print('Введите количество записей для games/apps/books:');
  final String? commonInput = stdin.readLineSync();
  final int commonCount = int.tryParse(commonInput ?? '') ?? 100;

  print('Введите количество баннеров:');
  final String? bannersInput = stdin.readLineSync();
  final int bannersCount = int.tryParse(bannersInput ?? '') ?? 20;

  print(
    'Начинаю генерацию: apps/books/games=$commonCount, banners=$bannersCount',
  );
  await _loadData(commonCount, bannersCount);

  print('Генерация успешно завершена!');
  print('\nСначала нужно сгенерировать отзывы:');
  print('dart run tools/generators/reviews/generate_product_reviews.dart');
  print('Теперь можно загрузить данные в облако:');
  print('dart run tools/upload_data.dart');
}

Future<void> _loadData(int commonCount, int bannersCount) async => Future.wait([
  runGames(commonCount),
  runApps(commonCount),
  runBooks(commonCount),
  runBanners(bannersCount),
]);
