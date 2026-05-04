import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/tabs/domain/entities/tabs_entity.dart';

extension CachedTabsMapper on CachedTab {
  TabsEntity toEntity(String locale) {
    final entity = TabsEntity(
      id: id,
      contentType: contentType,
      tabKey: tabKey,
      label: label.display(locale),
      tabType: tabType,
      sortOrder: sortOrder,
    );
    FeatureTalker.mapperOut(
      'tabs.cached_tabs_mapper',
      'CachedTab -> TabsEntity',
      context: {'id': id, 'tabKey': tabKey, 'locale': locale},
    );
    return entity;
  }
}
