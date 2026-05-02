import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/use_cases/get_similar_products_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repo_mocks.dart';

void main() {
  late GetSimilarProductsUseCaseImpl useCase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    useCase = GetSimilarProductsUseCaseImpl(mockRepo);
  });

  group('GetSimilarProductsUseCaseImpl success', () {
    test(
      'delegates to repository.getSimilarProducts with same arguments',
      () async {
        // Arrange
        final sourceProduct = FakeProduct(id: 'source', title: 'Source');
        final expectedProducts = [FakeProduct(id: 'sim-1', title: 'Similar')];
        when(
          () => mockRepo.getSimilarProducts(
            product: sourceProduct,
            type: ProductKind.book,
            locale: 'en',
            page: 2,
            pageSize: 10,
            forceRefresh: true,
          ),
        ).thenAnswer((_) async => expectedProducts);

        // Act
        final result = await useCase(
          product: sourceProduct,
          type: ProductKind.book,
          locale: 'en',
          page: 2,
          pageSize: 10,
          forceRefresh: true,
        );

        // Assert
        expect(result, expectedProducts);
        verify(
          () => mockRepo.getSimilarProducts(
            product: sourceProduct,
            type: ProductKind.book,
            locale: 'en',
            page: 2,
            pageSize: 10,
            forceRefresh: true,
          ),
        ).called(1);
      },
    );
  });

  group('GetSimilarProductsUseCaseImpl errors', () {
    test('propagates repository failures to caller', () async {
      // Arrange
      final sourceProduct = FakeProduct(id: 'source', title: 'Source');
      final failure = NetworkFailure(message: 'offline');
      when(
        () => mockRepo.getSimilarProducts(
          product: sourceProduct,
          type: ProductKind.book,
          locale: 'en',
          page: 1,
          pageSize: 20,
          forceRefresh: false,
        ),
      ).thenThrow(failure);

      // Act
      Future<List<ProductEntity>> action() =>
          useCase(product: sourceProduct, type: ProductKind.book, locale: 'en');

      // Assert
      expect(action, throwsA(isA<NetworkFailure>()));
      verify(
        () => mockRepo.getSimilarProducts(
          product: sourceProduct,
          type: ProductKind.book,
          locale: 'en',
          page: 1,
          pageSize: 20,
          forceRefresh: false,
        ),
      ).called(1);
    });
  });
}
