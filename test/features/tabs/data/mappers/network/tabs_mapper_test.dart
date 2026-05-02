import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/features/tabs/data/mappers/network/tabs_mapper.dart';
import 'package:google_play/features/tabs/data/models/network/tabs_dto.dart';

void main() {
  test('maps TabsDto to TabsEntity with locale value', () {
    const dto = TabsDto(
      id: 'tab-1',
      contentType: 'apps',
      tabKey: 'for_you',
      label: {'en': 'For you', 'ru': 'Для вас'},
      tabType: 'main',
      sortOrder: 1,
    );

    final entity = dto.toEntity('ru');

    expect(entity.id, 'tab-1');
    expect(entity.contentType, 'apps');
    expect(entity.tabKey, 'for_you');
    expect(entity.label, 'Для вас');
    expect(entity.tabType, 'main');
    expect(entity.sortOrder, 1);
  });

  test('falls back to english when locale key is absent', () {
    const dto = TabsDto(
      id: 'tab-2',
      contentType: 'games',
      tabKey: 'games',
      label: {'en': 'Games'},
      tabType: 'main',
      sortOrder: 2,
    );

    final entity = dto.toEntity('ru');

    expect(entity.label, 'Games');
  });
}
