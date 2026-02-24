import 'package:google_play/domain/entities/sections/tab_config_entity.dart';

sealed class TabConfigEntity {
  final String tabKey;
  final String displayName;
  final List<SectionEntity> sections;

  const TabConfigEntity({
    required this.tabKey,
    required this.displayName,
    required this.sections,
  });
}

// Обычная вкладка (игры, приложения, книги)
final class StandartTabEntity extends TabConfigEntity {
  StandartTabEntity({
    required super.tabKey,
    required super.displayName,
    required super.sections,
  });
}

// Вкладка ля детей
final class KidsTabEntity extends TabConfigEntity {
  final int? selectedAge;

  KidsTabEntity({
    required super.tabKey,
    required super.displayName,
    required super.sections,
    this.selectedAge,
  });
}
