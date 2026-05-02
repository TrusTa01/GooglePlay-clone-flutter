import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/tabs/data/mappers/local/cached_tabs_mapper.dart';

void main() {
  test('maps CachedTab to TabsEntity', () {
    final cached = const CachedTab(
      id: 'tab-1',
      contentType: 'apps',
      tabKey: 'for_you',
      label: {'en': 'For you', 'ru': 'Для вас'},
      tabType: 'main',
      sortOrder: 1,
    );

    final entity = cached.toEntity('ru');

    expect(entity.id, 'tab-1');
    expect(entity.contentType, 'apps');
    expect(entity.tabKey, 'for_you');
    expect(entity.label, 'Для вас');
    expect(entity.tabType, 'main');
    expect(entity.sortOrder, 1);
  });
}
