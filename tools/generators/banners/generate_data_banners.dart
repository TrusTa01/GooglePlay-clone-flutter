// ignore_for_file: avoid_print
// Генерация мок-данных баннеров на базе assets/data/banners.json

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:faker/faker.dart';

import 'banners_text_data.dart';

Map<String, String> _loc(String en, String ru) => {'en': en, 'ru': ru};

String _readRuString(dynamic value) {
  if (value is String) return value;
  if (value is Map) {
    final dynamic ru = value['ru'];
    if (ru is String && ru.isNotEmpty) return ru;
  }
  return '';
}

String _translateTitleToEn(String ruTitle, Faker faker) {
  return titleEnByRu[ruTitle] ??
      faker.lorem.words(2 + Random().nextInt(2)).join(' ');
}

Future<void> runBanners(int count) async {
  final faker = Faker();
  final random = Random();
  final sourceFile = File('assets/data/banners.json');

  if (!await sourceFile.exists()) {
    throw Exception('Source file not found: ${sourceFile.path}');
  }

  final String sourceJson = await sourceFile.readAsString();
  final List<dynamic> decoded = jsonDecode(sourceJson);
  final List<Map<String, dynamic>> source = decoded
      .whereType<Map>()
      .map((item) => Map<String, dynamic>.from(item))
      .toList();

  if (source.isEmpty) {
    throw Exception('Source banners list is empty: ${sourceFile.path}');
  }

  final List<String> imagePool = source
      .map((b) => b['imageAssetPath'])
      .whereType<String>()
      .where((p) => p.isNotEmpty)
      .toSet()
      .toList();

  final List<Map<String, dynamic>> banners = [];

  for (int i = 0; i < count; i++) {
    final Map<String, dynamic> template = source[i % source.length];
    final Map<String, dynamic> banner = Map<String, dynamic>.from(template);

    banner['id'] = 'b_${i + 1}';

    final String titleRu = _readRuString(template['title']);
    if (titleRu.isNotEmpty) {
      banner['title'] = _loc(_translateTitleToEn(titleRu, faker), titleRu);
    }

    final String descriptionRu = _readRuString(template['description']);
    if (descriptionRu.isNotEmpty) {
      banner['description'] = _loc(faker.lorem.sentence(), descriptionRu);
    }

    final String eventDescriptionRu = _readRuString(
      template['eventDescription'],
    );
    if (eventDescriptionRu.isNotEmpty) {
      banner['eventDescription'] = _loc(
        faker.lorem.sentence(),
        eventDescriptionRu,
      );
    }

    final String tooltipRu = _readRuString(template['topToolTipText']);
    if (tooltipRu.isNotEmpty) {
      banner['topToolTipText'] = _loc(
        tooltipEnByRu[tooltipRu] ?? faker.lorem.word(),
        tooltipRu,
      );
    }

    if (imagePool.isNotEmpty) {
      banner['imageAssetPath'] = imagePool[random.nextInt(imagePool.length)];
    }

    banners.add(banner);
  }

  await sourceFile.parent.create(recursive: true);
  await sourceFile.writeAsString(jsonEncode(banners));

  print('Successfully generated ${banners.length} banner objects to ${sourceFile.path}\n');
}

Future<void> main(List<String> args) async {
  final int count = args.isNotEmpty ? int.tryParse(args.first) ?? 100 : 100;
  await runBanners(count);
}
