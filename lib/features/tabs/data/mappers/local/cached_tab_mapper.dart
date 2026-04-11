import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/tabs/domain/entities/tab_entity.dart';

extension CachedTabMapper on CachedTab {
  TabsEntity toEntity(String locale) {
    return TabsEntity(
      id: id,
      contentType: contentType,
      tabKey: tabKey,
      label: label.display(locale),
      tabType: tabType,
      sortOrder: sortOrder,
    );
  }
}
