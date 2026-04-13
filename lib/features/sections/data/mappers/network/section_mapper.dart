import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/features/sections/data/mappers/network/params_mapper.dart';
import 'package:google_play/features/sections/domain/entities/section_data_source.dart';
import 'package:google_play/features/sections/domain/entities/section_layout_kind_enum.dart';
import 'package:google_play/features/sections/domain/entities/sections_entity.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';

extension SectionMapper on SectionsDto {
  SectionEntity toEntity(String locale) {
    return SectionEntity(
      id: id,
      tabKey: tabKey,
      sectionType: _mapSectionType(sectionType),
      title: title?.display(locale),
      subtitle: subtitle?.display(locale),
      dataSource: _mapSectionDataSource(dataSource),
      imageAssetPath: imageAssetPath,
      sortOrder: sortOrder,
      contentType: contentType,
      dataParamsEntity: dataParamsDto?.toEntity(),
    );
  }

  SectionLayoutKind _mapSectionType(String? type) {
    return switch (type) {
      'carousel' => SectionLayoutKind.carousel,
      'grid' => SectionLayoutKind.grid,
      'preview' => SectionLayoutKind.preview,
      'banners' => SectionLayoutKind.banners,
      'kids_hero_banner' => SectionLayoutKind.kidsHeroBanner,
      'age_filter_selector' => SectionLayoutKind.ageFilterSelector,
      _ => SectionLayoutKind.unknown,
    };
  }

  SectionDataSource _mapSectionDataSource(String? source) {
    return switch (source) {
      'products_list' => const ProductListSource(),
      'banners' => const BannersSource(),
      _ => const UnknownSource(),
    };
  }
}
