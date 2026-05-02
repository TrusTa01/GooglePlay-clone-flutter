import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';
import 'package:google_play/features/banners/domain/use_cases/watch_banners_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repo_mocks.dart';

void main() {
  late WatchBannersUseCase useCase;
  late MockBannersRepository mockRepo;

  setUp(() {
    mockRepo = MockBannersRepository();
    useCase = WatchBannersUseCase(mockRepo);
  });

  test('delegates stream from repository', () async {
    final expected = [const FakeBannerEntity(id: 'banner-2')];
    when(
      () => mockRepo.watchBanners(
        type: BannerKind.event,
        locale: 'ru',
        page: 1,
        pageSize: 20,
      ),
    ).thenAnswer((_) => Stream.value(expected));

    final stream = useCase(type: BannerKind.event, locale: 'ru');

    await expectLater(stream, emitsInOrder([expected, emitsDone]));
    verify(
      () => mockRepo.watchBanners(
        type: BannerKind.event,
        locale: 'ru',
        page: 1,
        pageSize: 20,
      ),
    ).called(1);
  });
}
