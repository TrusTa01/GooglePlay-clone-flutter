import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/sections/data/mappers/local/cached_section_mapper.dart';
import 'package:google_play/features/sections/domain/entities/section_data_source.dart';
import 'package:google_play/features/sections/domain/entities/section_layout_kind_enum.dart';

void main() {
  test('maps CachedSection to SectionsDto/SectionEntity with decoded params', () {
    const cached = CachedSection(
      id: 's-1',
      tabId: 'for_you',
      sectionType: 'grid',
      title: {'en': 'Top', 'ru': 'Топ'},
      subtitle: {'en': 'Best', 'ru': 'Лучшее'},
      dataSource: 'products_list',
      params:
          '{"sort":"top_rated","extras":{"filters":[{"type":"tag","value":"Action"}]}}',
      imageAssetPath: '/grid.png',
      sortOrder: 1,
      contentType: 'apps',
      tabKey: 'for_you',
      sectionKey: 'top_grid',
    );

    final dto = cached.toSectionDto();
    final entity = cached.toEntity('ru');

    expect(dto.dataParamsDto, isNotNull);
    expect(dto.dataParamsDto?.sort, 'top_rated');
    expect(dto.dataParamsDto?.extras.filters, hasLength(1));
    expect(entity.sectionType, SectionLayoutKind.grid);
    expect(entity.dataSource, isA<ProductListSource>());
    expect(entity.title, 'Топ');
  });

  test('returns null params when cached params json is malformed', () {
    const cached = CachedSection(
      id: 's-2',
      tabId: 'for_you',
      sectionType: 'banners',
      title: null,
      subtitle: null,
      dataSource: 'banners',
      params: '{not valid json}',
      imageAssetPath: null,
      sortOrder: 2,
      contentType: 'banners',
      tabKey: 'for_you',
      sectionKey: 'hero',
    );

    final dto = cached.toSectionDto();

    expect(dto.dataParamsDto, isNull);
    expect(dto.imageAssetPath, '');
  });

  test('returns null params when cached params is empty', () {
    const cached = CachedSection(
      id: 's-3',
      tabId: 'for_you',
      sectionType: 'preview',
      title: null,
      subtitle: null,
      dataSource: 'recommendations',
      params: '',
      imageAssetPath: '/preview.png',
      sortOrder: 3,
      contentType: 'apps',
      tabKey: 'for_you',
      sectionKey: 'preview',
    );

    final dto = cached.toSectionDto();

    expect(dto.dataParamsDto, isNull);
  });
}
