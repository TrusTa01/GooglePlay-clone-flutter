import 'dart:convert';

import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/sections/data/mappers/network/section_mapper.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';
import 'package:google_play/features/sections/domain/entities/sections_entity.dart';

extension CachedSectionsMapper on CachedSection {
  SectionEntity toEntity(String locale) {
    final entity = toSectionDto().toEntity(locale);
    FeatureTalker.mapperOut(
      'sections.cached_section_mapper',
      'CachedSection -> SectionEntity',
      context: {'id': id, 'locale': locale},
    );
    return entity;
  }

  SectionsDto toSectionDto() {
    return SectionsDto(
      id: id,
      tabId: tabId,
      tabKey: tabKey,
      sectionType: sectionType,
      title: title,
      subtitle: subtitle,
      dataSource: dataSource,
      imageAssetPath: imageAssetPath ?? '',
      sortOrder: sortOrder,
      contentType: contentType,
      dataParamsDto: _decodeDataParams(params),
    );
  }
}

ParamsDto? _decodeDataParams(String? raw) {
  if (raw == null || raw.isEmpty) return null;
  try {
    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) return null;
    return ParamsDto.fromJson(decoded);
  } on Object {
    FeatureTalker.mapperOut(
      'sections.cached_section_mapper',
      'failed to decode params json',
      context: {'rawLength': raw.length},
    );
    return null;
  }
}
