import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/product/domain/use_cases/watch_products_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repo_mocks.dart';

void main() {
  late WatchProductsUseCaseImpl useCase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    useCase = WatchProductsUseCaseImpl(mockRepo);
  });

  group('WatchProductsUseCaseImpl success', () {
    test(
      'delegates to repository.watchProducts and returns same stream data',
      () async {
        // Arrange
        final expectedProducts = [FakeProduct(id: '1', title: 'Product')];
        when(
          () => mockRepo.watchProducts(
            type: ProductKind.app,
            locale: 'en',
            page: 1,
            pageSize: 20,
          ),
        ).thenAnswer((_) => Stream.value(expectedProducts));

        // Act
        final stream = useCase(type: ProductKind.app, locale: 'en');

        // Assert
        await expectLater(stream, emitsInOrder([expectedProducts, emitsDone]));
        verify(
          () => mockRepo.watchProducts(
            type: ProductKind.app,
            locale: 'en',
            page: 1,
            pageSize: 20,
          ),
        ).called(1);
      },
    );
  });

  group('WatchProductsUseCaseImpl errors', () {
    test('propagates repository stream errors', () async {
      // Arrange
      final expectedError = Exception('stream error');
      when(
        () => mockRepo.watchProducts(
          type: ProductKind.app,
          locale: 'en',
          page: 1,
          pageSize: 20,
        ),
      ).thenAnswer((_) => Stream<List<FakeProduct>>.error(expectedError));

      // Act
      final stream = useCase(type: ProductKind.app, locale: 'en');

      // Assert
      await expectLater(stream, emitsError(expectedError));
      verify(
        () => mockRepo.watchProducts(
          type: ProductKind.app,
          locale: 'en',
          page: 1,
          pageSize: 20,
        ),
      ).called(1);
    });
  });
}
