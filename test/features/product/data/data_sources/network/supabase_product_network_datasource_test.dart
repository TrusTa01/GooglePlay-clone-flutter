import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/core/data/network/supabase_query_executor.dart';
import 'package:google_play/features/product/data/data_sources/network/products_network_views_names_enum.dart';
import 'package:google_play/features/product/data/data_sources/network/products_recommendation_rpc.dart';
import 'package:google_play/features/product/data/data_sources/network/supabase_product_network_datasource.dart';
import 'package:google_play/features/product/data/models/network/product_dto.dart';
import 'package:mocktail/mocktail.dart';

class MockQueryExecutor extends Mock implements IQueryExecutor {}

void main() {
  late MockQueryExecutor executor;
  late SupabaseProductNetworkDataSource datasource;

  setUp(() {
    executor = MockQueryExecutor();
    datasource = SupabaseProductNetworkDataSource(executor: executor);
  });

  group('SupabaseProductNetworkDataSource.getProducts success', () {
    test('maps raw json list to ProductDto list', () async {
      // Arrange
      final rawRows = [_bookJson(id: 'book-1', titleEn: 'Clean Code')];
      when(
        () => executor.getList(
          view: NetworkProductsViewsNames.books.name,
          schemaName: SchemaNamesEnum.views,
          order: (column: 'release_date', ascending: false),
          page: 1,
          pageSize: 20,
        ),
      ).thenAnswer((_) async => Result.success(data: rawRows));

      // Act
      final result = await datasource.getProducts(
        view: NetworkProductsViewsNames.books,
        order: (column: 'release_date', ascending: false),
        page: 1,
        pageSize: 20,
      );

      // Assert
      expect(result, isA<SuccessResult<List<ProductDto>>>());
      result.when(
        success: (data) {
          expect(data, hasLength(1));
          expect(data.first.id, 'book-1');
          expect(data.first.title['en'], 'Clean Code');
          expect(data.first.type, 'book');
        },
        failure: (_) => fail('Expected SuccessResult, but got FailureResult'),
      );
    });

    test(
      'returns success with empty list when backend returns empty list',
      () async {
        // Arrange
        when(
          () => executor.getList(
            view: NetworkProductsViewsNames.books.name,
            schemaName: SchemaNamesEnum.views,
            order: (column: 'release_date', ascending: false),
            page: 1,
            pageSize: 20,
          ),
        ).thenAnswer(
          (_) async => const Result.success(data: <Map<String, dynamic>>[]),
        );

        // Act
        final result = await datasource.getProducts(
          view: NetworkProductsViewsNames.books,
          order: (column: 'release_date', ascending: false),
          page: 1,
        );

        // Assert
        expect(result, isA<SuccessResult<List<ProductDto>>>());
        result.when(
          success: (data) => expect(data, isEmpty),
          failure: (_) => fail('Expected SuccessResult, but got FailureResult'),
        );
      },
    );
  });

  group('SupabaseProductNetworkDataSource.getProducts errors', () {
    test('returns ServerFailure for backend 400 errors', () async {
      // Arrange
      const failure = Failure.server(message: '400 Bad Request');
      when(
        () => executor.getList(
          view: NetworkProductsViewsNames.books.name,
          schemaName: SchemaNamesEnum.views,
          order: (column: 'release_date', ascending: false),
          page: 1,
          pageSize: 20,
        ),
      ).thenAnswer((_) async => Result.failure(failure: failure));

      // Act
      final result = await datasource.getProducts(
        view: NetworkProductsViewsNames.books,
        order: (column: 'release_date', ascending: false),
        page: 1,
      );

      // Assert
      expect(result, isA<FailureResult<List<ProductDto>>>());
      result.when(
        success: (_) => fail('Expected FailureResult, but got SuccessResult'),
        failure: (actualFailure) => expect(actualFailure, isA<ServerFailure>()),
      );
    });

    test('returns ServerFailure for backend 500 errors', () async {
      // Arrange
      const failure = Failure.server(message: '500 Internal Server Error');
      when(
        () => executor.getList(
          view: NetworkProductsViewsNames.books.name,
          schemaName: SchemaNamesEnum.views,
          order: (column: 'release_date', ascending: false),
          page: 1,
          pageSize: 20,
        ),
      ).thenAnswer((_) async => Result.failure(failure: failure));

      // Act
      final result = await datasource.getProducts(
        view: NetworkProductsViewsNames.books,
        order: (column: 'release_date', ascending: false),
        page: 1,
      );

      // Assert
      result.when(
        success: (_) => fail('Expected FailureResult, but got SuccessResult'),
        failure: (actualFailure) {
          expect(actualFailure, isA<ServerFailure>());
          expect((actualFailure as ServerFailure).message, contains('500'));
        },
      );
    });

    test('returns ParsingFailure when json is malformed', () async {
      // Arrange
      final malformedRows = <Map<String, dynamic>>[
        {
          'type': 'book',
          'title': {'en': 'Broken'},
        },
      ];
      when(
        () => executor.getList(
          view: NetworkProductsViewsNames.books.name,
          schemaName: SchemaNamesEnum.views,
          order: (column: 'release_date', ascending: false),
          page: 1,
          pageSize: 20,
        ),
      ).thenAnswer((_) async => Result.success(data: malformedRows));

      // Act
      final result = await datasource.getProducts(
        view: NetworkProductsViewsNames.books,
        order: (column: 'release_date', ascending: false),
        page: 1,
      );

      // Assert
      expect(result, isA<FailureResult<List<ProductDto>>>());
      result.when(
        success: (_) => fail('Expected FailureResult, but got SuccessResult'),
        failure: (failure) => expect(failure, isA<ParsingFailure>()),
      );
    });
  });

  group('SupabaseProductNetworkDataSource.getRecommendedProducts', () {
    test('maps rpc rows to product id list', () async {
      // Arrange
      when(
        () => executor.rpcList(
          fn: ProductsRecommendationRpc.functionName,
          params: const {
            ProductsRecommendationRpc.productKindParam: 'book',
            ProductsRecommendationRpc.limitParam: 20,
            ProductsRecommendationRpc.excludeRecentDaysParam: 30,
          },
        ),
      ).thenAnswer(
        (_) async => Result.success(
          data: const [
            {'product_id': 'book-1'},
            {'product_id': 42},
          ],
        ),
      );

      // Act
      final result = await datasource.getRecommendedProducts(
        type: ProductKind.book,
      );

      // Assert
      result.when(
        success: (ids) => expect(ids, ['book-1', '42']),
        failure: (_) => fail('Expected SuccessResult, but got FailureResult'),
      );
    });
  });
}

Map<String, dynamic> _bookJson({required String id, required String titleEn}) =>
    {
      'type': 'book',
      'id': id,
      'external_id': 'ext-$id',
      'title': {'en': titleEn, 'ru': 'Книга'},
      'short_description': {'en': 'Short', 'ru': 'Коротко'},
      'description': {'en': 'Description', 'ru': 'Описание'},
      'reviews_count': 100,
      'rating_avg': 4.8,
      'rating_distribution': {'5': 90, '4': 10},
      'top_reviews': const [
        {'author': 'Ann', 'text': 'Great'},
      ],
      'release_date': '2024-01-01T00:00:00.000Z',
      'icon_url': 'https://example.com/icon.png',
      'is_paid': false,
      'price': null,
      'currency_code': 'USD',
      'discount_price': null,
      'url': 'https://example.com/product',
      'publisher': {
        'id': 'publisher-1',
        'name': {'en': 'Publisher', 'ru': 'Издатель'},
        'description': {'en': 'Pub desc', 'ru': 'Описание издателя'},
      },
      'categories': const [
        {
          'id': 'category-1',
          'name': {'en': 'Fiction', 'ru': 'Художественная'},
        },
      ],
      'tags': const [
        {
          'id': 'tag-1',
          'name': {'en': 'Bestseller', 'ru': 'Бестселлер'},
        },
      ],
      'page_count': 280,
      'language': 'en',
      'format': 'epub',
      'has_audio_version': false,
      'audio_duration': null,
      'narrator': null,
      'is_series': false,
      'series_name': null,
      'series_number': null,
      'sample_available': true,
      'is_abridged': false,
      'publication_date': '2024-01-02T00:00:00.000Z',
      'awards': const ['Award A'],
    };
