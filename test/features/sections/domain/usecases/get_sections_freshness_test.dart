import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_status_enum.dart';
import 'package:google_play/features/sections/domain/use_cases/get_sections_freshness_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repo_mocks.dart';

void main() {
  late GetSectionsFreshnessUseCaseImpl useCase;
  late MockSectionsRepository mockRepo;

  setUp(() {
    mockRepo = MockSectionsRepository();
    useCase = GetSectionsFreshnessUseCaseImpl(mockRepo);
  });

  test('delegates to repository', () async {
    const expected = DataFreshness(status: FreshnessStatus.fresh);
    when(
      () => mockRepo.getSectionsFreshness(
        productKind: ProductKind.book,
        tabKey: 'books',
      ),
    ).thenAnswer((_) async => expected);

    final result = await useCase(
      productKind: ProductKind.book,
      tabKey: 'books',
    );

    expect(result, expected);
    verify(
      () => mockRepo.getSectionsFreshness(
        productKind: ProductKind.book,
        tabKey: 'books',
      ),
    ).called(1);
  });
}
