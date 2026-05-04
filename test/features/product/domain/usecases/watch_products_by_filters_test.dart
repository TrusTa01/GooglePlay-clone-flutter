import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/product/domain/entities/filters/product_filters.dart';
import 'package:google_play/features/product/domain/entities/filters/product_sort.dart';
import 'package:google_play/features/product/domain/use_cases/watch_products_by_filters_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repo_mocks.dart';

void main() {
  late WatchProductsByFiltersUseCaseImpl useCase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    useCase = WatchProductsByFiltersUseCaseImpl(mockRepo);
  });

  group('WatchProductsByFiltersUseCaseImpl success', () {
    test(
      'delegates to repository.watchProductsByFilters and emits same data',
      () async {
        // Arrange
        final expectedProducts = [
          FakeProduct(id: '1', title: 'Filtered stream'),
        ];
        const filters = <ProductFilter>[TagFilter(tag: 'action')];
        const sort = TopRated();
        when(
          () => mockRepo.watchProductsByFilters(
            filters: filters,
            sort: sort,
            type: ProductKind.game,
            locale: 'en',
            page: 1,
            pageSize: 20,
          ),
        ).thenAnswer((_) => Stream.value(expectedProducts));

        // Act
        final stream = useCase(
          filters: filters,
          sort: sort,
          type: ProductKind.game,
          locale: 'en',
        );

        // Assert
        await expectLater(stream, emitsInOrder([expectedProducts, emitsDone]));
        verify(
          () => mockRepo.watchProductsByFilters(
            filters: filters,
            sort: sort,
            type: ProductKind.game,
            locale: 'en',
            page: 1,
            pageSize: 20,
          ),
        ).called(1);
      },
    );
  });

  group('WatchProductsByFiltersUseCaseImpl errors', () {
    test('propagates repository stream errors', () async {
      // Arrange
      final expectedError = Exception('stream filter error');
      const filters = <ProductFilter>[CategoryFilter(genre: 'arcade')];
      when(
        () => mockRepo.watchProductsByFilters(
          filters: filters,
          sort: null,
          type: ProductKind.game,
          locale: 'en',
          page: 1,
          pageSize: 20,
        ),
      ).thenAnswer((_) => Stream<List<FakeProduct>>.error(expectedError));

      // Act
      final stream = useCase(
        filters: filters,
        type: ProductKind.game,
        locale: 'en',
      );

      // Assert
      await expectLater(stream, emitsError(expectedError));
      verify(
        () => mockRepo.watchProductsByFilters(
          filters: filters,
          sort: null,
          type: ProductKind.game,
          locale: 'en',
          page: 1,
          pageSize: 20,
        ),
      ).called(1);
    });
  });
}
