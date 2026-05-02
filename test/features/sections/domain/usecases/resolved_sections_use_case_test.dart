import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';
import 'package:google_play/features/banners/domain/use_cases/get_banners_use_case.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/use_cases/get_products_by_filters_use_case.dart';
import 'package:google_play/features/sections/domain/entities/params_entity.dart';
import 'package:google_play/features/sections/domain/entities/section_data_source.dart';
import 'package:google_play/features/sections/domain/entities/section_layout_kind_enum.dart';
import 'package:google_play/features/sections/domain/entities/sections_entity.dart';
import 'package:google_play/features/sections/domain/use_cases/get_sections_use_case.dart';
import 'package:google_play/features/sections/domain/use_cases/resolved_sections_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockGetSectionsUseCase extends Mock implements GetSectionsUseCase {}

class MockLoadProductsByFiltersUseCase extends Mock
    implements LoadProductsByFiltersUseCase {}

class MockGetBannersUseCase extends Mock implements IGetBannersUseCase {}

class FakeProduct extends ProductEntity {
  FakeProduct({required super.id})
    : super(
        type: 'app',
        title: 'Product',
        creator: 'Creator',
        shortDescription: 'Short',
        description: 'Description',
        releaseDate: DateTime(2024, 1, 1),
        reviewsCount: 10,
        ratingAvg: 4.5,
        iconUrl: 'icon.png',
        isPaid: false,
        price: null,
        creatorDescription: '',
        url: 'url',
        tags: const [],
        categories: const [],
      );

  @override
  String get technicalInfo => '';
}

class FakeBanner extends BannerEntity {
  const FakeBanner({required super.id})
    : super(
        type: BannerType.event,
        imageAssetPath: 'banner.png',
        title: 'Banner',
        description: 'Description',
      );
}

void main() {
  late MockGetSectionsUseCase getSections;
  late MockLoadProductsByFiltersUseCase loadProducts;
  late MockGetBannersUseCase getBanners;
  late ResolvedSectionsUseCaseImpl useCase;

  setUpAll(() {
    registerFallbackValue(ProductKind.app);
    registerFallbackValue(BannerKind.event);
  });

  setUp(() {
    getSections = MockGetSectionsUseCase();
    loadProducts = MockLoadProductsByFiltersUseCase();
    getBanners = MockGetBannersUseCase();
    useCase = ResolvedSectionsUseCaseImpl(
      getSections,
      loadProducts,
      getBanners,
    );
  });

  test('resolves ProductListSource with mapped filters and sort', () async {
    final section = const SectionEntity(
      id: 'products',
      tabKey: 'for_you',
      sectionType: SectionLayoutKind.grid,
      sortOrder: 1,
      contentType: 'apps',
      dataSource: ProductListSource(),
      dataParamsEntity: ParamsEntity(
        sort: 'top_rated',
        extras: ParamsExtrasEntity(
          filters: [ParamFilterEntity(type: 'tag', value: 'Action')],
        ),
      ),
    );
    when(
      () => getSections(
        productKind: ProductKind.app,
        tabId: 'for_you',
        locale: 'en',
        forceRefresh: false,
      ),
    ).thenAnswer((_) async => [section]);
    when(
      () => loadProducts(
        filters: any(named: 'filters'),
        sort: any(named: 'sort'),
        type: ProductKind.app,
        locale: 'en',
        page: 1,
        pageSize: 100,
      ),
    ).thenAnswer((_) async => [FakeProduct(id: 'p-1')]);

    final result = await useCase(
      productKind: ProductKind.app,
      tabId: 'for_you',
      locale: 'en',
    );

    expect(result, hasLength(1));
    expect(result.first.config.id, 'products');
    expect(result.first.items.single.id, 'p-1');
    verify(
      () => loadProducts(
        filters: any(named: 'filters'),
        sort: any(named: 'sort'),
        type: ProductKind.app,
        locale: 'en',
        page: 1,
        pageSize: 100,
      ),
    ).called(1);
  });

  test('resolves BannersSource with mapped BannerKind', () async {
    final section = const SectionEntity(
      id: 'banners',
      tabKey: 'for_you',
      sectionType: SectionLayoutKind.banners,
      sortOrder: 2,
      contentType: 'action_banner',
      dataSource: BannersSource(),
    );
    when(
      () => getSections(
        productKind: ProductKind.app,
        tabId: 'for_you',
        locale: 'ru',
        forceRefresh: false,
      ),
    ).thenAnswer((_) async => [section]);
    when(
      () => getBanners(
        type: BannerKind.action,
        locale: 'ru',
        page: 1,
        pageSize: 50,
      ),
    ).thenAnswer((_) async => [const FakeBanner(id: 'b-1')]);

    final result = await useCase(
      productKind: ProductKind.app,
      tabId: 'for_you',
      locale: 'ru',
    );

    expect(result.single.items.single.id, 'b-1');
    verify(
      () => getBanners(
        type: BannerKind.action,
        locale: 'ru',
        page: 1,
        pageSize: 50,
      ),
    ).called(1);
  });

  test(
    'returns empty items for sections that should skip data fetch',
    () async {
      final section = const SectionEntity(
        id: 'kids-hero',
        tabKey: 'for_you',
        sectionType: SectionLayoutKind.kidsHeroBanner,
        sortOrder: 3,
        contentType: 'kids',
        dataSource: UnknownSource(),
      );
      when(
        () => getSections(
          productKind: ProductKind.game,
          tabId: 'for_you',
          locale: 'en',
          forceRefresh: false,
        ),
      ).thenAnswer((_) async => [section]);

      final result = await useCase(
        productKind: ProductKind.game,
        tabId: 'for_you',
        locale: 'en',
      );

      expect(result.single.items, isEmpty);
      verifyNever(
        () => loadProducts(
          filters: any(named: 'filters'),
          sort: any(named: 'sort'),
          type: any(named: 'type'),
          locale: any(named: 'locale'),
          page: any(named: 'page'),
          pageSize: any(named: 'pageSize'),
          forceRefresh: any(named: 'forceRefresh'),
        ),
      );
      verifyNever(
        () => getBanners(
          type: any(named: 'type'),
          locale: any(named: 'locale'),
          page: any(named: 'page'),
          pageSize: any(named: 'pageSize'),
          forceRefresh: any(named: 'forceRefresh'),
        ),
      );
    },
  );
}
