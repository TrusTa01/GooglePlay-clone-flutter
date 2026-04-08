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

String _readEnString(dynamic value) {
  if (value is Map) {
    final dynamic en = value['en'];
    if (en is String && en.isNotEmpty) return en;
  }
  return '';
}

String _variant(String base, List<String> variants, Random random) {
  final cleanBase = base.trim();
  if (cleanBase.isEmpty || variants.isEmpty) return cleanBase;
  final suffix = variants[random.nextInt(variants.length)];
  return '$cleanBase $suffix';
}

Map<String, String> _randomPairedEventDescription(Random random) {
  assert(
    eventDescriptionRuLines.length == eventDescriptionEnLines.length,
    'eventDescriptionRuLines и eventDescriptionEnLines должны совпадать по длине',
  );
  final i = random.nextInt(eventDescriptionRuLines.length);
  return {'ru': eventDescriptionRuLines[i], 'en': eventDescriptionEnLines[i]};
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
      'topTooltipText': 'Новинка',
      'description': 'Подборка лучших предложений для вас',
    },
    {
      'type': 'action',
      'imageAssetPath': 'banners/images/banner_2.webp',
      'title': 'Скидки на приложения',
      'topTooltipText': 'Акция',
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
    final String titleEnFromTemplate = _readEnString(template['title']);
    if (titleRu.isNotEmpty) {
      final ruTitle = _variant(titleRu, ruTitleVariants, random);
      final enBase = titleEnFromTemplate.isNotEmpty
          ? titleEnFromTemplate
          : _translateTitleToEn(titleRu, faker);
      banner['title'] = {
        'ru': ruTitle,
        'en': _variant(enBase, enTitleVariants, random),
      };
    } else {
      final fallbackTitleEn = _translateTitleToEn('promo', faker);
      banner['title'] = {
        'ru': _variant(fallbackTitleEn, ruTitleVariants, random),
        'en': _variant(fallbackTitleEn, enTitleVariants, random),
      };
    }

    final String descriptionRu = _readRuString(template['description']);
    final String descriptionEn = _readEnString(template['description']);
    if (descriptionRu.isNotEmpty) {
      final ruDescription = _variant(
        descriptionRu,
        ruDescriptionVariants,
        random,
      );
      final enBase = descriptionEn.isNotEmpty
          ? descriptionEn
          : faker.lorem.sentence();
      banner['description'] = {
        'ru': ruDescription,
        'en': _variant(enBase, enDescriptionVariants, random),
      };
    } else {
      final fallbackDescriptionRu = faker.lorem.sentence();
      final fallbackDescriptionEn = faker.lorem.sentence();
      banner['description'] = {
        'ru': _variant(fallbackDescriptionRu, ruDescriptionVariants, random),
        'en': _variant(fallbackDescriptionEn, enDescriptionVariants, random),
      };
    }

    final String eventDescriptionRu = _readRuString(
      template['eventDescription'],
    );
    final String eventDescriptionEn = _readEnString(
      template['eventDescription'],
    );
    if (eventDescriptionRu.isNotEmpty) {
      final ruEventDescription = _variant(
        eventDescriptionRu,
        ruEventDescriptionSuffixes,
        random,
      );
      final enEventBase = eventDescriptionEn.isNotEmpty
          ? eventDescriptionEn
          : eventDescriptionEnLines[random.nextInt(
              eventDescriptionEnLines.length,
            )];
      banner['eventDescription'] = {
        'ru': ruEventDescription,
        'en': _variant(enEventBase, enEventDescriptionSuffixes, random),
      };
    }

    final dynamic tooltipSource =
        template['topTooltipText'] ?? template['topToolTipText'];
    final String tooltipRu = _readRuString(tooltipSource);
    final String tooltipEnFromTemplate = _readEnString(tooltipSource);
    if (tooltipRu.isNotEmpty) {
      banner['topTooltipText'] = {
        'ru': tooltipRu,
        'en': tooltipEnFromTemplate.isNotEmpty
            ? tooltipEnFromTemplate
            : (tooltipEnByRu[tooltipRu] ?? faker.lorem.word()),
      };
    } else {
      final ruFallback = tooltipEnByRu.keys.elementAt(
        random.nextInt(tooltipEnByRu.length),
      );
      final fallbackTooltip = tooltipEnByRu[ruFallback] ?? faker.lorem.word();
      banner['topTooltipText'] = {'ru': ruFallback, 'en': fallbackTooltip};
    }

    if (imagePool.isNotEmpty) {
      banner['imageAssetPath'] = imagePool[random.nextInt(imagePool.length)];
    }

    final type = (banner['type'] ?? '').toString().trim().toLowerCase();
    if (type == 'event') {
      banner['eventId'] =
          banner['eventId'] ??
          banner['event_id'] ??
          template['eventId'] ??
          template['event_id'] ??
          'event_${i + 1}';
      banner['eventCategory'] =
          banner['eventCategory'] ??
          banner['event_category'] ??
          template['eventCategory'] ??
          template['event_category'] ??
          'general';
      banner['eventDescription'] =
          banner['eventDescription'] ??
          banner['event_description'] ??
          template['eventDescription'] ??
          template['event_description'] ??
          _randomPairedEventDescription(random);
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
