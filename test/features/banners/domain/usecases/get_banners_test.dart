import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';
import 'package:google_play/features/banners/domain/use_cases/get_banners_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repo_mocks.dart';

void main() {
  late GetBannersUseCase useCase;
  late MockBannersRepository mockRepo;

  setUp(() {
    mockRepo = MockBannersRepository();
    useCase = GetBannersUseCase(mockRepo);
  });

  test('delegates to repository and returns banners', () async {
    final expected = [const FakeBannerEntity(id: 'banner-1')];
    when(
      () => mockRepo.getBanners(
        type: BannerKind.action,
        locale: 'en',
        page: 2,
        pageSize: 5,
        forceRefresh: true,
      ),
    ).thenAnswer((_) async => expected);

    final result = await useCase(
      type: BannerKind.action,
      locale: 'en',
      page: 2,
      pageSize: 5,
      forceRefresh: true,
    );

    expect(result, expected);
    verify(
      () => mockRepo.getBanners(
        type: BannerKind.action,
        locale: 'en',
        page: 2,
        pageSize: 5,
        forceRefresh: true,
      ),
    ).called(1);
  });
}
