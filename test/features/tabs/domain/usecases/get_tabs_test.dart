import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/tabs/domain/entities/tabs_entity.dart';
import 'package:google_play/features/tabs/domain/use_cases/get_tabs_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repo_mocks.dart';

void main() {
  late GetTabsUseCaseImpl useCase;
  late MockTabsRepository mockRepo;

  setUp(() {
    mockRepo = MockTabsRepository();
    useCase = GetTabsUseCaseImpl(mockRepo);
  });

  test('delegates and returns repository tabs', () async {
    const expected = [
      TabsEntity(
        id: 'tab-1',
        contentType: 'apps',
        tabKey: 'for_you',
        label: 'For you',
        tabType: 'main',
        sortOrder: 1,
      ),
    ];
    when(
      () => mockRepo.getTabs(
        productKind: ProductKind.app,
        locale: 'en',
        page: 2,
        pageSize: 10,
        forceRefresh: true,
      ),
    ).thenAnswer((_) async => expected);

    final result = await useCase(
      productKind: ProductKind.app,
      locale: 'en',
      page: 2,
      pageSize: 10,
      forceRefresh: true,
    );

    expect(result, expected);
    verify(
      () => mockRepo.getTabs(
        productKind: ProductKind.app,
        locale: 'en',
        page: 2,
        pageSize: 10,
        forceRefresh: true,
      ),
    ).called(1);
  });
}
