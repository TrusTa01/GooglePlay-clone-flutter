import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/features/sections/data/mappers/network/section_mapper.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';
import 'package:google_play/features/sections/domain/entities/section_data_source.dart';
import 'package:google_play/features/sections/domain/entities/section_layout_kind_enum.dart';

void main() {
  test('maps section fields with localized title/subtitle and params', () {
    const dto = SectionsDto(
      id: 's-1',
      tabId: 'for_you',
      tabKey: 'for_you',
      sectionType: 'grid',
      title: {'en': 'Top', 'ru': 'Топ'},
      subtitle: {'en': 'Best', 'ru': 'Лучшее'},
      dataSource: 'products_list',
      imageAssetPath: '/grid.png',
      sortOrder: 1,
      contentType: 'apps',
      dataParamsDto: ParamsDto(
        sort: 'top_rated',
        extras: ParamsExtrasDto(
          filters: [ParamFilterDto(type: 'tag', value: 'Action')],
        ),
      ),
    );

    final entity = dto.toEntity('ru');

    expect(entity.id, 's-1');
    expect(entity.sectionType, SectionLayoutKind.grid);
    expect(entity.dataSource, isA<ProductListSource>());
    expect(entity.title, 'Топ');
    expect(entity.subtitle, 'Лучшее');
    expect(entity.dataParamsEntity?.sort, 'top_rated');
    expect(entity.dataParamsEntity?.extras?.filters.first.type, 'tag');
  });

  test(
    'infers banners layout kind from data source when section type unknown',
    () {
      const dto = SectionsDto(
        id: 's-2',
        tabId: 'for_you',
        tabKey: 'for_you',
        sectionType: 'something_new',
        title: null,
        subtitle: null,
        dataSource: 'banners',
        imageAssetPath: '/banner.png',
        sortOrder: 2,
        contentType: 'banners',
        dataParamsDto: null,
      );

      final entity = dto.toEntity('en');

      expect(entity.sectionType, SectionLayoutKind.banners);
      expect(entity.dataSource, isA<BannersSource>());
    },
  );

  test('maps unknown data source to UnknownSource', () {
    const dto = SectionsDto(
      id: 's-3',
      tabId: 'for_you',
      tabKey: 'for_you',
      sectionType: 'preview',
      title: null,
      subtitle: null,
      dataSource: 'mystery',
      imageAssetPath: '/preview.png',
      sortOrder: 3,
      contentType: 'apps',
      dataParamsDto: null,
    );

    final entity = dto.toEntity('en');

    expect(entity.sectionType, SectionLayoutKind.preview);
    expect(entity.dataSource, isA<UnknownSource>());
  });
}
