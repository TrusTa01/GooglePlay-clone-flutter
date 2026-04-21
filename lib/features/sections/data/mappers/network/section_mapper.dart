import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/features/sections/data/mappers/network/params_mapper.dart';
import 'package:google_play/features/sections/domain/entities/section_data_source.dart';
import 'package:google_play/features/sections/domain/entities/section_layout_kind_enum.dart';
import 'package:google_play/features/sections/domain/entities/sections_entity.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';

extension SectionMapper on SectionsDto {
  SectionEntity toEntity(String locale) => SectionEntity(
    id: id,
    tabKey: tabKey,
    sectionType: _mapSectionType(sectionType, dataSource),
    title: title?.display(locale),
    subtitle: subtitle?.display(locale),
    dataSource: _mapSectionDataSource(dataSource),
    imageAssetPath: imageAssetPath,
    sortOrder: sortOrder,
    contentType: contentType,
    dataParamsEntity: dataParamsDto?.toEntity(),
  );

  SectionLayoutKind _mapSectionType(String? type, String? source) {
    final normalized = type?.trim().toLowerCase();
    final normalizedSource = source?.trim().toLowerCase();
    final mapped = switch (normalized) {
      'carousel' => SectionLayoutKind.carousel,
      'grid' => SectionLayoutKind.grid,
      'preview' => SectionLayoutKind.preview,
      'banners' => SectionLayoutKind.banners,
      'kids_hero_banner' => SectionLayoutKind.kidsHeroBanner,
      'age_filter_selector' => SectionLayoutKind.ageFilterSelector,
      _ => SectionLayoutKind.unknown,
    };
    if (mapped == SectionLayoutKind.unknown) {
      final inferred = switch (normalizedSource) {
        'banners' => SectionLayoutKind.banners,
        'products_list' || 'recommendations' => SectionLayoutKind.carousel,
        _ => SectionLayoutKind.unknown,
      };
      if (inferred != SectionLayoutKind.unknown) return inferred;
    }

    return mapped;
  }

  SectionDataSource _mapSectionDataSource(String? source) {
    final normalized = source?.trim().toLowerCase();
    final mapped = switch (normalized) {
      'products_list' || 'recommendations' => const ProductListSource(),
      'banners' => const BannersSource(),
      _ => const UnknownSource(),
    };
    return mapped;
  }
}
