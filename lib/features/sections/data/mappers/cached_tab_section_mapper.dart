import 'dart:convert';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/sections/data/mappers/section_mapper.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';
import 'package:google_play/features/sections/domain/entities/section_entity.dart';

extension CachedTabSectionMapper on CachedTabSection {
  SectionEntity toEntity(String locale) => toSectionDto().toEntity(locale);

  SectionDto toSectionDto() {
    return SectionDto(
      id: id,
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

DataParamsDto? _decodeDataParams(String? raw) {
  if (raw == null || raw.isEmpty) return null;
  try {
    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) return null;
    return DataParamsDto.fromJson(decoded);
  } on Object {
    return null;
  }
}
