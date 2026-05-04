import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_status_enum.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';
import 'package:google_play/features/banners/domain/use_cases/get_banner_freshness_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repo_mocks.dart';

void main() {
  late GetBannerFreshnessUseCase useCase;
  late MockBannersRepository mockRepo;

  setUp(() {
    mockRepo = MockBannersRepository();
    useCase = GetBannerFreshnessUseCase(mockRepo);
  });

  test('delegates and returns freshness', () async {
    const expected = DataFreshness(status: FreshnessStatus.stale);
    when(
      () => mockRepo.getBannerFreshness('banner-5', BannerKind.event),
    ).thenAnswer((_) async => expected);

    final result = await useCase(id: 'banner-5', type: BannerKind.event);

    expect(result, expected);
    verify(
      () => mockRepo.getBannerFreshness('banner-5', BannerKind.event),
    ).called(1);
  });
}
