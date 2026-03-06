import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/domain/entities/sections/section_data_source.dart';
import 'package:google_play/domain/entities/sections/section_layout_kind.dart';
import 'package:google_play/domain/entities/sections/tab_config_entity.dart';
import 'package:google_play/domain/entities/products/product_filter.dart';

extension SectionMapper on SectionDto {
  SectionEntity toEntity() {
    return SectionEntity(
      id: id,
      layout: _mapLayout(type),
      titleKey: titleKey,
      subtitleKey: subtitleKey,
      dataSource: _mapDataSource(dataSource, dataParamsDto),
      imageAssetPath: imageAssetPath,
    );
  }

  SectionLayoutKind _mapLayout(String? type) {
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

  SectionDataSource _mapDataSource(String? source, DataParamsDto? params) {
    if (source == 'banners') {
      final prefix = params?.extras['prefix'] ?? 'defautl';
      return BannersSource(prefix);
    }

    final filters = <ProductFilter>[];

    if (params?.filterType != null) {
      filters.add(_createFilter(params!.filterType!, params.filterValue));
    }

    final dynamic filterList = params?.extras['filters'];
    if (filterList is List) {
      for (var f in filterList) {
        if (f is Map<String, dynamic>) {
          filters.add(_createFilter(f['type'], f['value']));
        }
      }
    }

    return ProductListSource(filters);
  }

  ProductFilter _createFilter(String type, dynamic value) {
    return switch (type) {
      'recommended' => const RecommendedFilter(),
      'category' => CategoryFilter(genre: value.toString()),
      'is_paid' => IsPaidFilter(isPaid: value == true),
      'tag' => TagFilter(tag: value.toString()),
      'collection' => CollectionFilter(collectionName: value.toString()),
      _ => const UnknownFilter(),
    };
  }
}
