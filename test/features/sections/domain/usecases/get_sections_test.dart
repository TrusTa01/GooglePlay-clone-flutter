import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/sections/domain/entities/section_data_source.dart';
import 'package:google_play/features/sections/domain/entities/section_layout_kind_enum.dart';
import 'package:google_play/features/sections/domain/entities/sections_entity.dart';
import 'package:google_play/features/sections/domain/use_cases/get_sections_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repo_mocks.dart';

void main() {
  late GetSectionsUseCaseImpl useCase;
  late MockSectionsRepository mockRepo;

  setUp(() {
    mockRepo = MockSectionsRepository();
    useCase = GetSectionsUseCaseImpl(mockRepo);
  });

  test('delegates to repository', () async {
    final expected = [
      const SectionEntity(
        id: 'section-1',
        tabKey: 'for_you',
        sectionType: SectionLayoutKind.grid,
        sortOrder: 1,
        contentType: 'apps',
        dataSource: ProductListSource(),
      ),
    ];
    when(
      () => mockRepo.getSections(
        productKind: ProductKind.app,
        tabId: 'for_you',
        locale: 'en',
        forceRefresh: false,
      ),
    ).thenAnswer((_) async => expected);

    final result = await useCase(
      productKind: ProductKind.app,
      tabId: 'for_you',
      locale: 'en',
    );

    expect(result, expected);
    verify(
      () => mockRepo.getSections(
        productKind: ProductKind.app,
        tabId: 'for_you',
        locale: 'en',
        forceRefresh: false,
      ),
    ).called(1);
  });
}
