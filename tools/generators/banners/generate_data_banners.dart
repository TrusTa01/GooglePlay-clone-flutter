// ignore_for_file: avoid_print
// Генерация мок-данных баннеров на базе assets/data/banners.json

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:faker/faker.dart';

import 'banners_text_data.dart';

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

List<Map<String, dynamic>> _defaultBannerTemplates() {
  return [
    {
      'type': 'event',
      'imageAssetPath': 'banners/images/banner_1.webp',
      'title': 'Рекомендуем',
      'topToolTipText': 'Новинка',
      'description': 'Подборка лучших предложений для вас',
    },
    {
      'type': 'action',
      'imageAssetPath': 'banners/images/banner_2.webp',
      'title': 'Скидки на приложения',
      'topToolTipText': 'Акция',
      'description': 'Популярные приложения по сниженной цене',
      'productId': 'a_1',
    },
  ];
}

List<Map<String, dynamic>> _decodeSourceSafely(String sourceJson) {
  if (sourceJson.trim().isEmpty) {
    return _defaultBannerTemplates();
  }

  try {
    final dynamic parsed = jsonDecode(sourceJson);
    if (parsed is! List) return _defaultBannerTemplates();

    final List<Map<String, dynamic>> templates = parsed
        .whereType<Map>()
        .map((item) => Map<String, dynamic>.from(item))
        .toList();

    return templates.isEmpty ? _defaultBannerTemplates() : templates;
  } on FormatException {
    return _defaultBannerTemplates();
  }
}

Future<void> runBanners(int count) async {
  final faker = Faker();
  final random = Random();

  if (bannerImages.isEmpty) {
    throw StateError(
      'Список bannerImages пуст в banners_text_data.dart.\n'
      'Запустите сначала: dart run tools/generators/sync_storage_media_lists.dart',
    );
  }

  final sourceFile = File('assets/data/banners.json');

  if (!await sourceFile.exists()) {
    throw Exception('Source file not found: ${sourceFile.path}');
  }

  final String sourceJson = await sourceFile.readAsString();
  final List<Map<String, dynamic>> source = _decodeSourceSafely(sourceJson);

  if (source.isEmpty) {
    throw Exception('Source banners list is empty: ${sourceFile.path}');
  }

  final List<String> imagePool = List<String>.from(bannerImages);

  final List<Map<String, dynamic>> banners = [];

  for (int i = 0; i < count; i++) {
    final Map<String, dynamic> template = source[i % source.length];
    final Map<String, dynamic> banner = Map<String, dynamic>.from(template);

    banner['id'] = 'b_${i + 1}';

    final String titleRu = _readRuString(template['title']);
    if (titleRu.isNotEmpty) {
      banner['title'] = titleRu;
    } else {
      banner['title'] = _translateTitleToEn('promo', faker);
    }

    final String descriptionRu = _readRuString(template['description']);
    if (descriptionRu.isNotEmpty) {
      banner['description'] = descriptionRu;
    } else {
      banner['description'] = faker.lorem.sentence();
    }

    final String eventDescriptionRu = _readRuString(
      template['eventDescription'],
    );
    if (eventDescriptionRu.isNotEmpty) {
      banner['eventDescription'] = eventDescriptionRu;
    }

    final String tooltipRu = _readRuString(template['topToolTipText']);
    if (tooltipRu.isNotEmpty) {
      banner['topToolTipText'] = tooltipRu;
    } else {
      banner['topToolTipText'] = tooltipEnByRu.values.first;
    }

    if (imagePool.isNotEmpty) {
      banner['imageAssetPath'] = imagePool[random.nextInt(imagePool.length)];
    }

    banners.add(banner);
  }

  await sourceFile.parent.create(recursive: true);
  await sourceFile.writeAsString(jsonEncode(banners));

  print(
    'Successfully generated ${banners.length} banner objects to ${sourceFile.path}\n',
  );
}

Future<void> main(List<String> args) async {
  final int count = args.isNotEmpty ? int.tryParse(args.first) ?? 100 : 100;
  await runBanners(count);
}
