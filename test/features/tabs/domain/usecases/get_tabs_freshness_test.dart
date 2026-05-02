import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_status_enum.dart';
import 'package:google_play/features/tabs/domain/use_cases/get_tabs_freshness_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repo_mocks.dart';

void main() {
  late GetTabsFreshnessUseCaseImpl useCase;
  late MockTabsRepository mockRepo;

  setUp(() {
    mockRepo = MockTabsRepository();
    useCase = GetTabsFreshnessUseCaseImpl(mockRepo);
  });

  test('delegates and returns freshness', () async {
    const expected = DataFreshness(status: FreshnessStatus.stale);
    when(
      () => mockRepo.getTabsFreshness(productKind: ProductKind.book),
    ).thenAnswer((_) async => expected);

    final result = await useCase(productKind: ProductKind.book);

    expect(result, expected);
    verify(
      () => mockRepo.getTabsFreshness(productKind: ProductKind.book),
    ).called(1);
  });
}
