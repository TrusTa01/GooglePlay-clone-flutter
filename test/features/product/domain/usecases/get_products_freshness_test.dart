import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_status_enum.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/features/product/domain/use_cases/get_products_freshness_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repo_mocks.dart';

void main() {
  late GetProductsFreshnessUseCaseImpl useCase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    useCase = GetProductsFreshnessUseCaseImpl(mockRepo);
  });

  group('GetProductsFreshnessUseCaseImpl success', () {
    test('delegates to repository.getProductsFreshness', () async {
      // Arrange
      final expectedFreshness = DataFreshness(
        status: FreshnessStatus.stale,
        lastSuccessAt: DateTime.utc(2024, 1, 1),
        failureCount: 0,
      );
      when(
        () => mockRepo.getProductsFreshness(type: ProductKind.game),
      ).thenAnswer((_) async => expectedFreshness);

      // Act
      final result = await useCase(type: ProductKind.game);

      // Assert
      expect(result, expectedFreshness);
      verify(
        () => mockRepo.getProductsFreshness(type: ProductKind.game),
      ).called(1);
    });
  });

  group('GetProductsFreshnessUseCaseImpl errors', () {
    test('propagates repository failures to caller', () async {
      // Arrange
      final failure = UnknownFailure(error: Exception('freshness failed'));
      when(
        () => mockRepo.getProductsFreshness(type: ProductKind.game),
      ).thenThrow(failure);

      // Act
      Future<DataFreshness> action() => useCase(type: ProductKind.game);

      // Assert
      expect(action, throwsA(isA<UnknownFailure>()));
      verify(
        () => mockRepo.getProductsFreshness(type: ProductKind.game),
      ).called(1);
    });
  });
}
