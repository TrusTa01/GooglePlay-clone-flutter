import 'package:google_play/domain/entities/sections/section_entity.dart';

abstract interface class IConfigRepository {
  Future<TabConfigEntity> getTabConfig({
    required String folder,
    required String tabKey,
  });

  /// Список доступных табов для конкретного типа стора.
  ///
  /// Ожидает ключи вида `availableGamesTabs`, `availableAppsTabs`,
  /// `availableBooksTabs` и т.п. (см. assets/config/shared/index.json).
  Future<List<String>> getAvaibleTabs(String indexKey);
}
