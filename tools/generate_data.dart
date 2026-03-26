// Entry point wrapper for mock data generation.
// ignore_for_file: avoid_print
import 'dart:io';

import 'generators/products/games/generate_data_games.dart';
import 'generators/products/apps/generate_data_apps.dart';
import 'generators/products/books/generate_data_books.dart';
import 'generators/banners/generate_data_banners.dart';

Future<void> main() async {
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
}

Future<void> _loadData(int commonCount, int bannersCount) async => Future.wait([
  runGames(commonCount),
  runApps(commonCount),
  runBooks(commonCount),
  runBanners(bannersCount),
]);
