import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/data/local/sync_keys.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_policy.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_status_enum.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/product/data/data_sources/local/i_products_local_datasource.dart';
import 'package:google_play/features/product/data/data_sources/network/i_products_remote_data_source.dart';
import 'package:google_play/features/product/data/models/local/local_product_bundle.dart';
import 'package:google_play/features/product/data/models/network/product_dto.dart';
import 'package:google_play/features/product/data/repositories/cache_first_product_repository.dart';
import 'package:google_play/features/product/domain/entities/book_entity.dart';
import 'package:google_play/features/product/domain/entities/filters/product_filters.dart';
import 'package:google_play/features/product/domain/entities/filters/product_sort.dart';
import 'package:mocktail/mocktail.dart';

class MockProductsRemoteDataSource extends Mock
    implements IProductsRemoteDataSource {}

class MockProductsLocalDataSource extends Mock
    implements IProductsLocalDataSource {}

class MockFreshnessPolicy extends Mock implements FreshnessPolicy {}

class MockFetchBackoffPolicy extends Mock implements FetchBackoffPolicy {}

void main() {
  late MockProductsRemoteDataSource remote;
  late MockProductsLocalDataSource local;
  late MockFreshnessPolicy freshnessPolicy;
  late MockFetchBackoffPolicy backoffPolicy;
  late CacheFirstProductRepository repository;

  setUpAll(() {
    registerFallbackValue(DataFreshness(status: FreshnessStatus.missing));
    registerFallbackValue(ProductKind.book);
    registerFallbackValue(DateTime.utc(2024, 1, 1));
    registerFallbackValue(<ProductDto>[]);
  });

  setUp(() {
    remote = MockProductsRemoteDataSource();
    local = MockProductsLocalDataSource();
    freshnessPolicy = MockFreshnessPolicy();
    backoffPolicy = MockFetchBackoffPolicy();
    repository = CacheFirstProductRepository(
      remote: remote,
      local: local,
      freshnessPolicy: freshnessPolicy,
      fetchBackoffPolicy: backoffPolicy,
    );
  });

  group('CacheFirstProductRepository.getProducts success', () {
    test(
      'maps LocalProductBundle to BookEntity with localized fields',
      () async {
        // Arrange
        final bundle = _bookBundle(id: 'book-1');
        when(
          () =>
              local.getProducts(type: ProductKind.book, page: 1, pageSize: 20),
        ).thenAnswer((_) async => [bundle]);
        when(
          () =>
              remote.getProducts(type: ProductKind.book, page: 1, pageSize: 20),
        ).thenAnswer(
          (_) async => Result.success(data: [_bookDto(id: 'book-1')]),
        );
        when(() => local.upsertProducts(any())).thenAnswer((_) async {});
        when(() => local.setLastSync(any(), any())).thenAnswer((_) async {});
        when(() => local.recordSyncFailure(any())).thenAnswer((_) async {});

        // Act
        final result = await repository.getProducts(
          type: ProductKind.book,
          locale: 'ru',
          forceRefresh: true,
        );

        // Assert
        expect(result, hasLength(1));
        final entity = result.first;
        expect(entity, isA<BookEntity>());
        expect(entity.id, 'book-1');
        expect(entity.title, 'Чистый код');
        expect(entity.creator, 'Издатель');
        expect(entity.categories, ['Художественная']);
        expect(entity.tags, ['Бестселлер']);
      },
    );

    test(
      'refreshes from remote when local is empty and data is stale',
      () async {
        // Arrange
        final pageSyncKey = SyncKeys.productListPage(
          type: ProductKind.book,
          page: 1,
          pageSize: 20,
        );
        when(() => local.getSyncTimestamps(pageSyncKey)).thenAnswer(
          (_) async => (
            lastSyncAt: DateTime.now().subtract(const Duration(days: 3)),
            lastFailureAt: null,
            failureCount: 0,
          ),
        );
        when(
          () => freshnessPolicy.getStatus(any(), now: any(named: 'now')),
        ).thenReturn(FreshnessStatus.stale);
        when(
          () => backoffPolicy.shouldDeferFetch(any(), now: any(named: 'now')),
        ).thenReturn(false);
        when(
          () =>
              remote.getProducts(type: ProductKind.book, page: 1, pageSize: 20),
        ).thenAnswer(
          (_) async => Result.success(data: [_bookDto(id: 'book-2')]),
        );
        when(() => local.upsertProducts(any())).thenAnswer((_) async {});
        when(() => local.setLastSync(any(), any())).thenAnswer((_) async {});
        when(
          () =>
              local.getProducts(type: ProductKind.book, page: 1, pageSize: 20),
        ).thenAnswer((_) async => [_bookBundle(id: 'book-2')]);

        // Act
        final result = await repository.getProducts(
          type: ProductKind.book,
          locale: 'en',
        );

        // Assert
        expect(result, hasLength(1));
        expect(result.first.id, 'book-2');
        verify(
          () =>
              remote.getProducts(type: ProductKind.book, page: 1, pageSize: 20),
        ).called(1);
        verify(() => local.upsertProducts(any())).called(1);
      },
    );
  });

  group('CacheFirstProductRepository.getProducts errors', () {
    test(
      'records sync failure on remote failure and still returns local cache',
      () async {
        // Arrange
        final pageSyncKey = SyncKeys.productListPage(
          type: ProductKind.book,
          page: 1,
          pageSize: 20,
        );
        final collectionSyncKey = SyncKeys.productsCollection(ProductKind.book);
        when(
          () =>
              remote.getProducts(type: ProductKind.book, page: 1, pageSize: 20),
        ).thenAnswer(
          (_) async => const Result.failure(
            failure: Failure.server(message: '500 Internal Server Error'),
          ),
        );
        when(
          () =>
              local.getProducts(type: ProductKind.book, page: 1, pageSize: 20),
        ).thenAnswer((_) async => [_bookBundle(id: 'book-3')]);
        when(() => local.recordSyncFailure(any())).thenAnswer((_) async {});
        when(() => local.setLastSync(any(), any())).thenAnswer((_) async {});

        // Act
        final result = await repository.getProducts(
          type: ProductKind.book,
          locale: 'en',
          forceRefresh: true,
        );

        // Assert
        expect(result, hasLength(1));
        expect(result.first.id, 'book-3');
        verify(() => local.recordSyncFailure(pageSyncKey)).called(1);
        verify(() => local.recordSyncFailure(collectionSyncKey)).called(1);
        verifyNever(() => local.upsertProducts(any()));
      },
    );
  });

  group('CacheFirstProductRepository.getProductById success', () {
    test(
      'forceRefresh updates local cache and returns mapped entity',
      () async {
        // Arrange
        const id = 'book-10';
        when(
          () => remote.getProductById(id: id, type: ProductKind.book),
        ).thenAnswer((_) async => Result.success(data: _bookDto(id: id)));
        when(() => local.upsertProducts(any())).thenAnswer((_) async {});
        when(() => local.setLastSync(any(), any())).thenAnswer((_) async {});
        when(
          () => local.getProductById(id),
        ).thenAnswer((_) async => _bookBundle(id: id));

        // Act
        final result = await repository.getProductById(
          id,
          type: ProductKind.book,
          locale: 'ru',
          forceRefresh: true,
        );

        // Assert
        expect(result, isA<BookEntity>());
        expect(result?.id, id);
        expect(result?.title, 'Чистый код');
        verify(
          () => remote.getProductById(id: id, type: ProductKind.book),
        ).called(1);
        verify(() => local.upsertProducts(any())).called(1);
        verify(
          () => local.setLastSync(SyncKeys.productItem(id), any()),
        ).called(1);
      },
    );
  });

  group('CacheFirstProductRepository.getProductById errors', () {
    test(
      'records sync failure and returns local data when remote fails',
      () async {
        // Arrange
        const id = 'book-11';
        when(
          () => local.getSyncTimestamps(SyncKeys.productItem(id)),
        ).thenAnswer(
          (_) async => (
            lastSyncAt: DateTime.now().subtract(const Duration(days: 2)),
            lastFailureAt: null,
            failureCount: 0,
          ),
        );
        when(
          () => freshnessPolicy.getStatus(any(), now: any(named: 'now')),
        ).thenReturn(FreshnessStatus.stale);
        when(
          () => remote.getProductById(id: id, type: ProductKind.book),
        ).thenAnswer(
          (_) async =>
              const Result.failure(failure: Failure.server(message: '500')),
        );
        when(
          () => local.recordSyncFailure(SyncKeys.productItem(id)),
        ).thenAnswer((_) async {});
        when(
          () => local.getProductById(id),
        ).thenAnswer((_) async => _bookBundle(id: id));

        // Act
        final result = await repository.getProductById(
          id,
          type: ProductKind.book,
          locale: 'en',
        );

        // Assert
        expect(result, isNotNull);
        expect(result?.id, id);
        verify(
          () => local.recordSyncFailure(SyncKeys.productItem(id)),
        ).called(1);
        verifyNever(() => local.upsertProducts(any()));
      },
    );
  });

  group('CacheFirstProductRepository.getProductsByFilters', () {
    test('applies filters, sort and pagination on mapped entities', () async {
      // Arrange
      final allBundles = [
        _bookBundle(
          id: 'book-a',
          tagEn: 'Action',
          categoryEn: 'Adventure',
          ratingAvg: 4.5,
          reviewsCount: 100,
        ),
        _bookBundle(
          id: 'book-b',
          tagEn: 'Action',
          categoryEn: 'Adventure',
          ratingAvg: 4.9,
          reviewsCount: 80,
        ),
        _bookBundle(
          id: 'book-c',
          tagEn: 'Drama',
          categoryEn: 'Drama',
          ratingAvg: 5.0,
          reviewsCount: 10,
        ),
      ];
      when(
        () => local.getSyncTimestamps(
          SyncKeys.productsCollection(ProductKind.book),
        ),
      ).thenAnswer(
        (_) async =>
            (lastSyncAt: DateTime.now(), lastFailureAt: null, failureCount: 0),
      );
      when(
        () => freshnessPolicy.getStatus(any(), now: any(named: 'now')),
      ).thenReturn(FreshnessStatus.fresh);
      when(
        () => local.getAllProducts(type: ProductKind.book),
      ).thenAnswer((_) async => allBundles);

      // Act
      final result = await repository.getProductsByFilters(
        filters: const [
          TagFilter(tag: 'Action'),
          CategoryFilter(genre: 'Adventure'),
        ],
        sort: const TopRated(),
        type: ProductKind.book,
        locale: 'en',
        page: 1,
        pageSize: 1,
      );

      // Assert
      expect(result, hasLength(1));
      expect(result.first.id, 'book-b');
      verifyNever(
        () => remote.getProducts(type: ProductKind.book, page: 1, pageSize: 20),
      );
    });
  });

  group('CacheFirstProductRepository.watchProductsByFilters', () {
    test('maps, filters and paginates stream from local datasource', () async {
      // Arrange
      final bundles = [
        _bookBundle(
          id: 'book-x',
          tagEn: 'Action',
          categoryEn: 'Adventure',
          ratingAvg: 4.7,
          reviewsCount: 110,
        ),
        _bookBundle(
          id: 'book-y',
          tagEn: 'Action',
          categoryEn: 'Adventure',
          ratingAvg: 4.9,
          reviewsCount: 90,
        ),
      ];
      when(
        () => local.watchAllProducts(type: any(named: 'type')),
      ).thenAnswer((_) => Stream.value(bundles));

      // Act
      final stream = repository.watchProductsByFilters(
        filters: const [TagFilter(tag: 'Action')],
        sort: const TopRated(),
        type: ProductKind.book,
        locale: 'en',
        page: 1,
        pageSize: 1,
      );

      // Assert
      await expectLater(
        stream,
        emits(
          predicate<List<dynamic>>(
            (items) => items.length == 1 && items.first.id == 'book-y',
          ),
        ),
      );
    });
  });
}

ProductDto _bookDto({required String id}) => ProductDto.book(
  id: id,
  externalId: 'ext-$id',
  title: const {'en': 'Clean Code', 'ru': 'Чистый код'},
  shortDescription: const {'en': 'Short', 'ru': 'Коротко'},
  description: const {'en': 'Description', 'ru': 'Описание'},
  reviewsCount: 120,
  releaseDate: DateTime.utc(2024, 1, 1),
  iconUrl: 'https://example.com/icon.png',
  isPaid: false,
  url: 'https://example.com/product',
  publisher: const BookPublisherDto(
    id: 'publisher-1',
    name: {'en': 'Publisher', 'ru': 'Издатель'},
    description: {'en': 'Publisher description', 'ru': 'Описание издателя'},
  ),
  categories: const [
    CategoryDto(
      id: 'category-1',
      name: {'en': 'Fiction', 'ru': 'Художественная'},
    ),
  ],
  tags: const [
    TagDto(id: 'tag-1', name: {'en': 'Bestseller', 'ru': 'Бестселлер'}),
  ],
  pageCount: 300,
  language: 'en',
  format: 'epub',
  hasAudioVersion: false,
  isSeries: false,
  sampleAvailable: true,
  isAbridged: false,
  publicationDate: DateTime.utc(2024, 1, 2),
);

LocalProductBundle _bookBundle({
  required String id,
  String tagEn = 'Bestseller',
  String tagRu = 'Бестселлер',
  String categoryEn = 'Fiction',
  String categoryRu = 'Художественная',
  double ratingAvg = 4.9,
  int reviewsCount = 120,
}) => LocalProductBundle(
  product: CachedProductData(
    id: id,
    externalId: 'ext-$id',
    type: 'book',
    title: const {'en': 'Clean Code', 'ru': 'Чистый код'},
    shortDescription: const {'en': 'Short', 'ru': 'Коротко'},
    description: const {'en': 'Description', 'ru': 'Описание'},
    rating: 4.9,
    releaseDate: DateTime.utc(2024, 1, 1),
    iconUrl: 'https://example.com/icon.png',
    isPaid: false,
    currencyCode: 'USD',
    url: 'https://example.com/product',
    ratingAvg: ratingAvg,
    reviewsCount: reviewsCount,
    ratingDistribution: const {'5': 100, '4': 20},
    topReviews: const [],
  ),
  book: CachedBook(
    productId: id,
    publisherId: 'publisher-1',
    pageCount: 300,
    language: 'en',
    format: 'epub',
    hasAudioVersion: false,
    isSeries: false,
    sampleAvailable: true,
    isAbridged: false,
    publicationDate: DateTime.utc(2024, 1, 2),
  ),
  publisher: const Publisher(
    id: 'publisher-1',
    publisher: {'en': 'Publisher', 'ru': 'Издатель'},
    description: {'en': 'Publisher description', 'ru': 'Описание издателя'},
  ),
  translations: const [],
  categories: [
    Category(
      id: 'category-1',
      name: {'en': categoryEn, 'ru': categoryRu},
      type: 'book',
    ),
  ],
  tags: [
    Tag(id: 'tag-1', name: {'en': tagEn, 'ru': tagRu}, type: 'book'),
  ],
);
