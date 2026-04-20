import 'package:google_play/features/category/presentation/viewmodels/category_overview_state.dart';
import 'package:google_play/features/section_more/presentation/viewmodels/section_more_state.dart';

// Преобразует обзор категории в состояние экрана 'Смотреть всё' с учётом заголовка из навигации
final class BuildSectionMoreStateUseCase {
  const BuildSectionMoreStateUseCase();

  SectionMoreState call({
    required CategoryOverviewState overview,
    required String barTitle,
  }) {
    final resolvedTitle = barTitle.trim().isNotEmpty
        ? barTitle
        : overview.title;

    return SectionMoreState(
      title: resolvedTitle,
      categoryKey: overview.categoryKey,
      isEmpty: overview.isEmpty,
      isGame: overview.isGame,
      previewModel: overview.previewModel,
      items: overview.items,
    );
  }
}
