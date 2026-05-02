import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_status_enum.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';
import 'package:google_play/features/banners/domain/use_cases/get_banners_freshness_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repo_mocks.dart';

void main() {
  late GetBannersFreshnessUseCase useCase;
  late MockBannersRepository mockRepo;

  setUp(() {
    mockRepo = MockBannersRepository();
    useCase = GetBannersFreshnessUseCase(mockRepo);
  });

  test('delegates and returns freshness', () async {
    const expected = DataFreshness(status: FreshnessStatus.fresh);
    when(
      () => mockRepo.getBannersFreshness(type: BannerKind.action),
    ).thenAnswer((_) async => expected);

    final result = await useCase(type: BannerKind.action);

    expect(result, expected);
    verify(
      () => mockRepo.getBannersFreshness(type: BannerKind.action),
    ).called(1);
  });
}
