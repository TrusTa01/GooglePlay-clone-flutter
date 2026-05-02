import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/entities/base_entity.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/sections/domain/entities/params_entity.dart';
import 'package:google_play/features/sections/domain/entities/section_data_source.dart';
import 'package:google_play/features/sections/domain/entities/section_layout_kind_enum.dart';
import 'package:google_play/features/sections/domain/entities/sections_entity.dart';
import 'package:google_play/features/sections/presentation/viewmodels/section_payload.dart';
import 'package:google_play/features/sections/presentation/viewmodels/ui_mappers/section_payload_mapper.dart';
import 'package:mocktail/mocktail.dart';

class MockAppLocalizations extends Mock implements AppLocalizations {}

class DummyEntity extends Entity {
  const DummyEntity({required super.id});
}

class FakeBanner extends BannerEntity {
  const FakeBanner({required super.id})
    : super(
        type: BannerType.event,
        imageAssetPath: '/banner.png',
        title: 'Banner',
        description: 'Description',
      );
}

void main() {
  final mapper = SectionPayloadMapper();
  late AppLocalizations l10n;

  setUp(() {
    l10n = MockAppLocalizations();
  });

  test(
    'maps banners section to BannersPayload and filters non-banner items',
    () {
      const config = SectionEntity(
        id: 's-banners',
        tabKey: 'for_you',
        sectionType: SectionLayoutKind.banners,
        dataSource: BannersSource(),
        sortOrder: 1,
        contentType: 'banners',
      );
      const items = [FakeBanner(id: 'b-1'), DummyEntity(id: 'x-1')];

      final payload = mapper.map(
        config: config,
        items: items,
        l10n: l10n,
        locale: const Locale('en'),
      );

      expect(payload, isA<BannersPayload>());
      final banners = (payload as BannersPayload).banners;
      expect(banners, hasLength(1));
      expect(banners.first.id, 'b-1');
      expect(banners.first.title, 'Banner');
    },
  );

  test('maps carousel section and extracts category key from params', () {
    const config = SectionEntity(
      id: 's-carousel',
      tabKey: 'for_you',
      sectionType: SectionLayoutKind.carousel,
      title: 'Top picks',
      dataSource: ProductListSource(),
      sortOrder: 2,
      contentType: 'apps',
      dataParamsEntity: ParamsEntity(
        extras: ParamsExtrasEntity(
          filters: [ParamFilterEntity(type: 'category', value: 'Action')],
        ),
      ),
    );

    final payload = mapper.map(
      config: config,
      items: const [],
      l10n: l10n,
      locale: const Locale('en'),
    );

    expect(payload, isA<CarouselPayload>());
    final carousel = payload as CarouselPayload;
    expect(carousel.items, isEmpty);
    expect(carousel.categoryKey, 'Action');
    expect(carousel.title, 'Top picks');
  });

  test('maps unknown layout kind to EmptyPayload', () {
    const config = SectionEntity(
      id: 's-unknown',
      tabKey: 'for_you',
      sectionType: SectionLayoutKind.unknown,
      dataSource: UnknownSource(),
      sortOrder: 3,
      contentType: 'unknown',
    );

    final payload = mapper.map(
      config: config,
      items: const [],
      l10n: l10n,
      locale: const Locale('en'),
    );

    expect(payload, isA<EmptyPayload>());
  });
}
