import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/tabs/data/models/network/tabs_dto.dart';
import 'package:google_play/features/tabs/domain/entities/tabs_entity.dart';

extension TabsDtoMapper on TabsDto {
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
      'tabs.tabs_mapper',
      'TabsDto -> TabsEntity',
      context: {'id': id, 'tabKey': tabKey, 'locale': locale},
    );
    return entity;
  }
}
