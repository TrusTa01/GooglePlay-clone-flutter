import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/use_cases/get_product_by_id_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repo_mocks.dart';

void main() {
  late GetProductByIdUseCaseImpl useCase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    useCase = GetProductByIdUseCaseImpl(mockRepo);
  });

  group('GetProductByIdUseCaseImpl success', () {
    test(
      'delegates to repository.getProductById with same arguments',
      () async {
        // Arrange
        final tProduct = FakeProduct(id: '1', title: 'p');
        const type = ProductKind.game;
        const locale = 'en';

        when(
          () => mockRepo.getProductById('1', type: type, locale: locale),
        ).thenAnswer((_) async => tProduct);

        // Act
        final result = await useCase(id: '1', type: type, locale: locale);

        // Assert
        expect(result, tProduct);

        verify(
          () => mockRepo.getProductById('1', type: type, locale: locale),
        ).called(1);
      },
    );
  });

  group('GetProductByIdUseCaseImpl errors', () {
    test('propagates repository failures to caller', () async {
      // Arrange
      const type = ProductKind.game;
      const locale = 'en';
      final failure = ServerFailure(message: '500');

      when(
        () => mockRepo.getProductById('1', type: type, locale: locale),
      ).thenThrow(failure);

      // Act
      Future<ProductEntity?> action() =>
          useCase(id: '1', type: type, locale: locale);

      // Assert
      expect(action, throwsA(isA<ServerFailure>()));
      verify(
        () => mockRepo.getProductById('1', type: type, locale: locale),
      ).called(1);
    });
  });
}
