import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_status_enum.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/features/product/domain/use_cases/get_product_freshness_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repo_mocks.dart';

void main() {
  late GetProductFreshnessUseCaseImpl useCase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    useCase = GetProductFreshnessUseCaseImpl(mockRepo);
  });

  group('GetProductFreshnessUseCaseImpl success', () {
    test('delegates to repository.getProductFreshness', () async {
      // Arrange
      final expectedFreshness = DataFreshness(
        status: FreshnessStatus.fresh,
        lastSuccessAt: DateTime.utc(2026, 1, 1),
      );
      when(
        () => mockRepo.getProductFreshness('book-1'),
      ).thenAnswer((_) async => expectedFreshness);

      // Act
      final result = await useCase(id: 'book-1');

      // Assert
      expect(result, expectedFreshness);
      verify(() => mockRepo.getProductFreshness('book-1')).called(1);
    });
  });

  group('GetProductFreshnessUseCaseImpl errors', () {
    test('propagates repository failures to caller', () async {
      // Arrange
      final failure = UnknownFailure(
        error: Exception('freshness not available'),
      );
      when(() => mockRepo.getProductFreshness('book-1')).thenThrow(failure);

      // Act
      Future<DataFreshness> action() => useCase(id: 'book-1');

      // Assert
      expect(action, throwsA(isA<UnknownFailure>()));
      verify(() => mockRepo.getProductFreshness('book-1')).called(1);
    });
  });
}
