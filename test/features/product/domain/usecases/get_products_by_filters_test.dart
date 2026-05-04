import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/features/product/domain/entities/filters/product_filters.dart';
import 'package:google_play/features/product/domain/entities/filters/product_sort.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/use_cases/get_products_by_filters_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repo_mocks.dart';

void main() {
  late LoadProductsByFiltersUseCaseImpl useCase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    useCase = LoadProductsByFiltersUseCaseImpl(mockRepo);
  });

  group('LoadProductsByFiltersUseCaseImpl success', () {
    test(
      'delegates to repository.getProductsByFilters with same arguments',
      () async {
        // Arrange
        final expectedProducts = [FakeProduct(id: '1', title: 'Filtered')];
        const filters = <ProductFilter>[TagFilter(tag: 'action')];
        const sort = TopRated();
        when(
          () => mockRepo.getProductsByFilters(
            filters: filters,
            sort: sort,
            type: ProductKind.game,
            locale: 'en',
            page: 2,
            pageSize: 10,
            forceRefresh: true,
          ),
        ).thenAnswer((_) async => expectedProducts);

        // Act
        final result = await useCase(
          filters: filters,
          sort: sort,
          type: ProductKind.game,
          locale: 'en',
          page: 2,
          pageSize: 10,
          forceRefresh: true,
        );

        // Assert
        expect(result, expectedProducts);
        verify(
          () => mockRepo.getProductsByFilters(
            filters: filters,
            sort: sort,
            type: ProductKind.game,
            locale: 'en',
            page: 2,
            pageSize: 10,
            forceRefresh: true,
          ),
        ).called(1);
      },
    );
  });

  group('LoadProductsByFiltersUseCaseImpl errors', () {
    test('propagates repository failures to caller', () async {
      // Arrange
      final failure = ParsingFailure(message: 'Invalid payload');
      const filters = <ProductFilter>[CategoryFilter(genre: 'arcade')];
      when(
        () => mockRepo.getProductsByFilters(
          filters: filters,
          sort: null,
          type: ProductKind.game,
          locale: 'en',
          page: 1,
          pageSize: 20,
          forceRefresh: false,
        ),
      ).thenThrow(failure);

      // Act
      Future<List<ProductEntity>> action() =>
          useCase(filters: filters, type: ProductKind.game, locale: 'en');

      // Assert
      expect(action, throwsA(isA<ParsingFailure>()));
      verify(
        () => mockRepo.getProductsByFilters(
          filters: filters,
          sort: null,
          type: ProductKind.game,
          locale: 'en',
          page: 1,
          pageSize: 20,
          forceRefresh: false,
        ),
      ).called(1);
    });
  });
}
