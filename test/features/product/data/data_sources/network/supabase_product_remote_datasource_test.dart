import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/data/network/sort_orders.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/product/data/data_sources/network/products_network_views_names_enum.dart';
import 'package:google_play/features/product/data/data_sources/network/supabase_product_network_datasource.dart';
import 'package:google_play/features/product/data/data_sources/network/supabase_product_remote_datasource.dart';
import 'package:google_play/features/product/data/models/network/product_dto.dart';
import 'package:mocktail/mocktail.dart';

class MockProductNetworkDataSource extends Mock
    implements SupabaseProductNetworkDataSource {}

void main() {
  late MockProductNetworkDataSource network;
  late SupabaseProductRemoteDataSource datasource;

  setUp(() {
    network = MockProductNetworkDataSource();
    datasource = SupabaseProductRemoteDataSource(datasource: network);
  });

  group('SupabaseProductRemoteDataSource.getProducts', () {
    test(
      'delegates to network datasource with mapped view and sort order',
      () async {
        // Arrange
        when(
          () => network.getProducts(
            view: NetworkProductsViewsNames.books,
            schemaName: SchemaNamesEnum.views,
            order: SortOrders.releaseDateDesc,
            page: 2,
            pageSize: 15,
          ),
        ).thenAnswer((_) async => const Result.success(data: <ProductDto>[]));

        // Act
        final result = await datasource.getProducts(
          type: ProductKind.book,
          page: 2,
          pageSize: 15,
        );

        // Assert
        expect(result, isA<SuccessResult<List<ProductDto>>>());
        verify(
          () => network.getProducts(
            view: NetworkProductsViewsNames.books,
            schemaName: SchemaNamesEnum.views,
            order: SortOrders.releaseDateDesc,
            page: 2,
            pageSize: 15,
          ),
        ).called(1);
      },
    );
  });

  group('SupabaseProductRemoteDataSource.getProductById', () {
    test('delegates to network datasource with mapped view', () async {
      // Arrange
      when(
        () => network.getProductById(
          view: NetworkProductsViewsNames.apps,
          schemaName: SchemaNamesEnum.views,
          id: 'app-1',
        ),
      ).thenAnswer((_) async => const Result.success(data: null));

      // Act
      final result = await datasource.getProductById(
        id: 'app-1',
        type: ProductKind.app,
      );

      // Assert
      expect(result, isA<SuccessResult<ProductDto?>>());
      verify(
        () => network.getProductById(
          view: NetworkProductsViewsNames.apps,
          schemaName: SchemaNamesEnum.views,
          id: 'app-1',
        ),
      ).called(1);
    });
  });

  group('SupabaseProductRemoteDataSource.getRecommendedProducts', () {
    test('forwards recommendation request as-is', () async {
      // Arrange
      when(
        () => network.getRecommendedProducts(
          type: ProductKind.game,
          limit: 10,
          excludeRecentDays: 7,
          seed: '42',
        ),
      ).thenAnswer((_) async => const Result.success(data: ['g1', 'g2']));

      // Act
      final result = await datasource.getRecommendedProducts(
        type: ProductKind.game,
        limit: 10,
        excludeRecentDays: 7,
        seed: '42',
      );

      // Assert
      result.when(
        success: (ids) => expect(ids, ['g1', 'g2']),
        failure: (_) => fail('Expected SuccessResult, but got FailureResult'),
      );
      verify(
        () => network.getRecommendedProducts(
          type: ProductKind.game,
          limit: 10,
          excludeRecentDays: 7,
          seed: '42',
        ),
      ).called(1);
    });

    test('returns failure from network datasource unchanged', () async {
      // Arrange
      const expectedFailure = Failure.server(message: '500');
      when(
        () => network.getRecommendedProducts(
          type: ProductKind.game,
          limit: 20,
          excludeRecentDays: 30,
          seed: null,
        ),
      ).thenAnswer((_) async => const Result.failure(failure: expectedFailure));

      // Act
      final result = await datasource.getRecommendedProducts(
        type: ProductKind.game,
      );

      // Assert
      result.when(
        success: (_) => fail('Expected FailureResult, but got SuccessResult'),
        failure: (failure) {
          expect(failure, isA<ServerFailure>());
          expect((failure as ServerFailure).message, '500');
        },
      );
    });
  });
}
