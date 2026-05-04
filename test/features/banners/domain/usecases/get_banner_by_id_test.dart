import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';
import 'package:google_play/features/banners/domain/use_cases/get_banner_by_id_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repo_mocks.dart';

void main() {
  late GetBannerByIdUseCase useCase;
  late MockBannersRepository mockRepo;

  setUp(() {
    mockRepo = MockBannersRepository();
    useCase = GetBannerByIdUseCase(mockRepo);
  });

  test('delegates to repository and returns banner', () async {
    const expected = FakeBannerEntity(id: 'banner-3');
    when(
      () => mockRepo.getBannerById(
        'banner-3',
        type: BannerKind.event,
        locale: 'en',
        forceRefresh: false,
      ),
    ).thenAnswer((_) async => expected);

    final result = await useCase(
      id: 'banner-3',
      type: BannerKind.event,
      locale: 'en',
    );

    expect(result, expected);
    verify(
      () => mockRepo.getBannerById(
        'banner-3',
        type: BannerKind.event,
        locale: 'en',
        forceRefresh: false,
      ),
    ).called(1);
  });
}
