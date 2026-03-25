import 'package:google_play/features/sections/domain/usecases/resolve_section_usecase.dart';
import 'package:google_play/features/banners/domain/entities/simple_banner_entity.dart';

// Формирует доменную модель event-экрана из уже загруженных данных
class BuildEventScreenUseCase {
  const BuildEventScreenUseCase();

  EventScreenData call({
    required SimpleBannerEntity banner,
    required List<ResolvedSection> sections,
  }) {
    final sanitizedSections = sections
        .where((section) => section.items.isNotEmpty)
        .toList(growable: false);
    return EventScreenData(banner: banner, sections: sanitizedSections);
  }
}

class EventScreenData {
  final SimpleBannerEntity banner;
  final List<ResolvedSection> sections;

  const EventScreenData({required this.banner, required this.sections});
}
