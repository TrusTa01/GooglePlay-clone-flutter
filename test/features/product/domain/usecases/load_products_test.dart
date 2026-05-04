import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/use_cases/load_products_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repo_mocks.dart';

void main() {
  late LoadProductsUseCaseImpl useCase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    useCase = LoadProductsUseCaseImpl(mockRepo);
  });

  group('LoadProductsUseCaseImpl success', () {
    test(
      'delegates to repository.getProducts with the same arguments',
      () async {
        // Arrange
        final tProducts = [FakeProduct(id: '1', title: 'p1')];
        const type = ProductKind.book;
        const locale = 'en';

        when(
          () => mockRepo.getProducts(
            type: type,
            locale: locale,
            page: 1,
            pageSize: 20,
            forceRefresh: false,
          ),
        ).thenAnswer((_) async => tProducts);

        // Act
        final result = await useCase(type: type, locale: locale);

        // Assert
        expect(result, tProducts);

        verify(
          () => mockRepo.getProducts(
            type: type,
            locale: locale,
            page: 1,
            pageSize: 20,
            forceRefresh: false,
          ),
        ).called(1);
      },
    );

    test('forwards page, pageSize and forceRefresh to repository', () async {
      // Arrange
      final tProducts = [FakeProduct(id: '2', title: 'p2')];
      const type = ProductKind.app;
      const locale = 'ru';

      when(
        () => mockRepo.getProducts(
          type: type,
          locale: locale,
          page: 3,
          pageSize: 10,
          forceRefresh: true,
        ),
      ).thenAnswer((_) async => tProducts);

      // Act
      final result = await useCase(
        type: type,
        locale: locale,
        page: 3,
        pageSize: 10,
        forceRefresh: true,
      );

      // Assert
      expect(result, tProducts);
      verify(
        () => mockRepo.getProducts(
          type: type,
          locale: locale,
          page: 3,
          pageSize: 10,
          forceRefresh: true,
        ),
      ).called(1);
    });
  });

  group('LoadProductsUseCaseImpl errors', () {
    test('propagates repository failures to caller', () async {
      // Arrange
      const type = ProductKind.app;
      const locale = 'en';
      final failure = NetworkFailure(message: 'No internet');

      when(
        () => mockRepo.getProducts(
          type: type,
          locale: locale,
          page: 1,
          pageSize: 20,
          forceRefresh: false,
        ),
      ).thenThrow(failure);

      // Act
      Future<List<ProductEntity>> action() =>
          useCase(type: type, locale: locale);

      // Assert
      expect(action, throwsA(isA<NetworkFailure>()));
      verify(
        () => mockRepo.getProducts(
          type: type,
          locale: locale,
          page: 1,
          pageSize: 20,
          forceRefresh: false,
        ),
      ).called(1);
    });
  });
}
