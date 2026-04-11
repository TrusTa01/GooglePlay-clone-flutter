import 'package:google_play/features/sections/domain/entities/section_entity.dart';

sealed class TabSectionsEntity {
  final String tabId;
  final List<SectionEntity> sections;

  const TabSectionsEntity({required this.tabId, required this.sections});
}

// Обычная вкладка (игры, приложения, книги)
final class StandartTabEntity extends TabSectionsEntity {
  const StandartTabEntity({required super.tabId, required super.sections});
}

// Вкладка ля детей
final class KidsTabEntity extends TabSectionsEntity {
  final int? selectedAge;

  const KidsTabEntity({
    required super.tabId,
    required super.sections,
    this.selectedAge,
  });
}
