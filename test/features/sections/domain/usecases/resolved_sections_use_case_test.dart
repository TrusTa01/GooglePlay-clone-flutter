import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';
import 'package:google_play/features/banners/domain/use_cases/get_banners_use_case.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/repositories/i_products_repository.dart';
import 'package:google_play/features/sections/domain/entities/params_entity.dart';
import 'package:google_play/features/sections/domain/entities/section_data_source.dart';
import 'package:google_play/features/sections/domain/entities/section_layout_kind_enum.dart';
import 'package:google_play/features/sections/domain/entities/sections_entity.dart';
import 'package:google_play/features/sections/domain/use_cases/get_sections_use_case.dart';
import 'package:google_play/features/sections/domain/use_cases/resolved_sections_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockGetSectionsUseCase extends Mock implements GetSectionsUseCase {}

class MockProductsRepository extends Mock implements IProductsRepository {}

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
  late MockProductsRepository productsRepo;
  late MockGetBannersUseCase getBanners;
  late ResolvedSectionsUseCaseImpl useCase;

  setUpAll(() {
    registerFallbackValue(ProductKind.app);
    registerFallbackValue(BannerKind.event);
  });

  setUp(() {
    getSections = MockGetSectionsUseCase();
    productsRepo = MockProductsRepository();
    getBanners = MockGetBannersUseCase();
    useCase = ResolvedSectionsUseCaseImpl(
      getSections,
      productsRepo,
      getBanners,
    );
  });

  test('resolves ProductListSource with mapped filters and sort', () async {
    final catalog = [FakeProduct(id: 'p-1')];
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
      () => productsRepo.getCachedProductCatalog(
        type: ProductKind.app,
        locale: 'en',
        forceRefresh: false,
      ),
    ).thenAnswer((_) async => catalog);
    when(
      () => productsRepo.sliceProductCatalog(
        catalog: catalog,
        filters: any(named: 'filters'),
        sort: any(named: 'sort'),
        page: 1,
        pageSize: 100,
      ),
    ).thenReturn([FakeProduct(id: 'p-1')]);

    final result = await useCase(
      productKind: ProductKind.app,
      tabId: 'for_you',
      locale: 'en',
    );

    expect(result, hasLength(1));
    expect(result.first.config.id, 'products');
    expect(result.first.items.single.id, 'p-1');
    verify(
      () => productsRepo.getCachedProductCatalog(
        type: ProductKind.app,
        locale: 'en',
        forceRefresh: false,
      ),
    ).called(1);
    verify(
      () => productsRepo.sliceProductCatalog(
        catalog: catalog,
        filters: any(named: 'filters'),
        sort: any(named: 'sort'),
        page: 1,
        pageSize: 100,
      ),
    ).called(1);
  });

  test('loads catalog once for multiple ProductListSource sections', () async {
    final catalog = [FakeProduct(id: 'p-1')];
    final s1 = const SectionEntity(
      id: 's1',
      tabKey: 'for_you',
      sectionType: SectionLayoutKind.grid,
      sortOrder: 1,
      contentType: 'apps',
      dataSource: ProductListSource(),
    );
    final s2 = const SectionEntity(
      id: 's2',
      tabKey: 'for_you',
      sectionType: SectionLayoutKind.grid,
      sortOrder: 2,
      contentType: 'apps',
      dataSource: ProductListSource(),
    );
    when(
      () => getSections(
        productKind: ProductKind.game,
        tabId: 'recommended',
        locale: 'en',
        forceRefresh: false,
      ),
    ).thenAnswer((_) async => [s1, s2]);
    when(
      () => productsRepo.getCachedProductCatalog(
        type: ProductKind.game,
        locale: 'en',
        forceRefresh: false,
      ),
    ).thenAnswer((_) async => catalog);
    when(
      () => productsRepo.sliceProductCatalog(
        catalog: catalog,
        filters: any(named: 'filters'),
        sort: any(named: 'sort'),
        page: 1,
        pageSize: 100,
      ),
    ).thenReturn(catalog);

    await useCase(
      productKind: ProductKind.game,
      tabId: 'recommended',
      locale: 'en',
    );

    verify(
      () => productsRepo.getCachedProductCatalog(
        type: ProductKind.game,
        locale: 'en',
        forceRefresh: false,
      ),
    ).called(1);
    verify(
      () => productsRepo.sliceProductCatalog(
        catalog: catalog,
        filters: any(named: 'filters'),
        sort: any(named: 'sort'),
        page: 1,
        pageSize: 100,
      ),
    ).called(2);
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
    verifyNever(
      () => productsRepo.getCachedProductCatalog(
        type: any(named: 'type'),
        locale: any(named: 'locale'),
        forceRefresh: any(named: 'forceRefresh'),
      ),
    );
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
        () => productsRepo.getCachedProductCatalog(
          type: any(named: 'type'),
          locale: any(named: 'locale'),
          forceRefresh: any(named: 'forceRefresh'),
        ),
      );
      verifyNever(
        () => productsRepo.sliceProductCatalog(
          catalog: any(named: 'catalog'),
          filters: any(named: 'filters'),
          sort: any(named: 'sort'),
          page: any(named: 'page'),
          pageSize: any(named: 'pageSize'),
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
